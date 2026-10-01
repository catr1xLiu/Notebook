---
name: technical-report
description: Convert or format drafts into weekly reports (Typst) or conference papers (LaTeX). Bundles Typst docs, a LaTeX handbook, and LaTeX templates (lab report, preprint, technical report, proposal).
---

# Skill: Convert Draft to Technical Report / Paper

Convert or format a draft into a polished technical report (Typst) or conference/journal paper (LaTeX).

**Role**: you are a formatting and grammar assistant.
Fix spelling, grammar, and word choice, and complete half-finished sentences using context.
Do **not** add opinions, new ideas, interpretations, or technical claims.
Preserve the author's meaning, tone, and technical content exactly.

## Mandatory steps

1. **Identify the output format**:
   - **Typst** — internal weekly reports and flexible reports. Layout is free; see [Typst rules](#typst-rules).
   - **LaTeX, for a venue** — conference/journal submissions. Start from the official author kit (CVPR `cvpr.sty`, NeurIPS `neurips_*.sty`, IEEE `IEEEtran.cls`). The template is law; see [LaTeX rules](#latex-rules).
   - **LaTeX, no venue** — internal technical reports, lab reports, proposals. Copy a template from [`assets/`](#bundled-templates).
2. **Grammar and style**: apply the role above.
3. **Line breaking**: no fixed-width wrapping. Each sentence (or numbered list item) on its own line for clean diffs.
4. **Figures**: run `ls -l figures/` (or the relevant figures directory) before referencing any file. Use vector graphics (`.pdf`, `.svg`) when available.
5. **Check `sec.back/`** (if it exists) before editing any section file — it holds backup versions.
6. **Build and verify** — see [Build](#build). Fix every error before reporting done.

## Typst rules

- Match the style of `Motion Diffusion Model Basics/Reports/WeeklyReports/Week2/week2 report.typ`: one `.typ` file plus local images per week folder.
- Tone: professional and concise ("foundational study", "analysis", "proposed method"). Paragraphs of 3–6 lines, clear section hierarchy.
- Headings: `#set heading(numbering: "1.")`. Identifiers: kebab-case (`chapter-title`).
- Images: `#image("drawing.svg", width: 12cm)`. Quote paths with spaces: `#image("Drawing 1.16.svg")`.

## LaTeX rules

1. **The template beats the handbook.** If the template uses `\paragraph{}`, use it even where `references/latex/` suggests `\subsubsection{}`. If it defines custom commands (`\figref{}` instead of `\ref{}`), use them.
2. **Read the template's comments** — they carry the submission rules and any forbidden-package list.
3. **Never modify** `*.sty`, `*.cls`, or `*.bst` files.
4. Respect review-mode requirements: line numbers (`lineno`), anonymization for blind review (no author names), and page limits without `\vspace` hacks.

Standard paper layout:

```
<ConferenceName>/
├── main.tex          # uses the template
├── preamble.tex      # extra packages, only if the template allows
├── sec/*.tex         # \input{sec/intro}, \input{sec/method}, ...
├── figures/*.pdf     # vector graphics preferred
├── references.bib
└── <venue>.sty       # do NOT modify
```

## Build

- **Typst**: `typst compile "<filename>.typ"`, run inside the week folder.
- **LaTeX**: `latexmk -pdf main.tex`, then `latexmk -c` to clean. Force a rebuild with `latexmk -pdf -g main.tex`.
  Without latexmk: `pdflatex main` → `bibtex main` (or `biber main`) → `pdflatex main` twice.
- **Rho/tau templates**: their classes load `minted` unconditionally, so compile with `latexmk -pdf -shell-escape main.tex` and make sure Pygments is on `PATH`. Their bibliography uses biblatex with `backend=biber`.

## Bundled references

Paths are relative to this skill folder. The files are long (400–1,400 lines), so grep for the command or topic first, then read only the matching section.

**Typst** (`references/typst/`, scraped from typst.app — skip the navigation links at the top of each file):

| File | Covers |
|------|--------|
| `typst-syntax.md` | Markup, math, and code modes; comments; escape sequences; identifiers; paths |
| `typst-styling.md` | `set` rules and `show` rules |
| `typst-context.md` | `context`: style context, location context (counters, queries), nested contexts, compiler iterations |

**LaTeX** (`references/latex/`, chapters of *The Not So Short Introduction to LaTeX* as `.tex` source):

| File | Covers |
|------|--------|
| `things.tex` | Input files, document classes and packages, page styles, files you might encounter, big projects (`\input`, `\include`) |
| `typeset.tex` | Line/page breaking, special characters, sectioning, cross references, footnotes, environments (lists, `tabular`, `verbatim`), `\includegraphics`, floats |
| `math.tex` | amsmath: single and multiple equations, `multline`, arrays and matrices, math spacing, math fonts, theorems |
| `lssym.tex` | Tables of math symbols |
| `spec.tex` | Bibliography (`thebibliography`, BibTeX), indexing, fancy headers, installing packages, `hyperref`/PDF, XeLaTeX, Beamer |
| `custom.tex` | `\newcommand`, `\newenvironment`, custom packages, fonts and sizes, spacing, page layout, lengths, boxes, rules |
| `graphic.tex` | Drawing in LaTeX: the `picture` environment, PGF/TikZ |

## Bundled templates

Copy the whole folder to the destination, then edit the main file and the `.bib`:

```bash
cp -r ".agents/skills/technical_report/assets/<template>" "<dest>/<ReportName>"
```

| Folder | Class | Main file | Use for |
|--------|-------|-----------|---------|
| `assets/lab-report/` | standard `article` | `LabReport.tex` | Course lab reports and short write-ups: title, author, and date only, 1 in margins. No `.bib`; add one if citations are needed |
| `assets/preprint/` | `cleantechnicalreport.cls` + `hybridfrontmatter.sty` | `main.tex` | Single-column preprint / technical report: XCharter fonts, author–affiliation block, rounded abstract card, natbib author–year citations |
| `assets/rho-report/` | `rho-class/rho.cls` | `main.tex` | Two-column research article / technical report with a front cover (STIX2 fonts, note/info boxes, minted code) |
| `assets/tau-report/` | `tau-class/tau.cls` | `main.tex` | Same family as rho, with a title-and-abstract header instead of a cover |
| `assets/ieeetran-proposal/` | `IEEEtran_ID.cls` + `IEEEtran.bst` | `Proposal.tex` | IEEE conference-format thesis proposal. Sample text and section headings are Indonesian; translate them |

After copying:
- Delete the sample content (example sections, sample `.bib` entries, `example.py`, template `README`s and preview images) once the real content is in.
- **Rho/tau**: `main.tex` includes `figures/Example.pdf`, which is not bundled. Replace it with a real figure or delete that figure block. Keep the `rho.bib`/`tau.bib` filename — the class file hard-codes it in `\addbibresource`.
- **Preprint**:
  - The `abstract` environment must stay in the preamble, before `\begin{document}`; the class captures it there and renders it at `\maketitle`. No nested environments inside the abstract.
  - Load `hybridfrontmatter` before declaring authors. Use one `\author[n]{Name}` per author plus `\affil[n]{...}`. `\reportauthornote`, `\reportwebsite`, `\reportcontact`, and `\keywords` are optional; delete the ones the draft doesn't need.
  - Citations use natbib (`\citep`, `\citet`) with `plainnat` against `references.bib`. `cite.bib` is not read by `main.tex`.
  - Do not pass the class options `logo`, `address`, `copyright`, or `internal`; they deliberately raise `\ClassError`. Add logos only through `\reportleftlogo`/`\reportrightlogo`, and only marks the author owns.
  - Keep `ATTRIBUTION.md` and `NOTICE.md` next to the class files; the class is CC BY-SA 4.0.

## File placement

- Weekly reports: `Motion Diffusion Model Basics/Reports/WeeklyReports/WeekN/`
- Conference papers: `Motion Diffusion Model Basics/Reports/<ConferenceName>/` or `Robotics Force Project/Paper/`
