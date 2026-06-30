> [!quote] Definition
> ## The Problem

We want to interpret a relationship given sample data points

![[16.1 - Problem|100%]]

---

> [!info] Approach
> ## Expressing the Relationship

Given $n+1$ points $(x_1,y_1), \dots, (x_{n+1}, y_{n+1})$, we want a degree-$n$ polynomial $P(x) = c_0 + c_1x + c_2x^2 + \cdots + c_nx^n$ such that $y_i = P(x_i)$ for every point. Writing this out for each point gives a linear system:
$$
\begin{bmatrix}
x_1^0 & x_1^1 & \cdots & x_1^n \\
x_2^0 & x_2^1 & \cdots & x_2^n \\
\vdots & \vdots & & \vdots \\
x_{n+1}^0 & x_{n+1}^1 & \cdots & x_{n+1}^n
\end{bmatrix}
\begin{bmatrix} c_0 \\ c_1 \\ \vdots \\ c_n \end{bmatrix}
=
\begin{bmatrix} y_1 \\ y_2 \\ \vdots \\ y_{n+1} \end{bmatrix}
\quad\Longleftrightarrow\quad
[X]\,\vec{c} = \vec{y} \implies \vec{c} = [X]^{-1}\vec{y}
$$

> [!hint] Why Not Just Invert $[X]$?
> Solving $[X]\vec{c}=\vec{y}$ directly means inverting the $(n+1)\times(n+1)$ **Vandermonde matrix** $[X]$, which costs $O(n^3)$ (Gaussian elimination) and gets numerically unstable for large $n$ since $[X]$ becomes ill-conditioned. The interpolation formula below builds the same polynomial using only a triangular table of subtractions ($O(n^2)$ to build) and evaluates it with $O(n)$ multiplications — no matrix inversion needed.
>
> It's guaranteed to match every $(x_i,y_i)$ because each term added, $x(x-x_1)\cdots(x-x_{k-1})\frac{\Delta^k y_1}{k!}$, vanishes at $x_1,\dots,x_{k-1}$ by construction (it doesn't disturb points already matched), while contributing exactly enough to match $x_k$. A degree-$n$ polynomial through $n+1$ distinct points is **unique** — $[X]$ is invertible precisely because the $x_i$ are distinct (nonzero Vandermonde determinant) — so this construction must equal $\vec{c} = [X]^{-1}\vec{y}$, just computed without ever forming $[X]^{-1}$.

---

> [!fact] Method
> ## Lagrange Interpolation Formula

#### <u>1D Polynomial Fit</u>

Consider the case of fitting two points $(x_1, y_1), (x_2, y_2)$ by a polynomial of degree 1: $P(x) = kx + b$.
- $k = \frac{\delta x}{\delta y} = \frac{y_2 - y_1}{x_2 - x_1}$
- $b = y - kx = y_1 - \left(\frac{y_2 - y_1}{x_2 - x_1}\right)x_1$

Therefore:
$$
P(x) = \frac{y_2 - y_1}{x_2 - x_1}\, x + \left(y_1 - \frac{y_2 - y_1}{x_2 - x_1}\right)x_1
$$

#### <u>2D Polynomial (Quadratic) Fit</u>
