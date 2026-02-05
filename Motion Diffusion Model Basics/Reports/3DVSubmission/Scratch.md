# Extended Abstract for Project

## Background: Work Completed & Work Remaining of the Project

#### 1. Executive Summary

The primary objective of this research is to develop an Age-Conditioned Motion Diffusion Model (MDM) using Low-Rank Adaptation (LoRA). The core hypothesis is that age-specific kinematic signatures—such as reduced joint range of motion, velocity changes, and posture—can be learned by fine-tuning a base diffusion model on high-quality motion capture data.

Over the past three weeks, the focus has shifted from model training to a rigorous Verification & Validation (V&V) of the data processing pipeline. This audit revealed critical structural failures in the legacy code (inherited from previous work) that produced corrupted training data. We have since engineered a modern, robust replacement pipeline.

#### 2. Accomplishments & Current Status

A. Pipeline Audit & Forensic Analysis We identified two fatal flaws in the legacy data processing pipeline:

    "Inflation" Artifacts (Step 2): The legacy fitting algorithm minimized distance between skin markers and internal joint centers. This forced the optimizer to artificially "inflate" the body (widening the pelvis, lengthening limbs) to push bones outward to the skin surface, destroying anatomical accuracy.

    Coordinate System Failure (Step 3): The legacy Forward Kinematics (FK) solver miscalculated root rotations, resulting in skeletons that "floated" meters above the ground and exhibited inverted orientation ("moonwalking").

B. Infrastructure Modernization To resolve these issues, we have rebuilt the infrastructure using industry-standard tools:

    Visualization: Migrated to the official smplx library, ruling out rendering bugs as the cause of artifacts.

    Dependency Management: Successfully Dockerized the MoSh++ environment, resolving complex legacy dependency conflicts (e.g., Chumpy/Python 2.7).

    Solver Pivot: We have successfully installed pytorch3d and human_body_prior (VPoser). This allows us to implement a modern, pure-PyTorch Inverse Kinematics (IK) solver that does not rely on the broken legacy dependencies of MoSh++.

    Data Preparation: Implemented automated scripting to split the Van Criekinge dataset into discrete age groups (Young, Mid, Elderly) based on metadata.

#### 3. Immediate Next Steps (The "Fix" Phase)

A. Vertex-to-Marker Mapping (In Progress) We are replacing the flawed "Marker-to-Joint" mapping with a "Marker-to-Vertex" mapping. By mapping markers to specific vertices on the mesh skin (e.g., mapping the LELB marker to Vertex #455 on the elbow skin), we can fit the skeleton accurately without inflating the body. This is currently being implemented using the VPoser engine.

B. Data Production Once the mapping is confirmed, we will execute the new fitting script on the full dataset (188 subjects) to generate the "Golden Dataset" in standard HumanML3D format.

C. Validation Strategy We have defined a two-tier validation protocol:

    Visual: Side-by-side comparison confirming the elimination of floating/inflation artifacts.

    Quantitative: Training a lightweight ST-GCN (Spatial-Temporal Graph Convolutional Network) classifier on the processed data. If the ST-GCN can successfully classify "Young" vs. "Elderly" motion, it mathematically proves that the age-specific kinematic signals have been preserved.


## Extended Abstract Alternatives

### Alternative 1: As an Intermediate Step
### Towards Age Controllable Human Motion Generation

We frame our project as an intermediate step towards continuous age control. We are currently using different LoRA adapters for different age groups, but by controlling the strength of each LoRA adapter we will essentially be able to adjust the "age" in our motion in a continuous way. 

#### My thoughts:

**Pro:** This preserves the exact research direction that the previous students are aiming to achieve.
**Con:** The research is not a "bold" topic because the only motion we can control is walking. Also, continuous age control is a bit of a false topic in the first place: people growing five years older will not show significant change in the way they walk.

#### Short Example Abstract
This research develops an age-conditioned motion diffusion model using Low-Rank Adaptation (LoRA). We fine-tune a base diffusion model on motion capture data segmented by age (Young, Mid, Elderly). By interpolating between age-specific LoRA adapters, we achieve continuous age control in generated walking motions, providing a foundation for precise age-conditional motion synthesis.


### Alternative 2: As a proof-of-concept
### Can Artificial Intelligence Models learn Aging in Human Motion?

We frame our project as exploratory research validating the question: Does aging affect the way people move, and can AI models learn the difference? We train both an ST-GCN network that detects "aging" from motion, and a Diffusion Model that produces new motion with "aging" control. This acts as a proof-of-concept for many potential future research directions, such as robot interactions with elderly subjects, injury prediction for elderly patients, etc.

#### My thoughts: Recommended
**Pro:** Turns the current half-finished work into a solid proof-of-feasibility. Requires only a few more steps to presentable intermediate results. Good extendability for future work, bold topic.
**Cons:** Framed as a groundwork research, not the original topic that previous students are considering.

#### Short Example Abstract

This study investigates whether AI can learn age-related kinematic signatures from human motion. We train a Spatial-Temporal Graph Convolutional Network (ST-GCN) to classify age from motion capture data and develop a diffusion model with age-conditioned generation. Results demonstrate that AI can both detect and synthesize age-specific motion patterns, enabling applications in elderly care and rehabilitation.

### Alternative 3: As a Proof for New Methodology
### Validating Subtle Motion Style Adaptation with Spatial-Temporal Graph Networks

We shift the focus to the methodology of using an ST-GCN network as the validation metric for LoRA adapters. Previous research trains LoRA adapters on noticeable styles like "dancing like a chicken", validated using human observation. In our approach, we use an ST-GCN network trained on the same dataset for validation. This allows LoRA adapters of motion generators to control subtle styles like age, illness, and energy that would otherwise be ignored by human observers.

**Pros:** Aggressive position, bold innovation.
**Cons:** Might not be a completely new approach. And both the methodology and pipeline are currently imperfect.


#### Short Example Abstract
We propose using Spatial-Temporal Graph Convolutional Networks (ST-GCN) as objective validation metrics for Low-Rank Adaptation (LoRA) of motion diffusion models. Unlike human observation which detects obvious style changes, ST-GCN enables validation of subtle adaptations like age, fatigue, or illness. We demonstrate this approach by training LoRA adapters for age-conditioned motion generation, validated by ST-GCN classification accuracy.
