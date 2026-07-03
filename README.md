# Computer Engineering Personal Knowledge Base & Publication Workspace

Welcome! This repository serves as a personal knowledge base and publication workspace. It contains academic notes, course research, technical reports, draft publications, and project websites.

## Repository Contents

*   **`CE1A/` & `CE1B/`**: Term coursework notes, digital/analog drawings, and worked examples covering subjects like Linear Algebra, Calculus, Electricity & Magnetism, Digital Circuits, and Linear Circuits.
*   **`Motion Diffusion Model Basics/`**: Research materials, weekly Typst reports, and draft LaTeX submissions (CVPR & 3DV style) for robotics human motion generation research.
*   **`Robotics Force Project/`**: Research papers and notes focused on robotics force interactions.
*   **`WebPage/`**: Academic project portfolio pages, configured to auto-deploy to GitHub Pages on commit push.

---

## Technical Stack & Tooling

This workspace integrates multiple formats and tools:
1.  **Obsidian**: The primary personal notebook frontend. Notes use markdown extensions, callouts, and LaTeX formulas.
2.  **Excalidraw & rnote**: Digital drawings and vector flowcharts are embedded directly into notes.
3.  **JupyMD**: Obsidian's inline Python execution environment (configured to run within Flatpak's Python 3.13 sandbox).
4.  **Typst**: A modern markup-based typesetting system used for rapid weekly internal report generation.
5.  **LaTeX**: The standard format for paper submissions. Uses standard templates (CVPR, IEEE IEEEtran) with `latexmk` build targets.
6.  **Bulma CSS + jQuery**: Used for simple, responsive research project showcase websites under `WebPage/`.

---

## Agentic Development Setup

For AI coding assistants (such as Google Antigravity and Claude Code), project rules and task-specific skills are located under the `.agents/` folder:
*   **Workspace Rules**: Located in [.agents/rules/general.md](file:///home/catr1x/Coding/Notebook/.agents/rules/general.md).
*   **Custom Skills**: Accessible in [.agents/skills/](file:///home/catr1x/Coding/Notebook/.agents/skills/) (including `obsidian_note`, `schemdraw`, `embed_image`, `project_webpage`, and `technical_report`).
