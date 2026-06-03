
## Unconstrained Optimizations

## Constrained Optimizations

#### The Method of Lagrange. 

![[5.1 - Constrained Optimization|80%]]
To find critical points for a function $f(x, y)$ subject to constrain $g(x,y) = K$, where $f(x,y) \in R$ and $K$ is a constant. We solve for:

$$
\nabla f = \lambda \nabla g \ \text{ and } \ g(x,y)=K 
$$
where $\lambda$ is called the **Lagrange constant**, or:
$$
\nabla g = \vec{0} \ \text{}
$$

#### Extending to Higher Dimensions

This method can be extended to function of more than 2 constrains, such as finding maximum and minimum for function $f(x, y, z)$ subject to the constrains $g_1(x, y, z) = K_1, \ g_2(x,y,z) = K_2$


## Example 1

Determine the maximum and minimum values of $f(x,y) = x^2+2y^2$ on the circle $x^2+y^2=1$.

- **Step 1**: we find the gradient field $\nabla f(x,y) = (2x, 4y)$, $\nabla g(x,y)=(2x, 2y)$. Let $(2x, 4y) = \lambda (2x, 2y)$ we get: 
	$$
	\begin{cases}
	x=1, \ y=0 \ \lambda=
	\end{cases}
	$$

## Example 2

Determine the maximum and minimum values of $f(x,y) = x^2+2y^2$, $x^2+y^2 \leq 1$.

#### Hint: 
For problems like this, we consider interior (non-equality) and boundary (equality) as two cases.

- **For interior points**: we let $\nabla f = 0$, solve for $(x,y)=(0,0)$. Obviously this satisfies the constrain $x^2+y^2 \leq  1$
- **For boundary**: we let $\nabla f = \lambda \nabla g \ \text{and} \ g(x,y) = 1$. solve$$
	\begin{cases}
	2x = 2\lambda x \\
	4y = 2 \lambda y \\
	x^2+y^2 = 1
	\end{cases}$$we get: $(x,y) = \{(0, \pm1), (\pm1,0)\}$ 
- Now Consider all solutions: $$
	\begin{cases}
	f(0, \pm1) = 2 \\
	f(\pm1, 0) = 1 \\
	f(0, 0) = 0
	\end{cases}$$We conclude that the minimum is 0 and maximum is 2. 