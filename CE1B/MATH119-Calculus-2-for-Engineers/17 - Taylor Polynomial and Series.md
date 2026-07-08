

## Definition: Taylor Polynomial

The core idea is to find a polynomial that is *nearly equivalent* to our target function $f(x)$ near the point $(a, f(a))$. We achieve this by letting the first $n$ orders of derivatives at that point be the same as the original function. Which is: $$
T_{n,a} = f(a) + f'(a)(x-a) + \frac{1}{2}f''(a)(x-a)^2 + ... + \frac{1}{n!}(f'_n(a)) (x-a)^n
$$
Check that it's $i$'th derivative is: $$
\frac{d^iT}{dx^i} = 0+f'(a) \cdot 0 + \ ... \ + f'_i(a) \cdot 1 + f'_{i+1} \cdot0 + ... = f'_i(a)$$
Written as formal form:$$
T_{n, a} = \sum_{k=0}^{n}\frac{f'_k \cdot a}{k!}(x-a)^k
$$At $a=0$ (*Maclaurin's Polynomial*):$$
T_n = \sum_{k=0}^{n}\frac{f'_k(0)}{k!}x^k
$$
![[10_03_fig_3_upscayl_4x_upscayl-standard-4x.png|80%]]


## Calculating the Error Bound

We try to find an **upper bound** for the error. We first define the remainder (error) term as: $$
f(x) = \underbrace{ \sum_{k=0}^{n} \frac{f^{(k)}(a)}{k!} (x-a)^k }_{\textcolor{purple}{\text{Taylor Polynomial}}} + \underbrace{ R_n(x) }_{\textcolor{blue}{\text{Remaining derivatives}}}
$$
So that $|R_n(x)| = \left|f(x) = T_{n,a}(x)\right|$. From here, a recognition will give us its upper bound. We first find the upper bound of the $n+1$-th derivative of $f$:$$
\left|R_n\right| \leq K
$$
Now, take the $n+1$-th derivative on both sides of our equality: $$
f(x) = T_{n,a}(x) + R_n(x) \implies \frac{d^{n+1}f}{dx^{n+1}} = \frac{d^{n+1}}{dx^{n+1}} T_{n,a}(x) + \frac{d^{n+1}}{dx^{n+1}} R_n(x)
$$
Now observe that: $$
\frac{d^{n+1}}{dx^{n+1}}T_{n,a}(x) = 0 \implies \frac{d^{n+1}}{dx^{n+1}}R_n(x) = f^{(n+1)}(x)
$$
At the chosen point $a$ there is no error: $R_n(a) = 0$

Also, by construction of the Taylor polynomial, with $\forall k \le n$:
$$
\frac{d^k f}{dx^k}(a) = \frac{d^k}{dx^k} T_{n,a}(a) \implies \frac{d^k}{dx^k} R_n(a) = 0
$$

Therefore, we can reconstruct $R_n(x)$ by integrating:
$$
R_n(x) = \underbrace{ \int_a^x \int_a^{t_1} \dots \int_a^{t_n} }_{\text{integrated } n+1 \text{ times}} f^{(n+1)}(t_{n+1}) \, dt_{n+1} \, dt_n \dots dt_2 \, dt_1
$$

Recognize the theorem $\left| \int_a^b f(x) \, dx \right| \le \left| \int_a^b |f(x)| \, dx \right|$ by this illustration:
![[17.1 - Calculus Theorem|100%]]

Which tells us
$$
|R_n(x)| \le \left| \int_a^x \int_a^{t_1} \dots \int_a^{t_n} K \, dt_{n+1} \, dt_n \dots dt_2 \, dt_1 \right|
$$

To evaluate this integral construct a function $L(x)$:
$$
\text{Let } L(x) = K \frac{(x-a)^{n+1}}{(n+1)!}
$$

By construction, $\frac{d^{n+1}}{dx^{n+1}} L(x) = K$, and $L(a) = 0$, $L'(a) = 0$, etc. Hence, $$
\int_a^x \int_a^{t_1} \dots \int_a^{t_n} K \, dt_{n+1} \, dt_n \dots dt_2 \, dt_1 = L(x)
$$
Therefore:$$
|R_n(x)| \le K \frac{|x-a|^{n+1}}{(n+1)!}
$$

## Example Application: Approximating Function Value of Complex Function

For example, if we want an approximation of $\sqrt{e}$ we can use the Taylor polynomial of the function $f(x) = e^x$ at $(a,f(a)) = (0, 1)$. If we choose fourth-degree:
$$
P_{4,0} = 
$$


## Example Application: Evaluating Intractable Integrals

