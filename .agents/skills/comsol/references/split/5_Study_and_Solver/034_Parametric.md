# *Parametric*

Handle parameters for parameter stepping for stationary problems.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Stationary")
model.sol(sname).feature(fname).create(parname,"Parametric")
model.sol(sname).feature(fname).feature(parname).set(pname,pvalue)
```

## **DESCRIPTION**

Attribute feature.

TABLE 6-63: PARAMETRIC PROPERTIES.

| PROPERTY           | VALUE   | DEFAULT | DESCRIPTION                                                                                                           |
|--------------------|---------|---------|-----------------------------------------------------------------------------------------------------------------------|
| addsolutions       | boolean | true    | Add solution data points from the general<br>noncontinuation parameter values lists, if<br>uselsqdata is set to true. |
| continuationlsqall | boolean | true    | Use all for continuation, if uselsqdata is set to<br>true.                                                            |
| control            | String  | user    | Name of the controlling study step or user if the<br>feature is controlled manually.                                  |
| excludelsqvalues   | boolean | true    | Create bounding box from general parameter value<br>lists, if uselsqdata is set to true.                              |

TABLE 6-63: PARAMETRIC PROPERTIES.

| PROPERTY          | VALUE               | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                               |
|-------------------|---------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| initdampall       | off   on   auto     | auto    | Setting this property to on the initial damping factor<br>is used for all parameter steps.                                                                                                                                                                                                |
| paramtuning       | on   off            | off     | Setting this property to on enables the use of the<br>properties pinitstep, pmaxstep, and pminstep.                                                                                                                                                                                       |
| pcontinuationmode | no   last   manual  | last    | Determines if a continuation sweep should be<br>performed for one of the parameters in pname.                                                                                                                                                                                             |
| pcontinuation     | String              |         | For pcontinuationmode=manual this is one of the<br>parameter names from pname.                                                                                                                                                                                                            |
| pdistrib          | on   off            | off     | If the solver should distribute the parameter sweep.                                                                                                                                                                                                                                      |
| pinitstep         | positive real       |         | Initial step size for parameter. See paramtuning.                                                                                                                                                                                                                                         |
| plist             | real array          |         | List of parameter values. Obsolete, use plistarr<br>instead.                                                                                                                                                                                                                              |
| plistarr          | real matrix         |         | Lists of parameter values. One row of values for each<br>parameter name.                                                                                                                                                                                                                  |
| plooporder        | auto   manual       | auto    | Parametric values loop order. If set to auto, a more<br>efficient loop order is used if possible.                                                                                                                                                                                         |
| pmaxstep          | positive real       |         | Maximum step size for parameter. See<br>paramtuning.                                                                                                                                                                                                                                      |
| pminstep          | positive real       |         | Minimum step size for parameter. See paramtuning.                                                                                                                                                                                                                                         |
| pname             | vector of strings   |         | Parameter names.                                                                                                                                                                                                                                                                          |
| ponerror          | stop   skip   empty | stop    | Determines what the solver does when there is a<br>solver error or when the continuation backtracking<br>fails: Stop, skip the parameter with an error, or store<br>an empty solution.                                                                                                    |
| porder            | constant   linear   | linear  | Predictor order for parameter stepping.                                                                                                                                                                                                                                                   |
| pout              | plist   psteps      | plist   | When pout is set to plist, output solutions for the<br>parameters in plist. When pout is set to psteps,<br>output solutions at the parameter values chosen by<br>the solver.                                                                                                              |
| plot              | on   off            | off     | Plot while solving.                                                                                                                                                                                                                                                                       |
| plotgroup         | String              | default | Plot group to use for plot while solving.                                                                                                                                                                                                                                                 |
| preusesol         | no   yes   auto     | no      | Determines how the converged solutions are reused<br>in the parameter sweep.                                                                                                                                                                                                              |
| probefreq         | pout   psteps       | pout    | When to update probes.                                                                                                                                                                                                                                                                    |
| probes            | array of strings    |         | Probes to use when probesel=manual.                                                                                                                                                                                                                                                       |
| probesel          | all   none   manual | all     | The probes to compute.                                                                                                                                                                                                                                                                    |
| pwork             | integer             | 1       | Maximum number of distributed groups.                                                                                                                                                                                                                                                     |
| pworkactive       | on   off            | off     | Divide distributed parametric sweep work into<br>distributed groups.                                                                                                                                                                                                                      |
| sweeptype         | sparse   filled     | sparse  | Method for doing the parameter variation. For<br>sweeptype=sparse, the parameter tuples defined<br>by the columns in plistarr are solved for. This<br>method requires equal length for the rows. For<br>sweeptype=filled, all parameter combinations<br>given by plistarr are solved for. |

TABLE 6-63: PARAMETRIC PROPERTIES.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                                                                         |
|-------------|----------|---------|-------------------------------------------------------------------------------------|
| useloadcase | on   off | off     | Define load cases.                                                                  |
| uselsqdata  | boolean  | true    | Use parameters from least-squares objectives<br>(requires the Optimization Module). |

