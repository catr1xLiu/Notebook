# *ModalReduction*

Solve parametric or time-dependent problem using modal reduction.

#### **SYNTAX**

model.sol(sname).create(fname,"ModalReduction") model.sol(sname).feature(fname).set(pname,pvalue)

## **DESCRIPTION**

Operation feature. The following properties are accepted:

TABLE 6-53: VALID MODAL PROPERTIES FOR THE MODAL REDUCTION.

| PROPERTY            | VALUE                                | DEFAULT         | DESCRIPTION                                                                                                                                                          |
|---------------------|--------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| analysistype        | frequency  <br>transient             | frequency       | Solve for frequency response or transient<br>response.                                                                                                               |
| clist               | String array                         |                 | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname.<br>See The clist and cname Properties. |
| cname               | String array                         |                 | Provide names of constants as input<br>parameters using a string array; for the<br>corresponding constant values, use clist. See<br>The clist and cname Properties.  |
| constrmodes         | array of integers                    |                 | The constraint modes to use, if<br>constrmodeselection is set to manual.                                                                                             |
| constrmodeselection | all   manual                         | all             | The constraint modes to use.                                                                                                                                         |
| constrsol           | solution object or none              |                 | The solution to use for the constraint modes.                                                                                                                        |
| constrsoluse        | current   manual  <br>solution store | current         | Subsolution to use for the constraint modes.                                                                                                                         |
| control             | String                               | user            | Name of the controlling study step or user if<br>the feature is controlled manually.                                                                                 |
| eigensoluse         | current   manual  <br>solution store | current         | Subsolution to use for the eigenmodes.                                                                                                                               |
| eigsol              | solution object                      |                 | Precomputed eigenpairs (or other vectors) to<br>be used in the modal analysis.                                                                                       |
| initialdataextend   | automatic   true  <br>false          | automatic       | Extend basis with initial data. For automatic,<br>it is done only if it is large enough to make a<br>difference.                                                     |
| keeplog             | on   off                             | off             | Keep warnings in stored log.                                                                                                                                         |
| linearity           | false   linper                       | false           | Use linear linearity or a linear perturbation<br>when analysistype has been set to<br>frequency.                                                                     |
| linplistsolnum      | Integer array                        | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to<br>from_list.                                                                     |

TABLE 6-53: VALID MODAL PROPERTIES FOR THE MODAL REDUCTION.

| PROPERTY         | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                                                                             |
|------------------|------------------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| linpmanualsolnum | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual.                                                     |
| linpmethod       | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.                                                                 |
| linpsol          | zero   solution object                                                             | zero            | Linearization point solution.                                                                                                                           |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1               | Indices to solutions to use as linearization<br>points.                                                                                                 |
| linpsoluse       | current   manual  <br>solution store                                               | current         | Subsolution that defines linearization point for<br>the Eigenvalue study step.                                                                          |
| linpsolusesolnum | integer                                                                            |                 | Index for the solution to use when<br>linpsoluse is set to manual.                                                                                      |
| linpt            | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                                                                     |
| message          | String                                                                             |                 | The log message from the last solution<br>process.                                                                                                      |
| modes            | integer vector                                                                     | all             | Participating modes.                                                                                                                                    |
| modeselection    | all   manual                                                                       | all             | The eigenpairs to use.                                                                                                                                  |
| outsollinearized | du   u                                                                             | du              | Store the total solution (u) or deviation and<br>linearization point (du), when analysistype<br>is set to frequency and storelinpoint is<br>set to off. |
| plist            | scalar   numeric<br>vector                                                         |                 | Frequency list. Only applicable when<br>analysistype has been set to frequency.                                                                         |
| pname            | vector of strings                                                                  |                 | Parameter names.                                                                                                                                        |
| pout             | plist   fraction  <br>spread                                                       | plist           | Use plist as it stands or modify in relation to<br>the participating modes.                                                                             |
| romdata          | String                                                                             | new             | Tag of the target container for the reduced<br>model (new for a new reduced model).                                                                     |
| rominterf        | stateless  <br>stateful                                                            | stateless       | The reduced-order model interface if<br>romdata is set to new.                                                                                          |
| romReconstruct   | true   false                                                                       | true            | Enable reconstruction in the produced<br>reduced model.                                                                                                 |
| rtol             | scalar                                                                             | 0.01            | Relative tolerance. Only applicable when<br>analysistype has been set to transient.                                                                     |
| soltypemat       | on   off                                                                           | off             | Store reduced-model matrices.                                                                                                                           |
| soltypeonline    | on   off                                                                           | off             | Create a reduced model.                                                                                                                                 |
| soltypesol       | on   off                                                                           | on              | Perform frequency sweep or transient<br>simulation using the modal solver.                                                                              |
| storelinpoint    | on   off                                                                           | off             | Whether to store the linearization point.                                                                                                               |
| tlist            | scalar   numeric<br>vector                                                         |                 | Time list. Only applicable when<br>analysistype has been set to transient.                                                                              |
| usesens          | true   false                                                                       | false           | If set to true, the sensitivity solution (when<br>available) is used as constraint modes.                                                               |

In addition, the following properties are available for exporting matrices and vectors:

TABLE 6-54: VALID MODAL PROPERTIES FOR MATRIX AND VECTOR EXPORT FROM THE MODAL SOLVER.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                              |
|----------|----------|---------|----------------------------------------------------------|
| AllL     | on   off | off     | All load vectors, frequency.                             |
| B0r      | on   off | off     | Reduced initial value input matrix, transient.           |
| B0rdot   | on   off | off     | Reduced initial time derivative input matrix, transient. |
| Br       | on   off | off     | Reduced input matrix, transient and frequency.           |
| Brdot    | on   off | off     | Reduced time derivative input matrix, transient.         |
| Brdotdot | on   off | off     | Reduced second time derivative input matrix, transient.  |
| C        | on   off | off     | Output matrix (state space).                             |
| C_c      | on   off | off     | Constrained part of output matrix.                       |
| Clmap    | on   off | off     | Constraint modes to inputs map.                          |
| Cr       | on   off | off     | Reduced output matrix, transient and frequency.          |
| D        | on   off | off     | Input feedback matrix (state space).                     |
| DPartSol | on   off | off     | Damping matrix times particular solution, frequency.     |
| Dr       | on   off | off     | Reduced damping matrix, transient and frequency.         |
| Dr_c     | on   off | off     | Constrained part of damping matrix.                      |
| Dra      | on   off | off     | Damping ratio matrix, transient and frequency.           |
| Dra_c    | on   off | off     | Constrained part of damping ratio matrix.                |
| EPartSol | on   off | off     | Mass matrix times particular solution, frequency.        |
| Er       | on   off | off     | Reduced mass matrix, transient and frequency.            |
| Er_c     | on   off | off     | Constrained part of mass matrix.                         |
| F        | on   off | off     | Input feedback, transient and frequency.                 |
| Kr       | on   off | off     | Reduced stiffness matrix, transient and frequency.       |
| Kr_c     | on   off | off     | Constrained part of stiffness matrix.                    |
| Kud      | on   off | off     | Stiffness matrix times ud, transient.                    |
| L        | on   off | off     | Load vector, transient and frequency.                    |
| MA       | on   off | off     | Stiffness matrix (state space).                          |
| MA_c     | on   off | off     | Constrained part of stiffness matrix.                    |
| MB       | on   off | off     | Input matrix (state space).                              |
| Mc       | on   off | off     | Mass matrix (state space).                               |
| Mc_c     | on   off | off     | Constrained part of mass matrix.                         |
| Pm       | on   off | off     | Projection matrix, transient and frequency.              |
| U0       | on   off | off     | Initial value vector, transient.                         |
| ud       | on   off | off     | Particular solution (state space).                       |
| Udot0    | on   off | off     | Initial derivative vector, transient.                    |
| x0       | on   off | off     | Initial value (state space).                             |
| Y0       | on   off | off     | Output bias, transient and frequency.                    |

The reduced matrices are the matrices that result from the elimination of constraints in the discretized model.

For frequency response analysis, nonconstant Neumann boundary conditions and constant Dirichlet boundary conditions are supported. The only allowed type of parameter-dependent Dirichlet boundary condition are those that can be written as a constant vector times a scalar function. The scalar function is specified via the property loadfact. For transient response analysis only constant Dirichlet boundary conditions are supported. Neumann

conditions that can be written as a constant vector times a scalar function (which is specified via the property loadfact) are supported for transient response.

The property modes is index-0 based.

If pout is set to fraction the output frequencies are the ones in plist multiplied by the absolute value of the largest eigenvalue in eigsol (or some other fraction of the largest participating eigenvalue of eigsol). The purpose of this property is to be able to automatically compute the frequency response for reasonable frequencies. If pout is set to spread then plist is interpreted as an interval around each participating eigenvalue. For example, if plist is set to range(0.9,0.04,1.1) then each participating eigenvalue is multiplied by this list, and the resulting lists are concatenated into the plist that is used.

