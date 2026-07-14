# *LumpedStep*

Handle a lumped solution step, which can be added as a subfeature to a Segregated feature.

## **SYNTAX**

```
model.sol(sname).feature(solv).feature(segregated).create(fname,"LumpedStep")
model.sol(sname).feature(solv).feature(segregated).feature(fname).set(pname,value)
```

#### **DESCRIPTION**

This feature controls one lumped solution step.

TABLE 6-49: VALID LUMPED STEP PROPERTIES.

| PROPERTY        | VALUE                            | DEFAULT | DESCRIPTION                                            |
|-----------------|----------------------------------|---------|--------------------------------------------------------|
| segcomp         | vector of strings                |         | Field/State components in step if<br>segvarspec=manual |
| segvar          | vector of strings                |         | Fields/States in step                                  |
| segvarspec      | all   manual                     | all     | Include all components or specify which manually       |
| submatrixformat | auto   sparse  <br>filled   free | auto    | Matrix format: automatic, sparse, filled, or free.     |

See SegregatedStep for more information about these properties.

