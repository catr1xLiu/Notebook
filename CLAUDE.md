# CLAUDE.md

This repository has migrated its developer instructions, guidelines, and custom command instructions to the `.agents/` directory to serve as a shared source of truth for all AI assistants (e.g. Claude Code and Google Antigravity).

## Setup & Rules

When starting a conversation or task, please load the instructions from:
1.  **General Rules & Structure**: Refer to [.agents/rules/general.md](file:///home/catr1x/Coding/Notebook/.agents/rules/general.md) to understand the project structure, formatting styles, and general workflows.
2.  **Custom Skills**: Custom task-specific instructions (such as obsidian formatting, schemdraw circuit generation, and document compilation) are documented in [.agents/skills/](file:///home/catr1x/Coding/Notebook/.agents/skills/).

    > **These are plain markdown files, not registered Claude Code skills.** This repo has no `.claude/skills/` directory. A `Skill(obsidian-note)` tool call will fail — nothing is registered under those names. **Read the `SKILL.md` file directly** with the Read tool before starting a task it covers. The `/name` labels below are just shorthand for referring to them in conversation.

    *   `/obsidian-note` -> [.agents/skills/obsidian_note/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/obsidian_note/SKILL.md)
    *   `/schemdraw` -> [.agents/skills/schemdraw/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/schemdraw/SKILL.md)
    *   `/embed-image` -> [.agents/skills/embed_image/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/embed_image/SKILL.md)
    *   `/project-webpage` -> [.agents/skills/project_webpage/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/project_webpage/SKILL.md)
    *   `/technical-report` -> [.agents/skills/technical_report/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/technical_report/SKILL.md)
    *   `/comsol` -> [.agents/skills/comsol/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/comsol/SKILL.md)
    *   `/read-rnote` -> [.agents/skills/rnote/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/rnote/SKILL.md)
    *   `/literature-review` -> [.agents/skills/literature_review/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/literature_review/SKILL.md)
    *   `/pdf` -> [.agents/skills/pdf/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/pdf/SKILL.md)

## What Git Tracks

Read [.gitignore](file:///home/catr1x/Coding/Notebook/.gitignore) before advising on what to commit or ignore. Two rules are counterintuitive:

*   **`sources/` PDFs are committed on purpose.** `*.pdf` is ignored globally, then re-included by `!**/sources/*.pdf`, `!**/Poster/*.pdf`, and `!**/assets/*.pdf`. Textbooks, past exams, and papers under a `sources/` folder belong in git, together with their converted markdown and extracted figures. This **overrides** the `pdf` skill's generic "do not commit the source PDF" advice — never suggest gitignoring `sources/`.
*   **`**/out/` is ignored** (it targets JS build output). Anything written to a directory named `out/` silently disappears from git — including `marker_single --output_dir .../out`. Name conversion output by content instead, e.g. `sources/09_Sinusoidal_Steady_State_Analysis/`.

[.gitattributes](file:///home/catr1x/Coding/Notebook/.gitattributes) applies a `filter=rnote` clean/smudge pair (`gzip -d -f -c` / `gzip -c`) so `.rnote` files diff as plain XML, and tracks `*.mph` plus individually-listed large `.rnote` files with LFS.

## Reading PDFs

**NEVER read a `.pdf` file with the Read tool.** It is token-expensive and loses equations, tables, and document structure. The `pdf` skill ([.agents/skills/pdf/SKILL.md](file:///home/catr1x/Coding/Notebook/.agents/skills/pdf/SKILL.md)) is *always* the preferred way to handle a PDF: inspect the page count, cut with `qpdf`, convert to markdown with `marker_single`, then read the markdown. This applies to every PDF — papers, textbooks, lab manuals, datasheets, slides, and scans.
