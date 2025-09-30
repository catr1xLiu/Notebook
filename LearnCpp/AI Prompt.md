
## 1. Task Overview

Convert the online tutorial into clean, well-structured Obsidian markdown format. You have full creative freedom to:

- Fix computational errors
- Reorganize unclear structures
- Create logical sections
- Improve clarity while keeping content concise for review purposes

## 2. Obsidian Formatting Requirements

### 2.1 Outline & Callout Usage

The note is divided into a few sections, each started with a callout. There are various types of callouts in Obsidian; utilize this feature to help readers navigate through the article.

**Callout Types:**

- `[!abstract]` - Introduction
- `[!quote]` - Definition
- `[!fact]` - Fact
- `[!info]` - Important Information
- `[!hint]` - Best Practice
- `[!example]` - Examples and exercises

```markdown
> [!abstract] Introduction
> ## Subtitle

Introductory parts in the note, such as the content describing the importance of a chapter or its real-life applications.

> [!quote] Definition
> ## Appropriate Subtitle

Introduce new terminology or key concepts.

> [!fact] Fact
> ## Appropriate Subtitle

State an important theorem.

> [!info] Important
> ## Appropriate Subtitle

An important fact or a useful computational trick is something that’s worth knowing.

> [!hint] Best Practice
> ## Appropriate Subtitle

A related fact that’s helpful to know but usually not asked in exams.

> [!example] Example
> ## Appropriate Subtitle

Provide an example or a computation exercise.

```

### 2.3 Examples with Collapsible Solutions

For examples that need solutions, solutions are hidden by default:

```markdown
> [!example] Example
> ## Finding Rank

Find the rank of the given matrix.

> [!success]- Solution (Click to expand)
> Step 1: Convert to REF
> Step 2: Count leading entries
> Answer: $\text{rank}(A) = 2$
```

### 2.4 Multi-Column Layouts

**AVOID** multi-column layouts in Obsidian. Use sequential structure with clear headings instead.

### 2.5 Graphs and Figures

For hand-drawn graphs:

```markdown
[Insert graph: description of what should be shown]
```

### 2.6 Important Terminology

Use purple colour and underline for terminologies that are within a line, example:

```markdown
The vector $\vec{s} = \begin{bmatrix} s_1\ \\ \vdots\ \\ s_n \end{bmatrix}$ is called a <u><strong style="color:#dab1da" >coefficients</u></strong> to the system if all $m$ equations satisfy $LS = RS$ when the <u><strong style="color:#dab1da" >unknowns</u></strong> are replaced by the values in $\vec{s}$.

The <u><strong style="color:#dab1da" >solution set</u></strong> is the set that contains all possible solutions to the system.
```

Or, if we were to give definition to very important terminologies, you can also use h4 (which is also marked purple in obsidian):

```markdown
For all linear systems, there are only 3 possibilities:
#### <u>Inconsistent</u>
The system has **NO** solution
#### <u>Consistent</u>
The system has **at least one** solution:
	- **Exactly ONE** solution, or
	- **Infinite Many** solutions
```

## 3. Content Guidelines

### 3.1 What to Fix

- Computational errors
- Incomplete explanations
- Disorganized structure
- Unclear notation

### 3.2 Organization Tips

- Group related concepts
- Number examples clearly
- Break complex theorems into parts
- Add "why" explanations between steps
- Use consistent terminology

## 4. Input & Output:

You will be given the content of a few pages at a time, convert them into one document. You will also be given a rough outline of the desired output note, so follow that structure.

You need to shrink the content to about half the original size. Discard introduction part, unusual examples, outdated language features and only keep the best practices.