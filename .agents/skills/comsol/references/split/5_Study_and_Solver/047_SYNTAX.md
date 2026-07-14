# **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"TimeAdaption")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
```

## **DESCRIPTION**

Handles settings for time-dependent adaptive mesh refinement. This feature can be added to a solver of the Time Dependent type.

The TimeAdaption feature splits the overall time range into subintervals, and in each interval an adapted mesh is generated and used. The meshes for these intervals as well as the solutions are added to the model. The solutions are stored in one container node (model.sol()) to facilitate the result processing.

The feature TimeAdaption accepts the following properties

TABLE 6-75: VALID TIMEADAPTION PROPERTIES.

| PROPERTY          | VALUE        | DEFAULT | DESCRIPTION                                                                                                                                                          |
|-------------------|--------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| consistentrestart | on   off     | off     | Consistent initialization after restart.                                                                                                                             |
| clist             | String array |         | Provide values for constants as input parameters<br>using a string array; for the corresponding<br>constant names, use cname. See The clist and<br>cname Properties. |

TABLE 6-75: VALID TIMEADAPTION PROPERTIES.

| PROPERTY                     | VALUE                           | DEFAULT            | DESCRIPTION                                                                                                                                                         |
|------------------------------|---------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| cname                        | String array                    |                    | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties. |
| convertmesh                  | on   off                        | on                 | Convert to simplex mesh.                                                                                                                                            |
| eefuntime                    | user                            | user               | Error indicator function.                                                                                                                                           |
| eefunctime                   | String                          |                    | Error indicator name (eefuntime=user).                                                                                                                              |
| elfrac                       | positive scalar                 | 0.2                | Fraction of maximum refinement if<br>tauto=automatic.                                                                                                               |
| elselect                     | globalmin   worst  <br>elements |                    | Method for selecting elements to refine.                                                                                                                            |
| elselectauto                 | globalmin                       |                    | Method for selecting elements to refine if<br>tauto=automatic.                                                                                                      |
| gf                           | positive scalar                 | 2                  | Interval growth factor.                                                                                                                                             |
| globalminpar                 | positive scalar                 |                    | Controls refinement if elselect=globalmin.                                                                                                                          |
| globalminparauto             | positive scalar                 |                    | Controls refinement if<br>elselectauto=globalmin.                                                                                                                   |
| initialsteprestart           | positive scalar                 | 0.001              | Initial time step size after restart.                                                                                                                               |
| initialsteprestart<br>active |                                 |                    |                                                                                                                                                                     |
| maxrefinement                | scalar integer                  | 5                  | Maximum number of element refinements.                                                                                                                              |
| message                      | String                          |                    | The log message from the last solution process.                                                                                                                     |
| minti                        | positive scalar                 | 0.01               | Minimal length of adaptation time intervals.                                                                                                                        |
| rf                           | positive scalar                 | 0.5                | Interval reduction factor.                                                                                                                                          |
| rmethod                      | regular   longest               | longest            | Refinement method.                                                                                                                                                  |
| samplepts                    | scalar   numeric<br>vector      | range(0,0.<br>1,1) | Where to check the error in next subinterval.                                                                                                                       |
| tauto                        | manual   automatic              | manual             | Time interval control.                                                                                                                                              |
| tfrac                        | positive scalar                 | 0.1                | Length of adaptation time intervals.                                                                                                                                |
| tfracauto                    | positive scalar                 | 0.1                | Length of initial adaptation time interval if<br>tauto=automatic.                                                                                                   |
| timeadapgeom                 | String                          |                    | Name of geometry sequence.                                                                                                                                          |
| worstpar                     | positive scalar                 |                    | Controls refinement if elselect=worst.                                                                                                                              |

