> [!quote] Definition
> ## The Problem

We want to interpret a relationship given sample data points $\{(x_0,y_0), \ (x_1,y_1) \ ... \ (x_n, y_n)\}$ using a $n$ degree polynomial:
$$
P(x) = c_0 + c_1 x_1 + c_2 x_2^2 + ... + c_nx_n^n
$$
such that the polynomial goes through all of the points.
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


---

> [!fact] Method
> ## Newton's Equation
> For evenly spaced points
#### <u>1D Polynomial Fit</u>

Consider the case of fitting two points $(x_0, y_0), (x_1, y_1)$ by a polynomial of degree 1, we write the expression as:$$
P(x) = a_0 + a_1(x-x_0)
$$ 
- Force it through $(x_0, y_0)$: $$
	y_0 = P(x_0) = a_0 + a_1 (x_0-x_0)\implies a_0 = y_0$$ 
- Force it through $(x_1, y_1)$: $$
	a_1 = P(x_1) = a_0 + a_1(x_1-x_0) \implies a_1= \frac{y_1-y_0}{x_1-x_0} = \frac{\Delta y}{\Delta x}$$
Therefore:
$$
P(x) = y_0 + \frac{\Delta y_0}{\Delta x}(x-x_0)
$$

#### <u>2D Polynomial (Quadratic) Fit</u>

Extending to an addition point $(x_2, y_2)$ and introducing another term: $$
P(x) = y_0+\frac{\Delta y_0}{\Delta x}(x-x_0) + \mathbf{a_2(x-x_0)(x-x_1)}
$$
Note that when $x = x_0$ or $x=x_1$, the additional term is 0. So it still passes through $(x_0, y_0), (x_1, y_1)$ as before, additionally:
- Force it through $(x_2, y_2)$:$$
	y_2 = y_0 + \frac{\Delta y_0}{\Delta x}(x_2-x_0) + a_2(x_2-x_0)(x_2-x_1)$$
Simplify, given that points are evenly spaced:$$\begin{aligned}
y_2 &=y_0+\frac{y_1-y_0}{\Delta x}(2 \Delta x) + a_2 (2 \Delta x) (\Delta x) \\
y_2&= y_0 + 2 (y_1-y_0) + 2a_2(\Delta x)^2 \\
y_2 - y_0 - 2y_1 + 2y_0 &= 2a_2(\Delta x)^2 \\
(y_2-y_1)-(y_1-y_0) &= 2a_2(\Delta x)^2 \\
a_2 &= \frac{1}{2}\frac{\Delta^2y_0}{(\Delta x)^2}
\end{aligned}$$
Therefore:$$
P(x) = y_0 + \frac{\Delta y_0}{\Delta x}(x_2-x_0) + \frac{1}{2}\frac{\Delta^2y_0}{(\Delta x)^2}(x_2-x_0)(x_2-x_1)
$$
#### <u>Extending to n dimensions</u>

For the n-th power term the additional expression is:$$
\frac{\Delta^n y_0}{n! \times (\Delta x)^n}
$$ And crucially: *it does not change that the functions passes through $n-1$ sample points*. 
Therefore the expression is: $$
P= y_0 + \frac{\Delta y_0}{\Delta x}(x-x_0) + \frac{\Delta^2y_0}{2(\Delta x)^2}(x-x_0)(x-x_1) + ... + \frac{\Delta^ny_0}{n!h^n}(x-x_0)...(x-x_{n-1})
$$
![[16.2 - Newtons Method|100%]]

> [!fact] Method
> ## Lagrange Interpolation Formula

TODO: write this part.