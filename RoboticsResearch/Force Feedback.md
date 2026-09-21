
![[Force Feedback 1|100%]]

## 1. Defining the Problem

Our problem is how to reflect force measured by the robot back to the operator, when we compress a deform able object (light blue). Extending further, how we determine the compliance stiffness that the operator wants to exert for record.

First, define the human-controller-robot-object model. The illustration above represents the problem on a single axis, we generalize it in the 3-d Cartesian coordinate:

### 1.1 Operator Hand

The operator's hand apply force to the haply controller, denote the force it apply as $F_o \in \mathbb{R}^3$.

### 1.2 Controller

The controller is a [haply inverse 3]() in our set-up. The controller polls the current position of the pen $\vec{i} \in \mathbb{R}^3$ and its rotation. We don't enable rotation sensing here, thus we do not consider it. The controller provides a feed-back force 
$$\vec{F_b} \in \mathbb{R}^3 \quad \vec{F_b} = - \vec{F_o}$$

### 1.3 The Robot Arm

The robot arm is controlled by embedded impedance controller to reach reference point $\vec{r}$. We define $M$ to be the function mapping from operator frame-of-reference to robot frame-of-reference:
$$ M:\mathbb{R}^3_\text{ Operator} \rightarrow \mathbb{R}^3_\text{ Robot} \quad\quad \vec{r} = M(\vec{i}) = [T]\,\vec{i} + \vec{i_0} $$

Where $[T] \in \mathbb{R}^{3\times3}$ is a constant transformation, and $\vec{i_0} \in \mathbb{R}^3$ is the zero-reference. In real life, $\vec{i_0}$ changes during execution, it gets reset every time the operator picks-up control again. But here, as the pilot remains control, it is treated as constant. 

Also, the function $M$ is obviously reversible:
$$ M^{-1}: \mathbb{R}^3_\text{ Robot} \rightarrow \mathbb{R}^3_\text{ Operator} \quad\quad \vec{i} = M^{-1}(\vec{r}) = [T]^{-1}\,(\vec{r} - \vec{i_0}) $$

The arm is controlled by its embedded position controller. Denote actual position as $\vec{p} \in \mathbb{R}^3$, the error and control force is:
$$ \mathrm{Er} = \vec{r}-\vec{p} \quad\quad F_\text{controller} = k_p \, (\vec{r}-\vec{p}) - k_d \,\frac{d}{dt} \, \vec{p}$$

### 1.4 The Deform-able Object

The object that the robot is making contact with must be deform-able. The position of the end-effector when it barely touches the uncompressed object is $\vec{s} \in \mathbb{R}^3$. Assume the object has impedance factor $k_o \, (\mathrm{N}/\mathrm{m})$, the force by the object on arm $\vec{F_s} \in \mathbb{R}^3$ is:
$$ \vec{F_s} = k_o \,(\vec{s}-\vec{p}) $$
### 1.5 Summary of Symbols

Table for all symbols.

