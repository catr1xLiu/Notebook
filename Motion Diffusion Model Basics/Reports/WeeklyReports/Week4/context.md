# Week 4 Progress Context: LoRA-MDM Age Dataset Project

## 1. Executive Summary & Challenges
**Status:** Critical Pivot Execution.
**Summary:** This week focused on a rigorous audit of the "Marker Fitting" stage (Step 2). We identified that the existing pipeline produces "Inflated" meshes due to incorrect marker mapping.
**The MoSh++ Saga:**
* **Initial Plan:** Deploy `MoSh++` (The industry standard).
* **Outcome:** After significant effort containerizing the application, we discovered a fundamental mathematical incompatibility between the legacy `chumpy` solver (2016) and modern SMPL model formats (Dense vs. Sparse matrix conflict).
* **Decision:** Rather than patching unmaintained code, we have pivoted to a **Custom VPoser Pipeline**. This extracts the "Brains" of MoSh++ (the statistical prior) but runs it on a modern PyTorch engine.

## 2. Pipeline Analysis: The "Inflation" Bug & The Fix

### A. Why Eugene's Code Failed (The "Inflation" Bug)
The previous pipeline produced meshes that looked "inflated" or bloated.
* **Root Cause:** It mapped skin-surface markers (e.g., an Elbow marker) directly to the internal Joint Center (Bone).
* **Consequence:** To satisfy this constraint, the optimizer forced the bone to expand outwards until it touched the skin surface, artificially widening the subject.

**[Insert Image: Mapping: From Markers Directly to Joints]**
*Caption: Figure 1: The legacy approach incorrectly mapped skin markers to internal joint centers. This forced the optimizer to "inflate" the skeleton to minimize error.*

### B. The Correct Approach (Vertex Mapping)
* **Solution:** We must map markers to specific **Vertex IDs** on the mesh skin.
* **Benefit:** This allows the bone to remain in the correct anatomical position while rotating to align the skin surface with the marker.

**[Insert Image: Marker-to-Mesh Mapping]**
*Caption: Figure 2: The corrected approach maps markers to specific mesh vertices (e.g., L_Elbow_Marker → Vertex #2741). This preserves correct body volume.*

### C. The New Architecture (Custom VPoser)
We are replacing the broken `MoSh++` container with a custom script that utilizes the `VPoser` library directly.

**[Insert Image: Custom Pipeline Diagram]**
*Caption: Figure 3: The new architecture (Bottom) replaces the unmaintained MoSh++ legacy stack (Top) with a direct PyTorch implementation using the VPoser IK engine.*

### D. Technical Comparison Table

| Feature | Legacy Pipeline (Eugene) | MoSh++ (Standard) | **Proposed Solution (VPoser)** |
| :--- | :--- | :--- | :--- |
| **Marker Mapping** | Direct to Joint (Incorrect) | Automated Vertex Mapping | **Manual Vertex Mapping (Precise)** |
| **Solver Engine** | Custom Heuristic | Chumpy (Python 2.7) | **PyTorch (Modern)** |
| **Prior Model** | None (Unstable/Jittery) | VPoser (Statistical) | **VPoser (Statistical)** |
| **Status** | Produces "Inflated" data | Broken (Dependency Hell) | **In Implementation** |

## 3. Extended Abstract Strategy
We have prepared three narratives for the upcoming abstract submission. We seek supervisor feedback on the preferred framing.

| Alternative | Title | Abstract Summary | Assessment |
| :--- | :--- | :--- | :--- |
| **1. Intermediate** | *Towards Age Controllable Motion Generation* | Frames the project as a step toward continuous age control via LoRA interpolation. | **Risk:** High. Continuous aging is subtle and difficult to prove visually in a short timeframe. |
| **2. Proof-of-Concept (Recommended)** | *Can AI Learn Aging? Kinematic Signatures in Diffusion* | Investigates *if* AI can decouple age from motion. Uses ST-GCN to validate the "Age Signal" exists, then uses Diffusion to generate it. | **Robustness:** High. Success is defined by the *classification* accuracy (quantitative), reducing reliance on perfect visual generation. |
| **3. Methodology** | *Validating Subtle Motion Style with ST-GCN* | Focuses on using ST-GCN as a novel metric for validation, arguing human observation is insufficient for subtle traits. | **Novelty:** High. **Risk:** The metric itself must perform perfectly to justify the paper. |
