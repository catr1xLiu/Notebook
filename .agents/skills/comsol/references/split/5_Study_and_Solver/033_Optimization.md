# *Optimization*

Handle optimization solver properties.

## **SYNTAX**

```
model.sol(sname).create(fname,"Optimization")
model.sol(sname).feature(fname).set(pname,value)
model.sol(sname).feature(fname).create(aname,SolverAttribute)
```

## **DESCRIPTION**

Operation feature. Use this feature to solve PDE-constrained optimization problems. The computed solution object contains the PDE solution evaluated for the optimal set of design variables. When the gradient-evaluation method is analytic, it also returns the adjoint solution.

The Optimization Module includes SNOPT and several other optimization solvers. See the *Optimization Module Manual* for details.

To add a stationary solver, substitute SolverAttribute above with StationaryAttrib. For a time-dependent solver, replace SolverAttribute with TimeAttrib.

Choosing solver is done with the following property:

TABLE 6-55: PROPERTY TO SELECT OPTIMIZATION SOLVER.

| PROPERTY  | VALUE                                                                                                | DEFAULT    | DESCRIPTION         |
|-----------|------------------------------------------------------------------------------------------------------|------------|---------------------|
| optsolver | bobyqa   cobyla  <br>coordsearch   lm  <br>mma   montecarlo  <br>neldermead  <br>snopt   ipopt   ego | neldermead | Optimization solver |

The following table includes general optimization solver properties, which a common to all optimization solvers:

TABLE 6-56: GENERAL OPTIMIZATION PROPERTIES.

| PROPERTY | VALUE        | DEFAULT | DESCRIPTION                                                                                                                                                          |
|----------|--------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clist    | String array | off     | Provide values for constants as input parameters<br>using a string array; for the corresponding<br>constant names, use cname. See The clist and<br>cname Properties. |
| cname    | String array | off     | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties.  |
| control  | String       | user    | Name of the controlling study step or user, if the<br>feature is controlled manually.                                                                                |

TABLE 6-56: GENERAL OPTIMIZATION PROPERTIES.

| PROPERTY          | VALUE                                    | DEFAULT                                                                                      | DESCRIPTION                                                                                                                               |
|-------------------|------------------------------------------|----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| keeplog           | on   off                                 | off                                                                                          | Keep warnings in stored log.                                                                                                              |
| message           | String                                   |                                                                                              | The log message from the last solution process.                                                                                           |
| objcontrib        | all   manual                             | all                                                                                          | Whether to use all objective contributions<br>present or specify manually (not available if<br>optsolver is lm).                          |
| opttol            | real scalar                              | 0.01                                                                                         | Optimality tolerance for derivative free<br>optimization solvers.                                                                         |
| opttolinner       | real scalar                              | 0.001                                                                                        | Optimality tolerance for gradient based<br>optimization solvers.                                                                          |
| gradientstep      | String                                   | The last study<br>step in the list<br>or none, if<br>there is no<br>supported<br>study step. | Name of the study step to use for gradient<br>computation.                                                                                |
| useseed           | on   off                                 | off                                                                                          | Random seed. Available for montecarlo.                                                                                                    |
| randseed          | integer                                  | 1000                                                                                         | Random seed. Available for montecarlo.                                                                                                    |
| nsolvemax         | integer                                  | 1000                                                                                         | Maximum number of model evaluations.                                                                                                      |
| lsqdatamethod     | manual lsq                               | manual                                                                                       | Least-squares time/parameter method. Available<br>when there are lsq objectives in the model.                                             |
| keepsol           | auto   last   all                        | auto=last                                                                                    | Keep last or all solutions for derivative free<br>optimization solvers.                                                                   |
| keepsolgb         | last   lastn  <br>everynth               | last                                                                                         | Keep last or all solutions for gradient based<br>optimization solvers.                                                                    |
| err               | on   off                                 | on                                                                                           | Stop if error. Available for derivative free<br>optimization solvers.                                                                     |
| nkeepsols         | integer                                  | 2                                                                                            | Number of solutions to save. Available for<br>gradient based optimization solvers, when<br>keepsolgb=lastn.                               |
| nskipsols         | integer                                  | 10                                                                                           | Save every Nth. Available for gradient based<br>optimization solvers, when<br>keepsolgb=everynth.                                         |
| optobj            | String array                             |                                                                                              | User defined objective expressions.                                                                                                       |
| descr             | String array                             |                                                                                              | Descriptions for used defined objective<br>expressions.                                                                                   |
| optobjEvaluateFor | String array                             |                                                                                              | Study to evaluate objective expressions for.                                                                                              |
| objectivetype     | minimization  <br>maximization           | sum                                                                                          | Determines whether the objective should be<br>minimized or maximized.                                                                     |
| multiobjective    | sum   min   max                          | sum                                                                                          | Multiple objectives. Only sum is supported for<br>gradient based optimization solvers.                                                    |
| objectivesolution | auto   first   last<br>  sum   min   max | auto                                                                                         | Solution. Handling of multiple solution vectors.<br>Only auto available for SNOPT, IPOPT, and LM.                                         |
| outersolution     | sum   min   max                          | sum                                                                                          | Outer solution. Available for derivative free<br>optimization solvers, when there are Parametric<br>Sweep study steps under Optimization. |
| objectivescaling  | init   manual  <br>none                  | none                                                                                         | Enable/disable objective scaling.                                                                                                         |
| objscaleval       | real scalar                              | 1                                                                                            | Objective scale.                                                                                                                          |

TABLE 6-56: GENERAL OPTIMIZATION PROPERTIES.

| PROPERTY                 | VALUE                          | DEFAULT                                              | DESCRIPTION                                                                                                                     |
|--------------------------|--------------------------------|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| pname                    | String array                   |                                                      | Global parameter names to use as control<br>variables.                                                                          |
| initval                  | String array                   |                                                      | Initial values for global parameters used as control<br>variables.                                                              |
| scale                    | String array                   |                                                      | Scales for global parameters used as control<br>variables.                                                                      |
| lbound                   | String array                   |                                                      | Lower bounds for global parameters used as<br>control variables.                                                                |
| ubound                   | String array                   |                                                      | Upper bounds for global parameters used as<br>control variables.                                                                |
| constraint<br>Expression | String array                   |                                                      | Global constraint expressions.                                                                                                  |
| constraintL<br>bound     | String array                   |                                                      | Lower bounds for global constraint expressions.                                                                                 |
| constraintU<br>bound     | String array                   |                                                      | Upper bounds for global constraint expressions.                                                                                 |
| constrmethod             | penalty  <br>augLagrange       | augLagrange<br>for BOBYQA,<br>penalty for<br>others. | Constraint handling method, not available for<br>COBYLA.                                                                        |
| coefrho                  | auto   manual                  | auto                                                 | Strategy for penalty parameter rho. Available<br>when constrmethod=penalty.                                                     |
| rho                      | real scalar                    | 10                                                   | Penalty parameter rho. Available when<br>constrmethod=penalty and<br>coefrho=manual.                                            |
| tau                      | real scalar                    | 0.5                                                  | Tolerance for the penalty parameter. Available<br>when constrmethod=augLagrange.                                                |
| gamma                    | real scalar                    | 10                                                   | Multiplication factor for the penalty parameter.<br>Available when constrmethod=augLagrange.                                    |
| mu                       | real scalar                    | Max double<br>value                                  | Upper bound on Lagrange multipliers. Available<br>when constrmethod=augLagrange.                                                |
| nlagevals                | integer                        | 10                                                   | Maximum number of augmented iterations.<br>Available when constrmethod=augLagrange.                                             |
| deltachoice              | dynamic  <br>dynamic2   static | dynamic                                              | Strategy for the subsolver tolerance.                                                                                           |
| aCoef                    | real scalar                    | 2                                                    | Tolerance parameter for the subsolver. Available<br>when deltachoice=dynamic2.                                                  |
| delta                    | real scalar                    | 0.001                                                | Tolerance parameter for the subsolver. Available<br>when deltachoice=static.                                                    |
| enfdesconstr             | on   off                       | on                                                   | Enforce design constraints strictly. Available when<br>optsolver is equal to neldermead, cobyla,<br>montecarlo, or coordsearch. |
| plot                     | on   off                       | off                                                  | Enable/disable plot while solving.                                                                                              |
| plotgroup                | String                         | default                                              | Tag of the plotgroup to plot while solving.                                                                                     |
| probesel                 | all   none   manual            | all                                                  | The probes to compute while solving.                                                                                            |
| probes                   | String array                   |                                                      | Probes to use, if probesel=manual.                                                                                              |
| useobjtable              | on   off                       | on                                                   | Keep objective values in table.                                                                                                 |
| objtable                 | String                         | new                                                  | Output table to use, when useobjtable=on.                                                                                       |

TABLE 6-56: GENERAL OPTIMIZATION PROPERTIES.

| PROPERTY       | VALUE                  | DEFAULT | DESCRIPTION                                                                                                     |
|----------------|------------------------|---------|-----------------------------------------------------------------------------------------------------------------|
| showindobj     | on   off               | off     | Show individual objective values in table.                                                                      |
| plotobj        | on   off               | off     | Plot objective while solving.                                                                                   |
| window         | String                 | new     | Window to use, if plotobj=bj=on.                                                                                |
| useconstrtable | on   off               | on      | Keep values of constraints in table. Only available<br>with the derivative free optimization solvers.           |
| constrtable    | String                 | new     | Table to use, when useconstrtable=on.                                                                           |
| pdistrib       | on   off               | off     | Distribute parametric sweep. Available when<br>optsolver is equal to coordsearch,<br>neldermead, or montecarlo. |
| nparallelsolve | integer                | 1       | Maximum number of model evaluations in each<br>parametric sweep, available when pdistrib=on.                    |
| convinfo       | on   off  <br>detailed | on      | Optimization log.                                                                                               |
| keepaccumtable | on   off               | off     | Keep accumulated probe table. Available for<br>derivative free optimization solvers.                            |

When the optimization solver is set to SNOPT (snopt), the following properties are accepted:

TABLE 6-57: VALID PROPERTIES FOR OPTSOLVER SNOPT.

| PROPERTY           | VALUE                                                          | DEFAULT    | DESCRIPTION                                                                                                           |
|--------------------|----------------------------------------------------------------|------------|-----------------------------------------------------------------------------------------------------------------------|
| cendiff            | real scalar                                                    | 6e-6       | Central difference interval (only available when<br>gradientsnopt is numeric)                                         |
| difint             | real scalar                                                    | 1.5e-8     | Difference interval (only available when<br>gradientsnopt is numeric).                                                |
| feastol            | real scalar                                                    | 1e-6       | Linear constraint tolerance.                                                                                          |
| funcprec           | real scalar                                                    | 3.8e-11    | Function precision.                                                                                                   |
| gradientsnopt      | analytic  <br>numeric  <br>forward adjoint <br>forward_numeric | analytic   | Gradient/Jacobian evaluation method for<br>SNOPT.                                                                     |
| hessupd            | integer                                                        | 10         | Hessian updates.                                                                                                      |
| linesearch         | derivative  <br>nonderivative                                  | derivative | Use a derivative (gradient) or nonderivative<br>(gradient free) linesearch strategy.                                  |
| linestol           | real scalar                                                    | 0.9        | Linesearch tolerance (a value between 0 and 1).<br>A lower value gives a more accurate search.                        |
| majfeastol         | real scalar                                                    | 1e-6       | Nonlinear constraint tolerance.                                                                                       |
| manualhessupd      | on   off                                                       | off        | Whether to use the property hessupd.                                                                                  |
| manualstepcond     | on   off                                                       | off        | Whether to use manual step condition.                                                                                 |
| optobj             | String                                                         |            | Objective function that is minimized when<br>objcontrib=manual.                                                       |
| qpsolver           | cholesky   cg   qn                                             | cholesky   | QP subproblem algorithm.                                                                                              |
| snoptmaxiter       | integer                                                        | 1          | Maximum number of major iterations                                                                                    |
| snoptmaxiteractive | on   off                                                       | off        | Enable maximum major iterations.                                                                                      |
| snoptprintdir      | String                                                         |            | For log files for SNOPT, specify the directory of<br>the log file. Use the snoptprintfile to specify<br>the log file. |

TABLE 6-57: VALID PROPERTIES FOR OPTSOLVER SNOPT.

| PROPERTY         | VALUE   | DEFAULT               | DESCRIPTION                                                                                                                                                                     |
|------------------|---------|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| snoptprintfile   | String  | snoptout.txt          | For log files for SNOPT, specify the name of the<br>log file. Use the snoptprintdir to specify the<br>directory. If no name is specified, the log-file<br>name is snoptout.txt. |
| snopttotitlim    | integer | Integer.<br>MAX_VALUE | Total number of iterations in SNOPT.                                                                                                                                            |
| snoptverifylevel | integer | -1                    | Verify the objective and constraint gradients<br>using finite differences. This property takes<br>values from -1 to 3. See the User's Guide for<br>SNOPT for more information.  |
| stepcond         | String  | empty                 | Manual step condition.                                                                                                                                                          |

The property gradientsnopt is used to control if the gradient should be computed analytically (by solving the adjoint problem) or numerically. If the number of design variables is large, numerical computation of the gradient can be very time consuming. Analytic gradient is only supported when the underlying PDE problem is stationary.

If manualstepcond is set to on, the expression in the property stepcond is evaluated when new values for the design variables have been computed. If the expression becomes negative, the new values are discarded and the optimization solver reduces the step length in the current line search.

When the optimization solver is set to IPOPT (ipopt), the following properties are accepted:

TABLE 6-58: VALID PROPERTIES FOR OPTSOLVER IPOPT.

| PROPERTY                                     | VALUE                                                | DEFAULT  | DESCRIPTION                                                                                                |
|----------------------------------------------|------------------------------------------------------|----------|------------------------------------------------------------------------------------------------------------|
| evaluate_orig_ob<br>j_at_resto_trial         | on   off                                             | off      | Determines if the original objective function<br>should be evaluated at restoration phase trial<br>points. |
| expect_infeasibl<br>e_problem                | on   off                                             | off      | Enable heuristics to quickly detect an<br>infeasible problem.                                              |
| gradientipopt                                | analytic   forward  <br>adjoint  <br>forward_numeric | analytic | Gradient/Jacobian evaluation method for<br>IPOPT.                                                          |
| ipopt_acceptable<br>_iter                    | integer                                              | 15       | Number of acceptable iterates before<br>triggering termination.                                            |
| ipopt_acceptable<br>_constr_viol_tol         | real scalar                                          | 1        | Constraint violation acceptance absolute<br>tolerance factor                                               |
| ipopt_acceptable<br>_compl_inf_tol           | real scalar                                          | 1        | Complementarity conditions acceptance<br>absolute tolerance factor                                         |
| ipopt_acceptable<br>_tol_fact                | real scalar                                          | 10       | Acceptable convergence tolerance (relative).                                                               |
| ipopt_dual_inf_t<br>ol                       | real scalar                                          | 1        | Absolute tolerance on the dual infeasibility<br>factor.                                                    |
| ipopt_expect_inf<br>easible_problem_<br>ctol | real scalar                                          | 1e-2     | Threshold for disabling<br>expect_infeasible_problem option.                                               |
| ipopt_expect_inf<br>easible_problem_<br>ytol | real scalar                                          | 1e8      | Multiplier threshold for activating<br>expect_infeasible_problem option.                                   |
| ipopt_file_print<br>_level                   | integer                                              | 5        | Verbosity level for output file.                                                                           |
| ipopt_linear_sol<br>ver                      | mumps   pardiso                                      | mumps    | Linear solver used for step computations.                                                                  |

TABLE 6-58: VALID PROPERTIES FOR OPTSOLVER IPOPT.

| PROPERTY                    | VALUE       | DEFAULT      | DESCRIPTION                                                                                                                                                                     |
|-----------------------------|-------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ipopt_mumps_mem_<br>percent | real scalar | 1000         | Percentage increase in the estimated working<br>space for MUMPS.                                                                                                                |
| ipopt_mumps_pivt<br>ol      | real scalar | 1e-6         | Pivot tolerance. Available for MUMPS.                                                                                                                                           |
| ipopt_mumps_pivt<br>olmax   | real scalar | 0.1          | Maximum pivot tolerance. Available for<br>MUMPS.                                                                                                                                |
| ipoptprintdir               | String      |              | For log files for IPOPT, specify the directory<br>of the log file. Use the ipoptprintfile to<br>specify the log file.                                                           |
| ipoptprintfile              | String      | ipoptout.txt | For log files for IPOPT, specify the name of<br>the log file. Use the ipoptprintdir to<br>specify the directory. If no name is specified,<br>the log-file name is snoptout.txt. |
| optobj                      | String      |              | Objective function that is minimized when<br>objcontrib=manual.                                                                                                                 |
| start_with_resto            | on   off    | off          | Tells algorithm to switch to restoration<br>phase in first iteration.                                                                                                           |

The property gradientipopt is used to control if the gradient should be computed analytically (by solving the adjoint problem) or numerically. If the number of design variables is large, numerical computation of the gradient can be very time consuming. Analytic gradient is only supported when the underlying PDE-problem is stationary.

When the optimization solver is set to Levenberg–Marquardt (lm), the following properties are accepted:

TABLE 6-59: VALID PROPERTIES FOR OPTSOLVER LM.

| PROPERTY        | VALUE                                                          | DEFAULT  | DESCRIPTION                                                                                                                                                                                                 |
|-----------------|----------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| cendiff         | real scalar                                                    | 6e-6     | Central difference interval (only available when<br>gradientlm is numeric and gradorder is second)                                                                                                          |
| difint          | real scalar                                                    | 1.5e-8   | Difference interval (only available when gradientlm is<br>numeric and gradorder is first).                                                                                                                  |
| gammaf          | real scalar                                                    | 1        | Defect reduction tolerance factor.                                                                                                                                                                          |
| gammafactive    | on   off                                                       | off      | Terminate also for defect reduction.                                                                                                                                                                        |
| gammax          | real scalar                                                    | 1        | Control variable tolerance factor.                                                                                                                                                                          |
| gradientlm      | analytic   numeric<br>  forward   adjoint<br>  forward_numeric | analytic | Gradient/Jacobian evaluation method.                                                                                                                                                                        |
| gradorder       | first   second                                                 | first    | Approximation order of the gradient.                                                                                                                                                                        |
| lmfact          | real scalar                                                    | 1e-3     | Initial Levenberg-Marquardt factor.                                                                                                                                                                         |
| lmmaxiter       | integer                                                        | 1        | Maximum number of outer iterations.                                                                                                                                                                         |
| lmmaxiteractive | on   off                                                       | off      | Enable maximum outer iterations.                                                                                                                                                                            |
| outfsens        | on   off   onpws                                               | on       | Store functional sensitivity. onpws is equivalent to on,<br>except the sensitivity is also stored in the solution<br>while solving. This is relevant when using the results<br>while solving functionality. |

When the optimization solver is set to MMA, the following properties are accepted:

TABLE 6-60: VALID PROPERTIES FOR OPTSOLVER MMA.

| PROPERTY         | VALUE                                                          | DEFAULT  | DESCRIPTION                                                                                   |
|------------------|----------------------------------------------------------------|----------|-----------------------------------------------------------------------------------------------|
| gcmma            | on   off                                                       | on       | Use the globally convergent MMA algorithm.                                                    |
| gradientmma      | analytic   forward  <br>numeric   adjoint  <br>forward_numeric | analytic | Gradient/Jacobian evaluation method.                                                          |
| mmamaxiter       | positive integer                                               | 1        | Maximum outer iterations.                                                                     |
| mmamaxiteractive | on   off                                                       | off      | Enable maximum outer iterations.                                                              |
| mmainnmax        | positive integer                                               | 10       | Maximum inner iterations per outer iteration (only<br>for gcmma=off ).                        |
| mmagepsfactor    | real scalar                                                    | 0.1      | Internal tolerance factor.                                                                    |
| mmacfactor       | real scalar                                                    | 1000     | Constraint penalty factor.                                                                    |
| mmaghinit        | real scalar                                                    | 0.5      | Initial asymptote factor (ghinit).                                                            |
| mmaghdecr        | real scalar                                                    | 0.7      | Decreasing asymptote factor (ghdecr).                                                         |
| mmaghincr        | real scalar                                                    | 1.2      | Increasing asymptote factor (ghincr).                                                         |
| mmaasymin        | real scalar                                                    | 0.01     | Minimum asymptote level (asymin).                                                             |
| mmaasymax        | real scalar                                                    | 10       | Maximum asymptote level (asymax).                                                             |
| mmaalbefa        | real scalar                                                    | 0.1      | Bounds asymptote factor (albefa).                                                             |
| mmaxxmove        | real scalar                                                    | 0.5      | Bounds control factor (xxmove).                                                               |
| mmaraai          | real scalar                                                    | 0.00001  | Approximation increment (raai).                                                               |
| mmaraamin        | real scalar                                                    | 0.000001 | Lower approximation bound (raamin).                                                           |
| mmalsq           | on   off                                                       | on       | Automatically transform least-squares objectives<br>to constraints for efficiency.            |
| mmaminmax        | on   off                                                       | on       | Automatically transform minimax and maximin<br>problems to constraints for efficiency.        |
| movelimit        | real scalar                                                    | 0.1      | Limit the maximum absolute change of any scaled<br>control variable between outer iterations. |
| movelimitactive  | on   off                                                       | off      | Enable movelimit.                                                                             |

When the optimization solver is set to EGO, these additional properties are available:

TABLE 6-61: VALID PROPERTIES FOR OPTSOLVER EGO

| PROPERTY               | VALUE                              | DEFAULT  | DESCRIPTION                                                                                                                                                                                               |
|------------------------|------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| acquisitionmaxmethod   | direct   montecarlo                | direct   | Optimization method for acquisition<br>function.                                                                                                                                                          |
| covfunction            | se   matern32  <br>matern52   nn   | matern32 | Type of covariance function to use in the<br>Gaussian process function. Use se for<br>Squared exponential, matern32 for<br>Matérn 3/2, matern52 for Matérn 5/2<br>and nn for Single-layer neural network. |
| globalgpconstrfunction | new   Gaussian Process<br>function | new      | Constraint Gaussian process function to<br>use.                                                                                                                                                           |
| globalgpfunction       | new   Gaussian Process<br>function | new      | Gaussian process function to use.                                                                                                                                                                         |
| gpusage                | restart   continue                 | restart  | Usage: restart or continue to improve.                                                                                                                                                                    |

TABLE 6-61: VALID PROPERTIES FOR OPTSOLVER EGO

| PROPERTY              | VALUE                         | DEFAULT | DESCRIPTION                                                                                        |
|-----------------------|-------------------------------|---------|----------------------------------------------------------------------------------------------------|
| maxgpevalsacquisition | positive integer              | 10000   | Maximum surrogate evaluations for<br>optimization, if<br>acquisitionmaxmethod is set to<br>direct. |
| maxgpitersacquisition | positive integer              | 500     | Maximum number of optimization<br>iterations, if acquisitionmaxmethod<br>is set to direct.         |
| meanfunction          | const   linear  <br>quadratic | const   | Defines the overall trend of the trained<br>function(s).                                           |
| ninitsample           | positive integer              | 10      | Initial sample per control variable, if<br>gpusage is set to restart.                              |
| nmontecarlo           | positive integer              | 10000   | Surrogate evaluations for optimization, if<br>acquisitionmaxmethod is set to<br>montecarlo.        |
| restol                | double                        | 1e-16   | Resolution tolerance for the Gaussian<br>process function.                                         |

For a description of the optimization properties, see Advanced Solver Properties in the *Optimization Module User's Guide*.

TABLE 6-62: REMOVED FEMOPTIM PROPERTIES.

| PROPERTY   | REASON                        |
|------------|-------------------------------|
| Callblevel | Handled by attribute features |
| Solprop    | Handled by stationary or time |
| Solcomp    | Handled by variables          |
| Report     | Handled by variables          |
| Out        | Solution should be exported   |

