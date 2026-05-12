# Skill: Process and Embed Images into Obsidian Notes

**Only use this skill when explicitly asked to process or embed an image.** Not every image in the repo needs background removal — use it on demand.

## When to use

- User provides a raw photo of a hand-written note, diagram, or textbook figure
- User asks to clean up or embed an image into a specific Obsidian note

## Steps

1. **Identify the target note** to determine the correct `media/` folder.
   Example: if the note is in `MATH115 - Linear Algebra/`, the output goes to `MATH115 - Linear Algebra/media/`.

2. **Run the processing script** from the repo root:

   ```bash
   cd "Python Image Processor" && uv run process.py \
     "/absolute/path/to/input.jpg" \
     --output-dir "../TOPIC/media/" \
     --width "50%"
   ```

   - Use `--force-rembg` if the auto-detected result looks wrong (agent can view the output PNG)
   - Use `--width "80%"` for wide diagrams, `"30%"` for small ones
   - Multiple images: list them all before `--output-dir`

3. **Copy the printed embed tag(s)** into the note at the appropriate location:
   ```
   <img src="filename.png" alt="filename" width="50%">
   ```

## Auto-detection logic

The script detects the dominant background color:
- **Light background** (lightness > 0.80): photographed notes on white/beige paper → grayscale threshold → produces clean black-on-transparent line art
- **Complex background** (lightness ≤ 0.80): photos of objects, diagrams on colored paper → rembg AI model (~170 MB, cached in `~/.cache/rembg/` after first run)

## Dependencies

Managed via `uv` in `Python Image Processor/pyproject.toml`. Run `uv sync` inside `Python Image Processor/` if packages are missing. The rembg model downloads automatically on first use.
