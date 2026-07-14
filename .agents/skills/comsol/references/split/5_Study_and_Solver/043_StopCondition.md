# *StopCondition*

Handle stop conditions for time-dependent, time explicit, and parametric solver processes.

## **SYNTAX**

```
model.sol(sname).create(fname,"Stationary")
model.sol(sname).feature(fname).create(pname,Parametric)
model.sol(sname).feature(fname).feature(pname).create(ocname,StopCondition)
model.sol(sname).feature(fname).feature(pname).feature(ocname).setIndex(pname,pvalue,ix)
```

## **DESCRIPTION**

Attribute feature. Use the StopCondition feature to make sure the solver stops when a specified condition is fulfilled. When you provide a scalar expression, then the expression is evaluated after each time or parameter step. The stepping is stopped if the real part of the expression is evaluated to something negative. The corresponding solution, for which the expression is negative, is not returned. When you provide an integer, the solver stops when the corresponding implicit event is triggered. Use setIndex to set the stop condition properties for multiple stop conditions. For example,

```
model.sol("sol1").feature("t1").feature("st1").setIndex("stopcondarr", "(1/timestep)<200", 1);
specifies the second stop condition to be (1/timestep)<200.
```

TABLE 6-71: VALID STOPCONDITION PROPERTIES.

| PROPERTY            | VALUE                                         | DEFAULT | DESCRIPTION                                                                                                  |
|---------------------|-----------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------|
| stopcondActive      | Vector with entries<br>"on" and "off"         |         | Vector describing which stop condition expression<br>that are active.                                        |
| stopcondarr         | Vector of strings                             |         | Stop condition expressions.                                                                                  |
| stopconddesc        | Vector of strings                             |         | Descriptions for stop condition expressions.                                                                 |
| stopcondition       | String                                        |         | Stop condition expression (deprecated).                                                                      |
| stopcondterminateon | Vector with entries<br>"true" and "negative". |         | For "true" ("negative"), entries, the solver stops if the<br>associated stopcondarr entry satisfies ≥1 (<0). |

