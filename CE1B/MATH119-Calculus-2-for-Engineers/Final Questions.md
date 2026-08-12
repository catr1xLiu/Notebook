
### Question 1a

Given function $f(x)=x^2-2$, find it's root using Newton's Method starting with $x_0=1$ and stopping at $x_2$

**Solution:**
$x_2 = \frac{17}{12}$

### Question 1b

Newton's interpolation given points

**Solution:**
I got the triangle right but used incorrect formula:
$$ P(x) = y_0 + \frac{\Delta y_0}{\Delta x}\cdot (x-x_0) + \frac{\Delta^2 y_0}{\Delta x^2}\cdot \frac{(x-x_0)^2}{2!} + \cdots $$

### Question 2a


Evaluate the integral where $D$ is the region bounded by $x=0, y=0, z=0$ and $x^2+y^2+z^2=4$:
$$ \iiint_D \frac{\cos\left(\sqrt{x^2+y^2+z^2}\right)}{x^2+y^2+z^2} dV$$

**Solution:**

I don't know which quadrant it meant, suppose it's the first one $x>0 \land y>0 \land z>0$ then:
$$ x>0 \land y>0 \land z>0 \implies \theta, \phi \in [0, \frac{\pi}{2}] $$
Write integral:
$$\begin{aligned} 
\iiint_D \frac{\cos\left(\sqrt{x^2+y^2+z^2}\right)}{x^2+y^2+z^2} dV &=  \int_{0}^{\frac{\pi}{2}} \int_{0}^{\frac{\pi}{2}}  \int_{0}^{2} \frac{\cos(\rho)}{\rho^2} \cdot |J|  \, d\rho \,d\phi \,d\theta \\
&=  \int_{0}^{\frac{\pi}{2}} \int_{0}^{\frac{\pi}{2}}  \int_{0}^{2} \frac{\cos(\rho)}{\rho^2} \cdot \rho^2 \sin(\phi)  \, d\rho \, d\phi \, d\theta \\
&= \int_{0}^{\frac{\pi}{2}} \int_{0}^{\frac{\pi}{2}} \sin(\rho) \sin(\phi) \mid^{\rho=2}_{0} \, d\phi \, d\theta \\
&= \int_{0}^{\frac{\pi}{2}} \int_{0}^{\frac{\pi}{2}} \sin(2) \sin(\phi) \, d\phi \, d\theta \\
&= \int_{0}^{\frac{\pi}{2}} \sin(2) \, d\theta \\
&= \boxed{\frac{\pi}{2} \, \sin(2)} \\
\end{aligned}$$


### Question 2b

Evaluate integral where $D$ is the region within cylinder $x^2 +y^2 = 1$ and under cone $z^2 = 4x^2 +4y^2$:
$$ \iiint_D x^2 \, dV $$

**Solution:**

![[FinalQ2b|85%]]

In cylindrical coordinate system, the region within cylinder is $r \in [0,1]$. Rewrite cone equation, and under the cone is: 
$$z^2 < 4(x^2+y^2) \implies z^2<4r^2 \implies r>\frac{1}{2} z $$
Let $z^2=4r^2$ at cylinder boundary, $z=2$. So $r\in[\frac{1}{2}z, 1]$ and $z \in [0, 2]$. Compute:

$$\begin{aligned}
\iiint_D x^2 \, dV &= \int_{0}^{2\pi} \int_{0}^{2} \int_{\frac{1}{2}z}^{1} \cos^2(\theta) \cdot r^2 |J| \,dr \,dz \,d\theta \\
&= \int_{0}^{2\pi} \int_{0}^{2} \int_{\frac{1}{2}z}^{1} \cos^2(\theta) \cdot r^3 \,dr \,dz \,d\theta \\
&= \cdots \\
&= \boxed{\frac{\pi}{40}}
\end{aligned}$$
Using equivalence $\cos^2{\theta} = \frac{1}{2}(1+\cos(2\theta)$ 


### Question 3

Evaluate the series
$$ \sum_{k=0}^\infty \frac{4}{k^2+3k+2} $$
**Solution:**

Let:
$$ \frac{4}{(k+2)(k+1)} = \frac{A}{(k+2)} + \frac{B}{(k+1)}$$
Solve for:
$$ \forall k: \quad (k+1)A + (k+2)B = 1 \implies A=-4,B=4 $$
Expand and compute:

$$\begin{aligned}
\sum_{k=0}^\infty \frac{4}{k^2+3k+2} &= \sum_{k=0}^\infty \left( \frac{4}{k+1} + \frac{-4}{k+2} \right) \\
&= \sum_{k=0}^\infty \frac{4}{k+1} + \sum_{k=0}^\infty\frac{-4}{k+2} \\
&= \frac{4}{1} - \frac{4}{2} + \frac{4}{2} - \frac{4}{3} + \frac{4}{3} + \cdots \\
&= \boxed{4}
\end{aligned}$$

### Question 4

Evaluate the limit using series:
$$ \lim_{n\to 0} \,\frac{3\tan^{-1}(x)-3x+x^3}{x^5} $$
**Solution:**
I totally forgot the taylor's expansion for $\tan^{-1}$, I wrote all its derivatives on the exam paper like this:
$$\begin{aligned} 
f(0) &= \tan^{-1}(x) = 0 \\
f'(0) &= (1+x^2)^{-1} = 1 \\
f''(0) &= -2x \cdot(1+x^2)^{-2} = 0 \\
f'''(0) &= 8x^2\cdot(1+x^2)^{-3} - 2(1+x^2)^{-2} = -2 \\
f''''(0) &= 16x\cdot(1+x^2)^{-3}  -24x^2 \cdot (2x)\cdot(1+x^2)^{-4}+4\cdot(2x)(1+x^2)^{-3} = 0 \\
f'''''(0) &= 16\cdot(1+x^2)^{-3} + \cdots + 8(1+x^2)^{-3} = 24
\end{aligned}$$
Write expansion for $\tan^-1(x)$:
$$ f(x) = \sum_{n=0}^\infty \frac{f^{(n)}}{n!} (x-a)^n = x - \frac{2}{3!}x^3 + \frac{24}{5!}x^5 + \mathcal{O}(x^7) $$
Compute:
$$\begin{aligned} 
\lim_{n\to 0} \,\frac{3\tan^{-1}(x)-3x+x^3}{x^5} &= \lim_{n\to 0} \,\frac{3(x-\frac{1}{3}x^3 + \frac{1}{5}x^5 + \mathcal{O}(x^7))-3x+x^3}{x^5}\\
&= \lim_{n\to 0} \, \frac{3x-3x-x^3+x^3 + \frac{3}{5}x^5 + \mathcal{O}(x^7)}{x^5} \\
&= \lim_{n\to 0} \, \frac{\frac{3}{5}x^5 + \mathcal{O}(x^7)}{x^5} \\
&= \lim_{n\to 0} \, \frac{3}{5} + \mathcal{O}(x^2) = \frac{3}{5} \\
\end{aligned}$$

### Question 5

Radius and interval of convergence for series
$$ \sum_{n=0}^\infty \, \frac{x^n}{4^n\ln(n)} $$

**Solution:**

Radius of convergence:
$$\begin{aligned}
R &= \lim_{n\to\infty} \, \left| \frac{c_n}{c_{n+1}} \right| \\
&= \lim_{n\to\infty} \, \frac{4^{n+1} \ln(n+1)}{4^n \ln(n)} \\
&= 4\lim_{n\to\infty} \, \frac{\ln(n+1)}{\ln(n)} \\
&= 4\lim_{n\to\infty} \, \frac{\frac{1}{n+1}}{\frac{1}{n}} \\
&= \boxed{4}
\end{aligned}
$$
Closed interval is $|x| < 4 \implies x \in[-4, 4]$. We need to check boundary:
$$ \sum_{n=0}^\infty \, \frac{4^n}{4^n\ln(n)} = \sum_{n=0}^\infty \, \frac{1}{\ln(n)} \quad \land \quad\frac{1}{\ln(n)} > \frac{1}{n} \impliedby \ln(n) < n $$
By *Comparison Test* with harmonic series $\sum \frac{1}{n}$, the series diverges at $x=4$.
$$ \sum_{n=0}^\infty \, \frac{(-4)^n}{4^n\ln(n)} = \sum_{n=0}^\infty \, \frac{(-1)
^n}{\ln(n)} \quad \land \quad \frac{1}{\ln(n+1)} < \frac{1}{\ln(n)} \quad\land\quad \lim_{n\to\infty} \, \frac{1}{\ln(n)} = 0$$
By the *Alternating Series Test*, the series converges conditionally at $x=-4$.
Therefore, interval of convergence is $x\in [-4, 4)$

### Question 6

four series AC, CC, D test requiring full proof, can't recall

### Question 7a

Write the Taylor's polynomial using a provided $n$-th derivative equation.

**Solution:**

Used
$$f(x) = \sum_{n=0}^\infty \frac{f^{(n)}}{n!} (x-a)^n $$


### Question 7b

Use Taylor's Polynomial to evaluate $f^{(93)}$ given $f(x) = x^3 \sin(x^2)$ 

**Solution:**

$$\begin{aligned} 
\sin(x) &= \sum_{n=0}^\infty \, (-1)^n \frac{x^{2n+1}}{(2n+1)!} \\
f(x) &= \sum_{n=0}^\infty \, (-1)^n \frac{x^{4n+2}}{(2n+1)!}\cdot x^3 \\
&= \sum_{n=0}^\infty \, (-1)^n \frac{x^{4n+5}}{(2n+1)!} \\
\end{aligned}$$

Now compute:
$$\begin{aligned} 
f^{(93)}(x) & = 0 + \cdots +\left[(-1)^n \frac{x^{4n+5}}{(2n+1)!} \right]^{(93)} + 0 + \cdots \quad\quad (4n+5=93) \\
&= (-1)^n \frac{93! \cdot x^0}{(2n+1)!} \quad(n=22) \\
&= \boxed{\frac{93!}{45!}}
\end{aligned}$$
