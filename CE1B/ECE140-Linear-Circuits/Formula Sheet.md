
> [!fact] Energy Storage Elements
> ## Inductor

$$
v(t) = L\frac{di}{dt}
$$

$$
i(t) = \frac{1}{L}\int_{t_o}^{t} v(t)\,dt + i(t_o)
$$

$$
W = \frac{1}{2}Li^2
$$

> [!fact] Energy Storage Elements
> ## Capacitor

$$
i(t) = C\frac{dv(t)}{dt}
$$

$$
v(t) = \frac{1}{C}\int_{t_o}^{t} i(t)\,dt + v(t_o)
$$

$$
W = \frac{1}{2}Cv^2
$$

---

> [!fact] Transient Analysis
> ## First-Order RC and RL Circuits

#### <u>RC Circuit</u>

$$
v(t) = v(\infty) + [v(t_o) - v(\infty)]e^{-\frac{t-t_o}{\tau}}
$$

where $\tau = RC$.

#### <u>RL Circuit</u>

$$
i(t) = i(\infty) + [i(t_o) - i(\infty)]e^{-\frac{t-t_o}{\tau}}
$$

where $\tau = L/R$.

---

> [!info] Sinusoids
> ## Phase-Shift Identities

$$
\begin{aligned}
\sin(\theta) &= \cos(\theta - 90^\circ) \\
-\sin(\theta) &= \cos(\theta + 90^\circ) \\
-\cos(\theta) &= \cos(\theta \pm 180^\circ)
\end{aligned}
$$

---

> [!fact] Impedance
> ## Phasor-Domain Element Models

$$
\boldsymbol{Z} = |\boldsymbol{Z}|\angle\xi = R + jX
$$

$$
\boldsymbol{Z}_L = j\omega L, \qquad \boldsymbol{Z}_C = \frac{1}{j\omega C}
$$

---

> [!fact] Power
> ## Complex Power in Sinusoidal Steady State

$$
\boldsymbol{S} = \frac{1}{2}\boldsymbol{V}\boldsymbol{I}^* = \boldsymbol{V_{rms}}\boldsymbol{I^*_{rms}} = |\boldsymbol{S}|\angle\xi = P + jQ
$$

$$
\begin{aligned}
P &= V_{rms}I_{rms}\cos(\theta - \phi) \\
&= I_{rms}^2 R
\end{aligned}
$$

$$
\begin{aligned}
Q &= V_{rms}I_{rms}\sin(\theta - \phi) \\
&= I_{rms}^2 X
\end{aligned}
$$

$$
pf = \frac{P}{|\boldsymbol{S}|} = \cos(\theta - \phi)
$$

---

> [!info] Algebra
> ## Quadratic Formula

The solution of $ax^2 + bx + c = 0$ is:

$$
x = \frac{-b \pm \sqrt{b^2 - 4ac}}{2a}
$$
