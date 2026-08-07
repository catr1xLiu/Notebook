## MATH 119 – Formula Sheet

(you may detach this page)

## Change of Variable Formula:

If x = x(u, v, w), y = y(u, v, w) and z = z(u, v, w), then

$$\int_{R_{xyz}} f(x,y,z) dx dy dz = \int_{R_{uvw}} f\left(x(u,v,w), y(u,v,w), z(u,v,w)\right) \left| \frac{\partial(x,y,z)}{\partial(u,v,w)} \right| du dv dw$$

where  $R_{uvw}$  is the image of the original domain  $R_{xyz}$  in the uvw-coordinate system, and

$$J = \frac{\partial(x, y, z)}{\partial(u, v, w)} = \det \begin{vmatrix} x_u & x_v & x_w \\ y_u & y_v & y_w \\ z_u & z_v & z_w \end{vmatrix}$$

is called the Jacobian of the transformation. Some special cases:

- Cylindrical Coordinates:  $x = r \cos \theta$ ,  $y = r \sin \theta$ , z = z and J = r.
- Spherical Coordinates:  $x = r \sin \phi \cos \theta$ ,  $y = r \sin \phi \sin \theta$ ,  $z = r \cos \phi$  and  $J = r^2 \sin \phi$ .

## MATH 119 – Formula Sheet

(you may detach this page)

Convergence Tests:

- 1. Divergence Test: If lim<sup>n</sup>→∞ <sup>a</sup><sup>n</sup> <sup>6</sup>= 0 (or does not exist), then <sup>X</sup><sup>∞</sup> n=0 a<sup>n</sup> diverges.
- 2. Geometric Series: <sup>X</sup><sup>∞</sup> n=0 x <sup>n</sup> = 1 1 − x if, and only if, |x| < 1.
- 3. Integral Test: Suppose that f(x) is a continuous, positive, decreasing function for <sup>x</sup> <sup>∈</sup> [1,∞) such that <sup>f</sup>(n) = <sup>a</sup><sup>n</sup> for every positive integer <sup>n</sup>. Then the series <sup>X</sup><sup>∞</sup> n=1 an converges if, and only if, the improper integral <sup>Z</sup> <sup>∞</sup> 1 f(x) dx converges.
- 4. P-Series: The series <sup>X</sup><sup>∞</sup> n=1 1 np converges if, and only if, p > 1.
- 5. Comparison Test: Suppose that <sup>P</sup><sup>∞</sup> n=0 <sup>a</sup><sup>n</sup> and <sup>P</sup><sup>∞</sup> n=0 b<sup>n</sup> are series with positive terms, then
  - (a) If <sup>X</sup><sup>∞</sup> n=0 <sup>b</sup><sup>n</sup> converges and <sup>a</sup><sup>n</sup> <sup>≤</sup> <sup>b</sup><sup>n</sup> for all <sup>n</sup> sufficiently large, then <sup>X</sup><sup>∞</sup> n=0 a<sup>n</sup> converges.
  - (b) If <sup>X</sup><sup>∞</sup> n=0 <sup>b</sup><sup>n</sup> diverges and <sup>a</sup><sup>n</sup> <sup>≥</sup> <sup>b</sup><sup>n</sup> for all <sup>n</sup> sufficiently large, then <sup>X</sup><sup>∞</sup> n=0 a<sup>n</sup> diverges.
- 6. Limit Comparison Test: Suppose that <sup>P</sup><sup>∞</sup> n=0 <sup>a</sup><sup>n</sup> and <sup>P</sup><sup>∞</sup> n=0 b<sup>n</sup> are series with positive terms, then if

$$\lim_{n \to \infty} \frac{a_n}{b_n} = L \quad \text{ with } \quad 0 < L < \infty$$

then either both series converge or both series diverge.

7. Alternating Series Test: The alternating series

$$\sum_{n=0}^{\infty} (-1)^n b_n \quad \text{where} \quad b_n > 0$$

converges if the sequence {bn} satisfies the two conditions,

- (a) lim<sup>n</sup>→∞ b<sup>n</sup> = 0
- (b) bn+1 ≤ b<sup>n</sup> for all n sufficiently large.

Error Estimate: For a convergent alternating series with sum S = X<sup>∞</sup> n=0 (−1)<sup>n</sup> bn, the partial sum S<sup>N</sup> = X N n=0 (−1)<sup>n</sup> b<sup>n</sup> incurs the error |S − S<sup>N</sup> | ≤ bN+1.

## MATH 119 – Formula Sheet

(you may detach this page)

8. Ratio Test: Given the series  $\sum_{n=0}^{\infty} a_n$ , suppose that  $\lim_{n\to\infty} \left| \frac{a_{n+1}}{a_n} \right| = L$ . Then if

- (a) L < 1, the series converges absolutely.
- (b) L > 1 (or if the limit is infinite), the series diverges.
- (c) L=1, the test gives no conclusion.

9. Root Test: Given the series  $\sum_{n=0}^{\infty} a_n$ , suppose that  $\lim_{n\to\infty} \sqrt[n]{|a_n|} = L$ . Then if

- (a) L < 1, the series converges absolutely.
- (b) L > 1 (or if the limit is infinite), the series diverges.
- (c) L=1, the test gives no conclusion.

10. Binomial Series: 
$$(1+x)^r = \sum_{n=0}^{\infty} \binom{r}{n} x^n = 1 + rx + \frac{r(r-1)x^2}{2!} + \cdots$$
, for  $|x| < 1$ 

Integration Formulas:

$$\int dx = x + C \qquad \qquad \int e^x dx = e^x + C$$

$$\int x^n dx = \frac{x^{n+1}}{n+1} + C \text{ (for } n \neq -1) \qquad \qquad \int \frac{1}{x} dx = \ln|x| + C$$

$$\int \sin x dx = -\cos x + C \qquad \qquad \int \cos x dx = \sin x + C$$

$$\int \sec^2 x dx = \tan x + C \qquad \qquad \int \csc^2 x dx = -\cot + C$$

$$\int \sec x \tan x dx = \sec x + C \qquad \qquad \int \csc x \cot x dx = -\csc x + C$$

$$\int \sec x dx = \ln|\sec x + \tan x| + C \qquad \int \csc x dx = -\ln|\csc x + \cot x| + C$$

$$\int \frac{dx}{a^2 + x^2} = \frac{1}{a} \tan^{-1} \left(\frac{x}{a}\right) + C \qquad \qquad \int \frac{dx}{\sqrt{a^2 - x^2}} = \sin^{-1} \left(\frac{x}{a}\right) + C$$

Frequently-needed identities:

$$\sin^2 \theta + \cos^2 \theta = 1$$

$$\tan^2 \theta + 1 = \sec^2 \theta$$

$$\sin(x+y) = \sin x \cos y + \cos x \sin y$$

$$\cos(x+y) = \cos x \cos y - \sin x \sin y$$

$$\sin^2 \theta = \frac{1}{2} (1 - \cos 2\theta)$$

$$\cos^2 \theta = \frac{1}{2} (1 + \cos 2\theta)$$

Special Angles:

|        | 0 | $\pi/6$      | $\pi/4$      | $\pi/3$      | $\pi/2$ | $\pi$ | $3\pi/2$ |
|--------|---|--------------|--------------|--------------|---------|-------|----------|
| sine   | 0 | 1/2          | $\sqrt{2}/2$ | $\sqrt{3}/2$ | 1       | 0     | -1       |
| cosine | 1 | $\sqrt{3}/2$ | $\sqrt{2}/2$ | 1/2          | 0       | -1    | 0        |