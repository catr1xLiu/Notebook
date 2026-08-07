# MATH 119 — Formula Reference

Everything under [Provided on the Exam](#provided-on-the-exam) is printed on the official formula sheet handed out with the final ([[Math 119-Formula Sheet-Final-1]]).
Everything under [Not Provided](#not-provided) is fair game on the exam but is **not** on the sheet — this is the part that has to be memorized.

---

## Provided on the Exam

### Change of Variables

If $x = x(u,v,w)$, $y = y(u,v,w)$, $z = z(u,v,w)$, then

$$
\iiint_{R_{xyz}} f(x,y,z)\,dx\,dy\,dz = \iiint_{R_{uvw}} f\big(x(u,v,w), y(u,v,w), z(u,v,w)\big) \left| \frac{\partial(x,y,z)}{\partial(u,v,w)} \right| du\,dv\,dw
$$

where $R_{uvw}$ is the image of $R_{xyz}$ in the $uvw$-coordinate system and the **Jacobian** is

$$
J = \frac{\partial(x,y,z)}{\partial(u,v,w)} = \det \begin{bmatrix}
x_u & x_v & x_w \\
y_u & y_v & y_w \\
z_u & z_v & z_w
\end{bmatrix}
$$

Special cases:

- **Cylindrical:** $x = r\cos(\theta)$, $y = r\sin(\theta)$, $z = z$, and $J = r$.
- **Spherical:** $x = r\sin(\phi)\cos(\theta)$, $y = r\sin(\phi)\sin(\theta)$, $z = r\cos(\phi)$, and $J = r^2\sin(\phi)$.

### Convergence Tests

**1. Divergence Test.** If $\lim_{n\to\infty} a_n \neq 0$ (or does not exist), then $\sum_{n=0}^{\infty} a_n$ diverges.

**2. Geometric Series.**

$$ \sum_{n=0}^{\infty} x^n = \frac{1}{1-x} \quad \text{if and only if} \quad |x| < 1 $$

**3. Integral Test.** If $f(x)$ is continuous, positive, and decreasing on $[1,\infty)$ with $f(n) = a_n$ for every positive integer $n$, then $\sum_{n=1}^{\infty} a_n$ converges if and only if $\int_1^{\infty} f(x)\,dx$ converges.

**4. $p$-Series.** $\displaystyle\sum_{n=1}^{\infty} \frac{1}{n^p}$ converges if and only if $p > 1$.

**5. Comparison Test.** For series $\sum_{n=0}^{\infty} a_n$ and $\sum_{n=0}^{\infty} b_n$ with positive terms:

- If $\sum b_n$ converges and $a_n \le b_n$ for all $n$ sufficiently large, then $\sum a_n$ converges.
- If $\sum b_n$ diverges and $a_n \ge b_n$ for all $n$ sufficiently large, then $\sum a_n$ diverges.

**6. Limit Comparison Test.** For series $\sum_{n=0}^{\infty} a_n$ and $\sum_{n=0}^{\infty} b_n$ with positive terms, if

$$ \lim_{n\to\infty} \frac{a_n}{b_n} = L \quad \text{with} \quad 0 < L < \infty $$

then either both series converge or both series diverge.

**7. Alternating Series Test.** The alternating series $\displaystyle\sum_{n=0}^{\infty} (-1)^n b_n$, where $b_n > 0$, converges if

- $\lim_{n\to\infty} b_n = 0$, and
- $b_{n+1} \le b_n$ for all $n$ sufficiently large.

*Error estimate:* for a convergent alternating series with sum $S = \sum_{n=0}^{\infty} (-1)^n b_n$, the partial sum $S_N = \sum_{n=0}^{N} (-1)^n b_n$ incurs an error

$$ |S - S_N| \le b_{N+1} $$

**8. Ratio Test.** Given $\sum_{n=0}^{\infty} a_n$, suppose $\displaystyle\lim_{n\to\infty} \left| \frac{a_{n+1}}{a_n} \right| = L$. Then

- $L < 1$: the series converges absolutely.
- $L > 1$ (or the limit is infinite): the series diverges.
- $L = 1$: no conclusion.

**9. Root Test.** Given $\sum_{n=0}^{\infty} a_n$, suppose $\displaystyle\lim_{n\to\infty} \sqrt[n]{|a_n|} = L$. Then

- $L < 1$: the series converges absolutely.
- $L > 1$ (or the limit is infinite): the series diverges.
- $L = 1$: no conclusion.

**10. Binomial Series.**

$$ (1+x)^r = \sum_{n=0}^{\infty} \binom{r}{n} x^n = 1 + rx + \frac{r(r-1)x^2}{2!} + \cdots, \qquad |x| < 1 $$

### Integration Formulas

$$ \int dx = x + C \qquad \int e^x\,dx = e^x + C $$

$$ \int x^n\,dx = \frac{x^{n+1}}{n+1} + C \ \ (n \neq -1) \qquad \int \frac{1}{x}\,dx = \ln|x| + C $$

$$ \int \sin(x)\,dx = -\cos(x) + C \qquad \int \cos(x)\,dx = \sin(x) + C $$

$$ \int \sec^2(x)\,dx = \tan(x) + C \qquad \int \csc^2(x)\,dx = -\cot(x) + C $$

$$ \int \sec(x)\tan(x)\,dx = \sec(x) + C \qquad \int \csc(x)\cot(x)\,dx = -\csc(x) + C $$

$$ \int \sec(x)\,dx = \ln|\sec(x) + \tan(x)| + C \qquad \int \csc(x)\,dx = -\ln|\csc(x) + \cot(x)| + C $$

$$ \int \frac{dx}{a^2 + x^2} = \frac{1}{a}\tan^{-1}\!\left(\frac{x}{a}\right) + C \qquad \int \frac{dx}{\sqrt{a^2 - x^2}} = \sin^{-1}\!\left(\frac{x}{a}\right) + C $$

### Trigonometric Identities

$$ \sin^2(\theta) + \cos^2(\theta) = 1 \qquad \tan^2(\theta) + 1 = \sec^2(\theta) $$

$$ \sin(x+y) = \sin(x)\cos(y) + \cos(x)\sin(y) \qquad \cos(x+y) = \cos(x)\cos(y) - \sin(x)\sin(y) $$

$$ \sin^2(\theta) = \frac{1}{2}\big(1 - \cos(2\theta)\big) \qquad \cos^2(\theta) = \frac{1}{2}\big(1 + \cos(2\theta)\big) $$

### Special Angles

| | $0$ | $\pi/6$ | $\pi/4$ | $\pi/3$ | $\pi/2$ | $\pi$ | $3\pi/2$ |
| --- | --- | --- | --- | --- | --- | --- | --- |
| $\sin$ | $0$ | $1/2$ | $\sqrt{2}/2$ | $\sqrt{3}/2$ | $1$ | $0$ | $-1$ |
| $\cos$ | $1$ | $\sqrt{3}/2$ | $\sqrt{2}/2$ | $1/2$ | $0$ | $-1$ | $0$ |

---

## Not Provided

### Multiple Integrals

**Polar coordinates** ($xy$-plane): $x = r\cos(\theta)$, $y = r\sin(\theta)$, $dA = r\,dr\,d\theta$.
The same substitution works in the $xz$- or $yz$-plane with the obvious relabelling.

**Cylindrical:** $dV = r\,dz\,dr\,d\theta$, with $r^2 = x^2 + y^2$.

**Spherical:** $dV = r^2\sin(\phi)\,dr\,d\phi\,d\theta$, with $r^2 = x^2 + y^2 + z^2$, $\phi \in [0,\pi]$ measured from the positive $z$-axis, $\theta \in [0,2\pi)$.

**Area and volume:**

$$ \text{Area}(D) = \iint_D dA \qquad \text{Volume}(E) = \iiint_E dV $$

**Average value** of $f$ over a region $E$:

$$ f_{\text{avg}} = \frac{1}{\text{Volume}(E)} \iiint_E f(x,y,z)\,dV $$

**Fubini / order of integration.** For a region between surfaces, integrate the innermost variable between the two bounding surfaces and project the region onto the remaining coordinate plane. Choosing the projection plane that makes the shadow a disc is usually what turns a hard triple integral into a polar one.

### Partial Derivatives and Optimization

**Tangent plane** to $z = f(x,y)$ at $(x_0, y_0)$:

$$ z = f(x_0,y_0) + f_x(x_0,y_0)(x - x_0) + f_y(x_0,y_0)(y - y_0) $$

**Gradient and directional derivative:**

$$ \vec{\nabla} f = (f_x, f_y, f_z) \qquad D_{\hat{u}} f = \vec{\nabla} f \cdot \hat{u} $$

**Chain rule** for $z = f(x,y)$ with $x = x(t)$, $y = y(t)$:

$$ \frac{dz}{dt} = \frac{\partial f}{\partial x}\frac{dx}{dt} + \frac{\partial f}{\partial y}\frac{dy}{dt} $$

**Critical points:** solve $\vec{\nabla} f = \vec{0}$.

**Second Derivative Test.** With $H(x,y) = f_{xx}f_{yy} - f_{xy}^2$ evaluated at a critical point:

- $H > 0$ and $f_{xx} > 0$: local minimum.
- $H > 0$ and $f_{xx} < 0$: local maximum.
- $H < 0$: saddle point.
- $H = 0$: no conclusion.

**Lagrange Multipliers.** To optimize $f$ subject to $g = k$, solve

$$
\begin{cases}
\vec{\nabla} f = \lambda \vec{\nabla} g \\
g(x,y,z) = k
\end{cases}
$$

then compare the values of $f$ at every solution. On a closed bounded region, also check the interior critical points from $\vec{\nabla} f = \vec{0}$.

### Taylor Polynomials and Series

**Taylor polynomial** of degree $N$ centred at $x_0$:

$$ P_{N,x_0}(x) = \sum_{n=0}^{N} \frac{f^{(n)}(x_0)}{n!}(x - x_0)^n $$

A **Maclaurin** polynomial/series is the case $x_0 = 0$.

**Taylor's inequality (remainder bound).** If $|f^{(N+1)}(z)| \le K$ for all $z$ between $x_0$ and $x$, then

$$ |R_{N,x_0}(x)| = |f(x) - P_{N,x_0}(x)| \le \frac{K|x - x_0|^{N+1}}{(N+1)!} $$

For an alternating series the AST error bound (first omitted term) is usually sharper and much faster.

**Big-O.** $f(x) = \mathcal{O}(x^k)$ as $x \to 0$ means $|f(x)| \le C|x|^k$ near $0$. In a limit, expand the numerator and denominator far enough that the lowest surviving power is explicit, then divide through.

**Common Maclaurin series:**

$$ e^x = \sum_{n=0}^{\infty} \frac{x^n}{n!} = 1 + x + \frac{x^2}{2!} + \cdots, \qquad x \in \mathbb{R} $$

$$ \sin(x) = \sum_{n=0}^{\infty} \frac{(-1)^n x^{2n+1}}{(2n+1)!} = x - \frac{x^3}{3!} + \frac{x^5}{5!} - \cdots, \qquad x \in \mathbb{R} $$

$$ \cos(x) = \sum_{n=0}^{\infty} \frac{(-1)^n x^{2n}}{(2n)!} = 1 - \frac{x^2}{2!} + \frac{x^4}{4!} - \cdots, \qquad x \in \mathbb{R} $$

$$ \frac{1}{1-x} = \sum_{n=0}^{\infty} x^n = 1 + x + x^2 + \cdots, \qquad |x| < 1 $$

$$ \ln(1+x) = \sum_{n=1}^{\infty} \frac{(-1)^{n-1} x^n}{n} = x - \frac{x^2}{2} + \frac{x^3}{3} - \cdots, \qquad -1 < x \le 1 $$

$$ \tan^{-1}(x) = \sum_{n=0}^{\infty} \frac{(-1)^n x^{2n+1}}{2n+1} = x - \frac{x^3}{3} + \frac{x^5}{5} - \cdots, \qquad |x| \le 1 $$

**Binomial coefficient** for real $r$:

$$ \binom{r}{n} = \frac{r(r-1)(r-2)\cdots(r-n+1)}{n!}, \qquad \binom{r}{0} = 1 $$

### Power Series

For $\sum_{n=0}^{\infty} c_n (x - x_0)^n$, the **radius of convergence** follows from the ratio (or root) test:

$$ R = \lim_{n\to\infty} \left| \frac{c_n}{c_{n+1}} \right| \qquad \text{equivalently} \qquad \lim_{n\to\infty} \left| \frac{c_{n+1}(x-x_0)^{n+1}}{c_n(x-x_0)^n} \right| < 1 $$

The series converges absolutely for $|x - x_0| < R$ and diverges for $|x - x_0| > R$.
The two endpoints $x = x_0 \pm R$ must **always** be tested separately to get the interval of convergence.

**Term-by-term differentiation and integration** are valid inside the interval of convergence and preserve $R$ (endpoint behaviour may change):

$$ f'(x) = \sum_{n=1}^{\infty} n c_n (x-x_0)^{n-1} \qquad \int f(x)\,dx = C + \sum_{n=0}^{\infty} \frac{c_n}{n+1}(x-x_0)^{n+1} $$

**Substitution and multiplication.** Substituting $u = g(x)$ into a known series is legal wherever $|g(x)|$ lies in the original interval; products of two series are formed by collecting like powers.

**Power-series solution of an ODE.** Write $y(x) = \sum_{n=0}^{\infty} c_n x^n$, take derivatives term-by-term, substitute into the equation, and match coefficients of each power of $x$ to zero; the initial conditions fix $c_0$ and $c_1$.
