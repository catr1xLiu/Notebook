

**LoRA-MDM-Age** is a research initiative aiming to generate age-specific human motion (e.g., "Young", "Adult", "Elderly") using text-to-motion diffusion models. Following the Fall 2025 development cycle, this document serves as a technical audit of the codebase, the failure of the continuous conditioning approach, and the strategic pivot toward discrete <u><strong style="color:#dab1da">Low-Rank Adaptation (LoRA)</strong></u>.

> [!abstract] Project Context
> ## Executive Summary

The project is currently transitioning from an architectural modification approach (modifying the core MDM attention mechanism) to a modular fine-tuning approach (LoRA). The previous attempt to treat age as a continuous scalar variable ($0.18 - 0.90$) achieved statistical correlation with velocity ($r = -0.96$) but failed to produce biomechanically distinct aging features.



The immediate goal is to utilize the stabilized **Van Criekinge** dataset to train distinct LoRA adapters for discrete age groups, targeting a February 15th submission.

---

> [!quote] Definition
> ## The Diffusion Baseline

The project builds upon the Motion Diffusion Model (MDM). The core mechanism is the <u><strong style="color:#dab1da">forward diffusion process</strong></u>, which gradually adds Gaussian noise to motion data over $T$ timesteps:

$$
q(x_t | x_0) = \mathcal{N}(x_t; \sqrt{\bar{\alpha}_t} x_0, (1 - \bar{\alpha}_t) \mathbf{I})
$$

Where:
* $x_t \in \mathbb{R}^{B \times T \times 263}$ represents the motion sequence at step $t$.
* $\bar{\alpha}_t$ is the cumulative product of the noise schedule.

The model approximates the reverse noise $\epsilon$, optimizing the simple loss objective:

$$
\mathcal{L}_{\text{simple}} = \mathbb{E}_{x_0, \epsilon, t}\left[ \| \epsilon - \epsilon_\theta(x_t, t) \|^2 \right]
$$

---

> [!warning] Critical Failure Analysis
> ## Continuous Age Conditioning

The previous student (Eugene Zhao) implemented a custom `AgeEncoder` module.

**The Approach:**
A Multi-Layer Perceptron (MLP) projected a normalized age scalar $a \in [0, 1]$ into the latent dimension $D=512$, which was concatenated with the timestep embedding.

**The Result:**
* **Statistical:** Strong negative correlation between input age and root velocity.
* **Perceptual:** Motions looked identical in terms of posture and frailty; the model simply "moved slower" rather than "moving older."
* **Technical Debt:** The architecture changes broke compatibility with standard MDM checkpoints, requiring full retraining.
![[Age vs Speed ScatterPlot.png]]

---

> [!hint] Strategic Pivot
> ## Discrete LoRA Adapters

To rescue the timeline, the project will pivot to <u><strong style="color:#dab1da">Low-Rank Adaptation (LoRA)</strong></u>. Instead of modifying the massive transformer weights $W \in \mathbb{R}^{d \times d}$, we inject trainable rank decomposition matrices.



**The Update Rule:**
$$
W' = W + \frac{\alpha}{r} BA
$$

Where:
* $W \in \mathbb{R}^{d \times k}$ are the frozen pre-trained weights.
* $B \in \mathbb{R}^{d \times r}$ initialized to zeros.
* $A \in \mathbb{R}^{r \times k}$ initialized with Gaussian noise.
* $r \ll d$ is the rank (typically $r=32$ or $64$).

This allows us to switch styles (Young $\leftrightarrow$ Elderly) by simply swapping the adapter weights ($A, B$) while keeping the base model frozen.

---

> [!info] Data Infrastructure
> ## Van Criekinge Dataset Status

The **Van Criekinge** dataset pipeline has been a source of significant instability ("horror" artifacts).



**Current Status:**
* **Pipeline:** C3D Mocap $\to$ Vicon $\to$ SMPL $\to$ HumanML3D format.
* **Fix Implemented:** A "New Marker Fitting" solution was written to solve the "sideways pelvis" bug in coordinate transformation.
* **Action Item:** Validate that the repaired `.npy` files correctly map to the SMPL topology before training starts in Week 2.

---

> [!code] Implementation Plan
> ## LoRA Injection Logic

The following pseudo-code illustrates how the discrete adapters will be applied to the linear layers of the MDM Transformer.

```python
class LoRALayer(nn.Module):
    def __init__(self, in_dim, out_dim, rank=64, alpha=1):
        super().__init__()
        # The frozen original weight
        self.linear = nn.Linear(in_dim, out_dim)
        self.linear.weight.requires_grad = False
        
        # The trainable low-rank adapters
        self.lora_A = nn.Parameter(torch.randn(rank, in_dim)) # Shape: (r, in_dim)
        self.lora_B = nn.Parameter(torch.zeros(out_dim, rank)) # Shape: (out_dim, r)
        self.scaling = alpha / rank

    def forward(self, x):
        # x shape: (B, T, in_dim)
        
        # 1. Base path (frozen)
        base_out = self.linear(x) # (B, T, out_dim)
        
        # 2. LoRA path (trainable)
        # (B,T,in) @ (in,r) -> (B,T,r) @ (r,out) -> (B,T,out)
        lora_out = (x @ self.lora_A.T @ self.lora_B.T) * self.scaling
        
        return base_out + lora_out
```

**Tensor Flow Analysis:**
1.  Input Tensor: $x \in \mathbb{R}^{B \times T \times 512}$ (Sequence of token embeddings)
2.  Projection A: Projects down to bottleneck $\mathbb{R}^{B \times T \times 64}$.
3.  Projection B: Projects back up to $\mathbb{R}^{B \times T \times 512}$.
4.  Result: The LoRA delta is added to the frozen attention output.

---

> [!example] Roadmap
> ## Weeks 2-8 Execution Plan

| Phase | Duration | Tasks | Success Metric |
|:---|:---|:---|:---|
| **Validation** | Week 2-3 | Validate "New Marker Fitting" pipeline; Split VC dataset by age bins. | No visual artifacts in `render_smpl.py`. |
| **Training** | Week 4-5 | Train 3 separate LoRA adapters (Young, Adult, Elderly). | Loss convergence $< 0.04$. |
| **Analysis** | Week 6 | Compute Fréchet Inception Distance (FID) and Diversity scores. | Metrics comparable to standard MDM. |
| **Writing** | Week 7-8 | Draft paper; Generate demo videos. | Submission ready. |

---
## Appendices

### See Also
* [[Understanding Motion Diffusion Model]] - Core architecture notes.
* [[Understanding LoRA-MDM]] - Reference implementation.
* [[3 Solutions/New Marker Fitting]] - Details on the dataset fix.

### References
1.  Tevet, G., et al. "Human Motion Diffusion Model." ICLR 2023.
2.  Hu, E. J., et al. "LoRA: Low-Rank Adaptation of Large Language Models." ICLR 2022.