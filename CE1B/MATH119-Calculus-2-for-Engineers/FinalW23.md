# MATH 119 Final Exam — Winter 2023

Transcribed from [[M119W23ExamSolns]] (`sources/M119W23ExamSolns.pdf`).
Each question shows only the statement; the official solution is folded underneath.

---

> [!example] Question 1 — 15 marks
> ## Triple Integral over a Paraboloid

Evaluate the triple integral $\iiint_E \sqrt{x^2 + z^2}\,dV$, where $E$ is the region bounded by the paraboloid $y = x^2 + z^2$ and the plane $y = 4$.

> [!success]- Solution (Click to expand)
> The projection of the solid region $E$ onto the $xy$-plane is the region bounded above by $y = 4$ and below by the parabola $y = x^2$. Hence,
>
> $$ E = \left\{ (x,y,z) \mid -2 \le x \le 2,\ x^2 \le y \le 4,\ -\sqrt{y - x^2} \le z \le \sqrt{y - x^2} \right\} $$
>
> The triple integral becomes
>
> $$ \iiint_E \sqrt{x^2 + z^2}\,dV = \int_{x=-2}^{x=2} \int_{y=x^2}^{y=4} \int_{z=-\sqrt{y-x^2}}^{z=\sqrt{y-x^2}} \sqrt{x^2 + z^2}\,dz\,dy\,dx $$
>
> This is difficult to compute, so we consider the projection of $E$ onto the $xz$-plane instead. This is the circular disc $x^2 + z^2 \le 4$. Thus,
>
> $$
> \begin{aligned}
> \iiint_E \sqrt{x^2 + z^2}\,dV &= \int_{x=-2}^{x=2} \int_{z=-\sqrt{4-x^2}}^{z=\sqrt{4-x^2}} \int_{y=x^2+z^2}^{y=4} \sqrt{x^2 + z^2}\,dy\,dz\,dx \\
> &= \int_{x=-2}^{x=2} \int_{z=-\sqrt{4-x^2}}^{z=\sqrt{4-x^2}} (4 - x^2 - z^2)\sqrt{x^2 + z^2}\,dz\,dx
> \end{aligned}
> $$
>
> We use the polar substitution $x = r\cos(\theta)$, $z = r\sin(\theta)$, $dz\,dx = r\,dr\,d\theta$ in the $xz$-plane — the same as polar coordinates in the $xy$-plane, with $y$ replaced by $z$:
>
> $$
> \begin{aligned}
> \iiint_E \sqrt{x^2 + z^2}\,dV &= \int_{\theta=0}^{\theta=2\pi} \int_{r=0}^{r=2} (4 - r^2)\,r\,(r\,dr\,d\theta) \\
> &= \int_0^{2\pi} \left[ \frac{4r^3}{3} - \frac{r^5}{5} \right]_0^2 d\theta = \int_0^{2\pi} \frac{64}{15}\,d\theta = \frac{128\pi}{15}
> \end{aligned}
> $$

---

> [!example] Question 2
> ## True or False

For each of the following statements, determine whether it is true or false.
Correct answers are worth $2$, blanks are worth $0$, and incorrect answers are worth $-2$.

**(a)** The surface below corresponds to the function $z = f(x,y) = |x| + |y|$.

![[CE1B/MATH119-Calculus-2-for-Engineers/sources/M119W23ExamSolns/_page_1_Picture_2.jpeg|50%]]

**(b)** The function $u(x,t) = f\big(x - c(x)t\big)$ is a solution of the partial differential equation

$$ \frac{\partial^2 u}{\partial t^2} + c^2(x)\frac{\partial^2 u}{\partial x^2} = 0 $$

for all differentiable functions $c(x)$.

**(c)** The integral $\iint_D dx\,dy$ is the area of the region $D$.

**(d)** The function $f(x,y) = \sqrt{x^2 + y^2}$ does not have a tangent plane at $(x,y) = (0,0)$.

**(e)** The following sum approximates $e^{-1}$ with an absolute error less than $\frac{1}{5!}$,

$$ e^{-1} \approx \frac{1}{2!} - \frac{1}{3!} + \frac{1}{4!} $$

that is,

$$ \left| e^{-1} - \left( \frac{1}{2!} - \frac{1}{3!} + \frac{1}{4!} \right) \right| \le \frac{1}{5!} $$

> [!success]- Solution (Click to expand)
> **(a)** T
> **(b)** F — this only holds for $c(x)$ constant.
> **(c)** T
> **(d)** T
> **(e)** *The official key stops at (d) and does not record an answer for this part.*

---

> [!example] Question 3 — 12 marks
> ## Estimating an Integral with a Maclaurin Series

Use the first three non-zero terms in the Maclaurin series (i.e. Taylor series centred at $x_0 = 0$) expansion to estimate the integral $\int_0^1 e^x \cos(\sqrt{x})\,dx$. Provide a bound on the error.

> [!success]- Solution (Click to expand)
> We have
>
> $$ \cos(u) = \sum_{n=0}^{\infty} \frac{(-1)^n u^{2n}}{(2n)!} \implies \cos(\sqrt{x}) = \sum_{n=0}^{\infty} \frac{(-1)^n x^n}{(2n)!} = 1 - \frac{x}{2!} + \frac{x^2}{4!} - \cdots $$
>
> $$ e^x = \sum_{n=0}^{\infty} \frac{x^n}{n!} = 1 + x + \frac{x^2}{2!} + \cdots $$
>
> Multiplying these two series,
>
> $$
> \begin{aligned}
> e^x\cos(\sqrt{x}) &= \left(1 - \frac{x}{2} + \frac{x^2}{24} - \cdots\right)\left(1 + x + \frac{x^2}{2} + \cdots\right) \\
> &= 1 + x + \frac{x^2}{2} - \frac{x}{2} - \frac{x^2}{2} + \frac{x^2}{24} + \cdots \\
> &= 1 + \frac{x}{2} + \frac{x^2}{24} + \cdots
> \end{aligned}
> $$
>
> Thus
>
> $$ \int_0^1 e^x\cos(\sqrt{x})\,dx \approx \int_0^1 \left(1 + \frac{x}{2} + \frac{x^2}{24}\right)dx = \left[x + \frac{x^2}{4} + \frac{x^3}{72}\right]_0^1 = \frac{91}{72} $$
>
> Any reasonable estimate of the error is acceptable. Two examples:
>
> - From the remainder theorem, over $x \in (0,1)$, $e^x = 1 + x + \frac{x^2}{2} \pm \frac{3x^3}{3!} \le 1 + x + \frac{x^2}{2} \pm \frac{1}{2}$, and similarly $\cos(\sqrt{x}) = 1 - \frac{x}{2} + \frac{x^2}{24} \pm \frac{x^3}{720} \le 1 - \frac{x}{2} + \frac{x^2}{24} \pm \frac{1}{720}$. The error is then bounded by
>
> $$ |\text{error}| \le \frac{1}{2}\left|\int_0^1 \left(1 - \frac{x}{2} + \frac{x^2}{24}\right)dx\right| + \frac{1}{720}\left|\int_0^1 \left(1 + x + \frac{x^2}{2}\right)dx\right| + \frac{1}{1440} = \frac{1}{2}\cdot\frac{55}{72} + \frac{1}{720}\cdot\frac{5}{3} + \frac{1}{1440} $$
>
> - The integral is bounded below by the minima of $e^x$ and $\cos(\sqrt{x})$, and above by their maxima, where $\cos(1)$ is bounded below by $\cos(\pi/3)$. Altogether,
>
> $$ e^0\cos(\pi/3) \le e^0\cos(1) \le \int_0^1 e^x\cos(\sqrt{x})\,dx \le e^1\cos(0) \le 3 $$
>
> so that $\frac{1}{2} \le \int_0^1 e^x\cos(\sqrt{x})\,dx \le 3$, and the error can be estimated as
>
> $$ |\text{error}| \le \max\left(\left|\frac{91}{72} - \frac{1}{2}\right|, \left|\frac{91}{72} - 3\right|\right) = \frac{125}{72} $$

---

> [!example] Question 4 — 15 marks
> ## Absolute Convergence, Conditional Convergence, or Divergence

For each of the following series, determine whether the given series converges absolutely, converges conditionally, or diverges.

**(a)** $\displaystyle\sum_{n=1}^{\infty} \frac{\sqrt{n}}{2n^2 - 1}$

**(b)** $\displaystyle\sum_{n=1}^{\infty} \frac{(-1)^n (\ln n)^{2n}}{n^n}$

**(c)** $\displaystyle\sum_{n=1}^{\infty} n e^{-n^2}$

**(d)** $\displaystyle\sum_{n=2}^{\infty} \frac{(2n)!}{(n!)^2}$

**(e)** $\displaystyle\sum_{n=2}^{\infty} \frac{1}{\sqrt{n^2 + n}\,\ln^2(n^3 + n^2 + n + 1)}$

> [!success]- Solution (Click to expand)
> **(a)** Limit comparison test. Let $a_n = \frac{\sqrt{n}}{2n^2 - 1}$ and $b_n = \frac{\sqrt{n}}{2n^2} = \frac{1}{2n^{3/2}}$. Then
>
> $$ \lim_{n\to\infty} \frac{a_n}{b_n} = \lim_{n\to\infty} \frac{\sqrt{n}}{2n^2 - 1}\left(2n^{3/2}\right) = 1 $$
>
> Since $\sum_{n=1}^{\infty} b_n$ converges ($p$-series with $p > 1$), by the LCT $\sum_{n=1}^{\infty} a_n$ converges too.
>
> **(b)** Root test:
>
> $$ \lim_{n\to\infty} \sqrt[n]{|a_n|} = \lim_{n\to\infty} \frac{(\ln n)^2}{n} = 0 < 1 \quad \text{(by l'Hôpital)} $$
>
> The series converges.
>
> **(c)** Integral test or ratio test:
>
> $$ \lim_{n\to\infty} \left| \frac{a_{n+1}}{a_n} \right| = \lim_{n\to\infty} \left| \frac{(n+1)e^{-(n+1)^2}}{n e^{-n^2}} \right| = \lim_{n\to\infty} \frac{n+1}{n e^{2n+1}} = 0 < 1 $$
>
> So the series converges.
>
> **(d)** Ratio test:
>
> $$
> \begin{aligned}
> \lim_{n\to\infty} \left| \frac{a_{n+1}}{a_n} \right| &= \lim_{n\to\infty} \left| \frac{(2(n+1))!}{((n+1)!)^2} \cdot \frac{(n!)^2}{(2n)!} \right| \\
> &= \lim_{n\to\infty} \left| \frac{(2n+2)(2n+1)(2n)!}{(n+1)^2(n!)^2} \cdot \frac{(n!)^2}{(2n)!} \right| \\
> &= \lim_{n\to\infty} \left| \frac{(2n+2)(2n+1)}{(n+1)^2} \right| = 4 > 1
> \end{aligned}
> $$
>
> So the series diverges.
>
> **(e)** For $n \ge 2$ we have $\sqrt{n^2 + n} \ge n$ and $n^3 + n^2 + n + 1 \ge n$. This implies
>
> $$ \sqrt{n^2 + n}\,\ln^2(n^3 + n^2 + n + 1) \ge n\ln^2(n) \implies \frac{1}{\sqrt{n^2 + n}\,\ln^2(n^3 + n^2 + n + 1)} \le \frac{1}{n\ln^2(n)} $$
>
> Let $f(x) = \frac{1}{x\ln^2(x)}$, which is continuous, positive, and decreasing. Since
>
> $$ \int_2^{\infty} \frac{1}{x\ln^2(x)}\,dx = \lim_{t\to\infty}\left(-\frac{1}{\ln(t)} + \frac{1}{\ln(2)}\right) < \infty $$
>
> the integral test implies $\sum_{n=2}^{\infty} \frac{1}{n\ln^2(n)}$ converges. Therefore the given series converges by the comparison test.

---

> [!example] Question 5 — 12 marks
> ## Interval and Radius of Convergence

Find the interval of convergence and radius of convergence of the power series.

**(a)** $\displaystyle\sum_{n=1}^{\infty} \frac{(-1)^n x^n}{n^2 + 1}$

**(b)** $\displaystyle\sum_{n=0}^{\infty} \frac{(x+2)^n}{(n+1)4^n}$

> [!success]- Solution (Click to expand)
> **(a)** Using the ratio test,
>
> $$ \lim_{n\to\infty} \left| \frac{x^{n+1}}{(n+1)^2 + 1} \cdot \frac{n^2+1}{x^n} \right| = |x| \lim_{n\to\infty} \frac{n^2+1}{(n+1)^2+1} = |x| < 1 \implies -1 < x < 1 $$
>
> The radius of convergence is $R = 1$. Next, check the endpoints.
>
> At $x = -1$ we get $\sum_{n=1}^{\infty} \frac{(-1)^{2n}}{n^2+1} = \sum_{n=1}^{\infty} \frac{1}{n^2+1}$. Since $\frac{1}{n^2+1} < \frac{1}{n^2}$ and $\sum_{n=1}^{\infty} \frac{1}{n^2}$ converges ($p$-series with $p = 2 > 1$), the series converges by the comparison test.
>
> At $x = 1$ we get $\sum_{n=1}^{\infty} \frac{(-1)^n}{n^2+1}$. Since $\frac{1}{n^2+1} \to 0$ as $n \to \infty$ and $\left\{\frac{1}{n^2+1}\right\}$ is decreasing, the series converges by the AST.
>
> Therefore the interval of convergence is $-1 \le x \le 1$.
>
> **(b)** Using the ratio test,
>
> $$ \lim_{n\to\infty} \left| \frac{(x+2)^{n+1}}{(n+2)4^{n+1}} \cdot \frac{(n+1)4^n}{(x+2)^n} \right| = \frac{|x+2|}{4}\lim_{n\to\infty}\frac{n+1}{n+2} = \frac{|x+2|}{4} < 1 \implies |x+2| < 4 \implies -6 < x < 2 $$
>
> Check the endpoints.
>
> At $x = 2$:
>
> $$ \sum_{n=0}^{\infty} \frac{(2+2)^n}{(n+1)4^n} = \sum_{n=0}^{\infty} \frac{4^n}{(n+1)4^n} = \sum_{n=0}^{\infty} \frac{1}{n+1} $$
>
> which diverges by the limit comparison test (compare with the harmonic series).
>
> At $x = -6$:
>
> $$ \sum_{n=0}^{\infty} \frac{(-6+2)^n}{(n+1)4^n} = \sum_{n=0}^{\infty} \frac{(-4)^n}{(n+1)4^n} = \sum_{n=0}^{\infty} \frac{(-1)^n}{n+1} $$
>
> which converges by the alternating series test.
>
> Therefore the interval of convergence is $[-6, 2)$, with radius $R = 4$.

---

> [!example] Question 6 — 14 marks
> ## Maximum Error of a Third-Order Maclaurin Expansion

Determine the maximum possible error of the third-order Maclaurin series (i.e. Taylor series centred at $x_0 = 0$) expansion of $\sin(\sqrt{2}x)$ on the interval $-1/2 < x < 0$.

> [!success]- Solution (Click to expand)
> Let $u = \sqrt{2}x$. Notice that
>
> $$ -\frac{1}{2} < x < 0 \implies -\frac{\sqrt{2}}{2} < u < 0 $$
>
> We have
>
> $$ \sin(u) = u - \frac{u^3}{3!} + R_3(u) \implies \sin(\sqrt{2}x) = \sqrt{2}x - \frac{(\sqrt{2}x)^3}{3!} + R_3(\sqrt{2}x) $$
>
> The maximum possible error is given by Taylor's inequality,
>
> $$ |R_3(u)| \le \frac{K|u|^4}{4!}, \qquad |f^{(4)}(u)| \le K $$
>
> Since $|(\sin u)^{(4)}| = |\sin(u)| \le 1$, we have
>
> $$ |R_3(u)| \le \frac{(\sqrt{2}/2)^4}{4!} = \frac{1}{96} $$
>
> Other reasonable estimates are acceptable. For example, using the fact that sine gives an alternating series,
>
> $$ |\text{error}| \le \max\left|\frac{(\sqrt{2}x)^5}{5!}\right| = \frac{1}{480\sqrt{2}} = \frac{1}{2^{5/2}\,5!} = \frac{\sqrt{2}}{960} $$
>
> Taking four derivatives of $\sin(\sqrt{2}x)$ directly gives $|f^{(4)}(x)| \le 4$ and $R_3(x) \le \frac{4x^4}{4!}$, which is maximal at $x = -1/2$, giving $\max R_3 = 1/96$ again.
>
> Note the question does not ask for the Maclaurin polynomial — full marks for correctly deriving the error alone.

---

> [!example] Question 7 — 12 marks
> ## Limits via Taylor Polynomials

Use Taylor polynomials to evaluate the following limits. For full marks, make appropriate use of Big-O notation.

**(a)** $\displaystyle\lim_{x\to 0} \frac{\sin(x) - x}{x^3}$

**(b)** $\displaystyle\lim_{x\to 0} \left( \frac{1}{x} - \frac{1}{e^x - 1} \right)$

**(c)** $\displaystyle\lim_{x\to 0} \left( \frac{\ln(1+x)}{x^2} - \frac{1}{x} \right)$

> [!success]- Solution (Click to expand)
> **(a)** From the Taylor polynomial at $x_0 = 0$, $\sin(x) = x - \frac{x^3}{3!} + \frac{x^5}{5!} + \cdots$,
>
> $$
> \begin{aligned}
> \lim_{x\to 0} \frac{\sin(x) - x}{x^3} &= \lim_{x\to 0} \frac{\left(x - \frac{x^3}{3!} + \frac{x^5}{5!} + \mathcal{O}(x^7)\right) - x}{x^3} \\
> &= \lim_{x\to 0} \frac{-\frac{x^3}{3!} + \frac{x^5}{5!} + \mathcal{O}(x^7)}{x^3} = \lim_{x\to 0} \left(-\frac{1}{3!} + \frac{x^2}{5!} + \mathcal{O}(x^4)\right) = -\frac{1}{6}
> \end{aligned}
> $$
>
> **(b)** Combining the fractions by cross-multiplication,
>
> $$ \lim_{x\to 0}\left(\frac{1}{x} - \frac{1}{e^x - 1}\right) = \lim_{x\to 0} \frac{(e^x - 1) - x}{x(e^x - 1)} = \lim_{x\to 0} \frac{\frac{x^2}{2!} + \frac{x^3}{3!} + \mathcal{O}(x^4)}{x^2 + \frac{x^3}{2!} + \mathcal{O}(x^4)} = \lim_{x\to 0} \frac{\frac{1}{2!} + \frac{x}{3!} + \mathcal{O}(x^2)}{1 + \frac{x}{2!} + \mathcal{O}(x^2)} = \frac{1}{2} $$
>
> **(c)** Combining the fractions by cross-multiplication,
>
> $$
> \begin{aligned}
> \lim_{x\to 0} \frac{\ln(1+x) - x}{x^2} &= \lim_{x\to 0} \frac{\left(x - \frac{x^2}{2} + \frac{x^3}{3} + \mathcal{O}(x^4)\right) - x}{x^2} \\
> &= \lim_{x\to 0} \frac{-\frac{x^2}{2} + \frac{x^3}{3} + \mathcal{O}(x^4)}{x^2} = \lim_{x\to 0}\left(-\frac{1}{2} + \frac{x}{3} + \mathcal{O}(x^2)\right) = -\frac{1}{2}
> \end{aligned}
> $$

---

> [!example] Question 8
> ## Power-Series Solution of a Differential Equation

Consider the initial value problem

$$ xy''(x) + 2y'(x) + xy(x) = 0, \qquad y(0) = 1, \qquad y'(0) = 0 $$

Suppose that the solution can be represented as a power series with a radius of convergence $R > 0$,

$$ y(x) = \sum_{n=0}^{\infty} c_n x^n $$

**(a)** Use the differential equation and initial conditions to determine the coefficients $c_0, c_1, c_2, c_3$, and $c_4$. Use these to write down the $4^{\text{th}}$-order Taylor polynomial $P_{4,0}(x)$.

**(b)** The pattern of the coefficients should be familiar. Write down the solution in closed form by recognizing the function your series represents. What is the smallest positive value of $x$ where $y(x) = 0$?

> [!success]- Solution (Click to expand)
> **(a)** Let $y(x) = c_0 + c_1x + c_2x^2 + c_3x^3 + c_4x^4$, so that $y'(x) = c_1 + 2c_2x + 3c_3x^2 + 4c_4x^3$. Using the initial conditions,
>
> $$ y(0) = 1 \implies c_0 = 1, \qquad y'(0) = 0 \implies c_1 = 0 $$
>
> So we have
>
> $$
> \begin{aligned}
> y(x) &= 1 + c_2x^2 + c_3x^3 + c_4x^4 \\
> y'(x) &= 2c_2x + 3c_3x^2 + 4c_4x^3 \\
> y''(x) &= 2c_2 + 6c_3x + 12c_4x^2
> \end{aligned}
> $$
>
> Substituting $y(x)$, $y'(x)$, and $y''(x)$ into the differential equation,
>
> $$ x\left(2c_2 + 6c_3x + 12c_4x^2\right) + 2\left(2c_2x + 3c_3x^2 + 4c_4x^3\right) + x\left(1 + c_2x^2 + c_3x^3 + c_4x^4\right) = 0 $$
>
> Matching powers of $x$ gives
>
> $$ 6c_2 + 1 = 0 \implies c_2 = -\frac{1}{6} = -\frac{1}{3!} $$
>
> $$ 12c_3 = 0 \implies c_3 = 0 $$
>
> $$ 20c_4 + c_2 = 0 \implies c_4 = -\frac{c_2}{20} = \frac{1}{5!} $$
>
> $$ P_{4,0}(x) = 1 - \frac{x^2}{3!} + \frac{x^4}{5!} $$
>
> **(b)** The coefficients match those of $\frac{\sin(x)}{x}$:
>
> $$ y(x) = \begin{cases} \dfrac{\sin(x)}{x}, & x \neq 0 \\[4pt] 1, & x = 0 \end{cases} $$
>
> The first positive root is $x^* = \pi$.
