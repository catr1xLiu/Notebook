#import "@preview/obsidius:0.1.1": *
#show: notes.with("Final Questions")

=== Question 1a
<question-1a>
Given function $f \( x \) = x^2 - 2$, find it's root using Newton's
Method starting with $x_0 = 1$ and stopping at $x_2$

#strong[Solution:] $x_2 = 17 / 12$

=== Question 1b
<question-1b>
Newton's interpolation given points

#strong[Solution:] I got the triangle right but used incorrect formula:
$ P \( x \) = y_0 + frac(Delta y_0, Delta x) dot.op \( x - x_0 \) + frac(Delta^2 y_0, Delta x^2) dot.op frac(\( x - x_0 \)^2, 2 !) + dots.h.c $

=== Question 2a
<question-2a>
Evaluate the integral where $D$ is the region bounded by
$x = 0 \, y = 0 \, z = 0$ and $x^2 + y^2 + z^2 = 4$:
$ integral.triple_D frac(cos (sqrt(x^2 + y^2 + z^2)), x^2 + y^2 + z^2) d V $

#strong[Solution:]

I don't know which quadrant it meant, suppose it's the first one
$x > 0 and y > 0 and z > 0$ then:
$ x > 0 and y > 0 and z > 0 arrow.r.double.long theta \, phi.alt in \[ 0 \, pi / 2 \] $
Write integral:
$ integral.triple_D frac(cos (sqrt(x^2 + y^2 + z^2)), x^2 + y^2 + z^2) d V & = integral_0^(pi / 2) integral_0^(pi / 2) integral_0^2 frac(cos \( rho \), rho^2) dot.op \| J \| thin d rho thin d phi.alt thin d theta\
 & = integral_0^(pi / 2) integral_0^(pi / 2) integral_0^2 frac(cos \( rho \), rho^2) dot.op rho^2 sin \( phi.alt \) thin d rho thin d phi.alt thin d theta\
 & = integral_0^(pi / 2) integral_0^(pi / 2) sin \( rho \) sin \( phi.alt \) divides_0^(rho = 2) thin d phi.alt thin d theta\
 & = integral_0^(pi / 2) integral_0^(pi / 2) sin \( 2 \) sin \( phi.alt \) thin d phi.alt thin d theta\
 & = integral_0^(pi / 2) sin \( 2 \) thin d theta\
 & = #box(stroke: black, inset: 3pt, [$ pi / 2 thin sin \( 2 \) $])\
 $

=== Question 2b
<question-2b>
Evaluate integral where $D$ is the region within cylinder
$x^2 + y^2 = 1$ and under cone $z^2 = 4 x^2 + 4 y^2$:
$ integral.triple_D x^2 thin d V $

#strong[Solution:]

#figure(image("media/FinalQ2b.png"),
  caption: [
    FinalQ2b
  ]
)

In cylindrical coordinate system, the region within cylinder is
$r in \[ 0 \, 1 \]$. Rewrite cone equation, and under the cone is:
$ z^2 < 4 \( x^2 + y^2 \) arrow.r.double.long z^2 < 4 r^2 arrow.r.double.long r > 1 / 2 z $
Let $z^2 = 4 r^2$ at cylinder boundary, $z = 2$. So
$r in \[ 1 / 2 z \, 1 \]$ and $z in \[ 0 \, 2 \]$. Compute:

$ integral.triple_D x^2 thin d V & = integral_0^(2 pi) integral_0^2 integral_(1 / 2 z)^1 cos^2 \( theta \) dot.op r^2 \| J \| thin d r thin d z thin d theta\
 & = integral_0^(2 pi) integral_0^2 integral_(1 / 2 z)^1 cos^2 \( theta \) dot.op r^3 thin d r thin d z thin d theta\
 & = dots.h.c\
 & = #box(stroke: black, inset: 3pt, [$ pi / 40 $]) $ Using equivalence
$cos^2 theta = 1 / 2 \( 1 + cos \( 2 theta \)$

=== Question 3
<question-3>
Evaluate the series $ sum_(k = 0)^oo frac(4, k^2 + 3 k + 2) $
#strong[Solution:]

Let:
$ frac(4, \( k + 2 \) \( k + 1 \)) = frac(A, \( k + 2 \)) + frac(B, \( k + 1 \)) $
Solve for:
$ forall k : quad \( k + 1 \) A + \( k + 2 \) B = 1 arrow.r.double.long A = - 4 \, B = 4 $
Expand and compute:

$ sum_(k = 0)^oo frac(4, k^2 + 3 k + 2) & = sum_(k = 0)^oo (frac(4, k + 1) + frac(- 4, k + 2))\
 & = sum_(k = 0)^oo frac(4, k + 1) + sum_(k = 0)^oo frac(- 4, k + 2)\
 & = 4 / 1 - 4 / 2 + 4 / 2 - 4 / 3 + 4 / 3 + dots.h.c\
 & = #box(stroke: black, inset: 3pt, [$ 4 $]) $

=== Question 4
<question-4>
Evaluate the limit using series:
$ lim_(n arrow.r 0) thin frac(3 tan^(- 1) \( x \) - 3 x + x^3, x^5) $
#strong[Solution:] I totally forgot the taylor's expansion for
$tan^(- 1)$, I wrote all its derivatives on the exam paper like this:
$ f \( 0 \) & = tan^(- 1) \( x \) = 0\
f' \( 0 \) & = \( 1 + x^2 \)^(- 1) = 1\
f'' \( 0 \) & = - 2 x dot.op \( 1 + x^2 \)^(- 2) = 0\
f''' \( 0 \) & = 8 x^2 dot.op \( 1 + x^2 \)^(- 3) - 2 \( 1 + x^2 \)^(- 2) = - 2\
f'''' \( 0 \) & = 16 x dot.op \( 1 + x^2 \)^(- 3) - 24 x^2 dot.op \( 2 x \) dot.op \( 1 + x^2 \)^(- 4) + 4 dot.op \( 2 x \) \( 1 + x^2 \)^(- 3) = 0\
f''''' \( 0 \) & = 16 dot.op \( 1 + x^2 \)^(- 3) + dots.h.c + 8 \( 1 + x^2 \)^(- 3) = 24 $
Write expansion for $tan^(-) 1 \( x \)$:
$ f \( x \) = sum_(n = 0)^oo frac(f^(\( n \)), n !) \( x - a \)^n = x - frac(2, 3 !) x^3 + frac(24, 5 !) x^5 + cal(O) \( x^7 \) $
Compute:
$ lim_(n arrow.r 0) thin frac(3 tan^(- 1) \( x \) - 3 x + x^3, x^5) & = lim_(n arrow.r 0) thin frac(3 \( x - 1 / 3 x^3 + 1 / 5 x^5 + cal(O) \( x^7 \) \) - 3 x + x^3, x^5)\
 & = lim_(n arrow.r 0) thin frac(3 x - 3 x - x^3 + x^3 + 3 / 5 x^5 + cal(O) \( x^7 \), x^5)\
 & = lim_(n arrow.r 0) thin frac(3 / 5 x^5 + cal(O) \( x^7 \), x^5)\
 & = lim_(n arrow.r 0) thin 3 / 5 + cal(O) \( x^2 \) = 3 / 5\
 $

=== Question 5
<question-5>
Radius and interval of convergence for series
$ sum_(n = 0)^oo thin frac(x^n, 4^n ln \( n \)) $

#strong[Solution:]

Radius of convergence:
$ R & = lim_(n arrow.r oo) thin lr(|c_n / c_(n + 1)|)\
 & = lim_(n arrow.r oo) thin frac(4^(n + 1) ln \( n + 1 \), 4^n ln \( n \))\
 & = 4 lim_(n arrow.r oo) thin frac(ln \( n + 1 \), ln \( n \))\
 & = 4 lim_(n arrow.r oo) thin frac(1, n + 1) / 1 / n\
 & = #box(stroke: black, inset: 3pt, [$ 4 $]) $ Closed interval is
$\| x \| < 4 arrow.r.double.long x in \[ - 4 \, 4 \]$. We need to check
boundary:
$ sum_(n = 0)^oo thin frac(4^n, 4^n ln \( n \)) = sum_(n = 0)^oo thin frac(1, ln \( n \)) quad and quad frac(1, ln \( n \)) > 1 / n arrow.l.double.long ln \( n \) < n $
By #emph[Comparison Test] with harmonic series $sum 1 / n$, the series
diverges at $x = 4$.
$ sum_(n = 0)^oo thin frac(\( - 4 \)^n, 4^n ln \( n \)) = sum_(n = 0)^oo thin frac(\( - 1 \)^n, ln \( n \)) quad and quad frac(1, ln \( n + 1 \)) < frac(1, ln \( n \)) quad and quad lim_(n arrow.r oo) thin frac(1, ln \( n \)) = 0 $
By the #emph[Alternating Series Test];, the series converges
conditionally at $x = - 4$. Therefore, interval of convergence is
$x in \[ - 4 \, 4 \)$

=== Question 6
<question-6>
four series AC, CC, D test requiring full proof, can't recall

=== Question 7a
<question-7a>
Write the Taylor's polynomial using a provided $n$-th derivative
equation.

#strong[Solution:]

Used $ f \( x \) = sum_(n = 0)^oo frac(f^(\( n \)), n !) \( x - a \)^n $

=== Question 7b
<question-7b>
Use Taylor's Polynomial to evaluate $f^(\( 93 \))$ given
$f \( x \) = x^3 sin \( x^2 \)$

#strong[Solution:]

$ sin \( x \) & = sum_(n = 0)^oo thin \( - 1 \)^n frac(x^(2 n + 1), \( 2 n + 1 \) !)\
f \( x \) & = sum_(n = 0)^oo thin \( - 1 \)^n frac(x^(4 n + 2), \( 2 n + 1 \) !) dot.op x^3\
 & = sum_(n = 0)^oo thin \( - 1 \)^n frac(x^(4 n + 5), \( 2 n + 1 \) !)\
 $

Now compute:
$ f^(\( 93 \)) \( x \) & = 0 + dots.h.c + [\( - 1 \)^n frac(x^(4 n + 5), \( 2 n + 1 \) !)]^(\( 93 \)) + 0 + dots.h.c quad quad \( 4 n + 5 = 93 \)\
 & = \( - 1 \)^n frac(93 ! dot.op x^0, \( 2 n + 1 \) !) quad \( n = 22 \)\
 & = #box(stroke: black, inset: 3pt, [$ frac(93 !, 45 !) $]) $
