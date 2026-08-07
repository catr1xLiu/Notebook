## Practice Problem Set 11

Topics: Ratio & Root Tests, Taylor/Binomial/Power Series, Applications

- 1. Determine whether the following series converge absolutely, converge conditionally, or diverge. Justify your conclusions as thoroughly as you can.
  - (a)  $\sum_{n=1}^{\infty} \frac{n!}{n^9}$  Answer: diverges
  - (b)  $\sum_{n=1}^{\infty} \frac{(-1)^n n^{100} 100^n}{n!}$  Answer: converges absolutely
  - (c)  $\sum_{n=1}^{\infty} \frac{n!}{n^n}$  Answer: converges absolutely
  - (d)  $\sum_{n=1}^{\infty} \frac{7^{n^2}}{n!}$  Answer: diverges
  - (e)  $\sum_{n=1}^{\infty} \left(\frac{-2n}{n+1}\right)^{3n}$  Answer: diverges
  - (f)  $\sum_{n=1}^{\infty} (-1)^n \frac{n}{e^n}$  Answer: converges absolutely
- 2. Find the radius of convergence, R, as well as the interval of convergence, I, for each of the following power series.
  - (a)  $\sum_{n=1}^{\infty} \frac{(x-1)^n}{5^n}$  **Answer:** R = 5, I = (-4, 6)
  - (b)  $\sum_{n=1}^{\infty} \frac{nx^n}{n+1}$  Answer: R = 1, I = (-1, 1)
  - (c)  $\sum_{n=1}^{\infty} \frac{3^n}{n!} x^n$  Answer:  $R = \infty, I = (-\infty, \infty)$
  - (d)  $\sum_{n=1}^{\infty} \frac{x^n}{\sqrt{n^2+1}}$  Answer: R = 1, I = [-1, 1)
  - (e)  $\sum_{n=1}^{\infty} (-1)^n \frac{(x-3)^n}{2n+1}$  Answer: R = 1, I = (2,4]
  - (f)  $\sum_{n=1}^{\infty} \frac{10^n x^n}{n^{10}}$  Answer:  $R = \frac{1}{10}, I = \left[ -\frac{1}{10}, \frac{1}{10} \right]$
  - (g)  $\sum_{n=1}^{\infty} \frac{(2x-1)^n}{5^n \sqrt{n}}$  Answer:  $R = \frac{5}{2}, I = [-2, 3)$

3. We can find Taylor polynomials and Taylor series fairly quickly by starting with Taylor polynomials or Taylor series for:  $e^x$ ,  $\sin(x)$ ,  $\cos(x)$ ,  $\frac{1}{1-x}$  (the geometric series), or  $(1+x)^m$  (the binomial series). The geometric series

$$\frac{1}{1-x} = \sum_{n=0}^{\infty} x^n \text{ for } |x| < 1$$

is particularly useful as the function  $\frac{1}{1-x}$  can be related to many other functions. Using this, find the series representation, radius (R) and interval (I) of convergence of the following:

(a)  $\ln(x^2+1)$  **Hint:**  $\frac{d}{dx}\ln(x+1) = \frac{1}{1+x}$ 

**Answer:**  $\sum_{n=0}^{\infty} (-1)^n \frac{x^{2n+2}}{n+1}$ , R = 1, I = [-1, 1]

(b)  $\tanh^{-1}(x)$  **Hint:**  $\frac{d}{dx} \tanh^{-1}(x) = \frac{1}{1-x^2}$ 

**Answer:**  $\sum_{n=0}^{\infty} \frac{x^{2n+1}}{2n+1}$ , R = 1, I = (-1,1)

(c)  $\frac{x}{(1-2x)^2}$  **Hint:**  $\frac{d}{dx}\left(\frac{1}{1-x}\right) = \frac{1}{(1-x)^2}$ 

**Answer:**  $\sum_{n=0}^{\infty} n2^{n-1}x^n$ ,  $R = \frac{1}{2}$ ,  $I = \left(-\frac{1}{2}, \frac{1}{2}\right)$ 

(d)  $\frac{3}{x^2+x-2}$  **Hint:** Start by decomposing this into its partial fractions.

**Answer:**  $-\sum_{n=0}^{\infty} \left[ 1 + \frac{(-1)^n}{2^{n+1}} \right] x^n$ , R = 1, I = (-1, 1)

- (e)  $\frac{x}{2x^2+1}$  Answer:  $\sum_{n=0}^{\infty} (-1)^n 2^n x^{2n+1}$ ,  $R = \frac{1}{\sqrt{2}}$ ,  $I = \left(-\frac{1}{\sqrt{2}}, \frac{1}{\sqrt{2}}\right)$
- (f)  $\left(\frac{x}{2-x}\right)^3$  Answer:  $\sum_{n=2}^{\infty} \frac{n(n-1)x^{n+1}}{2^{n+2}}$ , R=2, I=(-2,2)
- 4. Use the power series for  $\arctan(x)$  to derive the following expression for  $\pi$ :

$$\pi = 2\sqrt{3} \sum_{n=0}^{\infty} \frac{(-1)^n}{(2n+1)3^n}$$

- 5. Suppose  $\sum_{n=1}^{\infty} c_n(x-3)^n$  converges at x=5 and diverges at x=0.
  - (a) Show that  $\sum_{n=1}^{\infty} c_n$  converges absolutely.

- (b) Show that the radius of convergence R lies in the interval  $2 \le R \le 3$ .
- (c) Show that  $\sum_{n=1}^{\infty} c_n 5^n$  diverges.
- 6. Find the Taylor series for:

(a) 
$$f(x) = \frac{1}{x}$$
 about  $a = 3$ . Answer:  $\sum_{n=0}^{\infty} (-1)^n \frac{(x-3)^n}{3^{n+1}}$ ,  $R = 3$ ,  $I = (0,6)$ 

(b) 
$$f(x) = \cos(x)$$
 about  $a = \frac{\pi}{2}$ . Answer:  $\sum_{n=0}^{\infty} \frac{(-1)^{n+1}}{(2n+1)!} \left(x - \frac{\pi}{2}\right)^{2n+1}$ ,  $R = \infty$ ,  $I = (-\infty, \infty)$ 

(c) 
$$f(x) = 2^x$$
 about  $a = 0$ . Answer:  $\sum_{n=0}^{\infty} \frac{(\ln 2)^n x^n}{n!}$ ,  $R = \infty$ ,  $I = (-\infty, \infty)$ 

(d) 
$$f(x) = \ln x$$
 about  $a = 4$ . Answer:  $\ln x = \ln 4 + \sum_{n=0}^{\infty} \frac{(-1)^n (x-4)^{n+1}}{(n+1)4^{n+1}}$ ,  $R = 4$ ,  $I = (0,8]$ 

7. This example illustrates how Taylor series can be used to compute derivatives.

(a) Find the Maclaurin series for 
$$f(x) = x^3 e^{x^2}$$
. Answer:  $\sum_{n=0}^{\infty} \frac{x^{2n+3}}{n!}$ ,  $R = \infty$ ,  $I = (-\infty, \infty)$ 

(b) Compute 
$$f^{(63)}(0)$$
 without actually taking 63 derivatives. **Answer:**  $f^{(63)}(0) = \frac{63!}{30!}$ 

8. Find the sum of the following series.

(a) 
$$\sum_{n=0}^{\infty} \frac{3^n}{n!5^n}$$
 Answer:  $e^{3/5}$ 

(b) 
$$\sum_{n=1}^{\infty} (-1)^{n-1} \frac{3^n}{n5^n}$$
 **Answer:**  $\ln \left( \frac{8}{5} \right)$ 

(c) 
$$\frac{1}{(1)(2)} - \frac{1}{(3)(2^3)} + \frac{1}{(5)(2^5)} - \frac{1}{(7)(2^7)} + \cdots$$
 Answer:  $\arctan\left(\frac{1}{2}\right)$ 

9. Find the power series for  $\frac{x}{(1+x^2)^2}$ , and use it to find the sum of the series  $\sum_{n=1}^{\infty} \frac{(-1)^{n+1}n}{4^n}$ .

**Answer:** 
$$\frac{x}{(1+x^2)^2} = \sum_{n=1}^{\infty} (-1)^{n+1} n x^{2n-1}$$
,  $|x| < 1$ ,  $\sum_{n=1}^{\infty} \frac{(-1)^{n+1} n}{4^n} = \frac{4}{25}$ 

10. (a) Using the binomial series, the expression  $(1+x)^m$ , where  $m \in \mathbf{R}$ , can be written as

$$(1+x)^m = \sum_{n=0}^{\infty} {m \choose n} x^n = 1 + mx + \frac{m(m-1)x^2}{2!} + \frac{m(m-1)(m-2)x^3}{3!} + \cdots$$

which will converge for |x| < 1. Using this, find  $T_{4,0}(x)$  for  $f(x) = \sqrt[5]{2x+1}$ . What is the radius of convergence of the full Maclaurin series for f(x)?

**Answer:** 
$$T_{4,0}(x) = 1 + \frac{2}{5}x - \frac{8}{25}x^2 + \frac{48}{125}x^3 - \frac{336}{625}x^4$$
,  $R = \frac{1}{2}$ 

- (b) Use the binomial series to find a power series expression for  $f(x) = \sqrt{x}$  about a = 49. **Answer:**  $f(x) = 7 + \frac{(x-49)}{2 \cdot 7} + \sum_{n=2}^{\infty} \frac{(-1)^{n-1}(1)(3)(5) \cdots (2n-3)}{2^n 7^{2n-1} n!} (x-49)^n$  with R = 49, I = (0, 98)
- 11. Use known series to compute the following limits

(a) 
$$\lim_{x\to 0} \frac{x - \arctan(x)}{x^3}$$
 Answer:  $\frac{1}{3}$ 

(b) 
$$\lim_{x\to 0} \frac{e^x-1}{x^3}$$
 Answer: DNE

(c) 
$$\lim_{x\to 0} \frac{e^x + e^{-x} - 2}{2\cos(2x) - 2}$$
 Answer:  $-\frac{1}{4}$ 

(d) 
$$\lim_{x\to 0} \frac{\sin(x) - x + \frac{1}{6}x^3}{x^5}$$
 **Answer:**  $\frac{1}{120}$ 

**Recommended Exercise:** Try using L'Hôpital's Rule on these limits, to see how much easier the series approach is... at least for these particular examples.

12. (a) Use known series to express the following integral  $\int_0^{1/2} x^3 \arctan(x) dx$  in terms of an infinite series. Estimate the integral to within an error  $\leq \frac{1}{(77)(2^{11})}$ .

**Answer:** 
$$\int_0^{1/2} x^3 \arctan(x) dx = \sum_{n=0}^{\infty} \frac{(-1)^n}{2^{2n+5}(2n+1)(2n+5)}$$
 (need to retain the first 3 terms to achieve the desired accuracy)

(b) Evaluate the integral  $\int_0^x \frac{dt}{1+t^7}$  as a power series valid for |x| < 1.

**Answer:** 
$$\int_0^x \frac{dt}{1+t^7} = \sum_{n=0}^{\infty} \frac{(-1)^n x^{7n+1}}{(7n+1)}$$
,  $|x| < 1$ 

## Other Suggested Problems

Guichard, page 365, Exercises for  $\S 9.7,\, \#$  9.7.1 - 9.7.5

Guichard, page 368, Exercises for §9.8, # 9.8.1, 9.8.2

Guichard, pages 369-370, Exercises for  $\S 9.9, \# 9.9.1$  - 9.9.5

Guichard, page 373, Exercises for  $\S 9.10, \# 9.10.1$