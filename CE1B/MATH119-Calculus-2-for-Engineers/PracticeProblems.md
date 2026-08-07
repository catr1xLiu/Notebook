# MATH 119 — Practice Problems

Selected from `sources/ProblemSets/`. Each problem is labelled with its source as `Set<set>P<problem><part>`.
The folded blocks hold the official answers from the problem sets — those give final answers only, not worked solutions.

---

> [!abstract] Group 1
> ## Limits via Taylor Series

> [!example] **Problem 1** — Set11P11c

$$ \lim_{x\to 0} \frac{e^x + e^{-x} - 2}{2\cos(2x) - 2} $$

> [!success]- Solution
> $-\dfrac{1}{4}$

> [!example] **Problem 2** — Set11P11d

$$ \lim_{x\to 0} \frac{\sin(x) - x + \frac{1}{6}x^3}{x^5} $$

> [!success]- Solution
> $\dfrac{1}{120}$

> [!example] **Problem 3** — Set8P4

Use Taylor polynomials to evaluate the limit

$$ \lim_{x\to 0} \frac{\tan^{-1}(x^2)}{\tan^2(x)} $$

> [!success]- Solution
> $1$

---

> [!abstract] Group 2
> ## Rigor in Series Convergence and Edge Cases

> [!example] **Problem 1** — Set9P1c

Use the telescoping technique to find the sum of the series, if it exists.

$$ \sum_{n=2}^{\infty} \frac{1}{n(n+1)(n-1)} $$

*Recall the setup from the parent question:* rewrite the term using partial fractions, form the $N^{\text{th}}$ partial sum $s_N$ explicitly, and take $\lim_{N\to\infty} s_N$ — do not conclude from the apparent cancellation alone.

> [!success]- Solution
> $\dfrac{1}{4}$

> [!example] **Problem 2** — Set10P3b

Determine all real values of $p$ such that the following series converges.

$$ \sum_{n=2}^{\infty} \frac{1}{n^p \ln(n)} $$

> [!success]- Solution
> $p > 1$

---

> [!abstract] Group 3
> ## Integrals and Jacobians

> [!example] **Problem 1** — Set6P1a

Evaluate

$$ \int_1^3 \int_0^x \int_0^{\ln z} e^y \ln(x)\,dy\,dz\,dx $$

> [!success]- Solution
> $\dfrac{5}{9}$

> [!example] **Problem 2** — Set6P3

Evaluate

$$ \iiint_D \frac{1}{x^2 + y^2 + z^2}\,dV $$

where $D$ is the region between the spheres $x^2 + y^2 + z^2 = 4$ and $x^2 + y^2 + z^2 = 8$.

> [!success]- Solution
> $8\pi(\sqrt{2} - 1)$

> [!example] **Problem 3** — Set6P7a,b,c

Let $D$ be the region inside the cylinder $x^2 + y^2 = 1$ and between the planes $z = 1$ and $z = y + 2$.

**(a)** Set up in Cartesian coordinates the double integral that computes the volume of $D$.

**(b)** Set up in Cartesian coordinates the triple integral that computes the mass of $D$, if the density is $\rho(x,y,z) = x^2 + y^2 + 1$.

**(c)** Use cylindrical coordinates to evaluate the integral in (b).

> [!success]- Solution
> **(a)** $\displaystyle\int_{-1}^{1} \int_{-\sqrt{1-y^2}}^{\sqrt{1-y^2}} (y+1)\,dx\,dy$
>
> **(b)** $\displaystyle\int_{-1}^{1} \int_{-\sqrt{1-y^2}}^{\sqrt{1-y^2}} \int_{1}^{y+2} (x^2 + y^2 + 1)\,dz\,dx\,dy$
>
> **(c)** $\dfrac{3\pi}{2}$

> [!example] **Problem 4** — Set5P10

Let $D$ be the region in the first quadrant bounded by the curves $y = x^2$, $y = 7x^2$, $y = 8 - x^2$, and $y = 32 - x^2$. Use the change of variables $u = x^2 + y$, $v = \frac{y}{x^2}$ to evaluate

$$ \iint_D \frac{y}{x^5}\,dA $$

by converting it to an integral in the $uv$-plane.

> [!success]- Solution
> $24\ln(2)$

---

> [!abstract] Group 4
> ## Taylor's Inequality and Estimations

> [!example] **Problem 1** — Set8P1

Approximate $f(x) = \frac{1}{\sqrt{x}}$ with a Taylor polynomial of degree $2$ centred at $x = 4$. Use Taylor's inequality to get an upper bound on the error if $3.5 \le x \le 4.5$.

> [!success]- Solution
> $$ T_{2,4}(x) = \frac{1}{2} - \frac{1}{16}(x-4) + \frac{3}{256}(x-4)^2 $$
>
> $$ \text{error} \le \frac{(15)(0.5)^3}{(3!)(8)(3.5^{7/2})} $$

> [!example] **Problem 2** — Set8P9

Find the $5^{\text{th}}$-order Maclaurin polynomial for $f(x) = \sin^{-1}(x)$, with an upper bound on the error associated with using it on the interval $(0, 1/2)$. Do **not** start by differentiating $f(x)$; start with a related function whose derivatives are easier to work with.

*Hint:* use the related function $\frac{1}{\sqrt{1+u}}$, then substitute $u = -x^2$ and integrate.

> [!success]- Solution
> $$ T_{5,0}(x) = x + \frac{1}{6}x^3 + \frac{3}{40}x^5 $$
>
> $$ \text{error} \le \frac{1}{(7)(2^7)} $$

> [!example] **Problem 3** — Set11P7a,b

This example illustrates how Taylor series can be used to compute derivatives.

**(a)** Find the Maclaurin series for $f(x) = x^3 e^{x^2}$.

**(b)** Compute $f^{(63)}(0)$ without actually taking $63$ derivatives.

> [!success]- Solution
> **(a)** $\displaystyle\sum_{n=0}^{\infty} \frac{x^{2n+3}}{n!}$, $R = \infty$, $I = (-\infty, \infty)$
>
> **(b)** $f^{(63)}(0) = \dfrac{63!}{30!}$

---

> [!abstract] Group 5
> ## Convergence Tests and Power Series

> [!example] **Problem 1** — Set11P1b,e

Determine whether the following series converge absolutely, converge conditionally, or diverge. Justify your conclusions as thoroughly as you can.

**(b)** $\displaystyle\sum_{n=1}^{\infty} \frac{(-1)^n n^{100} 100^n}{n!}$

**(e)** $\displaystyle\sum_{n=1}^{\infty} \left(\frac{-2n}{n+1}\right)^{3n}$

> [!success]- Solution
> **(b)** Converges absolutely.
>
> **(e)** Diverges.

> [!example] **Problem 2** — Set11P2g

Find the radius of convergence $R$, as well as the interval of convergence $I$, for the power series

$$ \sum_{n=1}^{\infty} \frac{(2x-1)^n}{5^n \sqrt{n}} $$

> [!success]- Solution
> $R = \dfrac{5}{2}$, $I = [-2, 3)$

> [!example] **Problem 3** — Set11P3d

Starting from the geometric series

$$ \frac{1}{1-x} = \sum_{n=0}^{\infty} x^n \quad \text{for } |x| < 1 $$

find the series representation, radius $R$, and interval $I$ of convergence of

$$ \frac{3}{x^2 + x - 2} $$

*Hint:* start by decomposing this into its partial fractions.

> [!success]- Solution
> $$ -\sum_{n=0}^{\infty} \left[1 + \frac{(-1)^n}{2^{n+1}}\right] x^n $$
>
> $R = 1$, $I = (-1, 1)$
