---
name: literature-review
description: End-to-end workflow for turning an arXiv paper into an information-dense Obsidian literature-review note — download, marker-pdf conversion, figure post-processing, and a strict Step-6 writing guideline.
---

# Skill: Literature Review Note

Turn an arXiv paper into a dense, self-authored Obsidian review note. The goal is a
**high-density reference for the author**, preserving math, training tricks, and the reasons
behind design decisions — **not** a generic-audience introduction. Follow the six steps in order.

This skill assumes and extends the [`obsidian-note`](../obsidian_note/SKILL.md) format skill. All
callout, math, figure, and Excalidraw conventions from that skill apply here unless overridden below.

## Directory Layout (target)

```
<Area>/Literature-Review/
├── sources/
│   └── <PaperName>/
│       ├── Paper.md            # marker output, post-processed
│       └── media/              # all figures, PNG only
├── media/                      # figures used by the note (may reuse sources media)
├── drawings/                   # Excalidraw .md files (author-created)
└── <PaperName> Literature Review.md   # the summary note (Step 6)
```

`<PaperName>` is a short PascalCase identifier (e.g. `A2AFlowMatching`, `RPent`). The tex source
tarball and the raw PDF are **deleted** after Step 4 — only `Paper.md` and PNG media survive.

---

## Step 1 — Download from arXiv

Download **both** the PDF and the LaTeX source. arXiv rejects blank/default user agents, so always
pass a browser-like `-A` string and follow redirects.

```bash
ID=2401.01234          # arXiv id
DL=/tmp/arxiv-$ID; mkdir -p "$DL"
UA="Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36"
curl -L -A "$UA" -o "$DL/paper.pdf"  "https://arxiv.org/pdf/$ID"
curl -L -A "$UA" -o "$DL/source.tar" "https://arxiv.org/e-print/$ID"
mkdir -p "$DL/src" && tar -xf "$DL/source.tar" -C "$DL/src"
```

`e-print` returns a gzipped tar (sometimes a bare `.tex`). If `tar` fails, try `tar -xzf`, or treat
the file as a single `.tex`. The source tree holds the **high-resolution figures** used in Step 4.

## Step 2 — Convert with marker-pdf

`marker_single` lives in the conda `scientific` env. Output the markdown + extracted figures into the
paper's `sources/<PaperName>/` folder.

```bash
conda run -n scientific marker_single "$DL/paper.pdf" \
  --output_format markdown \
  --output_dir "<Area>/Literature-Review/sources/<PaperName>"
```

Marker writes `paper.md`, `paper_meta.json`, and `_page_N_Figure_M.jpeg` screenshots. Rename the
markdown to `Paper.md`.

## Step 3 — Sanity check

Marker produces a highly readable, well-formatted markdown with extracted figures. Skim `Paper.md`:
confirm equations rendered as LaTeX, tables converted, and section headers intact. This is the
reading source for Step 6 — you do not rewrite it, you mine it.

## Step 4 — Post-process figures

Marker's `_page_N_Figure_M.jpeg` files are **page screenshots** — often blurry. Upgrade them:

1. **Move real figures** into `sources/<PaperName>/media/`.
2. **Drop junk**: lab/brand logos, decorative photos, redundant screenshots (see keep/drop rule in Step 6-C).
3. **Replace blurry screenshots with source figures.** Locate the original in `$DL/src` (look in
   `Figs/`, `figures/`, `assets/`). If it's a PDF or vector, **convert to PNG** at high DPI:

   ```bash
   pdftoppm -png -r 300 input.pdf outname        # -> outname-1.png
   # or, for a single cropped figure:
   pdftocairo -png -r 300 -singlefile input.pdf outname
   ```

   **All figures must end up as PNG** — no PDF/JPEG/SVG in the final `media/`.
4. Update image references in `Paper.md` to the cleaned PNG filenames.

## Step 5 — Finalize directory

- Markdown at `sources/<PaperName>/Paper.md`, all figures (PNG) under `sources/<PaperName>/media/`.
- **Delete** the tex source tarball, extracted source tree, and the raw PDF (`rm -rf /tmp/arxiv-$ID`).
- Copy the figures the note will actually embed into `<Area>/Literature-Review/media/`.

## Step 6 — Write the summary note

The note is `<Area>/Literature-Review/<PaperName> Literature Review.md`. It is a **dense reference for
the author**, not an introduction. Preserve math, tricks, and design-decision rationale; cut the
generic-audience padding. Apply all `obsidian-note` conventions plus the rules below.

### Metadata header

Open the file with a small header: arXiv link, authors as `John D. et al.`, venue, date, and a
relative link back to the extracted source:

```markdown
> arXiv: [2401.01234](https://arxiv.org/abs/2401.01234) · John D. et al. · CoRL 2024 · 2024-01-03
> Source: [Paper.md](sources/<PaperName>/Paper.md)
```

### Section skeleton (fixed)

Follow this order and callout mapping. Try the standard skeleton first; **if a paper genuinely does
not fit it, stop and ask the author** before improvising.

| Section | Callout | Length target |
|---|---|---|
| TL;DR | `[!abstract]` | ~100 words |
| Overview / Intro | `[!info]` | < 100 words |
| Methodology | `[!fact]` | 150–300 words *excluding* math; 1–2 sentences per equation / code block / figure |
| Experiments & Findings | `[!hint]` | same density guideline as Methodology |
| Reflection / "My Read" | `[!fact]` | **leave completely blank** — author fills this |
| Codebase Status and Structure *(optional, last)* | `[!hint]` | only for important open-source research the author explicitly asks to analyze — see "Codebase analysis" below |

Length is controlled per-material: each equation, code block, or figure gets 1–2 sentences of prose
around it. Don't pad.

### Voice

Neutral, with **slight critical edge**. Flag potential over-claims, limitations, and flaws — even
implied or uncertain ones — inline, and leave them for the author to think through carefully. Do not
resolve them; surface them.

**Closed source / closed dataset is a limitation** — when code or data is not released, the results
cannot be independently verified, so flag it as such. This is case-dependent: if the method is trivially
simple to reimplement (e.g. SAPS's ~50 lines), it is a minor limitation, not a fatal one.

### What to strengthen vs. weaken

- **Strengthen** the paper's *unique* innovations and decisions, and the **subject-specific reason**
  behind each. This is the point of the note.
- **Weaken / compress** methods the paper merely adapts and baselines it compares against — a link is
  enough (see Related work).
- **Cut** these write-up anti-patterns:
  - Generic-audience metaphors about the contribution ("robots can follow simple instructions; this
    teaches them long ones…").
  - "They used X *instead of the general approach Y*" → condense to "They used X." The paper is
    already a contribution atop the established approach; don't re-explain the baseline.

### Depth & fidelity

- **Derivations**: keep only *research-shaping* ones — where the math justifies the paper's heart
  design decision (e.g. "distill multi-step flow to one step → enables Q-learning"). Otherwise state
  the result plus its assumptions. Use `\boxed{}` for the single key equation of a derivation.
- **Quantitative results**: preserve exact numbers. Use a **table** when ≥3 comparable numbers,
  prose otherwise.
- **Ablations**: one line each — "what was removed → what it cost" — and only when it changes a takeaway.
- **Implementation tricks** — a dedicated `[!info]` subsection. A "trick" is a **discrete decision
  uncommon in the field, imposed for a project-specific reason** (e.g. keeping subjects mutually
  exclusive across train/val splits in a motion-to-age regressor). **Do not** dump hyperparameters or
  detailed data tables — instead link to arXiv, deep-linking to the HTML section
  (`https://arxiv.org/html/<id>#Sxxx` when available, else the `/abs/` page).

### Related work & cross-linking

- Generic techniques the paper builds on (flow-matching, Q-learning, VAEs, …): **do not re-explain**.
  Link an existing repo note with `[[Note Name]]` if one exists; otherwise link a high-quality
  external tutorial/doc. Exclude the paper's generic related-work section from the note.
- Inline a related work **only** if it's a niche artifact from the authoring team (e.g. a bespoke
  infra library).
- **Always cross-link** with `[[...]]` when a relation exists — including baselines that have their
  own repo notes.

### Exclusions (paper side)

Always drop: acknowledgements, funding, broad field-motivation padding, restated generic background,
reviewer-pleasing hedging, and generic related work (link instead).

### Math

- Preserve the author's **exact** notation and symbols — the note should read alongside the source PDF.
- For equations dense in notation, add a **2-row, n-column symbol table** mapping each symbol to its
  meaning (see the obsidian-note conventions and existing SAPS note).
- **Numbering**: leave equations unnumbered when a reasonable name fits (refer to it as, e.g., "the
  VAE reconstruction loss"). If the derivation is long or has too many equations to name, number them.
- All key math shown as multi-line `$$ … $$` blocks.

### Algorithms

Never reproduce pseudocode, even if the author used it. Write **fake Python** instead — readable,
typed-looking, illustrative code that conveys the algorithm.

### Figures

- **Keep**: architecture/pipeline diagrams, key result plots, illustrative task examples.
  **Drop**: decorative photos, logos, redundant qualitative screenshots.
- **Alt-text only** — descriptive `alt=`, no visible caption lines.
- **Always center** figures in a `<div align="center">`. Choose width by information density:
  `50%`, `80%`, or `100%`. Remember Obsidian renders at ~half screen width, so a `50%` figure is
  roughly `50% × 50% × (1 − 10% padding)` of a 16:9 screen — size up for detailed figures.

  ```markdown
  <div align="center"><img src="media/pipeline.png" alt="..." width="100%"></div>
  ```

### Diagrams (Excalidraw)

Only when a **process/flow** is clearly better as a diagram, emit a `mermaid` block plus a placeholder
for the author to one-shot-convert to Excalidraw:

```markdown
<!-- TODO: Convert the Mermaid below to Excalidraw and embed as ![[Drawing Name|100%]] -->
```

Otherwise **do not** invent diagrams — the author decides which drawings to create.

### Reflection

Leave the "My Read" section header in place with an empty body. Do not draft it.

---

## Codebase analysis (optional section)

An **optional** final section, `## Codebase Status and Structure` under a `[!hint]` callout, placed
**after Reflection**. Include it **only for important open-source research the author explicitly asks
to analyze** — if a repo exists but the author didn't ask, silently omit it. The author will `git clone`
the repo and give you the path; you have full read/execute access to that dir even though it lives
outside the vault. **Everything lands in the note** — do not create scratch files in the repo or vault
(deep adaptation means diving into the real source anyway).

**Static by default.** Do **not** pull deps or run the code unless the author explicitly asks — getting
a research codebase running usually needs author step-in, and env/time budget is specified per-project.
For exploring APIs (ML libraries drift fast past the model's knowledge cutoff), prefer static
introspection: `stubgen -p <package>` (mypy) and `pdoc <module>` surface signatures without executing
pipelines.

### Part 1 — Status & usability

Lead with a one-line **verdict**, then a compact table:

| Aspect | Assessment |
|---|---|
| **Completeness** | All experiments/components present? Notable methodology mismatch with the paper? |
| **Adaptation** | Docs to replicate? Dataset available? Research-team-only vs. community-contributed / has real users? |
| **Dependency** | Depends on a niche infra toolchain (e.g. RLInf)? How portable? (Exclude common big-org toolchains — PyTorch, HF, etc.) |
| **Currency & Maintenance** | Modern libs, or pinned to a weird `torch 1.x + chumpy`? Last commit date? Active? |

Then a **replication-difficulty rating**:

- **Easy** — a few terminal commands, e.g. `uv sync && python main.py --params …`.
- **Moderate** — requires manual dataset/model pulls or manual install of another library (RPent is here).
- **Hard** — a real bottleneck, unclear instructions, or an unwieldy oversized codebase.

Add a one-sentence note on how hard it is to **adapt the key technique** into another codebase.

### Part 2 — Code pipeline breakdown

Purpose: a **Data Flow Diagram**, not an execution-flow chart. Execution flow = what runs at startup
(load model → enter loop). **Data flow = the structure of data passing between layers of the API** — the
communication protocol you'd need to graft a module into your own code.

- **Which APIs**: only **layer-boundary APIs** — the arrows in the paper's pipeline figure (most papers
  provide one; map each arrow to the function that carries that data). Ignore helpers like
  `resetController()`.
- **Signature format**: a fake-Python code block per API showing the signature with type/shape
  annotations. Keep the real docstring if one exists (**preserve the authors' original wording**);
  write a concise one only where missing.

  ```python
  def forward(observation: Tensor,        # (B, T_obs, C, H, W) RGB history
              a_prev: Tensor,             # (B, T_hist, 7) past actions
              ) -> Tensor:                # (B, T_pred, 7) predicted action chunk
      """<authors' own description of the policy forward pass>"""
  ```

- **Cross-links**: link each key API to its source on GitHub — use the repo's **original URL, or the
  author's fork URL if they specify one** — and give local `path:line` references in prose.
- **Data Flow diagram**: emit a `mermaid` block, then the Excalidraw conversion placeholder (same as
  other flow diagrams — the author converts it so they can annotate their own interpretation):

  ```markdown
  <!-- TODO: Convert the Mermaid below to Excalidraw and embed as ![[<PaperName> Data Flow|100%]] -->
  ```
