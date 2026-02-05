#import "@preview/basic-report:0.4.0": *

#show: it => basic-report(
  doc-category: "To: Pengcheng Xi, Ph.D.      Pengcheng.xi@nrc-cnrc.gc.ca",
  doc-title: "Week 1 Summary",
  author: "Yiran Liu",
  affiliation: "NRC - Digital Technology",
  // <a href="https://www.flaticon.com/free-icons/aerospace" title="aerospace icons">Aerospace icons created by gravisio - Flaticon</a>
  language: "en",
  compact-mode: true,
  it
)

= Work Completed This Week

== Development Tools Preparation

I started the week by preparing all the necessary software and tools with the help of IT Services. This includes Obsidian (to read Eugene's documentation), Typst (to compose documents), and Windows Subsystem for Linux (as a development runtime).

I have also submitted a request for access to the GPU clusters (a.k.a., Beatrix). I have set up a client for remote access and familiarized myself with the usage policies through the official documentation while the request is being reviewed.

== Groundwork Study

I must point out that I have no previous experience with diffusion models. I need to build my knowledge from the ground up while working with the code. To achieve this, I scheduled 2 study sessions at work and 1 session at home per day, with each session being 90 minutes of focused learning.

Over the week, I have completed:
- *PyTorch Fundamentals*: Tensors, DataLoaders, and `nn.Module` architecture. \ #link("https://pytorch.org/tutorials/beginner/basics/quickstart_tutorial.html")[_Link to source_]
- *Transformer Architecture*: Self-attention mechanism, multi-head attention, and encoder-decoder structure \ #link("https://jalammar.github.io/illustrated-transformer/")[_Link to source_]

== Preparing the Codebases

With some guidance from Eugene, I was able to install all the necessary runtime dependencies on my personal computer and the remote lab server. I then explored the two foundational projects: #link("https://guytevet.github.io/mdm-page/")[Motion Diffusion Model (MDM)] and #link("https://haimsaw.github.io/LoRA-MDM/")[LoRA-MDM].

By running inference on MDM, I successfully generated human motion from text prompts. I also tested generation with different LoRA styles using the LoRA-MDM codebase.

#figure(
  image("Frame.jpg", width: 85%),
  caption: [Skeleton Animation Generated using Original LoRA-MDM Project]
)

To better manage the project resources, I have organized the legacy code, literature, and documentation from Eugene into four Git repositories. All resources, as well as information about the project, are now stored securely on the NRC GitLab server, accessible to all researchers:

- *LoRA-MDM (Primary Codebase)*: #link("https://gitlabc.nrc-cnrc.gc.ca/Yiran.Liu/LoRA-MDM")[_Gitlab Link_]
- *VC Dataset Pipeline v2*: #link("https://gitlabc.nrc-cnrc.gc.ca/Yiran.Liu/LoRA-MDM-Age-Dataset")[_Gitlab Link_]

#pagebreak()

= Regarding the Project

I want to share my honest assessment: given the amount of time left, *the project is behind schedule*. Based on Eugene's experiment journal, no publishable results have been generated so far. If this project is aiming for a submission on February 15th, _*it is at risk*_.

I am proposing a shift in the project's focus.

== Current Focus vs. Proposed Approach


#text(size: 9pt)[
#grid(
  columns: (1fr, 1fr),
  gutter: 12pt,
  [
    === Current: Continuous Age Conditioning
    #table(
      columns: (auto, 1fr),
      inset: 5pt,
      stroke: 0.5pt,
      [*Core Idea*], [Treat age as a continuous variable (0.18–0.90) that smoothly controls motion characteristics],
      [*Technical*], [Modification of the MDM architecture; Custom `AgeEncoder` module injected into the diffusion pipeline],
      [*Validation*], [Velocity correlation justified (r=−0.96), but lacks visually observable difference],
      [*Status*], [Three experiments completed, but no publishable results; bug fixes ongoing],
      [*Risk*], [High — unproven innovation in model architecture],
      [*Timeline*], [Unknown — depends on results],
    )
  ],
  [
    === Proposed: Discrete Age Groups
    #table(
      columns: (auto, 1fr),
      inset: 5pt,
      stroke: 0.5pt,
      [*Core Idea*], [Use sparse age groups (Young, Adult, Elderly) as different motion "styles"],
      [*Technical*], [Standard LoRA adapters per group trained on Van Criekinge dataset; no architecture changes needed],
      [*Validation*], [Established LoRA-MDM metrics + age recognition user study],
      [*Status*], [To be conducted, but method proven on other styles \ ("Chicken", "Drunk", "Old")],
      [*Risk*], [Low — proven method, new domain],
      [*Timeline*], [4 weeks for training + validation; 3 more weeks for publication & deliverables],
    )
  ]
)
]

== Justification

Eugene is now occupied with a busy school term, and I am still learning how the models work. This team setup is not suited for "reinventing the motion diffusion model architecture" in two months. While the idea of engineering a new model architecture is ambitious and intellectually interesting, it is *unlikely to generate publishable results by March*.

However, if planned properly, I am confident that we can produce a publishable result with the discrete age-group approach. This reframes the contribution as an *application-focused study* — demonstrating that LoRA adapters can capture age-related motion characteristics for assistive robotics — rather than a methods paper that improves the underlying model architecture.

This, of course, does not mean we are giving up on Eugene's plan — we are just delaying it. Continuous age control will be a future direction for this research. After the paper is accepted by a workshop, I will have more than a month for exploratory work on model architecture.

== Proposed Timeline

#table(
  columns: (auto, 1fr),
  inset: 6pt,
  [*Week 1*], [_(Completed)_ Onboarding, foundational study, familiarizing with the project structure],
  [*Week 2*], [Complete foundational study; detailed review of existing research (MDM and LoRA-MDM) and their implementations],
  [*Week 3*], [Start working with the _Van Criekinge dataset_ and its processing pipeline; familiarize with code implementation details],
  [*Week 4*], [*Fix all remaining issues* with the _Van Criekinge dataset_; split dataset by age group],
  [*Week 5*], [Train three distinct LoRA adapters: Young, Adult, and Elderly],
  [*Feb 15*], [Based on the rough results generated, *submit extended abstract*],
  [*Week 6–7*], [Fine-tuning; validation experiments; *detailed results and metrics*],
  [*Week 8–9*], [*Full paper writing*; additional experiments if needed],
  [*Week 10 \ Onwards*], [Exploratory experiments with new model architecture \ (Eugene's plan)],
)

= Week 2 Goals

+ Complete the foundational study on *diffusion models* (reverse process, training objective, sampling) and *transformers* (attention mechanism, encoders and decoders).
+ Read *MDM* and *LoRA-MDM* papers in detail.
+ Run exploratory experiments with the MDM and LoRA-MDM codebases for a more intuitive understanding.