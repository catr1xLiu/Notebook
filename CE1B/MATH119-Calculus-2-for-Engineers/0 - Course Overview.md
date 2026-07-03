
> [!abstract] Introduction
> ## MATH 119 — Calculus 2 for Engineering

**Instructor:** Hassan Harb · **Location:** E7 5343 (LEC), DWE 3522A (TUT)
**Schedule:** LEC Tue & Thu 10:30–11:20AM / Fri 9:30–10:20AM | TUT Fri 2:30–4:20PM
**Textbook:** Guichard — free on LEARN. Scientific (non-graphing) calculator permitted in tutorials.

Three large, connected topics: **(1) Multivariable calculus** — extending derivatives and integrals to functions of two and three variables, optimization with constraints (Lagrange multipliers), double and triple integrals. **(2) Approximation methods** — Newton's method, Taylor polynomials and remainders, estimating functions and evaluating limits. **(3) Infinite series** — convergence tests, power series, and Taylor series manipulation. These tools are directly used in probability, signal processing, numerical methods, and physics courses throughout the program.

---

> [!info] Info
> ## Score Distribution

| Component | Weight | Notes |
|-----------|--------|-------|
| Tutorial Assignments (best 8 of 9) | 20% | Submitted during tutorial session only; lowest one dropped |
| Midterm | 30% | Week 7, in-person |
| Final Exam | 50% | In-person |

---

> [!info] Info
> ## Weekly Topics

| Week | Topics | Activities |
|------|--------|------------|
| 1 | Multivariable functions · Level curves · Contour plots · Partial derivatives | No tutorial |
| 2 | Linear approximation · Differentials · Parametric equations · Multivariate chain rule | Tutorial 1 · Assignment 1 |
| 3 | Gradient vector · Directional derivatives · Optimization | Tutorial 2 · Assignment 2 |
| 4 | Lagrange multipliers · Double integrals (Cartesian) | Tutorial 3 · Assignment 3 |
| 5 | Double integrals (polar) · Change of variables · Applications | Tutorial 4 · Assignment 4 |
| 6 | Triple integrals | No tutorial |
| 7 | **Midterm Week** — no classes, no tutorials | Midterm |
| 8 | Newton's method · Interpolating polynomials · Taylor polynomials | Tutorial 5 · Assignment 5 |
| 9 | Remainder theorem · Taylor's inequality | Tutorial 6 · Assignment 6 |
| 10 | Applications · Infinite series · Convergence tests | Tutorial 7 · Assignment 7 |
| 11 | More convergence tests · Absolute vs. conditional convergence | Tutorial 8 · Assignment 8 |
| 12 | Power series · Taylor series · Binomial series · Manipulating power series | Tutorial 9 · Assignment 9 |
| 13 | More power series | No tutorial |

---

> [!hint] Hint
> ## Tutorials

Fridays 2:30–4:20PM, DWE 3522A. Assignments are distributed and collected **during the tutorial session** — you cannot submit outside of it.

You may work in groups but must write and submit your **own solutions in your own words**. Permitted resources: personal notes, MATH 119 LEARN materials, and a scientific (non-graphing) calculator. No internet or other resources during tutorials.


> [!quote] Directory
> ## Full Course Directory


*   **Chapter 1: Introduction to Multivariate Calculus**
    *   Introduces functions of multiple variables, defining their domains as subsets of $\mathbb{R}^n$ and their ranges as subsets of $\mathbb{R}$.
    *   Explores the visual representation of two-variable functions through surfaces in $\mathbb{R}^3$, cross-sections, and level curves on contour plots.

*   **Chapter 2: Limits and Partial Derivatives**
    *   Analyzes multivariate limits near discontinuities by examining behavior along different paths of approach, demonstrating that a limit does not exist if different paths yield different values.
    *   Defines partial derivatives with respect to individual variables by treating other variables as constants, and introduces mixed higher-order partial derivatives along with Clairaut's Theorem.

*   **Chapter 3: Tangent Planes, The Linear Approximation, and Differentials**
    *   Derives the equation of a non-vertical tangent plane to a surface $z = f(x,y)$ at a given point using first-order partial derivatives.
    *   Formulates the total differential to construct linear approximations of multivariate functions and estimate small changes or physical errors.

*   **Chapter 4: Introduction to Vector Functions: Parametric Representations of Curves**
    *   Uses parametric equations to describe paths and curves in two-dimensional space, demonstrating how to parameterize line segments, circles, and ellipses.
    *   Defines vector-valued functions and their derivatives to represent the position, velocity, speed, and acceleration of a moving particle.

*   **Chapter 5: The Basic Chain Rule, the Gradient Vector, and Directional Derivatives**
    *   Introduces the chain rule for paths to calculate derivatives of multivariate functions where the coordinates depend on a single parameter.
    *   Defines the gradient vector as a combination of partial derivatives and utilizes it to compute directional derivatives in any unit vector direction.
    *   Explains that the gradient vector points in the direction of the steepest ascent and is always orthogonal to the function's level curves.

*   **Chapter 6: Other Forms of the Chain Rule**
    *   Generalizes the multivariate chain rule to coordinate transformations (mappings) and multi-parameter dependencies using tree diagrams to trace derivative paths.
    *   Illustrates the application of the chain rule to second-order partial derivatives and non-standard variable dependencies.

*   **Chapter 7: Optimization Techniques**
    *   Defines critical points, local extrema, and saddle points for functions of two variables.
    *   Applies the Second-Derivative Test using the discriminant $D(x,y) = f_{xx}f_{yy} - (f_{xy})^2$ to classify the nature of critical points.
    *   Introduces the Method of Lagrange Multipliers to locate constrained extrema by solving the parallel gradient relation $\nabla f = \lambda \nabla g$.

*   **Chapter 8: Integration of Scalar Fields**
    *   Develops the definition of double integrals over rectangular domains using Riemann sums of volume boxes.
    *   Evaluates double integrals using iterated single-variable integration and demonstrates that the order of integration can be interchanged over rectangular regions.
    *   Extends double integration to non-rectangular domains categorized as Type I, Type II, or Type III regions by setting functional boundaries.

*   **Chapter 9: Evaluation of Double Integrals in Polar Coordinates**
    *   Transforms double integrals from Cartesian to polar coordinates for circular or angular domains, substituting $x = \rho \cos \phi$ and $y = \rho \sin \phi$.
    *   Explains the modification of the area element to $dA = \rho\, d\rho\, d\phi$ to account for coordinate distortion.

*   **Chapter 10: The Change-of-Variable Formula**
    *   Formulates general coordinate transformations for double integrals by mapping complicated regions to simpler rectangular ones.
    *   Defines the Jacobian determinant as a scaling factor that compensates for domain distortion during coordinate substitution.

*   **Chapter 11: Discussion: Interpretation of Integrals**
    *   Provides physical interpretations of single and double integrals, such as calculating total mass, charge, population, and the average (mean) value of a function over a region.
    *   Explains how integrating without an integrand ($\iint_R 1\, dA$) simplifies to computing the geometric area of the domain.

*   **Chapter 12: Triple Integrals**
    *   Extends the concepts of integration to three-dimensional domains over rectangular boxes and non-rectangular volumes.
    *   Introduces cylindrical coordinates as a three-dimensional extension of polar coordinates, calculating its Jacobian as $\rho$.
    *   Formulates spherical coordinates using distance and two angles, establishing its volume element as $dV = r^2 \sin \theta\, dr\, d\theta\, d\phi$ to evaluate integrals over spherical and conical regions.

*   **Chapter 13: Taylor Polynomials and Series Introduction**
    *   Discusses the necessity of numerical and analytical approximation methods in calculus when exact algebraic solutions or antiderivatives are impossible to find.

*   **Chapter 14: Our Simplest Option: the Linear Approximation**
    *   Reviews the single-variable linear approximation (or linearization) $L(x) = f(a) + f'(a)(x-a)$ as the equation of the tangent line.
    *   Illustrates the application of linearization to physical problems, such as estimating resistivity or modeling the simple pendulum.

*   **Chapter 15: Root Finding**
    *   Applies the Bisection Method as a robust numerical technique for locating roots of continuous functions using the Intermediate Value Theorem.
    *   Derives Newton's Method as an iterative root-finding algorithm that uses successive tangent line approximations to converge rapidly to a zero.
    *   Introduces Fixed-Point Iteration as an alternative numerical method to solve equations of the form $x = g(x)$, outlining its geometric behavior and convergence criteria.

*   **Chapter 16: Polynomial Interpolation**
    *   Constructs a unique polynomial of degree $n$ that passes exactly through $n+1$ equidistant data points using finite differences.
    *   Introduces the Newton Forward Difference Formula and the Lagrange Linear Interpolation Formula to estimate function values between nodes.

*   **Chapter 17: Taylor Polynomials**
    *   Combines the concepts of linearization and polynomial interpolation to define the $n$-th order Taylor polynomial centered at $x_0$.
    *   Explains Maclaurin polynomials as the special case of Taylor polynomials centered at zero, and introduces shortcuts for finding them through variable substitutions.

*   **Chapter 18: The Remainder Theorem for Taylor Polynomials**
    *   Analyzes the error of Taylor polynomial approximations by deriving the integral remainder term using integration by parts.
    *   Formulates Taylor's Inequality to establish a worst-case upper bound on the approximation error based on the maximum magnitude of the $(n+1)$-st derivative.
    *   Discusses how to find upper bounds for products and sums using the triangle inequality.

*   **Chapter 19: Approximation of Integrals using Taylor Polynomials**
    *   Demonstrates how to approximate definite integrals of non-elementary functions (such as $e^{t^2}$) by integrating their Taylor expansions term-by-term.
    *   Discusses how to bound the resulting integration error by tracking the remainder term through the integration process.

*   **Chapter 20: Infinite Series**
    *   Formulates the Taylor series of a function as an infinite series representing the limit of its Taylor polynomials as $n \to \infty$.
    *   Contrasts functions whose Taylor series converge globally to the function itself with functions that fail to converge or diverge outside a specific interval.

*   **Chapter 21: Convergence of Infinite Series**
    *   Defines infinite series and convergence in terms of the limit of a sequence of partial sums.
    *   Analyzes fundamental convergence tests including the Geometric Series test, the Test for Divergence, the Integral Test, and the $p$-Series test.
    *   Introduces comparison tests, alternating series tests, absolute versus conditional convergence, and the Ratio and Root tests for absolute convergence.

*   **Chapter 22: Power Series**
    *   Defines general power series centered at $x_0$ and applies the Ratio Test to determine their radius and interval of convergence.
    *   Explores term-by-term differentiation and integration of power series, preserving the radius of convergence while potentially changing behavior at the endpoints.
    *   Uses basic power series building blocks (geometric, exponential, sine, cosine, and binomial series) to find series expansions for complex functions.

*   **Chapter 23: The "Big-O" Order Symbol**
    *   Defines the Big-O notation to mathematically represent the asymptotic behavior of error terms in Taylor polynomial approximations as $x \to x_0$.
    *   Establishes algebraic rules for manipulating Big-O symbols to simplify calculations and evaluate complex limits without computing exact remainder constants.

*   **Chapter 24: Taylor Series: the Two-Variable Case**
    *   Extends single-variable Taylor polynomials and series to multivariate functions, demonstrating how coefficients are organized using Pascal's Triangle.

*   **Chapter 25: Final Comments About Taylor Series**
    *   Highlights the theoretical distinction between smooth functions and analytic functions using a non-analytic infinitely-differentiable counterexample ($e^{-1/x^2}$).
    *   Derives the Second-Derivative Test for local extrema by examining the signs of the quadratic terms in a two-variable Taylor expansion.

*   **Part III: A Brief Introduction to the Calculus of Vector Fields**
    *   Introduces two-dimensional and three-dimensional vector fields as mappings from vectors to vectors, visualizing them through direction fields and parametric field lines.
    *   Defines divergence and curl as local measures of expansion and rotation respectively, using nabla notation for concise representation.
    *   Formulates line integrals (or path integrals) of scalar and vector fields to calculate quantities such as the area of a "curtain" and physical work performed by a force field along a curve.