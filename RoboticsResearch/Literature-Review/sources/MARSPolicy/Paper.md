# MARS Policy: Multimodality Only When It Matters

> Jindou Jia et al. · arXiv preprint · 2026-05-28 · v1
> [arXiv](https://arxiv.org/abs/2605.29766v1) · [Original archive](2605.29766v1.tar.gz)
> [Main TeX](tex/main_part.tex) · [Appendix TeX](tex/appendix_part.tex) · [Preamble and abstract](tex/lab_temp.tex) · [Bibliography](tex/paper.bib)

This reading copy was converted directly from the main and appendix TeX with Pandoc; no PDF text extraction or OCR was used. Original figure PDFs were rasterized to PNG with pdftocairo at 300 DPI. Citation keys refer to the original bibliography; TeX is authoritative for equation and figure numbering. The review is appended after A2A in [[A2A Flow Matching Literature Review#MARS Policy — Multimodality Only When It Matters]].

---

# Introduction

Learning robot policies from expert demonstrations has emerged as a dominant approach for acquiring complex robotic skills. Early deterministic regression policies [@bain1995framework; @osa2018algorithmic; @jia2025FORESEERR] are efficient in both training and inference, but they often struggle in environments where one observation can correspond to multiple valid actions, a phenomenon known as *multimodality* [@wang2017robust; @shafiullah2022behavior; @florence2021implicit]. Recent stochastic generative policies, like diffusion policy [@dp; @ddpm] and flow matching [@flowmatching], can generate multimodal actions as conditional generation processes. They introduce stochasticity by sampling from a noise distribution, which allows them to capture diverse plausible actions given the same observation. However, this multimodal capacity comes at the cost of increased training complexity and slower inference [@pan2025much].

Recent research has begun to address the efficiency bottlenecks of stochastic generative policies. For example, Visual-to-Action (VITA) [@gao2025vita] and Action-to-Action (A2A) [@jia2026action] attempt to streamline the generation process by replacing the standard *Gaussian* noise initialization with informative visual or history action-based priors. By initiating the generation process from more informative starting points, these methods alleviate training complexity and reduce inference steps. However, this grounding in specific priors often compromises the inherent stochasticity, leading to poor multimodal capacity. Concurrently, some approaches utilize consistency models [@li2026ofp; @zhang2025flowpolicy; @Consistency] or mean-flow [@fang2025omp; @geng2026mean] to achieve single-step action generation without compromising stochasticity, but these techniques further introduce additional training overhead, induced by intricate matching objectives.

In practice, the demand for multimodality is often non-uniform across a robotic task. For instance, in the 2D navigation task depicted in Fig. [1](#framework)(a), certain phases necessitate multimodal capabilities, particularly at junctions, whereas the vast majority of segments follow deterministic and straightforward trajectories. Applying a uniformly high level of stochasticity across all phases unnecessarily complicates the learning process [@pan2025much], leading to suboptimal performance. Such a phenomenon also exists across a wide range of robotic tasks (Fig. [1](#framework)(h)). This observation motivates a critical question: can we design a generative policy that **adaptively modulates its multimodality only when it matters, thereby enhancing learning efficiency during deterministic phases?**

![**Overview of MARS.** **(a)** Expert trajectories of a 2D navigation task exhibit phase-dependent multimodality, featuring four modes significantly more challenging than Push-T task [@dp; @jiang2025streaming]. **(b)** Stochastic generative policy (e.g., flow matching [@flowmatching]) with standard *Gaussian* noise recovers diverse feasible paths that match the expert multimodal structure. **(c)** Deterministic policy (e.g., A2A [@jia2026action]) tends to collapse to a single mode and fails to preserve trajectory diversity. Note that deterministic learning can sometimes collide with obstacles due to mode averaging (Fig. [5](#a2a_failed)). **(d)** The proposed MARS policy maintains multimodality at the proper places while preserving efficient determinism during other phases. The color bar indicates the adaptively identified degree of multimodality, i.e., $\|\mathbf{w}\|_\infty$ defined in Sec. [4.1](#Policy_struc). **(e)** Compared to the stochastic generative baseline, MARS policy achieves faster convergence by minimizing stochastic injection. More comparisons with baselines, including DDPM [@dp], BET [@shafiullah2022behavior], IBC [@florence2021implicit], Noise-A2A [@jia2026action], VITA [@gao2025vita], and ACT [@zhao2023learning], are provided in Appx. [8](#appen:2d_benchmark). **(f)** MARS policy adaptively schedules inference steps along the task process, resulting in an optimized inference budget **(g)**. **(h)** Experimental multimodal tasks: Pick Cup by either its handle or rim, Pick Vegetable targeting either the daikon or carrot, Block Push selecting either the orange or purple object, and Push-T via either the upper or lower path.](media/concept.png){#framework width="100%"}

In this work, we propose the **M**odality-**A**daptive **R**obot **S**ampling (**MARS**) policy, a novel scheme that can *inject a proper amount of noise only at the proper time*. MARS policy integrates the expressive power of stochastic generative policy [@flowmatching] with the learning efficiency of deterministic regression policy [@jia2026action]. Specifically, we formulate the flow source as a hybrid initial distribution that blends stochastic *Gaussian* noise with history-based deterministic priors. A lightweight *modal scheduling network* is introduced to predict a per-sample weight, dynamically gating the contribution of each source based on the current task context. To capture the underlying multimodal distribution without manual annotations, the network is optimized via a tailored *diversity loss* that directly matches the flow source diversity to the future-action diversity. In this way, MARS policy preserves the multimodality at ambiguous decision points (Fig. [1](#framework)(d)) while retaining efficient training (Fig. [1](#framework)(e)) and fewer-step inference (Fig. [1](#framework)(f-g)) behavior during deterministic phases.

The efficacy of the MARS policy is validated through extensive experiments on $8$ simulated and $4$ real-world tasks, focusing on training and inference efficiency as well as multimodal adaptability. In addition to standard benchmarks including ManiSkill [@mu2021maniskill], RLBench [@james2020rlbench], and LIBERO [@liu2023libero], we also design several specialized tasks with multimodal requirements to evaluate multimodality across directions, grasping poses, velocities, and so on. Real-world results demonstrate that our proposed method preserves comparative or even better multimodal capabilities while achieving significantly higher learning efficiency, a $83.20\%$ reduction in inference latency, and a $16.67\%$ improvement in average success rate, compared to the flow matching baseline. Notably, even in tasks that appear strategically unimodal yet exhibit nuanced trajectory variations, MARS policy exhibits superior training efficiency over the deterministic one.

# Related work

**Multimodal Action Modeling.** Expert demonstrations in imitation learning are inherently multimodal, where naive mean square error (MSE) regression causes catastrophic *mode averaging*, i.e., yielding geometrically averaged actions that are physically infeasible. To capture high-variance distributions, various frameworks have been developed, such as latent chunk modeling in ACT [@wang2017robust; @zhao2023learning], action space discretization in BET [@shafiullah2022behavior; @lee2024behavior], and implicit energy estimation in IBC [@florence2021implicit]. Beyond these stochastic approaches, deterministic networks with high *Lipschitz* capacity have also been explored for sparse datasets [@pan2025much]. More recently, diffusion policy [@dp; @ddpm; @song2020score] has become a promising paradigm, as its score-based denoising process offers natural multimodal representation and training stability across complex action distributions.

**Efficient Action Generation.** Despite the impressive expressivity of the pioneering diffusion-based generative policy [@dp], its sub-optimal inference efficiency due to iterative denoising has motivated various subsequent works [@gao2025vita; @jia2026action; @bai2026flash]. Flow matching [@flowmatching; @zhang2025flowpolicy; @fang2025omp; @li2026ofp] has recently gained significant attention due to its straight-path formulation and improved sampling efficiency, as exemplified by the $\pi$ model family [@intelligence2025pi; @intelligence2025pi05; @black2024pi_0]. However, the iterative sampling nature still introduces a prohibitive computational barrier [@dp; @pan2025much]. To mitigate this, streaming flow policy [@jiang2025streaming] interprets trajectories as continuous flows to facilitate on-the-fly generation, yet it does not fully circumvent the latency inherent in multi-step sampling. In contrast, VITA [@gao2025vita] and A2A [@jia2026action] simplify the generation process by replacing the *Gaussian* noise source with visual- or history-action-based priors, effectively reducing it to a near-deterministic mapping for higher efficiency, though this grounding in specific priors often compromises the inherent multimodal capacity.

# Generative *vs.* Deterministic Policies

Prior to detailing our method, we outline the core principles of stochastic generative and deterministic regression paradigms[^1]. In this work, the prevailing flow matching [@flowmatching; @zhang2025flowpolicy; @fang2025omp; @li2026ofp] serves as the paradigmatic stochastic policy, while A2A [@jia2026action] is employed to represent deterministic policies, a choice motivated by its superior training efficiency and rapid inference performance [@bai2026flash].

## Stochastic generative policy

Flow matching [@flowmatching] defines a continuous-time transport process that maps samples from a source distribution $p_\mathcal{N} = \mathcal{N}(\mathbf{0}, \mathbf{I})$ to the target action distribution $p_\mathcal{T}$ over a time variable $\tau \in [0,1]$. Specifically, given a noise sample $\mathbf{a}_0 \sim p_\mathcal{N}$ and a ground-truth action chunk $\mathbf{a}_1 \sim p_\mathcal{T}$, the interpolated state at time $\tau$ is constructed as $\mathbf{a}_\tau = (1\!-\!\tau)\,\mathbf{a}_0 + \tau\,\mathbf{a}_1$. A neural velocity field $v_\theta(\mathbf{a}_\tau, \tau)$ parameterized by $\theta$ is trained to predict the conditional velocity $\mathbf{a}_1 - \mathbf{a}_0$ at each interpolated point $$\mathcal{L}_{\mathrm{fm}} = \mathbb{E}_{\tau \sim \mathcal{U}(0,1),\,\mathbf{a}_0 \sim p_\mathcal{N} ,\,\mathbf{a}_1\sim p_\mathcal{T}}\|v_\theta(\mathbf{a}_\tau, \tau) - (\mathbf{a}_1 - \mathbf{a}_0)\|^2.
    $$ At inference, an action is generated by drawing $\mathbf{a}_0 \sim p_\mathcal{N}$ and numerically integrating the learned ODE, i.e., ${d\mathbf{a}_\tau}/{dt} = v_\theta(\mathbf{a}_\tau, \tau)$, from $\tau\!=\!0$ to $\tau\!=\!1$ over discretization steps.

**What enables multimodality in stochastic generative policies?** In the 2D navigation task depicted in Fig. [1](#framework), flow matching exhibits robust multimodal capabilities, effectively capturing diverse valid paths. The MSE loss in Eq. [\[eq:fm_loss\]](#eq:fm_loss) actually also averages out the multimodality of the underlying velocity field [@guo2025variational; @zhang2025hierarchical]. However, flow matching additionally introduces a stochastic initial distribution to represent the conditional action distribution. Different initial samples, integrated along their respective ODE trajectories, lead to different action predictions. Thus, the multimodal capability of flow matching is enabled by this stochastic initialization, which introduces an additional degree of freedom beyond deterministic observations [@pearce2023imitating].

## Deterministic regression policy

Unlike standard diffusion or flow matching policies that generate actions from *Gaussian* noise, A2A [@jia2026action] uses proprioceptive historical actions $\mathbf{a}_{0} \sim p_\mathcal{H}$ as the flow starting point for action generation. By replacing the noise-to-action paradigm with an action-to-action formulation, the distributional discrepancy between source and target is significantly reduced, enabling efficient few- or even single-step inference without iterative denoising.

To facilitate seamless integration with the flow matching later, we reformulate A2A to operate directly in the action space rather than the latent space utilized in the original work [@jia2026action]. In this setting, the learning objective is formalized as $$\begin{aligned}
    \mathcal{L}_{\mathrm{A2A}} = \mathbb{E}_{\tau\sim \mathcal{U}(0,1), (\mathbf{a}_0, \mathbf{a}_1) \sim(p_\mathcal{H}, p_\mathcal{T})} \left\| v_\theta(\mathbf{a}_\tau, \tau) - (\mathbf{a}_1 - \mathbf{a}_0) \right\|^2 
    + \lambda_{\text{rec}} \mathbb{E}_{(\mathbf{a}_0, \mathbf{a}_1) \sim(p_\mathcal{H}, p_\mathcal{T})} \left\| \hat{\mathbf{a}}_1 - \mathbf{a}_1 \right\|_1,
    
\end{aligned}$$ where the second $\lambda_{\text{rec}}$ weighted-term represents a *reconstruction loss* based on the ODE-solved action $\hat{\mathbf{a}}_1$. This formulation facilitates fewer-step inference with a predefined fixed-step integration.

Prior research [@dp; @pan2025much; @jia2026action] has found that generative policies are generally more data-intensive and computationally demanding to train than their deterministic counterparts. Our empirical evaluations across several tasks corroborate this finding. As shown in Fig. [2](#multimodal_sim) and Fig. [4](#singlemodal), with limited training epochs, the flow matching achieves a lower convergence speed compared to A2A in most cases.

**What, then, drives the convergence advantage of deterministic policies over stochastic ones?** We attribute this discrepancy primarily to the introduction of stochasticity in generative models, which necessitates more extensive training for the network to effectively internalize the complex mappings from noise-augmented sources to expert actions. To verify this point, we analyze convergence behaviors under different variance settings of the initial distribution, as shown in Fig. [7](#loss_swap). As the noise variance increases, training loss converges more slowly, and task success rate finally drops.

# Modal-Adaptive Robot Sampling Policy

::: wrapfigure
![MARS architecture](media/architecture.png){width="100%"}
:::

The analysis above reveals that multimodal capability requires stochastic initialization with sufficient variance, yet higher variance degrades learning and inference efficiency. In practice, most robotic tasks contain a mixture of modal phases. Like the 2D navigation task shown in Fig. [1](#framework), certain phases require multimodal sampling (*e.g.*, at the junction), while others are inherently unimodal (*e.g.*, at the narrow gate). Applying the same noise level everywhere is suboptimal, as it forces the network to explore unnecessary stochasticity in unimodal phases.

## Policy structure {#Policy_struc}

To address this gap, we develop the MARS policy, aiming to adaptively adjust stochasticity only when it matters during tasks. Unlike flow matching that always starts from pure *Gaussian* noise, and unlike A2A that starts from history actions, MARS adaptively interpolates between the two extremes based on a learned multimodality weight $\mathbf{w}\in(\mathbf{0},\mathbf{1})^D$, where $D$ is the action dimensionality, $\mathbf{1}$ represents high stochasticity and $\mathbf{0}$ denotes full determinism. The policy structure is illustrated in Fig. [\[architecture\]](#architecture).

Specifically, the key module that distinguishes MARS policy from conventional policies is the modal scheduling network. This module is designed to predict a per-dimension weight vector $\mathbf{w}$ to decide multimodality, conditioned on current visual and *optional* proprioceptive observations. Structurally, the modal scheduling network is composed of a Multi-Layer Perceptron (MLP) terminated by a *Sigmoid* activation function to ensure that the generated weights are constrained within $(\mathbf{0},\mathbf{1})$.

The multimodality weight $\mathbf{w}$ generated from the modal scheduling network directly regulates the composition of the initial flow source. It effectuates a per-dimension convex interpolation between standard *Gaussian* noise and the deterministic historical action prior, i.e., $$\mathbf{a}_0 = (\mathbf{1} - \mathbf{w}) \odot \mathbf{a}^{\leq t} + \mathbf{w} \odot \boldsymbol{\epsilon}, \quad \mathbf{a}^{\leq t}\sim p_\mathcal{H}, \quad \boldsymbol{\epsilon} \sim \mathcal{N}(\mathbf{0}, \mathbf{I}), 
    $$ where $\odot$ denotes the *Hadamard* element-wise product and $\mathbf{a}^{\leq t}$ represents the measured historical action chunk. By operating element-wise, this formulation decouples the multimodal demands across different action dimensions, acknowledging that the requirement for multimodality may vary significantly across different axes within a single task phase. The remaining architecture follows standard flow matching. Visual and proprioceptive inputs are encoded by ResNet-18 for conditioning [@jia2026action], while the vector field adopts a DiT backbone [@Peebles_2023_ICCV].

## Training objectives

To coordinate the generative vector field and the modal scheduling network, we optimize a composite objective that balances multimodal expressivity with learning efficiency $$\mathcal{L} = \mathcal{L}_{\mathrm{fm}}
               + \lambda_{\mathrm{rec}} \mathcal{L}_{\mathrm{rec}}
                 + \lambda_{\mathrm{div}}\mathcal{L}_{\mathrm{div}},
    $$ where $\mathcal{L}_{\mathrm{fm}}$ and $\mathcal{L}_{\mathrm{rec}}$ coincide with Eq. [\[eq:a2a_loss\]](#eq:a2a_loss), and $\mathcal{L}_{\mathrm{div}}$ represents the *diversity loss*, which will be introduced later. Notably, $\mathcal{L}_{\mathrm{rec}}$ can compromise the multimodal expressivity of the flow matching objective in phases requiring high stochasticity (i.e., as $\mathbf{w} \to \mathbf{1}$), as illustrated in Fig. [8](#fm_reconstruction). To mitigate this, we implement a per-dimension gating strategy for the reconstruction loss $$\begin{aligned}
    \mathcal{L}_{\mathrm{rec}} =  \mathbb{E}_{(\mathbf{a}_0, \mathbf{a}_1) \sim(p_\mathcal{H}, p_\mathcal{T})} [\frac{1}{D}(\mathbf{1} - \mathbf{w})^\top | \hat{\mathbf{a}}_1 - \mathbf{a}_1 |],
\end{aligned}$$ ensuring that the modality weight adaptively suppresses the single-step *Euler* penalty on dimensions identified as multimodal, thereby preserving distributional diversity when it is most critical. Note that the weight $(\mathbf{1} - \mathbf{w})$ is used solely for loss weighting, with no gradient backpropagation.

Without additional intervention, the joint optimization of $\mathcal{L}_{\mathrm{fm}}$ and $\mathcal{L}_{\mathrm{rec}}$ naturally biases the flow source toward the deterministic historical prior (i.e., as $\mathbf{w} \to \mathbf{0}$). Because the historical prior resides in closer proximity to the target action than *Gaussian* noise, it provides an easier path for loss minimization, which can lead to a collapse of multimodality. To counteract this tendency, we introduce a diversity loss $\mathcal{L}_{\mathrm{div}}$ to preserve the policy's generative expressivity.

To quantify the degree of multimodality, we introduce *dispersion* $\mathcal{S}$ as a metric of distributional spread. The diversity loss is designed to align the generated source dispersion $\mathcal{S}_{\mathrm{curr}}$ with the target action dispersion $\mathcal{S}_{\mathrm{next}}$, i.e., $$\mathcal{L}_{\mathrm{div}} = \mathbb{E} \bigl[\frac{1}{D}\mathbf{1}^\top\mathrm{ReLU}(\mathcal{S}_{\mathrm{next}} - \mathcal{S}_{\mathrm{curr}})\bigr].
$$ To empirically approximate $\mathcal{S}_{\mathrm{next}}$, we evaluate the future action variations among samples sharing similar historical paths. Concretely, we identify the $m$ nearest neighbors $\mathcal{M}(i)$ of sample $i$ within the historical action space using a dataset-wide BallTree [@scikit-learn]. The target spread $\mathcal{S}_{\mathrm{next}}$ and the current source spread $\mathcal{S}_{\mathrm{curr}}$ for sample $i$ are defined as $$\mathcal{S}_{\mathrm{next}}^{(i)} = \frac{1}{m}\sum_{j\in\mathcal{M}(i)}|\mathbf{a}_{\mathrm{next}}^{(i)} - \mathbf{a}_{\mathrm{next}}^{(j)}|, \quad
\mathcal{S}_{\mathrm{curr}}^{(i)} = \frac{1}{m}\sum_{j\in\mathcal{M}(i)}\bigl|\mathbf{a}_{\mathrm{curr}}^{(i)} - \mathbf{a}_{\mathrm{curr}}^{(j)}\bigr|,
$$ where $\mathbf{a}_{\mathrm{next}}$ denotes the next action chunk, and $\mathbf{a}_{\mathrm{curr}}$ represents the current action chunk instantiated from the weighted flow sources through Eq. [\[eq:adaptive_source\]](#eq:adaptive_source). $\mathcal{S}_{\mathrm{next}}$ is precomputed over the dataset as it relies solely on ground-truth demonstrations. As for $\mathcal{S}_{\mathrm{curr}}$, we reuse updated $\mathbf{w}^{(i)}$ to construct each neighbor's source, so that $\mathbf{w}^{(i)}$ cleanly controls both $\mathbf{a}_{\mathrm{curr}}^{(i)}$ and $\mathbf{a}_{\mathrm{curr}}^{(j)}$.

**Remark:** This objective penalizes the model only when the source dispersion $\mathcal{S}_{\mathrm{curr}}$ is insufficient to cover the diversity of expert demonstrations. When the current noise level already provides a spread exceeding the target multimodality, the ReLU function ensures that the loss remains inactive. In this regime, the optimization pressure from $\mathcal{L}_{\mathrm{fm}}$ and $\mathcal{L}_{\mathrm{rec}}$ dominates, naturally pulling the flow source back toward the deterministic historical prior, pursuing superior learning efficiency. This interaction establishes a dynamic equilibrium, ensuring that the multimodality weight $\mathbf{w}$ is minimized for learning efficiency while still maintaining the necessary distributional spread required by expert demonstrations.

## Inference scheduling

Regarding inference performance, stochastic generative policies suffer from the sampling bottleneck inherent in iterative ODE integration, typically requiring $K \geq 9$ steps to produce high-fidelity actions [@pan2025much; @intelligence2025pi; @intelligence2025pi05; @black2024pi_0]. In contrast, the deterministic policies can operate as a direct one-step mapping [@jia2026action], resulting in much lower latency. Although generative techniques like consistency models [@li2026ofp; @Consistency] or mean-flow [@fang2025omp; @geng2026mean] have been proposed to enable single-step generation, they typically introduce additional training complexity.

In this work, the learned multimodality weight enables adaptive inference scheduling. For samples in predominantly unimodal phases, where the flow source is tightly grounded by the historical prior and lies close to the target, fewer ODE integration steps can yield satisfactory performance. We dynamically determine the per-sample step count based on the maximum weight component across all dimensions, allocating computational budget proportional to the degree of stochasticity, i.e., $K(\mathbf{w}) = K_{\max} \cdot |\mathbf{w}|_\infty$, where $K_{\max}$ is a fixed upper bound on the number of ODE integration steps and $|\mathbf{w}|_\infty$ selects the most multimodal dimension. This scales the inference from a single step for deterministic samples up to the full step budget for highly multimodal ones, ensuring accurate generation without wasted computation.

# Evaluation

## Experimental setup

In our experiments, we consider $8$ simulated tasks and $4$ real-world tasks. The simulated tasks consist of four strategically unimodal tasks (*Close Box*, *Stack Cube*, *Pick Cube*, and *Close Drawer*) and four strategically multimodal tasks (*2D Navigation*, *Push Cube*, *Grasp Eyeglasses*, and *Collision Avoidance*). The real-world tasks include *Push-T*, *Pick Cup*, *Block Push*, and *Pick Vegetable*, evaluated on a *Franka Emika Research3* and a *Galaxea R1 Lite* platform. The involved baselines are provided in Appx. [8](#appen:2d_benchmark) and Appx. [10](#appen:Unimodal). Key hyperparameters are standardized across all models to ensure a fair comparison. Training and evaluation settings for different tasks are detailed in Appx. [9](#appen:training).

We first validate the MARS policy on multimodal tasks, where the MARS policy is expected to exhibit multimodal capability while retaining both learning and inference efficiency, potentially trailing A2A in efficiency but outperforming flow matching. Afterwards, we implement MARS on unimodal tasks to seek additional compelling findings.

![**Learning performance on strategically multimodal tasks.** (a) Push Cube with bimodal trajectories: the gripper pushes the cube either left or right with equal validity. (b) Grasp Eyeglasses with bimodal grasp poses: the gripper grasps the eyeglasses from either the left or right side. (c) Collision Avoidance with bimodal speeds: the agent may either slow down or accelerate to safely cross the intersection. Each benchmark is accompanied by its training efficiency (*upper panel*: Success Rate, SR) and *modal balance* metric (*lower panel*: $\gamma$) over training epochs.](media/multimodal_sim.png){#multimodal_sim width="100%"}

## Multimodal evaluation

**Simulation results.** Fig. [1](#framework) and Fig. [2](#multimodal_sim) summarize the learning efficiency and multimodal characteristics of different algorithms on the 4 simulational multimodal tasks. Focusing first on training efficiency, as shown in Fig. [1](#framework)(e) and Fig. [2](#multimodal_sim), the MARS policy continues to converge faster than flow matching. In contrast, A2A suffers from the mode averaging issue and exhibits highly unstable success rates, occasionally converging the fastest, but often failing entirely on the same task. To further quantify multimodal capability, we adopt a *modal balance* metric $\gamma \in [0, 1]$, where values closer to 1 denote more balanced mode coverage (Appx. [11](#appen:metrics)).

As shown in the modal curve $\gamma$ of Fig. [2](#multimodal_sim), MARS policy retains a modal balance comparable to that of flow matching, demonstrating that the learning efficiency does not come at the cost of multimodal expressivity. An interesting observation arises from the color bar in Fig. [1](#framework)(d), that is, preserving full multimodal capability does not always require *Gaussian* noise with unit variance; often a smaller variance suffices. This highlights its noise-adaptivity: *no more stochasticity than necessary*.

Regarding inference efficiency, we further plot the inference step count and cost time curves on the 2D Navigation task in Figs. [1](#framework)(f) and (g). Benefited from our adaptive multimodal scheduling, the inference step count varies on the fly. More steps are allocated to regions of high stochasticity, while near-deterministic regions are resolved with fewer steps, leading to an optimized inference budget.

![**Real-world experimental results.** (a) Real-world deployment results on the Push-T, Block Push (B-P), Pick Cube (P-C), and Pick Vegetable (P-V) tasks. See Fig. [9](#pusht)-[12](#pickcup) for detailed snapshots. (b) Success rate comparison. (c) Multimodality evaluation quantified by the modal balance metric $\gamma$. (d) Inference cost analysis.](media/realtest.png){#realtest width="100%"}

**Real-world results.** To evaluate physical deployment capability, we validate MARS on four hardware tasks (Fig. [1](#framework)(h)). As illustrated in Fig. [3](#realtest)(b), MARS consistently achieves optimal success rates across all benchmarks, outperforming flow matching. More importantly, this multimodal expressivity is delivered with extreme computational efficiency. As shown in Fig. [3](#realtest)(d), MARS achieves a remarkably low inference latency ($\approx 5$ ms). This performance nearly matches A2A execution ($\approx 3$ ms) and is roughly $6\times$ faster than flow matching ($\approx 28$ ms), demonstrating its readiness for real-time robotic control. Consequently, both MARS and A2A produce noticeably smoother trajectories than flow matching, the vivid demonstrations of which are provided in the supplementary video.

As for multimodality, Fig. [3](#realtest)(c) reveals that MARS preserves a superior modal balance, whereas the A2A baseline expectedly exhibits strict unimodality. Interestingly, diverging slightly from simulation outcomes, MARS marginally outperforms flow matching in three physical environments. Notably, when constrained by sparse demonstrations or overtrained checkpoints (see Fig. [13](#appen_fm)), flow matching tends to drift toward unimodality, yet MARS robustly preserves its multimodal expressivity.

We hypothesize that real-world data introduces more confounding factors, such as subtle variations in initial robot poses or visual backgrounds. Under data scarcity or excessive training iterations, these real-world nuisances exacerbate overfitting, which implicitly collapses mode diversity under the same evaluation initial setting. Thanks to its adaptive scheduling, MARS only maintains the necessary noise level, exhibiting enhanced resilience against overfitting compared to flow matching. Disentangling the precise scaling laws between real-world multimodality, demonstration volume, and training epochs remains a compelling avenue for future work.

![**Learning performance on strategically unimodal tasks.** (a) Close Box is from RLBench [@james2020rlbench]. (b) Stack Cube and (c) Pick Cube are from ManiSkill [@mu2021maniskill]. (d) Close Drawer is from LIBERO [@liu2023libero]. The colored shaded area represents the standard deviations of $3$ random seeds.](media/singlemodal.png){#singlemodal width="100%"}

## Unimodal evaluation

Next, MARS is carried out on 4 unimodal tasks. Fig. [4](#singlemodal) reports the learning performance. As expected, MARS policy converges faster than flow matching in most cases, since unimodal tasks require less stochasticity and admit a more readily learnable observation-to-action mapping. More surprisingly, on tasks such as Stack Cube and Pick Cube, MARS policy converges even faster than A2A. We attribute this to two factors. On the one hand, MARS absorbs the subtle trajectory variations in expert demonstrations through stochastic initialization, whereas deterministic policies are forced to fit these variations as supervision noise, increasing gradient variance. On the other hand, the stochastic source acts as an input-side regularizer that smooths the loss landscape, an effect well-known to accelerate convergence in supervised learning.

We further evaluate the performance of the MARS policy against 8 SOTA baselines on the Stack Cube task across two distinct simulation platforms, *MuJoCo* and *IsaacSim*. As summarized in Tab. [\[tab-mujoco\]](#tab-mujoco) and Tab. [\[tab-isaacsim\]](#tab-isaacsim), MARS achieves a convergence rate comparable to the deterministic A2A baseline in both environments, while significantly outperforming other generative policy baselines.

# Conclusion

We presented MARS policy, a flow-matching-based visuomotor policy that bridges the long-standing gap between deterministic policies (efficient but mode-averaging) and generative policies (expressive but slow). By exploiting the insight that multimodality in flow matching originates from stochastic initialization, MARS adaptively schedules the noise scale and inference steps according to the stochasticity required at each state. Experiments on 8 simulated and 4 real-world tasks across two kinds of platforms demonstrate that MARS achieves the learning efficiency of A2A and the multimodal expressivity of flow matching, which have so far been difficult to obtain simultaneously.

# Limitation

The dispersion-based diversity loss, while effective in preserving multimodality, is not the most lightweight design. Both the BallTree construction and the per-iteration spread computation add overhead that scales with dataset size and neighbor count. Future work will explore more efficient alternatives, such as implicit dispersion regularizers or learnable diversity surrogates that avoid explicit neighbor queries altogether.

# Benchmarking on 2D Navigation Test {#appen:2d_benchmark}

We benchmark the proposed MARS policy against a comprehensive set of baselines: *Generative* paradigms, including DiT-based flow matching [@flowmatching] and diffusion policy [@dp]; *Multimodal* baselines, such as IBC [@florence2021implicit] and BET [@shafiullah2022behavior]; *Deterministic* policies, including A2A [@jia2026action] and its stochastic counterpart Noised-A2A, VITA [@gao2025vita], and ACT [@zhao2023learning].

As shown in Fig. [6](#2d_benchmark), while expert trajectories (a) demonstrate strategic multimodality, only stochastic models (b-g) can represent the underlying distribution. Notably, generative (b-d) achieves superior fidelity and cleaner trajectories compared to other methods. In contrast, deterministic baselines (h-j) are confined to a single mode, failing to capture the rich tactical variations present in the expert data. The Noised-A2A (g) further illustrates that slight noise injection is insufficient to recover the complex branching logic mastered by MARS.

![**A2A policy on 2D Navigation.** A2A occasionally reaches the target by collapsing to a single mode (a), but frequently gets stuck near an obstacle (b). Successful runs are largely attributable to training-time stochasticity.](media/a2a_failed.png){#a2a_failed width="50%"}

![Qualitative comparison of trajectory generation across different policy architectures.](media/2d_benchmark.png){#2d_benchmark width="100%"}

![**Effect of initial flow variance on optimization and evaluation.** Settings: 30 training epochs, 100 demonstrations, and 50 evaluation rollouts. **Left:** Training loss curves under different initial variances (0-10) of the flow source distribution. Larger variance leads to slower and noisier convergence. **Right:** Evaluation success rate under different initial variances, showing that excessively large variance degrades success rate.](media/loss_swap.png){#loss_swap width="60%"}

![**Reconstruction loss compromises multimodal expressivity.** We visualize 100 rollouts of the flow matching policy on 2D Navigation. (a) Standard flow matching distributes trajectories across all four valid passages (counts: 20/24/29/24). (b) Adding a reconstruction loss with weight $\lambda_{\text{rec}} = 1$ biases the policy toward the two central passages (10/36/40/4), with the outer passages substantially under-explored. This motivates our per-dimension gating strategy that adaptively suppresses the reconstruction penalty based on recognized multimodal degree.](media/fm_reconstruction.png){#fm_reconstruction width="50%"}

# Training and Evaluation Configurations {#appen:training}

## Simulational Training and evaluation details

**Training Details.** For unimodal benchmarks, we utilize $100$ expert demonstrations for Stack Cube, Close Box, and Pick Cube, while the Close Drawer task is trained with $50$ demonstrations. In multimodal scenarios, we employ $200$ demonstrations for the 2D Navigation task, whereas all other tasks are trained using $100$ demonstrations. Additionally, the models presented in Fig. [1](#framework), Fig. [5](#a2a_failed), Fig. [6](#2d_benchmark), and Fig.[8](#fm_reconstruction) are trained for a fixed duration of $50$ epochs. For the action space, the employed Franka uses joint commands in simulation.

**Evaluation Details.** The *2D Navigation* task is evaluated over $100$ trials using distinct random seeds to ensure statistical significance. For all other tasks, performance is reported based on the average of $50$ evaluation rollouts. All inference-time measurements in Fig. [6](#2d_benchmark) are conducted on a single NVIDIA $H200$ GPU ($141$ GB HBM3e) hosted on a node with dual Intel Xeon Gold 6530 processors. For every method, we report the mean and standard deviation of per-step inference time over $50$ evaluation rollouts. Moreover, the first five predictions per run are discarded as a warm-up.

## R1 Lite training and evaluation details

**Hardware and Observation Setup.** We evaluate Pick Cup and Pick Vegetable on a **Galaxea R1 Lite** bimanual robot. Only the right arm and right two-finger gripper are actuated during data collection and rollout. The policy observes two RGB views: a head-mounted third-person camera and a right wrist-mounted egocentric camera. For the action space, the R1 Lite uses joint commands in real-world experiments.

**Tasks and Demonstration Statistics.** We evaluate on two contact-rich manipulation tasks. For each task, we deliberately collect a balanced set of demonstrations that contain *two distinct interaction modes* so that we can probe the policy's ability to model multi-modal action distributions:

- **Pick Cup.** The robot grasps a coffee mug from a tabletop. To induce multi-modality, we collect 100 demonstrations grasping the mug by its rim and 100 grasping it by its handle, yielding 200 demonstrations. These geometrically distinct strategies start from the same initial states, making them challenging for unimodal policies. For this task, all three policies, A2A, flow matching, and MARS, are trained for 500 epochs.

- **Pick Vegetable.** The robot picks up a vegetable from a tabletop scene with a carrot, a mango, and a daikon arranged in sequence, where the carrot and daikon are placed on opposite sides of the mango. To induce multi-modality, we collect 100 demonstrations for picking the carrot and 100 for picking the daikon. Since either vegetable is a valid target, both modes are treated as successful task completions, yielding 200 demonstrations. For this task, all three policies, A2A, flow matching, and MARS, are trained for 400 epochs.

**Evaluation Details.** For both Pick Cup and Pick Vegetable, we evaluate each trained policy with 10 rollout trials. In addition to task success, we record the executed action mode in each rollout, such as rim *vs.* handle grasping for Pick Cup and carrot *vs.* daikon picking for Pick Vegetable, to analyze whether each policy captures the intended multi-modal behavior.

## Franka training and evaluation details

**Hardware and Observation Setup.** We evaluate Push-T and Block Push using a **Franka Emika Research 3** (FR3) robotic arm. The scene is observed by one RGB-D Intel RealSense D455 camera, a fixed top-down camera providing a global view of the workspace. All human demonstrations are collected using a 3Dconnexion SpaceMouse via the HILSERL teleoperation framework [@luo2025precise]. For the action space, the employed Franka uses end-effector states in real-world experiments. **Tasks and Demonstration Statistics.** Our evaluation uses two real-world manipulation tasks with action multimodality. We uniformly collect demonstrations across bimodal behavior modes, providing a basis for characterizing the multimodal structure of the action distribution.

- **Push-T.** The end-effector pushes a T-shaped block into the target region from a fixed initial pose. The dataset contains 100 demonstrations covering two pushing paths, corresponding to the upper and lower routes around the block, with 50 trials for each path. To reduce the influence of preceding motions during data collection, the robot is first moved to a randomly sampled point and then returned to the same start pose before each demonstration.

- **Block Push.** The end-effector pushes one of two blocks to its corresponding target region from a shared initial pose. The dataset contains 100 demonstrations covering two pushing modes, pushing the orange block to its target region or pushing the purple block to its target region, with 50 trials for each mode. This setup reflects action multimodality, as the same start states admit two valid object-selection choices.

**Training Details.** For each Franka real-world task, we use $100$ demonstrations for training. All three policies, A2A, flow matching, and MARS, are trained with identical settings within each task. Based on the convergence behavior of each task, we train the policies for 100 epochs on Push-T and 40 epochs on Block Push. **Evaluation Details.** For both Push-T and Block Push, we evaluate each trained policy with 20 rollout trials. Beyond task success, we also annotate the behavior mode executed in each rollout, including the upper or lower pushing route in Push-T and the selected block in Block Push. This allows us to examine whether each policy preserves the demonstrated multimodal behaviors rather than converging to a single action pattern. All inference-time measurements are conducted on an NVIDIA RTX $5080$ GPU($16$ GB) and $128$ GB of system memory.

## Training and evaluation hyperparameters

All training and evaluation hyperparameters of MARS policy are kept consistent across all experiments, as listed in Table [1](#tab:parameters).

::: {#tab:parameters}
  **Hyperparameters**       **Value**
  ------------------------ -----------
  chunk size                    8
  history horizon               8
  $K_{max}$                    10
  $m$                          20
  $\lambda_{\text{rec}}$        1
  $\lambda_{\text{div}}$        1
  Batch size                   32

  : Training hyperparameters.
:::

# Benchmarking on Cross-Sim Unimodal Tests {#appen:Unimodal}

To validate the efficacy of the MARS policy, we conducted a comprehensive benchmark against eight SOTA baselines on the Stuck Cube task, utilizing both *MuJoCo* and *IsaacSim* as evaluation platforms. The compared baselines includes: DDPM-UNet [@dp; @ddpm], DDPM-DiT [@ddpm; @Peebles_2023_ICCV], DDIM-UNet [@dp; @song2020denoising], FM-UNet [@flowmatching], FM-DiT [@flowmatching; @Peebles_2023_ICCV], Score-UNet [@song2020score], ACT [@zhao2023learning], A2A [@jia2026action]. Key hyperparameters, including the chunk size, are standardized across all compared models to maintain experimental consistency. The evaluated results are summarized in Tab. [\[tab-mujoco\]](#tab-mujoco) and Tab. [\[tab-isaacsim\]](#tab-isaacsim).

::: table*
  ------------- --------------- ------------------ ------------------ ------------------ ------------------ ------------------ ------------------ ------------------ ------------------ ------------------ ------------------
  **Methods**    **Inference**        **10**             **20**             **30**             **40**             **50**             **60**             **70**             **80**             **90**            **100**
                   **Steps**           (%)                (%)                (%)                (%)                (%)                (%)                (%)                (%)                (%)                (%)
  **MARS**           1-10             **14**             **50**             **78**             **74**             **68**        [64]{.underline}        **78**             **92**             **96**             **98**
  A2A                  1         [12]{.underline}   [20]{.underline}   [44]{.underline}   [50]{.underline}   [60]{.underline}        **72**        [72]{.underline}   [74]{.underline}   [84]{.underline}   [86]{.underline}
  FM-DiT              10                2                  4                  8                  8                  10                 16                 36                 36                 50                 58
  DDPM-DiT            100               0                  0                  2                  4                  2                  22                 42                 52                 72                 78
  FM-UNet             10                0                  2                  2                  4                  0                  2                  6                  4                  8                  12
  DDPM-UNet           100               0                  2                  0                  0                  6                  6                  16                 20                 22                 40
  DDIM-UNet           40                0                  2                  0                  2                  6                  12                 26                 16                 16                 26
  Score-UNet          100               0                  0                  4                  4                  4                  4                  4                  16                 14                 22
  ACT                  1                6                  2                  2                  4                  14                 6                  12                 6                  12                 4
  ------------- --------------- ------------------ ------------------ ------------------ ------------------ ------------------ ------------------ ------------------ ------------------ ------------------ ------------------
:::

::: table*
  ------------- --------------- ----------------- ------------------ ------------------ -------- ------------------ ------------------ -------- ------------------ ------------------ ------------------
  **Methods**    **Inference**       **10**             **20**             **30**        **40**        **50**             **60**        **70**        **80**             **90**            **100**
                   **Steps**           (%)               (%)                (%)           (%)           (%)                (%)           (%)           (%)                (%)                (%)
  **MARS**           1-10            **10**             **50**        [52]{.underline}   **56**        **58**        [60]{.underline}   **74**        **80**             **92**             **90**
  A2A                  1         [8]{.underline}   [44]{.underline}        **54**        **56**   [56]{.underline}        **72**        **74**   [74]{.underline}   [78]{.underline}   [84]{.underline}
  FM-DiT              10                4                 8                  32            24            28                 42            46            42                 50                 62
  FM-UNet             10                4                 8                  10            8             24                 18            14            34                 50                 44
  DDPM-DiT            100               0                 0                  4             4             14                 16            38            36                 48                 50
  DDPM-UNet           100               0                 6                  6             8             20                 26            24            24                 36                 48
  DDIM-UNet           40                0                 8                  14            8             8                  18            36            42                 38                 64
  Score-UNet          100               0                 0                  2             8             6                  22            6             26                 26                 24
  ACT                  1                8                 2                  16            22            16                 28            26            32                 48                 38
  ------------- --------------- ----------------- ------------------ ------------------ -------- ------------------ ------------------ -------- ------------------ ------------------ ------------------
:::

# Evaluation Metric of Multimodality {#appen:metrics}

To quantify multimodal capability, we adopt a *modal balance* metric $\gamma$ for the three bimodal tasks in Fig. [2](#multimodal_sim) $$\gamma = \frac{2\min\{n_1, n_2\}}{n_1 + n_2},$$ where $n_1$ and $n_2$ denote the number of successful rollouts assigned to mode 1 and mode 2, respectively. A value close to 1 indicates that the two modes are visited evenly, while a value approaching 0 reflects increasingly imbalanced mode coverage.

![Snapshots of the Push-T task.](media/pusht.png){#pusht width="90%"}

![Snapshots of the Block Push task.](media/pushcube.png){#pushcube width="50%"}

![Snapshots of the Pick Vegetable task.](media/pickvege.png){#pickvege width="90%"}

![Snapshots of the Pick Cup task.](media/pick_cup.png){#pickcup width="90%"}

![**Robustness analysis of modal balance under real-world data scarcity and overtraining (Pick Cup).** The default configuration ("Adopted") consists of 200 demonstrations and 400 training epochs. MARS maintains a resilient and stable modal balance ($\gamma = 0.8$) across both data-restricted (50 demonstrations) and overtrained regimes (800 epochs). In contrast, the generative baseline exhibits severe mode degradation. ](media/appen_fm.png){#appen_fm width="40%"}

[^1]: With a slight abuse of terminology, we define a *generative* policy as a stochastic process that recovers target actions from a noise initial distribution, whereas a *deterministic* policy is defined as an unimodal mapping from observations to a single optimal action, optimized via an MSE loss.
