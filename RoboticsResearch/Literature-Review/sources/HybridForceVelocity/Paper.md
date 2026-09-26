# Robust Execution of Contact-Rich Motion Plans by Hybrid Force-Velocity Control

Yifan Hou, Matthew T. Mason — ICRA 2019 — arXiv:1903.02715

*Converted from the arXiv LaTeX source in [src/](src/ICRA19Hybrid.tex) (sections, equations, figures); acknowledgment and bibliography omitted. Citations are shown by BibTeX key.*

## Abstract

In hybrid force-velocity control, the robot can use velocity control in some directions to follow a trajectory, while performing force control in other directions to maintain contacts with the environment regardless of positional errors. We call this way of executing a trajectory *hybrid servoing*.
We propose an algorithm to compute hybrid force-velocity control actions for hybrid servoing. We quantify the robustness of a control action and make trade-offs between different requirements by formulating the control synthesis as optimization problems.
Our method can efficiently compute the dimensions, directions and magnitudes of force and velocity controls.
We demonstrated by experiments the effectiveness of our method in several contact-rich manipulation tasks.
Link to the video: [https://youtu.be/KtSNmvwOenM](https://youtu.be/KtSNmvwOenM).

## INTRODUCTION

In the materials handling industry where robots pick up random objects from bins, it's generally difficult to pick up the last few objects, because they are usually too close to the bin walls, leaving no collision-free grasp locations. It's even harder if a flat object is lying in the corner. However, in such cases a human would simply lift the object up with only one finger by pressing on a side of the object and pushing against the bin wall.

This is one of the many examples where humans can solve manipulation problems that are difficult for robots with surprisingly concise solutions. The human finger can do more than the robot finger because the human naturally utilizes the contacts between the object and the environment to create solutions.

Manipulation under external contacts is common and useful in human life, yet our robots are still far less capable of doing it than they should be.
In the robot motion planning community, most works are focused on generating collision-free motion trajectories.
There are planning methods that are capable of computing complicated, contact-rich robot motions [mordatch2012discovery, posa2014direct], however, the translation from a planned motion to a successful experiment turns out to be difficult. High stiffness servo controls, such as velocity control, are prone to positional errors in the model. Low stiffness controls such as force control are vulnerable to all kinds of inevitable force disturbances and noise, such as un-modeled friction.

In this work, we attempt to close the gap between contact-rich motion planning and successful execution with *hybrid servoing*, defined as using hybrid force-velocity control to execute the planned trajectory. We try to combine the good points of both worlds: high stiffness controls are immune to small force disturbances, while force controls (even somewhat inaccurate force controls) can comply with holonomic constraints under modeling uncertainties.

Solving for hybrid force-velocity control is more difficult than solving for force or velocity alone, because we need to compute directions for each type of control. It is challenging to properly formulate the problem itself; the solution space is also higher dimensional. This is why most of the previous works on hybrid force-velocity control only analyzed simple systems with the robot itself (may include a firmly grasped object) and a rigid environment, without any free objects and more degree-of-freedoms.

In this work, we provide a hybrid servoing problem formulation that works for systems with more objects, along with an algorithm to efficiently solve it.
We quantify what it means for a constraint to be satisfied "robustly", and automate the control synthesis by formulating it as two optimization problems on the velocity/force controlled actions. The optimization automatically makes trade-offs between robustness and feasibility.
In particular, we show that the velocity controlled directions do not have to be orthogonal to the holonomic constraints, leaving space for more solutions. Being closer to orthogonal does have benefits; it is considered in the cost function.

The rest of the paper is organized as follows. In the next section we review the related works. In section 3, we introduce our modeling and problem formulation for hybrid servoing. In section 4, we describe our algorithm for solving hybrid servoing. In section 5 and 6, we provide a step by step analysis for one simple example, along with experimental results for several examples.

## RELATED WORK

### Hybrid Force-Velocity Control

The idea of using hybrid force-velocity control for manipulation under constraints can date back to 1980s.
Mason [mason1981compliance] introduced a framework for identifying force and velocity controlled directions in a task frame given a task description. Raibert and Craig [raibert1981hybrid] completed the framework and demonstrated a working system.
Yoshikawa [yoshikawa1987dynamic] investigated hybrid force-velocity control in joint space under Cartesian space constraints, and proposed to use gradient of the constraints to find the normal of the constraint surface in the robot joint space.
There are also works on modeling the whole constrained robot system using Lagrange dynamics, such as analyzing the system stability under hybrid force-velocity control [mcclamroch1988feedback], or performing Cartesian space tracking for both positions and forces [mills1989force]. Most of these works modeled only the robot and a rigid environment without any un-actuated degree-of-freedoms in the system. As an exception, Uchiyama and Dauchez performed hybrid force-velocity control for a particular example: two manipulators contacting one object [uchiyama1988symmetric].

There are lots of works on how to implement hybrid force-velocity controls on manipulators. For example, stiffness control can be used for this purpose. Velocity control is essentially a high stiffness control; force control can be implemented by low stiffness control with force offset.
Salisbury [salisbury1980active] described how to perform stiffness control on arbitrary Cartesian axes with a torque-controlled robot.
Raibert and Craig [raibert1981hybrid] divided Cartesian space into force/velocity controlled parts, then controlled them with separated controllers.
The impedance control [hogan1985impedance]  and operational space control [khatib1987unified] theory provided detailed analysis for regulating the force related behaviors of the end-effector for torque-controlled robots. Maples and Becker described how to use a robot with position controlled inner loop and a wrist-mounted force-torque sensor to do stiffness control on Cartesian axes [maples1986experiments]. Lopes and Almeida enhanced the impedance control performance of industrial manipulators by mounting a high frequency 6DOF wrist [lopes2008force]. Whitney [whitney1987historical] and De Schutter [de1998force] provided overviews and comparisons for a variety of force control methods.

### Motion Planning through Contacts

Recently, a lot of works tried to solve manipulation under constraints without explicitly using force control. For holonomic constraints, De Schutter *et al.* proposed a constraint-based motion planning and state estimation framework [de2007constraint]. Berenson *et al.* did motion planning on the reduced manifold of the constrained state space [berenson2009manipulation]. For non-holonomic constraints, the most popular example is pushing [lynch-mason-pushing, zhou2016convex, dogar2011framework]. Chavan-Dafle *et al.* performed in-hand manipulation by pushing the object against external contacts [prehensile]. In these works, the robots interacted with the objects in a way that force control was not necessary.

## MODELING \& PROBLEM FORMULATION

First of all, we introduce how we model a hybrid servoing problem. We adopt quasi-static assumption throughout the work, *i.e.* inertia force and Coriolis force are negligible. All objects and the robot are rigid. A motion trajectory is available such that the goal for our algorithm at any time step can be given as instantaneous velocities. All analysis in this section and the next section are conducted for one time step.
For consistency with previous works, we reuse several concepts from [mason1981compliance] such as *natural constraints* and *artificial constraints*. To better suit a more general problem formulation, we extend the meanings of these terms when necessary, much to the second author's consternation.

### Symbols

Consider a system of rigid bodies including the robot and at least one object. Denote $q\in \mathbb{R}^{n_q}$ as the configuration of the whole system. Denote $\tau\in \mathbb{R}^{n_q}$ as the corresponding force variable (internal forces), *i.e.* if $q$ denotes joint angles, $\tau$ denotes joint torques. Although the configuration space is enough to encode the state of the system, its time derivative may not make sense as a velocity, *e.g.* when $q$ contains quaternions. We describe the system velocity in a different space, the selection of the variables is usually called the "generalized variables".

Denote $v=[v^T_u\  v^T_a]^T \in \mathbb{R}^{n}$ as the generalized velocity. We pick the variables of $v$ in such an order that the first $n_u$ elements $v_u\in\mathbb{R}^{n_u}$ denote the uncontrolled (free) dimensions in the system, such as the velocity of an object; the last $n_a$ elements $v_a\in\mathbb{R}^{n_a}$ represent the degrees-of-freedom of the robot actuation.
$v\ne \dot q$ in general, but is related to $\dot q$ by a linear transformation:  $\dot q=\Omega(q)v$, where $\Omega(q)\in \mathbb{R}^{n_q\times n}$.

Denote $f=[f^T_u\ f^T_a]^T\in\mathbb{R}^{n}$ as the generalized force vector (the internal force). The product of $f$ and $v$ is the work done by the robot. Note that the uncontrolled part of $f$ is always zero: $f_u=0$. In the following we will do most of our analysis in the language of generalized variables.

### Goal Description

The goal for our control at a time step is an affine constraint on the generalized velocity:

$$
Gv=b_G.
$$

The goal (1) could be a desired generalized velocity, in which case $G=I$.
The goal may also only involve some entries of $v$. For example, in regrasping problems people only care about the in-hand pose of the object; the pose of the hand can be set free to allow for more solutions.
If a motion trajectory is available, the desired velocity can be obtained from its time derivatives.

### Natural Constraints

The law of physics constrains the system in many ways. These constraints will never be violated, no matter what actions the robot takes. We call them the *natural constraints*.  Our definition of the natural constraints includes holonomic constraints and the Newton's second law. The original definition in [mason1981compliance] did not contain the Newton's second law, because it is of no significance for fully actuated systems.

#### Holonomic Constraints

Holonomic constraints are bilateral constraints on $q$ that are also independent of $\dot q$. Examples are persistent contact constraints and sticking contact constraints. We describe them by

$$
\Phi(q)=0,
$$

where $\Phi(q)\in \mathbb{R}^{n_\Phi}$. Its time-derivative gives the constraint on instantaneous velocity:

$$
J_\Phi(q)\dot q=J_\Phi(q)\Omega(q)v=0.
$$

If an action attempts to violate a holonomic constraint, *e.g.* pressing an object against a table, a reaction force will emerge to maintain the constraint.
Denote $\lambda\in \mathbb{R}^{n_\Phi}$ as the reaction forces for $\Phi(q)$.
Its positive direction is determined by how we define $\Phi(q)$: when both $\delta\Phi$ and reaction force $\lambda$ are positive, they make positive work. Be careful when applying the rule to the contact forces between two movable objects, as the force would have a different direction for each body.
The contribution of $\lambda$ to the joint torque can be computed from the principle of virtual work [villani2008force]:
$$\tau_\lambda=J^T_\Phi(q)\lambda,
$$
project $\tau_\lambda$ into the space of generalized force:
$$

f_\lambda=\Omega^T(q)\tau_\lambda=\Omega^T(q)J^T_\Phi(q)\lambda
$$

#### Newton's second law

For systems that are not fully-actuated, Newton's second law becomes necessary.
Denote $F \in \mathbb{R}^{n}$ as the external force (gravity, magnetic force, *etc.*) in the generalized force coordinates.
Newton's second law requires the sum of all the forces in the system to be zero:

$$
\Omega^T(q)J^T_\Phi(q)\lambda + f + F = 0
$$

The three terms are contact reaction forces, control actions (internal forces) and external forces, respectively.

### Velocity controlled actions and holonomic constraints

<div align="center"><img src="media/example_1.png" alt="Relation between velocity commands and holonomic natural constraints. The robot (blue) has a velocity controlled joint a" width="80%"></div>

*Figure: Relation between velocity commands and holonomic natural constraints. The robot (blue) has a velocity controlled joint and a force controlled joint, which are orthogonal to each other. The table provides a natural constraint that stops the object from moving down. Assume no collision between the robot and the table. Systems in the left and middle are feasible. The right system is infeasible.*

In some works of quasi-static analysis, the rows of Newton's second law for velocity controlled dimensions are ignored because the forces have no influence on other parts of the system, as shown in Fig. 1, left. We keep these rows in (5), because the axes of velocity commands may not lie completely in the null space of natural constraints, then the force generated from a velocity command would matter in the force computation of the system. One such system is illustrated in Fig. 1, middle.

An interesting question is, can we set velocity commands in any directions? One apparent fact is that the velocity action must not fight against the natural constraints, e.g. trying to push against a wall (Fig. 1, right). Mathematically it means the system of linear equations formed by the natural constraints and velocity commands is infeasible.
The velocity controlled directions are thus preferred to overlap less with the natural constraints, more with its null space, so that the system of equations will be less likely to become infeasible under disturbances. If the system is holonomic, *i.e.* fully actualized, the velocity commands can be chosen from within the null space of the natural constraints [yoshikawa1987dynamic]. This is not always possible in general.

<div align="center"><img src="media/example_2.png" alt="Relation between different velocity commands. The blue robot and green robot are applying different velocity commands on" width="80%"></div>

*Figure: Relation between different velocity commands. The blue robot and green robot are applying different velocity commands on the object. Assume no collision between the two robots. Systems in the left and middle figures are feasible. The right system is infeasible.*

We can do the same analysis among different velocity commands. As shown in Fig. 2, different velocity controlled directions in generalized velocity space should not be co-linear. The system would be more robust to disturbances if the velocities are more perpendicular to each other.

### Guard Conditions

A contact may be in one of three modes: sliding, sticking or not contacting. A motion plan usually assumes a certain contact mode for each contact at any given time.
In hybrid control theory, the term *guard conditions* refers to conditions for transitions between discrete modes. In our problem, we also need to apply guard conditions to make sure our robot action will maintain the contact modes in the motion plan.

In this work, we consider guard conditions that can be expressed as linear (or affine) constraints on force variables. Examples of this type are friction cone constraints and lower/upper bounds on forces.

$$
\Lambda\left[ {\begin{array}{*{20}{c}}
\lambda\\
f
\end{array}} \right] \le {b_\Lambda},\ \ \ \ \Gamma\left[ {\begin{array}{*{20}{c}}
    \lambda\\
    f
    \end{array}} \right] = {b_\Gamma}.
$$

### Problem Formulation

To clearly describe the actions, we introduce *transformed generalized velocity* $w=[w^T_u\ w^T_{af}\ w^T_{av}]^T\in\mathbb{R}^{n}$, where $w_u=v_u$ is the un-actuated velocity, $w_{af}\in \mathbb{R}^{n_{af}}$ is the velocity in the force controlled directions, $w_{av}\in\mathbb{R}^{n_{av}}$ is the velocity controlled actions. Denote $\eta=[\eta^T_u\ \eta^T_{af}\ \eta^T_{av}]^T\in\mathbb{R}^{n}$ as the *transformed generalized force*, where $\eta_u=f_u=0$ is the un-actuated force, $\eta_{af}\in \mathbb{R}^{n_{af}}$ is the force controlled actions, $\eta_{av}\in\mathbb{R}^{n_{av}}$ is the force in the velocity controlled directions. The action space of the robot is $(w_{av},\eta_{af})$.

We use matrix $T$ to describe the directions of force/velocity controlled axes: $w=Tv$, $\eta=Tf$.
$T=diag(I_u, R_a)\in \mathbb{R}^{n\times n}$, where $I_u\in \mathbb{R}^{n_u\times n_u}$ is an identity matrix, $R_a\in \mathbb{R}^{n_a\times n_a}$ is an invertible matrix (not necessarily orthogonal).

Now we are ready to define the hybrid servoing problem mathematically. At any time step during the execution of a motion plan, the task of hybrid servoing is to find out:

- the dimensions of force controlled actions and velocity controlled actions, $n_{af}$ and $n_{av}$, and
- the directions to do force control and velocity control, described by the matrix $T$, and
- the magnitude of force/velocity actions: $\eta_{af}$ and $w_{av}$,

such that:

- the goal (1) is satisfied as a result of velocity controlled actions and holonomic constraints (2);
- the guard conditions (6) are satisfied as a result of force controlled actions and the Newton's law (5).

Usually the problem described above has more than one solution. As discussed in section 3.4, we prefer velocity commands that are perpendicular to each other, and are close to the null space of holonomic natural constraints.

Under this formulation, the satisfaction of goals is ensured by velocity controlled actions, which are accurate and immune to force disturbances; the holonomic natural constraints are satisfied by selecting non-conflicting directions for velocity controlled actions, it won't be easy for a disturbance to make them conflict again. The guard conditions are basically maintaining contacts, which do not require the force controlled actions to be super precise. These are the keys to the robustness of our method.

## APPROACH

Now we introduce an algorithm to efficiently solve the problem defined in section 3.6. The algorithm first solves for velocity commands, during which the dimensions and directions of both velocity control and force control are also determined. Then we fix the directions and solve for force controlled actions.

### Solve for Velocity Controlled Actions

In this section, we design the velocity command (solve for $n_{af}, n_{av}, T$ and $w_{av}$), so as to satisfy all the velocity-level conditions.
We use a $n_{av}\times n$ selection matrix $S_{av}$ to select the velocity commands out of the generalized variables: $w_{av}=S_{av}w$. Equations of interest to this section are:
(Use $\dot q=\Omega v, w=Tv$, omitting argument $q$)

- Holonomic natural constraint $J_\Phi\Omega v=0$. Denote $N=J_\Phi\Omega$, the constraint becomes $Nv=0$;
- Goal condition $Gv=b_G$;
- Velocity command $S_{av}Tv=w_{av}$. Denote $C=S_{av}T$, $b_C=w_{av}$, rewrite the velocity command as $Cv=b_C$.

Denote the solution set of each equation as $Sol(N), Sol(G)$ and $Sol(C)$. We need to design the velocity command $C,\ b_C$ such that the resulted solution space (the solution set of natural constraints and velocity commands) becomes *a non-empty subset of the desired generalized velocities* (the solution set of natural constraints and goal condition):

$$
Sol(N\&C)\ \in\ Sol(N\&G)
$$

#### Determine dimensions of velocity control

Denote $r_N={\rm rank}(N), r_{NG}={\rm rank}(\left[ {\begin{array}{*{20}{c}}{N }\\G\end{array}}\right])$. The minimum number of independent velocity control we must enforce is

$$
{n^{\min}_{av}} = r_{NG}-r_N.
$$

This condition makes sure the dimension of $Sol(N\&C)$ is smaller or equal to the dimension of $Sol(N\&G)$, so that their containing relationship becomes possible. Physically it means the velocity commands need to reduce enough degree-of-freedoms from the null space of the natural constraints. The maximum number of independent velocity commands we can enforce is

$$
n^{\max}_{av} = n - r_N={\rm Dim}({\rm null}(N)),
$$

where ${\rm null}(N)$ denotes the null space of $N$. This condition ensures the system will not be overly constrained to have no solution.
We choose the minimal number of necessary velocity constraints:

$$
n_{av}=n^{\min}_{av} =r_{NG}-r_N.
$$

This choice makes it easier for the system to avoid jamming. As will be shown in the next section, it also leaves more space for solving force controlled actions.

#### Solve for directions and magnitude

With our choice of $n_{av}$, we know ${\rm rank}([N; C])={\rm rank}([N; G])$. Then the condition $Sol(N\&C)\ \in\ Sol(N\&G)$ implies

$$
Sol(N\&C)\ =\ Sol(N\&G),
$$

*i.e.* the two linear systems share the same solution space. (11) can be achieved by firstly choosing $C$ such that the homogeneous linear systems $\left[ {\begin{array}{*{20}{c}}N\\C\end{array}} \right]v = 0$ and $\left[ {\begin{array}{*{20}{c}}N\\G\end{array}} \right]v = 0$
become equivalent (share the same solution space). Compute a basis for the solution of $[N^T G^T]^Tv=0$: $[\sigma_1,...,\sigma_{n-r_{NG} }]$, then we just need to ensure $C$ satisfies:

$$
C\sigma_i=0,\ \  i=1,...,n-r_{NG}
$$

Then we can compute $b_C$ from any specific solution of $\{Nv=0, Gv=b_G\}$. The original non-homogeneous systems then become equivalent.

Beside equation (12), we have a few more requirements/preferences on $C$ based on the discussions in section 3.4:

- Rows of $C$ must be linearly independent from each other. And we prefer to have them as orthogonal to each other as possible.
- Each row of $C$ is also independent from rows of the holonomic natural constraint $N$. We prefer to pick the rows as close to ${\rm null}(N)$ as possible.

To solve for $C$, denote $c^T\in \mathbb{R}^{1\times n}$ as any row in $C$. From $C=S_{av}T$ we know the first $n_u$ columns in $C$ are zeros, rewrite this and equation (12) as a linear constraint on $c$:

$$
\left[ {\begin{array}{*{20}{c}}{\begin{array}{*{20}{c}}{\sigma _1^T}\\ \vdots \\{\sigma _{{n} - {n_{NG}}}^T}\end{array}}\\{\left[ {\begin{array}{*{20}{c}}{{I_{{n_u}}}}&{{{\bf{0}}_{{n_u} \times {n_a}}}}
\end{array}} \right]}\end{array}} \right]c  = \left[ {\begin{array}{*{20}{c}}
0\\ \vdots \\0\end{array}} \right]
$$

Its solution space has dimension of $n_c = n_a - n + r_{NG} = r_{NG} - n_u$. Since we need $n_{av}$ independent constraints, we require $n_c=r_{NG}-n_u \ge n_{av}=r_{NG}-r_N$, which gives $r_N\ge n_u $, *i.e.*

$$
r_N+n_a\ge n.
$$

For our method to work, (14) says it must be possible for the actions and constraints to fully constrain the system.
Denote matrix $\mathbb{B}_c=[c^{(1)}\ \cdots\ c^{(n_c)}]$ as a basis of the solution space of equation (13). Denote ${\rm Null}(N)$ as a basis of ${\rm null}(N)$.
We can find a $C$ that satisfies all the conditions by solving the following optimization problem:

$$
\begin{array}{l}
\mathop {\min }\limits_{{{\bf{k}}_1}, \cdots ,{{\bf{k}}_{{n_{av}}}}} \sum\limits_{i \ne j} {||{c_i^T}c _j|{|}}  - \sum\limits_i {||{\rm Null}(N)^T c _i|{|}} \\
s.t.\;\;\,\;\;\,{c_i^T}c_i = 1,\;\;\,\forall i\\
\;\;\,\;\;\,\;\;\,\;\;\,{c _i} = \mathbb{B}_c{{\bf{k}}_i},\;\;\,\forall i
\end{array}
$$

The best velocity constraint $C^*=(\mathbb{B}_c\;[{\bf k_1\;\;\;...\;\; k_{n_{av}}}])^T$. The optimization problem (15) is non-convex because of the unit length constraint $c_i^Tc_i=1$. However, we can solve the problem numerically by projecting the solution back to the constraint after each gradient update:

- Start from a random ${\bf k=[{\bf k_1\;\;\;...\;\; k_{n_{av}}}]}$;
- Perform a gradient descent step: ${\bf k}\gets {\bf k} - t\nabla f$;
- Projection: ${\bf k_i}\gets \frac{\bf k_i}{||\mathbb{B}_c{\bf k_i}||},\;\;\;\;\forall i$;
- Repeat from step two until convergence.

Here $\nabla f$ is the gradient of the cost function reshaped to the same size as $\bf k$. $t=10$ is a step length. In practice, we run the projected gradient descent algorithm above with $N_s$ different initializations to avoid bad local minima.

After obtaining $C^*$, we know the last $n_{av}$ rows of $R_a$. Denote the last $n_a$ columns of $C^*$ as $R_{C^*}$, we can expand it into a full rank $R_a$:

$$
{R_a} = \left[ {\begin{array}{*{20}{c}}
{{\rm Null}{{({R_{C^*}})}^T}}\\
{{R_{C^*}}}
\end{array}} \right],
$$

it encodes the axes of the force controlled directions. Then we have $T=\rm{diag}(I_u, R_a)$.
The procedures are summarized in algorithm 1.
**Algorithm: Solve for velocity controlled actions**

1. Check condition (14) for feasibility.
2. Compute $n_{av}$ from equation (10).
3. Compute a basis of $[N^T G^T]^Tv=0$, plug in equation (13) and compute a basis $\mathbb{B}_c$.
4. Sample $N_s$ sets of coefficients ${\bf k}\in\mathbb{R}^{n_c\times n_{av}}$
5. **for** {each sample $\bf k$
    6. Solve the optimization problem (15).
    7. Compute $C=(\mathbb{B}_c{\bf k})^T$ from the solution.
    8. Compute the cost of $C$ from equation (15).
9. Pick the $C^*$ with lowest cost.
10. Use equation (16) to compute $R_a$. Then $T=\rm{diag}(I_u, R_a)$.
11. Compute one solution $v^*$ for $Nv=0, Gv=b_G$.
12. Compute $w_{av}=b_C=C^*v^*$.

### Solve for Force Controlled Actions

Next we compute the force command (solve for $\eta_{af}$) so as to satisfy all the force-level requirements.
Equations of interest to this section:
(Use $\eta=Tf$, omitting argument $q$)

- Newton's second law: express (5) in the transformed generalized force space:

$$
T\Omega^T(q)J^T_\Phi(q)\lambda + \eta + TF = 0.
$$

- Guard conditions: express them as constraints on $\lambda, \eta$:

$$
\Lambda\left[ {\begin{array}{*{20}{c}}\lambda \\f\end{array}} \right] = [{\Lambda_\lambda }\;\;\,{\Lambda_f}{T^{ - 1}}]\left[ {\begin{array}{*{20}{c}}\lambda \\\eta \end{array}} \right] \le {b_\Lambda}.
$$

$$
\Gamma\left[ {\begin{array}{*{20}{c}}\lambda \\f\end{array}} \right] = [{\Gamma_\lambda }\;\;\,{\Gamma_f}{T^{ - 1}}]\left[ {\begin{array}{*{20}{c}}\lambda \\\eta \end{array}} \right] = {b_\Gamma}.
$$

The unknowns are the force variables $\lambda, \eta$. Remember $\eta=[\eta_u, \eta_{af}, \eta_{av}]$. All the equality constraints ((17), (19) and our choice of $\eta_{af}$) will determine the value of all the forces; we need to make sure the resulted forces satisfy the inequality constraints (18).

Remember also $f_u=0$. Express it as $Hf=HT^{-1}\eta=0$. Combine $HT^{-1}\eta=0$, (17) and (19) into one constraint:

$$
\left[ {\begin{array}{*{20}{c}}{{0}}&{{H}{T^{ - 1}}}\\{T{\Omega ^T}J_\Phi ^T}&I\\\Gamma_\lambda&\Gamma_fT^{-1}\end{array}} \right]\left[ {\begin{array}{*{20}{c}}\lambda \\\eta \end{array}} \right] = \left[ {\begin{array}{*{20}{c}}{\bf{0}}\\{ - TF}\\b_\Gamma\end{array}} \right].
$$

Due to the limitation of rigid body modeling, the free forces may not have a unique solution given a force action $\eta_{af}$. Denote the free forces as $f_{free} = [\lambda^T\; \eta_u^T\; \eta_{av}^T]^T$, rewrite the constraints (20) and move $\eta_{af}$ to the right hand side, we find one solution for $f_{free}$ by penalizing the sum-of-squares norm of the free forces:

$$
\begin{array}{l}\mathop {\min }\limits_{f_{free}} \;\;\,f_{free}^Tf_{free}\\s.t.\;\;\,\;\;\,{M_{free}}f_{free} = \left[ {\begin{array}{*{20}{c}}
{\bf{0}}\\{ - TF}\\b_\Gamma\end{array}} \right] - {M_{{\eta _f}}}{\eta _f}.\end{array}
$$

This is a quadratic programming (QP) problem. Denote $f^*_{free}$ as the dual variables of $f_{free}$, the KKT condition says the solution to the QP can be found by solving the following linear system:

$$
\left[ {\begin{array}{*{20}{c}}{2I}&{M_{free}^T}\\{{M_{free}}}&{\bf 0}\end{array}} \right]\left[ {\begin{array}{*{20}{c}}f_{free}\\f_{free}^*\end{array}} \right] = \left[ {\begin{array}{*{20}{c}}{\bf 0}\\{\left[ {\begin{array}{*{20}{c}}{\bf{0}}\\{ - TF}\end{array}} \right] - {M_{{\eta _f}}}{\eta _f}}\end{array}} \right].
$$

This linear system uniquely determines the free forces given force action $\eta_{af}$. Rewrite it as

$$
\left[ {\begin{array}{*{20}{c}}{2I}&{M_{free}^T}&{\bf{0}}\\{{M_{free}}}&{\bf{0}}&{{M_{{\eta _f}}}}\end{array}} \right]\left[ {\begin{array}{*{20}{c}}f_{free}\\f_{free}^*\\\eta_{af}\end{array}} \right] = \left[ {\begin{array}{*{20}{c}}{\bf{0}}\\{ - TF}\end{array}} \right].
$$

This linear equation encodes the unique solution for Newton's law. Finally we solve (23) together with guard conditions (18) to compute all forces. The procedure is summarized in algorithm 2.
**Algorithm: Solve for force controlled actions**

1. From Newton's laws, write down $M_{free}, M_{\eta_{af}}$ in (21).
2. Write down coefficient matrices for equation (23).
3. Solve the linear programming problem (18)(23) for $\eta_{af}$.

## Example

Next we illustrate how our method works with a concrete example. Consider the "block tilting" task shown in Fig. 3. The robot hand is a point. The robot needs to tilt and flip a square block about one of its edges by pressing on the block's top surface. We use a simple motion plan: the robot hand moves along an arc about the rotation axis, and all contacts in the system are sticking. If we only use velocity control to execute the plan, the robot can easily get stuck since the modeling or perception of the block may not be perfect.

<div align="center"><img src="media/experiment_drawing_1.png" alt="Block tilting example. From left to right, the robot use one point contact to rotate the block." width="80%"></div>

*Figure: Block tilting example. From left to right, the robot use one point contact to rotate the block.*

### Variables

<div align="center"><img src="media/experiment_drawing_2.png" alt="illustration of the coordinate frames." width="80%"></div>

*Figure: illustration of the coordinate frames.*

Denote $W$, $H$ and $O$ as the world frame, the hand frame and the object frame respectively. In the following, we use the form of $^A_BX$ to represent a symbol of frame $B$ as viewed from frame $A$. We do Cartesian control for the robot, so we ignore the joints and only model the hand. The state of the system can be represented by the 3D pose of the object and the position of the hand as viewed in the world frame:

$$
{q}=[^W_Op^T,\ ^W_Oq^T,\ ^W_Hp^T]^T\in \mathbb{R}^{10}.
$$

Define the generalized velocity for the system to be the object body twist $^O_O\xi\in \mathbb{R}^6$ and the hand linear velocity $^W_Hv\in\mathbb{R}^3$:

$$
v=[^O_O\xi^T,\ ^W_Hv^T]^T\in\mathbb{R}^9.
$$

The benefit of choosing body twist over spatial twist for representing generalized velocity of rigid body is that the expression of the mapping $\dot q=\Omega(q) v$ becomes simple:

$$
\Omega ({\bf{q}}) = \left[ {\begin{array}{*{20}{c}}
{{^W_OR}}&{}&{}\\{}&{E({^W_Oq})}&{}\\{}&{}&{{I_H}}\end{array}} \right]\in \mathbb{R}^{10\times 9},
$$

where $^W_OR\in SO(3)$ denotes the rotation matrix for $^W_Oq$, $E(^W_Oq)$ is the linear mapping from the body angular velocity to the quaternion time derivatives [graf2008quaternions]:

$$
E(^W_Oq) = \frac{1}{2}\left[ {\begin{array}{*{20}{c}}
{ - {^W_Oq_1}}&{ - {^W_Oq_2}}&{ - {^W_Oq_3}}\\
{{^W_Oq_0}}&{ - {^W_Oq_3}}&{{^W_Oq_2}}\\
{{^W_Oq_3}}&{{^W_Oq_0}}&{ - {^W_Oq_1}}\\
{ - {^W_Oq_2}}&{{^W_Oq_1}}&{{^W_Oq_0}}
\end{array}} \right].
$$

The generalized force corresponding to our choice of generalized velocity is the object body wrench together with the hand pushing force:

$$
f=[^O_Ow^T,\ ^W_Hf^T]^T \in\mathbb{R}^9
$$

### Goal Description

In the motion plan, the object rotates about the line of contact on the table. The goal for control at any time step is to let the object follow this motion. Now we try to write down the generalized velocity for such motion.
Denote $^Wp_{tc}$ as the location of any point on the line of contact, $^W\omega_g$ as the axis of rotation, $\dot\theta_g$ as the desired object rotation speed. We can firstly write down the spatial twist for the object motion as $^W\xi_g=(-^W\omega_g\times ^Wp_{tc},\ ^W\omega_g)\dot\theta_g\in\mathbb{R}^6$. The corresponding body twist can be computed as

$$
^O\xi_g=Ad_{^W_Og^{-1}}{^W\xi_g}
$$

where $Ad_{^W_Og^{-1}} = \left[ {\begin{array}{*{20}{c}}{^W_OR^T}&{ - ^W_OR^T{^W_O{\hat p}}}\\0&{^W_OR^T}\end{array}} \right]$
is the adjoint transformation associated with $^W_Og^{-1}=\left[ {\begin{array}{*{20}{c}}{{^W_OR}}&{{^W_Op}}\\0&1\end{array}} \right]^{-1}$. Then the goal for our controller can be specified as

$$
G{\bf v}=b_G,
$$

where $G = \left[ {\begin{array}{*{20}{c}}{{I_6}}&0_{6\times3}\end{array}} \right],\;\;\,{b_G} = {^O\xi_g}.$

### Natural constraints

#### Holonomic constraints

The contact between the object and the hand  is a sticking point contact,  which constrains the system states by

$$
^W_OQ(^Op_{hc}) + ^W_Op = ^Wp_{hc},
$$

where $^Wp_{hc}, ^Op_{hc}$ denote the location of the contact point, function $^W_OQ(p)$ rotates vector $p$ by quaternion $^W_Oq$.

The contact between the object and the table is a sticking line contact. We approximate it with two point contacts at the two ends. Use subscript $tc$ to denote the table contacts, the sticking constraints can be approximated by requiring the two points to be sticking:

$$
{{^W_OQ}{(^O}{p_{tc,i}}) + {^W_Op}} { = }{^Wp_{tc,i}},\;\;\; i=1,2.
$$

Equation (31) and (32) together form the holonomic constraints for our system:

$$
\Phi ({{q}}) = \left[ {\begin{array}{*{20}{c}}
{^W_OQ(^Op_{hc}) + ^W_Op = ^Wp_{hc}}\\
{{^W_OQ}{(^O}{p_{tc,1}}) + {^W_Op}} { = }{^Wp_{tc,1}}\\
{{^W_OQ}{(^O}{p_{tc,2}}) + {^W_Op}} { = }{^Wp_{tc,2}}\end{array}} \right] = 0
$$

This example does not have face to face contacts; they can be handled similarly by multi-point-contacts approximation.

#### Newton's second law

The reaction forces $\lambda=[^W\lambda_{hc}^T,^W\lambda_{tc,1}^T,^W\lambda_{tc,2}^T]^T\in \mathbb{R}^9$ associated with the holonomic constraints (33) are the three contact forces as viewed in world frame. In Newton's second law (5):

$$
\Omega^T(q)J^T_\Phi(q)\lambda + f + F = 0
$$

$\Omega$ is known, $J_\Phi(q)$ is computed by symbolic derivation from $\Phi(q)$, we refrain from showing its exact expression to save pages. The external force $F$ contains the gravity of the object $G_O$ and the robot hand $G_H$, the reference frames of which should be consistent with the generalized force:

$$
F = \left[ {\begin{array}{*{20}{c}}{^O{G_O}}\\
0\\{^H{G_H}}\end{array}} \right] \in\mathbb{R}^9.
$$

$^HG_H$ should be zero if the robot force controller already compensates for self weight.

### Guard Conditions

The motion plan requires all contacts to be sticking. Coulomb friction thus gives two constraints on the force variables:

- The normal forces at all contacts must be greater than a threshold $n_{min}$.
- All contact forces must be within their friction cones.

To express 3D friction cone constraints linearly, we approximate the cone with eight-sided polyhedron [trjopt1] with $d_i=[\sin(\pi i/4),\ \cos(\pi i/4),\ 0]^T$ being the unit direction vectors for each ridge. Denote $\mu_{hc}, \mu_{tc}$ as the estimated minimal possible friction coefficient, $z=[0\ 0\ 1]^T$ as the unit $Z$ vector, the friction cone constraints becomes

$$
\begin{array}{l}
{\mu _{hc}}{z^T}(_W^OR{^W\lambda _{hc}}) \ge d_i^T(_W^OR{^W\lambda_{hc}}),\;\;\,\;\;\,i = 1,...,8\\
{\mu _{tc}}{z^T}{^W\lambda _{tc,1}} \ge d_i^T{^W\lambda _{tc,1}},\;\;\,\;\;\,i = 1,...,8\\
{\mu _{tc}}{z^T}{^W\lambda _{tc,2}} \ge d_i^T{^W\lambda _{tc,2}},\;\;\,\;\;\,i = 1,...,8
\end{array}
$$

The normal force lower bound can be written as

$$
\begin{array}{l}
{z^T}({_W^OR}{^W\lambda _{hc}}) \ge {n_{\min }}\\
{z^T}^W{\lambda _{tc,1}} \ge {n_{\min }}\\
{z^T}^W{\lambda _{tc,2}} \ge {n_{\min }}
\end{array}
$$

Equation (35) and (36) are affine constraints on $\lambda$, together they form the guard condition (6).

### Solve the problem

At each time step, given the object and the hand poses we can use algorithm 1 and 2 to solve for the hybrid force-velocity control numerically. You can find our Matlab implementation of the step by step derivations in our GitHub repository (see section 6.1).

Here we briefly describes the solved actions. The solution to the block tilting problem has one dimensional velocity controlled action, which points in the tilting direction and is roughly perpendicular to the line from the hand to the rotation axis. The other two dimensions are under force control. The $Y$ component of the force command is close to zero, which makes sense as forces in $Y$ direction don't do anything useful. The force in other component is roughly pressing against the rotation axis to maintain sticking.

## EXPERIMENTS

<div align="center"><img src="media/experiment_photo_1.png" alt="Our experiment setup. Left: block tilting. Right: tile levering-up." width="80%"></div>

*Figure: Our experiment setup. Left: block tilting. Right: tile levering-up.*

We implemented two example tasks: block tilting (section 5) and tile levering-up. In the tile levering-up example, the robot need to pivot the object up against a corner in a box. The object is modeled as a cuboid. During the motion, the contacts between the object and the corner are sliding, while the contact between the object and the robot is sticking.

In the block tilting task, the object is a wooden block with edge length 75mm. We place a 2mm-thick piece of cloth on the table to introduce some passive compliance as well as increasing friction. In the tile levering-up example, the object is placed at a corner of a plastic box, which is fixed in space. We experimented with a variety of objects.
The robot hand is a metal bar with a rubber ball installed on the tip to increase friction.

We implemented our algorithm 1 and 2 in both Matlab and C++. The projected gradient descent is the most time-consuming part of our algorithm. With $N_s = 3$ initial guesses, the C++ code can solve the block tilting problem in 35ms, solve the levering-up problem in 25ms. The Matlab version is on average 10x slower.

The control computed by our algorithm can be implemented in many ways. We implemented hybrid force-velocity control with position-control inner loop according to [maples1986experiments], and added functionality for choosing axes in any orientation. We used an ABB IRB 120 robot arm with 250Hz communication (but with 25ms latency), and a wrist-mounted force torque sensor, ATI Mini-40, to measure contact forces at 1000Hz.

We ran the block tilting task 50 times in a row (You can find the 25min video at [https://youtu.be/YIP8xIFATHE](https://youtu.be/YIP8xIFATHE)). Each run contains 15 time steps. The robot successfully tilted the block 47 times. The three failures were all stopped prematurely because the robot detected large force (about 25N on the FT sensor) at a time step. The reason could be a bad solution from our algorithm, or the instability of our force control implementation.

We ran the tile levering-up task for about 20 times on different objects. The successful rate is about two-thirds. The failures are caused by unexpected sticking between the object and the wall, or unexpected slipping between the robot hand and the object. One important reason for these failures is the slow response of the low level force control: the commanded positive contact normal force were tracked with large errors, which could surely be improved with better engineering. We did observe that the failures are less likely to happen if the robot moved slower.

### Resources

The Matlab implementation of the two algorithms along with several examples can be obtained from [https://github.com/yifan-hou/pub-icra19-hybrid-control](https://github.com/yifan-hou/pub-icra19-hybrid-control).

## DISCUSSION AND FUTURE WORK

For a hybrid force-velocity control problem, people might be able to manually design a control strategy that works just fine. We insist that our method is valuable, because we can automate the process for new problems without manual design. Moreover, we can solve some problems that are unintuitive for a human.

<div align="center"><img src="media/experiment_drawing_3.png" alt="Illustration of the bottle rotation problem." width="80%"></div>

*Figure: Illustration of the bottle rotation problem.*

For example, consider the bottle rotation problem as shown in Fig. 6, left. Use a robot to press on its top surface with a face to face contact. If you apply force properly, you can tilt the bottle and rotate it on the table. The control strategy is not straightforward, since it involves hybrid actions in 6D wrench space. The Matlab code for solving this problem is also available in our GitHub repository. Unfortunately we don't have time to implement it on a robot.

Our method has several limitations. Firstly, we haven't consider non-holonomic constraints in our current formulation. Secondly, the algorithm 1 could get stuck in a bad local minimum. The only way of avoiding it is to sample more initial points, which increases computation time. Finally, the cost functions proposed in this work are largely based on our intuition. The exact conditions for maintaining contact modes are not completely clear. Although they seem to work empirically, a better understanding of contact mechanics may lead to a more reliable hybrid servoing algorithm.
