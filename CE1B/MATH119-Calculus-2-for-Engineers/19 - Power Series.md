
## Definition: 

A **power series** centered at $x=a$ is a series of form:
$$ \sum_{n=0}^{\infty} c_k (x-a)^k = c_0 + c_1(x-a) + c_2(x-b)^2 + ...$$
With $a=0$, the series is:
$$ \sum_{n=1}^{\infty} c_k x^k = c_0 + c_1x + c_2x^2 + ... $$

## Info: Building Blocks for Power Series Construction

We can write the *Maclaurin series* of basic function to help us find that of other functions.

**Sum of geometric series:**
$$
\frac{1}{1-x} = \sum_{k=0}^{\infty}x^k \quad\quad (|x| < 1)
$$

**Exponential function:**
$$ e^x = \sum_{k=0}^\infty \frac{x^k}{k!}$$

**Trigonometry functions:**
$$\begin{aligned} 
\sin(x) &= \sum_{k=0}^\infty (-1)^k \frac{x^{2k+1}}{(2k+1)!} \\
\cos(x) &=\sum_{k=0}^\infty (-1)^k \frac{x^2k}{(2k)!}
\end{aligned}$$

**The Binomial Series:**
$$ (1+x)^\alpha = \sum_{n=0}^\infty x^n$$


## Theorem: Interval of Convergence

Using the *ratio test*:
$$\begin{aligned}
\lim_{k\to\infty} \left| \frac{a_{k+1}}{a_k} \right| & = \lim_{k\to\infty} \left| \frac{c_{k+1}(x-x_0)^{k+1}}{c_k(x-x_0)^k} \right| \\
&= 
\end{aligned}$$

## Theorem: Composite Power Series

If the series $f(x) = \sum c_k (x-x_0)^k$ has interval of convergence $I_f$ and the series $g(x) = \sum d_k (x-x_0)^k$, we can:

**Add two series**:
$$ f(x) + g(x) = \sum_{k=0}^\infty() $$

**Differentiating:**

**Integrating:**
$$ f'(x) = \frac{\mathrm{d}}{\mathrm{d}x} $$

#### Differentiating and Integrating

The **Abel's theorem** tells us that a power series is continuous 

## Examples

**Example of 1/(1-x) form:**

Write the equation as a power series:

$$f(x) = \frac{x^2}{x+7} $$
**Solution:**

**Example: Constructing series by Integrating**
Write the equation as a power series:
$$ f(x) = \ln |1+x| $$
**Solution:**
First write it's derivative as power series:
$$ f'(x) = \frac{1}{1+x} = \frac{1}{1- (-x)} = \sum_{k=0}^\infty (-x)^n \quad (|x| < 1) $$
Now integrate both sides:
$$ \begin{aligned}  
\int f'(x) \, \mathrm{d}x &= \int \left( \sum_{k=0}^\infty (-1)^n x^n \right) \, dx \\
&= \sum_{k=0}^\infty \left( \int (-1)^n x^n \, \mathrm{d}x \right) \\
&= \sum_{k=0}^\infty
\end{aligned} $$