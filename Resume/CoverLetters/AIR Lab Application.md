> [!abstract] Context
> ## Waterloo AIR Lab — Winter 2027 Application

Application to the **Active & Interactive Robotics Lab** (Prof. Yue Hu, Waterloo MME) for the **Winter 2027** term.

Existing connection: Prof. Hu is a co-author on the RoboTac 2026 paper *On the Role of Haptic Feedback in Demonstration Collection for Visuomotor Policy Learning*. Pengcheng Xi (NRC) encouraged the application. Fall 2026 is a return term at NRC's Digital Technologies Research Centre.

The drafts below are starting points — rewrite freely. Notes on *why* each is phrased the way it is are folded into the `[!hint]` blocks.

---

> [!info] Strategy
> ## Framing Notes

The honest motive — *preserving research momentum so the work reaches a real submission* — is fine to state. It only reads as arrogant if framed as **"I need a lab that lets me self-direct."** Framed as **continue vs. restart**, it is a scheduling argument, not a status claim.

Three things defuse the 2A-student concern, and all three are used below:

1. Prof. Hu is already a co-author — continuity is a fact being described, not a favour being requested.
2. Pengcheng encouraged the application — state it explicitly.
3. Concede the seniority point yourself, in one sentence, rather than hoping it is inferred.

The real risk is **topic ordering**, not tone. VLM/VLA long-horizon planning is NRC's interest and does not appear anywhere in AIR's publication record. Leading with it looks like importing an outside agenda. Visuomotor + impedance control and shared autonomy are near-exact matches to the lab's actual output, so they go first.

> [!hint] Small things
> - The name is **Yue Hu** — *Yue* is the given name. Write "Prof. Hu."
> - Do not mention that the co-authorship was added without notice.
> - Do not cite the RPent literature review by name — the reader cannot see it. Describe the interest instead.

---

> [!quote] Form Question 1
> ## Why do you want to join the Active & Interactive Robotics Lab?

I wish to join AIR because its research direction aligns closely with my co-op sequence.

I have co-first-authored a paper on haptic feedback for visuomotor policy learning and first-authored a paper on human motion prediction, both carried out at NRC's Digital Technologies Research Centre during a co-op term. I am rejoining that group for my upcoming Fall 2026 co-op term, and my supervisor there encouraged me to apply to AIR. AIR also collaborates with NRC's Digital Technologies Research Centre, and Prof. Hu is a co-author on my previous paper. Joining AIR in Winter 2027 would let me preserve that momentum and continue refining the work started at NRC.

> [!hint] Notes
> The momentum motive is stated plainly but as **continue vs. restart** — a resource argument rather than a status claim.
> Three fixes beyond pure grammar, revert if you disagree: **"aligns perfectly" → "aligns closely"** (perfectly overclaims); **"a mentor of my previous paper" → "a co-author on my previous paper"** (mentorship of a *paper* isn't idiomatic, and co-author is the factual, less presumptuous claim); and the sentence ending **"and my supervisor ."** was unfinished — completed as "encouraged me to apply to AIR."

---

> [!quote] Form Question 2
> ## What are the topics you'd like to work on?

I'd be glad to contribute to whatever is currently active in the lab. That said, three topics I'm drawn to, ordered by how close they are to what I've actually done:

1. Coupling visuomotor policies with impedance/admittance control: having a policy output a stiffness or force target in addition to a trajectory, and executing it through a compliance controller. This is the future work proposed in my last paper's conclusion, and it closely matches the lab's work on VAIRO and VAISI.

2. Shared autonomy and human–robot interaction. I've built a bilateral teleoperation stack — UR10e over RTDE with a Haply Inverse3 rendering real-time force feedback — so the operator-in-the-loop side is familiar territory.

3. Long- and short-horizon planning: using VLMs for task-level scheduling with VLAs for reactive control.

> [!hint] Notes
> The opening sentence is the highest-value line in the whole application — it answers the seniority concern before anyone raises it. Keep it even if everything else gets rewritten.
> One wording change: **"it appears close to the lab's previous work" → "it closely matches"**. The hedge was there because I hadn't read VAIRO/VAISI yet. Having read both, the match is real and the hedge now reads as vagueness.

---

> [!quote] Form Question 3
> ## Please briefly describe your relevant experience

At NRC's Digital Technologies Research Centre I worked on two projects.

I was co-first author on a study of haptic feedback during demonstration collection for visuomotor policy learning. I built the force-streamed teleoperation stack — UR10e over RTDE, Haply Inverse3, wrist-mounted force/torque sensor — and trained force-aware Diffusion Policies on the collected data. Haptic feedback reduced median peak contact force by 64%, though downstream task success did not improve; we traced this to task selection and open-loop execution.

I was also first author on a study of the kinematic signatures of aging, using an ST-GCN++ classifier on clinical gait data and a fine-tuned Motion Diffusion Model for age-conditioned motion synthesis.

> [!hint] Notes
> Leading with the null result is deliberate — it's peer-reviewed, so it isn't false modesty, and it signals research maturity that a success story wouldn't.
> Keep the GCN work prominent: Kwok, Li & Hu published on GCN-based action recognition, so it's shared methodological vocabulary with the lab.

---

> [!quote] Form Question 4
> ## What do you hope to achieve by joining?

I hope to continue the research I begin during my next co-op term at NRC. Beyond that, I want to meet experienced researchers and contribute to the lab's active projects. My skills transfer directly to other projects, and I would be glad to help with reviewing literature, designing software, running experiments, and communicating results. I'd also like to build connections with other robotics student researchers at Waterloo.

---

> [!quote] Form Question 5
> ## What kind of experience do you wish to obtain?

Mainly the classical foundations I have been working around. I have focused on the deep learning models behind policies, but have not explored the controllers that execute the resulting trajectories. I would like to learn the theory behind robotic controllers and implement advanced control methods such as compliance control, which my last project identified as the missing piece.

I would also like to experience a full research cycle. So far I have only worked within single four-month co-op terms, so I have never revised a paper through review or followed a research direction over a longer horizon.

> [!hint] Notes
> Q4 is **outcomes**, Q5 is **growth** — keeping them distinct avoids repetition.
> Q5 is where the honest gaps become an asset: it matches the "Beginner" marks on the skills matrix below, so the application reads as one calibrated person rather than a resume plus a separate set of claims.

---

> [!info] Appendix
> ## Skill Self-Evaluation Matrix

Calibration principle: if the interviewer says *"tell me about that"* and the answer has to be walked back, it's over-claimed. A row of honest **Beginner** marks next to two accepted papers reads as well-calibrated. **Intermediate** everywhere reads as noise.

| Skill | Answer | Backing |
|---|---|---|
| Linux/Ubuntu OS | Intermediate | Fedora daily driver, SLURM, building native deps. Ubuntu-specific admin is the thin part. |
| C++ | **TBD** | Depends on actual depth — coursework only → Beginner; mostly reading others' code → Used but not very familiar. |
| Python | Advanced | Primary research language; pipeline refactor, SLURM migration, policy training. |
| Version control (git) | Advanced | LFS, custom clean/smudge filters, GitHub Actions — beyond commit/push. |
| Docker | **TBD** | Authoring Dockerfiles → Intermediate; only running containers → Used but not very familiar. |
| Unity | Never used | Cheapest row to get caught on. A clean "never used" reads as calibration. |
| Robotic Operating System | Used but not very familiar | Basic tutorial only. |
| Robot kinematics modeling | Beginner | Swerve kinematics, 6-DoF pose commands; consumed the UR's IK rather than deriving it. |
| Robot dynamics modeling | Beginner | Rigid-body/contact dynamics via MapleSim and MuJoCo — engine-level, not deriving Lagrangian/RNEA. |
| Cartesian space control | Beginner | 6-DoF pose commands over RTDE, unilateral spring–damper virtual contact model. |
| Joint space control | Used but not very familiar | Closest is per-module PID on swerve azimuth/drive. Weakest robotics row. |
| Machine Learning | Intermediate | Two accepted papers; diffusion policy, MDM fine-tuning, ST-GCN++, multi-GPU. Let the papers do the bragging. |
| Optimization | Beginner | Used CasADi/Dymos/Choreo as solvers. Intermediate only if you've formulated your own NLP. |
| Optimal control | Beginner | LQR + Kalman via WPILib — chose the model and tuned $Q$, $R$ on hardware, but didn't derive it. |
| Computer vision | Beginner | AprilTag localization, vision–odometry fusion, ResNet-18 encoders — integration, not algorithm development. |

> [!hint] Expect to be probed here
> The resume now carries a dedicated **Optimization & Optimal Control** bullet, so the interview will go straight to it. If the Choreo/CasADi use was configuring rather than formulating, volunteer that distinction — offering it lands far better than conceding it.
> Prof. Hu's roots are optimal control for humanoids (Mombaur PhD, IIT walking benchmarks, the T-RO survey on optimization-based legged control). They will know exactly what those terms mean and what they don't.

---

> [!hint] Before submitting
> - [x] ~~Pull the actual VAIRO / VAISI abstracts~~ — both papers read in full, see [[VAIRO + VAISI Literature Review]]
> - [ ] Fill in the two **TBD** rows (C++, Docker) in the skills matrix
> - [ ] Check whether any Unity exposure exists — it's a scored row currently answered "never used"
> - [ ] Re-read Q1–Q5 against the resume; they'll have both open, so don't reuse resume bullets verbatim
