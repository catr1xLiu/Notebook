# *Sensitivity*

Use a Sensitivity study step to add sensitivity analysis to a study.

#### **SYNTAX**

```
model.study(stdname).create(fname, "Sensitivity");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-164: PROPERTIES FOR SENSITIVITY METHOD.

| PROPERTY        | VALUE                                  | DEFAULT                   | DESCRIPTION                                                                        |
|-----------------|----------------------------------------|---------------------------|------------------------------------------------------------------------------------|
| descr           | String                                 |                           | Objective function description.                                                    |
| gradientMethod  | adjoint   forward                      | adjoint                   | Gradient method.                                                                   |
| gradientStep    | String                                 |                           | Reference to study step.                                                           |
| objectiveActive | Vector with entries<br>"on" and "off". | Vector with<br>only "on". | Controls which objective functions from the<br>physics interfaces that are active. |
| optobj          | String                                 |                           | Objective function expression.                                                     |

TABLE 6-165: PROPERTIES FOR CONTROL VARIABLES AND PARAMETERS.

| PROPERTY              | VALUE                                       | DEFAULT                     | DESCRIPTION                                                                      |
|-----------------------|---------------------------------------------|-----------------------------|----------------------------------------------------------------------------------|
| controlVariableActive | Vector with entries "on"<br>and "off".      | Vector with<br>only "on".   | Controls which control variables from<br>the physics interfaces that are active. |
| initval               | Vector of scalars                           |                             | Initial values, one per parameter.                                               |
| pname                 | Vector of strings                           |                             | Parameter names.                                                                 |
| scale                 | Vector of type valuetype                    |                             | Scales, one per parameter.                                                       |
| valuetype             | Vector with entries "real"<br>and "complex" | Vector with<br>only "real". | Value types, one per parameter.                                                  |

