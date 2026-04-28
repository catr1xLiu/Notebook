# Week 13 Report

---

# ✅ Tasks Completed

### 1. 263-dim Feature Vector Generation (Pipeline Step 4)

The final pipeline step — converting corrected 22-joint HumanML3D skeletons to 263-dimensional feature vectors — is complete. Eugene's modified `4_motion_process.py` , which also stands as a dataset constructing script, was discarded due to code quality concern. To be safe, I used the official HumanML3D implementation and modified the code for Van Criekinge dataset myself.

Then, I performed validation on randomly selected clips before batch processing:

- Output shape confirmed as `(T-1, 263)`
- Root XZ velocity (dims 1–2) is non-zero and consistent with walking speed
- Round-trip reconstruction via `recover_from_ric` produces correct walking skeleton and pelvis trajectories that match the original `pelvis_traj` range

### 2. Van Criekinge Data Loader for LoRA-MDM

A custom `VanCriekingeStyleDataset` was written, modeled after the existing `StyleMotionDataset` in `data_loaders/style/dataset.py`. The loader:

- Reads the 263-dim `.npy` feature vectors produced by Step 4
- Z-normalizes using the HumanML3D `Mean.npy` / `Std.npy` (not dataset-specific stats, to stay compatible with the pretrained MDM distribution)
- Returns the same dict structure as `StyleMotionDataset` (for 100style dataset)
- Splits by age group: Mid-age and Elderly adapters (Young is implicit base)
- Text prompt format: `"A person is walking in sks|hta style."`

Dry run successful — the loader integrates with the existing LoRA-MDM training loop without modification.

### 3. Robotics Project Contributions

I began looking at how to contribute to the robotics project:

- Completed a literature review on the topic
- Reviewed and outlined the structure of the robot's data collection codebase, mapping the messy code into a clear module dependency diagram

[Robotics Force Project](https://www.notion.so/Robotics-Force-Project-3369bbabb2ab80dbb328c4e3c8f79ea0?pvs=21)

---

# ⌨️ In Progress

### 1. LoRA-MDM Training Submission

Two LoRA adapter training runs will be submitted to Trixie today (Wednesday). 

LoRA-MDM allows **5 distinct styles** per lora adapter, encoded as `['sks', 'hta', 'oue', 'asar', 'nips']`. We will be training one **age adapter** that encodes two styles: `mid` (30-50) and `old` (>50). We assume that subjects are young (<30) when no adapter loaded. 

Each run: 4000 steps, `diffusion_steps=1000`, `lambda_prior_preserv=0.25`, starting from pretrained MDM checkpoint `model000500000.pt`. Expected runtime: a few hours per adapter on 4×V100.

---

# 🚧 Other Attempts

### 1. SMPL Fitting Optimization Exploration

Attempted to speed up the per-frame SMPL fitting pipeline by batching frames into parallel GPU optimization. The approach replaced sequential LBFGS with batched Adam and added a Jacobi-style temporal refinement pass.

**Result: Not successful.** The batched output was significantly jittier than sequential LBFGS due to: 

(a) Adam's inferior convergence on small smooth problems compared to LBFGS, 

(b) degraded warm-start quality when all frames in a batch share a single initialization, and 

(c) the temporal preserve loss being ~14,000× weaker than the joint loss, making smoothness effectively invisible to the optimizer. 

A hybrid approach (parallel phase 1 + short sequential phase 2) was identified as the most promising path but was not implemented — **I deprioritized this in favor of closing the generation loop.**

Session notes with full failure analysis are documented in the repository.

---

## 📝 Plan for Week 14

1. **Generate age-conditioned motion samples** from both trained LoRA adapters + unconditioned baseline (30 samples × 3 repetitions each)
2. **Evaluate generation results:**
    - ST-GCN classifier accuracy on generated clips (confusion matrix, comparable to Week 10 Table 6)
    - Kinematic signature heatmaps: Real Young vs Real Elderly vs Generated Elderly
    - Scalar metrics: walking speed, stride length, hip ROM across conditions
3. **Paper writing:** Dataset & Pipeline section, Method section
4. **Continue robotics project contributions** as time allows