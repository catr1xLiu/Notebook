
---

> [!abstract] Discrete Mathematics
> ## What is Discrete?

<u><strong style="color:#dab1da">Discrete</strong></u> means **non-continuous** — it deals with distinct, countable values rather than continuous ranges.

> [!quote] Opening Example
> ## Proof: Density of ℝ

**Given** $x, y \in \mathbb{R}$, $x < y$ (assumption), **there exists** $z \in \mathbb{R}$ that satisfies $x \leq z \leq y$ (statement to be proven).

**Proof:**

Since $x < y$:

$$
\begin{aligned}
x + x &< x + y \quad \text{and} \quad x + y < y + y \\
2x &< x+y < 2y \\
x &< \frac{x+y}{2} < y
\end{aligned}
$$

Therefore we found $z = \dfrac{x+y}{2}$.

![[1 - Introduction Drawing|100%]]

> [!info] Applications of Discrete Math
> ## Applications (Example)

- **Huffman code** → e.g. sending "hello" digitally
- **Digital IC** (circuits like ECE124)
- **DSA** (data structures and algorithms)

**Example — Huffman Encoding of "hello":**

"hello" $\xrightarrow{\text{ASCII table}}$
$\begin{bmatrix} \texttt{0x68} \\ \texttt{0x65} \\ \texttt{0x6C} \\ \texttt{0x6C} \\ \texttt{0x6F} \end{bmatrix}$

Atomic elements: h, e, l, l, o — sort by frequency (highest drop first):

| Symbol | Frequency | Binary Code |
|--------|-----------|-------------|
| l      | 2×        | 00          |
| h      | 1×        | 01          |
| e      | 1×        | 000         |
| o      | 1×        | 0001        |

**Dictionary (binary tree):** h: 00 &nbsp; e: 000 &nbsp; l: 0 &nbsp; o: 01

![[1.2 - Haffman Example|100%]]

---

> [!abstract] Proposition Logics
> ## Proposition Logics

> [!quote] Definition
> ## Domain of Discourse

The <u><strong style="color:#dab1da">domain of discourse</strong></u> limits the domain of discussion (real numbers? integers?).

> [!quote] Definition
> ## Propositions

A <u><strong style="color:#dab1da">proposition</strong></u> is a statement or claim that can be proven **true or false**.

| Type | Description | Example |
|------|-------------|---------|
| **Atomic Proposition** | A single, indivisible claim | $x$ is divisible by 3 |
| **Compound Proposition** | Combination of two propositions | "Given $m$, then $x$ is divisible by 3" // "$x$ is divisible by 3, **and** $x$ is even" |

> [!info] Logic Operators
> ## Logic Operators

With $P$ and $Q$ being propositions:

| Notation | Name | Natural Language | Boolean |
|----------|------|-----------------|---------|
| $P \wedge Q$ | **Conjunction** | "P **and** Q are both true" | boolean AND |
| $P \vee Q$ | **Disjunction** | "Either one of P, Q is true" | boolean OR |
| $\neg P$ | **Negation** | "P is **false**" | boolean NOT |
| $P \Rightarrow Q$ | **Implication** | "**Whenever** P is true, Q is true" | — |
| $P \Leftarrow Q$ | **Inference** | "P will **always** be true if Q is true" | — |

> [!hint] Truth Table
> ## Truth Table

Like logic gates in ECE124, we can use truth tables here to show compositions and to prove claims.

> [!fact] Common Claims
> ## Common Claims

1. $(P \Rightarrow Q) \Leftrightarrow (\neg P \vee Q)$

2. $(P \Rightarrow Q) \Leftrightarrow (\neg Q \Rightarrow \neg P)$

3. $(P \Rightarrow Q) \Rightarrow (P \vee R) \Rightarrow (Q \vee R)$

---

> [!example] Proof by Contradiction
> ## Proof Example 1

**Claim:** If $a, b, c$ are positive integers, then at least one of $a-b$, $b-c$, $c-a$ is **even**.

**Proof** (by contradiction): Assume $a-b$, $b-c$, and $c-a$ are all **odd**. ①

Then we can write $a-b = 2k+1$ and $b-c = 2l+1$ where $k, l \in \mathbb{Z}$.

We can re-write: $a = b+2k+1$ and $c = b-2l-1$.

Therefore:

$$
c - a = (b - 2l - 1) - (b + 2k + 1) = -2l - 2k - 2 = -2(l + k + 1)
$$

Obviously $-2(l+k+1)$ where $l, k \in \mathbb{Z}$ is **even** — this **contradicts** statement ①.

Therefore, at least one of $a-b$, $b-c$, and $c-a$ is even. $\blacksquare$

> [!example] Proof by Contradiction
> ## Proof Example 2 — Two Methods

**Claim:** For all $x, y$ positive integers, $\left(\displaystyle\sum_{i=1}^{x} i = \sum_{i=1}^{y} i\right) \Rightarrow (x = y)$

**Method 1 — Proof by contradiction:**

The claim is equivalent to $\neg\!\left(\displaystyle\sum_{i=1}^{x} i = \sum_{i=1}^{y} i\right) \vee (x = y)$.

For contradiction, assume both:
- ① $\displaystyle\sum_{i=1}^{x} i = \sum_{i=1}^{y} i$
- ② $x \neq y$ are both true.

Since $x \neq y$, either $(x > y)$ or $(x < y)$. We look at both cases:

**(1)** $y > x$: Thus $\displaystyle\sum_{i=1}^{y} i = \sum_{i=1}^{x} i + \sum_{i=x+1}^{y} i$.

Since $y - x \neq 0$ and $y - x \in \mathbb{Z}$, we have $y - x \geq 1$, so $\displaystyle\sum_{i=x+1}^{y} i \geq x+1 > 0$, thus $\displaystyle\sum_{i=1}^{y} i > \sum_{i=1}^{x} i$ — contradicts ①.

**(2)** $x > y$: For the same reason, $\displaystyle\sum_{i=1}^{x} i > \sum_{i=1}^{y} i$ — contradicts ①.

Therefore our assumption is rejected. We can state that $\neg\!\left(\displaystyle\sum_{i=1}^{x} i = \sum_{i=1}^{y} i\right) \vee (x = y)$, or equivalently $\left(\displaystyle\sum_{i=1}^{x} i = \sum_{i=1}^{y} i\right) \Rightarrow (x = y)$. $\blacksquare$

---

**Method 2 — Direct method (from textbook):**

We prove the equivalent statement $\neg(x = y) \Rightarrow \neg\!\left(\displaystyle\sum_{i=1}^{x} i = \sum_{i=1}^{y} i\right)$.

Given $x \neq y$, either $x > y$ or $x < y$. We consider both cases:

**(1)** $x < y$: $\displaystyle\sum_{i=1}^{y} i = \sum_{i=1}^{x} i + \sum_{i=x+1}^{y} i$, where $y \geq x+1 > 0$.

Thus $\displaystyle\sum_{i=1}^{y} i \geq \sum_{i=1}^{x} i + 1$, so $\displaystyle\sum_{i=1}^{y} i \neq \sum_{i=1}^{x} i$.

**(2)** $x > y$: For the same reason, $\displaystyle\sum_{i=1}^{x} i \geq \sum_{i=1}^{y} i + 1$, so $\displaystyle\sum_{i=1}^{x} i \neq \sum_{i=1}^{y} i$.

Therefore $\neg(x = y) \Rightarrow \left(\displaystyle\sum_{i=1}^{x} i \neq \sum_{i=1}^{y} i\right)$ — this proves our statement. $\blacksquare$
