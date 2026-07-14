# *Previous Solution*

Compute solutions for previous parametric solution parameters and previous time-dependent solution parameters.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Stationary")
model.sol(sname).feature(fname).create(parname,"Parametric")
model.sol(sname).feature(fname).feature(parname).create(psname,"PreviousSolution")
model.sol(sname).feature(fname).feature(parname).feature(psname).set(pname,pvalue)
model.sol(sname).create(fname, "Time");
model.sol(sname).feature(fname).create(psname, "PreviousSolution");
model.sol(sname).feature(fname).feature(psname).set(pname, pvalue);
```

## **DESCRIPTION**

Attribute feature. After the solver has converged for a parameter step or a time step, the previous components are solved for in a separate solver step. These components are held fixed (not solved for) during the normal solver procedure.

Handle the segregated solution approach.

#### **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"Segregated")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
model.sol(sname).feature(solv).feature(fname).feature(fname2).set(pname,value)
```

#### **DESCRIPTION**

This feature can be used as an attribute for the Time and Stationary features. The approach taken is nonlinear Uzawa iterations in which user-defined groups of variables are solved for separately (a segregated step) while other variables are held fixed. The segregated steps for the segregated solver is handled by subattributes of the sort of SegregatedStep, LumpedStep, LowerLimit, and UpperLimit.

The Segregated attribute supports the following properties (of which the ones that start with sub are properties for segregated steps);

TABLE 6-65: VALID SEGREGATED PROPERTIES.

| PROPERTY        | VALUE                         | DEFAULT        | DESCRIPTION                                                                                                                                                                          |
|-----------------|-------------------------------|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maxsegiter      | positive integer              | 100, 25 (Time) | Maximum number of segregated iterations.                                                                                                                                             |
| ntolfact        | positive scalar               | 1              | Tolerance factor.                                                                                                                                                                    |
| plot            | on   off                      | off            | Plot while solving.                                                                                                                                                                  |
| plotgroup       | String                        | default        | Plot group to use for plot while solving.                                                                                                                                            |
| probesel        | all   none   manual           | all            | The probes to compute.                                                                                                                                                               |
| probes          | array of strings              |                | Probes to use when probesel=manual.                                                                                                                                                  |
| ratelimit       | positive scalar               | 1 (Time)       | Limit on nonlinear convergence rate.                                                                                                                                                 |
| ratelimitactive | on   off                      | off, on (Time) | Use limit on nonlinear convergence rate.                                                                                                                                             |
| segaaccdim      | positive integer              | 10             | Dimension of Anderson iteration space when<br>segstabacc = segaacc.                                                                                                                  |
| segiter         | positive integer              | 1              | Fixed number of segregated iterations.                                                                                                                                               |
| segreserrfact   | positive scalar               | 1000           | Residual factor when segtermonres is set to<br>auto or both (for stationary solvers).                                                                                                |
| segstabacc      | none   segclfcmp  <br>segaacc | none           | Stabilization and acceleration: None, pseudo time<br>stepping (for stationary solvers), or Anderson<br>acceleration.                                                                 |
| segterm         | iter   tol  <br>itertol       | tol            | Segregated solver termination technique.                                                                                                                                             |
| segtermonres    | off   on   auto  <br>both     | auto/off       | Termination criterion: Solution, residual, solution<br>or residual, or solution and residual. The default is<br>auto for stationary problems but off for<br>time-dependent problems. |
| segaaccdelay    | nonnegative integer           | 0              | Number of iterations between pseudo time<br>stepping becomes inactive and Anderson<br>acceleration becomes active when segstabacc =<br>segaacc.                                      |
| segaaccdim      | positive integer              | 10             | Dimension of Anderson iteration space when<br>segstabacc = segaacc.                                                                                                                  |
| segaaccmix      | scalar 0–1                    | 1              | Mixing parameter when segstabacc = segaacc.                                                                                                                                          |

TABLE 6-65: VALID SEGREGATED PROPERTIES.

| PROPERTY         | VALUE               | DEFAULT      | DESCRIPTION                                                                                                                                       |
|------------------|---------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| segcflaadelay    | nonnegative integer | 0            | Number of iterations between pseudo time<br>stepping becomes inactive and Anderson<br>acceleration becomes active when segstabacc =<br>segcflcmp. |
| segcflaafact     | nonnegative scalar  | 1            | Threshold for Anderson step for pseudo time<br>stepping.                                                                                          |
| segcflaacfl      | positive scalar     | 100          | CFL threshold when segstabacc = segcflcmp.                                                                                                        |
| segcflaadim      | positive integer    | 10           | Dimension of Anderson iteration space when<br>segstabacc = segcflcmp.                                                                             |
| segcflaamix      | scalar 0–1          | 1            | Mixing parameter when segstabacc =<br>segcflcmp.                                                                                                  |
| segcflaaset      | pid   lock          | pid          | Above the CFL threshold, use the PID controller<br>or lock to the target CFL number.                                                              |
| segcfljtech      | true   false        | false        | Override Jacobian update for step when<br>segstabacc = segcflcmp.                                                                                 |
| segcfljtechval   | onfirst   minimal   | onfirst      | Jacobian update on first iteration or minimal when<br>segstabacc = segcflcmp and segcfljtech =<br>true.                                           |
| segjtechcfl      | positive scalar     | 100          | CFL threshold for Jacobian update when<br>segstabacc = segcflcmp and segcfljtech =<br>true.                                                       |
| subcfltol        | positive scalar     | 0.1          | Target error estimate for pseudo time stepping.                                                                                                   |
| subforcecfl      | boolean             | true         | Limit to target CFL number for pseudo time<br>stepping.                                                                                           |
| subinitcfl       | positive scalar     | 5.0          | Initial CFL number for pseudo time stepping.                                                                                                      |
| subkdpid         | positive scalar     | 0.05         | PID controller - derivative for pseudo time<br>stepping.                                                                                          |
| subkipid         | positive scalar     | 0.05         | PID controller - integral for pseudo time stepping.                                                                                               |
| subkppid         | positive scalar     | 0.65         | PID controller - proportional for pseudo time<br>stepping.                                                                                        |
| submincfl        | positive scalar     | 10000        | Target CFD number for pseudo time stepping.                                                                                                       |
| useheuristicfact | boolean             | false (Time) | Use pre-6.2 linear heuristic for adaptive tolerance.                                                                                              |

Termination of the segregated solver is controlled by the property segterm. The default setting is tol, in which case the segregated iterations are terminated when, for each group, the estimated error is below the corresponding tolerance set by the main tolerance for the parent solver multiplied with the nonlinear tolerance factor ntolfact. However, a maximum number of allowed segregated iterations is chosen through the property maxsegiter; if the maximum is reached, the iterations are terminated and an error message is displayed. Termination after a fixed number of segregated iterations is achieved by instead choosing iter. The number of segregated iterations is controlled by the property segiter. The third available option for segterm is itertol, which is a combination of the other two options; the segregated iterations are terminated when one of the two convergence criteria of tol and iter is met. The property maxsegiter is only supported when tol is used for termination. For both the settings iter and itertol, the number of iterations is controlled by the property segiter.

The nonlinear solver uses an adaptive tolerance for termination of iterative linear system solvers. This adaptive tolerance is based on the maximum of ntol and itol. During the nonlinear iterations, it can, however, be larger or smaller than this number. The segregated solver uses the same tolerance as the linear solver when constant damping is used. However, when automatically adjusted damping is used, the adaptive tolerance of the nonlinear solver is used. The parametric solver uses the same tolerance as the corresponding stationary solver.

The property segstabacc enables or disables pseudo time stepping (for stationary problems) or Anderson acceleration. When enabled the pseudo time stepping is controlled by the scalar-valued controller parameters subcfltol, subinitcfl, subkdpid, subkipid, and subkppid. For the Anderson acceleration, the parameter segaaccdim specifies the dimension of the Anderson iteration space.

The property segtermonres controls the termination criterion for stationary problems when segterm is not iter. When segtermonres=off the estimated error is solution based, with segtermonres=on it is based on a relative residual and for segtermonres=auto the estimated error is the minimum of the solution and residual based errors. For segtermonres=auto the property segreserrfact is a scalar factor multiplying the relative residual error. For subtermonres=both, both methods are used.

#### **COMPATIBILITY**

The property subusecflcmp from earlier versions of COMSOL Multiphysics is not used in version 5.0 and later versions. Use the property segstabacc instead.

#### **SEE ALSO**

LowerLimit, LumpedStep, SegregatedStep, UpperLimit

