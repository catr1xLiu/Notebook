# *TimeExplicit*

Solve time-dependent problems with explicit time stepping. Note that in the Model Builder, the **Time-Dependent Solver** node includes all time-explicit settings, and the **Time-Explicit Solver** is not available since version 6.1. You can use the API for Time instead.

#### **SYNTAX**

```
model.sol(sname).create(fname,"TimeExplicit")
model.sol(sname).feature(fname).set(pname,pvalue)
```

## **DESCRIPTION**

Operation feature. The TimeExplicit solver is used for solving time-dependent PDEs using the classic Runge– Kutta or the Adams–Bashforth 3 explicit time-stepping schemes

TABLE 6-77: VALID TIMEEXPLICIT PROPERTIES.

| PROPERTY              | VALUES           | DEFAULT | DESCRIPTION                                                                                                                                                          |
|-----------------------|------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| algebraicsolveeverydt | positive double  | 0       | Value of the period Δt, when<br>algebraicsolvemethod is set to dt.                                                                                                   |
| algebraicsolveeveryn  | positive integer | 1       | Value of N, when algebraicsolvemethod is<br>set to n.                                                                                                                |
| algebraicsolvemethod  | n   dt           | n       | Strategy used to solve the algebraic equations:<br>every Nth step or periodically.                                                                                   |
| clist                 | String array     |         | Provide values for constants as input parameters<br>using a string array; for the corresponding<br>constant names, use cname. See The clist and<br>cname Properties. |
| cname                 | String array     |         | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties.  |
| control               | String           | user    | Name of the controlling study step or user if<br>the feature is controlled manually.                                                                                 |

TABLE 6-77: VALID TIMEEXPLICIT PROPERTIES.

| PROPERTY               | VALUES                            | DEFAULT | DESCRIPTION                                                                                                                                                                                                                   |
|------------------------|-----------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| endtimeinterpolation   | Boolean                           | true    | Interpolate the last time specified in the list of<br>output times, if true. If set to false, the last<br>output time is solved and not interpolated. In<br>particular, the solver does not take steps past<br>the last time. |
| erkorder               | integer between 1 and<br>4        | 4       | Runge-Kutta order.                                                                                                                                                                                                            |
| exprs                  | String                            |         | Expression for time stepping when<br>tstepping=elemexprs.                                                                                                                                                                     |
| keeplog                | on   off                          | off     | Keep warnings in stored log.                                                                                                                                                                                                  |
| linsolver              | linear solver tag                 |         | Linear solver to use.                                                                                                                                                                                                         |
| message                | String                            |         | The log message from the last solution process.                                                                                                                                                                               |
| ntimestepsupdateab3loc | Positive integer                  | 100     | Number of time steps between updates, when<br>updtlvl is set to manual.                                                                                                                                                       |
| odesolver              | erk   ab3   ab3loc                | erk     | Time explicit solver.                                                                                                                                                                                                         |
| plot                   | on   off                          | off     | Plot while solving.                                                                                                                                                                                                           |
| plotfreq               | tsteps   tout                     | tout    | Times to update plot.                                                                                                                                                                                                         |
| plotgroup              | String                            |         | Name of plot group for plot while solving.                                                                                                                                                                                    |
| probefreq              | tsteps   tout                     | tsteps  | Times to update probe.                                                                                                                                                                                                        |
| probes                 | vector of strings                 |         | Probed to use if probesel=manual.                                                                                                                                                                                             |
| probesel               | all   none   manual               | all     | The probes to compute.                                                                                                                                                                                                        |
| rktimestep             | positive scalar                   | 1e-3    | Time step.                                                                                                                                                                                                                    |
| storeudot              | on   off                          | on      | Store time derivatives.                                                                                                                                                                                                       |
| rtstepab3loc           | positive scalar                   | 0.1     | Relative time step level, when updtlvl is set to<br>factor.                                                                                                                                                                   |
| tlist                  | vector of strings                 |         | Specified time list.                                                                                                                                                                                                          |
| tout                   | tlist   tsteps  <br>tstepsclosest | tlist   | Times to store: output times by interpolation;<br>every Nth step taken by solver; or steps taken<br>by solver closest to output times.                                                                                        |
| tstepping              | manual   elemexprs                | manual  | Manual or from expressions time stepping.                                                                                                                                                                                     |
| tstepsstore            | positive integer                  | 1       | Value of N for every Nth step from the solver to<br>store when tout is set to tsteps.                                                                                                                                         |
| updtlvl                | false   manual  <br>factor        | false   | Update time step: off (false), manual, or<br>factor (factor only when odesolver is set<br>to ab3loc).                                                                                                                         |

The order of the Runge–Kutta method can be set by the erkorder property. The size of the time step is controlled through the property rktimestep and can be given as a single scalar value, a (strictly monotone) numeric vector, or an expression using variables with global scope, which results in a scalar. For Adams–Bashforth 3, only a scalar constant value of the time step is allowed. Time stepping from expressions tstepping=elemexprs is useful for the Wave Form PDE interface. A local time-stepping version of Adams–Bashforth 3 is available for the Wave Form PDE interface by odesolver=ab3loc.

