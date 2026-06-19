
## Hint: Thinking Variable Change as Transformation

When we rewrite one scaler field expression to another, we can think of it as applying a transformation $T:\mathbb{R^n} \rightarrow \mathbb{R^n}$. Note that this mapping is one-to-one, or **bijection** in the language of [[3.3 - Functions#Special Relationships|ECE 108]].

For example, from polar to Cartesian coordinate system:
$$
x = r \cos{\theta} \quad y=r \sin{\theta}
$$
or any random substitution:
$$
u = xy \quad v = \frac{y}{x}
$$
Both yield transformation $T:\mathbb{R^2} \rightarrow \mathbb{R^2}$. 

## Definition: Jacobian Matrix

**Jacobian matrix** $[J]$ is the *[[5.1 - Linear Transformation|linear transformation]]* mapping the delta in original coordinate frame to new coordinate frame:
$$
\partial T(\vec{x}) = {[J]} \partial\vec{x}
$$
We can write the expression as:
$$
T: (u, v) \rightarrow (x, y) \quad\quad 
[J] = \begin{bmatrix}
\frac{\partial x}{\partial u} & \frac{\partial x}{\partial v} \\
\frac{\partial y}{\partial u} & \frac{\partial y}{\partial v}
\end{bmatrix}
$$
Note when integrating over area, the **determinant** of the Jacobian matrix, according to [[6.1 - Determinants|definition]], is the ratio between the new and old 

<iframe src="file:///home/catr1x/Coding/Notebook/CE1B/MATH119%20-%20Calculus%202%20for%20Engineering/10%20-%20Visuals.html" width="100%" height="600px"></iframe>


## Jacobian Function for Integral Evaluation

