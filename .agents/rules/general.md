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

## Document Types

1. **Obsidian Notes**: Notes written for myself, designed for easy review, where the language is direct and intuitive. Detailed formatting guidelines (including Excalidraw embeddings and JupyMD notebooks) are located in the `obsidian-note` skill (`.agents/skills/obsidian_note/SKILL.md`).
2. **Project Webpages**: Static research project sites. See the `project-webpage` skill (`.agents/skills/project_webpage/SKILL.md`) for conventions and guidelines.
3. **Notion Drafts**: Notion is used for drafting new content before conversion. Access via the Notion MCP tools.
4. **rnote Notes**: Treated as a read-only document type for handwritten notes and tutorials. See the `read-rnote` skill (`.agents/skills/rnote/SKILL.md`) for instructions on locating, exporting, and reading these files.
5. **PDFs**: Read-only source material (papers, textbooks, lab manuals, datasheets, slides). **Never open a PDF with the Read tool** — it is token-expensive and loses equations, tables, and structure. Always convert first via the `pdf` skill (`.agents/skills/pdf/SKILL.md`), then read the resulting markdown.

## Conversion Workflow

When asked to convert a draft (Notion page, hand-written scan, or raw text) to any document type:

1. Fix minor grammar, spelling, and sentence structure errors; keep the author's tone and level of technical detail.
2. Complete half-finished sentences automatically using surrounding context (e.g., add "why" between computation steps).
3. Do **not** add new technical claims or opinions, and do not simplify or over-explain. All examples, exercises, theorems, definitions, and key formulas must be kept exactly as written.
4. If the source material is NOT a note (e.g., lecture slides, external tutorials), you must confirm the note structure with the user before writing a single line. Outline the title and content of each sub-section, where to use callouts and where to add drawings, then await user refinement.
5. Insert visuals: search `<topic>/media/` and `<topic>/drawings/` for relevant assets. For missing visuals, insert a placeholder comment or image tag.
6. Use the appropriate formatting skill for the target document type.

## Other Skills

These are useful skills for agents outside of the document converting field:
- **`pdf`**: The **only** approved way to read a PDF — page-count inspection, `qpdf` cutting, and `marker_single` conversion to markdown, including table-of-contents recon for long documents (`.agents/skills/pdf/SKILL.md`). Never use the Read tool on a `.pdf`.
- **`schemdraw`**: Circuit diagram generation via SchemDraw (`.agents/skills/schemdraw/SKILL.md`).
- **`comsol`**: Guidelines for retrieving COMSOL Multiphysics API documentation from the split reference files (`.agents/skills/comsol/SKILL.md`).
- **`embed-image`**: Background removal and image cropping for notes (`.agents/skills/embed_image/SKILL.md`).
- **`literature-review`**: End-to-end workflow for turning an arXiv paper into a dense Obsidian review note — download, PDF conversion (via the `pdf` skill), figure post-processing, and writing guidelines (`.agents/skills/literature_review/SKILL.md`).
