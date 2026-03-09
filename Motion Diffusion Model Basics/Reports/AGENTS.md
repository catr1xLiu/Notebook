AGENTS — Agent Instructions for Reports Repo

**Agent Role**: You are a formatting and grammar assistant. Your purpose is ONLY to fix spelling, grammar, and word choice while converting content to LaTeX/Typst. You are STRICTLY FORBIDDEN from adding your own ideas, opinions, interpretations, or new content. Always preserve the user's original meaning, tone, and technical content exactly as written.

Purpose
- This repository holds technical reports in **Typst** (internal reports, flexible formatting) and **LaTeX** (conference/journal submissions, strict templates).
- Agents should compile both Typst and LaTeX documents, attach figures, and produce correct source when asked.
- **Key distinction**: Typst = creative freedom. LaTeX = follow the template exactly.

---

## Documentation References

### Typst Documentation (local)
- `docs/typst/typst-syntax.md` - Language syntax
- `docs/typst/typst-styling.md` - Styling rules
- `docs/typst/typst-context.md` - Context system

### LaTeX Documentation (local source files)
- `docs/latex/src/` - Complete lshort handbook source code (~10 pages as pdf)
- Key files to reference:
  - `lshort.tex` - Main document structure
  - `things.tex` - Document classes, packages, structure
  - `typeset.tex` - Text formatting, fonts, spacing
  - `math.tex` - Mathematical typesetting (equations, symbols)
  - `spec.tex` - Specialized features (algorithms, theorems)
  - `graphic.tex` - Figures, tables, graphics
  - `custom.tex` - Custom commands, environments
  - `biblio.tex` - Bibliography and citations
  - `lssym.tex` - Symbol reference

**LaTeX Learning Approach**:
1. Agent reads relevant .tex files from `docs/latex/src/` for syntax patterns
2. Agent **always prioritizes conference template requirements** over handbook examples
3. When in doubt, check the author kit's example paper and comments

---

## Repository Structure

### Typst Reports (internal)
- `WeeklyReports/WeekN/`
  - Example: `WeeklyReports/Week2/week2 report.typ` (canonical template)
  - Structure: One `.typ` file + local images per week
  - Tone: Professional, concise ("foundational study", "analysis", "proposed method")

### LaTeX Papers (conference submissions)
- `Papers/ConferenceName/`
  - Example: `Papers/CVPR2026/main.tex`
  - Structure: Main file + sections in `sec/*.tex` + `references.bib`
  - **Critical**: Always start from the official author kit template

### Shared Assets
- `figures/` - Figures usable by both Typst and LaTeX
- Agents MUST run `ls -l <directory>/` before referencing files

---

## Typst Guidelines

### Build Commands
```bash
# Compile single file (run inside week folder)
typst compile "week2 report.typ"
```

### Style Conventions
- Identifiers: kebab-case (`chapter-title`)
- Headings: `#set heading(numbering: "1.")`
- Images: `#image("drawing.svg", width: 12cm)`
- Quote paths with spaces: `#image("Drawing 1.16.svg")`
- Line wrap: ~100 characters

### Template Structure
Follow `WeeklyReports/Week2/week2 report.typ`:
- Professional tone with technical vocabulary
- Paragraphs of 3-6 lines
- Clear section hierarchy

---

## LaTeX Guidelines

### **CRITICAL: Follow the Template**

**LaTeX is for submissions. The conference/journal template is law.**

1. **Always start with the official author kit**:
   - CVPR: `cvpr.sty` + example `main.tex`
   - NeurIPS: `neurips_2024.sty` + template
   - IEEE: `IEEEtran.cls` + guidelines
   
2. **Template takes precedence over handbook**:
   - If template says use `\paragraph{}`, use it (even if handbook suggests `\subsubsection{}`)
   - If template has custom commands (`\figref{}` instead of `\ref{}`), use those
   - Read the template's comments - they contain submission rules

3. **Common template requirements**:
   - Line number packages (for review): `\usepackage{lineno}`
   - Anonymization (for blind review): Don't use author names
   - Page limits: Respect `\setlength` and don't add `\vspace` hacks
   - Forbidden packages: Check template comments for blacklist

### Build Commands
```bash
# Using latexmk (handles multiple passes automatically)
latexmk -pdf main.tex

# Clean build artifacts
latexmk -c

# Force rebuild
latexmk -pdf -g main.tex

# Manual compilation (if latexmk unavailable)
pdflatex main.tex
bibtex main      # If using bibliography
pdflatex main.tex
pdflatex main.tex
```

### Standard Structure
```
Papers/ConferenceName/
├── main.tex              # Main document (uses template)
├── preamble.tex          # Additional packages (if allowed)
├── sec/
│   ├── intro.tex         # \input{sec/intro}
│   ├── related.tex
│   ├── method.tex
│   └── experiments.tex
├── figures/
│   └── *.pdf             # Vector graphics preferred
├── references.bib        # BibTeX entries
├── cvpr.sty              # Conference template (do NOT modify)
└── README.md             # Build instructions
```
---

## LaTeX Additional Templates

Additional templates available in `docs/latex/Templates/`:

### Available Templates

| Template | Description | Use Case |
|----------|-------------|----------|
| `Proposal/` | IEEEtran-based thesis proposal template for D-IV Komputasi Statistik at Politeknik Statistika STIS (Indonesian) | Thesis proposals |
| `Report2/` | Rho class - professional academic article/research report template with STIX2 fonts, custom environments, and code highlighting | Research articles, technical reports |
| `TAU Report/` | Tau class - professional academic article/research report template with STIX2 fonts, custom environments, and code highlighting | Research articles, lab reports |

### Using These Templates

1. Copy the entire template folder to your project location
2. Edit `main.tex` (or `Proposal.tex`) with your content
3. Update the bibliography file (`.bib`)
4. Place figures in the `figures/` subfolder
5. Compile with `latexmk -pdf main.tex`

---

End of AGENTS.md
