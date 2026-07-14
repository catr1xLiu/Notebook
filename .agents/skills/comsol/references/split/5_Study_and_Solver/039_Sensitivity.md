# *Sensitivity*

Handle sensitivity solver parameters.

#### **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"Sensitivity")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
```

#### **DESCRIPTION**

Attribute feature. This feature can be used to make analytic forward or backward (adjoint) sensitivity analysis. This analysis is done after the main problem has converged. The solution approach (coupled or segregated, Jacobians, and so on) for the main problem is reused.

TABLE 6-67: VALID SENSITIVITY PROPERTIES.

| PROPERTY   | VALUE                                 | DEFAULT | DESCRIPTION                          |
|------------|---------------------------------------|---------|--------------------------------------|
| sensfunc   | String                                |         | Sensitivity functional variable name |
| sensmethod | none   adjoint   forward<br>  numeric | none    | Sensitivity analysis method          |

The forward numeric method (numeric) is a variant of the forward sensitivity method where the right-hand side of the sensitivity problem is computed by numerical differentiation.

