# Gait Analysis Methodology Report

This document outlines the detailed gait analysis performed by the `analysis.main` pipeline. It covers data structuring, the definitions of scalar gait metrics, and the derivation of continuous gait cycle curves, including all relevant mathematical formulations.

## 1. Overview and Data Processing

The analysis pipeline processes **Motion Clips**, each defined as a sequence of 3D joint positions over time.

- **Joint Coordinates:** Let $\mathbf{J}(t) \in \mathbb{R}^{22 \times 3}$ be the joint positions at frame $t$. The forward motion is assumed to be along the $+X$ axis, and the vertical direction is $+Y$.
- **Strides:** A stride $i$ is defined by a start frame $t_0$ and an end frame $t_1$, representing an ipsilateral heel-strike pair (e.g., Left-to-Left).
- **Time Normalization:** For continuous plots, each stride is time-normalized via linear interpolation from its native frame count to a fixed length of $N_{\text{pts}} = 101$, representing $0\%$ to $100\%$ of the gait cycle.

## 2. Scalar Spatiotemporal Metrics

Spatiotemporal metrics quantify the macroscopic physical and temporal characteristics of the subject's gait.

### 2.1 Walking Speed
Mean forward speed derived from total pelvis displacement over the entire clip.
$latex \text{Walking Speed} = \frac{|x_{\text{pelvis}}(T_{\text{end}}) - x_{\text{pelvis}}(T_{\text{start}})|}{T_{\text{clip}}} \quad (\text{m/s})$
where $x_{\text{pelvis}}$ is the X-coordinate of the pelvis joint, and $T_{\text{clip}}$ is the total clip duration in seconds.

### 2.2 Stride Length
Mean pelvis displacement along the $+X$ axis per stride. For a single stride $i$ from frame $t_0$ to $t_1$:
$latex \text{Length}_i = |x_{\text{pelvis}}(t_1) - x_{\text{pelvis}}(t_0)| \quad (\text{m})$
The overall metric is the average across all $N$ strides:
$latex \text{Stride Length} = \frac{1}{N} \sum_{i=1}^{N} \text{Length}_i \quad (\text{m})$

### 2.3 Stride Time
Mean duration of a complete stride cycle. For a single stride $i$:
$latex \text{Time}_i = \tau(t_1) - \tau(t_0) \quad (\text{s})$
where $\tau(t)$ is the timestamp (in seconds) at frame $t$.
$latex \text{Stride Time} = \frac{1}{N} \sum_{i=1}^{N} \text{Time}_i \quad (\text{s})$

### 2.4 Cadence
Number of strides taken per minute, derived from the mean stride time.
$latex \text{Cadence} = \frac{60}{\text{Stride Time}} \quad (\text{strides/min})$

## 3. Variability Metrics

Variability metrics measure the consistency of a subject's gait across multiple strides using the Coefficient of Variation (CV).

### 3.1 Stride Time CV
$latex \text{Stride Time CV} = \left( \frac{\sigma_{\text{Time}}}{\mu_{\text{Time}}} \right) \times 100 \quad (\%)$
where $\sigma_{\text{Time}}$ is the standard deviation and $\mu_{\text{Time}}$ is the mean of the stride times.

### 3.2 Stride Length CV
$latex \text{Stride Length CV} = \left( \frac{\sigma_{\text{Length}}}{\mu_{\text{Length}}} \right) \times 100 \quad (\%)$

## 4. Scalar Kinematic Metrics

Kinematic metrics evaluate the range of motion (ROM) of specific joints. The included angle $\theta$ at a vertex $\mathbf{p}_2$ formed by rays from $\mathbf{p}_1$ and $\mathbf{p}_3$ is calculated as:
$latex \theta = \arccos\left( \text{clip}\left( \frac{(\mathbf{p}_1 - \mathbf{p}_2) \cdot (\mathbf{p}_3 - \mathbf{p}_2)}{\|\mathbf{p}_1 - \mathbf{p}_2\| \|\mathbf{p}_3 - \mathbf{p}_2\| + \epsilon}, -1.0, 1.0 \right) \right) \times \frac{180}{\pi} \quad (^\circ)$

### 4.1 Knee Range of Motion (ROM)
Peak-to-peak knee flexion/extension range across both legs.
- $\mathbf{p}_1 = \text{Hip}$
- $\mathbf{p}_2 = \text{Knee}$
- $\mathbf{p}_3 = \text{Ankle}$

$latex \text{Knee ROM} = \max(\theta_{\text{knee}}) - \min(\theta_{\text{knee}}) \quad (^\circ)$
The peak-to-peak value is taken across the concatenated angles of both the left and right legs.

### 4.2 Hip Range of Motion (ROM)
Peak-to-peak hip flexion/extension range.
- $\mathbf{p}_1 = \text{Spine1}$
- $\mathbf{p}_2 = \text{Hip}$
- $\mathbf{p}_3 = \text{Knee}$

$latex \text{Hip ROM} = \max(\theta_{\text{hip}}) - \min(\theta_{\text{hip}}) \quad (^\circ)$

## 5. Continuous Gait Cycle Curves

Continuous curves map joint kinematics over normalized gait cycles ($0\%$ to $100\%$). These are computed for specific panels: Left/Right Foot, Ankle, and Knee.

### 5.1 Joint Speed
The magnitude of the instantaneous velocity of a joint $\mathbf{p}$. Computed at native FPS for each stride, then resampled.
$latex v(t) = \|\mathbf{p}(t) - \mathbf{p}(t-1)\| \times \text{FPS} \quad (\text{m/s})$
These continuous speed arrays are averaged across all strides in a clip to produce a mean profile of shape $(101,)$.

### 5.2 Joint Angular Velocity
The magnitude of the instantaneous rate of change of joint angles.
For Knees and Ankles, the angle $\phi(t)$ is the included vertex angle in radians (similar to ROM but in radians):
- **Knee Angle:** Hip-Knee-Ankle
- **Ankle Angle:** Knee-Ankle-Foot

For the Foot, the angle $\phi(t)$ is defined as the sagittal-plane pitch of the ankle $\rightarrow$ foot segment from the vertical ($+Y$ axis) toward the forward ($+X$ axis):
$latex \phi_{\text{foot}}(t) = \arctan2(x_{\text{foot}} - x_{\text{ankle}}, y_{\text{foot}} - y_{\text{ankle}}) \quad (\text{rad})$

The angular velocity magnitude is then:
$latex \omega(t) = |\phi(t) - \phi(t-1)| \times \text{FPS} \quad (\text{rad/s})$
These continuous angular velocity arrays are then resampled to 101 points and averaged across all strides in the clip.
