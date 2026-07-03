# ECE 140 — Linear Circuits — Note Index

## Lecture Notes

### 1 - Introduction.rnote
- **Voltage** (energy per unit charge), **current** (charge flow), **Ohm's law** (I = V/R)
- **SI unit conversions**: prefixes, e = 1.6×10⁻¹⁹ C
- **Ideal circuit elements**: resistor (V = IR), passive sign convention (current enters + terminal)
- **Short circuit** vs **open circuit**
- **Power and energy**: P = VI = I²R = V²/R. Total power absorbed + delivered = 0.
- **AC vs DC**: Vdc (average), Vp (peak amplitude), Vrms, period T, frequency f = 1/T, ω = 2πf

### 1 - Introduction.md (Obsidian)
- Introduction overview with plots

### 2 - Circuit Elements.rnote
- **Schematics and symbols**: nodes, branches, ground, current flow direction
- **Voltage source**: defines voltage, current determined by circuit
- **Current source**: defines current, voltage determined by circuit
- **Independent vs dependent sources**: voltage-controlled, current-controlled
- **Resistor**: V = IR, conductance G = 1/R (siemens), P = I²R = V²/R
- **Series resistors**: R_eq = R₁ + R₂ + ...
- **Parallel resistors**: 1/R_eq = 1/R₁ + 1/R₂; for two: R₁R₂/(R₁+R₂)
- **Current divider** and **voltage divider** formulas
- **Wheatstone bridge**: balance condition R₁R₄ = R₂R₃, two worked examples (find R₂ for balance; solve for I₃)
- **KCL** (Kirchhoff's Current Law): net current at node = 0
- **KVL** (Kirchhoff's Voltage Law): sum of voltage drops/rises in closed loop = 0

### 3 - Circuit Analysis.rnote
- **Node voltage analysis**: assign node voltages, write KCL at each node, solve simultaneous equations. Two worked examples:
  1. Multi-source circuit (5V, 10mA, four resistors) — full node voltage solution
  2. Circuit with 5V, 500Ω, 2k, 4k, 2k — nodes A and B
- **Supernodes**: when voltage source connects two non-reference nodes. Worked example with constraint equation from voltage source.
- **Mesh current method**: assign loop currents, write KVL around each mesh. Worked example: 10V, 1k, 2k, 2k, 5V — two mesh currents I₁ = 1.5mA, I₂ = 0.5mA, I_R₂ = 1mA.

### 4 - Linear Circuit Model.rnote
- **Linear circuits**: obey V = IR, KVL, KCL — any variable is I_load = k·V_x + b
- **Thévenin equivalent**: V = V_oc − I·R_th (voltage source in series with R_th)
- **Norton equivalent**: I = I_sc − V/R_th (current source in parallel with R_th)
- **Thévenin ↔ Norton**: R_th is the same, V_oc = I_sc · R_th
- **Superposition principle**: consider each source one at a time (zero others: voltage→short, current→open), then add results
- **Example 1**: Find Thévenin + Norton equivalent. V_oc = 1.15V via voltage divider, compute I_sc, R_th = V_oc/I_sc. **Maximum power transfer**: P_max = 1.13mW.
- **Example 2**: Thévenin equivalent with dependent source — multi-step (turn off dependents, find V_th, then apply test voltage V_t = 10V, solve with mesh/node)

### 4 - Practice Problems.rnote
- **Problem 1**: Norton equivalent — (a) R_eq = 6kΩ, I_N = 1mA, R_N = 6k; (b) V_A = 8V, I_N = 0.8A
- **Problem 2**: Norton equivalent with dependent source — test voltage V_t = 10V, 4 simultaneous equations, R_ab = 20Ω
- **Problem 3**: Thévenin equivalent — 300V source, 3A current source, resistors (150, 40, 10, 8Ω). R_ab = 15Ω by source removal, I_N = 2A by node analysis, V_Th = 30V
- **Problem 4**: Thévenin equivalent — 174V, 100mA, resistors (26, 40, 15, 10, 4Ω). **UNSOLVED** (circuit drawn, no solution)

### 5 - Opamp.rnote (INCOMPLETE)
- **Circuit 1**: Op-amp with 2kΩ input, 2kΩ to ground, 4kΩ feedback, 1kΩ output — analysis started, configuration unclear (possibly inverting/differential)
- **Non-inverting amplifier** derivation:
  - V+ = V- = Vin (virtual short)
  - Voltage divider on feedback: Vout/V- = (Ri + Rf)/Ri
  - **Result: Vout = (1 + Rf/Ri) · Vin**
  - Time-domain plot: non-inverted, amplified output
- **Missing**: inverting amplifier (Vout = −(Rf/Ri)·Vin), summing amplifier, difference amplifier, cascaded op-amps

### CDT 2.md (Obsidian)
- **Node voltage analysis worked example**: Circuit with R₁=14Ω, R₂=4Ω, R₃=6Ω, R₄=5Ω, 12V source, 1A current source. Write Ohm's Law for 4 resistors, KCL at 4 nodes, reduce to 2 equations, solve via row reduction. V_b = 12.123V, V_c = 8.158V.

---

## Tutorials

### Tutorial2.rnote
- **Problem 1**: Node voltage analysis — KCL equations, I₁ = 0.67A, I₂ = −1.15A
- **Problem 2**: Mesh analysis — KVL loop equations, simultaneous solving
- **Problem 3**: KVL with series resistors — 1V sources, 4kΩ and 9kΩ resistors, I_Rc = 0.176mA
- **Problem 4**: Series/parallel simplification, delta-to-Y transformation, R_eq = 10Ω, current divider
- **Problem 5**: Node voltage with supernode — R_input = 3.79Ω
- **Problem 6**: Multi-source mesh analysis with dependent sources — extended algebraic solution
- **Problem 7 (partial)**: Dependent current source circuit (28V, 8Ω, 1Ω, 2Ω) — voltage relationships derived, trails off

### Tutorial3.rnote
- **Q1**: Mesh analysis — R₁=14Ω, R₂=43Ω, R₃=91Ω, R₄=36Ω. Calculate current in and power dissipated by R₃. I_R₃ = 0.54A, P = 12.9W.
- **Q2**: Source transformation — R=3.3Ω, R₁=300Ω, R₄=12Ω, R₅=360Ω. Three mesh KVL equations solved. I = 2.37mA, I₂ = 1.12mA.
- **Q3**: Thévenin/Norton equivalent — R₁=21Ω, R₄=10Ω, R₅=9Ω. (a) Find R_th and V_th between a,b. (b) Find I_N between c,d. I = 0.515A.
- **Q7**: Op-amp circuit analysis — (a) gain A = Vout/Vs derived, (b) output current from 15mV input, (c) output voltage from 1V input = 1.5V. Uses ideal op-amp rules: I_in = 0, V+ = V-. Derives **inverting gain formula**: V_out = −(Rf/R₁)·V_in.
- **Q8 (partial)**: Op-amp with V+ = 1.1V, R₁=10kΩ, Rf=100kΩ, R₄=13kΩ, R₅=50kΩ — equations started, not completed.
- **2 unsolved circuit diagrams** at bottom: (1) dependent current source 3i_o with R₁-R₄, terminals a,b; (2) R₁-R₄ + R_L + V_s + I_s.
