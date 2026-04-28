#import "@preview/basic-report:0.4.0": *
#show: it => basic-report(
  doc-category: "To: Dr. Pengcheng Xi & Dr. Shu Chang",
  doc-title: "Week 12 Report",
  author: "Yiran Liu",
  affiliation: "NRC - Digital Technology",
  language: "en",
  compact-mode: true,
  it
)

= Work Completed This Week

== Bug Fix: Canonical Axis Inversion in Dataset Construction Pipeline

A critical bug was identified and fixed in `3_export_humanml3d.py` (commit `c93d7ae8`). The direct cause was a missed negative sign in the axis estimation: the body-left vector was computed as R\_hip $-$ L\_hip instead of L\_hip $-$ R\_hip, producing a left–right mirror of every exported motion clip.

The root problem was insufficient visual validation. Early skeleton visualizations were rendered without joint labels, making a pure left–right reflection impossible to detect by eye. The issue was only caught after fitting SMPL meshes to the exported joints using `joints2smpl`, which provides anatomically grounded visual feedback. The fitted mesh now shows correct forward gait, confirming the fix.

The immediate remaining blocker before LoRA-MDM training is running `4_motion_process.py` to generate the 263-dimensional HumanML3D feature vectors from the corrected joint files.

== Groundwork Study: Style Encoder Architecture

The weak age-discriminative performance from Week 10 (64.60% val accuracy, severe overfitting) is attributed to the NTU RGB+D pretrained backbone being action-invariant by design — it suppresses the gait-style variation that age classification depends on. I investigated a two-stage replacement encoder, illustrated in Figure 1.

*Stage 1 — Metric learning pretraining on AMASS.* The ST-GCN backbone is pretrained on AMASS using Supervised Contrastive Loss (SupCon): clips from the same subject are positives, clips from different subjects are negatives, across all action types. This forces the network to encode *how* a subject moves rather than *what* they are doing, yielding action-invariant, person-specific 256-dim style embeddings ($bold(z)_"style"$).

*Stage 2 — Age classification fine-tuning on Van Criekinge.* The AMASS-pretrained backbone is fine-tuned with the existing bottleneck head (256→32→3) on the Van Criekinge dataset, unfreezing Blocks 8–9. The style-sensitive initialisation is expected to require less task-specific adaptation and reduce the severe overfitting seen with the NTU baseline. The resulting $bold(z)_"style"$ conditions MDM generation via cross-attention, analogous to the body shape embedding in _Shape My Moves_ (Liao et al., 2025).

Two LoRA adapters (mid-age, elderly) serve as a lightweight baseline and will be evaluated by running the ST-GCN classifier on generated clips.

#image("architecture_diagram.png")
#align(center)[_Figure 1. Proposed architecture: Phase 1 (SupCon metric learning on AMASS), Phase 2 (age classifier fine-tuning on Van Criekinge), Phase 3 (MDM training with style conditioning on HumanML3D), and inference._]

#pagebreak()

= Project Plan: Weeks 12–15

#table(
  columns: (auto, 1fr),
  inset: 6pt,

  table.cell(fill: rgb("#d4edda"))[*Week 12*\ _(this week)_],
  table.cell(fill: rgb("#d4edda"))[
    *Bug fix + architecture groundwork*
    - Canonical axis inversion bug fixed and validated via SMPL mesh fitting
    - Groundwork study of SupCon metric learning for AMASS-pretrained style encoder; proposed architecture finalised
  ],

  table.cell(fill: rgb("#fff3cd"))[*Week 13*],
  table.cell(fill: rgb("#fff3cd"))[
    *Pipeline completion + LoRA baseline*
    - Submit LoRA-MDM baseline training to Trixie (4×V100): mid-age and elderly adapters
    - Run ST-GCN classifier on generated clips for age-fidelity check
    - *Paper draft:* abstract, introduction, related work
  ],

  table.cell(fill: rgb("#fff3cd"))[*Week 14*],
  table.cell(fill: rgb("#fff3cd"))[
    *Style encoder + MDM training*
    - Train ST-GCN with SupCon loss on AMASS; extract z_style embeddings for all HumanML3D clips
    - Fine-tune age classifier on Van Criekinge with AMASS-pretrained backbone; compare z_age PCA separation against NTU-pretrained baseline as ablation
    - Begin MDM training with concatenated conditioning $[bold(z)_"style" || bold(z)_"text"]$ (768-dim)
  ],

  table.cell(fill: rgb("#fff3cd"))[*Week 15*],
  table.cell(fill: rgb("#fff3cd"))[
    *Evaluation + paper completion*
    - Evaluate MDM outputs: FID, R-Precision, age-group accuracy; qualitative visualisation
    - *Paper writing:* methodology, experiments sections
    - Incorporate feedback; revise and finalise paper
  ],

  [*Apr. 24th*],
  [Final co-op report; code cleanup and handoff],
)

#text(size: 9pt)[
  #text(fill: rgb("#d97706"))[*Orange*] rows are planned weeks.
  Target submission: arXiv preprint at end of Week 15, before return to school.
]


== Justification

The plan is structured around three hard sequential dependencies: (1) the 263-dim feature vectors must exist before any MDM training can run; (2) the LoRA baseline must complete before the style-conditioned model can be compared against it; (3) both sets of results must exist before the paper can be written in full. Weeks 13–14 run the pipeline and training in sequence while paper writing proceeds in parallel to avoid idle time. The MDM training is expected to converge substantially faster than the original 3-day RTX 2080 Ti run given the 4×V100 configuration on Trixie and warm-start initialisation from the pretrained checkpoint.
