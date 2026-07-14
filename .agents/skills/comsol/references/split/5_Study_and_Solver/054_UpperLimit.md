# *UpperLimit*

Handle upper limits for segregated steps. This feature can be added as a subfeature to a Segregated feature.

## **SYNTAX**

```
model.sol(sname).feature(solv).feature(segregated).create(fname,"UpperLimit")
model.sol(sname).feature(solv).feature(segregated).feature(fname).set(pname,value)
```

## **DESCRIPTION**

This feature controls the upper limits for variables used in segregated steps.

TABLE 6-79: VALID UPPER LIMIT PROPERTY.

| PROPERTY   | VALUE  | DEFAULT | DESCRIPTION                               |
|------------|--------|---------|-------------------------------------------|
| upperlimit | String |         | String of variable and upper limit pairs. |

A valid upperlimit string contains pairs of variables names and their associated upper limits. For example, to impose an upper limit of 200 for the value of the field u in Component 1, and an upper limit of 90 for the value of the field v in Component 1, use the string "comp1.u 200 comp1.v 90".

## **SEE ALSO**

LowerLimit, Segregated

