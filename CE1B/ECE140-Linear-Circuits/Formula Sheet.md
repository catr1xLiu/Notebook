# 📄 PART 1: PROVIDED ON THE EXAM
You **do not** need to memorize these. Just know *where* to look on the sheet and *when* to use them.

### Basic Elements & Energy
| Concept | Formula | One-Sentence Hint |
| :--- | :--- | :--- |
| **Resistor** | $$ v(t) = R \cdot i(t) $$ | Standard Ohm's law for DC or time-domain. |
| **Inductor (Voltage)** | $$ v(t) = L \frac{di}{dt} $$ | Use when finding the voltage across an inductor as current changes. |
| **Inductor (Current)** | $$ i(t) = i(t_0) + \frac{1}{L} \int_{t_0}^{t} v(t) dt $$ | Use when finding the current through an inductor over time. |
| **Inductor Energy** | $$ W = \frac{1}{2} L i^2 $$ | Use to find stored magnetic energy (often needed at $t=0$ or $t=\infty$). |
| **Capacitor (Current)**| $$ i(t) = C \frac{dv}{dt} $$ | Use when finding the current into a capacitor as voltage changes. |
| **Capacitor (Voltage)**| $$ v(t) = v(t_0) + \frac{1}{C} \int_{t_0}^{t} i(t) dt $$ | Use when finding the voltage across a capacitor over time. |
| **Capacitor Energy** | $$ W = \frac{1}{2} C v^2 $$ | Use to find stored electric energy (often needed at $t=0$ or $t=\infty$). |

### Transient Analysis (First-Order)
| Concept | Formula | One-Sentence Hint |
| :--- | :--- | :--- |
| **RC Circuit** | $$ v(t) = v(\infty) + [v(t_0) - v(\infty)] e^{-\frac{t-t_0}{\tau}} $$ | Use to find capacitor voltage after a switch opens/closes ($\tau = RC$). |
| **RL Circuit** | $$ i(t) = i(\infty) + [i(t_0) - i(\infty)] e^{-\frac{t-t_0}{\tau}} $$ | Use to find inductor current after a switch opens/closes ($\tau = L/R$). |

### AC Impedance & Phasors
| Concept | Formula | One-Sentence Hint |
| :--- | :--- | :--- |
| **Impedance (L & C)** | $$ Z_L = j\omega L \quad \text{and} \quad Z_C = \frac{1}{j\omega C} $$ | Use to convert inductors and capacitors to "complex resistors" for AC. |
| **Sinusoid Shifts** | $$ \sin(\theta) = \cos(\theta - 90^\circ) $$ | Use to convert sine sources into cosine phasors before starting AC analysis! |
| **Complex to Polar** | $$ a + jb = \sqrt{a^2+b^2} \angle \tan^{-1}\left(\frac{b}{a}\right) $$ | Use to convert rectangular impedance/power into polar form for division/multiplication. |

### AC Power
| Concept                  | Formula                                                           | One-Sentence Hint                                                              |
| :----------------------- | :---------------------------------------------------------------- | :----------------------------------------------------------------------------- |
| **Complex Power**        | $$ S = \frac{1}{2} V I^* = V_{rms} I_{rms}^* = P + jQ $$          | Use to find total power; REMEMBER THE COMPLEX CONJUGATE STAR ($*$) ON CURRENT! |
| **Real Power (W)**       | $$ P = V_{rms} I_{rms} \cos(\theta_v - \theta_i) = I_{rms}^2 R $$ | Use to find average power actually dissipated (resistors only).                |
| **Reactive Power (VAR)** | $$ Q = V_{rms} I_{rms} \sin(\theta_v - \theta_i) = I_{rms}^2 X $$ | Use to find "bouncing" power stored in L or C.                                 |
| **Power Factor**         | $$ pf = \frac{P}{\|S\|} = \cos(\theta_v - \theta_i) $$            | Use when given the power factor to find the angle difference between V and I.  |
| **RMS Conversion**       | $$ V_{rms} = \frac{V_m}{\sqrt{2}} $$                              | Use to convert peak amplitudes to RMS before calculating AC power.             |

---

# 🧠 PART 2: TO MEMORIZE BY HEART
These are **NOT** on the formula sheet. You must know these going into the exam.

### Op-Amp Topologies & Rules
| Concept | Formula / Rule | One-Sentence Hint |
| :--- | :--- | :--- |
| **Ideal Rules** | $$ V_+ = V_- \quad \text{and} \quad I_{in} = 0 $$ | The golden rules of op-amps; use these to derive any unknown circuit via KCL. |
| **Inverting** | $$ V_{out} = -\left(\frac{R_f}{R_i}\right) V_{in} $$ | Flips the sign and scales the input. |
| **Non-Inverting** | $$ V_{out} = \left(1 + \frac{R_f}{R_i}\right) V_{in} $$ | Scales the input without flipping the sign (Gain is always $\ge 1$). |
| **Summing** | $$ V_{out} = -R_f \left( \frac{V_1}{R_1} + \frac{V_2}{R_2} \right) $$ | Adds multiple inputs together and flips the sign (often used for adding DC offsets). |
| **Difference** | $$ V_{out} = \frac{R_f}{R_i} (V_+ - V_-) $$ | Amplifies the difference between two inputs (assuming resistor ratios are balanced). |
| **Comparator** | $$ V_{out} = \pm V_{cc} $$ | No feedback loop; output hits the power rails depending on which input ($V_+$ or $V_-$) is higher. |

### Source Transformations & Thevenin
| Concept | Formula / Rule | One-Sentence Hint |
| :--- | :--- | :--- |
| **Source Transform** | $$ V_s = I_s \cdot R \quad \text{or} \quad I_s = \frac{V_s}{R} $$ | Converts a V-source in series with R to an I-source in parallel with R (and vice versa). |
| **Thevenin Voltage** | $$ V_{th} = V_{oc} $$ | The open-circuit voltage across the terminals a-b. |
| **Norton Current** | $$ I_N = I_{sc} $$ | The short-circuit current flowing from a to b. |
| **Thevenin Resistance**| $$ R_{th} = \frac{V_{oc}}{I_{sc}} \quad \text{or} \quad R_{th} = R_{eq} \text{ (dead sources)} $$ | Kill independent sources to find $R_{th}$, OR use a test voltage if there are dependent sources. |
| **Superposition** | $$ \text{V-source} \rightarrow \text{Short}, \quad \text{I-source} \rightarrow \text{Open} $$ | Use to solve circuits with both AC and DC sources (solve them separately, then add the power/voltage). |

### Dividers & Max Power
| Concept | Formula / Rule | One-Sentence Hint |
| :--- | :--- | :--- |
| **Voltage Divider** | $$ V_x = V_{total} \left( \frac{R_x}{R_1 + R_2 + ...} \right) $$ | Use to find voltage across one component in a series string. |
| **Current Divider** | $$ I_x = I_{total} \left( \frac{R_{other}}{R_x + R_{other}} \right) $$ | Use to find current through one component in a TWO-component parallel branch. |
| **Max Power Load** | $$ Z_L = Z_{th}^* \quad \text{or} \quad R_L = R_{th} $$ | Load must be the complex conjugate of Thevenin impedance for AC, or exactly equal for DC. |
| **Max Power Value** | $$ P_{max} = \frac{\|V_{th}\|^2}{8 R_{th}} $$ | Use to find the maximum possible REAL power delivered to the load (assumes $V_{th}$ is peak amplitude; use 4 instead of 8 if $V_{th}$ is RMS!). |
| **DC Equivalents** | $$ \text{C} \rightarrow \text{Open Circuit}, \quad \text{L} \rightarrow \text{Short Circuit} $$ | Apply immediately to any circuit that says "DC Steady State." |

For
$$ v(t)=|V| \angle \theta_v = \cos(\omega t + \theta_v) \quad i(t)=|I| \angle \theta_i = \cos(\omega t + \theta_i) $$
Why does instant power equal to
$$ S(t) = \frac{1}{2}(|V| \times |I|) \angle (\theta_v-\theta_i) = \frac{1}{2} \cos(\omega t + \theta_v-\theta_i) $$
is it some trig identity transformation