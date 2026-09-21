# Configuration-Space Corridors for Generative Human Motion

> Unpublished working paper · September 2026 · Methodology only
> Source: [paper.tex](sources/paper.tex), §§3–5; task scope from §6.

> [!fact] Methodology
> ## Feasible-set conditioning of a motion prior

The proposal uses a planner to find where a human body can fit through clutter, then lets a motion generator choose how to move naturally through that space. **Phase 1** builds a corridor around one planned route, accounting for body orientation while leaving room to choose steps, speed, and turn timing. **Phase 2** expands this to connected feasible regions that can offer multiple routes and accommodate changes in body height or posture.

#### <u>Planning state and division of responsibility</u>

$$
q = (x,y,\theta) \in SE(2).
$$

$$
\mathcal{C}_{free} = \{q \mid B(q) \cap S = \emptyset\}.
$$

$$
\Pi(M_t) \in T, \qquad M \sim p_\theta(M).
$$

| $q$ | $B(q)$ | $S$ | $M,\ M_t$ | $\Pi$ | $T$ | $p_\theta$ |
| --- | --- | --- | --- | --- | --- | --- |
| Planar position and heading | Coarse body footprint | Static scene | Motion sequence, frame | Motion-to-state projection | Feasible corridor | Motion prior |

The draft overloads $\theta$ for heading and model parameters, and $T$ for the corridor and, below, sequence length.

| Component | Responsibility |
| --- | --- |
| Configuration-space planner | Route topology and orientation-dependent clearance |
| Motion prior | Timing, gait, footsteps, turning style, articulation |
| Residual scene guidance | Collisions missed by the coarse footprint |

#### <u>Phase 1: seed path → corridor</u>

Approximate the upright body by an oriented rectangle, capsule, or ellipse. Run A* on an $(x,y,\theta)$ lattice; inflate the seed path into overlapping collision-free convex regions. Locally unwrap heading into $(x,y,\tilde\theta)\in\mathbb{R}^3$ for the polytope representation. Below, region coordinates use this local chart.

$$
R_i = \{q \mid A_iq \le b_i\}.
$$

$$
L_{corr}(q) = \sum_k \left[\max\left(0,a_k^\top q-b_k\right)\right]^2.
$$

| $R_i$ | $A_i,\ b_i$ | $a_k^\top,\ b_k$ | $L_{corr}$ |
| --- | --- | --- | --- |
| Corridor region | Half-space constraints | Constraint row and bound | Region-violation penalty |

The penalty is zero throughout the region. Each frame or short window receives one or more overlapping regions, a coarse progress indicator, and local geometry such as boundary distances or an occupancy/cost field. Goal/text context is optional.

#### <u>Planner cost field</u>

A cost-to-go field supplies global route preference and can retain alternatives excluded by a single seed corridor.

$$
E_{plan}(M) = \sum_{t=1}^{T} V\bigl(\Pi(M_t)\bigr).
$$

| $V(q)$ | $E_{plan}$ | $t$ | $T$ |
| --- | --- | --- | --- |
| Planner cost-to-go | Sequence-level planner energy | Motion frame | Sequence length |

Corridors specify admissible regions; the field supplies soft direction toward the goal. The draft proposes studying each interface and their combination.

#### <u>Learned conditioning and analytic guidance</u>

Freeze the pretrained diffusion backbone. Train a feasibility encoder $E_\phi$ and a ControlNet-like residual branch with zero-initialized residual connections. Per-window local SE(2) fields can contain feasible occupancy, clearance, and normalized cost-to-go; $E_\phi$ converts them into feasibility tokens $z_t$.

$$
q_t = \Pi(X_t) = (x_t,y_t,\theta_t).
$$

$$
\mu_s \leftarrow \mu_s - \eta\nabla_{\mu_s}
\left(\lambda_c E_{corr}+\lambda_p E_{plan}+\lambda_b E_{body}\right).
$$

| $X_t$ | $\mu_s,\ s$ | $\eta$ | $E_{corr}$ | $E_{body}$ | $\lambda_c,\lambda_p,\lambda_b$ |
| --- | --- | --- | --- | --- | --- |
| Articulated prediction at frame $t$ | Reverse-step mean, diffusion step | Guidance step size | Corridor energy | Full-body SDF/mesh collision energy | Energy weights |

Guidance evaluates coarse states from predicted clean motion; the body term uses the original scene. The draft leaves the exact energy-to-denoiser differentiation path unspecified.

Illustrative sampling structure; helper names denote operations, not implemented APIs:

```python
def generate(
    scene: Scene,
    start: Configuration,
    goal: Configuration,
    context: Context,
    steps: int,
) -> Motion:
    '''
    Configuration: planar position and heading.
    Uses a frozen backbone and trained feasibility/control branch.
    Region assignment and guidance details remain design choices.
    '''
    seed = astar_se2(scene, start, goal)
    regions = inflate_corridor(seed, scene)
    field = planner_cost_to_go(scene, goal)
    noisy = sample_motion_noise()
    for s in reversed(range(steps)):
        local = local_feasibility(regions, field, noisy, s)
        tokens = feasibility_encoder(local)
        mean = controlled_reverse_mean(noisy, s, tokens, context)
        mean = guide_mean(mean, s, regions, field, scene)
        noisy = reverse_transition(mean, s)
    return decode_motion(noisy)
```

#### <u>Training without paired motion–scene data</u>

Extract the coarse trajectory of a mocap sequence:

$$
q_t^* = \Pi(M_t^*).
$$

Synthesize asymmetric corridors and cost fields that contain the trajectory without centering on it. Randomize corridor width, offset, orientation range, and local branching; reuse each motion under many feasible sets. Train only the encoder/control branch.

$$
L = L_{diff} + \lambda_f\sum_{t=1}^{T}
d\left(\Pi\left(\widehat{M}_{0,t}\right),R_t\right)^2.
$$

| $M^*$ | $\widehat{M}_{0,t}$ | $R_t$ | $d(q,R_t)$ | $L_{diff}$ | $\lambda_f$ |
| --- | --- | --- | --- | --- | --- |
| Mocap target | Predicted clean frame | Assigned feasible region | Distance to feasible set | Diffusion training loss | Feasibility weight |

The intended effect is to learn multiple valid motions per feasible set while preserving the backbone's motion prior. The draft does not specify the diffusion prediction target or synthetic-field construction algorithm.

#### <u>Phase 2: region decomposition and GCS</u>

Replace inflation around one seed with a collection of overlapping collision-free regions. The draft proposes IRIS-NP for nonlinear configuration-space constraints, or C-IRIS for certified polytopes in a rational parameterization. GCS selects region sequences and optimizes trajectories through them; the generative interface exposes selected regions or the region graph.

$$
R_{i_1}\to R_{i_2}\to\dots\to R_{i_K}.
$$

| $i_j$ | $K$ |
| --- | --- |
| Region index at route position $j$ | Number of regions in the selected sequence |

Diffusion receives local feasible sets, a cost-to-go over neighboring regions, or both. Add body height or a discrete posture mode only when needed for traversability. Timing and potentially route choice remain with the motion prior.

**Unspecified in the draft:** region assignment and progression, endpoint enforcement, cost-field interpolation, aggregation across overlapping regions, guidance schedules, and the full-body collision objective. Corridor membership constrains only the coarse footprint; the stated soft penalties do not establish collision-free articulated motion. Realizability also depends on the prior containing the required maneuvers.
