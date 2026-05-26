# ICRA 2026 Submission Document Update Plan (Technical Sections)

> [!IMPORTANT]
> This plan focuses solely on the drafting and document-editing tasks for the technical sections: Abstract, Methodology, Experiments & Results, and Discussion. It excludes Title, Introduction, and Related Work. All actual experiments and data generation are complete; this plan tracks the remaining writing and typesetting tasks needed for submission.

## 1. Abstract Updates

- **Reframe Scope**: Edit the text to remove references to "long-horizon motion prediction" and shift the focus to "age-aware motion priors" and "assistive-robot anticipation".
- **Document Limitations**: Add a brief sentence noting that while spatial constraints are modeled successfully, spatiotemporal consistency (stride variability) remains an unresolved challenge due to diffusion stochasticity.

---

## 2. Methodology Updates

The `sec/2_methodology.tex` file needs to be stripped of unimplemented proposals and populated with missing formal definitions.

| Task | Action Required | Status |
| :--- | :--- | :--- |
| **Remove Unimplemented Architecture** | Delete Section 2.3 ("Generative Network (Proposed)") detailing continuous $z_{age}$ and $g(a)$. Move this concept text to the Future Work section. | To Do |
| **Insert Clip-Yield Table** | Add a LaTeX table documenting the data processing pipeline yield (480 raw $\rightarrow$ 450 effective clips) and the reasons for rejection. | To Do |
| **Add Mathematical Definitions** | Add equations and formal text defining the Coefficient of Variation (CV), Margin of Stability (MoS), and Minimum Foot Clearance (MFC). | To Do |
| **Insert LoRA Config Table** | Add a LaTeX table listing the LoRA training configuration (rank, $\lambda_{prior}$, steps, batch size, compute hardware). | To Do |

---

## 3. Experiments & Results Updates

The `sec/3_experiments.tex` file must be expanded to insert the graphs, tables, and findings from the newly completed experiments.

### Documentation Tasks:

1. **Document Clinical Metric Expansion (MoS & MFC)**
   - Update the text to discuss Margin of Stability and Minimum Foot Clearance findings.
   - **Figure Insertion**: Update the LaTeX reference to use the newly generated `violin_comparison.png` that includes the MoS and MFC panels.

2. **Document Closed-Loop Classifier Validation**
   - Write a new subsection detailing the ST-GCN++ classifier performance on the 9,000 generated clips.
   - **Figure Insertion**: Insert the 3x3 confusion matrix graphic.
   - **Add Caveat**: Explicitly write the caveat that this is a self-consistency check, as the classifier was trained on the VC dataset.

3. **Document Rank / $\lambda_{prior}$ Ablation Findings**
   - Write a subsection discussing the findings of the ablation study.
   - **Table Insertion**: Insert the ablation results table (comparing ranks 5, 12, 16 and $\lambda_{prior}$ 0.1, 0.3, 1.0).
   - **Update Diagnosis**: Delete the speculative text ("We suspect that this might be due to stochastic noise...") and replace it with the conclusive diagnosis from the ablation results (explaining whether the CV blow-up tracks under-parametrization or over-regularization).

4. **Document Per-Age-Group Qualitative Analysis**
   - **Figure Insertion**: Insert the new qualitative figure containing the stroboscopic stick-figure overlays and Center of Mass (CoM) trajectories.
   - Write the accompanying text analyzing the visual differences between the Young, Adult, and Elderly generations.

---

## 4. Discussion & Limitations Updates

The `sec/4_discussion.tex` file requires text edits to present an accurate and honest diagnosis based on the final results.

> [!WARNING]
> Reviewers will appreciate a candid discussion of failure modes and dataset limitations over unsupported claims.

- **Explicit CV Blow-up Diagnosis**: Add text discussing the VC distal-joint noise identified in Week 14 and reference the rank vs. $\lambda$ diagnosis from the ablation study.
- **Classifier Circularity Caveat**: Add a paragraph noting the limitations of the closed-loop classifier evaluation.
- **Single-Dataset Limitation**: Add a sentence acknowledging that relying solely on the VC stroke-rehab cohort limits generalization claims.
- **Unimplemented Architecture**: Formally define the continuous $z_{age}$ architecture as future work to address the limitations of the current discrete token prototype.

## Review from Previous workshop

The reviews from the previous workshop might give us some clues on what to extend on.

> The paper presents multiple data-based analyses on age-related human gait. First, the authors introduce a data processing pipeline to extract motion markers from clinical data, for which they use a public data set by Van Criekinge et al. Second, they introduce and validate a model based on ST-GCN to classify motion into age groups (young, mid, elderly). Third, they use a LoRA-based model to generate artificial motion trajectories and validate them with clinical baselines.

> The paper presents a work in progress. The main body is written well and the figures mostly illustrate the approach and results well. However, the results are not too overwhelming. The classifier has a relatively low accuracy for discriminating the age groups. The diffusion model fails to reproduce distributions and general trends of means. However, the authors discuss both shortcomings and come to the conclusion that data is lacking and the models show a general feasibility, which I would agree with. As the content is work in progress, better quantitative results are to be expected in future work.

> There are some design decisions and conclusions I cannot fully understand. First, why were the age groups split into <40yrs, 40-64yrs, and >64yrs? Second, the authors do not quantify the split in training and validation set for the classifier. Third, the converged risidual loss (Fig. 3) seems relatively high, which could explain the uncertainties in Fig. 5. Fourth, the authors claim that the data themselves are distinguishable into the three groups. However, the distributions in Fig. 7, particularly for Stride, are very similar. I would second the claim that more training data is needed, as these small deviations may be hard to learn otherwise.

> The font sizes in Fig. 4 and 6 are too small and there are some incomplete sentences.

> Overall, the paper is an interesting read, relevant to the workshop. The content is work in progress, which explains the subpar quantitative results. The discussions and implications are well explained. However, I think the conclusion that data is missing may be a bit too easy. I would welcome a more elaborate discussion on the methods themselves and whether better results are expected when more data becomes available.