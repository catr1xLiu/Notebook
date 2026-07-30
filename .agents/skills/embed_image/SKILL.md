---
name: embed-image
description: Process and embed images into Obsidian Notes using Python Image Processor.
---

# Skill: Process and Embed Images into Obsidian Notes

**Only use this skill when explicitly asked to process or embed an image.** Not every image in the repo needs background removal — use it on demand.

## When to use

- User provides a raw photo of a hand-written note, diagram, or textbook figure
- User asks to clean up or embed an image into a specific Obsidian note

## Steps

1. **Identify the target note** to determine the correct `media/` folder.
   Example: if the note is in `MATH115 - Linear Algebra/`, the output goes to `MATH115 - Linear Algebra/media/`.

2. **Run the processing script.** `Python Image Processor/` has no venv of its own — the
   dependencies live in the vault-root `uv` project, so point `--project` at the repo root:

   ```bash
   cd "Python Image Processor" && uv run --project /home/catr1x/Coding/Notebook process.py \
     "/absolute/path/to/input.jpg" \
     --output-dir "../TOPIC/media/" \
     --width "50%"
   ```

   - Use `--force-rembg` if the auto-detected result looks wrong (agent can view the output PNG)
   - Use `--width "80%"` for wide diagrams, `"30%"` for small ones
   - `--threshold 0.0–0.3` (default `0.15`) widens/narrows what counts as background;
     `--invert` flips brightness for dark-mode scans
   - Multiple images: list them all before `--output-dir`. Let **the shell** expand globs
     (`"$M"/fig*.png`) — the script's own glob branch resolves patterns against the current
     working directory, not against the paths you passed.

3. **Cleaning images in place** (already-embedded figures that need their background keyed):
   pass the media folder as its own `--output-dir`. Output is always named `<stem>.png`, so
   this overwrites the originals — fine when they are committed and recoverable via
   `git checkout --`, but check that first. Note `autocrop` trims the transparent margin, so
   dimensions shrink a little; existing `width="…%"` attributes in the note stay valid and
   should be left alone rather than replaced with the script's printed tags.

4. **Copy the printed embed tag(s)** into the note at the appropriate location:
   ```
   <img src="filename.png" alt="filename" width="50%">
   ```

## Auto-detection logic

`analyze_background` samples the pixels and picks one of three paths:

- **Already transparent** (under 15 % of sampled pixels opaque) → autocrop only
- **Solid background** (one dominant colour covers ≥ 15 % of the opaque pixels within
  `--threshold`) → colour-distance keying. Only pixels near that colour go transparent;
  every other pixel keeps its original colour, so coloured traces, black axes, and text
  survive. This is the path scanned paper figures and vector-style diagrams take.
- **Complex background** (no dominant colour — a photo) → rembg AI model

The solid/complex test looks only at opaque pixels, so a figure with transparent margins
but a white plot background is still keyed correctly.

## Dependencies

Managed via `uv` in the **vault-root** `pyproject.toml` / `uv.lock` — the old
`Python Image Processor/.venv` and its pyproject were removed (commit `caab498`). Always
invoke with `uv run --project /home/catr1x/Coding/Notebook`.

Pillow, which is all the transparent and solid-background paths need, is present
transitively (via matplotlib). **`rembg` and `cairosvg` are not installed**, so the
complex-background path, `--force-rembg`, and `.svg` inputs currently fail with a
`ModuleNotFoundError` and an instruction to sync. Add them when a task actually needs them:

```bash
cd /home/catr1x/Coding/Notebook && uv add --group imaging rembg cairosvg
```

That pulls onnxruntime (a few hundred MB); the ~170 MB rembg model then downloads on first
use and is cached in `~/.cache/rembg/`.
