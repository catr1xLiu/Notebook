from PIL import Image
from colorsys import rgb_to_hls, hls_to_rgb

def process_image(image:Image.Image, invert_brightness:bool, remove_pixel_brightness_threshold:float) -> Image.Image:
    pixels = list(image.getdata())

    new_pixels = []
    for pixel in pixels:
        r, g, b, a = 1.0, 1.0, 1.0, 1.0
        if len(pixel) == 4:
            r, g, b, a = pixel
        elif len(pixel) == 3:
            r, g, b = pixel
        else:
            r = g = b = pixel 

        "Step1: Convert to hls color for easier processing"
        h, l, s = rgb_to_hls(r/255.0, g/255.0, b/255.0)

        "Step2: Revert brightness (if required)"
        if invert_brightness:
            l = 1.0 - l

        "Step3: Convert hls back to rgb"
        r, g, b = hls_to_rgb(h, l, s)

        "Step4: Make Pixel transparent if lightness is below threshold"
        if l < remove_pixel_brightness_threshold:
            a = 0

        new_pixels.append((int(r*255),int(g*255),int(b*255), int(a*255)))
    new_image = Image.new("RGBA", image.size)
    new_image.putdata(new_pixels)
    return new_image


if __name__ == '__main__':
    print("Running Test!")

