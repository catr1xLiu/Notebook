# Skill: Convert Draft to Obsidian Note

## 1. Task Overview

**What to fix:**
- Spelling mistakes, grammar errors, awkward sentence structure
- Disorganized or unclear structure — reorganize into logical sections
- Mathematical errors in computations

**What to complete:**
- Half-finished sentences: infer the intended meaning from context and complete them naturally
- Missing step explanations: add "why" between computation steps when the draft skips reasoning

**What to keep:**
- The author's tone and level of technical detail — do not simplify or over-explain
- All examples and exercises — they are essential for exam prep
- All theorems, definitions, and key formulas exactly as written (correct errors, don't rewrite)

**Output:** Always wrap the final note in a markdown code block so the UI doesn't auto-render it.

---

## 2. Note Structure

Each section opens with a **callout header** followed by a `## Subtitle` on the next line. Callouts are section titles only — never wrap body content inside a callout block.

**Callout types:**
- `[!abstract]` — Introduction / motivation
- `[!quote]` — Definition of new terminology
- `[!fact]` — Theorem or important result
- `[!info]` — Important fact, useful computational trick
- `[!hint]` — Related helpful fact, geometric interpretation, exam tips
- `[!example]` — Examples and exercises

```markdown
> [!abstract] Introduction
> ## Solving Linear Systems

Body text goes here, outside the callout block.

> [!quote] Definition
> ## Linear Equations

The expression $a_1x_1 + \cdots + a_nx_n = b$ is a <u><strong style="color:#dab1da">linear equation</strong></u>.
```

**Key terminology styling:**
- Inline terms: `<u><strong style="color:#dab1da">term</strong></u>`
- Major standalone terms: `#### <u>Term</u>` (the theme handles the color for h4)

**Collapsible solutions** (for examples):
```markdown
> [!example] Example
> ## Finding the Rank

Find the rank of matrix $A$.

> [!success]- Solution (Click to expand)
> Step 1: Row reduce to REF
> Step 2: Count pivot columns
> Answer: $\text{rank}(A) = 2$
```

Separate major sections with `---`. No multi-column layouts.

---

## 3. Math Equations

**Every mathematical symbol must be in LaTeX** — even single variables inline: `$x$`, `$A$`, `$\alpha$`.

### Systems of equations

Use `\begin{cases}` to group related equations with a bracket. Never list them as separate `$$` blocks.

```latex
$$
\begin{cases}
3x_1 - 2x_2 = 5 \quad (1) \\
2x_1 + 6x_2 = 1 \quad (2)
\end{cases}
$$
```

For multi-line derivations without a bracket, use `\begin{aligned}`:
```latex
$$
\begin{aligned}
a_{11}x_1 + \cdots + a_{1n}x_n &= b_1 \\
\vdots \\
a_{m1}x_1 + \cdots + a_{mn}x_n &= b_m
\end{aligned}
$$
```

### Matrices and vectors

Always use `\\` to separate rows. Without it the matrix collapses to one line.

**Column vector:**
```latex
$$
\vec{b} = \begin{bmatrix} b_1 \\ b_2 \\ \vdots \\ b_m \end{bmatrix}
$$
```

**General matrix:**
```latex
$$
A = \begin{bmatrix}
a_{11} & a_{12} & \cdots & a_{1n} \\
\vdots & \vdots & & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn}
\end{bmatrix}
$$
```

**Augmented matrix** (use `\left[\begin{array}...\end{array}\right]`):
```latex
$$
[A|\vec{b}] = \left[\begin{array}{cccc|c}
a_{11} & a_{12} & \cdots & a_{1n} & b_1 \\
a_{21} & a_{22} & \cdots & a_{2n} & b_2 \\
\vdots & \vdots & & \vdots & \vdots \\
a_{m1} & a_{m2} & \cdots & a_{mn} & b_m
\end{array}\right]
$$
```

**Sets of vectors** — use `\{` `\}`, never `\left{` `\right}` (invalid LaTeX):
```latex
$\{\begin{bmatrix} 1 \\ 0 \end{bmatrix}, \begin{bmatrix} 0 \\ 1 \end{bmatrix}\}$
```

### Other conventions

- Functions: `$\text{rank}(A)$`, `$\text{span}(\vec{v})$`
- Number sets: `$\mathbb{R}^n$`, `$\mathbb{C}$`
- Vectors: `$\vec{v}$`

---

## 4. Using Media and Diagrams

### Excalidraw drawings

Drawings created in Obsidian's Excalidraw plugin are stored as `.md` files in the `drawings/` subdirectory of each topic folder. Embed them with the wiki-link syntax and `|100%` to set width:

```markdown
![[Drawing Name|100%]]
```

Example from an existing note:
```markdown
![[SRUN State Flow|100%]]
![[System Diagram|100%]]
```

The drawing file does not need a path prefix — Obsidian resolves it by filename. Do not embed the raw Excalidraw `.md` content; just use the `![[...]]` link.

If a diagram would be helpful but doesn't exist yet, insert a placeholder comment so the author knows to draw it:

```markdown
<!-- TODO: Draw a diagram showing XXX and embed as ![[Drawing Name|100%]] -->
```

### Regular images

Images are stored in the `media/` subdirectory of each topic folder. Embed with an HTML `<img>` tag to control width:

```markdown
<img src="filename.png" alt="Brief description" width="50%">
```

Before inserting an image, check `<topic>/media/` for relevant assets. If an appropriate image doesn't exist, insert a placeholder:

```markdown
<img src="placeholder.png" alt="Please Insert Image of XXX" width="50%">
```

Use `width="50%"` as the default; adjust to `30%` for small diagrams or `80%` for wide figures.
