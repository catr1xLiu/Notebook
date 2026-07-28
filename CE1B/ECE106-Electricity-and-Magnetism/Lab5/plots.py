import numpy as np
from numpy import array, sin, cos, exp
from matplotlib import pyplot as plt

plt.style.use("seaborn-v0_8-whitegrid")

# Linear time sequence
t = np.linspace(-1, 2, 300)

I_0 = 10.0 / 100.0

# Switched circuit without coil
nocoil_switch_close = np.where(t > 0, I_0, 0)
nocoil_switch_open = np.where(t > 0, 0, I_0)

# Switched circuit with coil
coil_switch_close = np.where(t > 0, I_0 * (1 - exp(-t)), 0)
coil_switch_open = np.where(t > 0, I_0 * exp(-t), I_0)


plt.figure(figsize=(8, 6))
plt.plot(
    t,
    nocoil_switch_close,
    label="Current when switch closes",
    color="C0",
    linewidth=4.0,
)
plt.plot(
    t, nocoil_switch_open, label="Current when switch opens", color="C1", linewidth=4.0
)
plt.axvline(x=0, linestyle=":", linewidth=1.5, label="t=0")
plt.title("Sketch of current as a function of time")
plt.xlabel("Time (normalized)")
plt.ylabel("Current (Amps)")
plt.legend(loc="upper right", bbox_to_anchor=(1.05, -0.1))
plt.tight_layout()

plt.savefig("figures/current_plot_nocoil.png", dpi=600, transparent=True)
plt.show()

plt.figure(figsize=(8, 6))
plt.plot(
    t, coil_switch_close, label="Current when switch closes", color="C0", linewidth=4.0
)
plt.plot(
    t, coil_switch_open, label="Current when switch opens", color="C1", linewidth=4.0
)
plt.axvline(x=0, linestyle=":", linewidth=1.5, label="t=0")
plt.title("Sketch of current as a function of time")
plt.xlabel("Time (normalized)")
plt.ylabel("Current (Amps)")
plt.legend(loc="upper right", bbox_to_anchor=(1.05, -0.1))
plt.tight_layout()

plt.savefig("figures/current_plot_coil.png", dpi=600, transparent=True)
plt.show()
