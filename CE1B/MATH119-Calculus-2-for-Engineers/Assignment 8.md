---
Course: MATH119
Date: 2026-07-24
Student: Yiran Liu (21184901)
---

> [!example] **Question 1**
> 

Determine whether each of the following series is convergent or divergent. If it is convergent, find its sum.

a. **[2]**
$$
\sum_{n=0}^{\infty} \frac{3^n}{e^{n-1}}
$$

b. **[4]**
$$
\sum_{n=1}^{\infty} \frac{1+2^n}{3^n}
$$

c. **[4]**
$$
\sum_{n=1}^{\infty} \frac{1}{n^2 + 7n + 12}
$$

d. **[3]**
$$
\sum_{n=1}^{\infty} \ln\left( \frac{n}{n+1} \right)
$$

> [!success]- Solution

a.
$$ \sum_{n=0}^{\infty} \frac{3^n}{e^{n-1}} = \sum_{n=0}^{\infty} \frac{3^n}{e^{n}}e = e\sum_{n=0}^{\infty} \left(\frac{3}{e}\right)^n $$

Since $\frac{3}{e} > 1$, $\lim_{n\to\infty} (\frac{3}{e})^n = \infty \neq 0$. Therefore, the series is **divergent** by the *divergence test*.


b.

$$ \sum_{n=1}^{\infty} \frac{1+2^n}{3^n} = \sum_{n=1}^{\infty} \left(\frac{1}{3}\right)^n + \sum_{n=1}^{\infty} \left(\frac{2}{3}\right)^n $$
Both are **convergent** since they are *geometric series*. Sum can be evaluated using $\frac{a}{1-r}$

$$
\begin{aligned}
\sum_{n=1}^{\infty} \left(\frac{1}{3}\right)^n &= \frac{1/3}{1-1/3} = \frac{1}{2} \\
\sum_{n=1}^{\infty} \left(\frac{2}{3}\right)^n &= \frac{2/3}{1-2/3} = 2
\end{aligned}
$$
Total sum:
$$ \sum_{n=1}^{\infty} \frac{1+2^n}{3^n} = \frac{1}{2} + 2 = \boxed{\frac{5}{2}} $$


c.

$$ \frac{1}{n^2+7n+12} = \frac{1}{(n+3)(n+4)} = \frac{1}{n+3} - \frac{1}{n+4} $$
The series is **convergent** since terms cancels out:
$$
\begin{aligned}
& \sum_{n=1}^{\infty} \left( \frac{1}{n+3} - \frac{1}{n+4} \right) \\
&= \left( \frac{1}{4} - \frac{1}{5} \right) + \left( \frac{1}{5} - \frac{1}{6} \right) + \left( \frac{1}{6} - \frac{1}{7} \right) + \cdots  \\
&= \frac{1}{4} + (\frac{1}{5} - \frac{1}{5}) + (\frac{1}{6} - \frac{1}{6}) + \cdots \\
&= \boxed{\frac{1}{4}}
\end{aligned}
$$


d.
$$ \ln\left( \frac{n}{n+1} \right) = \ln n - \ln(n+1) $$
Terms cancel out:
$$
\begin{aligned}
S_N = & \sum_{n=1}^{N} \left( \ln n - \ln(n+1) \right) \\
&= (\ln 1 - \ln 2) + (\ln 2 - \ln 3) + (\ln 3 - \ln4) + \cdots  \\
&= \ln 1 + (- \ln 2 + \ln 2) + (-\ln 3 + \ln 3) + \cdots -\ln(N+1) \\
&= \ln 1 - \ln (N+1) = -\ln(N+1) \\
\end{aligned}
$$
Taking the limit:
$$ \lim_{N\to\infty} S_N = \lim_{N\to\infty} -\ln(N+1) = \boxed{-\infty} $$
The last term diverges, therefore the series is **divergent**.

---

> [!example] **Question 2**
> 

**[4]** A ball is dropped from a height of $8\text{ m}$. Each time it hits the ground, it rebounds to two-thirds of its previous height. Find the total distance travelled by the ball before it comes to rest.

> [!success]- Solution

 After the $n^\text{th}$ bounce the ball rises to a height of $8\left(\frac{2}{3}\right)^n$, therefore:
$$ D = 8 + 2\sum_{n=1}^{\infty} 8\left(\frac{2}{3}\right)^n $$
The series is **convergent** by the *geometry series test*, and has sum:
$$ \sum_{n=1}^{\infty} 8\left(\frac{2}{3}\right)^n = \frac{8 \cdot \frac{2}{3}}{1-\frac{2}{3}} = \frac{16/3}{1/3} = 16 $$
Therefore the total distance traveled is:
$$ D = 8 + 2(16) = \boxed{40 \text{ m}} $$

---

> [!example] **Question 3**
> 

a. **[3]** Determine if the following series converges or diverges:
$$
\sum_{n=2}^{\infty} \frac{1}{n \ln n}
$$

b. **[5]** Find the values of $p$ for which the following series is convergent:
$$
\sum_{n=2}^{\infty} \frac{1}{n(\ln n)^p}
$$

> [!success]- Solution

a.

Use *integral test* with $f(x) = \frac{1}{x\ln x}$. On $[2, \infty)$ this function is *positive, continuous, and decreasing*. Using the substitution $u = \ln x, \ du = \frac{1}{x}dx$:
$$
\int_{2}^{\infty} \frac{1}{x\ln x} \ dx = \int_{\ln 2}^{\infty} \frac{1}{u} \ du = \ln u \mid^{u=\infty}_{u=\ln 2} = \infty
$$
The integral diverges, therefore the series is **divergent**.


b.

Use *integral test* with $f(x) = \frac{1}{x(\ln x)^p}$, which is *positive, continuous, and eventually decreasing* for any $p$. Using the same substitution $u = \ln x$:
$$
\begin{aligned}
\int_{2}^{\infty} \frac{1}{x(\ln x)^p} \ dx &= \int_{\ln 2}^{\infty} \frac{1}{u^p} \ du \\
&= \int_{\ln 2}^{\infty} u^{-p} \ du \\
&= \frac{u^{1-p}}{1-p} \mid^{u=\infty}_{u=\ln 2} \\
&= \begin{cases}
\infty & \quad \boxed{(p \leq 1)} \\
(\ln 2)^{1-p} /(p-1) & \quad \boxed{(p > 1)}
\end{cases}

\end{aligned}
$$

Therefore, the series **converges** for $p > 1$ and **diverges** for $p \leq 1$.
