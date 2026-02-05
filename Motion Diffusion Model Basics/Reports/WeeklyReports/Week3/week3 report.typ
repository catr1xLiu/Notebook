#import "@preview/basic-report:0.4.0": *

#show: it => basic-report(
  doc-category: "To: Dr. Pengcheng Xi       Pengcheng.xi@nrc-cnrc.gc.ca",
  doc-title: "Week 3 Report",
  author: "Yiran Liu",
  affiliation: "NRC - Digital Technology",
  language: "en",
  compact-mode: true,
  it
)

= Work Completed Since Last Meeting

== Pipeline Integrity Check (Continued)

In the meeting last week, I was advised to replace the Step2 -> Step3 code with the official implementation from the HumanML3D research. 

I conducted an analysis of the generated HumanML3D skeleton data by rendering a shape-normalized SMPL mesh model. I found that, in addition to potential defect due to the "inflated shape problem", the dataset has *more severe problems*:

- Floating Artifacts: Subjects appear meters above the ground plane
- Inverted Motion: Subjects moving backwards due to incorrect root rotation

#align(center)[
  #image("HumanModelFloatingAboveGridWithArrowBackwards.png", width: 9cm)
  #block(width: 100%)[
    *Figure 1:* Critical artifacts in Step 3 data (floating & inverted motion)
  ]
]

The conclusion is clear: the current Step 2 → 3 conversion code from the previous student is critically flawed, *and cannot be used for production*.

== MoSh++ and HumanML3D Codebase Containerization

To replace the broken pipeline, I proposed to use MoSh++ - the gold standard for AMASS, and scripts from the HumanML3D research. 

However, both codebases are outdated by 6-7 years, this has posted siginifcant challenges: 

- *Dependency Conflicts*: Python 2-era libraries incompatible with modern environments
- *Build Failures*: End-Of-Life (EOF) software versions require direct compiliation from C++ source code.

#text(fill: rgb(0, 100, 0))[Solution: The Docker container is now complete and validated]

After extensive engineering effort, I compiled dependencies from source and built a sharable Docker Image based on Ubuntu20.04. This solution permanently resolves dependency issues and ensures reproducibility for future researchers.

#text(fill: rgb(100, 0, 0))[However, this has delayed the project timeline by at least two days.]

== Dataset Splitting: Age Categorization

In the mean time, I parsed metadata from the Van Criekinge dataset and implemented splitting scripts to categorize subjects into age groups. The distribution analysis is shown below:

#grid(
  columns: 2,
  gutter: 1cm,
  [
    #align(center)[
      #image("age_distribution_light.png", width: 8cm)
      #block(width: 100%)[
        *Figure 2:* Age distribution across motion clips
      ]
    ]
  ],
  [
    #align(center)[
      #image("age_group_distribution_light.png", width: 8cm)
      #block(width: 100%)[
        *Figure 3:* Age group proportions (Young, Mid, Elderly)
      ]
    ]
  ]
)

A python script was written split dataset into balanced age groups, it will be in application once motion data is re-processed.

#align(center)[
  #image("age_vs_walking_speed_light.png", width: 10cm)
  #block(width: 100%)[
    *Figure 4:* Walking speed correlation with age. A strong regression correlation is observed for subjects aged 50+, confirming the previous observation that walking speed decreases with age.
  ]
]

== Documentation

I've compiled an 8-page Technical Analysis detailing pipeline failures and the mathematics behind coordinate system errors. This document is available in the repository for reference.

= Project Timeline & Adjustments

#table(
  columns: (auto, 1fr),
  inset: 6pt,
  // Week 1-3: Completed
  table.cell(fill: rgb("#eceff1"))[#strike[*Week 1*]], 
  table.cell(fill: rgb("#eceff1"))[#strike[Onboarding, foundational study, project structure] (Completed)],
  table.cell(fill: rgb("#eceff1"))[#strike[*Week 2*]], 
  table.cell(fill: rgb("#eceff1"))[#strike[Dataset analysis, pipeline investigation] (Completed)],
  table.cell(fill: rgb("#eceff1"))[#strike[*Week 3*]], 
  table.cell(fill: rgb("#eceff1"))[#strike[Pipeline audit, MoSh++ containerization] (Completed)],
  // Week4: Completed items
  table.cell(fill: rgb("#d4edda"))[*Week 4*], 
  table.cell(fill: rgb("#d4edda"))[Age-based data splitting (Completed), Pipeline diagnosis (Completed), #text(fill: purple)[STGCN baseline training (Revised)]],
  // Week5
  table.cell(fill: rgb("#fff3cd"))[*Week 5*], 
  table.cell(fill: rgb("#fff3cd"))[Train three distinct LoRA adapters: Young, Adult, and Elderly],
  [*Feb 15*], [Submit extended abstract (Target)],
  [*Week 6-7*], [Fine-tuning, validation experiments, metrics],
  [*Week 8-9*], [Full paper writing, supplemental experiments],
)

#text(size: 9pt)[
  #text(fill: red)[*Red*] indicates postponed tasks; 
  #text(fill: purple)[*Purple*] indicates revised tasks
]

Timeline remains tight but achievable. I will continue to aim at our Feb 15th abstract target.

