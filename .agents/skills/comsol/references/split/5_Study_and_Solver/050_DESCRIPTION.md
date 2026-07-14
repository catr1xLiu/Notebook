# **DESCRIPTION**

Operation feature.

The output time interval and possible intermediate time values are given in the property tlist. The times to store are controlled by the property tout.

The feature TimeDiscrete accepts the following properties:

TABLE 6-76: VALID PROPERTIES FOR THE TIME-DISCRETE SOLVER.

| PROPERTY         | VALUES            | DEFAULT | DESCRIPTION                                                                                                |
|------------------|-------------------|---------|------------------------------------------------------------------------------------------------------------|
| atol             | String            | empty   | Absolute tolerance per field. See below,                                                                   |
| atolmethod       | String            | empty   | How to interpret the atolfields value. See below.                                                          |
| atolglobal       | positive scalar   | 1e-3    | Global absolute tolerance, if<br>atolglobalvaluemethod is manual.                                          |
| atolglobalfactor | positive scalar   | 0.1     | Global absolute tolerance as a factor of the<br>relative tolerance, if atolglobalvaluemethod<br>is factor. |
| atolglobalmethod | scaled   unscaled | scaled  | How to interpret the atolglobal value.                                                                     |

TABLE 6-76: VALID PROPERTIES FOR THE TIME-DISCRETE SOLVER.

| PROPERTY              | VALUES                                                         | DEFAULT | DESCRIPTION                                                                                                                                                          |
|-----------------------|----------------------------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| atolglobalvaluemethod | factor   manual                                                | factor  | Use a factor of the relative tolerance or a<br>user-defined value for the absolute tolerance.                                                                        |
| clist                 | String array                                                   |         | Provide values for constants as input parameters<br>using a string array; for the corresponding<br>constant names, use cname. See The clist and<br>cname Properties. |
| cname                 | String array                                                   |         | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties.  |
| control               | String                                                         | user    | Name of the controlling study step or user if the<br>feature is controlled manually.                                                                                 |
| keeplog               | on   off                                                       | off     | Keep warnings in stored log.                                                                                                                                         |
| message               | String                                                         |         | The log message from the last solution process.                                                                                                                      |
| plot                  | on   off                                                       | off     | Plot while solving.                                                                                                                                                  |
| plotfreq              | tsteps   tout                                                  | tout    | Times to update plot.                                                                                                                                                |
| plotgroup             | String                                                         |         | Name of plot group for plot while solving.                                                                                                                           |
| prevlevels            | positive integer                                               | 2       | Number of previous time levels to store.                                                                                                                             |
| probefreq             | tsteps   tout                                                  | tsteps  | Times to update probe.                                                                                                                                               |
| probes                | vector of strings                                              |         | Probed to use if probesel=manual.                                                                                                                                    |
| probesel              | all   none   manual                                            | all     | The probes to compute.                                                                                                                                               |
| rtol                  | numeric                                                        | 0.01    | Relative tolerance.                                                                                                                                                  |
| timestepdiscrete      | numeric scalar  <br>numeric vector   string<br>with expression | 0.01    | Time step when manual time stepping.                                                                                                                                 |
| tlist                 | numeric vector                                                 |         | Time list.                                                                                                                                                           |
| tout                  | tlist   tsteps  <br>tstepsclosest                              | tlist   | Times to store: output times by interpolation;<br>every Nth step taken by solver; or steps taken by<br>solver closest to output times.                               |
| tstepsstore           | positive integer                                               | 1       | Value of N for every Nth step from the solver to<br>store when tout is set to tsteps.                                                                                |

The TimeDiscrete solver is used for solving time-dependent PDEs that have already been discretized in time using, for example, the prev operator or the bdf operator. Such discretization requires the solution at previous time steps. Different discretizations require different number of previous time steps. For example, the first order accurate bdf method requires the solution at the previous time step, while the second-order accurate bdf-method requires the solution at the two preceding time steps. How many previous time steps should be accessible to the solver is controlled through the property prevlevels.

You can control the process of solving the linear or nonlinear system of equations in each time step manually. For a coupled problem, this is done through the properties Damp, Dtech, Hnlin, Initstep, Jtech, Maxiter, Minstep, and Rstep listed under femnlin. For a segregated problem, the properties listed under femstatic that are related to the segregated solver are available.

Because only manual time stepping is available, there is no estimation of the error made in a time step. However, the tolerances, specified through the properties rtol, atol, atolmethod, atolglobal, and atolglobalmethod are still important as tolerances when solving the nonlinear system of equations in each time step. For a description of these properties, see Time. They should in general be set to the desired accuracy in the final solution.

The property tlist must be a strictly monotone vector of real numbers. Commonly, the vector consists of a start time and a stop time. If more than two numbers are given, the intermediate times can be used as output times, or to control the size of the time-steps (see below). If just a single number is given, it represents the stop time, and the start time is 0.

The property tout determines the times that occur in the output. If tout=tsteps, then the output contains every *N*th time steps (where *N* is specified using the tstepsstore property; default: 1) taken by the solver. If tout=tlist, then the output contains interpolated solutions for the times in the tlist property. If tout=tstepsclosest. The default is tout=tlist.

The size of the time step is controlled through the property timestepdiscrete. If timestepdiscrete is a scalar value, this time step is taken in the entire simulation. When timestepdiscrete is a (strictly monotone) numeric vector, the solver computes the solution at the times in the vector. The start time and stop time is still obtained from tlist; the vector given in timestepdiscrete is truncated and/or expanded using the first and/or last time step in the vector so that the start time and stop time agrees with the values in tlist. Finally, an expression using variables with global scope and which results in a scalar can be used as timestepdiscrete.

![](_page_100_Picture_3.jpeg)

For more information about the time discrete solver; see Time Discrete Solver in the *COMSOL Multiphysics Reference Manual*.

