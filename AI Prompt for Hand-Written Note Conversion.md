
## 1. Task Overview

Convert handwritten course notes into clean, well-structured Obsidian markdown format. You have full creative freedom to:

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
- `[!fact]` - Theorem
- `[!info]` - Important Information
- `[!hint]` - Hints / Related Facts
- `[!example]` - Examples and exercises

```markdown
> [!abstract] Introduction
> ## Subtitle

Introductory parts in the note, such as the content describing the importance of a chapter or its real-life applications.

> [!quote] Definition
> ## Appropriate Subtitle

Introduce new terminology or key concepts.

> [!fact] Theorem
> ## Appropriate Subtitle

State an important theorem.

> [!info] Info
> ## Appropriate Subtitle

An important fact or a useful computational trick is something that’s worth knowing.

> [!hint] Hint
> ## Appropriate Subtitle

A related fact that’s helpful to know but usually not asked in exams.

> [!example] Example
> ## Appropriate Subtitle

Provide an example or a computation exercise.

```


**IMPORTANT - Callouts are ONLY used for section titles/headers, NOT for content:**

### 2.2 Mathematical Notation

#### All Math in LaTeX

**EVERY** mathematical symbol must be in LaTeX, even if they are within a line:

- Single variables: `$x$`, `$A$`, `$\alpha$`
- Inline expressions: `$f(x) = 2x + 1$`
- Matrix dimensions: `$m \times n$`
- Functions: `$\text{rank}(A)$`

#### System of Equations


1. Systems of equations that MUST be grouped.

	CORRECT (grouped using big brackets):
	$$ 
	\begin{cases}  
	3x_1 - 2x_2 = 5 \quad (1)  \\ 
	2x_1 + 6x_2 = 1 \quad (2) 
	\end{cases}
	$$
	$$ 
	\begin{cases}  
	x_1 = \frac{16}{11}  \\ 
	x_2 = -\frac{7}{22}
	\end{cases}
	$$
2. For small piece of equation system or solution to equation system, use big brackets.
	
	CORRECT (grouped using aligned lines):
	$$
	\begin{aligned}
	a_{11}x_1 + a_{12}x_2 + \cdots + a_{1n}x_n = b_1
	\\ \cdots \\
	a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n = b_2
	\end{aligned}
	$$
	For larger pieces of systems with a lot of terms, use aligned lines so it's cleaner
	INCORRECT (separated equation blocks):
	
	$$ 3x_1 - 2x_2 = 5 \quad (1) $$
	
	$$ 2x_1 + 6x_2 = 1 \quad (2) $$
	
	$$ a_{11}x_1 + a_{12}x_2 + \cdots + a_{1n}x_n = b_1 $$
	
	$$ a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n = b_2 $$
	
	$$ \vdots $$
	
	$$ a_{m1}x_1 + a_{m2}x_2 + \cdots + a_{mn}x_n = b_m $$
	INCORRECT (lines are not separated and squeezed together):
	$$\begin{align} 3x_1 - 2x_2 &= 5 \quad (1)\ 2x_1 + 6x_2 &= 1 \quad (2) \end{align}$$
	$$\begin{align} a_{11}x_1 + a_{12}x_2 + \cdots + a_{1n}x_n &= b_1\ a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n &= b_2\ &\vdots\ a_{m1}x_1 + a_{m2}x_2 + \cdots + a_{mn}x_n &= b_m \end{align}$$

#### Vectors & Matrices

Standard matrix:
$$
A = \begin{bmatrix}
1 & -1 & 0\\
0 & 3 & 2\\
0 & 0 & 0
\end{bmatrix}
$$

Vectors & Matrices with hidden terms:
$$
\vec{s} = \begin{bmatrix} s_1\ \\ \vdots\ \\ s_n \end{bmatrix}
$$
$$
A = \begin{bmatrix} a_{11} & a_{12} & \cdots & a_{1n} \\ \vdots & \vdots & & \vdots \\ a_{m1} & a_{m2} & \cdots & a_{mn} \end{bmatrix}
$$

$$
[A|\vec{b}] = \left[\begin{array}{cccc|c}
a_{11} & a_{12} & \cdots & a_{1n} & b_1\\
a_{21} & a_{22} & \cdots & a_{2n} & b_2\\
\vdots & \vdots &  & \vdots & \vdots \\ 
a_{m1} & a_{m2} & \cdots& a_{mn} & b_m
\end{array}\right]
$$
INCORRECT (squeezed):
$$\vec{s} = \begin{bmatrix} s_1\ \vdots\ s_n \end{bmatrix}$$ 
$$A = \begin{bmatrix} a_{11} & a_{12} & \cdots & a_{1n}\ \vdots & & & \vdots\ a_{m1} & a_{m2} & \cdots & a_{mn} \end{bmatrix}$$
$$[A|\vec{b}] = \left[\begin{array}{cccc|c} a_{11} & \cdots & a_{1n} & | & b_1\ \vdots & & \vdots & | & \vdots\ a_{m1} & \cdots & a_{mn} & | & b_m \end{array}\right]$$
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

### 3.2 What to Keep

- ALL examples (essential for exam prep)
- Key theorems and definitions
- Important formulas
- Step-by-step solutions

### 3.3 Organization Tips

- Group related concepts
- Number examples clearly
- Break complex theorems into parts
- Add "why" explanations between steps
- Use consistent terminology

## 4. Example:

This is a properly formatted note showing the desired style:

```markdown

--- 


> [!abstract] Introduction
> ## Solving Equations

Solving equations is one of the most common tasks across multiple scientific disciplines. A lot of the time the equations are nonlinear, which do not have a general solution method. However, when they are **linear**, we can develop a systematic process to identify the solutions.

> [!quote] Definition
> ## Linear Equations

The expression $a_1x_1 + a_2x_2 + \cdots + a_nx_n = b$ is called a <u><strong style="color:#dab1da" >linear equation</u></strong> with $n$ variables.

- The values $a_i \in \mathbb{R}$ are called the <u><strong style="color:#dab1da" >coefficients</u></strong>.
- The variables $x_i \in \mathbb{R}$ are called the <u><strong style="color:#dab1da">unknowns</u></strong>.
- The value $b$ is called the <u><strong style="color:#dab1da">constant terms</u></strong>.

Whenever we have more than one such equation, we call them a **system of linear equations**.

> [!quote] Definition 
> ## Solution

Given a system of $m$ linear equations in $n$ unknowns:

The vector $\vec{s} = \begin{bmatrix} s_1\ \\ \vdots\ \\ s_n \end{bmatrix}$ is called a <u><strong style="color:#dab1da" >coefficients</u></strong> to the system if all $m$ equations satisfy $LS = RS$ when the <u><strong style="color:#dab1da" >unknowns</u></strong> are replaced by the values in $\vec{s}$.

The <u><strong style="color:#dab1da" >solution set</u></strong> is the set that contains all possible solutions to the system.

> [!fact] Theorem
> ## Possibilities for Solutions

For all linear systems, there are only 3 possibilities:
#### <u>Inconsistent</u>
The system has **NO** solution
#### <u>Consistent</u>
The system has **at least one** solution:
	- **Exactly ONE** solution, or
	- **Infinite Many** solutions


> [!hint] 
> ## Geometric Interpretation

As a graphical example, when working in $\mathbb{R}^3$ with the variables $x_1, x_2, x_3$, a linear equation represents a **plane**. A system of $m$ equations in $\mathbb{R}^3$ represents $m$ planes. Solving such a system would be attempting to find all points common to all planes.

[Insert graph: three intersecting planes in 3D space showing their intersection]


> [!info] 
> ## Matrix Representation

**Intro**

Generally speaking, all consistent linear systems can be solved by a repeated use of multiplication and elimination. For example, the system:

$$ 
\begin{cases}  
3x_1 - 2x_2 = 5 \quad (1)  \\ 
2x_1 + 6x_2 = 1 \quad (2) 
\end{cases}
$$


can be solved using the following steps:

$$
\begin{cases}
3 \times (1): \quad 9x_1 - 6x_2 = 15 \quad (3) \\
2 \times (1): \quad 2x_1 + 6x_2 = 1 \quad (4)
\end{cases}
$$
$$
\begin{cases}
2 \times (2): \quad 6x_1 - 4x_2 = 10 \quad (5) \\
3 \times (2): \quad 6x_1 + 18x_2 = 3 \quad (6)
\end{cases}
$$
$$
\begin{cases}
(3) + (4): \quad 11x_1 + 0x_2 = 16 \quad(7) \\
(6) - (5): \quad 0x_1 + 22x_2 = -7 \quad(8)
\end{cases}
$$

Therefore: $x_1 = \frac{16}{11}$, $x_2 = -\frac{7}{22}$

Note that throughout this process **we only manipulated the numbers**. We can therefore simplify our work by introducing the following:

Given a linear system:


$$
\left\{
\begin{array}{l}
a_{21}x_1 + a_{22}x_2 + \cdots + a_{2n}x_n = b_2 \\
\vdots \\
a_{m1}x_1 + a_{m2}x_2 + \cdots + a_{mn}x_n = b_m
\end{array}
\right.
$$

We define the following:

**The coefficient matrix** $A$: 
$$ 
A = \begin{bmatrix} a_{11} & a_{12} & \cdots & a_{1n} \\ \vdots & \vdots & & \vdots \\ a_{m1} & a_{m2} & \cdots & a_{mn} \end{bmatrix} 
$$

**The constant vector** $\vec{b}$: 
$$
\vec{b} = \begin{bmatrix}b_1 \\b_2 \\ \vdots \\ b_m\end{bmatrix} 
$$

**The augmented matrix** $[A|\vec{b}]$: 
$$
[A|\vec{b}] = \left[\begin{array}{cccc|c}
a_{11} & a_{12} & \cdots & a_{1n} & b_1\\
a_{21} & a_{22} & \cdots & a_{2n} & b_2\\
\vdots & \vdots &  & \vdots & \vdots \\ 
a_{m1} & a_{m2} & \cdots& a_{mn} & b_m
\end{array}\right]
$$

```

The attached handwritten note contains a few mistakes and is not very well-structured, so it has been converted into a more organized format.
