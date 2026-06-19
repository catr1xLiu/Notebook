# MATH 119 — Calculus 2 for Engineering — Note Index

## Lecture Notes

### 1 - Introduction.rnote
- **Multivariable functions**: f(x,y) — types: ℝ→ℝ, ℝⁿ→ℝ (scalar field), ℝ→ℝⁿ (vector function), ℝⁿ→ℝᵐ (vector field)
- **Level curves** (contour plots): definition, relationship between x, y, z
- **Example 1**: Level curves of f(x,y) = x² + y² for levels {0, 5, 10} — circles, no negative levels
- **Example 2**: Level curves of f(x,y) = 1/(x² + y²)
- **Example 3**: Level curves of f(1,y) = 1/(1+y²) — region estimation

### 1 - Introduction.md (Obsidian)
- Introduction overview with plots

### 2 - Limits and Partial Derivatives.rnote
- **Multivariable limits**: path-based approach for existence/non-existence
- **Example**: lim (2x²y)/(x⁴+y²) as (x,y)→(0,0) — along x-axis gives 0, along y=x² gives 1 → limit DNE (jump discontinuity)
- **Squeeze theorem** for multivariable: lim (x²sin²y)/(x²+2y²) = 0
- **Partial derivatives**: f_x, f_y via standard differentiation
- **Example**: f(x,y) = (x+y)¹⁰, find f_y using chain rule
- **Tricky partial derivative**: d(x,y) = (x²y)^(1/3), find d_x(0,y) using limit definition
- **Implicit differentiation** for partial derivatives
- **Higher-order derivatives**: f_xx, f_yy, f_xy, f_yx
- **Clairaut's theorem**: f_xy = f_yx for smooth functions — verified with worked example

### 3 - Tangent Planes.rnote
- **Linear approximation** (single variable review): L(x) = f(x₀) + f'(x₀)(x − x₀)
- **Tangent plane** (two variables): L(x,y) = f(x₀,y₀) + f_x(x₀,y₀)(x−x₀) + f_y(x₀,y₀)(y−y₀)
- **Vector/gradient form**: L(p) = f(p₀) + ∇f(p₀)·(p − p₀)
- **Applied example**: Isosceles triangle area change — base increases 16cm, angle decreases 0.1rad. A(b,θ) = ¼b²tan θ, compute ΔA via partial derivatives.

### 4 - Vector Functions.rnote (partially complete)
- **Parametric curves**: expressing y = F(x) as x = g(t), y = d(t)
- **Example**: (2cos t, 2sin t) → circle x²+y²=4
- **Example**: (t²−1, t+1) → parabolic path with direction for t = −1, 0, 1
- **Parametric derivative**: F'(x) = dy/dx = d'(t)/g'(t)
- **Cuts off** after introducing derivative formula — no worked derivative examples

### 5 - Gradient.rnote
- **Directional derivative**: D_u f(a) = ∇f(a) · û (must normalize direction vector)
- **Example**: f(x,y) = y⁴ + 2xy³ + x²y⁴. ∇f(0,1) = (2,4). D_u f(0,1) = 2√5 for u = (1,2). D_v f(0,1) = 0 for v = (−2,1) (perpendicular to gradient).
- **Gradient ascent**: moving along ∇f gives maximum rate of increase; perpendicular to ∇f gives zero change

### 5 - Optimizations.md (Obsidian)
- **Unconstrained optimization** (header only)
- **Lagrange multipliers**: ∇f = λ∇g and g(x,y) = K. Extension to multiple constraints.
- **Example 1**: Max/min of f(x,y) = x²+2y² on circle x²+y²=1 — incomplete (cases not finished)
- **Example 2**: Max/min of f(x,y) = x²+2y² on disk x²+y²≤1 — interior (∇f=0 → (0,0)), boundary (Lagrange → (0,±1), (±1,0)), compare all: min=0, max=2

### 10 - Change-of-Variable.md (Obsidian)
- **Variable change as transformation**: T: ℝⁿ→ℝⁿ, bijection
- **Polar to Cartesian**: x = r cos θ, y = r sin θ
- **Jacobian matrix**: [J] = [[∂x/∂u, ∂x/∂v], [∂y/∂u, ∂y/∂v]]
- **Jacobian determinant**: ratio between new and old area elements
- **Incomplete** — cuts off mid-sentence about the determinant's geometric meaning
- Interactive HTML visualization embedded

---

## Tutorials

### Tutorial1.rnote
- **Problem (b)**: Prove lim (xy⁴)/(x²+y⁸) as (x,y)→(0,0) DNE — path x = y⁴ gives 1/2, x-axis gives 0 → jump discontinuity
- **Piecewise function**: f(x,y) = (x²y − xy³)/(x²+y²) for (x,y)≠(0,0), f(0,0)=0:
  - (a) Find ∂f/∂y — full quotient rule: (x⁵ − 4x³y² − xy⁴)/(x²+y²)²
  - (b) Find f_x(0,0) using limit definition → 0
  - (c) Find f_yx(0,0) using limit definition → 1
  - Shows **Clairaut's theorem fails** when mixed partials are not continuous

### Tutorial2 — see ECE108/Tutorial2.rnote (MISLABELED, actually MATH119 content)
- **Problem 1**: Tangent plane to f(x,y) = √(xy) at (1,1) → z = ½x + ½y
- **Problem 2**: Tangent plane to f(x,y) = 2^(x+3)/(4y+1) at (3,0) → z = 3 + 2x − 12y
- **Problem 3**: Linear approximation — PV = 8.31T, V: 12→12.3L, T: 310→305K. ΔP ≈ −8.829 kPa via partial derivatives.
- **Problem 4**: Multivariate chain rule — V = x²sin(y) + ye^(xy), x = s+2t, y = st. dV/ds at s=0,t=1 → **5**
- **Problem 5**: Wave equation verification — z = f(x+at) + g(x−at) satisfies ∂²z/∂t² = a²∂²z/∂x²
- **Problem 6**: Parametric tangent lines — x = 2cos t − cos 2t, y = 2sin t − sin 2t. Vertical tangents at t ∈ {π/3, π, 5π/3}, horizontal tangents at t ∈ {π/6, π/2, ...}
- **Problem 7**: Arc length of parametric curve — x = cos t − sin t, y = cos t + sin t, t ∈ [0,π]. L = π√2.
- **Practice A**: x = t − sin t, y = 1 − cos t (cycloid) — cusp at t=0, horizontal tangent at t=π

### Tutorial3.rnote
- **1(a)**: Second-degree Taylor polynomial at (1,1,3), evaluate at nearby point Q
- **1(b)**: Equation of tangent plane at (1,1,3)
- **2**: Directional derivative — at (1,2,−3/2), which direction gives max rate of change? Perpendicular directions give zero change.
- **3**: Critical point classification — f(x,y) = x² − 12xy + 8y³. Critical points (0,0) and (1/2,1/2). Second derivative test (discriminant D): D(0,0) inconclusive, D(1/2,1/2) classified.
- **4**: Absolute extrema — f(x,y,z) = e^(−x²)(1+z)(y²+1) on disk x²+y²≤1. Interior: critical at (0,0). Boundary: parameterize circle, evaluate at (±1,0), (0,±1).
- **5 (cut off)**: f(x,y) = 3x + y⁴ − x² − 3y⁴

### Tutorial4.rnote (MATH 119 Assignment 4, June 12, 2026)
- **I [5pts]**: Lagrange multipliers — extreme values of f(x,y) = 1/x + 1/y subject to 1/x² + 1/y² = 1. Solve ∇f = λ∇g → y = x, substitute into constraint. Evaluate at (√2,√2) and (−√2,−√2).
- **II [8pts]**: Lagrange multipliers — extreme values of f(x,y) = e^(−xy) on x²+4y²≤1. Interior: ∇f=0 → (0,0), f=1. Boundary (ellipse): Lagrange on x²+4y²=1, critical points at (±1,0), (0,±1/2), (±√2/2, ±√2/4). Compare all values for global max/min.
- **III**: Double integral — region D between y=x and y=x³ (x≥0). (a) Sketch D. (b) ∬(x²+2y)dA = ∫₀¹∫_{x³}^{x} (x²+2y) dy dx = **23/84**.
- **IV [4pts]**: Volume under z = 1+x²y² above region x=y², x=4. Double integral ∫₀⁴∫_{−√x}^{√x} (1+x²y²) dy dx = **2784/21**.
- **V [4pts]**: Reverse order of integration — ∫₀⁴∫_{√x}^{2} 1/(y³+1) dy dx. Region bounded by y=√x, y=2. Swap to ∫₀²∫₀^{y²} 1/(y³+1) dx dy = **(1/3)ln 9**.

---

## Practice Exam

### Practice Midterm 2024S1.rnote (complete solution key, 6 pages)
- **1(a) [3pts]**: Match functions to 3D surface graphs — x²−y² → B, |x|+|y| → F, sin(|x|+|y|) → C
- **1(b) [6pts]**: Direction of maximum derivative increase at (1,1) — compute and normalize gradient for each function
- **2(a) [4pts]**: Critical points of f(x,y) = x − x³/3 + y − y³/3 → four points: (±1, ±1)
- **2(b) [4pts]**: Classify critical points — D = f_xx·f_yy − f_xy², (1,1) max, (−1,−1) min, others saddle
- **3(a) [5pts]**: Linear approximation — Kepler's third law M(a,T) = a³/T². ΔM ≈ 3Δa − 2ΔT
- **3(b) [4pts]**: Numerical estimate: Δa=0.1, ΔT=−0.01 → ΔM ≈ 0.32
- **4(a) [4pts]**: PDE xu_x − yu_y = 2x² with change of variables s=xy, t=x/y — chain rule transformation
- **4(b) [4pts]**: Rewrite PDE in new variables, simplify
- **5 [8pts]**: Lagrange multipliers — shortest distance from (0,3) to parabola y=x². Minimize x²+(y−3)² subject to x²−y=0. Result: distance = √(11/2).
- **6 [8pts]**: **Polar integral** — area between r = 4cos θ and r = 4√3 sin θ. Intersection at θ=π/6. Split integral, trig identities. Area = 10π/3 − 4√3.
- **7(a) [3pts]**: Sketch region |x|+|y|≤1 (diamond rotated 45°)
- **7(b) [4pts]**: **Change of variables** — u=x+y, v=y−x. Jacobian |J|=1/2. Diamond → square [−1,1]². Show ∬f(x+y)dxdy = ∫₋₁¹ f(u)du.
- **7(c) [3pts]**: Evaluate ∬(x+y)e^(−(x+y)²)dxdy — odd function argument → **0**.
