---
Course: ECE140
Date: 2026-07-28
Student: Yiran Liu (21184901)
Source: Nilsson & Riedel, *Electric Circuits* 12e, Ch. 9 — Sinusoidal Steady-State Analysis
jupyter:
  jupytext:
    cell_metadata_filter: -all
    formats: ipynb,md
    text_representation:
      extension: .md
      format_name: markdown
      format_version: '1.3'
      jupytext_version: 1.19.5
  kernelspec:
    display_name: Python 3
    language: python
    name: python3
---

Six problems selected from 9.14, 9.25, 9.29, 9.31, 9.32, 9.33, 9.43, 9.44, 9.47, 9.48, 9.54, 9.56, 9.62, 9.63 — one per distinct technique, so no two questions test the same skill.

| # | Section | Technique |
| --- | --- | --- |
| 9.25 | 9.6 | Full phasor round trip — time domain → frequency domain → time domain |
| 9.29 | 9.6 | Impedance reduction, series/parallel ladder |
| 9.31 | 9.6 | Resonance — solve for $\omega$ making $Z$ purely resistive |
| 9.48 | 9.7 | Thévenin equivalent with a **dependent** source |
| 9.56 | 9.8 | Node-voltage method, two out-of-phase sources |
| 9.63 | 9.9 | Mesh-current method, three meshes |


```python
from phasor import *
```


---

> [!example] **Problem 9.25**
> 

Find the steady-state expression for $i_o(t)$ in the circuit in Fig. P9.25 if

$$
v_s = 750\cos(5000t) \text{ mV}
$$

<img src="problem_9.25_circuit.jpeg" alt="Figure P9.25 — series RLC circuit with 400 Ω, 40 mH, 400 nF" width="60%">

> [!success]- Solution

Impedance of each element at $\omega = 5000$:
$$ Z_r = R = 400 \,\ohm \quad\quad Z_L = j\omega L = 200j \,\ohm \quad\quad Z_C = \frac{1}{j\omega C}= -500j \,\ohm $$
$$ Z_\text{total} = (400 -300j) \,\ohm $$
$$ i_o(t) = \frac{v_s(t)}{Z_\text{total}} = \frac{750 \,\angle 0^\degree V}{(400-300j) \ohm}  = 1.5 \text{A} \, \angle 36.87^\degree $$

---

> [!example] **Problem 9.29**
> 

Find the impedance $Z_{ab}$ in the circuit seen in Fig. P9.29. Express $Z_{ab}$ in both polar and rectangular form.

<img src="problem_9.29_circuit.jpeg" alt="Figure P9.29 — impedance ladder between terminals a and b" width="65%">

> [!success]- Solution

  $$\begin{aligned} 
  Z_{ab} &= 10 \,\ohm -40j\,\ohm + \left((5 \,\ohm - 10j\,\ohm)\parallel (10\,\ohm+30j\,\ohm) \right) + (20\,\ohm \parallel 20j\,\ohm) \\
  &= (30-40j)\,\ohm = 50\,\ohm \,\angle 53.13^\degree
  \end{aligned}$$

```python
Z_ab = 10 -40j + par(5-10j, 10+30j) + par(20, 20j)
print(Z_ab)
print(polar(Z_ab, "ohm"))
```

---

> [!example] **Problem 9.31**
> 

a. For the circuit shown in Fig. P9.31, find the frequency (in radians per second) at which the impedance $Z_{ab}$ is purely resistive.

b. Find the value of $Z_{ab}$ at the frequency of (a).

<img src="problem_9.31_circuit.jpeg" alt="Figure P9.31 — 5 H inductor with 4 kΩ resistor and 625 nF capacitor" width="55%">

> [!success]- Solution

$$\begin{aligned} 
Z_{ab} &= Z_L + (Z_R \parallel Z_C) \\
&= j\omega L + \left( R \parallel \frac{1}{j\omega C} \right) \\
&= 
\end{aligned}$$

---

> [!example] **Problem 9.48**
> 

Find the Thévenin equivalent circuit with respect to the terminals a,b of the circuit shown in Fig. P9.48.

<img src="problem_9.48_circuit.jpeg" alt="Figure P9.48 — circuit with a Vo/50 dependent current source" width="70%">

> [!success]- Solution



---

> [!example] **Problem 9.56**
> 

Use the node-voltage method to find the steady-state expression for $v_o(t)$ in the circuit in Fig. P9.56 if

$$
\begin{aligned}
v_{g1} &= 40\cos(5000t + 53.13^\circ) \text{ V} \\
v_{g2} &= 8\sin(5000t) \text{ V}
\end{aligned}
$$

<img src="problem_9.56_circuit.jpeg" alt="Figure P9.56 — two sources, 400 µH, 50 µF, 6 Ω" width="70%">

> [!success]- Solution



---

> [!example] **Problem 9.63**
> 

Use the mesh-current method to find the steady-state expression for the branch currents $i_a$ and $i_b$ in the circuit seen in Fig. P9.63 if

$$
\begin{aligned}
v_a &= 100\sin(10{,}000t) \text{ V} \\
v_b &= 500\cos(10{,}000t) \text{ V}
\end{aligned}
$$

<img src="problem_9.63_circuit.jpeg" alt="Figure P9.63 — three-mesh circuit with 5 µF, 1.2 mH, 20 Ω, 80 Ω" width="65%">

> [!success]- Solution


