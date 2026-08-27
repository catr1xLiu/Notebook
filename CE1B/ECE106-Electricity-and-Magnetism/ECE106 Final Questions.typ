#import "@preview/obsidius:0.1.1": *
#show: notes.with("ECE106 Final Questions")

== Question 1
<question-1>
The capacitance of a parallel power transmission line with small width
on top and large width in bottom plate is hard to compute without FEM
software. We are asked to determine the capacitance of this simplified
model: - $+ Q$ charge at (0, H) - three point charges of $- Q / 3$ at
$\( - d \, 0 \) \, thin \( 0 \, 0 \) \, thin \( d \, 0 \)$.

#figure(image("./media/final_q1_powerline.png"),
  caption: [
    Parallel-plate transmission line approximated by +Q at height H
    above three -Q/3 charges spaced d apart
  ]
)

I got stuck when hesitating between ways to compute potential
difference. I tried to do
$integral arrow(E) thin accent(upright(d) l, ⃗)$ but $arrow(E)$ is
infinite when we are close to the charges, this wasted a lot of time.
Then I tried an alternative way:
$ upright("Ep")_(\( - 3 \* \( Q \/ 3 \) \)) - upright("Ep")_(\( Q \)) = 2 thin frac(1, 4 pi epsilon.alt_0) thin integral_H^oo frac(Q^2 \/ 3, y^2) + frac(2 Q^2 \/ 3, y^2 + d^2) thin y / sqrt(y^2 + d^2) thin d y $
$ Delta V = upright("Ep")_(\( - 3 \* \( Q \/ 3 \) \)) / Q - upright("Ep")_(\( Q \)) / Q = 2 frac(Q \/ 3, 4 pi epsilon.alt_0) thin (1 / H + 2 / sqrt(H^2 + d^2)) $
I forgot to do the final step to compute $C = frac(Q, Delta V)$

== Question 2
<question-2>
Ask for difference between of conservativeand non-conservative field,
and an example of each.

I screwed this one up. I remember that conservative force are force that
does not change total energy, every work done is converted from
potential energy, examples
${ accent(g } \, arrow(F_B) = arrow(B) v q \, arrow(F_E) = arrow(E) q, ⃗)$.
But I failed to recall that we've every learned any field that is
non-conservative in that extend. So I thought maybe conservative fields
does no work at all while non-conservative field does work by trading
potential energy. I wrote $arrow(B)$ on charge $q$ as conservative field
example because work is always 0; and I put $arrow(E)$ on charge q as
non-conservative field, because work is non-zero.

== Question 3
<question-3>
Two infinite current-carrying sheet. Infinite width in both directions
in the x-axis, thickness $t = 1 upright(m m)$, separation
$2 upright(m m)$ carrying current of density
$arrow(J) = 5 thin upright(A m p s) \/ upright(m)^2 thin dot.op hat(z)$
(out of the page) and
$arrow(J) = 2 thin upright(A m p s) \/ upright(m)^2 thin dot.op \( - hat(z) \)$
(into the page). Determine the magnetic field (magnitude + direction)
above and below the double-sheet system.

#figure(image("./media/final_q3_sheets.png"),
  caption: [
    Two infinite current sheets of thickness 1 mm separated by 2 mm with
    an Amperian loop
  ]
)

Isolating each sheet, draw a very large Amper's loop:
$ integral.cont arrow(B) thin dot.op accent(upright(d) l, ⃗) = mu_0 thin I_(upright("enc")) quad arrow.r.double.long quad 2 l lr(|B|) = mu_0 \( l t \| J \| \) quad arrow.r.double.long quad \| B \| = frac(mu_0 t \| J \|, 2 l) $
By right hand rule, direction of magnetic field due to upper sheet is
CCW, which yields rightwards above and leftwards below; direction of
magnetic field due to lower sheet is CW, which yields leftwards above
and rightwards below. Based on that, the net magnetic field at above the
two sheets and below the two sheets are both:
$ arrow(B) = hat(x) dot.op (frac(- mu_0 t \| J_u \|, 2 l) + frac(mu_0 t \| J_l \|, 2 l)) = 1.867 times 10^(- 9) thin upright(H) thin upright(" leftwards") $

== Question 4
<question-4>
A conducting loop (1) is connected to a source gated by a switch, beside
it sits another conducting loop (2) with resistor $R$. The switch
toggles at: - Case 1: 10 Millions times per second - Case 2: 100
Millions times per second We are to determine: 1. Which case yields
higher average current in loop 2, with detailed justification 2. All
variables affecting the magnitude of induced EMF

#figure(image("./media/final_q4_loops.png"),
  caption: [
    Loop 1 driven by a switched source beside loop 2 with resistor R
  ]
)

If we assume that for a non-perfect conductor loop 1, it is some
internal capacitance, some self-inductance and some resistance combined,
which can be considered as a total impedance. Toggling switch should
yield current like this: #box(image("./media/final_q4_switching.png"))
It is obvious that higher frequency yields higher average magnitude of
rage of change of current. And:
$ cal(E) = - frac(d, d t) integral.double_(upright("Loop2")) arrow(B) dot.op accent(upright(d) A, ⃗) quad quad \| B \| upright(" (at any point)") prop I_(upright("Loop1")) $
So case 2 should produce higher average induced EMF, and also higher
current: $ I_(upright("Loop2")) = cal(E) / R_(upright("Loop2")) $

Furthermore, we can denote induced emf as:
$ cal(E) = - frac(d, d t) integral.double_(upright("Loop2")) [integral.cont_(upright("Loop1")) frac(mu_0 I_(upright("Loop1")) \( accent(upright(d) l, ⃗) times arrow(r) \), 4 pi r^2)] dot.op accent(upright(d) A, ⃗) $
Simplify:
$ cal(E) = - k frac(d I, d t) quad quad quad k = integral.double_(upright("Loop2")) [integral.cont_(upright("Loop1")) frac(mu_0 \( accent(upright(d) l, ⃗) times arrow(r) \), 4 pi r^2)] dot.op accent(upright(d) A, ⃗) $
Therefore, all variables that affect the magnitude of induced emf are: -
Constant term $frac(mu_0, 4 pi)$ doesn't change, not variables - Shape
and area of loop 1 - Shape and area of loop 2 - Relative position of the
two loops (this simplifies to distance between two loops if they are in
the same plane) - Internal capacitance, self-inductance and resistance
of loop 1 - Frequency at which the switch is toggled

== Question 5
<question-5>
Find magnetic field for a current-carrying wire with cross-section
radius $a$ at distance $r$, in two cases: - Case 1: the cross-section of
the wire has uniform current density - Case 2: the current density
follows a $r^3$ degree distribution

Once again, the prof did not specify whether we are given total current
$I$ or the coefficient $J_0$ for both cases.

For both cases, we assume the wire is infinitely long, we have:
$ integral.cont arrow(B) dot.op accent(upright(d) l, ⃗) = mu_0 I_(upright("enc")) quad arrow.r.double.long quad \| B \| = frac(mu_0 I_(upright("enc")), 2 pi r) $
In case we don't know $I_(upright("enc"))$, for case 1 and 2 we have,
respectively:
$ I_(upright("enc")) med upright("(Uniform)") = & pi a^2 J quad\
I_(upright("enc")) med \( r^3 upright(" distribution") \) = & integral_0^a 2 pi x dot.op x^3 J_0 thin d x = 2 / 5 pi a^5 J_0 $

== Question 6
<question-6>
#figure(image("./media/final_q6_sheet.png"),
  caption: [
    Current sheet of width w and thickness t with field point P at
    distance d from the edge
  ]
)

Find magnetic field at point $P$, given:
$ t = 2 upright(" mm") \, quad J = 10 upright(" A/m")^2 \, quad w = d = 20 upright(" cm") $
Compute:
$ parallel arrow(B) parallel = integral_(- w \/ 2)^(w \/ 2) frac(mu_0 t J, 2 pi \( d - x \)) thin d x = frac(mu_0 t J, 2 pi) ln lr(|frac(d + w \/ 2, d - w \/ 2)|) = 4.394 times 10^(- 9) upright(" H") $
