


## Info: Integral Test

## Hint: Error Bound for Evaluation

Similar to [[17 - Taylor Polynomial and Series]], for this converging and decreasing integral, we know the ceiling of the upper bound is: $$
\left|S-S_n\right| \leq \int_{n}^{} f(x) \ dx
$$

## Info: P-Series Test

$$
\sum_{k=1}^{\infty} \frac{1}{k^p}
$$
The p-series converges when $p > 1$ and diverges when $p \leq 1$. 

This is proven using the **integral test**: 
$$
\int_1^{\infty} \frac{1}{x^p} \ dx = \frac{1}{1-p} \ x^{1-p} \mid^{x=\infty}_{x=1} = \frac{1}{1-p}(0-1) = \begin{cases}\begin{aligned}
\infty & \quad (p \leq 1) \\
\in R & \quad (p > 1)
\end{aligned}\end{cases}
$$


## Theorem: Comparison Test

For two **positive** series $\sum a_k, \ \sum b_k \quad (a_k, b_k > 0)$, then: $$
\begin{aligned}
(\forall k: a_k < b_k) \  \land \  (\sum_{k=1}^{\infty}a_k \ \text{converges}) \implies & \sum_{k=1}^{\infty}b_k \ \text{converges} \\
(\forall k: a_k > b_k) \  \land \  (\sum_{k=1}^{\infty}a_k \ \text{diverges}) \implies & \sum_{k=1}^{\infty}b_k \ \text{diverges}
\end{aligned}
$$

Extending further, if the ratio is a constant at limit for any two series $\sum a_k, \ \sum b_k$: $$
\lim_{k \rightarrow \infty} a_k = L b_k \quad (L\neq 0)
$$ then they converge and diverge at the same time: $$
\sum_{k=1}^{\infty} a_k \text{ converges } \iff \sum_{k=1}^{\infty} b_k
$$

## Definition: Alternating Series

A series that alternates between positive and negative is called an **alternating series** and can be written as: $$
$$


## Examples

#### Integral Test Example
$$
S = \sum_{1}^{\infty}\frac{e^{1/n}}{n^2}
$$Prove whether this converges or diverges. And how many terms we need to evaluate to make sure the error is within $e^{1/100}-1$.  

**Solution:**

Use the integral test, let $f(x) = \frac{e^{1/x}}{x^2}$, we write: $$
\int_{1}^{\infty} \frac{e^{1/x}}{x^2} \ dx = - e^{1/x} \mid^{x=\infty}_{x=1} = 1-e \quad \text{(converges)}
$$
Therefore, $S$ also **converges**.

For error, $$
\left| S - S_N \right| \leq \int_{N}^{\infty}f(x) \ dx
$$

#### Comparison Test Example

$$
\sum_{n=1}^{\infty} \frac{n^3-n}{n^4+7}
$$
#### Limit Comparison Test Example
$$
\sum_{n=2}^{\infty} \frac{(\ln{n})^3}{\sqrt{n}}
$$



