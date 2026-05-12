#!/usr/bin/env python3
"""
Smart image processor for Obsidian notebook embedding.
Removes backgrounds and prints ready-to-paste <img> embed tags.

Usage:
    uv run process.py IMAGE [IMAGE ...] --output-dir DIR [--force-rembg] [--width 50%]

Accepts: .svg (RNote exports), .png, .jpg, .jpeg
Auto-detection:
    Light/white background (photographed notes / SVG canvas) → grayscale threshold → black-on-transparent
    Complex background                                        → rembg AI removal
    --force-rembg                                             → always use AI removal
"""

import argparse
import io
import sys
from pathlib import Path
from collections import Counter
from colorsys import rgb_to_hls

from PIL import Image


def load_image(path: Path) -> Image.Image:
    """Load any supported format; rasterize SVG via cairosvg at 150 DPI."""
    if path.suffix.lower() == ".svg":
        try:
            import cairosvg
        except ImportError:
            print("ERROR: cairosvg not installed. Run: uv sync", file=sys.stderr)
            sys.exit(1)
        png_bytes = cairosvg.svg2png(url=str(path), dpi=150)
        return Image.open(io.BytesIO(png_bytes))
    return Image.open(path)


def background_type(image: Image.Image) -> str:
    """
    Returns 'transparent', 'light', or 'complex'.
    - transparent: SVG/image already has a clear background — no removal needed
    - light: white/paper background — use grayscale threshold
    - complex: coloured/photo background — use rembg
    """
    rgba = image.convert("RGBA")
    pixels = list(rgba.get_flattened_data() if hasattr(rgba, "get_flattened_data") else rgba.getdata())
    total = len(pixels)
    transparent = sum(1 for _, _, _, a in pixels if a < 10)
    if transparent / total > 0.3:
        return "transparent"
    rgb = image.convert("RGB")
    pixel_data = list(rgb.get_flattened_data() if hasattr(rgb, "get_flattened_data") else rgb.getdata())
    most_common = Counter(pixel_data).most_common(1)[0][0]
    r, g, b = most_common
    _, l, _ = rgb_to_hls(r / 255.0, g / 255.0, b / 255.0)
    return "light" if l >= 0.80 else "complex"


def process_light_background(image: Image.Image) -> Image.Image:
    """
    White/paper background: dark strokes become opaque black, light areas transparent.
    Produces clean line art suitable for both light and dark Obsidian themes.
    """
    gray = image.convert("L")
    # Invert so that dark strokes (low gray value) → high alpha, white bg → alpha 0
    inverted = gray.point(lambda x: 255 - x)
    result = Image.new("RGBA", image.size, (0, 0, 0, 0))
    result.putalpha(inverted)
    return result


def process_complex_background(image: Image.Image) -> Image.Image:
    """AI background removal via rembg (onnxruntime, downloads ~170MB model on first run)."""
    try:
        from rembg import remove
    except ImportError:
        print("ERROR: rembg not installed. Run: uv add rembg", file=sys.stderr)
        sys.exit(1)
    return remove(image)


def autocrop(image: Image.Image, padding: int = 8) -> Image.Image:
    """Trim transparent borders and add a small padding."""
    bbox = image.getbbox()
    if bbox is None:
        return image
    left  = max(0, bbox[0] - padding)
    top   = max(0, bbox[1] - padding)
    right = min(image.width,  bbox[2] + padding)
    bottom = min(image.height, bbox[3] + padding)
    return image.crop((left, top, right, bottom))


def process_one(path: Path, output_dir: Path, force_rembg: bool, width: str) -> str:
    img = load_image(path)

    bg = background_type(img)

    if force_rembg or bg == "complex":
        print(f"  {path.name}: complex background → rembg", file=sys.stderr)
        result = process_complex_background(img)
    elif bg == "transparent":
        print(f"  {path.name}: already transparent → autocrop only", file=sys.stderr)
        result = img.convert("RGBA")
    else:
        print(f"  {path.name}: light background → threshold", file=sys.stderr)
        result = process_light_background(img)

    result = autocrop(result)

    out_name = path.stem + ".png"
    output_dir.mkdir(parents=True, exist_ok=True)
    result.save(output_dir / out_name, "PNG")
    print(f"  Saved → {output_dir / out_name}", file=sys.stderr)

    return f'<img src="{out_name}" alt="{path.stem}" width="{width}">'


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument("images", nargs="+", help="Input image path(s); globs accepted")
    parser.add_argument("--output-dir", required=True,
                        help="Destination media/ folder, e.g. 'MATH115 - Linear Algebra/media/'")
    parser.add_argument("--force-rembg", action="store_true",
                        help="Skip auto-detection and always use AI removal")
    parser.add_argument("--width", default="50%",
                        help="<img> width attribute (default: 50%%)")
    args = parser.parse_args()

    output_dir = Path(args.output_dir)
    tags = []

    for pattern in args.images:
        if "*" in pattern or "?" in pattern:
            paths = sorted(Path(".").glob(pattern))
        else:
            paths = [Path(pattern)]

        if not paths:
            print(f"Warning: no files matched '{pattern}'", file=sys.stderr)
            continue

        for p in paths:
            tags.append(process_one(p, output_dir, args.force_rembg, args.width))

    print("\n=== Embed tags — paste into note ===")
    for tag in tags:
        print(tag)


if __name__ == "__main__":
    main()
