# *TimeParametric*

Handle properties for parameter stepping for a time-dependent problem.

## **SYNTAX**

```
model.sol(sname).create(fname,"Time")
model.sol(sname).feature(fname).create(parname,"TimeParametric")
model.sol(sname).feature(fname).feature(parname).set(pname,pvalue)
```

## **DESCRIPTION**

Attribute feature.

TABLE 6-78: TIME PARAMETRIC PROPERTIES.

| PROPERTY         | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                   |
|------------------|-------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| addsolutions     | boolean           | true    | Add solution data points from the general<br>noncontinuation parameter values lists, if uselsqdata is<br>set to true.                                                                                                                                                                         |
| control          | String            | user    | Name of the controlling study step or user if the feature<br>is controlled manually.                                                                                                                                                                                                          |
| excludelsqvalues | boolean           | true    | Create bounding box from general parameter value lists,<br>if uselsqdata is set to true.                                                                                                                                                                                                      |
| pdistrib         | on   off          | off     | If the solver should distribute the parameter sweep.                                                                                                                                                                                                                                          |
| plist            | real array        |         | List of parameter values. Obsolete, use plistarr<br>instead.                                                                                                                                                                                                                                  |
| plistarr         | real matrix       |         | Lists of parameter values. One row of values for each<br>parameter name.                                                                                                                                                                                                                      |
| pname            | vector of strings |         | Parameter names.                                                                                                                                                                                                                                                                              |
| pwork            | integer           | 1       | Maximum number of distributed groups.                                                                                                                                                                                                                                                         |
| sweeptype        | sparse   filled   | sparse  | Method for doing the parameter variation. For<br>sweeptype = sparse, the parameter tuples defined by<br>the columns in plistarr are solved for. This method<br>requires equal length for the rows. For sweeptype =<br>filled, all parameter combinations given by plistarr<br>are solved for. |
| uselsqdata       | boolean           | true    | Use parameters from least-squares objectives (requires<br>the Optimization Module).                                                                                                                                                                                                           |

