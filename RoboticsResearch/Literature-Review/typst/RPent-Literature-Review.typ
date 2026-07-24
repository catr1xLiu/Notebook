// Compile from the Literature-Review folder (root must include ../media):
//   typst compile --root . typst/RPent-Literature-Review.typ typst/RPent-Literature-Review.pdf
#import "@preview/obsidius:0.1.1": *

#show: notes.with("Harness VLA (RPent)")

// Obsidian-style notes have no heading numbers
#set heading(numbering: none)

// ---- Custom callouts (obsidian: abstract / info / fact / hint / example) ----
// colors are (text-700, fill-100, stroke-300) to match the obsidius style
#let cl-abstract(title, body) = callout(emoji.notepad, title, body,
  (rgb("#0E7490"), rgb("#CFFAFE"), rgb("#67E8F9")))
#let cl-info(title, body) = callout(emoji.info, title, body,
  (rgb("#1D4ED8"), rgb("#DBEAFE"), rgb("#93C5FD")))
#let cl-fact(title, body) = callout(emoji.pencil, title, body,
  (rgb("#7E22CE"), rgb("#F3E8FF"), rgb("#D8B4FE")))
#let cl-hint(title, body) = callout(emoji.lightbulb, title, body,
  (rgb("#B45309"), rgb("#FEF3C7"), rgb("#FCD34D")))
#let cl-example(title, body) = callout(emoji.package, title, body,
  (rgb("#4338CA"), rgb("#E0E7FF"), rgb("#A5B4FC")))

// banner heading used inside the callouts
#let banner(body) = text(size: 1.15em, weight: "bold")[#body]

// boxed result
#let boxed(body) = align(center, rect(inset: 9pt, radius: 5pt,
  stroke: 1.2pt + rgb("#354052"), fill: rgb("#F9F9FB"))[#body])

// pink highlight used for <strong style="color:#a0399f">
#let hl(body) = underline(text(fill: rgb("#a0399f"), weight: "bold")[#body])

// section rule
#let rule = line(length: 100%, stroke: 0.5pt + rgb("#D1D4DC"))

#align(center, text(size: 1.5em, weight: "extrabold")[
  Harness VLA: Steering Frozen VLAs into Reliable\
  Manipulation Primitives via Memory-Guided Agents
])

#align(center, text(fill: rgb("#98A1AE"), size: 0.9em)[
  arXiv: #link("https://arxiv.org/abs/2607.08448")[2607.08448] · Yixian Zhang, Huanming Zhang et al. · 2026-07 \
  Project: #link("https://harnessvla.github.io/")[harnessvla.github.io] ·
  Code: #link("https://github.com/RLinf/RPent")[RLinf/RPent]
])

#v(0.4em)

#cl-abstract("Overview")[
  #banner[TL;DR — A Frozen VLA as One Retryable Primitive]
]

Harness VLA wraps a *frozen* VLA as a single contact-rich primitive, #hl[vla_act],
and lets an LLM planner compose it with a small *fixed* library of analytic primitives
(move, rotate, grip, release, navigate). Semantic re-grounding, transport, staging, and
re-staging move up to the planner; the VLA is invoked only for local contact-rich
phases. Two memory modules — per-task success traces and a global rule/failure store —
teach the planner _how to orchestrate_ the fixed primitives rather than expanding the
skill set. Without any VLA fine-tuning, it beats the strongest baselines by $38.6$ and
$25.4$ points on LIBERO-Pro and RoboCasa365, and reaches $58.4%$ on RoboTwin C2R.

#figure(image("../media/system-overview.png", width: 100%),
  caption: [Harness VLA system overview: an agentic planner selects JSON primitive
    calls from a fixed library, exposing the frozen VLA as `vla_act` and using analytic
    primitives for staging/transport/release, backed by Task Specific and Global
    Memory.])

#rule

#cl-info("Introduction")[
  #banner[The Wrong-Responsibility Problem]
]

Two paradigms attack language-conditioned manipulation from opposite ends, and each
overloads the wrong component. *End-to-end VLAs* absorb language grounding,
long-horizon composition, and low-level control into one policy — strong at contact,
brittle when instructions are redirected, goals re-bound, or layouts shifted. *LLM
coding agents* reason well but realize physical contact through hand-designed analytic
APIs that fail at irregular grasping and articulated objects.

Harness VLA's response: keep the primitive library *fixed and small*, use analytic
primitives to traverse the perturbed non-contact space, and invoke the frozen VLA
_only_ inside local contact-rich regions where its training distribution is informative.

#figure(image("../media/primitive-composition.png", width: 80%),
  caption: [Deployment perturbations expand task configurations beyond the frozen VLA's
    in-distribution trajectories; a direct rollout fails bridging the gap, while
    Harness VLA decomposes into analytic motion between VLA-compatible local regions.])

#rule

#cl-fact("Framework Details")[
  #banner[Methodology]
]

The system is an autoregressive, turn-based loop between a planner $Pi$ and a physics
engine. Every low-level mechanism — the frozen VLA $f_theta$ _and_ all deterministic
operational-space controllers — is unified into one predefined primitive library
$cal(P)$; the planner never emits torques or action chunks, only a primitive choice
with bound arguments.

Symbols:

#table(
  columns: (auto, 1fr),
  align: (center + horizon, left + horizon),
  table.header([*Symbol*], [*Meaning*]),
  $cal(E)$, [Environment (MuJoCo/Robosuite)],
  $o_t = (I_t^"rgb", I_t^"d", q_t)$, [Observation: RGB, co-aligned depth, proprioception],
  $ell$, [Task language],
  $cal(G)$, [Binary completion predicate],
  $Pi$, [Agentic planner (the LLM)],
  $f_theta$, [Frozen pretrained VLA],
  $cal(P)$, [Primitive library],
  $c_t$, [Primitive invocation at turn $t$],
  $tau$, [`vla_act` early-return predicate],
  $pi_"RLinf"$, [Frozen $pi_0.5$ checkpoint used inside `vla_act`],
)

=== #underline[Agentic Execution Loop]

At each turn the planner reads the observation, task language, and retrieved memory,
then emits one JSON primitive; the engine runs it to its internal post-condition and
returns the next observation. The loop is, schematically:

$
c_t = Pi (o_t, ell, "TSM", "GM"), quad
o_(t+1) = cal(E)(c_t), quad
"until " cal(G) = 1 " or budget exhausted"
$

where $"TSM"$ is Task Specific Memory and $"GM"$ is Global Memory. The planner sees only
serialized observations — never privileged simulator state or oracle object poses —
which keeps every rollout auditable.

=== #underline[The vla_act Contact Primitive]

`vla_act` is the sole learned call. The planner supplies a task-conditioned prompt and
an early-return predicate $tau$; the frozen $f_theta$ then emits action chunks until
$tau$ fires or the chunk budget is hit:

$
mono("vla_act")("prompt", tau): quad f_theta " emits chunks "
A_1, A_2, dots " until " tau = 1 or "chunks" = "max_chunks"
$

This keeps the VLA a *local contact specialist* (grasping, constrained placement,
fixture actuation) while grounding, spatial re-binding, navigation, and long-horizon
composition stay with the planner. The full JSON contract exposes six analytic
primitives plus `vla_act` (RoboCasa365 adds two mobile-base primitives):

```json
{"action": "move_to",      "xyz": [x, y, z]}
{"action": "move_pose",    "xyz": [x, y, z], "pose": "orientation"}
{"action": "rotate_wrist", "target_yaw": 0.0}
{"action": "set_gripper",  "gripper": "open|close"}
{"action": "release"}
{"action": "vla_act",      "prompt": "grasp the black bowl", "max_chunks": 2, "stop": "predicate"}
```

=== #underline[Primitive Coordinates are World-Frame Metres]

A crucial and easily-missed detail: the `xyz` in `move_to` / `move_pose` is a
#hl[world-frame metric target] $(x, y, z)$ *in metres* — _not_ a pixel or camera-frame
$("col", "row", "depth")$. The scripted servo computes `diff = target − eef_pos`
against the proprioceptive end-effector position $q_t[:3]$
(#link("https://github.com/catr1xLiu/RPent/blob/06bbb24/robots/libero/tools.py#L304")[`robots/libero/tools.py:304`]),
so primitive targets and $q_t$ share *one frame*: robot/world metres. All rotation
primitives match — `rotate_wrist` is world $z$-yaw, `rotate_pitch` is world $x$-axis.

But the planner never _reasons_ in metres. It perceives in *pixels* and crosses the gap
with an explicit deprojection:

$
underbrace(("col", "row"), "camera pixel")
quad attach(arrow.r.long, t: mono("back_project") (K^(-1), "depth", "calib"))
quad underbrace((x, y, z), "world metres")
$

So the JSON `xyz` is always the _output_ of `back_project` on a chosen pixel — segment
an object → pick pixels → back-project through depth+calibration → feed the world point
to `move_to`.

=== #underline[Two-Phase Agent Lifecycle]

The heart of the method is not exposing `vla_act` but _learning when and how to use it_
— done by populating memory during a bootstrapping phase, then executing under a strict
regime. Note that "*learn*" here means *memory population from a single reference seed*,
not any gradient update — no parameters are trained. Expressed as fake Python:

```python
def bootstrap(task: Task, env: Env) -> None:
    '''
    Exploratory phase. The reset primitive is ENABLED and the
    wall-clock budget is generous. The planner trials staging
    orders, pre-contact poses, vla_act timing, and early-return
    thresholds, correcting course after each observed failure.
    '''
    while not solved:
        c: Command = planner.propose(obs, task, TSM, GM)
        obs = env.execute(c)
        planner.observe(obs)
    # On success, abstract the run into the two memories.
    # TSM stores a JSONL trace with concrete xyz replaced by
    # symbolic perception queries; GM appends success rules and
    # failure models such as empty-grasp detection.
    TSM.write(parameterize(trace))
    GM.append(success_rules, failure_models)


def deploy(task: Task, env: Env) -> None:
    '''
    Evaluation phase. The reset primitive is DISABLED and the step
    budget is short. The planner retrieves the stored skeleton and
    re-grounds every spatial argument from the live RGB-D frame.
    '''
    trace: list[Command] = TSM.retrieve(task)
    for step in trace:
        c: Command = planner.reground(step, obs, GM)
        obs = env.execute(c)
```

Task Specific Memory stores a *parameterized* JSONL trace — a task-level _solution
skeleton_ (primitive ordering and VLA-invocation points), with concrete coordinates
replaced by symbolic perception queries so it re-grounds across layouts. Global Memory
holds cross-task #hl[success rules] and #hl[failure models] (e.g. "if the gripper
closes but the object does not move, treat as an empty grasp and re-stage"; "do not
terminate from visual proximity alone — check the benchmark success signal").

#cl-info("Implementation Tricks")[
  #banner[Discrete Design Decisions]
]

Project-specific choices that are not standard practice, and that shape the results:

- *Symbolic re-grounding of traces.* Stored coordinates are treated as reference-scene
  bindings only; the deployment planner is explicitly told _not to reuse reference
  `xyz` values_ and must re-ground from the current observation. This is what lets one
  reference seed generalize across spatial perturbations.
- *Asymmetric phase privileges.* The `reset` primitive exists *only* during
  bootstrapping and is fully disabled at deployment; the step budget is also sharply
  shortened at deployment. Reported numbers come only from the strict phase.
- *Failure models as negative memory.* Empty-grasp and false-success detections are
  stored as explicit constraints, not just discarded — the planner is steered away from
  known pitfalls across tasks.
- *Sparse, retryable VLA bursts.* `vla_act` runs in short chunk-bounded bursts with an
  early-return predicate rather than as a continuous controller, making each contact
  attempt individually re-stageable.

Hyperparameters, seed protocols, and per-benchmark splits are not reproduced here — see
#link("https://arxiv.org/abs/2607.08448")[arXiv appendices C–F].

Related methods are linked rather than re-explained: flow-matching VLA backbones
($pi_0$/$pi_0.5$) — see _Literature Review on Flow-Based RL Policy_; policy-steering /
shared-autonomy framing — see _SAPS Literature Review_ (which steers the same $pi_0.5$
family at the action level); Code-as-Policies program synthesis
(#link("https://arxiv.org/abs/2209.07753")[Liang et al. 2023]); and the coding-agent
harness lineage (SWE-agent, OpenHands, CodeAct).

#rule

#cl-hint("Experimental Results")[
  #banner[Experiments & Key Findings]
]

Two regimes: *few-shot* (bootstrap on one reference seed, store to TSM, re-ground under
perturbations) and *zero-shot* (no target-setting memory retrieval). `vla_act` is
instantiated with a benchmark-specific frozen policy behind a unified interface:
$pi_"RLinf"$ for LIBERO/LIBERO-Pro, RLDX-1 for RoboCasa365, LingBot-VLA for RoboTwin
C2R. *CC* = Claude Code planner; *Codex* = Codex planner (same harness, different
backbone).

=== Headline Benchmark Results

#text(size: 9pt)[
#table(
  columns: (auto, auto, auto, auto, auto, auto),
  align: (left + horizon, left + horizon, left + horizon, center + horizon, center + horizon, left + horizon),
  table.header([*Benchmark*], [*Metric*], [*Strongest baseline*], [*Harness (Codex)*], [*Harness (CC)*], [*Gain*]),
  [*Standard LIBERO*], [overall SR], [$pi_"RLinf"$ $95.3$], [—], [$96.0$], [preserves (+0.7)],
  [*LIBERO-Pro*], [overall SR], [RATS $43.8$], [$72.1$], [$bold(82.4)$], [*+38.6* vs RATS],
  [*RoboCasa365*], [task-weighted SR], [RLDX-1 $30.0$], [$bold(55.4)$], [$48.6$], [*+25.4* vs RLDX-1],
  [*RoboTwin C2R*], [SR (zero-shot transfer)], [LingBot-VLA $50.4$], [$58.0$], [$bold(58.4)$], [+8.0],
)
]

The direct $pi_"RLinf"$ baseline reaches only $50.0%$ on LIBERO-Pro under the same
protocol, so the LIBERO-Pro gain is *not* from a stronger backbone — the same frozen
checkpoint is exposed through `vla_act`. Note the headline gains cherry-pick the better
planner per benchmark (CC for LIBERO-Pro, Codex for RoboCasa365); the two backbones are
not uniformly ranked. Also, RATS and Cap-X report only $6$ of $8$ perturbation cells (no
LIBERO-10), so the $+38.6$ compares against a reduced-cell average — not strictly
like-for-like.

=== Zero-shot ablation: what memory buys

On LIBERO-Pro *Goal*, dropping Task Specific Memory retrieval isolates online reasoning
from bootstrapped memory:

$
"Goal-T (instruction redirect): " 87.0% " few-shot" -> 79.0% " zero-shot"
quad ("small drop")
$

#boxed[$"Goal-S (position swap): " 87.0% " few-shot" -> 31.0% " zero-shot" quad ("collapse")$]

*Semantic re-binding survives without memory; spatial perturbation does not.* Task
Specific Memory's parameterized primitive organization is what carries
spatially-perturbed tasks — the planner can re-bind _what_ to act on from language
alone, but needs the stored staging/transport skeleton to recover _where_.

=== Key Finding 1 — Planner-level re-grounding restores task-conditioned behavior

The gap over end-to-end VLAs comes without touching the backbone. $pi_"RLinf"$ solves
the _standard_ tasks but is weakly conditioned on the instruction/scene binding: under
instruction redirection it repeats the training-time behavior; under layout swaps it
moves toward the training-time region. The planner makes grounding explicit — parse
$ell$, resolve the target from live RGB-D, stage with analytic primitives, invoke
`vla_act` only for the contact phase.

#figure(image("../media/regrounding-object-comparison.png", width: 80%),
  caption: [Terminal frames on a LIBERO-Pro Object task: standard (left), $pi_"RLinf"$
    under instruction-redirection perturbation repeating the wrong behavior (middle),
    Harness VLA re-grounding the redirected target and succeeding (right).])

=== Key Finding 2 — Planner-staged invocation + retry improves frozen-policy reliability

The VLA is not a one-shot black box. Each call is a planner-chosen local attempt:
*stage* the robot into a VLA-compatible pre-contact configuration, invoke, inspect the
contact outcome, and *re-stage/retry* if unstable — localizing a brittle contact
failure instead of letting it derail a monolithic rollout. Success rises sharply after
the first few invocations then saturates, confirming the VLA is used _sparsely_ but
retry is central.

#figure(image("../media/vla-invocation-libero.png", width: 55%),
  caption: [Cumulative LIBERO-Pro success vs the cap on VLA invocations per episode;
    success exceeds the frozen-policy baseline after a few planner-staged calls and
    saturates toward full-harness performance.])

=== Key Finding 3 — Analytic primitives isolate non-contact from contact-rich control

Analytic primitives handle the non-contact structure around each contact phase
(transport, staging, reorientation, retreat, repositioning), reserving `vla_act` for
grasping/placement/fixture actuation. Attribution of the _final_ completion predicate
shows LIBERO-Pro tasks usually finish on an analytic primitive (after the VLA
established contact), whereas RoboCasa365/RoboTwin more often finish inside the VLA
(terminal contact-rich operations).

#figure(image("../media/completion-attribution.png", width: 100%),
  caption: [Fraction of successful rollouts whose final completion predicate fires after
    an analytic primitive (blue) vs a VLA primitive (orange), across LIBERO-Pro,
    RoboCasa365, and RoboTwin C2R.])

*Stated limitations (paper's own):* open feedback loop between planner and VLA; no joint
fine-tuning via environmental reward / human preference (future RL, e.g. GRPO); no
fine-grained image captioning, limiting reasoning in dense clutter. Worth adding: the
method leans heavily on strong frontier LLM planners, and the "learning" is memory
curation from one seed rather than optimization — robustness to a weaker planner
backbone is untested here.

#rule

#cl-fact("Reflection")[
  #banner[My Read]
]

=== Is an intermediate work towards RL

The research team is *RLinf*, and the entire tool suite + robot/simulator is considered
environment $cal(E)$. These are strong signals that the research team is aiming for
reinforcement learning on the planner VLM. Of course, the current bottleneck is that the
models powerful enough to _learn from past experience_ are currently proprietary models.

=== Adaptation needs effort but manageable

The key APIs for the execution environment are clear: `reset()`, `chunk_step(actions)`.
This run-loop should differ slightly for a real robot. Implementation for a real robot
is not uploaded yet, but the repo is actively being updated.

=== Is a great baseline to improve on

This is likely the *SOTA* VLA inference stack available to the public, given that
Physical Intelligence's training-based harness system is closed source. The methodology
of using VLM for planning and experience learning is reasonable, and the benchmark
results are convincing.

=== A few details to explore

- *Stronger VLM back-end models*: such as Gemini Robotics 1.6, which has better visual
  understanding capability
- *Real-world capability on unseen scenarios*: the shared challenge of all embodied AI.
  Assessment on slightly different hardware (UR10e) and unseen scenarios is the ultimate
  test of the effectiveness of this paper, as this will likely challenge the VLM planner
  to recover from errors.

#rule

#cl-example("Potential Directions")[
  #banner[Potential Directions for Further Research]
]

=== #underline[Bridge with deterministic 3D object positioning methods]

I think this is the most promising direction for future work, because the model
currently relies on a $("col", "row", "depth") -> (x, y, z)$ projection tool. _This is
probably inefficient for VLM agents._

An alternative approach would be to use solid 3D object positioning methods, such as
#link("https://arxiv.org/html/2602.04343v1")[Neural Memory Object (NeMO)], which maps
the exact 6-DoF position of an object after few-shot learning.

#figure(image("../media/NeMO.png", width: 100%))

We can adapt a simple motion planner and create more powerful tools for the VLM using
some basic motion planning, such as
`{"action": "move_to_known_object", "object_identifier": "YELLOW_PLATE", "relative_pose": "grabbing_pose"}`,
after recognizing objects and recording different relative transformations
$T^"OBJ"_"EF"$ (the end-effector pose expressed in the object's frame) for grabbing,
pulling, etc. This will free up the mental effort of the VLM to determine the exact
position.

The trade is a one-time \~5–10 min human enrollment per scenario, not runtime compute:
(1) a few phone shots of each key object so NeMO learns it; (2) hand the object into the
gripper and close on it at several steady grasp angles. Each angle yields a
$T^"OBJ"_"EF"$ _for free_ — NeMO solves the object pose from depth, and the end-effector
pose is always known from forward kinematics, so
$T^"OBJ"_"EF" = (T^"world"_"OBJ")^(-1) dot T^"world"_"EF"$. At runtime the primitive
just re-composes $T^"world"_"EF" = T^"world"_"OBJ" dot T^"OBJ"_"EF"$ against NeMO's live
object pose.

Measurement error is handled by the invariance itself: because a steady grasp keeps
$T^"OBJ"_"EF"$ constant, we move the arm-object system around the workspace and
re-measure — like a human fiddling with an unseen object. Averaging the samples cuts the
random error, and their spread gives an empirical tolerance for that grasp. When the
spread exceeds what the task needs (e.g. a tight insertion), that is the signal to fall
back to `vla_act` — keeping the deterministic primitive for well-enrolled rigid objects
and the frozen VLA for the tight-tolerance contact it is meant for.

=== #underline[Bridge with Shared Autonomy]

#rule

#cl-hint("Codebase Analysis")[
  #banner[Codebase Status and Structure]
]

*Verdict:* the released
#link("https://github.com/RLinf/RPent")[`RLinf/RPent`] repo is the clean,
well-documented *harness/planner layer* only; the simulators, primitive backends, and
VLA serving live in a *forked branch of RLinf* that must be cloned alongside it. The
full LIBERO/$pi_0.5$ path is reproducible; the RoboCasa365 (RLDX-1) and RoboTwin
(LingBot-VLA) paths behind two of the three headline numbers are not fully wired in the
public release.

#table(
  columns: (auto, 1fr),
  align: (left + horizon, left + horizon),
  table.header([*Aspect*], [*Assessment*]),
  [*Completeness*], [Ships the harness, three planner backends, the LIBERO env client,
    dashboard, and prompts — but the analytic and `vla_act` primitives are registered in
    the RLinf fork, not here.],
  [*Adaptation*], [Community-facing with Sphinx docs, an
    #link("https://rpent.readthedocs.io/en/latest/rst_source/extending/new_env.html")[adding-a-new-environment]
    guide, and a HuggingFace checkpoint, though the integration surface to reimplement
    lives in the RLinf fork.],
  [*Dependency*], [Heavy and partly niche — a forked RLinf branch, `uv`, `openpi`,
    LIBERO (+ perturbation patch), frontier-LLM SDKs with API keys, and a CUDA GPU for
    the VLA server.],
  [*Currency*], [Modern stack (Python 3.11, `uv`, current LLM SDKs) under active
    development, last commit 2026-07-20.],
)

*Reproducibility gap:* only the LIBERO / $pi_0.5$ path is marked working in the feature
matrix; the RoboCasa365 (RLDX-1) and RoboTwin (LingBot-VLA) backends behind two of the
three headline numbers are unchecked, so those results are not reproducible from public
code yet.

*Paper↔code mismatch:* the paper frames the harness as a "file-mediated REPL"
(`command.json`, `state_NN.json`), but the code realizes that contract through
in-process pydantic-ai tool calls (`api`), an HTTP-MCP bridge (`codex`), socket RPC to
`env_server`, and HTTP to `vla_server` — the file abstraction is a mental model, not the
literal transport.

*Replication difficulty: Moderate.* Not one command — requires cloning the RLinf fork
side-by-side, building an openpi+LIBERO venv, downloading the HF checkpoint, applying
the LIBERO-Pro patch, and supplying LLM API keys. No single hard blocker for the LIBERO
path, but many manual steps. *Adapting the key technique: Moderate–Hard* — the reusable
idea (planner + fixed primitive contract + `vla_act`) is simple, but the concrete
primitive/VLA interfaces you'd graft onto are in the RLinf fork, not this repo.

== Pipeline breakdown

Data flows across four boundaries. The planner only ever sees serialized observations
and a JSON tool schema; the toolkit fans out to a socket-RPC *env server* (analytic
primitives) and an HTTP *VLA server* (`vla_act`).

=== Data flow diagram

#figure(image("../media/rpent-dataflow.png", width: 90%),
  caption: [Data flow across the four layer boundaries: memory → planner → toolkit →
    env server / VLA server.])

=== Layer-boundary API signatures

*1. Planner ↔ Toolkit* — the agent loop.
(#link("https://github.com/catr1xLiu/RPent/blob/06bbb24/rpent/cerebrum/base.py#L64")[`cerebrum/base.py:64`])

```python
def solve(self, *, system_prompt: str, user_message: str,
          toolkit: Toolkit, max_turns: int) -> CerebrumResult:
    '''
    Run the multi-turn agent loop until completion or budget.
    Backends derive tools_spec via toolkit.get_tools_spec() and
    dispatch calls via toolkit.execute_tool(). Returns a
    CerebrumResult with finish status, transcript, token stats,
    and optional error.
    '''
    ...
```

*2. Toolkit — the single action interface.*
(#link("https://github.com/catr1xLiu/RPent/blob/06bbb24/rpent/tools/toolkit.py#L136")[`tools/toolkit.py:136`])

```python
def get_tools_spec(self) -> list[dict[str, Any]]:
    ''' JSON schemas for every registered primitive. '''
    ...

def execute_tool(self, name: str,
                 input_dict: dict[str, Any]) -> ToolResult:
    '''
    Dispatch one primitive invocation {"action": name, ...},
    execute it in the environment, and return a ToolResult with
    the refreshed observation and status content blocks.
    '''
    ...
```

*3. Toolkit → Env server* (analytic primitives, socket RPC).
(#link("https://github.com/catr1xLiu/RPent/blob/06bbb24/robots/libero/env_client.py#L70")[`robots/libero/env_client.py:70`])

```python
def chunk_step(self, actions: np.ndarray,
               *, return_all_frames: bool | None = None
               ) -> tuple[dict, float, bool, bool, np.ndarray]:
    '''
    Step the env with an action chunk of shape (chunk,
    action_dim). Returns (obs, reward, done, truncated, frames);
    obs carries main_images, wrist_images, and proprio states.
    '''
    ...

def raw_obs(self) -> dict[str, Any]:
    ''' Latest observation: main_images, states, and more. '''
    ...
```

*4. Toolkit (`vla_act`) → VLA server* (frozen policy, HTTP `/predict`).
(#link("https://github.com/catr1xLiu/RPent/blob/06bbb24/rpent/utils/vla_client.py#L98")[`utils/vla_client.py:98`])

```python
def predict_action_batch(self, env_obs: dict[str, Any],
                         mode: str = "eval"
                         ) -> tuple[np.ndarray, dict[str, Any]]:
    '''
    Send one observation to the frozen VLA server and receive an
    action chunk. env_obs holds main_images (H, W, 3), optional
    wrist_images, states (state_dim,), and task_descriptions. It
    POSTs {instruction, images{main:{png, b64}}, state, mode} to
    /predict and returns actions of shape (chunk, action_dim),
    batch dim stripped.
    '''
    ...
```

The action chunk returned by the VLA server is then pushed into the env via
`chunk_step` — so `vla_act` is the one primitive that touches _both_ servers per call.
