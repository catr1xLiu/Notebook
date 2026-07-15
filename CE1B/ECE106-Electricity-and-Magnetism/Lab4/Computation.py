#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Created on Mon Jul 13 21:11:32 2026

@author: catr1x
"""


# %%

# Import libraries and define constants

from matplotlib import pyplot as plt
import numpy as np
from numpy import sin, cos, log, e, pi, array, zeros

e0 = 8.854187817e-12

# %%

# Part1: Computing theoretical 
Area = pi * (0.1)**2
print(f"Area of the plate {Area} m^2")

distances = array([5e-3, 10e-3, 15e-3, 20e-3, 25e-3, 30e-3])
theoretical_capacitance = zeros(distances.size)

for i in range(distances.size):
    d = distances[i]
    C = e0 * Area / d
    theoretical_capacitance[i] = C
    print(f"Distance {d*1000} mm, theoretical capacitance {C * 10**12 : .6g} pF")


# %%

# Step2: Computing capacitance from simulation value

surface_charge_sim = array([
    6.2319e-8,
    3.4143e-8,
    2.4659e-8,
    1.9917e-8,
    1.7028e-8,
    1.5124e-8
])

voltage_difference = 1000

simulated_capacitance = zeros(distances.size)

for i in range(distances.size):
    Q = surface_charge_sim[i]
    d = distances[i]
    C = Q / voltage_difference
    simulated_capacitance[i] = C
    print(f"Distance {d*1000} mm, simulated charge {Q} C, capacitance {C * 10**12 : .6g} pF")


# %%

# Step3: Compute capa

# All in pF
capacitance_infinity_far = 33
measured = array([95.3, 65.2, 51.3, 50.2, 46.4, 45.1]) - capacitance_infinity_far

for i in range(measured.size):
    print(f"Distance {distances[i]*1000} mm, measured capacitance {measured[i] : .6g} pF")

measured *= 1e-12 # Convert to F


# %%

# Plot the results to a line graph

plt.style.use('seaborn-v0_8')
plt.figure(figsize=(8, 4))
plt.plot(distances * 1000, theoretical_capacitance * 1e12, label="Theoretical Capacitance", marker='o')
plt.plot(distances * 1000, simulated_capacitance * 1e12, label="Simulated Capacitance", marker='s')
plt.plot(distances * 1000, measured * 1e12, label="Measured Capacitance", marker='^')
plt.title("Capacitance vs Distance")
plt.xlabel("Distance (mm)")
plt.ylabel("Capacitance (pF)")
plt.legend()
plt.grid()

# Save with transparent background and high resolution
plt.savefig("figures/capacitance_vs_distance.png", dpi=300, transparent=True)
plt.show()


# %%

# Compute dieletric constant

# \[
#    C_s / C_c = \frac{\epsilon_r + 1}{2T_s} / \frac{\epsilon_r}{T_c} = \frac{T_c}{2T_s} \frac{\epsilon_r + 1}{\epsilon_r} \implies \frac{\epsilon_r +1}{\epsilon_r} = \frac{2C_s T_s}{C_c T_c}
# \]

capacitance_semicircular = 183.5e-12
capacitance_circular = 270.1e-12
thickness_semicircular = 2.78e-3
thickness_circular = 3.06e-3

# solve for LHS, then use the equation to solve for epsilon_r
LHS = (2 * capacitance_semicircular * thickness_semicircular) / (capacitance_circular * thickness_circular)
epsilon_r = 1 / (LHS-1)
print(f"Dielectric constant: {epsilon_r : .6g}")

# %%
