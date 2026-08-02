---
Course: MATH119
Date: 2026-07-31
Student: Yiran Liu (21184901)
---

> [!example] **Question 1**
> 

Determine whether each of the following series is absolutely convergent, conditionally convergent, or divergent. You must cite each convergence test you use in order to get a full mark.

a. **[3]**
$$
\sum_{n=0}^{\infty} (-1)^{n+1} \frac{n}{n^2 + 4}
$$

b. **[3]**
$$
\sum_{n=1}^{\infty} \frac{\ln n}{n^3}
$$

c. **[4]**
$$
\sum_{n=1}^{\infty} \frac{\sin(4n)}{4^n}
$$

d. **[4]**
$$
\sum_{n=5}^{\infty} \frac{\sqrt{n} \cos(n)}{n^2 - 1}
$$

> [!success]- Solution

a. **Conditionally convergent**

We first apply *limit comparison* on the positive series with **divergent** harmonic series $\frac{1}{n}$: 
$$ \lim_{n \to \infty}\frac{n}{n^2+4} = \frac{1}{n}$$
Apply the *alternating series test*, the series is eventually decreasing:
$$ \lim_{n\to\infty} \frac{n+1}{(n+1)^2+4} \lt \frac{n}{n^2+4} $$
Therefore, it converges conditionally.


b. **Absolutely Convergent** 

Apply comparison test with **convergent** p-series series $\sum \frac{1}{n^2} (p=2)$
$$ \quad \ln n < n \implies \frac{\ln n}{n^3} < \frac{n}{n^3} \implies  \sum_{n=1}^\infty\, \frac{\ln n}{n^3} \text{ also converges} $$

c. **Absolutely Convergent**

Apply comparison test with **convergent** geometric series $\sum \frac{1}{4^n}$ 
$$ \sin(4n) \leq 1 \implies \frac{\sin(4n)}{4^n} \leq \frac{1}{4^n} \implies \sum_{n=1}^\infty\, \frac{\sin(4n)}{4^n} \text{ also converges} $$

d. **Absolutely Convergent**

Apply *limit comparison test* with **convergent** p-series $\sum\frac{\sqrt{n}}{n^2} \,(p=\frac{3}{2})$ 

$$ \cos(n) \leq 1 \implies \lim_{n\to\infty}\, \frac{\sqrt{n}\cos(n)}{n^2-1} \leq \frac{\sqrt{n}}{n^2} \, (p=\frac{3}{2})$$
Therefore, the series is also convergent. 

---

> [!example] **Question 2**
> 

a. **[4]** Show that the series converges:
$$
\sum_{n=1}^{\infty} \frac{(-1)^n}{10^n \, n!}
$$

b. **[2]** How many terms of this series do we need to add in order to find the sum within an error of $0.0000005$?

> [!success]- Solution

a. **Converges absolutely**

Apply *comparison test* on the positive series with **convergent** geometric series $\sum \frac{1}{10^n}$
$$ n! \geq n \implies \frac{1}{10^n \, n!} \leq \frac{1}{10^n} \implies \sum_{n=1}^\infty \,\frac{1}{10^n\, n!} \text{ also converges} $$

b.

Using the error term of partial sum for alternating series:
$$ |S_N - S| \leq a_{N+1} $$
$$ \frac{1}{10^{N+1} \, (N+1)!} \leq 5\times 10^{-7} \implies N \geq 4$$
So we have to estimate at least four terms.

---

> [!example] **Question 3**
> 

**[4]** For which values of $p$ does the following series converge?
$$
\sum_{n=1}^{\infty} \frac{(-1)^{n+1}}{n^p}
$$

> [!success]- Solution



---

> [!example] **Question 4**
> 

a. **[1]** Give a counter example to disprove that if $\sum a_n^2$ converges, then $\sum a_n$ also converges.

b. **[2]** Prove that if $a_n > 0$ for all $n$ and $\sum a_n$ converges, then $\sum a_n^2$ also converges.

> [!success]- Solution

a.

b.
