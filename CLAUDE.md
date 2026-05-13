# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Purpose

Personal knowledge base and publication workspace for a Computer Engineering student. Contains four interleaved document types: Obsidian personal notes, Notion drafts (accessed via MCP), technical reports and conference papers, and project webpages. All content covers coursework (linear algebra, calculus) and research in robotics and human motion generation.

## Directory Map

```
Notebook/
├── CE1A/                           # 1A term coursework
│   ├── MATH115 - Linear Algebra/   # Obsidian notes + drawings + media
│   └── MATH117 - Calculus 1/       # Obsidian notes + drawings + media
├── CE1B/                           # 1B term coursework
│   ├── ECE108 - Discrete Math & Logic 1/   # Obsidian notes + drawings + media
│   └── ECE124 - Digital Circuits & Systems/ # Obsidian notes + drawings + media
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

## Document Types and Conversion Skills

Skills are defined in `.claude/commands/` — invoke with `/obsidian-note`, `/technical-report`, `/project-webpage`, `/schemdraw`, or `/embed-image`.

### Obsidian Notes (`/obsidian-note`)

The full format spec is self-contained in `.claude/commands/obsidian-note.md`. Key rules:

- Sections open with a callout header (`[!abstract]`, `[!quote]`, `[!fact]`, `[!info]`, `[!hint]`, `[!example]`). Callouts are for section titles only — never wrap body content in callouts.
- Every math symbol in LaTeX. Systems of equations: `\begin{cases}`. Multi-line derivations: `\begin{aligned}`. Never use `\left{` `\right}`.
- Inline terminology: `<u><strong style="color:#dab1da">term</strong></u>`. Major terms: `#### <u>Term</u>`.
- Collapsible example solutions: `> [!success]- Solution (Click to expand)`.
- Excalidraw drawings embedded as `![[DrawingName|100%]]`; regular images as `<img src="name.png" alt="…" width="50%">`.
- No multi-column layouts.

### Technical Reports and Papers (`/technical-report`)

Full spec in `Motion Diffusion Model Basics/Reports/AGENTS.md`.

- **Typst** for internal reports (flexible formatting). Canonical template: `Reports/WeeklyReports/Week2/week2 report.typ`.
  - Build: `typst compile "<file>.typ"` (run from within the week's folder).
- **LaTeX** for conference/journal submissions. Template is law — never modify `.sty`/`.cls` files.
  - Build: `latexmk -pdf main.tex` / clean: `latexmk -c`.
  - `Robotics Force Project/Paper/` uses IEEE IEEEtran; `Reports/3DVSubmission/` uses CVPR style.
- Local LaTeX docs: `Reports/docs/latex/src/` (lshort handbook). Typst docs: `Reports/docs/typst/`.
- Each sentence on its own line (semantic line breaking for clean diffs). No fixed column wrapping.

### Project Webpages (`/project-webpage`)

Full spec in `WebPage/Aging-Motion-Project/AGENTS.md`. Reference design: `WebPage/Aging-Motion-Project/index.html`.

- Stack: HTML5 + Bulma CSS + jQuery. 2-space indent, semantic HTML tags, kebab-case filenames and CSS classes.
- Preview locally: `python3 -m http.server 8000`.
- GitHub Actions (`.github/workflows/deploy-static-page.yml`) auto-deploys the entire `WebPage/` directory to GitHub Pages on push to `main`.

### Notion Documents (Drafts)

Access via the Notion MCP tools (`mcp__claude_ai_Notion__*`). Notion is used for drafting; finished content is converted to one of the three output types above using the relevant skill.

### Circuit Diagrams (`/schemdraw`)

Generates SVG circuit diagrams via SchemDraw for ECE124, ECE140, or any circuit/logic course. Write a Python script, run it through `uv` in `Python Image Processor/`, and embed the SVG directly in the note. Covers analog passives, sources, logic gates, flip-flops, transistors, and opamps.

### Image Processing (`/embed-image`)

**Only invoke when explicitly asked** — not all images need processing.

Script: `Python Image Processor/process.py`, run via `uv` from inside that directory. Auto-detects background type: already-transparent SVGs (autocrop only); light/white backgrounds (photographed notes) use a grayscale threshold to produce clean black-on-transparent line art; complex backgrounds use `rembg` AI removal. Outputs PNG to the target note's `media/` folder and prints ready-to-paste `<img>` tags. The rembg model (~170 MB) is cached in `~/.cache/rembg/` and is not tracked by git.

## Conversion Workflow

When asked to convert a draft (Notion page, hand-written scan, or raw text):

1. Fix minor grammar and sentence structure errors; keep the author's tone.
2. Complete half-finished sentences automatically using surrounding context.
3. Do **not** add new technical claims or opinions.
4. Insert visuals: search `<topic>/media/` and `<topic>/drawings/` for relevant assets. For missing visuals, insert an `<img>` placeholder with a descriptive `alt` text (Obsidian notes) or a `\includegraphics` comment (LaTeX).
5. Use the appropriate skill command for the target format.

## Excalidraw Drawings

Drawings are stored as Obsidian markdown files in `drawings/` subdirectories (e.g., `Motion Diffusion Model Basics/drawings/1.1 - Tensors.md`). They contain raw Excalidraw JSON — do not edit the data section. Embed in notes with `![[DrawingName.md]]`. New drawings suggested by an agent should be described in a placeholder comment; the user creates them manually in Obsidian.

## Notion MCP

Use `mcp__claude_ai_Notion__notion-fetch` to retrieve a page by URL or ID, and `mcp__claude_ai_Notion__notion-search` to locate pages by title. Authenticate first if needed (`mcp__claude_ai_Notion__notion-create-*` tools require auth).
