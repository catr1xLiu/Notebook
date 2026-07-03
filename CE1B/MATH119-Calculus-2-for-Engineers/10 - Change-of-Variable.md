> [!hint] Hint
> ## Thinking Variable Change as Transformation

When we rewrite one scalar field expression to another, we can think of it as applying a transformation $T:\mathbb{R}^n \rightarrow \mathbb{R}^n$. Note that this mapping is one-to-one, or a <u><strong style="color:#dab1da">bijection</strong></u> in the language of [[3.3 - Functions#Special Relationships|ECE 108]].

For example, from polar to Cartesian coordinate system:
$$
x = r \cos{\theta} \quad y = r \sin{\theta}
$$
or any random substitution:
$$
u = xy \quad v = \frac{y}{x}
$$
Both yield a transformation $T:\mathbb{R}^2 \rightarrow \mathbb{R}^2$. In general, $T$ takes a region $G$ in the $uv$-plane and bends it into a region $R$ in the $xy$-plane via $x = g(u,v),\ y = h(u,v)$.

![[15_07_fig_1_upscayl_2x_upscayl-standard-4x.png]]

---

> [!quote] Definition
> ## Jacobian Matrix

The <u><strong style="color:#dab1da">Jacobian matrix</strong></u> $[J]$ is the *[[5.1 - Linear Transformation|linear transformation]]* mapping the delta in the original coordinate frame to the new coordinate frame:
$$
\partial T(\vec{x}) = [J]\, \partial\vec{x}
$$
We can write the expression as:
$$
T: (u, v) \rightarrow (x, y) \quad\quad
[J] = \begin{bmatrix}
\frac{\partial x}{\partial u} & \frac{\partial x}{\partial v} \\
\frac{\partial y}{\partial u} & \frac{\partial y}{\partial v}
\end{bmatrix}
$$
When integrating over area, the <u><strong style="color:#dab1da">determinant</strong></u> of the Jacobian matrix, according to its [[6.1 - Determinants|definition]], is the ratio between the new and old area elements (or volume elements in higher dimensions):
$$
dA_{xy} = |\det[J]|\; dA_{uv}
$$
Geometrically, $T$ sends a small rectangle of sides $\Delta u, \Delta v$ in the $uv$-plane to a curved patch in the $xy$-plane, and $|\det[J]|$ is the *local* factor by which its area is stretched or shrunk.

![[15_07_fig_4_upscayl_2x_upscayl-standard-4x.png]]

---

> [!fact] Formula
> ## Jacobian Function for Integral Evaluation

Summing the area of every stretched cell $R_{ij}$ over a region recovers a Riemann sum, and in the limit the scaling factor $|\det[J]|$ stays inside the integral:

![[15_07_fig_5_upscayl_2x_upscayl-standard-4x.png]]

This gives the <u><strong style="color:#dab1da">change-of-variables formula</strong></u> for a bijection $T:(u,v)\rightarrow(x,y)$ mapping $S$ onto $R$:
$$
\iint_R f(x, y)\; dx\,dy = \iint_S f\big(x(u,v),\, y(u,v)\big)\; |\det[J]|\; du\,dv
$$
The strategy is to pick a substitution that *straightens* an awkward region $R$ into a simple rectangle $S$, as below where the curved boundaries become the constant-$u$ and constant-$v$ edges:

![[15_07_fig_9.png]]

> [!example] Example
> ## Polar Coordinates as a Change of Variables

Verify that the polar substitution $x = r\cos\theta,\ y = r\sin\theta$ recovers $dA = r\,dr\,d\theta$.



> [!success]- Solution (Click to expand)
> For $T:(r,\theta)\rightarrow(x,y)$:
> $$
> [J] = \begin{bmatrix}
> \frac{\partial x}{\partial r} & \frac{\partial x}{\partial \theta} \\
> \frac{\partial y}{\partial r} & \frac{\partial y}{\partial \theta}
> \end{bmatrix}
> = \begin{bmatrix}
> \cos\theta & -r\sin\theta \\
> \sin\theta & r\cos\theta
> \end{bmatrix}
> \quad\Rightarrow\quad
> |\det[J]| = r\cos^2\theta + r\sin^2\theta = r
> $$
> which recovers the familiar $dA = r\,dr\,d\theta$.
