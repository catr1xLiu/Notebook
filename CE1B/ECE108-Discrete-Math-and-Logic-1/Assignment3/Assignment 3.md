---
Course: ECE108
Date: 2026-06-19
Student: Yiran Liu (21184901)
---

> [!example] **Question 1**
> 

Let $f, g, h$ be the following functions. Which ones of the three are injective? Which are surjective? Which are both, i.e., bijective?

$$
\begin{aligned}
&f:\mathbb{R}\to\mathbb{R},\quad f: x\mapsto x+2 \\
&g:\mathbb{R}^+\to\mathbb{R},\quad g: x\mapsto +\sqrt{x}, \text{ i.e., the non-negative square root of } x \\
&h:(\mathbb{R}\times\mathbb{R}^+)\to \mathbb{R},\quad h: \langle x,y \rangle\mapsto x/y
\end{aligned}
$$

> [!success]- Solution

- Since $x_1 \neq x_2 \implies x_1+2 \neq x_2+2$ and we can write $f^{-1}(x):\mathbb{R} \rightarrow \mathbb{R} = x - 2$ whose domain is the entire codomain of $f$, we conclude that $f$ is **bijective**.
- Since $x_1 \neq x_2 \implies +\sqrt{x_1} \neq +\sqrt{x_2}$, we know $g$ is **injective**. But, $+\sqrt{x} \geq 0$, so $\exists y \in \mathbb{Z}$ that $y < 0$  that there is no such $x\in \mathbb{Z}^+$ that $f(x)=y$. So $f$ is **not surjective**.
- Since we can find $h(4,2)\neq(2,1)$ but $(4, 2) = h(2, 1) = 2$, the function is **not injective**. Since if we can define $p: \mathbb{R} \rightarrow (\mathbb{R} \times \mathbb{R^+}) \quad p(x) = (x, 1)$ whose domain is the entire codomain of $h$, the function is **surjective**.

---

> [!example] **Question 2**
> 

Prove that the following function is injective:

$$
\begin{aligned}
&f:\mathbb{Z} \to \mathbb{Z} \\
&f(x) = x^3 + x
\end{aligned}
$$

> [!success]- Solution

$f'(x) = 3x^2 + 1 > 0$, $f$ is is strictly increasing for $x\in \mathbb{R}$.
$$
x_1 \neq x_2 \iff (x_1 < x_2) \lor (x_1 > x_2) \iff (f(x_1) < f(x_2)) \lor (f(x_1) > f(x_2))
$$
Therefore, $x_1 \neq x_2 \implies f(x_1) \neq f(x_2)$. We conclude that $f$ is **injective**.


---

> [!example] **Question 3**
> 

Prove or disprove: the following function is a bijection.

$$
\begin{aligned}
&f:(\mathbb{Z}^+_0\times\mathbb{Z}^+_0) \to \mathbb{Z}^+_0 \\
&f: \langle x,y \rangle\mapsto x + \frac{(x+y)(x+y+1)}{2}
\end{aligned}
$$

> [!success]- Solution

We can rewrite the this expression as 
$$
f(x,y) = x + \sum_{1}^{x+y}i \quad (i\in\mathbb{Z^{+}})$$
**Step1: Prove Injection**

That is to prove that:

> $(x_1,y_1) \neq (x_2, y_2) \implies f(x_1, y_1) \neq f(x_2, y_2)$.

We assume, without loss in generality, that $(x_1, y_1)$ is the pair with smaller (or equal) sum:
$$
f(x_2, y_2) - f(x_1, y_1) = x_2-x_1 + \sum_{x_1+y_1}^{x_2+y_2}i
$$
We prove by case analysis: 
 - **Case 1: when $x_1+y_1 \leq x_2+y_2$.** $$\begin{aligned} \implies & \sum_{x_1+y_1}^{x_2+y_2}i \geq x_1+y_1 > x_1 > x_1-x_2 \\ \implies & f(x_2, y_2) - f(x_1, y_1) > 0 \\ \implies & f(x_1, y_1) \neq f(x_2, y_2)\end{aligned}$$
 - **Case 2: when $x_1 + y_1 = x_2+y_2$.**  $$\begin{aligned} & \implies \sum_{x_1+y_1}^{x_2+y_2}i = 0 \\ \text{Also, }\implies & x_2 \neq x_1 \implies x_2-x_1 \neq 0 \\ \implies & x_2 - x_1 + \sum_{x_1+y_1}^{x_2+y_2}i \neq 0 \\ \implies & f(x_1, y_1) \neq f(x_2, y_2) \end{aligned}$$
**Step 2: Prove Surjection**

That is to prove 

> $\forall y \in \mathbb{Z^+}$ there exists at least one $(a,b)$ exists that $f(a,b) = y$.

We prove by induction on $y$. Assuming that $\exists (a,b) \in (\mathbb{Z^+} \times \mathbb{Z^+}), \exists y \in \mathbb{Z^+}$ that $f(a,b) = y$. Thus, $$a + \sum_{1}^{a+b}i = y$$
For $b\neq0$, if we let $a' = a+1, b' = b-1$, compute:
$$f(a',b') = a' + \sum_{1}^{a'+b'}i = a+1 + \sum_{1}^{a+1+b-1}i = y+1$$
For $b = 0$, if we let $a'=0, b' = a+1$, compute: $$f(a',b') = a' + \sum_{1}^{a'+b'}i = 0 + \sum_{1}^{a+1}i = \sum_{1}^{a}+a+1 = y+1$$

---

> [!example] **Question 4**
> 

Suppose $n\in\mathbb{Z}^+$, i.e., $n$ is some finite positive integer. Denote $\mathbb{Z}^+_n = \{1, 2, \ldots, n\}$. Prove that there exists no surjection with domain $\mathbb{Z}^+_n$ and codomain $\mathbb{Z}^+$.

> [!success]- Solution

We prove by contradiction, assume there is such **surjection**:
$$
\exists n \in \mathbb{Z}^+ \quad f:\mathbb{Z}^+_n \rightarrow \mathbb{Z}^+$$

Since $f$ is surjective, for $\forall b \in \mathbb{Z}^+$ there must be $\exists a \in \mathbb{Z}^+_n$ that $f(a) = b$. 

We write the range of $f$ as: $R = range(f) = \{f(1), f(2), ..., f(n)\}$. Now let new number $b = \sum_{i=1}^{n} f(i) \quad b \in \mathbb{Z}^+$ but there is no such $a \in \mathbb{Z}^+_n$ that $f(a) = b$. This contradicts our claim above. 

Therefore, we conclude that $f$ must **not** be a **surjection**.

---

> [!example] **Question 5**
> 

Suppose $f: S\to\mathbb{Z}^+$ is a bijection, and let $A = \{a_1, a_2, \ldots, a_n\}$, for some $n\in\mathbb{Z}^+$, be some set. Propose a bijection $g: (S\cup A)\to\mathbb{Z}^+$.

> [!success]- Solution

Since $A = \{a_1, a_2, .., a_n\}$, we can write bijection $h: A \rightarrow \mathbb{Z}^+$ as $h(a_i) = i$.

$$
g: (S \cup A) \rightarrow \mathbb{Z}^+ \quad g(x) = \begin{cases}\begin{aligned}
n + f(x) & \quad (x \in S)\\
h(x) & \quad (x \in A\setminus S) 
\end{aligned}\end{cases}
$$


---

> [!example] **Question 6**
> 

Suppose $A_1, A_2, \ldots, A_n$, for some $n\in\mathbb{Z}^+$, are sets such that each $A_i$ is finite. Prove that $A_1 \cup A_2 \cup \ldots \cup A_n$ is finite.

> [!success]- Solution

We prove by induction on $n$. 

Observe that for the base case $n=1$, $A_1$ is finite. 

Assume that $A_1 \cup ... \cup A_{n-1}$ is finite, we need to show that $A_1 \cup ... \cup A_{n}$ is also finite. Based on the definition of bijection, we can define bijection:
$$
\exists s\in\mathbb{Z}^+ \quad f_{n-1}: (A_1 \cup ... \cup A_{n-1}) \rightarrow \mathbb{Z}^+_s
$$

Since $A_n$ is also finite, we can define bijection $\exists m \in \mathbb{Z}^+ \quad g_n:A_n \rightarrow \mathbb{Z}^+_m$.

Using the two functions above, we can write: $\exists t \in \mathbb{Z}^+ \quad f_n:(A_1 \cup ... \cup A_n) \rightarrow \mathbb{Z}^+_t$:
$$
f_n(x) = \begin{cases}\begin{aligned}
m + f_{n-1}(x) & \quad\quad (x \in \{A_1 \cup ... \cup A_{n-1}\}) \\
g_n(x) & \quad\quad (x\in A_n \setminus \{A_1 \cup ... \cup A_{n-1}\})
\end{aligned}\end{cases}
$$

Since $f_{n-1}$ and $g_n(x)$ are both bijections, and:
- For any $x \in \{A_1 \cup ... \cup A_{n-1})\}$, $f_n(x) = f_{n-1}(x) = m+f_{n-1}(x) > m$.
- For any $x\in A_n \setminus \{A_1 \cup ... \cup A_{n-1}\}$,  $f_n(x) = g_n(x) \quad g_n(x)\in \mathbb{Z}^+_m \leq m$. 

$x_1 \neq x_2 \implies f_n(x_1) \neq f_n(x_2)$, therefore, $f_n$ is an injection.

Based on Claim.28 on the textbook:

> 

We conclude that $A_1 \cup A_2 \cup ... A_n$ is finite.

---

> [!example] **Question 7**
> 

Suppose $S = \{n^2 \mid n\in\mathbb{Z}\}$, i.e., the set of perfect squares. Prove that $|S| = \aleph_0$.

> [!success]- Solution

We let $f(x) = x^2$ for $\forall x\in \mathbb{Z}^+$. It is obvious that 
$$
\forall x_1, x_2 \in \mathbb{Z}^+ \quad x_1 \neq x_2 \implies f(x_1) \neq f(x_2)$$

Also, $range(f) = S$, so $f: \mathbb{Z}^+ \rightarrow S \quad$ is a **bijection**. 

Therefore, we conclude that $S$ is **countably finite**.