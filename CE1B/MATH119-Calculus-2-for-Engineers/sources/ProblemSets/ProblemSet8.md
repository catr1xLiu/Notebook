## Practice Problem Set 8

**Topics:** Taylor's Theorem and Applications

1. Approximate  $f(x) = \frac{1}{\sqrt{x}}$  with a Taylor polynomial of degree 2 centred at x = 4. Use Taylor's inequality to get an upper bound on the error if  $3.5 \le x \le 4.5$ .

**Answer:**  $T_{2,4}(x) = \frac{1}{2} - \frac{1}{16}(x-4) + \frac{3}{256}(x-4)^2$ , error  $\leq \frac{\overline{(15)(0.5)^3}}{(3!)(8)(3.5^{7/2})}$ 

2. Approximate  $f(x) = \ln(1+2x)$  with a Taylor polynomial of degree 3 centred at x = 1. Use Taylor's inequality to get an upper bound on the error if  $0.5 \le x \le 1.5$ .

**Answer:**  $T_{3,1}(x) = \ln(3) + \frac{2}{3}(x-1) - \frac{2}{9}(x-1)^2 + \frac{8}{81}(x-1)^3$ , error  $\leq \frac{(6)(0.5)^4}{4!}$ 

3. Use Taylor's Theorem to find an integer n such that using  $T_{n,0}(x)$  to approximate  $e^x$  at x = 0.1 has an error of at most 0.00001.

**Answer:** n = 3

4. Use Taylor polynomials to evaluate the limit:

$$\lim_{x \to 0} \frac{\tan^{-1}(x^2)}{\tan^2(x)}$$

Answer: 1

- 5. Let  $f(x) = \sqrt[3]{x}$ .
  - (a) Find  $T_{2,8}(x)$ , the second degree Taylor polynomial centred at x=8.

**Answer:**  $T_{2,8}(x) = 2 + \frac{1}{12}(x-8) - \frac{1}{288}(x-8)^2$ 

- (b) Use Taylor's inequality to find an upper bound on the error in using  $T_{2,8}(x)$  to approximate  $\sqrt[3]{10}$ . **Answer:**  $\frac{5}{2592}$
- (c) Verify that the actual error is less than the upper bound you found in part (b) by using your calculator to evaluate  $\sqrt[3]{10}$ .
- 6. Let  $f(x) = \cos(2x)$ . Let P(x) denote the degree 10 Taylor polynomial of f centred at x = 0. Calculate P(x). To how many decimal places does P approximate f(x) on the interval [-1,1]?

**Answer:**  $P(x) = 1 - \frac{2^2}{2!}x^2 + \frac{2^4}{4!}x^4 - \frac{2^6}{6!}x^6 + \frac{2^8}{8!}x^8 - \frac{2^{10}}{10!}x^{10}$ , 4 decimal places (at least)

7. Find the linear approximation based at x=0 for the function  $\sin^{-1}(x)$ , and determine a numerical upper bound on the error involved in using this approximation on the interval [0,0.5]. **Answer:**  $T_{1,0}(x)=x$ , error  $\leq \frac{1}{6\sqrt{3}}$ 

1

8. (a) Find the fourth-order Maclaurin polynomial for  $f(x) = \tan x$  using the definition of  $T_{n,0}$ , along with an upper bound (in terms of x) on the magnitude of the error involved in using it as an approximation to  $\tan x$  on the interval  $[0, \pi/4]$ .

**Answer:** 
$$T_{4,0}(x) = x + \frac{1}{3}x^3$$
,  $|R_{4,0}(x)| \le \frac{64}{15}|x|^5$ 

(b) Use your result from part (a) to approximate the value of  $\int_0^{1/4} \frac{\tan(\pi t)}{t} dt$ , with an upper bound on the magnitude of the error.

Answer: 
$$\frac{\pi}{4} + \frac{\pi^3}{(9)(4^3)}$$
, error  $\leq \frac{64\pi^5}{(75)(4^5)}$ 

9. Find the 5<sup>th</sup>-order Maclaurin polynomial for  $f(x) = \sin^{-1} x$ , with an upper bound on the error associated with using it on the interval (0, 1/2). Do *not* start by differentiating f(x); start with a related function whose derivatives are easier to work with.

**Hint:** Use the related function 
$$\frac{1}{\sqrt{1+u}}$$
, then substitute  $u=-x^2$  and integrate.

**Answer:** 
$$T_{5,0}(x) = x + \frac{1}{6}x^3 + \frac{3}{40}x^5$$
, error  $\leq \frac{1}{(7)(2^7)}$ 

10. Estimate the value of  $\int_0^1 t^2 e^{-t^2} dt$  to within 0.001.

**Hint:** Start with a Maclaurin polynomial for the exponential function. Since you don't know how many terms you're going to need, you'll need to consider a general  $(n^{\text{th}}\text{-order})$  approximation. The corresponding error bound will be in terms of n. You'll then have to determine how large n needs to be in order for the error to be sufficiently small. For this last step, you'll have to rely upon trial and error.

**Answer:** 
$$\int_0^1 t^2 e^{-t^2} dt \approx \frac{1}{3} - \frac{1}{5} + \frac{1}{14} - \frac{1}{54} + \frac{1}{264}$$

## Other Suggested Problems

Guichard, page 378, Exercises for  $\S 9.11$ , # 9.11.1, 9.11.2