# *ProperOrthogonalDecomposition*

Solve frequency-domain or time-dependent problem using POD (proper orthogonal decomposition) reduction.

#### **SYNTAX**

model.sol(sname).create(fname,"ProperOrthogonalDecomposition") model.sol(sname).feature(fname).set(pname,pvalue)

## **DESCRIPTION**

Operation feature. The following properties are accepted:

TABLE 6-64: VALID MODAL PROPERTIES FOR THE POD REDUCTION.

| PROPERTY            | VALUE                        | DEFAULT   | DESCRIPTION                                                                                                                                                          |
|---------------------|------------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| analysistype        | frequency  <br>transient     | transient | Solve for frequency response or transient<br>response.                                                                                                               |
| clist               | String array                 |           | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname.<br>See The clist and cname Properties. |
| cname               | String array                 |           | Provide names of constants as input<br>parameters using a string array; for the<br>corresponding constant values, use clist.<br>See The clist and cname Properties.  |
| constrmodes         | array of integers            |           | The constraint modes to use, if<br>constrmodeselection is set to manual.                                                                                             |
| constrmodeselection | all   manual                 | all       | The constraint modes to use.                                                                                                                                         |
| constrsol           | solution object or none      |           | The solution to use for the constraint<br>modes.                                                                                                                     |
| control             | String                       | user      | Name of the controlling study step or user<br>if the feature is controlled manually.                                                                                 |
| groupmethod         | one   individual  <br>manual | one       | Variable grouping method for training<br>solution: one group, one group per<br>variable, or manual.                                                                  |
| keeplog             | on   off                     | off       | Keep warnings in stored log.                                                                                                                                         |

TABLE 6-64: VALID MODAL PROPERTIES FOR THE POD REDUCTION.

| PROPERTY                | VALUE                              | DEFAULT   | DESCRIPTION                                                                                      |
|-------------------------|------------------------------------|-----------|--------------------------------------------------------------------------------------------------|
| linearity               | false   linper                     | false     | Use linear linearity or a linear perturbation<br>when analysistype has been set to<br>frequency. |
| plist                   | scalar   numeric<br>vector         |           | Frequency list. Only applicable when<br>analysistype has been set to<br>frequency.               |
| pname                   | vector of strings                  |           | Parameter names.                                                                                 |
| podtrainingsol          | String                             |           | Solution selection for POD training.                                                             |
| podtrainingsoluse       | current   manual  <br>solution tag | current   | POD training solution to use.                                                                    |
| podtrainingsolusesolnum | integer                            |           | Index of the POD solution to use, when<br>podtrainingsoluse is set to manual.                    |
| punit                   | String                             | s         | Parameter unit. Only applicable when<br>analysistype has been set to<br>frequency.               |
| romdata                 | String                             | new       | Tag of the target container for the reduced<br>model (new for a new reduced model).              |
| rominterf               | stateless  <br>stateful            | stateless | The reduced-order model interface if<br>romdata is set to new.                                   |
| romReconstruct          | true   false                       | true      | Enable reconstruction in the produced<br>reduced model.                                          |
| rtol                    | scalar                             | 0.01      | Relative tolerance. Only applicable when<br>analysistype has been set to<br>transient.           |
| tlist                   | scalar   numeric<br>vector         |           | Time list. Only applicable when<br>analysistype has been set to<br>transient.                    |
| truncationrtol          | double                             | 0.01      | The relative truncation tolerance.                                                               |
| tunit                   | String                             | s         | Time unit. Only applicable when<br>analysistype has been set to<br>transient.                    |

