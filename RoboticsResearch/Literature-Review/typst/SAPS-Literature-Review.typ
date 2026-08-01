// Compile from the Literature-Review folder (root must include ../media):
//   typst compile --root . typst/SAPS-Literature-Review.typ typst/SAPS-Literature-Review.pdf
#import "@preview/obsidius:0.1.1": *

#show: notes.with("Shared Autonomy for Policy Steering (SAPS)")

// Obsidian-style notes have no heading numbers
#set heading(numbering: none)

// ---- Custom callouts (obsidian: abstract / info / fact / hint) ----
// colors are (text-700, fill-100, stroke-300) to match the obsidius style
#let cl-abstract(title, body) = callout(emoji.notepad, title, body,
  (rgb("#0E7490"), rgb("#CFFAFE"), rgb("#67E8F9")))
#let cl-info(title, body) = callout(emoji.info, title, body,
  (rgb("#1D4ED8"), rgb("#DBEAFE"), rgb("#93C5FD")))
#let cl-fact(title, body) = callout(emoji.pencil, title, body,
  (rgb("#7E22CE"), rgb("#F3E8FF"), rgb("#D8B4FE")))
#let cl-hint(title, body) = callout(emoji.lightbulb, title, body,
  (rgb("#B45309"), rgb("#FEF3C7"), rgb("#FCD34D")))

// banner heading used inside the callouts
#let banner(body) = text(size: 1.15em, weight: "bold")[#body]

// boxed result
#let boxed(body) = align(center, rect(inset: 9pt, radius: 5pt,
  stroke: 1.2pt + rgb("#354052"), fill: rgb("#F9F9FB"))[#body])

// section rule
#let rule = line(length: 100%, stroke: 0.5pt + rgb("#D1D4DC"))

#align(center, text(size: 1.6em, weight: "extrabold")[
  Shared Autonomy for Policy Steering by Blending\
  Teleoperation with a Pretrained VLA
])

#v(0.5em)

#cl-abstract("Overview")[
  #banner[TL;DR — The Benefit of Shared Autonomy]
]

Shared autonomy provides a "best of both worlds" approach by blending human intent
with a robot's learned behaviors. SAPS *significantly improves task success rates*
and robustness against out-of-distribution (OOD) scenarios compared with pure
autonomous execution while requiring fewer active-control timesteps than pure
teleoperation. In simulation, it also completes tasks faster than both baselines by
relying on the policy for nominal low-level motion and on the human for corrective
steering.

The paper does *not* directly establish a reduction in cognitive workload. It
measures the fraction of timesteps containing human commands, not attention, fatigue,
vigilance, or perceived workload. On real hardware, the completion-time advantage over
teleoperation is also task-dependent rather than universal.

#figure(image("../media/blob.png", width: 100%),
  caption: [SAPS conceptual overview.])

#rule

#cl-info("Introduction")[
  #banner[Overview of SAPS]
]

Vision-Language-Action (VLA) models have strong zero-shot capabilities but are brittle
under spatial or semantic perturbations (e.g., changed object placement or appearance).
To address this, the authors propose #underline[#text(fill: rgb("#dab1da"), weight: "bold")[SAPS]]
(Shared Autonomy for Policy Steering), a model-agnostic framework that blends real-time
human teleoperation commands with pretrained VLA actions.

Unlike prior policy steering methods, SAPS operates at the action level and requires:

- *No* policy retraining
- *No* auxiliary dynamics models
- *No* modifications to diffusion samplers or architectural changes

#rule

#cl-fact("Framework Details")[
  #banner[Methodology]
]

#figure(image("../media/pipeline.png", width: 100%),
  caption: [SAPS pipeline.])

Symbols:

#table(
  columns: (auto, 1fr),
  align: (center + horizon, left + horizon),
  table.header([*Symbol*], [*Meaning*]),
  $bold(a)_"expert"$, [Human Action],
  $bold(a)_"VLA"$, [VLA Action],
  $bold(a)_"blended"$, [Remixed Output],
  $a_"final"^((7))$, [Claw Output],
  $alpha$, [Weight of VLA],
  $epsilon$, [Dead-band of Controller],
  $theta$, [Angle],
  $sigma$, [Sigmoid function],
)

=== #underline[Shared Autonomy Arbitration]

We define the action output of the expert and the VLA as:
$
bold(a)_"expert", bold(a)_"VLA" in RR^7 : quad
lr(⟨ v_x, v_y, v_z, omega_x, omega_y, omega_z, "Claw" ⟩)
$

Use linear interpolation of a weight $alpha$:
$
bold(a)_"blended"^((1:6))
= alpha bold(a)_"VLA"^((1:6))
+ (1 - alpha) bold(a)_"expert"^((1:6))
$

A threshold is imposed on the expert:
$
norm(bold(a)_"expert"^((1:6)))_2 <= epsilon
==> alpha = 1
$

Claw handled separately:
$ a_"final"^((7)) = max(a_"VLA"^((7)), a_"expert"^((7))) $

=== #underline[Takeover Arbitration]

Human overrides VLA output entirely:
$
alpha = cases(
  0 & "if" norm(bold(a)_"expert"^((1:6)))_2 > epsilon,
  1 & "if" norm(bold(a)_"expert"^((1:6)))_2 <= epsilon
)
$

=== #underline[Equal Blending Between Policy and Teleoperation]

Human steers the VLA output using a fixed weight:
$
alpha = cases(
  0.5 & "if" norm(bold(a)_"expert"^((1:6)))_2 > epsilon,
  1 & "if" norm(bold(a)_"expert"^((1:6)))_2 <= epsilon
)
$

=== #underline[Cosine Similarity Confidence-Based Blending]

Cosine similarity compares the *directional agreement* between human and policy
action, which then decides how much weight is given to the human.

#figure(image("../media/cosine-blending.png", width: 100%),
  caption: [Cosine blending: the angle $theta$ between the policy output
    $a_"policy"$ and the operator input $a_"expert"$ sets the remixed output.])

Measure the directional agreement using:
$
c = cos(theta)
= (bold(a)_"expert"^((1:6)) dot bold(a)_"VLA"^((1:6)))
/ (norm(bold(a)_"expert"^((1:6)))_2 norm(bold(a)_"VLA"^((1:6)))_2)
$

Scale it through the *sigmoid function* (see notes: _Sigmoid Function_ —
"Neural Network with PyTorch"):
$
alpha = sigma(8 cos(theta))
$

#figure(image("../media/saps-cosine-arbitration.png", width: 70%),
  caption: [Cosine similarity mapped to the VLA arbitration weight through a
    sigmoid with gain 8.])

#link("../saps-action-arbitration-demo.html")[See interactive demo written by Codex].

#rule

#cl-hint("Experimental Results")[
  #banner[Experiments & Key Findings]
]

=== Benchmarks

SAPS was evaluated in:
- *Simulation benchmarks* including: LIBERO, LIBERO-PRO, CALVIN
- *Real robot*: Franka arm

Simulation tasks include object replacement and swapping, sorting mugs, and opening a
drawer to place an object inside.

#figure(image("../media/saps-simulation-task-examples.png", width: 80%),
  caption: [LIBERO-PRO simulation rollouts for object placement, mug sorting, and
    drawer manipulation.])

=== 1. Near-Perfect Success Rate

SAPS recovers near-teleoperation success even when the policy $pi_0.5$ is old and the
autonomous mode fails frequently.

#figure(image("../media/success-rate.png", width: 100%),
  caption: [CALVIN subtask success rates for DP, ITPS, DynaGuide, and Cosine
    arbitration.])

=== 2. ~30% Human Step-in

In LIBERO-PRO, it needs human input on only $10.8$–$30.0%$ of timesteps; in the main
CALVIN evaluation, Cosine needs $13.7%$.

#figure(image("../media/success-rate-vs-intervention-rate.png", width: 75%),
  caption: [LIBERO-PRO success rate versus human intervention rate.])

=== 3. Surprisingly, Faster than Human?

In simulation, SAPS is faster than both autonomy and teleoperation.

#figure(image("../media/saps-libero-pro-completion-time.png", width: 100%),
  caption: [LIBERO-PRO completion time by task and control method.])

=== 4. Not that Impressive on Real Robot

On hardware, it achieves $93.3$–$98.3%$ mean success with human input for roughly half
to two-thirds of the rollout, but is not consistently faster than teleoperation.

#figure(image("../media/saps-hardware-completion-time.png", width: 60%),
  caption: [Real-world completion time by task and control method.])

#rule

#cl-fact("Reflection")[
  #banner[My Read]
]

=== 1. The Method is Highly Adaptable

The paper is mainly an experiment paper; even with no source code, the heart algorithm
can be implemented within a few lines of Python.

And take-over actually works, in my opinion.

Teleoperation can be replaced with anything that outputs a continuous delta
$[J] in RR^6$, including *Haply Inverse*.

=== 2. Operators are constrained, but...

Operators are constrained to a simple controller, which degrades their performance.
But this is actually a feature, not a limit. We will essentially allow operators to
work from a remote office with a simple setup and still operate at higher performance,
utilizing the VLA as an extension to the human operator's ability where they have a
constrained setup.

=== 3. On the Benefit of Shared Autonomy

The current results of shared autonomy could be cherry-picked, and this benefit
disappears on the real robot. Intervention rate measures controller activity,
*not cognitive workload or attention*. Combining a shared autonomy method with
*human cognition sensing* would be great future work.

=== 4. Will force VLA benefit from this?

Force VLA extends the operator's ability even more, since it is nearly impossible for
human operators to perform force-abundant tasks during remote control.

=== #underline[Question 1: What is the Application of Shared Autonomy?]

The paper reports active-input rates, but does not measure cognitive load, fatigue, or
sustained attention. Your autopilot analogy is reasonable: SAPS reduces manual control,
but the operator may still need to monitor continuously. Whether one person could
supervise multiple robots remains unanswered.

=== #underline[Question 2: What Is the Paper's Contribution?]

Pure teleoperation *is* included as a baseline. SAPS approaches its reliability with
much less active input. The algorithm is simple; the main contribution is showing that
post-inference action blending works across several benchmarks and real hardware
without retraining or modifying the VLA.

=== #underline[Question 3: How Was Human Input Obtained?]

They use a keyboard or gamepad; Cosine uses the gamepad because continuous joystick
commands make directional comparison smoother. The paper does not provide the control
mapping or discuss Haply devices. My inference is that SAPS only needs coarse corrective
direction — the VLA supplies the fine motion — so a high-fidelity spatial controller was
unnecessary for this experiment.

#rule

#cl-fact("Aside")[
  #banner[The policy moves faster, after being corrected]
]

For `swap_soup_cheese`:

$ T_H = 22.1 (0.107) = 2.365 " s" $

Assuming the human always moves at the $0.2 "m/s"$ cap:

$ L_H <= 2.365 (0.2) = 0.473 " m" $

Therefore, during policy-controlled timesteps:

$ T_pi = 22.1 - 2.365 = 19.735 " s" $
$ L_pi >= 3.56 - 0.473 = 3.087 " m" $
$ macron(v)_(pi, "SAPS") >= 3.087 / 19.735 = 0.1564 " m/s" $

Compared with autonomous execution:

$ macron(v)_(pi, "alone") = 3.37 / 33.2 = 0.1015 " m/s" $

So the policy-controlled portions of SAPS achieve at least approximately:

#boxed[$54% " higher effective motion speed"$]
