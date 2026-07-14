# *LowerLimit*

Handle lower limits for segregated steps. This feature can be added as a subfeature to a Segregated feature.

#### **SYNTAX**

model.sol(sname).feature(solv).feature(segregated).create(fname,"LowerLimit") model.sol(sname).feature(solv).feature(segregated).feature(fname).set(pname,value)

## **DESCRIPTION**

This feature controls the lower limits for variables used in segregated steps.

TABLE 6-48: VALID LOWER LIMIT PROPERTY.

| PROPERTY   | VALUE  | DEFAULT | DESCRIPTION                               |
|------------|--------|---------|-------------------------------------------|
| lowerlimit | String |         | String of variable and lower limit pairs. |

A valid lowerlimit string contains pairs of variables names and their associated lower limits. For example, to impose a lower limit of 0.25 for the value of the field u in Component 1, and a lower limit of 0.0 for the value of the field v in Component 1, use the string "comp1.u 0.25 comp1.v 0.0".

#### **SEE ALSO**

Segregated, UpperLimit

