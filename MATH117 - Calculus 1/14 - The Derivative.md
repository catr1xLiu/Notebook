
---

> [!quote] Definition
> ## Instantaneous Rate of Change

The <u><strong style="color:#dab1da">average rate of change</u></strong> of a function $f$ from $x = a$ to $x = b$ is given by:

$$
\frac{f(b) - f(a)}{b - a} = \frac{\Delta f}{\Delta x}
$$

[Insert graph: function curve with secant line from point (a, f(a)) to point (b, f(b))]

- If we assume that the graph of the function is a line on the interval $[a, b]$, then the slope of this line would be the quantity above
- If we choose a very small interval $\Delta x$, then the above assumption becomes more reasonable
- The <u><strong style="color:#dab1da">instantaneous rate of change</u></strong> of $f$ at $x = a$ is the limit of $\frac{\Delta f}{\Delta x}$ as $\Delta x \to 0$

$$
\lim_{\Delta x \to 0} \frac{f(a + \Delta x) - f(a)}{\Delta x} = \lim_{x \to a} \frac{f(x) - f(a)}{x - a}
$$

> [!quote] Definition
> ## Differentiable and Derivative

We say that a function $f$ is <u><strong style="color:#dab1da">differentiable at $a$</u></strong> if the limit

$$
\lim_{h \to 0} \frac{f(a + h) - f(a)}{h}
$$

exists. In this case, we call this value the <u><strong style="color:#dab1da">derivative of $f$ at $a$</u></strong>, denoted by $f'(a)$.

$$
f'(a) = \lim_{h \to 0} \frac{f(a + h) - f(a)}{h} = \lim_{x \to a} \frac{f(x) - f(a)}{x - a}
$$

We also have the notion of the <u><strong style="color:#dab1da">derivative function</u></strong>: $f'(x)$ or $\frac{d}{dx}(f(x))$

> [!quote] Definition
> ## Tangent Line

Suppose that a function $f$ is differentiable at $a$. The <u><strong style="color:#dab1da">tangent line</u></strong> to $y = f(x)$ at $x = a$ is the line passing through the point $(a, f(a))$ with slope $m = f'(a)$.

That is, the tangent line is the line with equation:

$$
y = f(a) + f'(a)(x - a)
$$

> [!example] Example
> ## Computing Derivatives Using the Definition

**Exercise 14.1:**

(a) Use the definition of the derivative to compute $f'(2)$ for $f(x) = \frac{x}{x^2 + 1}$.

(b) Determine an equation for the tangent line to $y = f(x)$ at $x = 2$.

> [!success]- Solution (Click to expand)
> 
> **(a) Finding $f'(2)$:**
> 
> Using the definition:
> $$
> f'(2) = \lim_{h \to 0} \frac{f(2 + h) - f(2)}{h}
> $$
> 
> First, calculate $f(2)$:
> $$
> f(2) = \frac{2}{2^2 + 1} = \frac{2}{5}
> $$
> 
> Next, calculate $f(2 + h)$:
> $$
> f(2 + h) = \frac{2 + h}{(2 + h)^2 + 1}
> $$
> 
> Now compute the difference quotient:
> $$
> \begin{aligned}
> \frac{f(2 + h) - f(2)}{h} &= \frac{1}{h}\left[\frac{2 + h}{(2 + h)^2 + 1} - \frac{2}{5}\right] \\
> &= \frac{1}{h}\left[\frac{5(2 + h) - 2[(2 + h)^2 + 1]}{5[(2 + h)^2 + 1]}\right] \\
> &= \frac{1}{h}\left[\frac{10 + 5h - 2(4 + 4h + h^2 + 1)}{5[(2 + h)^2 + 1]}\right] \\
> &= \frac{1}{h}\left[\frac{10 + 5h - 10 - 8h - 2h^2}{5[(2 + h)^2 + 1]}\right] \\
> &= \frac{-3h - 2h^2}{5h[(2 + h)^2 + 1]} \\
> &= \frac{-3 - 2h}{5[(2 + h)^2 + 1]}
> \end{aligned}
> $$
> 
> Taking the limit as $h \to 0$:
> $$
> f'(2) = \lim_{h \to 0} \frac{-3 - 2h}{5[(2 + h)^2 + 1]} = \frac{-3}{5[4 + 1]} = \frac{-3}{25}
> $$
> 
> **(b) Equation of the tangent line:**
> 
> Using the tangent line formula with $a = 2$, $f(2) = \frac{2}{5}$, and $f'(2) = -\frac{3}{25}$:
> $$
> y = f(2) + f'(2)(x - 2) = \frac{2}{5} - \frac{3}{25}(x - 2)
> $$
> 
> Simplifying:
> $$
> y = \frac{10}{25} - \frac{3}{25}(x - 2) = \frac{10 - 3x + 6}{25} = \frac{16 - 3x}{25}
> $$

> [!example] Example
> ## Continuity vs Differentiability

**Exercise 14.2:** Determine whether the function $g(x) = \frac{1}{1 + |x - 1|}$ is:

(a) continuous at $x = 1$.

(b) differentiable at $x = 1$.

> [!success]- Solution (Click to expand)
> 
> **(a) Checking continuity at $x = 1$:**
> 
> For $g(x)$ to be continuous at $x = 1$, we need $\lim_{x \to 1} g(x) = g(1)$.
> 
> First, evaluate $g(1)$:
> $$
> g(1) = \frac{1}{1 + |1 - 1|} = \frac{1}{1 + 0} = 1
> $$
> 
> Now check the limit. Since $|x - 1| \to 0$ as $x \to 1$:
> $$
> \lim_{x \to 1} g(x) = \lim_{x \to 1} \frac{1}{1 + |x - 1|} = \frac{1}{1 + 0} = 1
> $$
> 
> Since $\lim_{x \to 1} g(x) = g(1) = 1$, the function $g(x)$ **is continuous** at $x = 1$.
> 
> **(b) Checking differentiability at $x = 1$:**
> 
> We need to check if $\lim_{h \to 0} \frac{g(1 + h) - g(1)}{h}$ exists.
> 
> Note that $g(1 + h) = \frac{1}{1 + |h|}$.
> 
> **Left-hand limit** ($h \to 0^-$, so $h < 0$ and $|h| = -h$):
> $$
> \lim_{h \to 0^-} \frac{g(1 + h) - g(1)}{h} = \lim_{h \to 0^-} \frac{\frac{1}{1 - h} - 1}{h} = \lim_{h \to 0^-} \frac{1 - (1 - h)}{h(1 - h)} = \lim_{h \to 0^-} \frac{h}{h(1 - h)} = 1
> $$
> 
> **Right-hand limit** ($h \to 0^+$, so $h > 0$ and $|h| = h$):
> $$
> \lim_{h \to 0^+} \frac{g(1 + h) - g(1)}{h} = \lim_{h \to 0^+} \frac{\frac{1}{1 + h} - 1}{h} = \lim_{h \to 0^+} \frac{1 - (1 + h)}{h(1 + h)} = \lim_{h \to 0^+} \frac{-h}{h(1 + h)} = -1
> $$
> 
> Since the left-hand limit $(1)$ and right-hand limit $(-1)$ are **not equal**, the limit does not exist.
> 
> Therefore, $g(x)$ **is not differentiable** at $x = 1$.

> [!example] Example
> ## Derivative of Sine Function

**Exercise 14.3:** Use the definition of the derivative to show that $\frac{d}{dx}(\sin x) = \cos x$.

> [!success]- Solution (Click to expand)
> 
> Using the definition of the derivative:
> $$
> \frac{d}{dx}(\sin x) = \lim_{h \to 0} \frac{\sin(x + h) - \sin x}{h}
> $$
> 
> Apply the angle addition formula: $\sin(x + h) = \sin x \cos h + \cos x \sin h$
> $$
> \begin{aligned}
> \lim_{h \to 0} \frac{\sin(x + h) - \sin x}{h} &= \lim_{h \to 0} \frac{\sin x \cos h + \cos x \sin h - \sin x}{h} \\
> &= \lim_{h \to 0} \frac{\sin x(\cos h - 1) + \cos x \sin h}{h} \\
> &= \lim_{h \to 0} \left[\sin x \cdot \frac{\cos h - 1}{h} + \cos x \cdot \frac{\sin h}{h}\right] \\
> &= \sin x \cdot \lim_{h \to 0} \frac{\cos h - 1}{h} + \cos x \cdot \lim_{h \to 0} \frac{\sin h}{h}
> \end{aligned}
> $$
> 
> Using the standard limits: $\lim_{h \to 0} \frac{\sin h}{h} = 1$ and $\lim_{h \to 0} \frac{\cos h - 1}{h} = 0$
> $$
> \frac{d}{dx}(\sin x) = \sin x \cdot 0 + \cos x \cdot 1 = \cos x
> $$
> 
> Therefore, $\frac{d}{dx}(\sin x) = \cos x$.

[TODO: here, add 3b1b's geometric interpretation of the derivative of sine]

