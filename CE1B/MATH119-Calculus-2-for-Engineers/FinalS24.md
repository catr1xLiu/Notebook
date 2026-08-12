# MATH 119 Final Exam — Spring 2024

Transcribed from [[M119S24ExamSolns]] (`sources/M119S24ExamSolns.pdf`).
Each question shows only the statement; the official solution is folded underneath.
The per-step mark allocations from the marking scheme have been dropped; only the total for each question is kept.

---

> [!example] Question 1 — 15 marks
> ## Average Temperature in a Rectangular Box

The temperature inside a volume $C$ is given by $T(x,y,z) = 20 + xz + x\sin(y)$.
If the volume $C$ is a rectangular box with $x \in [0,10]$, $y \in [0,10\pi]$, $z \in [0,2]$, find the average value of the temperature $T_{\text{avg}}$,

$$ T_{\text{avg}} = \frac{1}{\text{Volume}(C)} \iiint_C T(x,y,z)\,dV $$

> [!success]- Solution (Click to expand)
> Firstly, compute the volume of the domain. Because the domain is a rectangular prism, the volume is the product of the lengths of its sides,
>
> $$ \text{Volume}(C) = 10 \cdot 10\pi \cdot 2 = 200\pi $$
>
> It remains to evaluate the triple integral. The easiest choice of integration order is to pick the innermost integral to be over $y$,
>
> $$
> \begin{aligned}
> \iiint_C T(x,y,z)\,dV &= \int_0^{10} \int_0^{2} \int_0^{10\pi} \big(20 + xz + x\sin(y)\big)\,dy\,dz\,dx \\
> &= \int_0^{10} \int_0^{2} \left[(20 + xz)y - x\cos(y)\right]_0^{10\pi} dz\,dx \\
> &= 10\pi \int_0^{10} \int_0^{2} (20 + xz)\,dz\,dx \\
> &= 10\pi \int_0^{10} \left[z\left(20 + \frac{xz}{2}\right)\right]_0^{2} dx \\
> &= 20\pi \int_0^{10} (20 + x)\,dx \\
> &= 200\pi \cdot 25 = 5000\pi
> \end{aligned}
> $$
>
> Finally, substituting the volume and the evaluated integral,
>
> $$ T_{\text{avg}} = \frac{1}{200\pi}\cdot 200\pi \cdot 25 = 25 $$

---

> [!example] Question 2 — 15 marks
> ## Change of Variables on a Diamond Region

Consider the region $\mathcal{R}$ determined by the inequality $|x| + |y| \le 1$.

**(a)** Sketch the domain $\mathcal{R}$ in the $xy$-plane.

**(b)** Make the change of variables $u = x + y$, $v = y - x$ to show that

$$ \iint_{\mathcal{R}} f(x+y)\,dx\,dy = \int_{-1}^{1} f(u)\,du $$

**(c)** Evaluate $\displaystyle\iint_{\mathcal{R}} (x+y)e^{-(x+y)^2}\,dx\,dy$.

> [!success]- Solution (Click to expand)
> **(a)** The region is the square with vertices $(\pm 1, 0)$ and $(0, \pm 1)$:
>
> ![[CE1B/MATH119-Calculus-2-for-Engineers/sources/M119S24ExamSolns/_page_1_Figure_3.jpeg|50%]]
>
> **(b)** The transformed variables are $x = \frac{1}{2}(u+v)$ and $y = \frac{1}{2}(u-v)$; the Jacobian of the transformation is
>
> $$ J = \begin{vmatrix} \frac{1}{2} & \frac{1}{2} \\ \frac{1}{2} & -\frac{1}{2} \end{vmatrix} = \frac{1}{2} $$
>
> and the region of integration is converted to a square in $uv$-space, $u \in (-1,1)$, $v \in (-1,1)$:
>
> ![[CE1B/MATH119-Calculus-2-for-Engineers/sources/M119S24ExamSolns/_page_1_Picture_10.jpeg|50%]]
>
> Consequently the integral is transformed as
>
> $$ \iint_{\mathcal{R}} f(x+y)\,dx\,dy = \int_{-1}^{1}\int_{-1}^{1} f(u)\,\frac{1}{2}\,dv\,du $$
>
> The integral with respect to $v$ cancels the $\frac{1}{2}$ from the Jacobian,
>
> $$ \iint_{\mathcal{R}} f(x+y)\,dx\,dy = \left[\int_{-1}^{1} f(u)\,du\right]\left[\frac{1}{2}\int_{-1}^{1} dv\right] = \int_{-1}^{1} f(u)\,du $$
>
> **(c)** Using part (b),
>
> $$ \iint_{\mathcal{R}} (x+y)e^{-(x+y)^2}\,dx\,dy = \int_{-1}^{1} u e^{-u^2}\,du $$
>
> Either argue that the integrand is odd over a symmetric domain, or integrate directly:
>
> $$ \int_{-1}^{1} u e^{-u^2}\,du = \left[-\frac{1}{2}e^{-u^2}\right]_{-1}^{1} = 0 $$

---

> [!example] Question 3 — 10 marks
> ## Euler's Trick for Extending the Logarithm Series

The Taylor polynomial

$$ \ln(1+x) \approx x - \frac{x^2}{2} + \frac{x^3}{3} + \cdots + \frac{(-1)^{N+1}x^N}{N} $$

provides a decent approximation of $\ln(1+x)$ so long as $x \approx 0$. Euler (1748) found a clever way to extend the domain of applicability.

**(a)** Determine the first two non-zero terms in the Taylor polynomial of $f(x) = \ln\left(\frac{1+x}{1-x}\right)$ by using the properties of logarithms to simplify the quotient.

**(b)** Choose an appropriate value of $x$ in your series from part (a) to find a fraction that approximates the value of $\ln 7$.

> [!success]- Solution (Click to expand)
> **(a)** From the properties of logarithms,
>
> $$ \ln\left(\frac{1+x}{1-x}\right) = \ln(1+x) - \ln(1-x) $$
>
> Replacing the logarithms by their Taylor polynomials, the even powers cancel out,
>
> $$ \ln(1+x) - \ln(1-x) = \left[x - \frac{x^2}{2} + \frac{x^3}{3} - \cdots\right] - \left[-x - \frac{x^2}{2} - \frac{x^3}{3} - \cdots\right] = 2x + \frac{2x^3}{3} + \cdots $$
>
> **(b)** We need $x$ so that
>
> $$ \frac{1+x}{1-x} = 7 \implies x = \frac{3}{4} $$
>
> The first two terms in the series produce the estimate
>
> $$ \ln 7 \approx 2\left(\frac{3}{4}\right) + \frac{2}{3}\left(\frac{3}{4}\right)^3 = \frac{57}{32} $$

**(a)**
$$
f(x) = \ln\left[\frac{1+x}{1-x}\right] = \ln(1+x) - \ln(1-x)
$$
$$
= \left(x - \frac{x^2}{2} + \frac{x^3}{3} + \dots\right) - \left(-x - \frac{x^2}{2} - \frac{x^3}{3} - \dots\right)
$$
$$
= \frac{2}{3} x^3 + \dots
$$

**(b)**
$$
\frac{1+x}{1-x} = 7, \quad 1+x = 7 - 7x, \quad x = \frac{6}{8} = \frac{3}{4} \quad (\text{close to zero})
$$
Using fourth-degree polynomial:
$$
f\left(\frac{3}{4}\right) = \frac{2}{3} x^3 + \dots \approx \frac{2}{3} \cdot \frac{27}{64} \approx \boxed{\frac{9}{32}}
$$

---

> [!example] Question 4 — 10 marks
> ## Classifying Series (CC / AC / D)

For each of the following series, determine whether it is conditionally convergent, absolutely convergent, or divergent. You may simply write CC, AC, or D for brevity.
You do not need to show your work; only the final answer is graded. Scoring: correct $+2$ / blank $0$ / incorrect $-2$ (to a minimum of zero on the question).

**(a)** $\displaystyle\sum_{n=1}^{\infty} (-1)^{n-1}\frac{n!}{e^n}$

**(b)** $\displaystyle\sum_{n=1}^{\infty} (-1)^{n}\frac{n}{\sqrt{n^3+2}}$

**(c)** $\displaystyle\sum_{n=1}^{\infty} (-1)^{n+1}\frac{n^2 2^n}{n!}$

**(d)** $\displaystyle\sum_{n=1}^{\infty} (-1)^{n}\frac{1}{n^4}$

**(e)** $\displaystyle\sum_{n=2}^{\infty} (-1)^{n}\frac{\sqrt{n}}{\ln n}$

> [!success]- Solution (Click to expand)
> **(a)** Diverges.
> **(b)** Converges conditionally.
> **(c)** Converges absolutely.
> **(d)** Converges absolutely.
> **(e)** Diverges.

**Question 4**

**(a)**
$$
\lim_{n\to\infty} \left| \frac{a_{n+1}}{a_n} \right| = \lim_{n\to\infty} \frac{(n+1)!}{e^{n+1}} \cdot \frac{e^n}{n!} = \lim_{n\to\infty} \frac{n+1}{e} = +\infty \neq 0
$$
So the series is **Divergent** by divergence test.

**(b)**
$$
\lim_{n\to\infty} \frac{n}{\sqrt{n^3+2}} = \frac{n}{n^{3/2}} = \frac{1}{n^{1/2}}
$$
The series is **Conditionally Convergent** by p-series test and AST.

**(c)**
$$ \begin{aligned}
L &= \lim_{n\to\infty} \left| \frac{a_{n+1}}{a_n} \right| \\
&= \lim_{n\to\infty} \frac{(n+1)^2 2^{n+1}}{(n+1)!} \cdot \frac{n!}{n^2 2^n} \\
&= \lim_{n\to\infty} \, \left(\frac{n+1}{n}\right)^2 \cdot \frac{n! \, 2^{n+1}}{(n+1)! \, 2^n} \\
&= \lim_{n\to\infty} \, \frac{2}{n+1} \\
& = 0  \\
& \implies L < 1
\end{aligned}$$

The series **Converges Absolutely** by the ratio test.

**(d)**
The series **Converges Absolutely** by p-series test.

**(e)**
$$
\lim_{n \to \infty} \frac{\sqrt{n}}{\ln(n)} = \lim_{n\to\infty} \frac{1/(2\sqrt{n})}{1/n} = \frac{n}{2\sqrt{n}} = +\infty \neq 0
$$
The series **diverges** by the divergence test.

---

> [!example] Question 5 — 15 marks
> ## Limits using Taylor Series and Big-O Notation

Evaluate the following limits using Taylor series and Big-O notation.

**(a)** $\displaystyle\lim_{x\to 0} \frac{2\sin(x) - \sin(2x)}{2e^x - 2 - 2x - x^2}$

**(b)** $\displaystyle\lim_{x\to 1} \frac{\ln(x)}{x^2 - 1}$ *Hint: begin with the substitution $x = 1 + t$.*

**(c)** $\displaystyle\lim_{x\to 0} \frac{1 - e^{x^3}}{x\ln(1-x^2)}$

> [!success]- Solution (Click to expand)
> **(a)** Both the numerator and denominator go to $0$ as $x \to 0$. Consider the Taylor polynomials centred at $x = 0$, with the remainder characterized by Big-O notation,
>
> $$ e^x = 1 + x + \frac{x^2}{2} + \frac{x^3}{3!} + \mathcal{O}(x^4), \qquad \sin(x) = x - \frac{x^3}{3!} + \mathcal{O}(x^5) $$
>
> Replacing them into the limit,
>
> $$
> \begin{aligned}
> \lim_{x\to 0} \frac{2\sin(x) - \sin(2x)}{2e^x - 2 - 2x - x^2}
> &= \lim_{x\to 0} \frac{2x - \frac{x^3}{3} - 2x + \frac{2^3x^3}{3!} + \mathcal{O}(x^5)}{2 + 2x + x^2 + \frac{x^3}{3} - 2 - 2x - x^2 + \mathcal{O}(x^4)} \\
> &= \lim_{x\to 0} \frac{x^3 + \mathcal{O}(x^5)}{\frac{x^3}{3} + \mathcal{O}(x^4)} \\
> &= \lim_{x\to 0} \frac{1 + \mathcal{O}(x^2)}{\frac{1}{3} + \mathcal{O}(x)} = 3
> \end{aligned}
> $$
>
> **(b)** Both the numerator and denominator go to $0$ as $x \to 1$. Perform the substitution $x = 1 + t$, as hinted; $x \to 1$ corresponds to $t \to 0$, and the Taylor polynomial of $\ln(1+t)$ at $t = 0$ is $\ln(1+t) = t + \mathcal{O}(t^2)$. Then
>
> $$ \lim_{x\to 1} \frac{\ln(x)}{x^2-1} = \lim_{t\to 0} \frac{\ln(1+t)}{(1+t)^2 - 1} = \lim_{t\to 0} \frac{t + \mathcal{O}(t^2)}{2t + t^2} = \lim_{t\to 0} \frac{1 + \mathcal{O}(t)}{2 + t} = \frac{1}{2} $$
>
> **(c)** The Maclaurin series are $e^u = 1 + u + \frac{u^2}{2} + \mathcal{O}(u^3)$ and $\ln(1+u) = u - \frac{u^2}{2} + \mathcal{O}(u^3)$, so that
>
> $$ 1 - e^{x^3} = -x^3 - \frac{x^6}{2} + \mathcal{O}(x^9), \qquad x\ln(1-x^2) = -x^3 - \frac{x^5}{2} + \mathcal{O}(x^7) $$
>
> With substitution into the limit,
>
> $$ \lim_{x\to 0} \frac{1 - e^{x^3}}{x\ln(1-x^2)} = \lim_{x\to 0} \frac{-x^3 - \frac{x^6}{2} + \mathcal{O}(x^9)}{-x^3 - \frac{x^5}{2} + \mathcal{O}(x^7)} = 1 $$

**Question 5**

**(a)**
$$
\sin(x) = \sum_{n=0}^{\infty} \frac{x^{2n+1}}{(2n+1)!} (-1)^n = x - \frac{x^3}{3!} + \frac{x^5}{5!} + \dots
$$
$$
e^x = \sum_{n=0}^{\infty} \frac{x^n}{n!} = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + \dots
$$
$$
\sin(2x) = 2x - \frac{2^3}{3!} x^3 + \frac{2^5}{5!} x^5
$$
$$
\begin{aligned}
\lim_{x \to 0} \frac{2\sin(x) - \sin(2x)}{2e^x - 2 - 2x - x^2} &= \lim_{x \to 0} \frac{2x - \frac{2}{3!}x^3 + \frac{2}{5!}x^5 + O(x^7) - \left(2x - \frac{2^3}{3!}x^3 + O(x^5)\right)}{2\left(1 + x + \frac{x^2}{2!} + \frac{x^3}{3!} + O(x^4)\right) - 2 - 2x - x^2} \\
&= \lim_{x \to 0} \frac{\frac{2^3}{3!}x^3 - \frac{2}{3!}x^3 + O(x^5)}{\frac{2}{3!}x^3 + O(x^4)} \\
&= \lim_{x \to 0} \frac{\frac{8}{6}x^3 - \frac{2}{6}x^3 + O(x^5)}{\frac{1}{3}x^3 + O(x^4)} \\
&= \lim_{x \to 0} \frac{x^3 + O(x^5)}{\frac{1}{3}x^3 + O(x^4)} \\
&= \boxed{3}
\end{aligned}
$$

**(b)**
$$
= \lim_{t \to 0} \frac{\ln(1+t)}{(t+1)^2 - 1} = \lim_{t \to 0} \frac{\ln(1+t)}{t^2 + 2t} \quad (x = 1+t)
$$
$$
\ln(1+x) = \sum_{n=1}^{\infty} \frac{x^n}{n} (-1)^{n+1} = x - \frac{x^2}{2} + \frac{x^3}{3} - \frac{x^4}{4} + \dots
$$
$$
\begin{aligned}
&= \lim_{t \to 0} \frac{t - \frac{t^2}{2} + O(t^3)}{t^2 + 2t} = \frac{t}{2t + t^2} - \frac{\frac{t^2}{2}}{2t + t^2} + \frac{O(t^3)}{2t + t^2} \\
&= \frac{1}{2} + 0 + O(t) = \boxed{\frac{1}{2}}
\end{aligned}
$$

**(c)**
$$
e^x = \sum_{n=0}^{\infty} \frac{x^n}{n!} = 1 + x + \frac{x^2}{2!} + \frac{x^3}{3!}
$$
$$
e^{x^3} = 1 + x^3 + \frac{x^6}{2!} + \frac{x^9}{3!} + \dots
$$
$$
\ln(1+x) = \sum_{n=1}^{\infty} \frac{x^n}{n} (-1)^{n+1} = x - \frac{x^2}{2} + \frac{x^3}{3} - \frac{x^4}{4} + \dots
$$
$$
\ln(1-x^2) = -x^2 - \frac{x^4}{2} - \frac{x^6}{3} - \frac{x^8}{4} + \dots
$$
$$
\begin{aligned}
\lim_{x \to 0} \frac{1 - e^{x^3}}{x \ln(1 - x^2)} &= \frac{1 - \left(1 + x^3 + \frac{x^6}{2!} + \frac{x^9}{3!}\right)}{-x^3 - \frac{x^5}{2} - \frac{x^7}{3} - \frac{x^9}{4} + \dots} \\
&= \lim_{x \to 0} \frac{-x^3 + O(x^6)}{-x^3 + O(x^5)} \\
&= \boxed{1}
\end{aligned}
$$

---

> [!example] Question 6 — 15 marks
> ## Shortest Distance by Lagrange Multipliers

Find the shortest distance from the origin $(x,y) = (0,0)$ to the curve $x^2y = 16$ using the method of Lagrange multipliers.

*Hint:* find the points on the constraint curve for which the **square** of the distance, $f(x,y) = x^2 + y^2$, is minimum. These same points minimize the distance from the origin $d(x,y) = \sqrt{x^2+y^2}$.

> [!success]- Solution (Click to expand)
> As indicated by the hint, we find the minima of $f(x,y) = x^2 + y^2$ subject to the constraint $g(x,y) = x^2y = 16$, using the method of Lagrange multipliers.
>
> $$ \vec{\nabla} f = (2x, 2y), \qquad \vec{\nabla} g = (2xy, x^2) $$
>
> Notice $\vec{\nabla} g \neq \vec{0}$ along the constraint curve. The critical points satisfy $\vec{\nabla} f = \lambda \vec{\nabla} g$ and $g(x,y) = 16$, giving the system
>
> $$
> \begin{cases}
> 2x = 2\lambda xy \\
> 2y = \lambda x^2 \\
> x^2 y = 16
> \end{cases}
> $$
>
> The first equation can be rewritten as $2x(\lambda y - 1) = 0$, so either $x = 0$ or $\lambda = 1/y$. However $x = 0$ is inconsistent with $x^2y = 16$, therefore $\lambda = 1/y$. Substituting into $2y = \lambda x^2$ gives $2y^2 = x^2$, so $x = \pm\sqrt{2}y$. Finally, from the constraint,
>
> $$ 16 = x^2 y = 2y^3 \implies y = 2 $$
>
> This leaves two critical points, $(2\sqrt{2}, 2)$ and $(-2\sqrt{2}, 2)$. Since $y = 16/x^2$ is symmetric about $x = 0$, there are two points closest to the origin — exactly these. Evaluating their distance to the origin,
>
> $$ d(2\sqrt{2}, 2) = \sqrt{8+4} = 2\sqrt{3}, \qquad d(-2\sqrt{2}, 2) = \sqrt{8+4} = 2\sqrt{3} $$
>
> Therefore the shortest distance from the curve $x^2y = 16$ to the origin is $2\sqrt{3}$.

**Question 6**

That is to minimize $\sqrt{x^2 + y^2}$, or to minimize $f(x, y) = x^2 + y^2$

Subject to: $x^2 y = 16 = g(x, y)$

$$
\nabla f(x, y) = \langle 2x, 2y \rangle, \quad \nabla g(x, y) = \langle 2xy, x^2 \rangle
$$

Setting up equality using Lagrange multiplier:

$$
\nabla f(x, y) = \lambda \nabla g(x, y) \implies 
\begin{cases}
2x = \lambda \cdot 2xy \\
2y = \lambda x^2 \\
x^2 y = 16
\end{cases}
$$

Let $\lambda y = 1$ 

$$\begin{aligned}
& \lambda = \frac{1}{y} \implies 2 \frac{1}{y} = \lambda x^2 \\
& \implies x^2 = \frac{2}{\lambda} = 2y^2 \implies 2y^3 = 16 \\
& \implies y = 2 \implies \lambda = \frac{1}{2} \\
& \implies x = \pm 2\sqrt{2}
\end{aligned}
$$

Yields points $\langle 2\sqrt{2}, 2 \rangle$ and $\langle -2\sqrt{2}, 2 \rangle$. Calculate: $f(2\sqrt{2}, 2) = 12$, $f(-2\sqrt{2}, 2) = 12$

We know these two critical points yield minimum because the distance between $x^2 y = 16$ curve and origin has no upper bound and no maximum.
So the minimum distance is:
$$
D = \sqrt{f(x, y)} = \boxed{2\sqrt{3}}
$$

---

> [!example] Question 7 — 15 marks
> ## Taylor Polynomial of the Sine Integral

**(a)** Find the $2N+1$ degree Taylor polynomial centred at $x = 0$ of

$$ f(x) = \int_0^x \frac{\sin(t)}{t}\,dt $$

**(b)** Use Taylor's inequality to prove that the error in the Taylor polynomial approximation $P_{2M+1,0}(t)$ for $\sin(t)$ is bounded by

$$ \left| \sin(t) - P_{2M+1,0}(t) \right| \le \frac{|t|^{2M+2}}{(2M+2)!} $$

**(c)** Using the bound from (b) and the integral inequality $\left|\int_0^x g(t)\,dt\right| \le \int_0^x |g(t)|\,dt$, find a bound for the error in approximating $f(x)$ by the Taylor polynomial you found in part (a). For simplicity, assume $x \ge 0$.

> [!success]- Solution (Click to expand)
> **(a)** Substituting the polynomial $\sin(t) = \sum_{m=0}^{M} \frac{(-1)^m t^{2m+1}}{(2m+1)!}$ into the integral,
>
> $$ f(x) = \int_0^x \frac{\sin(t)}{t}\,dt = \int_0^x \sum_{m=0}^{M} (-1)^m \frac{t^{2m}}{(2m+1)!}\,dt = \sum_{m=0}^{M} (-1)^m \frac{x^{2m+1}}{(2m+1)!\,(2m+1)} $$
>
> Choosing $N = M$, this expression is the $2N+1$ degree Taylor polynomial centred at $x = 0$ of $f(x)$.
>
> **(b)** From Taylor's inequality,
>
> $$ |\sin(t) - P_{2M+1,0}(t)| \le K\frac{|t|^{2M+2}}{(2M+2)!} $$
>
> where we need $K$ such that $K \ge \left|\frac{d^{2M+2}}{dz^{2M+2}}\sin(z)\right|$ for $z$ between $0$ and $t$. Because all the derivatives of $\sin(z)$ are $\pm\sin(z)$ or $\pm\cos(z)$, for all $z \in \mathbb{R}$
>
> $$ \left|\frac{d^{2M+2}}{dz^{2M+2}}\sin(z)\right| \le 1 $$
>
> Therefore we can pick $K = 1$, and get
>
> $$ |\sin(t) - P_{2M+1,0}(t)| \le \frac{|t|^{2M+2}}{(2M+2)!} $$
>
> **(c)** Using (a), the error in the approximation can be expressed as
>
> $$
> \begin{aligned}
> |\text{error}| &= \left| f(x) - \sum_{n=0}^{N} (-1)^n \frac{x^{2n+1}}{(2n+1)!\,(2n+1)} \right| \\
> &= \left| \int_0^x \frac{\sin(t)}{t}\,dt - \int_0^x \frac{P_{2N+1,0}(t)}{t}\,dt \right| = \left| \int_0^x \frac{\sin(t) - P_{2N+1,0}(t)}{t}\,dt \right|
> \end{aligned}
> $$
>
> Using the inequality given in the hint and then the result from (b), and because we assume $x \ge 0$ we have $t \in [0,x]$ allowing the replacement $|t| = t$,
>
> $$ |\text{error}| \le \int_0^x \frac{|\sin(t) - P_{2N+1,0}(t)|}{|t|}\,dt \le \int_0^x \frac{t^{2M+1}}{(2M+2)!}\,dt = \frac{x^{2M+2}}{(2M+2)!\,(2M+2)} $$

**(a)**
$$
\sin(t) = \sum_{n=0}^{\infty} (-1)^n \frac{t^{2n+1}}{(2n+1)!} \quad \left(\text{since } \frac{\sin(t)}{t} = \sum_{n=0}^{\infty} (-1)^n \frac{t^{2n}}{(2n+1)!}\right)
$$
$$
f(x) = \int_0^x \frac{\sin(t)}{t} \, dt = \int_0^x \sum_{n=0}^{\infty} (-1)^n \frac{t^{2n}}{(2n+1)!} \, dt = \sum_{n=0}^{\infty} (-1)^n \frac{x^{2n+1}}{(2n+1)!(2n+1)}
$$
$$
T_{2N+1, 0}(x) = \sum_{n=0}^{N} (-1)^n \frac{x^{2n+1}}{(2n+1)!(2n+1)}
$$

**(b)**
$$
\sin(t) = \sum_{n=0}^{M} (-1)^n \frac{t^{2n+1}}{(2n+1)!} + R_{2M+1, 0}(t)
$$

Using Taylor's inequality:
$$
|R_{2M+1, 0}(t)| \le \frac{|t|^{2M+2}}{(2M+2)!} K
$$
where 
$$ K = \max_{\set{\theta \in [0, t]}} \left|\frac{\mathrm{d}^{2M+2}}{\mathrm{d}\theta^{2M+2}} \,  \sin(\theta)\right| = \max_{\set{\theta \in [0, t]}} |\sin(\theta)| = 1$$
Therefore:
$$
|R_{2M+1, 0}(t)| \le \frac{|t|^{2M+2}}{(2M+2)!}
$$

---

> [!example] Question 8
> ## Power-Series Solution of a Differential Equation

Consider the initial value problem

$$ xy''(x) + 2y'(x) + xy(x) = 0, \qquad y(0) = 1, \qquad y'(0) = 0 $$

Suppose that the solution can be represented as a power series with a non-zero radius of convergence,

$$ y(x) = \sum_{n=0}^{\infty} c_n x^n $$

**(a)** Use the differential equation and initial conditions to determine the coefficients $c_0, c_1, c_2, c_3$, and $c_4$. Use these to write down the $4^{\text{th}}$-degree Taylor polynomial $P_{4,0}(x)$.

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
