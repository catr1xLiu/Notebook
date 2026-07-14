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
from numpy import sin, cos, log, e, pi

e0 = 8.854187817e-12

# %%

# Part1: Computing theoretical 
Area = pi * (0.1)**2

distances = [5e-3, 10e-3, 15e-3, 20e-3, 25e-3, 30e-3]

for d in distances:
    print(f"Distace {d} m, theoretical capacitance {e0 * Area / d} F")


# %%

# Step2: Computing capacitance from simulation value

surface_charge_sim = [
    6.2319e-8,
    3.4143e-8,
    2.4659e-8,
    1.9917e-8,
    1.7028e-8,
    1.5124e-8
]

voltage_difference = 1000

for i in range(len(distances)):
    Q = surface_charge_sim[i]
    d = distances[i]
    C = Q / voltage_difference
    print(f"Distance {d} m, measured charge {Q} C, capacitance {C} F")


