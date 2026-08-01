// Compile from the Literature-Review folder (root must include ../sources):
//   typst compile --root . typst/Admittance-Control-Literature-Review.typ typst/Admittance-Control-Literature-Review.pdf
#import "@preview/obsidius:0.1.1": *

#show: notes.with("Admittance Control for Physical Human-Robot Interaction")

// Obsidian-style notes have no heading numbers
#set heading(numbering: none)

// ---- Custom callouts (obsidian: abstract / quote / info / fact / hint / success) ----
// colors are (text-700, fill-100, stroke-300) to match the obsidius style
#let cl-abstract(title, body) = callout(emoji.notepad, title, body,
  (rgb("#0E7490"), rgb("#CFFAFE"), rgb("#67E8F9")))
#let cl-quote(title, body) = callout(emoji.book, title, body,
  (rgb("#334155"), rgb("#F1F5F9"), rgb("#CBD5E1")))
#let cl-info(title, body) = callout(emoji.info, title, body,
  (rgb("#1D4ED8"), rgb("#DBEAFE"), rgb("#93C5FD")))
#let cl-fact(title, body) = callout(emoji.pencil, title, body,
  (rgb("#7E22CE"), rgb("#F3E8FF"), rgb("#D8B4FE")))
#let cl-hint(title, body) = callout(emoji.lightbulb, title, body,
  (rgb("#B45309"), rgb("#FEF3C7"), rgb("#FCD34D")))
#let cl-success(title, body) = callout(emoji.checkmark, title, body,
  (rgb("#15803D"), rgb("#DCFCE7"), rgb("#86EFAC")))

// banner heading used inside the callouts
#let banner(body) = text(size: 1.15em, weight: "bold")[#body]

// boxed result
#let boxed(body) = align(center, rect(inset: 9pt, radius: 5pt,
  stroke: 1.2pt + rgb("#354052"), fill: rgb("#F9F9FB"))[#body])

// section rule
#let rule = line(length: 100%, stroke: 0.5pt + rgb("#D1D4DC"))

// symbol table helper
#let symbols(..rows) = table(
  columns: (auto, 1fr),
  align: (center + horizon, left + horizon),
  table.header([*Symbol*], [*Meaning*]),
  ..rows
)

#align(center, text(size: 1.6em, weight: "extrabold")[
  Admittance Control for Physical\
  Human--Robot Interaction
])

#v(0.3em)

#align(center)[
  DOI: #link("https://doi.org/10.1177/0278364918768950")[10.1177/0278364918768950]
  · Keemink A. et al. · IJRR 2018 · 2018-04-01
]

#v(0.5em)

#cl-abstract("Overview")[
  #banner[TL;DR --- Summary]
]

Admittance control measures the interaction force from the human and feeds it through a set of *virtual dynamics* $Y_v$ to generate the velocity reference of a low-level motion controller.
It is the dual of impedance control: rendering stiff virtual walls is easy, rendering *low inertia* is hard.
This paper builds one elaborate controller framework covering feed-forward control, force filtering, post-sensor inertia compensation, virtual damping, motion-reference phase lead, velocity-loop bandwidth, and internal robot flexibility, and analyzes each for passivity, coupled stability (*ez-width*), and admittance-tracking performance.
The core negative result is that a naive feedback-only admittance controller *cannot* passively render an inertia below the robot's own.
Seven design guidelines follow that recover low apparent inertia while keeping robust coupled stability.
All analyses are single-DOF, single-port, LTI.

#rule

#cl-quote("Definition")[
  #banner[Admittance Control, Simplest Case]
]

The measured external force $F_"ext"$ passes through the virtual dynamics $Y_v$ to produce a velocity reference $v_d$, which a velocity controller $C$ tries to enforce on the robot $Y_r$.
Force and velocity are power conjugates, so a velocity-tracking inner loop is the natural choice.

#figure(image("../sources/AdmittancePHRI/media/fig01-standalone-diagram.png", width: 85%),
  caption: [Stand-alone admittance control loop. $F_"ext"$ acts both through the controller path and directly on the robot dynamics $Y_r$.])

Once the human holds the device, the two systems form a single coupled system --- a force loop with negative feedback --- so stability now depends on the human's impedance $Z_h$.
Two separately stable systems can be unstable when coupled.

#figure(image("../sources/AdmittancePHRI/media/fig02-coupled-interconnection.png", width: 70%),
  caption: [The apparent admittance $Y_a$ in negative feedback with the human impedance $Z_h$.])

The design goal is therefore *energy passivity* of the apparent dynamics: the robot may not return more energy than was put into it,

$ integral_(-infinity)^t F(tau) v(tau) dif tau >= 0 $

which for an LTI single-DOF system is equivalent to $Y_a$ having no right-half-plane poles, only simple imaginary poles with positive residues, and being *positive real*:

$ Re{Y_a (j omega)} >= 0, quad forall omega in RR $

If passivity is given up, coupled stability still holds over a bounded range of human parameters.
That range is the *ez-width*, computed here as the region of limb stiffness and damping for which the coupled loop keeps a positive phase margin, with the human modelled as a passive second-order limb:

$ Z_h = m_h s + b_h + k_h / s $

#symbols(
  [$Y_v$, $Y_a$, $Y_r$], [Virtual (desired) admittance, Apparent admittance actually felt, Passive robot admittance],
  [$Z_h$], [Human limb impedance],
  [$F_"ext"$, $F^*$, $F_"int"$], [Total external force on robot, Voluntary human force, Force from intrinsic human dynamics],
  [$v_d$, $v$], [Velocity reference, Actual robot velocity],
  [$m_h$, $b_h$, $k_h$], [Human limb inertia, damping, and stiffness],
)

#rule

#cl-quote("Definition")[
  #banner[Physical Models: Electromechanical to Rigid Robot]
]

An actuator drives everything *before* the force sensor (inertia $m_r$, dissipation $b_r$); everything *behind* it --- sensor body, handle, cuff, or tool ($m_"ps"$) --- is what actually touches the human.
The sensor is assumed infinitely stiff and non-collocated with the actuator.

#figure(image("../sources/AdmittancePHRI/media/fig03-electromechanical-setup.png", width: 90%),
  caption: [Generic electromechanical setup: actuator, pre-sensor dynamics $m_r$, force sensor, post-sensor inertia $m_"ps"$, human limb $Z_h$.])

#cl-success("Understanding the Electromechanical Abstraction")[
  The paper conceptually starts with a complex real-world setup (Figure 3).
  To make the math manageable, the motor dynamics are lumped across the transmission ratio ($k_r$) directly into the robot's pre-sensor inertia ($m_r$) and damping ($b_r$):

  $ m_r = m_r' + m_m k_r^2, quad b_r = b_r' + b_m k_r^2 $

  #symbols(
    [$m_r'$, $b_r'$], [True physical inertia and damping of the robot structure],
    [$m_m$, $b_m$], [Inertia and damping of the motor/actuator],
    [$k_r$], [Transmission (gear) ratio],
  )

  *Explanation:* by reflecting the motor's physics through the gears ($k_r^2$) and combining them with the robot's physical structure, the entire system simplifies into two rigid masses separated by a force sensor: the combined robot mass ($m_r$) and the tool/cuff mass ($m_"ps"$).
]

#figure(image("../sources/AdmittancePHRI/media/fig05-rigid-robot.png", width: 90%),
  caption: [Rigid robot: $m_r + m_"ps"$ driven by $F_c$ and $F_"ext"$ with damping $b_r$, optionally coupled to the human $m_h$, $b_h$, $k_h$.])

The equation of motion, absorbing any human force into $F_"ext"$, is

$ (m_r + m_"ps") dot(v)(t) + b_r v(t) = F_"ext" (t) + F_c (t) + k_r F_"dst" (t) $

which in the Laplace domain, with the post-sensor inertial reaction kept on the right-hand side, becomes

$ (m_r s + b_r) v = F_"ext" - m_"ps" v s + F_c + k_r F_"dst" $

#symbols(
  [$m_r$], [Robot (pre-sensor) inertia, including reflected motor inertia],
  [$m_"ps"$], [Post-sensor inertia (cuff, handle, or tool)],
  [$b_r$], [Robot viscous damping],
  [$F_c$, $F_"dst"$], [Motor control force, Disturbance force],
)

#rule

#cl-info("Baseline")[
  #banner[Basic PI Controller (The Failure Case)]
]

The baseline is the naive controller: ideal sensors, no feed-forward, no compensation, a purely inertial virtual model, and a PI velocity loop.
The target is to make a 10 kg robot feel like 2 kg --- an inertia reduction of five.

$ Y_v = 1/(m_v s) $

The reference velocity is built from the measured force, which already contains the post-sensor inertial reaction $-m_"ps" v s$:

$ v_d = k_r Y_v (F_"ext" - m_"ps" v s) $

$ F_c = k_r (k_p s + k_i)/s (v_d - k_r v) $

Solving the loop gives the apparent admittance, which has three poles: one at the origin from the virtual inertia, and two stable poles from the PI controller --- so the robot is always stable in free air.

$ Y_a = 1/s (m_v s^2 + K_p s + K_i)/((m_r + m_"ps") m_v s^2 + a_1 s + a_0) $

Passivity of the uncoupled system, however, holds *if and only if*

$ m_v > 0 $

$ m_v >= K_p/(K_p + b_r) m_r approx m_r $

$ -b_r K_i >= 0 $

The last condition forces $k_i = 0$, sacrificing low-frequency tracking, because integral action piles extra phase lag onto an already marginally passive virtual inertia.
The middle condition is the damaging one: the passivity limit puts the apparent inertia back at the robot's own inertia.

#boxed[Passive inertia reduction is *not* possible with a pure virtual inertia and feedback control only.]

A high transmission ratio $k_r$ makes this worse, and both conditions push against the large gains needed for disturbance rejection.
The baseline system is therefore run non-passive, with a finite ez-width.

#figure(image("../sources/AdmittancePHRI/media/fig06-baseline-bode-ezwidth.png", width: 75%),
  caption: [(a) $bar(Y)_a$ follows $Y_v$ at low frequency up to a constant offset caused by $m_"ps"$, and falls back onto the robot dynamics $Y_r$ at high frequency; the passively tuned $""^pi Y_a$ performs no better than the bare robot. (b) ez-width grows with human limb inertia $m_h$.])

Every ez-width boundary passes through the origin, which says the coupled system is never stable against a pure spring or spring--mass human.
This is not seen in practice only because real limbs always dissipate --- limb damping is what buys the stiffness margin.

#rule

#cl-fact("The Universal Architecture")[
  #banner[The Universal Software]
]

#figure(image("../drawings/Admittance Controller Full Version.png", width: 100%),
  caption: [Full expansion of the apparent dynamics $Y_a$ (redrawn from the paper's Figure 4). Blue is the software controller, yellow the sensing, sampling and hold chain, pink the hardware current loop and differentiation, green the physical robot with its disturbance and post-sensor dynamics; "smp" marks the sampling of a continuous signal.])

$ Y_a = v/F_"ext" = (Y_r (H_d S_f (G_f + C' Y_v^*) + 1))/(Y_r (Z_"ps" + D) + 1) $

$ D = H_d (C_"fb" S_v k_r + G_f S_f Z_"ps" - C' Y_v^* delta_Z) $

$ C' = C_"fb" + C_"ff", quad Y_v^* = Y_v k_r, quad delta_Z = S_a hat(Z)_"ps" - S_f Z_"ps" $

$ H_d = H_"ZOH" H_i k_r $

$ C_"fb" = k_p + k_i/s + (k_d s)/(tau_d s + 1), quad C_"ff" = mu_"ff" s + beta_"ff" $

#symbols(
  [$C_"fb"$, $C_"ff"$], [Feedback controller (PID), Feed-forward controller],
  [$G_f$], [Force amplification gain],
  [$hat(Z)_"ps"$], [Software compensation model for post-sensor mass],
  [$H_"ZOH"$, $H_i$], [Zero-order hold dynamics, Hardware current-loop dynamics],
  [$S_v$, $S_f$, $S_a$], [Velocity, Force, and Acceleration sensor dynamics (low-pass filters)],
)

*Explanation:* the math block above is the master algebraic solution for the "kitchen sink" controller.
It maps out exactly how the real velocity $v$ responds to an external force $F_"ext"$ when _every single software trick_ --- feed-forward, force filtering, post-sensor mass compensation, zero-order holds, and PID feedback --- is activated at the same time.
The authors do not graph this master equation; instead, they use it as the mathematical parent to derive the seven guidelines below by turning features on and off one by one.

#rule

#cl-hint("Controller Modifications")[
  #banner[The Seven Guidelines for Minimal Inertia]
]

=== Guideline 1: Use Feed-Forward Control

If the drive can be commanded in torque (or current) mode, add force amplification $G_f$ and a feed-forward impedance $C_"ff" = mu_"ff" s + beta_"ff"$ alongside the PI feedback:

$ F_c = k_r ( (k_p s + k_i)/s (v_d - k_r v) + (mu_"ff" s + beta_"ff") v_d + G_f F_"ext" ) $

$ m_v >= ((K_p + beta_"ff" k_r^2) m_r - (K_p + b_r) mu_"ff" k_r^2)/((G_f k_r + 1)(K_p + b_r)) $

The feed-forward inertia $mu_"ff"$ is *subtracted from the robot inertia* in the numerator: it removes inertia before the feedback loop ever has to fight it.
The inertia-increasing effect of $beta_"ff"$ is cancelled by using $G_f > 0$, and setting $beta_"ff" k_r^2 >= b_r$ restores the freedom to use integral gain passively.
The resulting high-frequency apparent inertia is

$ m_"app" = (lim_(s -> infinity) (s Y_a))^(-1) = m_"ps" + m_r/((mu_"ff")/(m_r) k_r^2 + G_f k_r + 1) $

so without feed-forward the device always falls back to $m_"ps" + m_r$, and with it the floor is $m_"ps"$ --- the post-sensor mass can never be removed this way.
This is also the only guideline under which a high transmission ratio actually *helps* passivity.

#symbols(
  [$mu_"ff"$], [Feed-forward inertia compensation],
  [$beta_"ff"$], [Feed-forward damping compensation],
  [$G_f$], [Force amplification gain],
  [$m_"app"$], [High-frequency apparent inertia],
)

#figure(image("../sources/AdmittancePHRI/media/fig08-feedforward.png", width: 75%),
  caption: [Feed-forward ($G_f = 5$, $mu_"ff" = 10$ kg, $beta_"ff" = 2$ Ns/m) versus baseline: the admittance becomes passive (infinite ez-width) and tracks $Y_v$ far better at high frequency.])

=== Guideline 2: Avoid Force Filtering

Low-pass filtering the force signal to suppress noise or aliasing is tempting, and it is the wrong move for a purely inertial virtual model.
A filter of Butterworth order $n$

$ S_f (s) = B_n^(-1)(s) $

adds $n pi \/ 2$ rad of phase lag, which directly violates the relative-order constraint of the positive-real condition.
A single pole with time constant $tau_f$ changes the passivity bound to

$ m_v >= m_r K_p/(K_p + b_r) + K_p tau_f quad ("for " k_i = 0) $

i.e. the filter *raises* the minimum virtual inertia, so ez-width shrinks and high-frequency tracking degrades.
The exception is damping or stiffness rendering, where the filter's extra pole simply turns the virtual model into an inertial one:

$ Y_v (s) B_2 (s) = s/k_v 1/(tau_c^2 s^2 + 2 zeta tau_c s + 1) = s/(m_v' s^2 + b_v' s + k_v) $

If anti-aliasing makes a filter unavoidable, keep the bandwidth as high and the order as low as possible.

#symbols(
  [$B_n (s)$], [Butterworth polynomial of order $n$],
  [$tau_f$], [Force filter time constant],
  [$zeta$], [Filter relative damping],
  [$m_v'$, $b_v'$], [Equivalent virtual inertia and damping inadvertently created by the filter],
)

#figure(image("../sources/AdmittancePHRI/media/fig09-force-filtering.png", width: 75%),
  caption: [First-order force filter ($tau_f = 0.05$ s, deliberately extreme) versus baseline: more phase lag, worse high-frequency tracking, reduced ez-width.])

=== Guideline 3: Compensate Post-Sensor Inertia

Neither the baseline nor feed-forward removes the post-sensor mass.
It can be cancelled in software with an impedance-form compensator driven by measured acceleration:

$ hat(Z)_"ps" S_a = mu_c/(tau_c s + 1) $

$ Y_(a,"low-freq") approx 1/s lim_(s -> 0) (s Y_r) = 1/(s (m_v + m_"ps" - mu_c)) $

Setting $mu_c = m_"ps"$ cancels it completely, and pushing further gives *negative* inertia, which lightens the limb attached to the robot (this needs $tau_c > 0$ and some limb damping $b_h > 0$).
The price is stability: the compensation inertia enters the passivity bound exactly like robot inertia,

$ m_v >= K_p/(K_p + b_r) (m_r + mu_c) quad ("for " tau_c = 0) $

so ez-width is reduced. This is the one guideline that trades coupled stability directly for performance.

#symbols(
  [$mu_c$], [Compensation inertia],
  [$tau_c$], [Compensation low-pass time constant],
)

#figure(image("../sources/AdmittancePHRI/media/fig10-postsensor-compensation.png", width: 90%),
  caption: [Post-sensor compensation ($mu_c = 2$ kg, $tau_c = 0.1$ s) versus baseline: better low-frequency tracking, added phase lag, smaller ez-width.])

=== Guideline 4: Use Some Virtual Damping

Adding a little damping to the virtual model

$ Y_v = 1/(m_v s + b_v) $

is barely felt by the user but injects phase lead near the region of excessive phase lag.
It relaxes the integral-gain limit from $k_i = 0$ to a finite budget,

$ K_i <= b_v ((K_p + b_v)(K_p + b_r))/(b_r m_v + b_v m_r) $

with the extra trivial condition $b_v K_i^2 >= 0$.
Because $K_i$ can now be non-zero, low-frequency admittance tracking improves and ez-width grows.
Note that the bound on $m_v$ is *unchanged* --- virtual damping buys stability, not lower inertia --- and the damping itself dissipates, impeding motion.
It pays off most when the velocity loop is slow or delay-ridden.

#symbols(
  [$b_v$], [Virtual damping injected to provide stabilizing phase lead],
)

#figure(image("../sources/AdmittancePHRI/media/fig11-virtual-damping.png", width: 75%),
  caption: [Virtual damping ($b_v = 2$ Ns/m) versus baseline: reduced phase lag and a larger ez-width.])

=== Guideline 5: Modify the Velocity Reference

When retrofitting an industrial robot whose PI velocity loop is a black box, feed-forward is not available.
Phase lead can instead be added on the *reference* side, as acceleration feed-forward with gain $k_a$:

$ Y_v = (s k_a + 1) Y_v' $

$ m_v >= (K_p m_r - k_a (K_p^2 + K_p b_r - K_i m_r))/(K_p + b_r) $

$ 0 <= (k_a K_i - b_r) K_i $

The conditions advise a low-inertia robot and a not-too-large $K_i$ (rarely binding, since $K_p$ dominates), and they make integral gain passively usable.
Unlike guidelines 1 and 3, this needs no acceleration sensor --- the acceleration comes from the virtual dynamics themselves.
With a high transmission ratio the condition collapses to $k_a >= 0$, i.e. any positive phase lead is passive.

#symbols(
  [$k_a$], [Phase-lead (acceleration feed-forward) gain],
  [$Y_v'$], [Intended virtual dynamical behavior],
)

#figure(image("../sources/AdmittancePHRI/media/fig12-phase-lead.png", width: 70%),
  caption: [Phase lead ($k_a = 1$) versus baseline: better admittance tracking, less phase lag, and a passive system.])

=== Guideline 6: Increase Velocity Loop Bandwidth

The passivity conditions above keep asking for low $k_p$ and $k_i$, yet high bandwidth is what actually widens the ez-width: it pushes the excessive phase lag up in frequency, so a stiffer human is needed to destabilize the loop.
Higher gains also reject motor-side friction and parasitic dynamics better.
The recommendation is therefore to raise bandwidth and abandon strict passivity.

Band-limited differential action is one way to get there:

$ C_"fb" = k_p + k_i/s + (k_d s)/(tau_d s + 1) $

$ m_v >= (K_p m_r + b_r K_i tau_d^2 - b_r K_d)/(K_p + b_r) $

The differentiator's zero improves high-frequency tracking and increases ez-width drastically, though a second condition still forbids passive inertia reduction whenever $K_i != 0$ and $tau_d != 0$.

The other route is removing delay. The zero-order hold

$ H_"ZOH" = (1 - e^(-s T_s))/(s T_s) $

contributes $-90 degree$ at the Nyquist frequency $omega_N = pi \/ T_s$, so a shorter sample time $T_s$ (and a shorter current-loop delay) moves the phase lag out of the interaction band.

#symbols(
  [$K_d$], [Reflected differential velocity gain ($k_d k_r^2$)],
  [$tau_d$], [Differentiator band-limiting time constant],
  [$H_"ZOH"$], [Zero-order hold creating pure digital delay],
)

#figure(image("../sources/AdmittancePHRI/media/fig13-differential-control.png", width: 90%),
  caption: [Band-limited differential control ($k_d = 25$ kg, $tau_d = 0.1$ s) versus baseline: less phase lag, better high-frequency tracking, much larger ez-width.])

=== Guideline 7: Optimize for Robot Stiffness

A robot with a low-frequency resonance is modelled as two inertias, distal $m_r gamma$ and proximal $m_r gamma'$, joined by structural stiffness $k_s$ and damping $b_s$.
The force sensor is now non-collocated with the actuator, and the velocity fed back is the proximal one:

$ (m_r gamma' s + b_r) v' = F_c + k_r F_"dst" + (v - v') (k_s/s + b_s) $

$ m_r gamma s v = F_"ext" - m_"ps" v s - (v - v') (k_s/s + b_s) $

$ F_c = k_r (k_p s + k_i)/s (v_d - k_r v') $

The passivity conditions are too involved to read as design rules, but the hard floor is

$ m_("app",min) = m_r gamma $

Internal flexibility inserts phase lag between force measurement and velocity measurement, so ez-width falls as $k_s$ or $b_s$ drop and as $gamma$ grows.
Setting $gamma = 0$ recovers a series elastic actuator with $k_s$ as the sensing spring --- which the analysis says should work well under admittance control.

#symbols(
  [$gamma$, $gamma'$], [Distal / proximal inertia fractions ($gamma' = 1 - gamma$)],
  [$k_s$, $b_s$], [Structural (or series elastic) stiffness and damping],
  [$v'$], [Proximal (motor-side) velocity],
)

#figure(image("../sources/AdmittancePHRI/media/fig14-flexible-robot.png", width: 70%),
  caption: [Flexible robot: two inertias $m_r gamma$ and $m_r gamma'$ coupled by $k_s$ and $b_s$.])

#figure(image("../sources/AdmittancePHRI/media/fig15-internal-stiffness.png", width: 70%),
  caption: [Internal flexibility ($gamma = 0.5$, $k_s = 1000$ N/m, $b_s = 100$ N/m) versus baseline: more phase lag and reduced ez-width.])

#rule

#cl-hint("Reference")[
  #banner[Guideline Summary (Paper Table 3)]
]

#table(
  columns: (auto, auto, 1fr),
  align: (center + horizon, left + horizon, left + horizon),
  table.header([\#], [*Guideline*], [*Motivation*]),
  [1], [Use feed-forward control], [Effectively lowers the robot inertia that the admittance controller has to reduce],
  [2], [Avoid force filtering], [Introduces excessive phase lag onto a marginally passive virtual inertia model],
  [3], [Compensate post-sensor inertia], [Reduces apparent inertia, but significantly reduces coupled stability margins],
  [4], [Use some virtual damping], [Allows better low-frequency tracking of the admittance],
  [5], [Modify the velocity reference], [Non-physical phase lead gives better tracking of a pure inertial model and increases coupled stability margins],
  [6], [Increase velocity loop bandwidth], [Pushes excessive phase lag to higher frequencies, so a stiffer environment is needed to destabilize the coupled system],
  [7], [Optimize for robot stiffness], [Internal resonant modes introduce phase lag between force and velocity measurement],
)

*Stated limitations.* The analyses are single-DOF, rigid (except guideline 7), and vary one parameter at a time --- multi-DOF energetic coupling, distributed compliance, and combined guideline interactions are untreated.
Guidelines 3 and 6 need acceleration and clean velocity estimates, which in practice are quantized and noisy enough to be felt as a grindy interaction.
Post-sensor dynamics are assumed purely inertial; in practice backlash and post-sensor flexibility produce limit cycles the model does not predict.
