# MARS Policy — Multimodality Only When It Matters

> arXiv: [2605.29766v1](https://arxiv.org/abs/2605.29766v1) · Jindou Jia et al. · arXiv preprint · 2026-05-28
> [Project](https://lorenzo-0-0.github.io/MARS_Policy/) · [TeX-derived reading copy](sources/MARSPolicy/Paper.md) · [Main TeX](sources/MARSPolicy/tex/main_part.tex) · [Appendix TeX](sources/MARSPolicy/tex/appendix_part.tex)

> [!abstract] TL;DR
> ## From A2A to adaptive stochasticity

MARS extends [[A2A Flow Matching Literature Review|A2A]] by learning **where and how much stochasticity to introduce**. An observation-conditioned scheduler predicts a weight for each action dimension, blending historical actions with Gaussian noise. The same weights gate an endpoint reconstruction penalty and determine the number of flow-integration steps. A neighbor-based diversity loss prevents the easy history-to-action solution from eliminating stochasticity: it penalizes source dispersion that falls below the future-action dispersion of demonstrations with similar histories. The resulting policy allocates noise and computation to branching decisions while retaining a strong history prior elsewhere.

Across eight simulated and four physical tasks, MARS generally learns faster than Gaussian-source flow matching and preserves multiple behaviors that deterministic A2A loses. Physical inference is approximately $5\,\mathrm{ms}$, versus $28\,\mathrm{ms}$ for flow matching and $3\,\mathrm{ms}$ for A2A. The central caveats are small physical evaluations, added neighbor-computation cost, and a dispersion surrogate that does not itself guarantee correct mode coverage.

---

> [!fact] Methodology
> ## Source distribution → training constraints → inference budget


#### <u>1. Problem scope and phase-dependent modes</u>

<div align="center"><img src="media/mars-concept.png" alt="Figure 1: four-route navigation compares expert trajectories, Gaussian-source flow matching, deterministic A2A, and MARS; learned noise weights and inference steps change along the route; physical examples include cup grasping, vegetable selection, block pushing, and Push-T" width="100%"></div>



#### <u>2. Architecture and learned flow source</u>

**Relation to A2A.** Section 3.2 explicitly reformulates A2A in action space to integrate it with the flow-matching formulation used here. MARS therefore continues A2A's historical-source idea while changing the original latent encoder–flow–decoder architecture. The paper names a DiT velocity backbone but does not give its full layer configuration. A latent-space MARS built on A2A is a plausible extension, not the implementation described in this paper. See the codebase assessment in [[A2A Flow Matching Literature Review|the A2A review]] for the released latent architecture.

<div align="center"><img src="media/mars-architecture.png" alt="Figure 2: encoded observations condition a modal scheduling MLP and DiT flow network; scheduler weights mix historical actions with Gaussian noise and select the inference budget" width="100%"></div>

| Symbol | $\mathbf{a}^{\leq t}$ | $\mathbf{a}_0$ | $\mathbf{a}_1$ | $\mathbf{w}\in(\mathbf{0},\mathbf{1})^D$ | $\boldsymbol{\epsilon}$ | $\odot$ |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Meaning | Measured historical action chunk | Initial flow source | Demonstrated future chunk | Per-dimension noise weight | Standard Gaussian noise | Elementwise product |

**Adaptive source**

$$
\boxed{\mathbf{a}_0=(\mathbf{1}-\mathbf{w})\odot\mathbf{a}^{\leq t}+\mathbf{w}\odot\boldsymbol{\epsilon}},\qquad
\mathbf{a}^{\leq t}\sim p_{\mathcal H},\quad
\boldsymbol{\epsilon}\sim\mathcal N(\mathbf{0},\mathbf{I}).
$$



#### <u>3. Transport objective and the A2A endpoint constraint</u>

| Symbol | $t$ | $\tau$ | $v_\theta$ | $p_{\mathcal N}$ | $p_{\mathcal H}$ | $p_{\mathcal T}$ | $\hat{\mathbf a}_1$ |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Meaning | Robot time | Flow time in $[0,1]$ | Conditional velocity field | Gaussian source distribution | Historical-action distribution | Future-action distribution | ODE-predicted endpoint |

**Interpolation and ODE**

$$
\mathbf a_\tau=(1-\tau)\mathbf a_0+\tau\mathbf a_1.
$$



$$
\frac{d\mathbf a_\tau}{d\tau}=v_\theta(\mathbf a_\tau,\tau).
$$



**Gaussian-source flow matching**

$$
\mathcal L_{\mathrm{fm}}=
\mathbb E_{\tau\sim\mathcal U(0,1),\,\mathbf a_0\sim p_{\mathcal N},\,\mathbf a_1\sim p_{\mathcal T}}
\left\|v_\theta(\mathbf a_\tau,\tau)-(\mathbf a_1-\mathbf a_0)\right\|^2.
$$



**Action-space A2A**

$$
\begin{aligned}
\mathcal L_{\mathrm{A2A}}
&=\mathbb E_{\tau\sim\mathcal U(0,1),\,(\mathbf a_0,\mathbf a_1)\sim(p_{\mathcal H},p_{\mathcal T})}
\left\|v_\theta(\mathbf a_\tau,\tau)-(\mathbf a_1-\mathbf a_0)\right\|^2\\
&\quad+\lambda_{\mathrm{rec}}
\mathbb E_{(\mathbf a_0,\mathbf a_1)\sim(p_{\mathcal H},p_{\mathcal T})}
\left\|\hat{\mathbf a}_1-\mathbf a_1\right\|_1.
\end{aligned}
$$



#### <u>4. Gated reconstruction and total objective</u>

**Joint objective**

$$
\mathcal L=\mathcal L_{\mathrm{fm}}
+\lambda_{\mathrm{rec}}\mathcal L_{\mathrm{rec}}
+\lambda_{\mathrm{div}}\mathcal L_{\mathrm{div}}.
$$



**Reconstruction loss — detached gate**

$$
\mathcal L_{\mathrm{rec}}=
\mathbb E_{(\mathbf a_0,\mathbf a_1)\sim(p_{\mathcal H},p_{\mathcal T})}
\left[\frac{1}{D}(\mathbf1-\mathbf w)^\top
\left|\hat{\mathbf a}_1-\mathbf a_1\right|\right].
$$

<div align="center"><img src="media/mars-fm-reconstruction.png" alt="Figure S4: among 100 navigation rollouts, standard flow matching has passage counts 20, 24, 29, 24; adding reconstruction with weight 1 gives 10, 36, 40, 4, concentrating trajectories in the two central passages" width="80%"></div>



#### <u>5. Neighbor-based diversity target</u>

| Symbol | $\mathcal M(i)$ | $m$ | $\mathbf a_{\mathrm{next}}$ | $\mathbf a_{\mathrm{curr}}$ | $\mathcal S_{\mathrm{next}}$ | $\mathcal S_{\mathrm{curr}}$ |
| :--- | :--- | :--- | :--- | :--- | :--- | :--- |
| Meaning | Neighbors of sample $i$ in historical-action space | Neighbor count | Demonstrated future chunk | Constructed mixed source | Target coordinatewise dispersion | Source coordinatewise dispersion |

**Target and source dispersion**

$$
\mathcal S_{\mathrm{next}}^{(i)}=
\frac1m\sum_{j\in\mathcal M(i)}
\left|\mathbf a_{\mathrm{next}}^{(i)}-\mathbf a_{\mathrm{next}}^{(j)}\right|.
$$



$$
\mathcal S_{\mathrm{curr}}^{(i)}=
\frac1m\sum_{j\in\mathcal M(i)}
\left|\mathbf a_{\mathrm{curr}}^{(i)}-\mathbf a_{\mathrm{curr}}^{(j)}\right|.
$$



**Diversity loss**

$$
\boxed{\mathcal L_{\mathrm{div}}=
\mathbb E\left[\frac1D\mathbf1^\top
\operatorname{ReLU}\left(\mathcal S_{\mathrm{next}}-
\mathcal S_{\mathrm{curr}}\right)\right]}.
$$



#### <u>6. Adaptive inference budget</u>

| Symbol | $K(\mathbf w)$ | $K_{\max}$ | $\|\mathbf w\|_\infty$ |
| :--- | :--- | :--- | :--- |
| Meaning | Per-sample integration budget | Maximum number of steps | Largest noise weight across dimensions |

**Step budget**

$$
K(\mathbf w)=K_{\max}\|\mathbf w\|_\infty.
$$



```python
def sample_mars(
    observation: Tensor,
    history: Tensor,
    policy: MARSPolicy,
    k_max: int,
) -> Tensor:
    '''
    Illustrative inference; weights broadcast across the chunk.
    Ceiling and minimum-one clamping are assumed, not specified.
    '''
    condition = policy.encode(observation)
    weight = policy.schedule(condition).sigmoid()
    noise = randn_like(history)
    action = (1.0 - weight) * history + weight * noise
    steps = max(1, min(k_max, ceil(k_max * weight.max().item())))
    for step in range(steps):
        tau = step / steps
        velocity = policy.velocity(action, tau, condition)
        action = action + velocity / steps
    return action
```



#### <u>7. Evidence for the noise–optimization tradeoff</u>

<div align="center"><img src="media/mars-loss-swap.png" alt="Figure S3: increasing initial source variance from 0 to 10 slows and destabilizes training and reduces final success; experiment uses 100 demonstrations, 30 epochs, and 50 evaluation rollouts" width="80%"></div>



---

> [!info] Implementation Details
> ## Reproduction-critical choices

| Setting | Reported value / choice |
| :--- | :--- |
| Predicted chunk / historical horizon | $8$ / $8$ |
| Maximum integration steps $K_{\max}$ | $10$ |
| Neighbors $m$ | $20$ |
| $\lambda_{\mathrm{rec}}$ / $\lambda_{\mathrm{div}}$ | $1$ / $1$ |
| Batch size | $32$ |
| Conditioning / velocity backbone | ResNet-18 / DiT |
| Reconstruction gate | Detach only its multiplicative $(\mathbf1-\mathbf w)$ weight |
| Neighbor source construction | Use the anchor's weight for all its neighbors |
| Target dispersion | Precompute from demonstrated future actions |
| Actions | Franka: simulated joints / physical end-effector states; R1 Lite: joints |
| Push-T collection | Random waypoint before returning to the shared start pose |





---

> [!hint] Experiments & Findings
> ## Success, mode coverage, and computational cost

#### <u>Evaluation protocol and what counts as multimodality</u>

| Benchmark | Demonstrations | Training / evaluation details |
| :--- | :--- | :--- |
| 2D Navigation | $200$ | $100$ evaluation trials; overview and qualitative comparisons use $50$ epochs |
| Push Cube, Grasp Eyeglasses, Collision Avoidance | $100$ each | $50$ rollouts per task; modes vary by direction, grasp pose, or speed |
| Close Box, Stack Cube, Pick Cube | $100$ each | $50$ rollouts; unimodal learning curves show standard deviations over $3$ seeds |
| Close Drawer | $50$ | $50$ rollouts |
| Physical Push-T / Block Push | $100$ each, balanced $50+50$ | $100$ / $40$ epochs; $20$ trials per policy per task |
| Physical Pick Cup / Pick Vegetable | $200$ each, balanced $100+100$ | $500$ / $400$ epochs; $10$ trials per policy per task |

**Modal balance — appendix metric.** Counts include successful rollouts assigned to each of two modes.

$$
\gamma=\frac{2\min\{n_1,n_2\}}{n_1+n_2}.
$$

| Symbol | $n_1$ | $n_2$ | $\gamma$ |
| :--- | :--- | :--- | :--- |
| Meaning | Successful trials in mode 1 | Successful trials in mode 2 | Balanced coverage score; $1$ means equal counts |

Read $\gamma$ together with success rate: two successful trials split evenly score $1$, regardless of how many other trials fail. It is undefined if neither mode succeeds unless an implementation convention is added. Balanced modes are intentionally built into these datasets; the metric does not test fidelity to unequal expert mode probabilities.



#### <u>Multimodal simulation: retain branches without full-time noise</u>

<div align="center"><img src="media/mars-multimodal-sim.png" alt="Figure 3: success and modal-balance learning curves for Push Cube, Grasp Eyeglasses, and Collision Avoidance compare MARS, A2A, and flow matching across spatial, grasp, and speed choices" width="100%"></div>

MARS generally converges faster than flow matching while maintaining comparable modal balance. A2A may acquire one successful strategy quickly, but its success is unstable when averaging strategies leads into obstacles. The four-route navigation test provides a stronger branching example than a binary object choice; its scheduler allocates more steps near ambiguous route decisions.

<div align="center"><img src="media/mars-2d-benchmark.png" alt="Figure S2: navigation trajectories for experts and nine policies, including MARS, flow matching, DDPM, IBC, BET, Noised-A2A, A2A, VITA, and ACT; fixed slight noise in A2A does not recover all demonstrated branching behavior" width="100%"></div>

**Design ablation:** adding an ungated reconstruction loss with $\lambda_{\mathrm{rec}}=1$ to flow matching changes four-passage counts from $20/24/29/24$ to $10/36/40/4$ in $100$ rollouts (Fig. S4). The counts sum to $97$ and $90$, respectively; they should not be mistaken for normalized mode probabilities over all trials.



#### <u>Physical tasks: latency and small-sample success</u>

<div align="center"><img src="media/mars-realtest.png" alt="Figure 4: physical task snapshots, success rates, modal balance, and inference cost for MARS, A2A, and flow matching on Push-T, Block Push, Pick Cup, and Pick Vegetable; the source caption mistakenly calls Pick Cup Pick Cube" width="100%"></div>

| Policy | Approximate inference latency reported in §5.2 | Reported behavior |
| :--- | :--- | :--- |
| A2A | $3\,\mathrm{ms}$ | Fast, but collapses to a single mode |
| MARS | $5\,\mathrm{ms}$ | Preserves both modes; highest or tied success on three tasks in Fig. 4 |
| Flow matching | $28\,\mathrm{ms}$ | Slower; less balanced than MARS in three of four tasks |

The authors report an average success improvement of $16.67\%$ and latency reduction of $83.20\%$ relative to flow matching. These are the paper's aggregate claims, not percentage-point gains inferred from the rounded latency values. Physical timing is reported on an RTX $5080$; simulation timing uses an H200 and discards the first five predictions per run. The measured sampling latency does not establish complete camera-to-actuation latency or a worst-case control deadline.

**Figure versus prose:** Fig. 4(b) shows approximately $100\%$ success for A2A and $90\%$ for MARS on Pick Cup, contrary to the text's claim that MARS achieves optimal success across every physical benchmark. The visual comparison supports improved multimodal coverage on that task, not a success-rate win over A2A.

Each R1 Lite trial changes the raw success estimate by $10$ percentage points, and each Franka trial by $5$ points. The evidence supports feasibility and visible behavioral differences; precision about the gain is limited by those trial counts. The proposed explanation that adaptive noise resists nuisance-driven overfitting is a hypothesis, not an isolated causal result.

<div align="center"><img src="media/mars-appen-fm.png" alt="Figure S9: Pick Cup modal balance under adopted, reduced-data, and overtrained settings; MARS reports gamma 0.8 with 50 demonstrations and with 800 epochs; the caption lists 400 default epochs although the main Pick Cup protocol says 500" width="50%"></div>

**Source inconsistency:** Fig. S9 describes the default Pick Cup setting as $200$ demonstrations and $400$ epochs; appendix §B.2 states $500$ epochs for Pick Cup. Keep this distinction when reproducing the overtraining comparison.



#### <u>Strategically unimodal tasks: stochasticity can still help</u>

<div align="center"><img src="media/mars-singlemodal.png" alt="Figure 5: learning curves for Close Box, Stack Cube, Pick Cube, and Close Drawer; shaded regions show standard deviations across three seeds, with MARS sometimes learning faster than deterministic A2A" width="100%"></div>

On Stack Cube and Pick Cube, MARS can learn faster than A2A. The authors attribute this to modeling small trajectory variations and to input-noise regularization; the experiments do not separately identify those two mechanisms. Selected checkpoints below are transcribed from appendix Tables S2–S3, using $100$ demonstrations; entries are success percentages.

| Simulator | Policy | Steps | Epoch $20$ | Epoch $60$ | Epoch $100$ |
| :--- | :--- | :--- | ---: | ---: | ---: |
| MuJoCo | MARS | $1$–$10$ | 50 | 64 | 98 |
| MuJoCo | A2A | $1$ | 20 | 72 | 86 |
| MuJoCo | FM-DiT | $10$ | 4 | 16 | 58 |
| IsaacSim | MARS | $1$–$10$ | 50 | 60 | 90 |
| IsaacSim | A2A | $1$ | 44 | 72 | 84 |
| IsaacSim | FM-DiT | $10$ | 8 | 42 | 62 |

The advantage is not uniform: A2A leads at epoch $60$ in both simulators. MARS has higher final success in these tables, but epochs measure sample passes, not training wall time; the diversity computation adds work per update. These are separate simulator benchmarks, not evidence of a policy transferred between simulators.



#### <u>Limitations and unresolved comparisons</u>

- **Authors' stated limitation:** dataset-wide neighbor construction and online spread computation add cost that scales with data size and neighbor count; no scalable replacement is validated.
- **Review assessment — surrogate quality:** coordinatewise absolute dispersion measures spread rather than mode count, mode probabilities, or the joint geometry of valid trajectories. Satisfying the diversity loss does not guarantee multimodal action quality.
- **Review assessment — conditioning mismatch:** neighbors are selected using action histories, while the policy also sees images. Similar histories can accompany different scenes; future-action dispersion may therefore mix visual differences with true ambiguity under the same observation.
- **Review assessment — causal evidence:** the paper gives useful noise-variance and reconstruction comparisons, but no full MARS ablation table isolating removal of diversity loss, scalar versus per-dimension weights, or adaptive versus fixed steps at matched success. The contribution of each component remains uncertain.
- **Review assessment — baseline scope:** this study's A2A is reformulated in action space, so its results should not be equated directly with the original latent A2A architecture. One-step stochastic methods are discussed but are absent from the listed benchmark suite; superiority over fast generative policies is not established.
- **Review assessment — reproducibility:** the TeX does not specify integer scheduling, action normalization and history-distance scaling, or a complete optimizer/backbone configuration. These details affect the source blend and neighbor target. The project is linked above; code execution and independent replication are outside this review.
- **Review assessment — deployment scope:** the main evidence concerns compact manipulation skills with deliberately balanced alternatives. Long-horizon intent consistency, recovery after corrupted history, and broad scene-distribution shifts remain untested here.



---

> [!fact] Reflection
> ## My Read



---

> [!hint] Publication and Code Availability
> ## Codebase Status and Structure

**Verdict: no public implementation was accessible on 2026-09-16, so a source-level pipeline and API assessment is not available.**

The paper is available as an [arXiv preprint](https://arxiv.org/abs/2605.29766). Coauthors [Jingliang Li](https://jingliangli.com/) and [Tuo An](https://morpheus-an.github.io/publications/) list it as **under review**, without naming a venue. No public OpenReview submission, reviewer comments, rebuttal, or acceptance decision was found in the title-based searches performed on this date; private review status cannot be inferred from that absence.

The [current project page](https://jingliangli.com/MARS_Policy/) has a Code button pointing to [JIAjindou/MARS_Policy](https://github.com/JIAjindou/MARS_Policy), which returned **404**. No alternative public implementation was found. The repository may be private or not yet created, so the DiT's exact configuration remains unverified against code. The public A2A repository lists MARS as follow-up work, but its inspected snapshot does not contain a MARS policy implementation.
