# General Repository Rules & Guidelines

This document provides general rules, structure, and workflows for working with code and files in this repository.

## Repository Purpose

Personal knowledge base and publication workspace for a Computer Engineering student. Contains four interleaved document types: Obsidian personal notes, Notion drafts (accessed via MCP), technical reports and conference papers, and project webpages. All content covers coursework (linear algebra, calculus) and research in robotics and human motion generation.

## Directory Map

```
Notebook/
├── CE1A/                           # 1A term coursework
│   ├── MATH115 - Linear Algebra/   # Obsidian notes + drawings + media
│   └── MATH117 - Calculus 1/       # Obsidian notes + drawings + media
├── CE1B/                           # 1B term coursework
│   ├── ECE106 - Eletricity and Magnetism/  # rnote notes + tutorials
│   ├── ECE108 - Discrete Math & Logic 1/   # Obsidian notes + drawings + media
│   ├── ECE124 - Digital Circuits & Systems/ # Obsidian notes + drawings + media
│   ├── ECE140 - Linear Circuits/           # rnote notes + Obsidian + tutorials
│   └── MATH119 - Calculus 2 for Engineering/ # rnote notes + Obsidian + tutorials
├── Motion Diffusion Model Basics/  # Research notes, drawings, media
│   ├── drawings/                   # Excalidraw .md files
│   ├── media/                      # PNG/SVG figures
│   └── Reports/                    # Typst weekly reports + LaTeX papers
│       ├── WeeklyReports/WeekN/    # Typst internal reports
│       ├── 3DVSubmission/          # LaTeX conference paper (CVPR style)
│       ├── ICRASubmission/         # LaTeX conference paper (IEEE style)
│       └── docs/                   # latex/ and typst/ reference docs
├── Robotics Force Project/         # Robotics research notes + drawings
│   ├── drawings/                   # Excalidraw .md files
│   ├── media/                      # PNG figures
│   └── Paper/                      # LaTeX paper (IEEE IEEEtran)
├── WebPage/                        # Static research project sites
│   └── Aging-Motion-Project/       # Nerfies-template site (Bulma + jQuery)
└── AI Prompt for Hand-Written Note Conversion.md  # Obsidian format spec
```

## Document Types and Skills Overview

The workspace contains five custom skills defined under `.agents/skills/`:
- **`obsidian-note`**: Rules for converting drafts into Obsidian notes.
- **`technical-report`**: Rules for compiling Typst reports and LaTeX papers.
- **`project-webpage`**: Conventions for project webpages under `WebPage/`.
- **`schemdraw`**: Circuit diagram generation via SchemDraw.
- **`embed-image`**: Background removal and image cropping for notes.

### Notion Documents (Drafts)

Access via the Notion MCP tools. Notion is used for drafting; finished content is converted to one of the output types using the relevant skill.

### JupyMD Notebooks

Obsidian's JupyMD plugin executes ```` ```python ```` code blocks as Jupyter cells. The runtime is the **Flatpak's bundled Python 3.13** (not the system Python), with its venv at `.jupymd/lib/python3.13/site-packages/`. To install packages into this environment use:

```bash
python3.13 -m pip install --target="/path/to/Notebook/.jupymd/lib/python3.13/site-packages" <package>
```

Required packages (already installed): `torch` (CPU), `numpy`, `matplotlib`, `schemdraw`.

Plot notebooks use `%matplotlib inline` so figures render inside the notebook and are also saved as SVGs to the note's `media/` folder. SchemDraw notebooks use `schemdraw.use('svg')` for inline SVG output. Working directory is set to the notebook's own folder, so `Path("media")` always resolves correctly.

## Conversion Workflow

When asked to convert a draft (Notion page, hand-written scan, or raw text):

1. Fix minor grammar and sentence structure errors; keep the author's tone.
2. Complete half-finished sentences automatically using surrounding context.
3. Do **not** add new technical claims or opinions.
4. Insert visuals: search `<topic>/media/` and `<topic>/drawings/` for relevant assets. For missing visuals, insert an `<img>` placeholder with a descriptive `alt` text (Obsidian notes) or a `\includegraphics` comment (LaTeX).
5. Use the appropriate skill command for the target format.

## Excalidraw Drawings

Drawings are stored as Obsidian markdown files in `drawings/` subdirectories (e.g., `Motion Diffusion Model Basics/drawings/1.1 - Tensors.md`). They contain raw Excalidraw JSON — do not edit the data section. Embed in notes with `![[DrawingName.md]]`. New drawings suggested by an agent should be described in a placeholder comment; the user creates them manually in Obsidian.

**Mermaid → Excalidraw (one-shot):** Flowcharts and process diagrams can be converted directly from Mermaid to Excalidraw using https://github.com/excalidraw/mermaid-to-excalidraw. When a note needs a flow diagram, output a `mermaid` code block and insert a `<!-- TODO: Convert the Mermaid to Excalidraw and embed as ![[Drawing Name|100%]] -->` placeholder in the note. The user converts and saves to `drawings/`, then replaces the placeholder with `![[Drawing Name|100%]]`. Keep Mermaid simple (`flowchart LR/TD`) for best converter compatibility.

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
