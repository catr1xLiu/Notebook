#import "@preview/basic-report:0.4.0": *

#show: it => basic-report(
  doc-category: "To: Dr. Pengcheng Xi       Pengcheng.xi@nrc-cnrc.gc.ca",
  doc-title: "Week 2 Report",
  author: "Yiran Liu",
  affiliation: "NRC - Digital Technology",
  // <a href="https://www.flaticon.com/free-icons/aerospace" title="aerospace icons">Aerospace icons created by gravisio - Flaticon</a>
  language: "en",
  compact-mode: true,
  it
)

= Work Completed This Week

== Groundwork Study (Continued)
Continuing from last week's progress, I spent approximately 15 hours this week on foundational study of the project fundamentals and toolchains.

During this week, I studied:
- *PyTorch Neural Networks*: Running Inference, Backward Propagation using Auto Gradient, Training Batches. #h(0.3cm) #underline[#link("https://pytorch.org/tutorials/beginner/basics/quickstart_tutorial.html")[_Link to source_]] \
  As practice, I trained a simple neural network: #image("Drawing1.svg")
- *Diffusion Models*: Corruption Process, Model Structure, Training Process #h(0.3cm) #underline[#link("https://huggingface.co/learn/diffusion-course/en/unit1/1")[_Link to source_]]
- *LoRA-MDM Paper*: Briefly analyzed architecture, training dataset requirements, and *results* _(through experimental validation)_

== Analysis of the Van Criekinge (VC) Dataset
It was suggested that mesh visualization should be used to verify the quality of the processed dataset, so I developed Python/MATLAB scripts for this purpose.

#image("Drawing3.svg")

The results show that the data *has multiple issues*. The raw *skeleton* motion is of fine quality, but some files are *corrupted*. Meanwhile, some SMPL mesh data contain an *inflated body shape*. The *first 0.5 seconds* of *every* motion capture file generate *corrupted mesh data*. Whether this will pollute the final _HumanML3D Standard Skeleton Motion Data_ requires further investigation.

== Proposed Method for Age Validation
After the model is trained, the only way to validate its capability to generate age-appropriate motion is to recognize age from the generated motion. The following method is proposed:

#image("Drawing 1.16.svg")

#pagebreak()

= Project Timeline & Adjustments

Minor adjustments have been made to the project timeline. While unable to explore code implementation details this week, I conducted a detailed analysis of the Van Criekinge dataset.

#table(
  columns: (auto, 1fr),
  inset: 6pt,
  // Week 1 - Completed
  table.cell(fill: rgb("#eceff1"))[#strike[*Week 1*]], 
  table.cell(fill: rgb("#eceff1"))[#strike[Onboarding, foundational study, familiarizing with the project structure] (Completed)],
  // Week2
  table.cell(fill: rgb("#d4edda"))[*Week 2*], 
  table.cell(fill: rgb("#d4edda"))[Complete foundational study; detailed review of existing research (MDM and LoRA-MDM) #text(fill:red)[#strike[*and their implementations*]]; #text(fill:purple)[detailed analysis of the Van Criekinge dataset and pipeline]], 
  table.cell(fill: rgb("#fff3cd"))[*Week 3*], 
  table.cell(fill: rgb("#fff3cd"))[#text(fill:purple)[#strike[Start working with the _Van Criekinge dataset_ and its processing pipeline;]] Familiarize with code implementation details; *run training experiments*],
  [*Week 4*], [*Fix all remaining issues* with the _Van Criekinge dataset_; split dataset by age group],
  [*Week 5*], [Train three distinct LoRA adapters: Young, Adult, and Elderly],
  [*Feb 15*], [Based on the rough results generated, *submit extended abstract*],
  [*Week 6–7*], [Fine-tuning; validation experiments; *detailed results and metrics*],
  [*Week 8–9*], [*Full paper writing*; additional experiments if needed],
  [*Week 10 \ Onwards*], [Exploratory experiments with new model architecture \ (Eugene's plan)],
)

#text(size: 9pt)[
  #text(fill: red)[*Red*] indicates postponed tasks; 
  #text(fill: purple)[*Purple*] indicates revised tasks.
]