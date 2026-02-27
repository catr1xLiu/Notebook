

> [!abstract] Introduction
> 
> ## Motion Capture Data Pipeline for Diffusion Training

To use the Van Criekinge Clinical Motion Capture dataset for human motion diffusion training, a pipeline is created to progressively abstract raw optical marker clouds into a structured skeleton representation, then into a canonical body-centered coordinate frame, and finally into a compact 263-dimensional feature vector suitable for neural network training.


![[7 - Data Processing Pipeline|100%]]


This document analyzes **what data exists at each stage** and **what fundamental transformations occur**, rather than implementation details. The focus is understanding the information flow from noisy capture to clean, normalized features.

---

> [!quote] Stage 0
> 
> ## Raw Motion Capture Data

C3D files contain optical marker trajectories captured by infrared cameras.

|Property|Value|
|---|---|
|**Data Type**|3D positions of retroreflective markers over time|
|**Marker Count**|~60 markers per subject|
|**Sampling Rate**|100 Hz|
|**Duration**|9–12 seconds per trial|
|**Coordinate System**|Vicon (Z-up, Y-forward)|
|**Spatial Units**|Millimeters or meters|

--- start-multi-column: Stage0Info

```column-settings
number of columns: 2 
```

> [!success] **What's Included**

- Optical marker trajectories (the primary signal)
- Force plate data, EMG signals (not used)
- Frame timestamps
<br>

--- end-column ---

> [!failure] **What's Missing**

- **No skeletal structure** — Just marker clouds
- **No body model** — No parametric representation
- **No semantic connectivity** — Markers are named but not connected
- **Non-standard coordinates** — Vicon-specific frame
<br>

--- end-multi-column

**Each C3D file represents ONE continuous walking pass:**

- Subject walks ~12 meters in one direction
- 3–6 trials per subject (separate files)
- Trials are **not concatenated** — each is independent

**Data shape:** $(T, N, 3)$

|Dimension|Meaning|Typical Value|
|---|---|---|
|$T$|Number of frames|~1000–1200 (10–12 sec @ 100 Hz)|
|$N$|Number of markers|~60|
|$3$|XYZ coordinates|Fixed|

---

> [!quote] Stage 1
> 
> ## SMPL Mesh Data (Intermediate)

This is the **critical transformation** — converting an unstructured point cloud into a parametric body model.

|Aspect|Optical Markers (Input)|SMPL Skeleton (Output)|
|---|---|---|
|**Structure**|Unstructured|Structured|
|**Points/Joints**|~60 independent points|24 kinematic joints + body shape|
|**Topology**|None|Hierarchical tree|
|**Body Model**|None|Parametric (learnable)|

### SMPL Representation

--- start-multi-column: Stage1Info

```column-settings
number of columns: 2 
```

> [!success] **What's Included**

- 24 joint positions (head, limbs, spine, feet)
- Body shape parameters (proportions)
- Skeleton topology (kinematic tree)
- Subject gender (affects body model)
<br>

--- end-column ---

> [!failure] **What's NOT Included**

- **No full mesh** — Only 24 joint positions, not 6890 vertices
- **No appearance** — Pure geometry
- **No markers** — Original marker data discarded after fitting
- **Vicon coordinates** — Not transformed yet
<br>

--- end-multi-column

The Skinned Multi-Person Linear (SMPL) model represents the human body using:

|Component|Dimensions|Description|
|---|---|---|
|**Pose** $\boldsymbol{\theta}$|$(T, 72)$|Joint rotations in axis-angle format|
|**Shape** $\boldsymbol{\beta}$|$(10,)$|Body shape coefficients (PCA)|
|**Translation** $\mathbf{t}$|$(T, 3)$|Global root (pelvis) position|
|**Joints** (derived)|$(T, 24, 3)$|Forward kinematics output|

**Pose encoding:**

- 24 joints × 3 rotation parameters (axis-angle)
- Joint 0: Root (pelvis) orientation and position
- Joints 1–23: Spine, limbs, hands, feet

**Shape encoding:**

- 10 PCA coefficients defining body proportions
- Constant across all frames (per subject)
- Encodes height, weight, body mass distribution

**Forward kinematics:** $$ \text{SMPL}(\boldsymbol{\beta}, \boldsymbol{\theta}, \mathbf{t}) = (\mathbf{J}, \mathbf{V}) $$

where $\mathbf{J} \in \mathbb{R}^{T \times 24 \times 3}$ are joint positions and $\mathbf{V} \in \mathbb{R}^{6890 \times 3}$ are mesh vertices.


> [!warning] Warning
> 
> **Data Quality Issues at This Stage**

- ⚠️ Some body shapes appear inflated (over-fitted parameters)
- ⚠️ First 0.5 seconds may have unstable poses
- ⚠️ Occasional anatomical violations (e.g., knee hyperextension)

**Why?** The custom fitting algorithm optimizes marker-to-joint distances but may not fully respect anatomical constraints, producing plausible but imperfect body shapes.

---

> [!quote] Stage 2
> 
> ## HumanML3D Skeleton Data

This stage performs two critical transformations:

1. **Coordinate frame change** — From world-centered (Vicon) to <u><strong style="color:#dab1da">body-centered</strong></u>
2. **Temporal resampling** — From 100 Hz to 20 Hz

|Property|Before|After|
|---|---|---|
|**Sampling Rate**|100 Hz|**20 Hz**|
|**Joint Count**|24|**22** (hands removed)|
|**Coordinate Frame**|World (Vicon Z-up)|**Body-centered (Y-up)**|
|**Frames per Trial**|~1000|**~200**|
|**Reference Frame**|Lab-fixed|**Body-fixed**|

**Shape before:** $(T_{\text{100Hz}}, 24, 3) \approx (1000, 24, 3)$

**Shape after:** $(T_{\text{20Hz}}, 22, 3) \approx (200, 22, 3)$

--- start-multi-column: ExampleRegion1  
```column-settings  
number of columns: 2  
```

**Before (World-Centered, Vicon Frame):**

- Origin: Lab/capture volume center
- $Z$-axis: Vertical (up)
- $Y$-axis: Forward (along walkway)
- Body moves through space
<br>

--- end-column ---

**After (Body-Centered, Canonical Frame):**

- Origin: Pelvis (root joint)
- $Y$-axis: Vertical (pelvis → neck direction)
- $Z$-axis: Forward (body facing direction)
- $X$-axis: Left (perpendicular to body plane)
- Body "stationary"; world moves relative to body
<br>

--- end-multi-column

> [!hint] **Why Body-Centered Representation?**

- Motion **style** (pose patterns) is more important than spatial **location** for generative modeling
- Invariant to environment (works in any room)
- Generalizes better across subjects and ages
- Symmetric: same motion style looks identical regardless of context

### Data Content
--- start-multi-column: Stage2Info

```column-settings
number of columns: 2 
```

> [!success] **What's Included**

- 22 joint positions (root-relative)
- Relative pose preserved (joint angles, limb lengths)
- Motion dynamics preserved (temporal structure)
- Subject identity (implicitly in motion style)
<br>

--- end-column ---

> [!failure] **What's NOT Included**

- **World trajectory** — Pelvis position in space is discarded. (You know _how_ the body moves, but not _where_)
- **Original coordinate system** — Vicon frame gone
- **Hand joints** — Removed (practical; hands aren't key for locomotion)
- **Fine temporal detail** — 80% of frames removed ($100 \to 20$ Hz)
<br>

--- end-multi-column

---

> [!quote] Stage 3
> 
> ## HumanML3D Feature Vector

The final stage extracts a complete motion descriptor from 3D joint positions, suitable for neural network training.

### Feature Composition

The 263 dimensions encode different motion aspects:

|Feature Category|Dimensions|Description|
|---|---|---|
|**Root Trajectory**|4|Velocity $(\dot{x}, \dot{z})$, height $y$, angular velocity|
|**Joint Positions**|66|22 joints $\times$ 3 coordinates (root-relative)|
|**Joint Velocities**|66|$\dot{\mathbf{J}}_t$ for 22 joints|
|**Joint Rotations**|66|Rotation parameters for 22 joints|
|**Foot Contacts**|4|Binary (heel/toe, left/right)|
|**Auxiliary**|57|Additional motion descriptors|

**Total:** $4 + 66 + 66 + 66 + 4 + 57 = 263$

### Data Characteristics

**Shape:** $(T-1, 263)$

|Dimension|Explanation|
|---|---|
|$T-1$|Velocity reduces by 1 frame; if input has 200 frames, output has 199|
|$263$|Complete motion descriptor per frame|


> [!fact] **Normalization (Z-Score)**

For each of the 263 dimensions: $$ \text{Feature}_i^{\text{norm}} = \frac{\text{Feature}_i - \mu_i}{\sigma_i} $$

where $\mu_i$ and $\sigma_i$ are dataset-wide statistics. This ensures numerical stability during training.

> [!warning] **Information Loss is Permanent**

The transformation from skeleton to features is **many-to-one**. You cannot invert this: given only the 263-dimensional feature, you cannot uniquely recover the 3D joint positions. This is an intentional design choice for compactness and trainability.

---

> [!info] Info
> 
> ## Dataflow Summary

```
Stage 0: Optical Markers
         ↓ [SMPL Fitting: Optimization]
Stage 1: SMPL Parameters + Joints
         ↓ [Canonicalization + Resampling]
Stage 2: Body-Centered Skeleton
         ↓ [Feature Extraction + Normalization]
Stage 3: 263-Dim Feature Vector
```

### Information Preservation Analysis

| Information Type      | Stage | Preserved?  | Notes                    |     |
| --------------------- | ----- | ----------- | ------------------------ | --- |
| **3D Positions**      | 0→3   | ✅ Yes       | Transformed but retained |     |
| **Motion Dynamics**   | 0→3   | ⚠️ Partial  | Downsampled 100→20 Hz    |     |
| **Body Shape**        | 0→1   | ❌ No        | Lost after Stage 1       |     |
| **Joint Topology**    | 0→3   | ✅ Yes       | Implicit in skeleton     |     |
| **World Coordinates** | 0→2   | ❌ No        | Lost in canonicalization |     |
| **Pose Parameters**   | 0→3   | ⚠️ Indirect | Encoded in features      |     |

### Data Compression Across Stages

|Stage|Content|Floats/Frame|Size (10 sec)|
|---|---|---|---|
|**0**|60 markers × 3D|180|~180 KB|
|**1**|SMPL (72 + 3 + 10 + 72)|157|~31 KB|
|**2**|22 joints × 3D|66|~5.2 KB|
|**3**|263-dim feature|263|~2.1 KB|

**Compression ratio:** $85\times$ reduction (Stage 0 → 3)

---

> [!warning] Warning
> 
> ## Known Data Quality Issues

### Stage 1 (SMPL Fitting)

- ⚠️ Inflated body shapes in some subjects
- ⚠️ First 0.5 seconds may have unstable poses (camera warm-up)
- ⚠️ Occasional anatomical violations (knees hyperextending, elbows inverting)

### Stage 2 (Canonicalization)

- ✅ Expected: Apparent lean/descent/moonwalking (NOT errors)
- ⚠️ Body frame may not align with motion direction (gait direction can vary)

### Stage 3 (Features)

- ✅ **Bug fixed:** Root velocity was zero in earlier versions (caused "moonwalking")
- ✅ Current version has correct velocity encoding

---

> [!todo] TODO
> ## Replace Pipeline Code with Research Standard
### Problem

The current data processing pipeline produces low-quality results with several problems. The code was written from scratch without following established best practices, making it hard to debug.

### Solution: Industry Standard Tools
It is decided that the project will switch to industrial standard tools from other researches.

![[8 - New Data Processing Pipeline|100%]]

**Replace Stage 1 with MoSh++:**

- Industry-standard SMPL marker fitting (used by AMASS dataset)
- Better optimization algorithms
- More robust body shape estimation
- Active maintenance by research community

**Add joints2smpl utility:**

- Converts HumanML3D joints back to SMPL parameters
- Enables visualization at any pipeline stage
- Allows direct mesh generation from Stage 2 data
### Implementation Priority

1. ✅ **High Priority:** Replace `2_fit_smpl_markers.py` with MoSh++
2. ⚠️ **Medium Priority:** Add `joints2smpl` for visualization
3. ⚠️ **Low Priority:** Validate output quality matches existing data distribution
