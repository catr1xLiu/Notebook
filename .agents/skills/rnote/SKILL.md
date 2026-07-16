---
name: read-rnote
description: Guidelines for locating, exporting, and viewing .rnote handwritten notes and tutorials.
---

# Skill: Reading .rnote Files

## Locating and Viewing `.rnote` Files

Each course directory under `CE1B/` contains an `index.md` with keyword-rich descriptions of every note file's contents (specific topics, formulas, problem types, and worked examples). To find which rnote file covers a given topic:

1. **Keyword search** the index files: `grep -ri "keyword" CE1B/*/index.md`. The index entries are designed to match specific concepts (e.g. "Thévenin", "Lagrange multipliers", "Shannon expansion", "spherical capacitor") and point to the exact file and problem number.
2. **Export the rnote file** to SVG once located:

```bash
flatpak run --command=rnote-cli com.github.flxzt.rnote export doc --output-file /tmp/output.svg --on-conflict overwrite input.rnote
```

Supported output formats: `.svg`, `.pdf`, `.xopp` (`.png` is **not** supported by rnote-cli despite being listed).

3. **Convert SVG to PNG before reading.** Exported SVGs are multi-MB files that exceed the Read tool's size limit. Convert with `rsvg-convert`:

```bash
rsvg-convert /tmp/output.svg -o /tmp/output.png
```

The resulting PNG can be read as an image by the Read tool.

**Flatpak sandbox limitation:** The rnote Flatpak only has filesystem access to `xdg-documents`, `xdg-pictures`, and `xdg-desktop`. Files outside these directories (e.g. under `~/Coding/`) must be copied to `~/Documents/` before export. Alternatively, grant broader access: `flatpak override --user --filesystem=home com.github.flxzt.rnote`.

**Flatpak /tmp/ redirect:** The Flatpak sandbox maps `/tmp/` to `/run/user/1000/.flatpak/com.github.flxzt.rnote/tmp/` on the host. Exported files appear there, not at `/tmp/`.
