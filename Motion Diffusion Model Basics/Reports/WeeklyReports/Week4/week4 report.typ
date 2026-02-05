#import "@preview/basic-report:0.4.0": *

#show: it => basic-report(
  doc-category: "To: Dr. Pengcheng Xi,  Dr. Chang.Shu",
  doc-title: "Week 4 Report",
  author: "Yiran Liu",
  affiliation: "NRC - Digital Technology",
  language: "en",
  compact-mode: true,
  it
)

= Work Completed Since Last Meeting

This week, I focused on implementing the "marker fitting" algorithm essential to our data processing pipeline. However, there have been challenges implementing MoSh++ - the state-of-the-art solution that we planned to use. Therefore, a careful study was conducted and a plan was made to pivot to a custom VPoser-based pipeline that maintains the statistical prior of MoSh++ while running on modern PyTorch infrastructure.

== The MoSh++ Saga & Pivot

*Initial Plan:* Deploy MoSh++ (the industry standard for AMASS) to replace the broken legacy pipeline.

*Outcome:* After significant effort containerizing the application, I discovered a fundamental code incompatibility between the legacy `chumpy` solver (2016) and modern SMPL model formats.

#text(fill: rgb(100, 0, 0))[Decision:] Rather than patching the massive unmaintained codebase, I decided to pivot to a #strong[Custom VPoser Pipeline]. This extracts the "Brains" of MoSh++ (the statistical prior) but runs it on a modern PyTorch engine.

== Why the Legacy Code Failed (The "Inflation" Bug)

The previous custom fitting pipeline uses a heuristic optimizer to fit markers directly to joint centers (bones).

#align(center)[
  #image("11 - Markers Fitting Process.svg", width: 12cm)
  #block(width: 100%)[
    *Figure 3:* The previous pipeline using custom backpropagation optimization.
  ]
]

It produced meshes that appeared "inflated" or bloated. This is because *it mapped skin-surface markers (e.g., an Elbow marker) directly to the internal Joint Center (Bone).* 

#strong[Consequence:] To satisfy this constraint, the optimizer forced the bone to expand outwards until it touched the skin surface, artificially widening the subject.

#align(center)[
  #image("9 - Markers Mapping Bad.svg", width: 12cm)
  #block(width: 100%)[
    *Figure 1:* The legacy approach incorrectly mapped skin markers to internal joint centers. This forced the optimizer to "inflate" the skeleton to minimize error.
  ]
]

== Correct Approach (Vertex Mapping)

*Solution:* We must map markers to specific #strong[Vertex IDs] on the mesh skin.

*Benefit:* This allows the bone to remain in the correct anatomical position while rotating to align the skin surface with the marker.

#align(center)[
  #image("10 - Markers Mapping Good.svg", width: 8cm)
  #block(width: 100%)[
    *Figure 2:* The corrected approach maps markers to specific mesh vertices (e.g., L_Elbow_Marker → Vertex #2741). This preserves correct body volume.
  ]
]

== New Architecture (Custom VPoser Pipeline)

We are replacing the broken MoSh++ container with a custom script that utilizes the VPoser library directly.

#align(center)[
  #image("12 - Custom Tool for Fitting.svg", width: 5cm)
  #block(width: 100%)[
    *Figure 4:* The new architecture replaces the unmaintained MoSh++ legacy stack with a direct PyTorch implementation using the VPoser IK engine.
  ]
]

#pagebreak()

== Comparison of Pipelines
#[
  #set text(size: 8pt)
  #table(
    columns: (0.8fr, 1fr, 1fr, 1fr),
    inset: 6pt,
    stroke: 0.5pt,
    align: center,
    // Header row
    table.cell(fill: rgb("#eceff1"), align: center)[],
    table.cell(fill: rgb("#eceff1"), align: center)[Legacy Pipeline (Eugene)],
    table.cell(fill: rgb("#eceff1"), align: center)[MoSh++ (Standard)],
    table.cell(fill: rgb("#eceff1"), align: center)[Proposed Custom Pipeline],
    // Data rows
    table.cell(fill: rgb("#eceff1"), align: left)[Marker Mapping],
    table.cell(fill: rgb("#fff3cd"), align: center)[Direct to Joint (Incorrect)],
    table.cell(fill: rgb("#d4edda"), align: center)[#strong[Full Vertex Mapping]],
    table.cell(fill: rgb("#d4edda"), align: center)[#strong[Full Vertex Mapping]],
    table.cell(fill: rgb("#eceff1"), align: left)[Solver Engine],
    table.cell(fill: rgb("#fff3cd"), align: center)[Custom Heuristic],
    table.cell(fill: rgb("#d4edda"), align: center)[#strong[VPoser Solver Engine]],
    table.cell(fill: rgb("#d4edda"), align: center)[#strong[VPoser Solver Engine]],
    table.cell(fill: rgb("#eceff1"), align: left)[Codebase Status],
    table.cell(fill: rgb("#fff3cd"), align: center)[Produces "Inflated" data],
    table.cell(fill: rgb("#fff3cd"), align: center)[Broken (Dependency Hell)],
    table.cell(fill: rgb("#d4edda"), align: center)[#strong[Maintained PyTorch Ecosystem]]
  )
]

= Extended Abstract Strategy

As we are ten days close to the Feb.15th deadline to submit an extended abstract to the 3DV conference, it's good to start drafting. I have prepared three alternatives for the upcoming abstract submission, supervisor feedbacks on the preferred framing will be very helpful.
#[
  #set text(size: 8pt)
  #grid(
    columns: 3,
    gutter: 0.6cm,
    [
      #align(center)[
        #text(weight: "bold")[Alternative 1: Intermediate]
        #v(0.5cm)
        #text(weight: "bold")[Title:]
        *Towards Age Controllable Motion Generation*
        #v(0.3cm)
        #text(weight: "bold")[Short Abstract:]
        This research develops an age-conditioned motion diffusion model using Low-Rank Adaptation (LoRA). We fine-tune a base diffusion model on motion capture data segmented by age (Young, Mid, Elderly). By interpolating between age-specific LoRA adapters, we achieve continuous age control in generated walking motions.
        #v(0.3cm)
        #text(weight: "bold")[My Assessment:]
        *High Risk*. Continuous aging is subtle and difficult to prove visually in a short timeframe.
      ]
    ],
    [
      #align(center)[
        #text(weight: "bold")[Alternative 2: Proof-of-Concept]
        #v(0.5cm)
        #text(weight: "bold")[Title:]
        *Can AI Learn Aging? Kinematic Signatures in Diffusion*
        #v(0.3cm)
        #text(weight: "bold")[Short Abstract:]
        This study investigates whether AI can learn age-related kinematic signatures from human motion. We train a Spatial-Temporal Graph Convolutional Network (ST-GCN) to classify age from motion capture data and develop a diffusion model with age-conditioned generation.
        #v(0.3cm)
        #text(weight: "bold")[My Assessment:]
        *High Robustness.* Success defined by ST-GCN classification accuracy (quantitative), reducing reliance on perfect visual generation.
      ]
    ],
    [
      #align(center)[
        #text(weight: "bold")[Alternative 3: Methodology]
        #v(0.5cm)
        #text(weight: "bold")[Title:]
        *Validating Subtle Motion Style with ST-GCN*
        #v(0.3cm)
        #text(weight: "bold")[Short Abstract:]
        We propose using Spatial-Temporal Graph Convolutional Networks (ST-GCN) as objective validation metrics for Low-Rank Adaptation (LoRA) of motion diffusion models. Unlike human observation which detects obvious style changes, ST-GCN enables validation of subtle adaptations like age.
        #v(0.3cm)
        #text(weight: "bold")[My Assessment:]
        *High Risk.* The metric itself must perform impressively to justify the paper.
      ]
    ]
  )
]

#emph[Recommendation: Alternative 2 (Proof-of-Concept) is recommended.] This frames the project as exploratory research validating whether AI can learn age-related kinematic signatures. It investigates *if* AI can decouple age from motion using ST-GCN to validate the "Age Signal" exists, then uses Diffusion to generate it. Success is defined by classification accuracy rather than perfect visual generation.

#pagebreak()

= Project Timeline & Adjustments

#table(
  columns: (auto, 1fr),
  inset: 6pt,
  // Week 1-3: Completed
  table.cell(fill: rgb("#eceff1"))[#strike[*Week 1*]],
  table.cell(fill: rgb("#eceff1"))[#strike[Onboarding, foundational study, project structure] (Completed)],
  table.cell(fill: rgb("#eceff1"))[#strike[*Week 2*]],
  table.cell(fill: rgb("#eceff1"))[#strike[Foundational study; dataset analysis; pipeline investigation] (Completed)],
  table.cell(fill: rgb("#eceff1"))[#strike[*Week 3*]],
  table.cell(fill: rgb("#eceff1"))[#strike[Pipeline audit; MoSh++ containerization] (Completed)],
  // Week 4: Completed items
  table.cell(fill: rgb("#d4edda"))[*Week 4*],
  table.cell(fill: rgb("#d4edda"))[Age-based data splitting (Completed), Pipeline diagnosis (Completed), #text(fill: purple)[VPoser pivot implementation (New)]],
  // Future weeks
  table.cell(fill: rgb("#fff3cd"))[*Week 5*],
  table.cell(fill: rgb("#fff3cd"))[Complete VPoser implementation; generate Golden Dataset; Train example ST-GCN Network],
  [*Feb 15*], [Submit extended abstract (Target)],
  [*Week 6-7*], [Train LoRA Adapters; Fine-tuning; validation experiments; metrics],
  [*Week 8-9*], [Full paper writing; supplemental experiments]
)

#text(size: 9pt)[
  #text(fill: red)[*Red*] indicates postponed tasks;
  #text(fill: purple)[*Purple*] indicates revised tasks.
]

Timeline remains tight but achievable. The VPoser pivot represents a more robust long-term solution despite the additional development time required.
