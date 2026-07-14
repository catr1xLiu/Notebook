# *Modal*

Solve parametric or time-dependent problem using the eigenmodal method.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Modal")
model.sol(sname).feature(fname).set(pname,pvalue)
```

## **DESCRIPTION**

Operation feature. The following properties are accepted:

TABLE 6-50: VALID MODAL PROPERTIES FOR THE MODAL SOLVER.

| PROPERTY              | VALUE                    | DEFAULT   | DESCRIPTION                                                                                                                                                          |
|-----------------------|--------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| analysistype          | frequency  <br>transient | frequency | Solve for frequency response or transient<br>response.                                                                                                               |
| atolglobal            | positive scalar          | 0.001     | Absolute tolerance when<br>atolglobalvaluemethod is set to manual.                                                                                                   |
| atolglobalfactor      | positive scalar          | 0.1       | Tolerance factor when<br>atolglobalvaluemethod is set to factor.                                                                                                     |
| atolglobalmethod      | scaled   unscaled        | scaled    | Global method for the absolute tolerance<br>when analysistype has been set to<br>transient.                                                                          |
| atolglobalvaluemethod | factor   manual          | factor    | Tolerance method if analysistype has been<br>set to transient.                                                                                                       |
| clist                 | String array             |           | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname.<br>See The clist and cname Properties. |
| cname                 | String array             |           | Provide names of constants as input<br>parameters using a string array; for the<br>corresponding constant values, use clist.<br>See The clist and cname Properties.  |
| complex               | true   false             | false     | Allow complex-valued data, if analysistype<br>has been set to transient.                                                                                             |
| constrmodes           | array of integers        |           | The constraint modes to use, if<br>constrmodeselection is set to manual.                                                                                             |
| constrmodeselection   | all   manual             | all       | The constraint modes to use.                                                                                                                                         |
| constrsol             | solution object or none  |           | The solution to use for the constraint modes.                                                                                                                        |

TABLE 6-50: VALID MODAL PROPERTIES FOR THE MODAL SOLVER.

| PROPERTY             | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                                             |
|----------------------|------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------|
| control              | String                                                                             | user            | Name of the controlling study step or user if<br>the feature is controlled manually.                                    |
| dampratio            | scalar   numeric vector                                                            | 0               | Damping ratios for participating modes.                                                                                 |
| eigsol               | solution object or none                                                            |                 | Precomputed eigenpairs (or other vectors) to<br>be used in the modal analysis.                                          |
| eigsoluse            | current   manual   an<br>applicable solution                                       | current         | The parametric solution to use if such a<br>solution has been set as the eigsol.                                        |
| eigsolusesolnum      | solution index                                                                     |                 | The solution index to use if eigsoluse is set<br>to manual.                                                             |
| ewtrescale           | true   false                                                                       | true            | Update scaled absolute tolerance when<br>analysistype has been set to transient.                                        |
| initialdataextend    | automatic   true  <br>false                                                        | automatic       | Extend basis with initial data when<br>analysistype has been set to transient.                                          |
| keeplog              | on   off                                                                           | off             | Keep warnings in stored log.                                                                                            |
| linearity            | false   linper                                                                     | false           | Use linear linearity or a linear perturbation<br>when analysistype has been set to<br>frequency.                        |
| linplistsolnum       | Integer array                                                                      | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to<br>from_list.                        |
| linpmanualsolnum     | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set<br>to manual.                     |
| linpmethod           | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.                                 |
| linpsol              | zero   solution object                                                             | zero            | Linearization point solution.                                                                                           |
| linpsolnum           | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1               | Indices to solutions to use as linearization<br>points.                                                                 |
| linpsoluse           | current   manual  <br>solution store tag                                           | current         | Subsolution that defines linearization point for<br>the Eigenvalue study step.                                          |
| linpsolusesolnum     | integer                                                                            |                 | Index for the solution to use when<br>linpsoluse is set to manual.                                                      |
| linpt                | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                                     |
| maxfreq              | positive scalar                                                                    | 0               | Maximum frequency if maxfreqactive is<br>true.                                                                          |
| maxfreqactive        | true   false                                                                       | false           | True to specify the maximum frequency<br>manually.                                                                      |
| maxstepbdf           | positive scalar                                                                    | 1e-1            | Maximum time step when<br>maxstepconstraintbdf is set to const.                                                         |
| maxstepconstraintbdf | auto   const   expr                                                                | auto            | Maximum time step for time-dependent<br>modal analysis: automatic (auto), constant<br>(const), or an expression (expr). |
| maxstepexpressionbdf | String                                                                             |                 | Expression for the maximum time step when<br>maxstepconstraintbdf is set to expr.                                       |

TABLE 6-50: VALID MODAL PROPERTIES FOR THE MODAL SOLVER.

| PROPERTY         | VALUE                        | DEFAULT | DESCRIPTION                                                                                                                                             |
|------------------|------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| message          | String                       |         | The log message from the last solution<br>process.                                                                                                      |
| minfreq          | positive scalar              | 0       | Minimum frequency if maxfreqactive is<br>true.                                                                                                          |
| minfreqactive    | true   false                 | false   | True to specify the minimum frequency<br>manually.                                                                                                      |
| modes            | integer vector               | all     | Participating modes.                                                                                                                                    |
| modeselection    | all   manual                 | all     | The eigenpairs to use.                                                                                                                                  |
| outsollinearized | du   u                       | du      | Store the total solution (u) or deviation and<br>linearization point (du), when analysistype<br>is set to frequency and storelinpoint is<br>set to off. |
| plist            | scalar   numeric vector      |         | Frequency list. Only applicable when<br>analysistype has been set to frequency.                                                                         |
| plistaddfreq     | numeric list                 |         | List of additional frequencies when pout is<br>set to fraction or spread.                                                                               |
| pname            | vector of strings            |         | Parameter names.                                                                                                                                        |
| pout             | plist   fraction  <br>spread | plist   | Use plist as it stands or modify in relation<br>to the participating modes.                                                                             |
| romdata          | String                       | new     | Tag of the target container for the reduced<br>model (new for a new reduced model).                                                                     |
| romReconstruct   | true   false                 | true    | Enable reconstruction in the produced<br>reduced model.                                                                                                 |
| rtol             | scalar                       | 0.01    | Relative tolerance. Only applicable when<br>analysistype has been set to transient.                                                                     |
| soltypemat       | on   off                     | off     | Store reduced-model matrices.                                                                                                                           |
| soltypeonline    | on   off                     | off     | Create a reduced model.                                                                                                                                 |
| soltypesol       | on   off                     | on      | Perform frequency sweep or transient<br>simulation using the modal solver.                                                                              |
| storelinpoint    | on   off                     | off     | Whether to store the linearization point.                                                                                                               |
| tderglobalfactor | positive scalar              | 1       | Time derivative factor when<br>tderglobalmethod is set to manual.                                                                                       |
| tderglobalmethod | auto   manual                | auto    | Derivative tolerance method when<br>analysistype has been set to transient.                                                                             |
| tlist            | scalar   numeric<br>vector   |         | Time list. Only applicable when<br>analysistype has been set to transient.                                                                              |
| tunit            | A valid time unit            | s       | Time unit. Only applicable when<br>analysistype has been set to transient.                                                                              |

In addition, the following properties are available for exporting matrices and vectors:

TABLE 6-51: VALID MODAL PROPERTIES FOR MATRIX AND VECTOR EXPORT FROM THE MODAL SOLVER.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                              |
|----------|----------|---------|----------------------------------------------------------|
| AllL     | on   off | off     | All load vectors, frequency.                             |
| B0r      | on   off | off     | Reduced initial value input matrix, transient.           |
| B0rdot   | on   off | off     | Reduced initial time derivative input matrix, transient. |
| Br       | on   off | off     | Reduced input matrix, transient and frequency.           |
| Brdot    | on   off | off     | Reduced time derivative input matrix, transient.         |

TABLE 6-51: VALID MODAL PROPERTIES FOR MATRIX AND VECTOR EXPORT FROM THE MODAL SOLVER.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                             |
|----------|----------|---------|---------------------------------------------------------|
| Brdotdot | on   off | off     | Reduced second time derivative input matrix, transient. |
| C        | on   off | off     | Output matrix (state space).                            |
| Clmap    | on   off | off     | Constraint modes to inputs map.                         |
| Cr       | on   off | off     | Reduced output matrix, transient and frequency.         |
| D        | on   off | off     | Input feedback matrix (state space).                    |
| DPartSol | on   off | off     | Damping matrix times particular solution, frequency.    |
| Dr       | on   off | off     | Reduced damping matrix, transient and frequency.        |
| Dra      | on   off | off     | Damping ratio matrix, transient and frequency.          |
| EPartSol | on   off | off     | Mass matrix times particular solution, frequency.       |
| Er       | on   off | off     | Reduced mass matrix, transient and frequency.           |
| F        | on   off | off     | Input feedback, transient and frequency.                |
| Kr       | on   off | off     | Reduced stiffness matrix, transient and frequency.      |
| Kud      | on   off | off     | Stiffness matrix times ud, transient.                   |
| L        | on   off | off     | Load vector, transient and frequency.                   |
| MA       | on   off | off     | Stiffness matrix (state space).                         |
| MB       | on   off | off     | Input matrix (state space).                             |
| Mc       | on   off | off     | Mass matrix (state space).                              |
| Pm       | on   off | off     | Projection matrix, transient and frequency.             |
| U0       | on   off | off     | Initial value vector, transient.                        |
| ud       | on   off | off     | Particular solution (state space).                      |
| Udot0    | on   off | off     | Initial derivative vector, transient.                   |
| x0       | on   off | off     | Initial value (state space).                            |
| Y0       | on   off | off     | Output bias, transient and frequency.                   |

The reduced matrices are the matrices that result from the elimination of constraints in the discretized model.

For frequency response analysis, nonconstant Neumann boundary conditions and constant Dirichlet boundary conditions are supported. The only allowed type of parameter-dependent Dirichlet boundary condition are those that can be written as a constant vector times a scalar function. The scalar function is specified via the property loadfact. For transient response analysis only constant Dirichlet boundary conditions are supported. Neumann conditions that can be written as a constant vector times a scalar function are supported for transient response (specified in a Frequency Domain, Modal or Time Dependent, Modal study step).

The property modes is index 0 based.

If pout is set to fraction the output frequencies are the ones in plist multiplied by the absolute value of the largest eigenvalue in eigsol (or some other fraction of the largest participating eigenvalue of eigsol). The purpose of this property is to be able to automatically compute the frequency response for reasonable frequencies. If pout is set to spread then plist is interpreted as an interval around each participating eigenvalue. For example, if plist is set to range(0.9,0.04,1.1) then each participating eigenvalue is multiplied by this list, and the resulting lists are concatenated into the plist that is used.

#### **REMOVED PROPERTIES**

TABLE 6-52: REMOVED PROPERTIES FOR THE MODAL SOLVER SEQUENCE FEATURE.

| PROPERTY   | REASON                                                                                 |
|------------|----------------------------------------------------------------------------------------|
| Callblevel | Given by the solver sequence attribute feature.                                        |
| soltype    | Deprecated in version 5.3 and replaced with soltypesol, soltypemat, and soltypeonline. |

