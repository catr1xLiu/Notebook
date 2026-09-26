> arXiv: [10.1177/0278364918768950](https://doi.org/10.1177/0278364918768950) · Keemink A. et al. · IJRR 2018 · 2018-04-01
> Source: [Paper.md](sources/AdmittanceControl/Paper.md)

> [!abstract] TL;DR
> ## Summary



---

> [!quote] Definition
> ## Admittance Control, Simplest Case

<div align="center"><img src="media/fig01-standalone-diagram.png" alt="Stand-alone admittance control loop: F_ext through virtual dynamics Y_v to velocity reference v_d, tracked by controller C on robot Y_r" width="70%"></div>
<div align="center"><img src="media/fig02-coupled-interconnection.png" alt="Coupled interconnection: apparent admittance Y_a in negative feedback with human impedance Z_h" width="60%"></div>

$$ \int_{-\infty}^{t} F(\tau)\, v(\tau)\, \mathrm{d}\tau \ge 0 $$

$$ \Re\{Y_a(j\omega)\} \ge 0, \quad \forall \omega \in \mathbb{R} $$

$$ Z_h = m_h s + b_h + \frac{k_h}{s} $$

| Symbol | Meaning |
|---|---|
| $Y_v$, $Y_a$, $Y_r$ | Virtual (desired) admittance, Apparent admittance actually felt, Passive robot admittance |
| $Z_h$ | Human limb impedance |
| $F_{ext}$, $F^*$, $F_{int}$ | Total external force on robot, Voluntary human force, Force from intrinsic human dynamics |
| $v_d$, $v$ | Velocity reference, Actual robot velocity |
| $m_h$, $b_h$, $k_h$ | Human limb inertia, damping, and stiffness |

---

> [!quote] Definition
> ## Physical Models: Electromechanical to Rigid Robot

<div align="center"><img src="media/fig03-electromechanical-setup.png" alt="Electromechanical setup: actuator, pre-sensor robot dynamics m_r, force sensor, post-sensor inertia m_ps, human limb Z_h" width="80%"></div>

> [!success]- Understanding the Electromechanical Abstraction (Click to expand)
> The paper conceptually starts with a complex real-world setup (Figure 3). To make the math manageable, they lump the actuator/motor dynamics across the transmission ratio ($k_r$) directly into the robot's pre-sensor inertia ($m_r$) and damping ($b_r$). 
>
> $$ \begin{aligned} m_r &= m_r' + m_m k_r^2 \\ b_r &= b_r' + b_m k_r^2 \end{aligned} $$
>
> | Symbol | Meaning |
|---|---|
| $m_r'$, $b_r'$ | True physical inertia and damping of the robot structure |
| $m_m$, $b_m$ | Inertia and damping of the motor/actuator |
| $k_r$ | Transmission (gear) ratio |
> 
> **Explanation:** By reflecting the motor's physics through the gears ($k_r^2$) and combining them with the robot's physical structure, the entire system simplifies into two rigid masses separated by a force sensor: the combined robot mass ($m_r$) and the tool/cuff mass ($m_{ps}$). 

<div align="center"><img src="media/fig05-rigid-robot.png" alt="Rigid robot schematic: m_r + m_ps driven by F_c and F_ext with damping b_r, optionally coupled to human m_h, b_h, k_h" width="80%"></div>

$$ (m_r + m_{ps})\,\dot{v}(t) + b_r v(t) = F_{ext}(t) + F_c(t) + k_r F_{dst}(t) $$

$$ (m_r s + b_r)\, v = F_{ext} - m_{ps} v s + F_c + k_r F_{dst} $$

| Symbol | Meaning |
|---|---|
| $m_r$ | Robot (pre-sensor) inertia, including reflected motor inertia |
| $m_{ps}$ | Post-sensor inertia (cuff, handle, or tool) |
| $b_r$ | Robot viscous damping |
| $F_c$, $F_{dst}$ | Motor control force, Disturbance force |

---

> [!info] Baseline
> ## Basic PI Controller (The Failure Case)

$$ Y_v = \frac{1}{m_v s} $$

$$ v_d = k_r Y_v \left(F_{ext} - m_{ps} v s\right) $$

$$ F_c = k_r \frac{k_p s + k_i}{s}\left(v_d - k_r v\right) $$

$$ Y_a = \frac{1}{s}\,\frac{m_v s^2 + K_p s + K_i}{(m_r + m_{ps})m_v s^2 + a_1 s + a_0} $$

$$ m_v > 0 $$

$$ m_v \ge \frac{K_p}{K_p + b_r}\, m_r \approx m_r $$

$$ -b_r K_i \ge 0 $$

| Symbol | Meaning |
|---|---|
| $m_v$ | Virtual inertia (the target weight you want the robot to feel like) |
| $K_p$ | Reflected proportional velocity gain ($k_p k_r^2$) |
| $K_i$ | Reflected integral velocity gain ($k_i k_r^2$) |
| $a_1$, $a_0$ | Polynomial coefficients for the denominator of $Y_a$ |

<div align="center"><img src="media/fig06-baseline-bode-ezwidth.png" alt="Baseline Bode plot and ez-width: apparent admittance approaches Y_v at low frequency with m_ps offset; passive tuning collapses to robot dynamics; ez-width boundaries pass through origin" width="65%"></div>

---

> [!fact] The Universal Architecture
> ## The Universal Software

![[Admittance Controller Full Version|100%]]

$$ Y_a = \frac{v}{F_{ext}} = \frac{Y_r\left(H_d S_f (G_f + C' Y_v^*) + 1\right)}{Y_r (Z_{ps} + D) + 1} $$


$$ D = H_d\left(C_{fb} S_v k_r + G_f S_f Z_{ps} - C' Y_v^* \delta_Z\right) $$


$$ C' = C_{fb} + C_{ff}, \qquad Y_v^* = Y_v k_r, \qquad \delta_Z = S_a \hat{Z}_{ps} - S_f Z_{ps} $$


$$ H_d = H_{ZOH} H_i k_r $$


$$ C_{fb} = k_p + \frac{k_i}{s} + \frac{k_d s}{\tau_d s + 1}, \qquad C_{ff} = \mu_{ff} s + \beta_{ff} $$


| Symbol | Meaning |
|---|---|
| $C_{fb}$, $C_{ff}$ | Feedback controller (PID), Feed-forward controller |
| $G_f$ | Force amplification gain |
| $\hat{Z}_{ps}$ | Software compensation model for post-sensor mass |
| $H_{ZOH}$, $H_i$ | Zero-order hold dynamics, Hardware current-loop dynamics |
| $S_v, S_f, S_a$ | Velocity, Force, and Acceleration sensor dynamics (low-pass filters) |

**Explanation:** The math block above is the master algebraic solution for the "kitchen sink" controller. It maps out exactly how the real velocity $v$ responds to an external force $F_{ext}$ when *every single software trick*—feed-forward, force-filtering, post-sensor mass compensation, zero-order holds, and PID feedback—is activated at the same time. The authors do not graph this master equation; instead, they use it as the mathematical parent to derive the 7 specific guidelines below by turning features on and off one by one.

---

> [!hint] Controller Modifications
> ## The Seven Guidelines for Minimal Inertia

#### Guideline 1: Use Feed-Forward Control

$$ F_c = k_r \left( \frac{k_p s + k_i}{s}\left(v_d - k_r v\right) + \left(\mu_{ff} s + \beta_{ff}\right) v_d + G_f F_{ext} \right) $$

$$ m_v \ge \frac{(K_p + \beta_{ff} k_r^2)\, m_r - (K_p + b_r)\, \mu_{ff} k_r^2}{(G_f k_r + 1)(K_p + b_r)} $$

$$ m_{app} = \left(\lim_{s \to \infty}(s Y_a)\right)^{-1} = m_{ps} + \frac{m_r}{\frac{\mu_{ff}}{m_r} k_r^2 + G_f k_r + 1} $$

| Symbol | Meaning |
|---|---|
| $\mu_{ff}$ | Feed-forward inertia compensation |
| $\beta_{ff}$ | Feed-forward damping compensation |
| $G_f$ | Force amplification gain |
| $m_{app}$ | High-frequency apparent inertia |

<div align="center"><img src="media/fig08-feedforward.png" alt="Feed-forward control vs baseline" width="65%"></div>

#### Guideline 2: Avoid Force Filtering

$$ S_f(s) = B_n^{-1}(s) $$

$$ m_v \ge m_r \frac{K_p}{K_p + b_r} + K_p \tau_f \qquad (\text{for } k_i = 0) $$

$$ Y_v(s) B_2(s) = \frac{s}{k_v}\,\frac{1}{\tau_c^2 s^2 + 2\zeta\tau_c s + 1} = \frac{s}{m_v' s^2 + b_v' s + k_v} $$

| Symbol | Meaning |
|---|---|
| $B_n(s)$ | Butterworth polynomial of order $n$ |
| $\tau_f$ | Force filter time constant |
| $\zeta$ | Filter relative damping |
| $m_v', b_v'$ | Equivalent virtual inertia and damping inadvertently created by the filter |

<div align="center"><img src="media/fig09-force-filtering.png" alt="First-order force filter vs baseline" width="65%"></div>

#### Guideline 3: Compensate Post-Sensor Inertia

$$ \hat{Z}_{ps} S_a = \frac{\mu_c}{\tau_c s + 1} $$

$$ Y_{a,\text{low-freq}} \approx \frac{1}{s} \lim_{s \to 0}(s Y_r) = \frac{1}{s\left(m_v + m_{ps} - \mu_c\right)} $$

$$ m_v \ge \frac{K_p}{K_p + b_r}\left(m_r + \mu_c\right) \qquad (\text{for } \tau_c = 0) $$

| Symbol | Meaning |
|---|---|
| $\mu_c$ | Compensation inertia |
| $\tau_c$ | Compensation low-pass time constant |

<div align="center"><img src="media/fig10-postsensor-compensation.png" alt="Post-sensor compensation vs baseline" width="85%"></div>

#### Guideline 4: Use Some Virtual Damping

$$ Y_v = \frac{1}{m_v s + b_v} $$

$$ K_i \le b_v \frac{(K_p + b_v)(K_p + b_r)}{b_r m_v + b_v m_r} $$

$$ b_v K_i^2 \ge 0 $$

| Symbol | Meaning |
|---|---|
| $b_v$ | Virtual damping injected to provide stabilizing phase lead |

<div align="center"><img src="media/placeholder.png" alt="Please Insert Image of Fig 11" width="85%"></div>

#### Guideline 5: Modify the Velocity Reference

$$ Y_v = \left(s k_a + 1\right) Y_v' $$

$$ m_v \ge \frac{K_p m_r - k_a\left(K_p^2 + K_p b_r - K_i m_r\right)}{K_p + b_r} $$

$$ 0 \le \left(k_a K_i - b_r\right) K_i $$

| Symbol | Meaning |
|---|---|
| $k_a$ | Phase-lead (acceleration feed-forward) gain |
| $Y_v'$ | Intended virtual dynamical behavior |

<div align="center"><img src="media/fig12-phase-lead.png" alt="Phase lead vs baseline" width="60%"></div>

#### Guideline 6: Increase Velocity Loop Bandwidth

$$ C_{fb} = k_p + \frac{k_i}{s} + \frac{k_d s}{\tau_d s + 1} $$

$$ m_v \ge \frac{K_p m_r + b_r K_i \tau_d^2 - b_r K_d}{K_p + b_r} $$

$$ H_{ZOH} = \frac{1 - e^{-sT_s}}{s T_s} $$

| Symbol | Meaning |
|---|---|
| $K_d$ | Reflected differential velocity gain ($k_d k_r^2$) |
| $\tau_d$ | Differentiator band-limiting time constant |
| $H_{ZOH}$ | Zero-order hold creating pure digital delay |

<div align="center"><img src="media/fig13-differential-control.png" alt="Differential control vs baseline" width="85%"></div>

#### Guideline 7: Optimize for Robot Stiffness

$$ (m_r \gamma' s + b_r)\, v' = F_c + k_r F_{dst} + (v - v')\left(\frac{k_s}{s} + b_s\right) $$

$$ m_r \gamma s\, v = F_{ext} - m_{ps} v s - (v - v')\left(\frac{k_s}{s} + b_s\right) $$

$$ F_c = k_r \frac{k_p s + k_i}{s}\left(v_d - k_r v'\right) $$

$$ m_{app,\min} = m_r \gamma $$

| Symbol | Meaning |
|---|---|
| $\gamma$, $\gamma'$ | Distal / proximal inertia fractions ($\gamma' = 1 - \gamma$) |
| $k_s$, $b_s$ | Structural (or series elastic) stiffness and damping |
| $v'$ | Proximal (motor-side) velocity |

<div align="center"><img src="media/fig14-flexible-robot.png" alt="Flexible robot schematic" width="60%"></div>

<div align="center"><img src="media/fig15-internal-stiffness.png" alt="Internal flexibility vs baseline" width="60%"></div>

---

> [!fact] Reflection
> ## My Read

