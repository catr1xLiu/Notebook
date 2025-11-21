from PIL import Image
from colorsys import rgb_to_hls, hls_to_rgb
from collections import Counter

def process_image(image:Image.Image, invert_brightness:bool, remove_pixel_brightness_threshold:float) -> Image.Image:
    pixels = list(image.getdata())

    # Step 1: Detect the most frequent color (background color)
    # Normalize pixels to RGB tuples for counting
    rgb_pixels = []
    for pixel in pixels:
        if len(pixel) == 4:
            r, g, b, _ = pixel
        elif len(pixel) == 3:
            r, g, b = pixel
        else:
            r = g = b = pixel
        rgb_pixels.append((r, g, b))

    # Find the most common color
    color_counts = Counter(rgb_pixels)
    background_color = color_counts.most_common(1)[0][0]
    bg_r, bg_g, bg_b = background_color

    new_pixels = []
    for pixel in pixels:
        r, g, b, a = 1.0, 1.0, 1.0, 1.0
        if len(pixel) == 4:
            r, g, b, a = pixel
        elif len(pixel) == 3:
            r, g, b = pixel
        else:
            r = g = b = pixel

        # Check if pixel is within threshold of background color
        color_distance = ((r - bg_r) ** 2 + (g - bg_g) ** 2 + (b - bg_b) ** 2) ** 0.5
        max_distance = (255 ** 2 * 3) ** 0.5  # Maximum possible distance
        normalized_distance = color_distance / max_distance

        is_background = normalized_distance < remove_pixel_brightness_threshold

        "Step1: Convert to hls color for easier processing"
        h, l, s = rgb_to_hls(r/255.0, g/255.0, b/255.0)

        "Step2: Revert brightness (if required)"
        if invert_brightness:
            l = 1.0 - l

        "Step3: Convert hls back to rgb"
        r, g, b = hls_to_rgb(h, l, s)

        "Step4: Make Pixel transparent if it's within threshold of background color"
        if is_background:
            a = 0

        new_pixels.append((int(r*255),int(g*255),int(b*255), int(a*255)))
    new_image = Image.new("RGBA", image.size)
    new_image.putdata(new_pixels)
    return new_image


if __name__ == '__main__':
    print("Running Test!")

