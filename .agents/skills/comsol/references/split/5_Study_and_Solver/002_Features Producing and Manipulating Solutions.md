# *Features Producing and Manipulating Solutions*

Table 6-1 is an overview of the available features for producing and handling solution objects.

TABLE 6-1: SOLUTION OBJECT FEATURES.

| FEATURE                       | PURPOSE                                                                                         |
|-------------------------------|-------------------------------------------------------------------------------------------------|
| Assemble                      | Assembles and stores the matrices generated during assembly                                     |
| AWE                           | Solve parametric problem with asymptotic waveform evaluation                                    |
| CombineSolution               | Combine solutions by concatenation or summation                                                 |
| CopySolution                  | Copy solution                                                                                   |
| Eigenvalue                    | Solve eigenvalue problem                                                                        |
| EigenvalueAttrib              | Eigenvalue solver attribute to Sensitivity and Optimization solvers                             |
| EigenvalueParam               | Solve parametric eigenvalue problem                                                             |
| FFT                           | Perform a forward or inverse fast Fourier transform (FFT or IFFT)                               |
| InputMatrix                   | Input matrices or vectors (for example, load vectors or stiffness matrices) to a<br>solver      |
| Modal                         | Solve time-dependent or parametric problem with modal analysis                                  |
| ModalReduction                | Solve time-dependent or parametric problem with modal reduction                                 |
| Optimization                  | Solve optimization problem                                                                      |
| PlugFlow                      | Solve stationary plug flow problem                                                              |
| ProperOrthogonalDecomposition | Solve time-dependent or frequency-domain problem with POD reduction                             |
| StateSpace                    | Assembles and stores matrices that describe a model as a dynamic system                         |
| Stationary                    | Solve stationary problem                                                                        |
| StudyStep                     | Specifies which problem to compile                                                              |
| Time                          | Solve time-dependent problem with implicit or explicit time stepping                            |
| TimeDiscrete                  | Solve time-dependent problem with user's own time stepping                                      |
| TimeExplicit                  | Solve time-dependent problem with explicit time stepping                                        |
| Variables                     | Handle variables solved for (initial values, scaling) and not solved for (prescribed<br>values) |

Table 6-2 is an overview of the available features for solver settings.

TABLE 6-2: SOLVER SETTING FEATURES.

| FEATURE                       | SETTINGS HANDLED                                                  |  |
|-------------------------------|-------------------------------------------------------------------|--|
| Adaption                      | Adaptation subfeature (created by the study step)                 |  |
| Advanced                      | Advanced general settings                                         |  |
| AutoRemesh                    | Automatically remesh deformed geometries                          |  |
| ControlField                  | Control fields (a set of control variables)                       |  |
| ControlState                  | Set of global control variables                                   |  |
| Field                         | Fields (a set of dependent variables)                             |  |
| FullyCoupled                  | Fully coupled nonlinear solution approach                         |  |
| HardwareAcceleration          | Hardware acceleration using GPU for dG-based transient acoustics. |  |
| LowerLimit                    | Lower limits.                                                     |  |
| LumpedStep                    | Lumped steps.                                                     |  |
| Parametric                    | Parameter stepping                                                |  |
| Previous Solution             | Previous solution solvers                                         |  |
| Segregated                    | Segregated nonlinear solution approach                            |  |
| SegregatedStep                | Segregated steps                                                  |  |
| Sensitivity                   | Sensitivity analysis                                              |  |
| StatAcceleration              | Stationary acceleration                                           |  |
| StopCondition                 | Stop conditions                                                   |  |
| TimeAdaption                  | Time-dependent adaptive mesh refinement                           |  |
| UpperLimit                    | Upper limits.                                                     |  |
| See Linear for the following: |                                                                   |  |
| Direct                        | Direct linear system solvers                                      |  |
| DirectPreconditioner          | Direct linear system solvers as preconditioners                   |  |
| DomainDecomposition           | Domain decomposition solver (Schwarz)                             |  |
| DomainDecompositionSchur      | Domain decomposition solver (Schur)                               |  |
| HierarchicalLU                | Hierarchical LU linear system preconditioner (for BEM)            |  |
| IncompleteLU                  | Incomplete factorization preconditioners                          |  |
| Iterative                     | Iterative linear system solvers                                   |  |
| Jacobi                        | Jacobi linear system preconditioners                              |  |
| KrylovPreconditioner          | Krylov linear system preconditioners                              |  |
| SchurKrylovPreconditioner     | Krylov linear system preconditioners for a Schur solver           |  |
| Multigrid                     | Multigrid linear system preconditioners                           |  |
| SCGS                          | SCGS linear system preconditioners                                |  |
| SOR                           | SOR linear system preconditioners                                 |  |
| SORGauge                      | SOR Gauge linear system preconditioners                           |  |
| SORLine                       | SOR Line linear system preconditioners                            |  |
| SORVector                     | SOR Vector linear system preconditioners                          |  |
| SchurLocal                    | Localized Schur solver                                            |  |
| SchurSpLocal                  | Sparse localized Schur solver                                     |  |

TABLE 6-2: SOLVER SETTING FEATURES.

| FEATURE | SETTINGS HANDLED                    |
|---------|-------------------------------------|
| State   | Sets of global dependent variables  |
| Vanka   | Vanka linear system preconditioners |

