---
name: technical-report
description: Convert or format drafts into weekly reports (Typst) or conference papers (LaTeX).
---

# Skill: Convert Draft to Technical Report / Paper

Convert or format a draft into a polished technical report (Typst) or conference/journal paper (LaTeX), following the rules in `Motion Diffusion Model Basics/Reports/AGENTS.md`.

## Mandatory steps

1. **Read** `Motion Diffusion Model Basics/Reports/AGENTS.md` for the full formatting, build, and style spec.
2. **Identify the output format**:
   - **Typst** — internal weekly reports and flexible reports. Follow the canonical template at `WeeklyReports/Week2/week2 report.typ`.
   - **LaTeX** — conference/journal submissions. Start from the official author-kit template (CVPR, NeurIPS, IEEE IEEEtran, etc.). Template is law; never modify `*.sty` or `*.cls` files.
3. **Grammar and style**: fix spelling, grammar, and word choice. Do **not** add opinions, new ideas, or additional technical claims. Preserve the author's meaning and tone exactly. Complete half-finished sentences using context.
4. **Line breaking**: no fixed-width wrapping. Each sentence (or numbered list item) on its own line for clean diffs.
5. **Figures**: run `ls -l figures/` (or the relevant figures directory) before referencing any file. Use vector graphics (`.pdf`, `.svg`) when available.
6. **Build and verify**:
   - Typst: `typst compile "<filename>.typ"` (run inside the week folder).
   - LaTeX: `latexmk -pdf main.tex` then `latexmk -c` to clean.
7. **Check `sec.back/`** (if it exists) before editing any section file — it holds backup versions.

## File placement

- Weekly reports: `Motion Diffusion Model Basics/Reports/WeeklyReports/WeekN/`
- Conference papers: `Motion Diffusion Model Basics/Reports/<ConferenceName>/` or `Robotics Force Project/Paper/`
