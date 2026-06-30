#!/usr/bin/env python3
"""
Smart image processor for Obsidian notebook embedding.
Removes backgrounds and prints ready-to-paste <img> embed tags.

Usage:
    uv run process.py IMAGE [IMAGE ...] --output-dir DIR [--threshold 0.15] [--invert] [--force-rembg] [--width 50%]

Accepts: .svg (RNote exports), .png, .jpg, .jpeg
Auto-detection:
    Already transparent                       → autocrop only
    Solid background (white paper, flat fill)  → colour-distance keying (preserves colours, lines, text)
    Complex/photo background                   → rembg AI removal
    --force-rembg                              → always use AI removal

Background removal uses the same colour-distance keying as the Streamlit app
(`image_processing.process_image`): the dominant colour is detected and only
pixels within `--threshold` of it are made transparent. Every other pixel keeps
its original colour, so coloured figures, black axes, and text survive intact.
"""

import argparse
import io
import sys
from pathlib import Path
from collections import Counter

from PIL import Image

from image_processing import process_image

# Largest possible Euclidean distance in RGB space, for normalising distances.
_MAX_RGB_DISTANCE = (255 ** 2 * 3) ** 0.5


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


def analyze_background(image: Image.Image, threshold: float) -> str:
    """
    Classify the background as 'transparent', 'solid', or 'complex'.

    - transparent: the image is almost entirely transparent already → nothing to do
    - solid: among the opaque pixels, one dominant colour covers a meaningful share
      within `threshold` (white paper, flat canvas fill) → colour-distance keying works
    - complex: opaque pixels have no dominant colour (a photo) → fall back to rembg

    The solid/complex decision looks only at opaque pixels, so a figure with
    transparent margins but a white plot background is still keyed correctly.
    Pixels are sampled (not all read) so this stays fast on large rasters.
    """
    rgba = image.convert("RGBA")
    pixels = list(rgba.get_flattened_data() if hasattr(rgba, "get_flattened_data") else rgba.getdata())
    step = max(1, len(pixels) // 50_000)
    sample = pixels[::step]

    opaque = [(r, g, b) for r, g, b, a in sample if a >= 10]
    if len(opaque) / len(sample) < 0.15:
        return "transparent"

    bg_r, bg_g, bg_b = Counter(opaque).most_common(1)[0][0]
    near = sum(
        1
        for r, g, b in opaque
        if ((r - bg_r) ** 2 + (g - bg_g) ** 2 + (b - bg_b) ** 2) ** 0.5 / _MAX_RGB_DISTANCE < threshold
    )
    return "solid" if near / len(opaque) >= 0.15 else "complex"


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


def process_one(path: Path, output_dir: Path, force_rembg: bool, width: str,
                threshold: float, invert: bool) -> str:
    img = load_image(path)

    bg = "complex" if force_rembg else analyze_background(img, threshold)

    if bg == "complex":
        print(f"  {path.name}: complex background → rembg", file=sys.stderr)
        result = process_complex_background(img)
    elif bg == "transparent":
        print(f"  {path.name}: already transparent → autocrop only", file=sys.stderr)
        result = img.convert("RGBA")
    else:
        print(f"  {path.name}: solid background → colour-key (threshold {threshold})", file=sys.stderr)
        result = process_image(img, invert, threshold)

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
    parser.add_argument("--threshold", type=float, default=0.15,
                        help="Colour-distance threshold for background keying, 0.0-0.3 (default: 0.15)")
    parser.add_argument("--invert", action="store_true",
                        help="Invert brightness (e.g. dark-mode scans → light strokes)")
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
            tags.append(process_one(p, output_dir, args.force_rembg, args.width,
                                    args.threshold, args.invert))

    print("\n=== Embed tags — paste into note ===")
    for tag in tags:
        print(tag)


if __name__ == "__main__":
    main()
