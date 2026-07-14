# *StudyStep*

Specify which problem to use for subsequent solver operations.

#### **SYNTAX**

```
model.sol(sname).create(fname,"StudyStep")
model.sol(sname).feature(fname).set(pname,pvalue)
```

## **DESCRIPTION**

Utility feature. This feature determines which problem to use for subsequent solver operations and appears as **Compile Equations** in the COMSOL Desktop. It contains a reference to a study and a reference to a study step within that study. When run, the corresponding low-level equation representation is compiled.

TABLE 6-73: VALID CONFIGURATION PROPERTIES.

| PROPERTY     | VALUE                               | DEFAULT | DESCRIPTION                                                                                                                             |
|--------------|-------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------|
| entsel       | List of tags of<br>named selections | {}      | Selections whose geometric entities should be used.<br>Used if useent is set to selected.                                               |
| keeplog      | boolean                             | false   | Keep warnings in stored log.                                                                                                            |
| partmethod   | parent   mo   nd  <br>wnd   false   | parent  | Partitioning method for distributed computing: from<br>parent, mesh ordering, nested dissection, weighted<br>nested dissection, or off. |
| study        | String                              |         | Name of study to use.                                                                                                                   |
| studystep    | String                              |         | Name of study step to use.                                                                                                              |
| splitcomplex | boolean                             | false   | Represent complex variables by separate degrees of<br>freedom for real and imaginary parts.                                             |
| useent       | all   selected                      | all     | Use all geometric entities or selected entities.                                                                                        |

Solve a time-dependent problem using implicit or explicit time stepping.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Time")
model.sol(sname).feature(fname).set(pname,value)
```

#### **DESCRIPTION**

Operation feature.

The time interval and possible intermediate time values are given in the property Tlist. The output times are controlled by the property Tout.

The feature Time accepts the following properties and values:

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY                | VALUES            | DEFAULT | DESCRIPTION                                                                                                       |
|-------------------------|-------------------|---------|-------------------------------------------------------------------------------------------------------------------|
| algebraicsolveeverydt   | positive double   | 0       | Value of the period Δt, when<br>algebraicsolvemethod is set to dt for<br>Adams–Bashforth methods.                 |
| algebraicsolveeverydtRK | positive double   | 0       | Value of the period Δt, when<br>algebraicsolvemethod is set to dt for<br>Runge–Kutta methods.                     |
| algebraicsolveeveryn    | positive integer  | 1       | Value of N, when<br>algebraicsolvemethod is set to n for<br>Adams–Bashforth methods.                              |
| algebraicsolveeverynRK  | positive integer  | 1       | Value of N, when<br>algebraicsolvemethod is set to n for<br>Runge–Kutta methods.                                  |
| algebraicsolvemethod    | n   dt            | n       | Strategy used to solve the algebraic<br>equations: every Nth step or periodically<br>for Adams–Bashforth methods. |
| algebraicsolvemethodRK  | n   dt            | n       | Strategy used to solve the algebraic<br>equations: every Nth step or periodically<br>for Runge–Kutta methods.     |
| assumeperiodic          | Boolean           | false   | Assume periodic values of variables not<br>solved for.                                                            |
| atol                    | String            | empty   | Absolute tolerance per field. See below.                                                                          |
| atolmethod              | String            | empty   | How to interpret the atolfields value. See<br>below.                                                              |
| atolglobal              | positive scalar   | 1e-3    | Global absolute tolerance, if<br>atolglobalvaluemethod is manual.                                                 |
| atolglobalfactor        | positive scalar   | 0.1     | Global absolute tolerance as a factor of<br>the relative tolerance, if<br>atolglobalvaluemethod is factor.        |
| atolglobalmethod        | scaled   unscaled | scaled  | How to interpret the atolglobal value.                                                                            |
| atolglobalvaluemethod   | factor   manual   | factor  | Use a factor of the relative tolerance or a<br>user-defined value for the absolute<br>tolerance.                  |
| atoludot                | String            | empty   | Absolute tolerance for time derivatives<br>per field. Only applicable if<br>atoludotactive is on. See below.      |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY             | VALUES                       | DEFAULT | DESCRIPTION                                                                                                                                                                                                                   |
|----------------------|------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| atoludotactive       | String                       | empty   | Used to activate manual specification of<br>absolute tolerance for time derivatives.<br>See below.                                                                                                                            |
| bdforder             | 1–5                          | 2       | BDF order for manual BDF settings.                                                                                                                                                                                            |
| bwinitstepfrac       | positive scalar              | 0.001   | Fraction of initial step, when consistent<br>is set to bweuler.                                                                                                                                                               |
| bwinitfactor         | positive scalar              | 20      | Safety factor used in the algebraic equation<br>termination, when consistent is set to<br>bweuler.                                                                                                                            |
| checkvalidity        | true   false                 | false   | Check validity of coupled system, if<br>odesolvertype is set to explicit.                                                                                                                                                     |
| complex              | true   false                 | false   | Allow complex numbers.                                                                                                                                                                                                        |
| consistent           | off   on   bweuler           | bweuler | Consistent initialization of DAE systems.                                                                                                                                                                                     |
| clist                | String array                 |         | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname.<br>See The clist and cname Properties.                                                          |
| cname                | String array                 |         | Provide names of constants as input<br>parameters using a string array; for the<br>corresponding constant values, use clist.<br>See The clist and cname Properties.                                                           |
| control              | String                       | user    | Name of the controlling study step or<br>user if the feature is controlled manually.                                                                                                                                          |
| doprigrowmax         | positive scalar              | 10      | Maximum step size growth ratio for<br>Dormand–Prince 5.                                                                                                                                                                       |
| doprigrowmin         | positive scalar              | 0.2     | Minimum step size growth ratio for<br>Dormand–Prince 5.                                                                                                                                                                       |
| dopripicontrol       | smooth   quick  <br>disabled | smooth  | Control behavior of the<br>proportional-integral controller that adds<br>damping on step size changes for<br>Dormand–Prince 5.                                                                                                |
| doprisafe            | positive scalar              | 0.9     | Step size safety factor for Dormand–Prince<br>5.                                                                                                                                                                              |
| endtimeinterpolation | Boolean                      | true    | Interpolate the last time specified in the list<br>of output times, if true. If set to false,<br>the last output time is solved and not<br>interpolated. In particular, the solver does<br>not take steps past the last time. |
| erkorder             | integer, 1–4                 | 4       | Classical Runge–Kutta order.                                                                                                                                                                                                  |
| estrat               | include   exclude            | include | Error estimation strategy.                                                                                                                                                                                                    |
| exprs                | String                       |         | Expression for time stepping when<br>tstepping=elemexprs.                                                                                                                                                                     |
| eventtol             | positive scalar              | 0.01    | Event tolerance used for root finding of<br>event conditions when using implicit<br>events for BDF.                                                                                                                           |
| ewtrescale           | on   off                     | on      | Update scaled absolute tolerance for BDF.                                                                                                                                                                                     |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY                   | VALUES                     | DEFAULT | DESCRIPTION                                                                                                                                                                                                   |
|----------------------------|----------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| geometricNonlinearity      | on   off                   | off     | Include geometric nonlinearity. Available if<br>the license includes the Structural<br>Mechanics Module, Acoustics Module,<br>MEMS Module, or Multibody Dynamics<br>Module.                                   |
| incrdelay                  | positive integer           | 15      | Number of time steps to delay a time step<br>increase.                                                                                                                                                        |
| incrdelayactive            | on   off                   | off     | Use delay in time step increase.                                                                                                                                                                              |
| initialstepbdf             | positive scalar            | 1e-3    | Initial time step for BDF.                                                                                                                                                                                    |
| initialstepbdfactive       | on   off                   | off     | Use an initial time step for BDF.                                                                                                                                                                             |
| initialstepck5             | positive scalar            | 1e-3    | Initial time step for Cash–Karp 5.                                                                                                                                                                            |
| initialstepdopri5          | positive scalar            | 1e-3    | Initial time step for Dormand–Prince 5.                                                                                                                                                                       |
| initialsteprk34            | positive scalar            | 1e-3    | Initial time step for the RK34 method.                                                                                                                                                                        |
| initialstepck5active       | on   off                   | off     | Use an initial time step for Cash–Karp 5.                                                                                                                                                                     |
| initialstepdopri5active    | on   off                   | off     | Use an initial time step for Dormand–<br>Prince 5.                                                                                                                                                            |
| initialsteprk34active      | on   off                   | off     | Use an initial time step for RK34.                                                                                                                                                                            |
| initialstepgenalpha        | positive scalar            | 1e-3    | Initial time step for generalized alpha.                                                                                                                                                                      |
| initialstepgenalphaactive  | on   off                   | off     | Use an initial time step for generalized<br>alpha.                                                                                                                                                            |
| initialstepfractionbdf-i   | positive scalar            |         | The fraction of the time step for the initial<br>step of a manual time stepping for BDF.<br>The name and the default depend on the<br>BDF order; for example,<br>initialstepfractionbdf-2 for BDF<br>order 2. |
| initialstepgrowthratebdf-i | positive scalar            |         | The growth rate for the initial steps of a<br>manual time stepping for BDF. The name<br>and the default depend on the BDF order;<br>for example,<br>initialstepgrowthratebdf-2 for<br>BDF order 2.            |
| keeplog                    | boolean                    | false   | Keep warnings in stored log.                                                                                                                                                                                  |
| lumpedflux                 | on   off                   | off     | Use lumping when computing fluxes.                                                                                                                                                                            |
| masssingular               | yes   maybe                | maybe   | Singular mass matrix.                                                                                                                                                                                         |
| maxorder                   | integer between 1<br>and 5 | 5       | Maximum BDF order.                                                                                                                                                                                            |
| maxstepbdf                 | positive scalar            | 1e-1    | Maximum time step for BDF, when<br>maxstepconstraintbdf is set to const.                                                                                                                                      |
| maxstepconstraintbdf       | auto   const   expr        | auto    | Maximum time step for BDF: automatic<br>(auto), constant (const), or an<br>expression (expr).                                                                                                                 |
| maxstepconstraintdopri5    | auto   const   expr        | auto    | Maximum time step for Dormand–Prince<br>5: automatic (auto), constant (const), or<br>an expression (expr).                                                                                                    |
| maxstepconstraintgenalpha  | auto   const   expr        | auto    | Maximum time step for generalized alpha:<br>automatic (auto), constant (const), or an<br>expression (expr).                                                                                                   |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY                   | VALUES                 | DEFAULT  | DESCRIPTION                                                                                                        |
|----------------------------|------------------------|----------|--------------------------------------------------------------------------------------------------------------------|
| maxstepdopri5              | positive scalar        | 1e-1     | Maximum time step for Dormand–Prince<br>5, when maxstepconstraintdopri5 is<br>const.                               |
| maxstepexpressionbdf       | String                 |          | Expression for the maximum time step for<br>BDF, when maxstepconstraintbdf is<br>expr.                             |
| maxstepexpressiongendopri5 | String                 |          | Expression for the maximum time step for<br>Dormand–Prince 5, when<br>maxstepconstraintdopri5 is expr.             |
| maxstepexpressiongenalpha  | String                 |          | Expression for the maximum time step for<br>generalized alpha, when<br>maxstepconstraintgenalpha is expr.          |
| maxstepgenalpha            | positive scalar        | 1e-1     | Maximum time step for generalized alpha,<br>when maxstepconstraintgenalpha is<br>const.                            |
| message                    | String                 |          | The log message from the last solution<br>process.                                                                 |
| minorder                   | 1   2                  | 1        | Minimum BDF order.                                                                                                 |
| mlinsolver                 | direct   lumped        | direct   | Mass matrix solver: direct or lumped (if<br>timemethodexp is not rk).                                              |
| nlsolver                   | automatic  <br>manual  | manual   | Nonlinear solver settings.                                                                                         |
| ntimestepsupdate           | positive integer       | 100      | Number of time steps between updates,<br>when updtlvl is set to manual when<br>timemethodexp is not set to ab3loc. |
| ntimestepsupdateab3loc     | positive integer       | 100      | Number of time steps between updates,<br>when updtlvl is set to manual when<br>timemethodexp is set to ab3loc.     |
| odesolvertype              | implicit  <br>explicit | implicit | ODE solver type: using an implicit or<br>explicit time stepping method.                                            |
| plot                       | on   off               | off      | Plot while solving.                                                                                                |
| plotfreq                   | tsteps   tout          | tout     | Times to update plot.                                                                                              |
| plotgroup                  | String                 |          | Name of plot group for plot while solving.                                                                         |
| probefreq                  | tsteps   tout          | tsteps   | Times to update probe.                                                                                             |
| probes                     | vector of strings      |          | Probed to use if probesel=manual.                                                                                  |
| probesel                   | all   none   manual    | all      | The probes to compute.                                                                                             |
| predictor                  | linear   constant      | linear   | Predictor type to use (linear or constant),                                                                        |
| reacf                      | on   off               | on       | Compute reaction forces.                                                                                           |
| rescaleafterinitbw         | on   off               | off      | Rescale after initialization for the BDF and<br>Generalized alpha methods, when<br>consistent is set to bweuler.   |
| rhoinf                     | numeric                | 0.75     | Amplification factor for high frequencies.                                                                         |
| rkmethod                   | rk34   ck5   dopri5    | rk34     | Runge–Kutta method: RK34, Cash–Karp 5,<br>or Dormand–Prince 5. Only available when<br>timemethodexp is set to rk.  |
| rkstiffcheck               | on   off               | on       | Check for and stop if problem becomes<br>numerically stiff for Runge–Kutta solvers.                                |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY         | VALUES                                                            | DEFAULT | DESCRIPTION                                                                                                      |
|------------------|-------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------|
| rktimestep       | String                                                            | 1e-3    | Time step for manual time stepping with<br>the classical Runge–Kutta method.                                     |
| rtol             | numeric                                                           | 0.01    | Relative tolerance.                                                                                              |
| rtstepab3loc     | numeric                                                           | 0.1     | Relative time step change, when                                                                                  |
| solref           | true   false                                                      | false   | Use output solution for the time<br>operators.                                                                   |
| solutionperiod   | numeric                                                           | 0       | The interval length for a periodic solution,<br>when assumeperiodic is set to true.                              |
| stabcntrl        | on   off                                                          | off     | Use a nonlinear controller for more<br>efficient time-step control in the BDF<br>method.                         |
| starttime        | numeric                                                           | 0       | The start time for a period of a periodic<br>solution, if assumeperiodic is set to<br>true.                      |
| storeudot        | on   off                                                          | on      | Store time derivatives.                                                                                          |
| tderglobalfactor | numeric                                                           | 1       | The global time derivative factor, if<br>tderglobalmethod is set to manual.                                      |
| tderglobalmethod | auto   manual                                                     | auto    | Global derivative tolerance method.                                                                              |
| tderfactor       | numeric                                                           | 1       | The time derivative factor, if tdermethod<br>is set to manual.                                                   |
| tdermethod       | auto   manual                                                     | auto    | Derivative tolerance method.                                                                                     |
| timemethod       | bdf   genalpha  <br>init                                          | bdf     | Implicit time-stepping method.                                                                                   |
| timemethodexp    | rk   erk   ab3  <br>ab3loc                                        | rk      | Time-explicit solver: Runge–Kutta, classical<br>Runge–Kutta, Adams–Bashforth 3, or<br>Adams–Bashforth 3 (local). |
| timestepbdf      | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the BDF method.                                                     |
| timestepck5      | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the Cash–Karp 5 Runge–Kutta<br>method.                              |
| timestepdopri5   | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the Dormand–Prince Runge–Kutta<br>method.                           |
| timestepgenalpha | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the generalized alpha method.                                       |
| timesteprk34     | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the RK34 Runge–Kutta method.                                        |
| tlist            | numeric vector                                                    |         | List of output times.                                                                                            |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY       | VALUES                                      | DEFAULT | DESCRIPTION                                                                                                                               |
|----------------|---------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------|
| tout           | tlist   tsteps  <br>tstepsclosest           | tlist   | Times to store: output times by<br>interpolation; every Nth step taken by<br>solver; or steps taken by solver closest to<br>output times. |
| tstepping      | manual  <br>elemexprs                       | manual  | Manual or from expressions time stepping.                                                                                                 |
| tstepsbdf      | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when timemethod is<br>set to bdf.                                                                                      |
| tstepsck5      | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when rkmethod is<br>set to ck5.                                                                                        |
| tstepsdopri5   | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when rkmethod is<br>set to dopri5.                                                                                     |
| tstepsgenalpha | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when timemethod is<br>set to genalpha.                                                                                 |
| tstepsrk34     | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when rkmethod is<br>set to rk34.                                                                                       |
| tstepsstore    | positive integer                            | 1       | Value of N for every Nth step from the<br>solver to store when tout is set to<br>tsteps.                                                  |
| updtlvl        | false   manual  <br>factor                  | false   | Update time step: off (false), manual, or<br>factor when timemethodexp is set to<br>ab3loc.                                               |
| updtstep       | false   manual                              | false   | Update time step: off (false) or manual,<br>when tstepping is set to explicit for<br>the timemethodexp methods erk and<br>ab3.            |

By default, you can control the process of solving the linear or nonlinear system of equations in each time step manually. For a coupled problem, this is done through the properties Damp, Dtech, Hnlin, Initstep, Jtech, Maxiter, Minstep, and Rstep listed under femnlin. For a segregated problem, the properties listed under femstatic that are related to the segregated solver are available. When Timemethod is set to bdf it is possible to use the internal nonlinear solver of the time integrator. This can be achieved by setting Nlsolver to automatic.

The properties atol, atolmethod, atolglobal, atolglobalfactor, atolglobalmethod, atolglobalvaluemethod, atoludot, and atoludotactive require some additional explanation. The default value of the absolute tolerance for all fields is given by the property atolglobalfactor or atolglobal, depending on the setting for atolglobalvaluemethod. The modifier atolglobalmethod specifies whether the given value of atolglobal should be applied to scaled or unscaled variables. For variables where the automatic scaling does a good job, or where a manual scaling has been used, specifying the absolute tolerance in scaled variables is much easier. If either a different absolute value or scaling method than dictated by atolglobal and atolglobalmethod is wanted for one or several variables you can use the properties atol and atolmethod. Enter atol as a space-separated string with alternating field names and tolerances (for example, "u 1e-3 v 1e-6"). Enter atolmethod as a space-separated string with alternating field names and one of the strings global, scaled, or unscaled (for example, "u unscaled v scaled"). By default atolmethod is equal to global for all fields. The lists atol and atolmethod do not have to contain all fields. The ones not present get absolute tolerances as specified by atolglobal and atolglobalmethod. When solving wave-type equations, the time derivatives of all fields are also treated as unknowns, and therefore absolute tolerances have to be specified also for these

components. By default these tolerances are chosen automatically. In some situations it might be necessary to specify them manually with the properties atoludot and atoludotactive. To turn on manual specification for, say, the two fields u and v, set the property atoludotactive to the string "u on v on". If atoludot is not specified, these two time-derivatives get the default absolute tolerance 1e-3. To specify other absolute tolerances, set atoludot to, for instance, the string "u 1e-4 v 1e-7". The absolute tolerance method for all time derivatives is the same as the method specified for the field itself.

The maximum allowed relative error in each time step (the local error) is specified using rtol. However, for small components of the solution vector *U*, the algorithm tries only to reduce the absolute local error in *U* below the given absolute tolerance.

There is no guarantee that the error tolerances are met strictly; that is, for hard problems they can be exceeded.

For the tolerance parameter in the convergence criterion for linear systems, the maximum of the numbers rtol and itol is used.

Use complex=on if complex numbers occur in the solution process.

The property Consistent controls the consistent initialization of a *differential algebraic equation* (DAE) system. The value Consistent=off means that the initial values are consistent (this is seldom the case because the initial value of the time derivative is 0). Otherwise, the solver tries to modify the initial values so that they become consistent. The value consistent=on can be used (when timemethod=bdf and nlsolver=automatic) for index-1 DAEs. Then the solver fixes the values of the differential DOFs and solves for the initial values of the algebraic DOFs and the time derivative of the differential DOFs. The value Consistent=bweuler can be used for both index-1 and index-2 DAEs. Then the solver perturbs the initial values of all DOFs by taking a backward Euler step.

For a DAE system, if Estrat=exclude, then the algebraic DOFs are excluded from the error norm of the time discretization error.

You can suggest a size of the initial time step using the property initialstepbdf when timemethod is set to bdf the property initialstepdopri5 when timemethod is set to dopri5, and the property initialstepgenalpha when timemethod is set to genalpha. You also have to set one of the properties initialstepbdfactive, initialstepdopri5active, or initialstepgenalphaactive to on for the specified initial step to be active.

By default, the solver determines whether the system is differential-algebraic by looking after zero rows or columns in the mass matrix. If you have a DAE where the mass matrix has no zero rows or columns, put masssingular=yes.

The property maxorder gives the maximum degree of the interpolating polynomial in the BDF method (when timemethod=bdf).

If timemethod=bdf and maxstepconstraintbdf=const, then the property maxstepbdf put an upper limit on the time step size (this property is not allowed when tstepsbdf=manual). If instead maxstepconstraintbdf=expr, then the property maxstepexpressionbdf controls the maximum step size via an expression that is evaluated while solving. The same holds true for the associated maxstep properties if timemethod=genalpha or timemethod=rk and rkmethod=dopri5.

The odesolver property is used to select which time-stepping method to use for the ODEs:

- **•** With implicit (the default), an implicit time-stepping method such as BDF is used.
- **•** With explicit, an explicit time-stepping method, such as the Runge–Kutta family of explicit methods is used.

The timemethod property is used to select which implicit time-stepping method to use:

- **•** With timemethod=bdf, the IDA solver (which uses a variable order backward differentiation formula) is used.
- **•** With timemethod=genalpha, the generalized-α method is used. With generalized-α, the numerical damping can be controlled by giving a value, 0 ≤ ρ∞ ≤ 1, by which the amplitude of the highest possible frequency is

multiplied each time step (hence, a small value corresponds to large damping while a value close to 1 corresponds to little damping). This is done through the property rhoinf. Also, the initial guess for the solution at the next time step (needed by the nonlinear solver) can be controlled through the property predictor when generalized-α is used. With predictor=linear, linear extrapolation using the current solution and time-derivative is used. With predictor=constant, the current solution is used as initial guess.

**•** When timemethod is set to init the solver computes consistent initial values (for the start time, as defined by the property tlist) for the system and then stop. Time derivatives of algebraic variables and indicator functions might still be uninitialized after this operation. Such uninitialized quantities are represented by NaN (not a number) in the solution object.

The timemethodexp property is used to select which explicit time-stepping method to use:

- **•** With timemethodexp=rk, an explicit Runge–Kutta method is used: RK34, Cash–Karp 5, or Dormand–Prince 5 (specified using the rkmethod property).
- **•** With timemethodexp=erk, a classical Runge–Kutta method of order 1–4 is used.
- **•** With timemethodexp=ab3, an explicit Adams–Bashforth 3 method is used.
- **•** With timemethodexp=ab3loc, a local time-stepping version of Adams–Bashforth 3 is used (for the Wave Form PDE interface).

The property reacf controls the computation and storage of the constraint reaction force. The value reacf=on (default) means that the solver stores the FEM residual vector *L* in the solution object. Because *L = NF*Λ for a converged solution, the residual is the same as the constraint force. Only the components of *L* that correspond to nonzero rows of *NF* are stored. For each time for which the solution is requested an extra residual vector assembly is performed. The value reacf=off gives no computation or storage of the reaction force and can therefore save some computational time.

The property tlist must be a strictly monotone vector of real numbers. Commonly, the vector consists of a start time and a stop time. If more than two numbers are given, the intermediate times can be used as output times, or to control the size of the time steps (see below). If just a single number is given, it represents the stop time, and the start time is 0.

The property tout determines the times that occur in the output. If tout=tsteps, then the output contains every *N*th time steps (where *N* is specified using the tstepsstore property; default: 1) taken by the solver. If tout=tlist, then the output contains interpolated solutions for the times in the tlist property. If tout=tstepsclosest. The default is tout=tlist.

The properties tstepsbdf (applicable when timemethod=bdf), tstepsdopri5 (applicable when timemethod=dopri5), and tstepsgenalpha (applicable when timemethod=genalpha) control the selection of time steps. If either of these properties is set to free, the solver selects the time steps according to its own logic, disregarding the intermediate times in the tlist vector. If either of the properties is set to strict, then time steps taken by the solver contain the times in tlist. If either of the properties is set to intermediate, then there is at least one time step in each interval of the tlist vector. If tstepsgenalpha has been set to manual, the solver follows the time step specified in the property timestepgenalpha. If timestepgenalpha is a scalar value, this time step is taken in the entire simulation. When timestepgenalpha is a (strictly monotone) numeric vector, the solver computes the solution at the times in the vector. The start time and stop time is still obtained from tlist; the vector given in timestepgenalpha is truncated or expanded using the first and last time step in the vector so that the start time and stop time agree with the values in tlist. Finally, an expression using variables with global scope and which results in a scalar can be used as timestepgenalpha.

For problems of wave type, the logic by which the solver selects the time step can sometimes result in a time step that oscillates in an inefficient manner. When timemethod=genalpha (the solver typically used for wave-type problems), you can avoid such oscillations in the time step using the properties incrdelay and incrdelayactive. When incrdelayactive=on, a counter keeps track of the number of consecutive time steps for which a time step increase has been warranted. When this counter exceeds the number given in the property incrdelay, the time step is increased and the counter is set to zero.

The order of the Runge–Kutta method can be set by the erkorder property. The size of the time step is controlled through the property rktimestep and can be given as a single scalar value, a (strictly monotone) numeric vector, or an expression using variables with global scope, which results in a scalar. For Adams–Bashforth 3, only a scalar constant value of the time step is allowed. Time stepping from expressions tstepping=elemexprs is useful for the Wave Form PDE interface. A local time-stepping version of Adams–Bashforth 3 is available for the Wave Form PDE interface by timemethodexp=ab3loc.

## **COMPATIBILITY**

The TimeExplicit time-explicit solver has been removed from the Model Builder in version 6.1 but can still be used in the API. Instead, use the Time solver with an explicit time stepping. The TimeExplicit solver is still available in the Model Builder if you open models created in versions before 6.1 that include a TimeExplicit solver.

![](_page_96_Picture_4.jpeg)

In structural mechanics models, the displacements are often quite small, and it is critical that a userdefined absolute tolerance value is chosen to be smaller than the actual displacements.

![](_page_96_Picture_6.jpeg)

For more information about the Time-Dependent solver; see Time-Dependent Solver in the *COMSOL Multiphysics Reference Manual*.

