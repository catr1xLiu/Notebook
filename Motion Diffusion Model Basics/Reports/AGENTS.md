AGENTS — Agent Instructions for Reports Repo

Purpose
- This repository holds technical reports (Typst source), figures (SVG/PNG/JPG) and reference markdown pulled from the Typst docs. Agents operating here should be able to build and compile Typst documents, format and lint supporting files, attach charts/figures into reports, and produce correct Typst source when asked.

Where the fetched docs live
- The reference pages fetched from typst.app are stored under `docs/typst/`:
  - `docs/typst/typst-syntax.md`
  - `docs/typst/typst-styling.md`
  - `docs/typst/typst-context.md`

Repository structure (initialized)
- Weekly reports are grouped under `WeeklyReports/WeekN/`. Follow `Week2` as the canonical template and structure.
- Current layout (examples):
  - `WeeklyReports/Week1/`
    - `week1 report.typ`
    - `Frame.jpg`
  - `WeeklyReports/Week2/`
    - `week2 report.typ` (role model)
    - `Drawing1.svg`, `Drawing3.svg`, `Drawing 1.16.svg`
- Misc assets remain in repo root: `Drawing.svg`, `image.png`.
- Agents MUST run `ls -l WeeklyReports/WeekN/` before attaching assets so filenames and sizes are exact.

Template & Tone
- Use `WeeklyReports/Week2/week2 report.typ` as the structural and tonal template. The agent should imitate its tone: concise, professional, with vocabulary like “foundational study”, “analysis”, “proposed method”, and paragraphs of ~3–6 lines.
- File layout rules:
  1. One primary Typst file per week named `weekN report.typ`.
  2. Place local images next to the Typst file and reference them relatively.
  3. If helper scripts are needed, place them in the same folder and document usage in `README.md`.

Build / Lint / Test commands
- Compile a single Typst file (run inside the week folder):
```bash
typst compile "week2 report.typ"
```
- Compile all .typ in a week folder:
```bash
for f in "WeeklyReports/Week2"/*.typ; do typst compile "$f"; done
```
- Preview (if supported):
```bash
typst preview "WeeklyReports/Week2/week2 report.typ"
```
- Lint / format:
  - Markdown: `prettier --write **/*.md` or `mdformat`.
  - Python: `ruff check . && ruff format .`.
  - Typst: no standard formatter; follow the Typst style rules below.
- Tests:
  - No test framework by default. If pytest is added: `pytest` and run single tests with `pytest path::to::test`.

Code style & conventions (for agents)
- Focus languages: Typst (primary), Python/Bash for helpers.
- Typst-specific:
  - Identifiers: Kebab-case for multi-word identifiers (e.g. `chapter-title`).
  - Headings: use `=` and set numbering explicitly when needed: `#set heading(numbering: "1.")`.
  - Show/set rules: write them compositionally. Prefer `#show heading: set text(...)` over embedding set rules inside transformational show rules unless necessary.
  - Paths: reference local assets relatively, and quote filenames containing spaces.
- Formatting:
  - Wrap lines at ~100 characters. Prefer content blocks for multi-line content.
  - Use fenced code blocks for code examples in Markdown.
- Python helpers:
  - Naming: snake_case for functions/variables; PascalCase for classes.
  - Error handling: catch specific exceptions, log context, and re-raise if the caller must handle it.

Artifacts & outputs
- Output PDF naming: derive from source file: `week2 report.typ` => `week2-report.pdf`.
- Place temporary build artifacts in `build/` and add to `.gitignore`.

Figures & charts
- Agents must run `ls -l WeeklyReports/WeekN/` and list chosen files with sizes in any report notes.
- Prefer SVG for charts; embed as `#image("Drawing1.svg", width: 12cm)`.
- Quote paths with spaces: `#image("Drawing 1.16.svg")`.

Cursor / Copilot rules
- No `.cursor/rules/` or `.github/copilot-instructions.md` found. If such files appear later, update AGENTS.md to summarize rules.

Operational checklist for an agent run
1) `ls -l WeeklyReports/WeekN/` to confirm files.
2) `ruff check .` (if Python) and `prettier --check **/*.md`.
3) `typst compile "weekN report.typ"` from the week folder.
4) Inspect PDF; when failing, paste the compiler output and file path into the error report.

If blocked
- Ask one precise question including the file path, command run, and full error text. Suggest a default remedial command.

References
- Local copies of Typst docs: `docs/typst/typst-syntax.md`, `docs/typst/typst-styling.md`, `docs/typst/typst-context.md`.

Repository changes performed by the agent
- Moved weekly reports into `WeeklyReports/Week1/` and `WeeklyReports/Week2/` and relocated Typst reference markdown into `docs/typst/`.

End of AGENTS.md
