
---

> [!abstract] Introduction
> ## Linear Transformations in Computer Graphics

In 3D computer graphics, everything we see on a 2D screen is fundamentally a **projection** of a 3D world. Understanding how linear transformations project points and shapes from three dimensions onto a plane is essential for rendering, animation, and simulation.

This section explores:
- How projection transformations work mathematically
- Computing standard matrices for plane projections
- The geometric meaning of projecting onto different planes
- The "camera roll" problem and how to solve it with orthonormal bases
- Coordinate systems for viewing 3D objects from different angles

These concepts form the mathematical foundation of computer graphics pipelines, from simple 2D games to complex 3D rendering engines.

> [!quote] Definition
> ## Projection onto a Plane

Given a plane through the origin with <u><strong style="color:#dab1da">normal vector</strong></u> $\vec{n}$, the <u><strong style="color:#dab1da">projection transformation</strong></u> $T: \mathbb{R}^3 \to \mathbb{R}^3$ that projects any vector $\vec{x}$ onto this plane is defined by:

$$T(\vec{x}) = \vec{x} - \text{proj}_{\vec{n}}\vec{x} = \vec{x} - \frac{\vec{x} \cdot \vec{n}}{\|\vec{n}\|^2}\vec{n}$$

This transformation removes the component of $\vec{x}$ that is perpendicular to the plane (i.e., parallel to $\vec{n}$), leaving only the component that lies in the plane.

> [!fact] Theorem
> ## Standard Matrix for Plane Projection

For a plane through the origin with normal vector $\vec{n} = \begin{bmatrix} n_1 \\ n_2 \\ n_3 \end{bmatrix}$, the standard matrix $[T]$ of the projection transformation is:

$$[T] = I - \frac{1}{\|\vec{n}\|^2}\vec{n}\vec{n}^T$$

where $I$ is the $3 \times 3$ identity matrix.

> [!fact]- Derivation (Click to expand)
> 
> To find the standard matrix, we apply $T$ to each standard basis vector.
> 
> For $\vec{e}_1 = \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix}$:
> 
> $$T(\vec{e}_1) = \vec{e}_1 - \frac{\vec{e}_1 \cdot \vec{n}}{\|\vec{n}\|^2}\vec{n} = \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix} - \frac{n_1}{\|\vec{n}\|^2}\begin{bmatrix} n_1 \\ n_2 \\ n_3 \end{bmatrix}$$
> 
> $$= \begin{bmatrix} 1 - \frac{n_1^2}{\|\vec{n}\|^2} \\ -\frac{n_1n_2}{\|\vec{n}\|^2} \\ -\frac{n_1n_3}{\|\vec{n}\|^2} \end{bmatrix}$$
> 
> Similarly for $\vec{e}_2$ and $\vec{e}_3$. The resulting matrix is:
> 
> $$[T] = \frac{1}{\|\vec{n}\|^2}\begin{bmatrix} \|\vec{n}\|^2 - n_1^2 & -n_1n_2 & -n_1n_3 \\ -n_1n_2 & \|\vec{n}\|^2 - n_2^2 & -n_2n_3 \\ -n_1n_3 & -n_2n_3 & \|\vec{n}\|^2 - n_3^2 \end{bmatrix}$$
> 
> This can be written compactly as $[T] = I - \frac{1}{\|\vec{n}\|^2}\vec{n}\vec{n}^T$.

> [!info] Info
> ## Properties of Projection Matrices

Projection matrices have several important properties:

1. **Rank:** The projection matrix onto a plane has $\text{rank}([T]) = 2$ (the dimension of the plane)
2. **Not Invertible:** Since the rank is less than 3, projection matrices are singular (not invertible)
3. **Idempotent:** Applying the projection twice gives the same result: $[T]^2 = [T]$

> [!example] Example
> ## Coordinate Plane Projections

The three standard coordinate planes have particularly simple projection matrices:

**Projection onto the $xy$-plane** (normal $\vec{n} = \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}$):

$$[T_{xy}] = \begin{bmatrix} 1 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 0 \end{bmatrix}$$

This simply sets the $z$-coordinate to zero.

**Projection onto the $xz$-plane** (normal $\vec{n} = \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix}$):

$$[T_{xz}] = \begin{bmatrix} 1 & 0 & 0 \\ 0 & 0 & 0 \\ 0 & 0 & 1 \end{bmatrix}$$

This sets the $y$-coordinate to zero.

**Projection onto the $yz$-plane** (normal $\vec{n} = \begin{bmatrix} 1 \\ 0 \\ 0 \end{bmatrix}$):

$$[T_{yz}] = \begin{bmatrix} 0 & 0 & 0 \\ 0 & 1 & 0 \\ 0 & 0 & 1 \end{bmatrix}$$

This sets the $x$-coordinate to zero.

> [!info] Info
> ## From 3D Projections to 2D Screen Coordinates

When we project a 3D point onto a plane, we get a 3D point that lies in the plane (with one coordinate effectively "flattened" to zero). To display this on a 2D screen, we simply **drop the zero component**:

- For the $xy$-plane: Keep $(x, y)$, drop $z = 0$
- For the $xz$-plane: Keep $(x, z)$, drop $y = 0$
- For the $yz$-plane: Keep $(y, z)$, drop $x = 0$

This is why computer screens can display 3D objects—we're viewing projections of the 3D world onto 2D viewing planes.

> [!quote] Definition
> ## The Camera Roll Problem

For an arbitrary plane (not aligned with coordinate axes), there are **infinitely many ways** to create a 2D coordinate system on that plane. This is analogous to the "camera roll" problem: even if you point a camera in a fixed direction, you can still rotate it around that viewing direction, producing different orientations of the resulting image.

To solve this problem and produce a **stable, predictable view**, we need:
1. A <u><strong style="color:#dab1da">world up direction</strong></u>: A fixed "up" vector for our entire 3D world
2. A systematic method for constructing an <u><strong style="color:#dab1da">orthonormal basis</strong></u> for the viewing plane

> [!fact] Theorem
> ## Constructing a Standard View Basis

Given:
- A plane with normal vector $\vec{n}$ (the <u><strong style="color:#dab1da">viewing direction</strong></u>)
- A world up vector $\vec{u}_{\text{world}}$ (typically $\begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}$ in mathematics/engineering)

We construct an <u><strong style="color:#dab1da">orthonormal basis</strong></u> $\{\vec{b}_1, \vec{b}_2\}$ for the plane as follows:

**Step 1: Find the "Right" direction**
$$\vec{b}_{1,\text{raw}} = \vec{u}_{\text{world}} \times \vec{n}$$

This vector is perpendicular to both the world up direction and the viewing direction, making it a horizontal "right" vector on the plane.

**Step 2: Find the "Up" direction**
$$\vec{b}_{2,\text{raw}} = \vec{n} \times \vec{b}_{1,\text{raw}}$$

This vector is perpendicular to both the viewing direction and the "right" vector.

**Step 3: Normalize**
$$\vec{b}_1 = \frac{\vec{b}_{1,\text{raw}}}{\|\vec{b}_{1,\text{raw}}\|}, \quad \vec{b}_2 = \frac{\vec{b}_{2,\text{raw}}}{\|\vec{b}_{2,\text{raw}}\|}$$

The resulting basis $\{\vec{b}_1, \vec{b}_2\}$ is orthonormal and provides a canonical "level" view of the plane.

> [!example] Example
> ## Basis for a Tilted Plane

Consider the plane $x + z = 0$ with normal $\vec{n} = \begin{bmatrix} 1 \\ 0 \\ 1 \end{bmatrix}$ and world up $\vec{u}_{\text{world}} = \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}$.

> [!success]- Solution (Click to expand)
> 
> **Step 1: Right vector**
> $$\vec{b}_{1,\text{raw}} = \vec{u}_{\text{world}} \times \vec{n} = \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix} \times \begin{bmatrix} 1 \\ 0 \\ 1 \end{bmatrix} = \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix}$$
> 
> **Step 2: Up vector**
> $$\vec{b}_{2,\text{raw}} = \vec{n} \times \vec{b}_{1,\text{raw}} = \begin{bmatrix} 1 \\ 0 \\ 1 \end{bmatrix} \times \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix} = \begin{bmatrix} -1 \\ 0 \\ 1 \end{bmatrix}$$
> 
> **Step 3: Normalize**
> $$\|\vec{b}_{1,\text{raw}}\| = 1, \quad \|\vec{b}_{2,\text{raw}}\| = \sqrt{(-1)^2 + 0^2 + 1^2} = \sqrt{2}$$
> 
> $$\vec{b}_1 = \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix}, \quad \vec{b}_2 = \begin{bmatrix} -\frac{1}{\sqrt{2}} \\ 0 \\ \frac{1}{\sqrt{2}} \end{bmatrix}$$
> 
> This basis represents a level view where:
> - $\vec{b}_1$ points in the world's $y$-direction (screen horizontal)
> - $\vec{b}_2$ tilts at 45° between the negative $x$ and positive $z$ directions (screen vertical)

> [!fact] Theorem
> ## Finding 2D Coordinates with an Orthonormal Basis

Let $\{\vec{b}_1, \vec{b}_2\}$ be an <u><strong style="color:#dab1da">orthonormal basis</strong></u> for a plane, and let $\vec{p}$ be a point that lies in the plane. Then $\vec{p}$ can be uniquely written as:

$$\vec{p} = c_1\vec{b}_1 + c_2\vec{b}_2$$

where the <u><strong style="color:#dab1da">coordinates</strong></u> $(c_1, c_2)$ are given by:

$$c_1 = \vec{p} \cdot \vec{b}_1, \quad c_2 = \vec{p} \cdot \vec{b}_2$$

These coordinates $(c_1, c_2)$ are the **2D screen coordinates** for displaying $\vec{p}$.

> [!fact]- Proof (Click to expand)
> 
> Since $\vec{p}$ lies in the plane spanned by $\{\vec{b}_1, \vec{b}_2\}$, we can write:
> $$\vec{p} = c_1\vec{b}_1 + c_2\vec{b}_2$$
> 
> To find $c_1$, take the dot product of both sides with $\vec{b}_1$:
> $$\vec{p} \cdot \vec{b}_1 = c_1(\vec{b}_1 \cdot \vec{b}_1) + c_2(\vec{b}_2 \cdot \vec{b}_1)$$
> 
> Since the basis is orthonormal:
> - $\vec{b}_1 \cdot \vec{b}_1 = \|\vec{b}_1\|^2 = 1$
> - $\vec{b}_2 \cdot \vec{b}_1 = 0$ (orthogonality)
> 
> Therefore:
> $$\vec{p} \cdot \vec{b}_1 = c_1(1) + c_2(0) = c_1$$
> 
> Similarly, dotting with $\vec{b}_2$ gives $c_2 = \vec{p} \cdot \vec{b}_2$.

> [!info] Info
> ## Complete Projection Pipeline

To project a 3D point $\vec{x}$ onto an arbitrary plane and obtain 2D screen coordinates:

1. **Project onto the plane:** Apply the projection transformation
   $$\vec{p} = T(\vec{x}) = \vec{x} - \frac{\vec{x} \cdot \vec{n}}{\|\vec{n}\|^2}\vec{n}$$

2. **Construct orthonormal basis:** Use the world up vector and normal to find $\{\vec{b}_1, \vec{b}_2\}$

3. **Extract 2D coordinates:** Compute
   $$\text{Screen coordinates} = (c_1, c_2) = (\vec{p} \cdot \vec{b}_1, \vec{p} \cdot \vec{b}_2)$$

This process is fundamental to 3D graphics rendering pipelines, camera systems, and view transformations.

> [!hint] Hint
> ## World Up Convention

**Standard Convention:** In mathematics and engineering, the $z$-axis is typically "up":
$$\vec{u}_{\text{world}} = \begin{bmatrix} 0 \\ 0 \\ 1 \end{bmatrix}$$

**Video Game Convention:** Many game engines use the $y$-axis as "up":
$$\vec{u}_{\text{world}} = \begin{bmatrix} 0 \\ 1 \\ 0 \end{bmatrix}$$

The choice affects the orientation of the resulting basis but the mathematical procedure remains the same. Always check your engine's coordinate system convention!
