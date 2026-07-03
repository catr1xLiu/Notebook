# ECE 106 — Electricity & Magnetism — Note Index

## Lecture Notes

### 1 - Eletric Field.rnote
- **Coulomb's Law**: F = k(q₁q₂)/r², k = 1/(4πε₀)
- **Electric field definition**: E = F/q, E = kq/r²
- **Superposition principle**: discrete sum and continuous integral forms for E-field
- **Electric field lines**: direction conventions (positive → negative / to infinity)
- **Surface charge density**: σ = Q/A, dq = σ dA
- **Example (incomplete)**: electric field on the axis of a uniformly charged disk — sets up integral but derivation cuts off

### CheatSheet.rnote
- **Midterm reference sheet** (work in progress, ~60% blank)
- **Voltage across two points**:
  - ΔP(A→B) = −W (done by electric force) = −∫ₐᵇ E·dl
  - ΔV(A→B) = V_B − V_A = −∫ₐᵇ E·dl (voltage difference = field strength integral)
- **Electric potential at a point**:
  - V_A = −∫_∞^x E·dl = ∫_x^∞ E·dl
  - Reference: V = 0 at infinite distance
- **Capacitance**:
  - C = Q/ΔV (charge on one plate / potential difference, positive side minus negative side)
  - Diagram of parallel plate capacitor with +Q, −Q plates

---

## Tutorials

### Tutorial1.rnote
- **Problem 1**: Electric field of a uniformly charged straight rod on the y-axis at point P on the perpendicular bisector. Uses Coulomb's Law with linear charge density λ = Q/L, symmetry argument (E_y = 0), integration in Cartesian coordinates.
- **Problem 2**: Electric field at center of curvature of a circular arc with mixed charges (top half negative, bottom half positive). Uses angular charge density λ(θ), integration over arc in polar coordinates, component decomposition (E_x cos θ, E_y sin θ).

### Tutorial2.rnote (3 pages)
- **Page 1 — Hemisphere E-field**: Spherical coordinate integration for E-field at center of a uniformly charged hemisphere (radius R, charge Q). Surface element dA = R² sin θ dθ dφ. Symmetry: only z-component survives. Result: E = Q/(8πε₀R²).
- **Page 2 — Gauss's Law**: Closed surface integral ∮ E·dS = Q_enc/ε₀. Three Gaussian surface types:
  - **Sphere**: for spherical charge symmetry
  - **Cylinder**: infinite line charge → E = Q/(2πRLε₀)
  - **Plate/Pillbox**: infinite plane → |E| = σ/(2ε₀)
- **Page 3 — Slab problems**:
  - Uniform slab (thickness b, charge density ρ_v): E outside = ρ_v·b/(2ε₀), E inside at distance d from center = ρ_v·d/ε₀
  - **Non-uniform slab** (ρ_v(z) = ρ₀|z|): piecewise E-field — |E| = ρ₀h²/(2ε₀) for |h| ≤ b/2, |E| = ρ₀b²/(8ε₀) for |h| ≥ b/2

### Tutorial4.rnote
- **Model 1 — Spherical capacitor**: Inner metallic sphere (radius a), outer metallic shell (inner radius b, outer radius c).
  - Qualitative analysis: charge distribution at equilibrium — all charge on inner surface of conductors, outer/inner charge of shell has equal magnitude
  - Gauss's Law: E = Q/(4πε₀r²) for a < r < b, E = 0 inside conductors and for r > c
  - Electric potential via line integral: V_a − V_b = Q/(4πε₀)(1/a − 1/b)
  - **Capacitance**: C = 4πε₀ab/(b − a)
- **Model 2 — Parallel plate capacitor**: Two large plates area A, separated by distance D, uniform surface charge density σ
  - Superposition of two infinite plates: E = σ/ε₀ between plates (each contributes σ/(2ε₀))
  - Voltage: ΔV = E·D = σD/ε₀
  - **Capacitance**: C = ε₀A/D
  - Note: dielectric material with ε_r modifies capacitance
