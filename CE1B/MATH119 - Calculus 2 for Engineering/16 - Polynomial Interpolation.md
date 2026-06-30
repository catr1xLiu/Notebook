> [!quote] Definition
> ## The Problem

We want to interpret a relationship given sample data points

![[16.1 - Problem|100%]]

---

> [!info] Approach
> ## Expressing the Relationship

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
