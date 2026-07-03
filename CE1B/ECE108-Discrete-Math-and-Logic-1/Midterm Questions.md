

> [!example] **Question 1**
> 

Consider the following bijection:
$$
f: \mathbb{Z}_0^+ \rightarrow \mathbb{Z}
$$
$$
f(x) = (-1)^x \lceil x/2 \rceil \quad (\lceil\rceil \text{is the ceiling function})
$$
Propose a different bijection $\mathbb{Z}_0^+ \rightarrow \mathbb{Z}$, prove it is a bijection.

> [!success]- Solution

We construct $g: \mathbb{Z}_0^+ \rightarrow \mathbb{Z}$ as:
$$
g(x) = -\cos(\pi x)\lceil x/2 \rceil
$$

**Prove injective**: Let $\forall a, b \in \mathbb{Z}_0^+ \quad a \neq b$ 
- If $\lceil a/2 \rceil = \lceil b/2 \rceil$
	Then, $|a-b| = 1$.
	Thus $-\cos(\pi a) = -(-\cos(\pi b))$
	$g(a)\neq g(b)$
- Otherwise, $\lceil a/2 \rceil \neq \lceil b/2 \rceil$
	Since $|\cos(\pi a)| = |\cos(\pi b)| = 1$
	$|-\cos(\pi a)\lceil a/2 \rceil| \neq |-\cos(\pi b)\lceil b/2 \rceil|$, or $|g(a)| \neq |g(b)|$ 
	Therefore, $g(a) \neq g(b)$.

Therefore, $\forall a,b \in \mathbb{Z}_0^+, a \neq b \implies g(a)\neq g(b)$, we conclude that $g$ is *injective.

**Prove Surjective**: Let $\forall y \in \mathbb{Z}$
- If $y<0$, we have $\exists x \in \mathbb{Z}_0^+, x = |2y|$ such that $$
	g(x) = -\cos(2 \pi y) \lceil-y\rceil] = y$$
- If $y > 0$, we have $\exists x \in \mathbb{Z}_0^+, x = 2y-1$ such that $$
	g(x) = -cos(2 \pi y - \pi) \lceil y-\frac{1}{2}\rceil = y$$
- If $y=0$, we have $x = 0$ such that $g(0)=0$

Therefore, for $\forall y \in \mathbb{Z}$ there is $\exists x \in \mathbb{Z}_0^+$ that $g(x) = y$, we conclude that $g$ is *surjective*

**Final Statement**
Since $g: \mathbb{Z}_0^+ \rightarrow \mathbb{Z}$ is both injective and surjective, it is a bijection. We also show that since $f(1) = -1$ and $g(1) = 1$, $f$ and $g$ are **not the same function**.


---

> [!example] **Question 2**
> 

Let $\forall n \in \mathbb{N}$, prove:
$$
\sum_{i=1}^{n} i^3 = (\sum_{i=1}^{n}i)^2
$$

> [!success]- Solution


We prove by induction on $n$. We assume that the proposition is true for $n-1$, we will try to show that the proposition is also true for $n$. 
$$
\sum_{i=1}^{n-1} i^3 = (\sum_{i=1}^{n-1}i)^2
$$
Therefore, 
$$
\begin{aligned}
(\sum_{i=1}^{n}i)^2 &= (\sum_{i=1}^{n-1}i + n)^2 = (\sum_{i=1}^{n-1}i)^2 + n^2 + 2n \sum_{i=1}^{n-1}i \\
\tiny\text{{(take assumption in)}}&=\sum_{i=1}^{n-1}i^3 + n^2 + 2n \sum_{i=1}^{n-1}i \\
\tiny\text{{(arithmetic series formula)}} &= \sum_{i=1}^{n-1}i^3 + n^2 + 2n \frac{(1+(n-1)(n-1)}{2} \\
&=\sum_{i=1}^{n-1}i^3 + n^2 + n^3-n^2 = \sum_{i=1}^{n}i^3
\end{aligned}
$$
This proves that
$$
\sum_{i=1}^{n-1}i^3 = (\sum_{1=1}^{n-1}i)^2 \implies \sum_{i=1}^{n}i^3 = (\sum_{1=1}^{n}i)^2
$$
We observe that for the base case $n=1$, 
$$\sum_{i=1}^{1}i^3 = (\sum_{i=1}^{1}i)^2$$
So by induction, we conclude that:
$$
\forall n \in \mathbb{N} \quad\sum_{i=1}^{n} i^3 = (\sum_{i=1}^{n}i)^2
$$
