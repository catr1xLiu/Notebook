# *Stationary*

Solve a stationary problem with or without parameters, mesh adaptation, sensitivity, or optimization.

## **SYNTAX**

```
model.sol(sname).create(fname,"Stationary")
model.sol(sname).feature(fname).set(pname,value)
```

## **DESCRIPTION**

Operation feature.

The following properties are available.

TABLE 6-70: STATIONARY PROPERTIES.

| PROPERTY         | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                                                                                          |
|------------------|------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clist            | String array                                                                       |                 | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname. See<br>The clist and cname Properties. |
| cname            | String array                                                                       |                 | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties.  |
| control          | String                                                                             | user            | Name of the controlling study step or user if<br>the feature is controlled manually.                                                                                 |
| keeplog          | on   off                                                                           | off             | Keep warnings in stored log.                                                                                                                                         |
| keepnotsolstatic | on   off                                                                           | off             | Used in Fatigue analysis to store all solnums<br>from the source solution in the Fatigue solution<br>object (default value is on for Fatigue analysis).              |
| linplistsolnum   | Integer array                                                                      | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to from_list.                                                                        |
| linpmanualsolnum | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual.                                                                  |
| linpmethod       | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.                                                                              |
| linpsol          | zero   solution object                                                             | zero            | Linearization point solution.                                                                                                                                        |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | auto            | Indices to solutions to use as linearization<br>points. The default value from a default solver is<br>case dependent.                                                |
| linpsoluse       | current   manual  <br>solution store tag                                           | current         | Linearization point solution to use. The<br>solution store can be all solution objects that<br>can be found in the solver sequence set by the<br>linpsol property.   |
| linpsolusesolnum | integer                                                                            |                 | Index for the solution to use when<br>linpsoluse is set to manual.                                                                                                   |
| linpt            | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                                                                                  |

TABLE 6-70: STATIONARY PROPERTIES.

| PROPERTY         | VALUE                          | DEFAULT | DESCRIPTION                                                                                                                                 |
|------------------|--------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------|
| listsolnum       | vector of integers             | {1}     | Indices to solutions to use as linearization<br>points when linpsolnum is set to<br>from_list.                                              |
| lumpedflux       | on   off                       | off     | Use lumping when computing fluxes.                                                                                                          |
| manualsolnum     | vector of positive<br>integers |         | Identifies the solutions used when linpsolnum<br>is set to manual.                                                                          |
| nonlin           | auto   on   off <br>linper     | auto    | Use the nonlinear solver.                                                                                                                   |
| message          | String                         |         | The log message from the last solution process.                                                                                             |
| outsollinear     | du   u                         | u       | Store the total solution (u) or deviation and<br>linearization point (du), when nonlin is set to<br>off and storelinpoint is set to off.    |
| outsollinearized | du   u                         | du      | Store the total solution (u) or deviation and<br>linearization point (du), when nonlin is set to<br>linper and storelinpoint is set to off. |
| plot             | on   off                       | off     | Whether to plot while solving.                                                                                                              |
| plotgroup        | String                         | default | Name of plot group for plot while solving.                                                                                                  |
| probes           | vector of strings              |         | Probes to use if probesel=manual.                                                                                                           |
| probesel         | all   none   manual            | all     | The probes to compute.                                                                                                                      |
| reacf            | on   off                       | on      | Compute reaction forces.                                                                                                                    |
| stol             | positive real                  | 1e-3    | Relative tolerance, if control is set to user.                                                                                              |
| storelinpoint    | on   off                       | off     | Whether to store the linearization point.                                                                                                   |
| t                | real                           | 0       | Interpolation time for linearization point from<br>another solution, when linpsolnum is set to<br>interp.                                   |

This solver uses a nonlinear solver if nonlin is on, and it uses the linear solver if nonlin is off or linper. If nonlin is set to auto an analysis is performed to automatically detect if the problem can be solved with a linear solver approach.

The automatic nonlinear/linear detection works in the following way. The linear solver is called if the residual Jacobian matrix (the stiffness matrix, *K*) and the constraint Jacobian matrix (the constraint matrix, *N*) are both found not solution dependent and if these matrices are detected as complete. In all other situations the nonlinear solver is used. The analysis is performed by a symbolic analysis of the expressions contributing to these matrices. Complete here means that in the residual and constraint vectors, only expressions were found for which COMSOL Multiphysics computes the correct Jacobian contribution.

Therefore, if you want to solve a linearized (nonlinear) problem, you must set nonlin to off or linper. The off option uses the linearization point for both the residual computation and for the Jacobian and the solution to the linear problem is added to the linearization point. This corresponds to one step in the Newton method. For linper, the linearization point is used for the Jacobian, the zero solution is used for the assembly of the residual and the solution to the linear problem is returned as the solution. Furthermore, the residual assembled for linper is computed using loads marked with the linper operator.

There are variables for which COMSOL Multiphysics is conservative and therefore flags these, and their Jacobian contribution, as solution dependent even though they not always are. For these situations, the nonlinear solver is used even though the linear solver could be used. This should only result in some extra computational effort, and should not influence the result. The opposite situation however, where the linear solver is used for a nonlinear problem is more dangerous. So, select nonlin to off with great care.

The property reacf controls the computation and storage of constraint reaction forces. The value reacf=on (default) means that the solver stores the FEM residual vector *L* in the solution object model.sol. Because *L = NF*Λ for a converged solution, the residual is the same as the constraint force. Only the components of *L* that correspond to nonzero rows of *NF* are stored. The value reacf=off gives no computation or storage of the reaction force and saves some memory.

The linear solver uses the property itol for termination of iterative linear system solvers and for error checking for direct solvers (if enabled).

