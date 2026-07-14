# *Variables*

Handle initial data and scaling for variables solved, as well as how variables not solved for are computed. The methods are applied for the dependent variables present as Field or State subattributes. These attributes are automatically created and updated by this feature. So, if the Analysis (for the solver sequence) is altered or if a different Analysis is used in the sequence, then the Field attributes are changed accordingly.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Variables")
model.sol(sname).feature(fname).set(pname,pval)
model.sol(sname).feature(fname).feature(varname).set(pname,pval)
model.sol(sname).feature(fname).updateVariables()
```

## **DESCRIPTION**

Operation feature. Computes the initial values for the variables that are solved for and how the variables not solved for are computed. The variables handled are the ones present as Field or State attributes. The feature also handles scaling and which variables to store in output.

Use the updateVariables method if needed to perform a manual update of the variables after some change that affects them.

TABLE 6-80: VALID VARIABLES PROPERTIES.

| PROPERTY   | VALUES                                   | DEFAULT | DESCRIPTION                                                                                                                                                          |
|------------|------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clist      | String array                             |         | Provide values for constants as input parameters<br>using a string array; for the corresponding constant<br>names, use cname. See The clist and cname<br>Properties. |
| cname      | String array                             |         | Provide names of constants as input parameters<br>using a string array; for the corresponding constant<br>values, use clist. See The clist and cname<br>Properties.  |
| control    | String                                   | user    | Name of the controlling study step or user if the<br>feature is controlled manually.                                                                                 |
| initmethod | init   sol                               | init    | Method used for initial value computation.                                                                                                                           |
| initsol    | zero   solution object                   | zero    | Initial value solution object.                                                                                                                                       |
| initsoluse | current   manual  <br>solution store tag | current | Use current or stored values from the initial value<br>solution object, or use manual to provide a<br>solution index in the initsolusesolnum<br>property.            |

TABLE 6-80: VALID VARIABLES PROPERTIES.

| PROPERTY         | VALUES                                                                              | DEFAULT | DESCRIPTION                                                                                                         |
|------------------|-------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------|
| initsolusesolnum | integer or parameter<br>name                                                        |         | An outer solution index for a parametric sweep,<br>such as a global parameter, when initsoluse is<br>set to manual. |
| manualsolnum     | positive integer                                                                    |         | Identifies the solution used when solnum =<br>manual.                                                               |
| notlistsolnum    | vector of positive integers                                                         |         | List that identifies the solutions used when<br>notsolnum = from_list.                                              |
| notmanualsolnum  | vector of positive integers                                                         |         | Identifies the solutions used when notsolnum =<br>manual.                                                           |
| notsol           | zero   solution object                                                              | zero    | Solution object for variables not solved for.                                                                       |
| notsolmethod     | init   sol                                                                          | init    | Method used for variables not solved for.                                                                           |
| notsolnum        | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Which solnums from other solution to use for<br>variables not solved for.                                           |
| notsoluse        | current   solution store<br>tag                                                     | current | Use current or stored values from the solution<br>object for variables not solved for.                              |
| nott             | double                                                                              |         | The interpolation value used for values of variables<br>not solved for when notsolnum = interp.                     |
| resscalemethod   | auto   manual                                                                       | auto    | Method used for scaling of residual.                                                                                |
| resscaleval      | scalar                                                                              | 1       | Residual scaling value, if resscalemethod is<br>manual.                                                             |
| scalemethod      | auto   init   none  <br>manual                                                      | auto    | Method used for scaling of variables.                                                                               |
| scaleval         | scalar                                                                              | 1       | Global scaling value, if scalemethod is manual.                                                                     |
| solnum           | auto   all   first  <br>last   interp   manual  <br>positive integer                | auto    | The solnum from other solution to use for initial<br>values of variables solved for.                                |
| t                | double                                                                              |         | The interpolation value used for initial values of<br>variables solved for when solnum = interp.                    |
| useinitsol       | on   off                                                                            | off     | Use user-controlled initial values of variables solved<br>for.                                                      |
| usesol           | on   off                                                                            | off     | Use user-controlled values of variables not solved<br>for.                                                          |

TABLE 6-81: VALID VARIABLE SUBATTRIBUTE FIELD/STATE PROPERTIES.

| PROPERTY    | VALUES                               | DEFAULT | DESCRIPTION                                                                             |
|-------------|--------------------------------------|---------|-----------------------------------------------------------------------------------------|
| comp        | vector of strings                    |         | Field/State components                                                                  |
| out         | on   off                             | on      | Store Field/State in output                                                             |
| reconstruct | String                               | none    | Tag of a compatible reduced model to<br>use for reconstruction when solvefor<br>is off. |
| scalemethod | auto   init   none   manual   parent | parent  | Method used for scaling of variables                                                    |
| scaleval    | scalar                               | 1       | Scaling value                                                                           |
| solvefor    | on   off                             | on      | Solve for this Field/State                                                              |

TABLE 6-81: VALID VARIABLE SUBATTRIBUTE FIELD/STATE PROPERTIES.

| PROPERTY    | VALUES                     | DEFAULT | DESCRIPTION                                                              |
|-------------|----------------------------|---------|--------------------------------------------------------------------------|
| storesel    | Array of selection strings |         | Selections defining which field data to<br>store.                        |
| usestoresel | all   selection            | all     | Store all field data or field data defined<br>in selections in storesel. |

The properties initmethod, initsol, and initsoluse determine the initial value for the solution components you solve for when useinitsol is set to on.

The properties notsolmethod, notsol, notsoluse, and notsolnum determine the value of solution components you do not solve when usesol is set to on.

Which variables to solve for, and which variables to store in the solution is controlled by the properties solvefor and out in the Field or State attributes.

The reconstruct property is only available when using model reduction and then to configure reconstruction for dependent variables not solved for.

The properties scalemethod and scaleval determine a scaling of the degrees of freedom that is applied in order to get a more well-conditioned system. The possible values of scalemethod are:

TABLE 6-82: VALUES FOR THE PROPERTY SCALEMETHOD.

| VALUE  | MEANING                                                                                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| auto   | The scaling is automatically determined.                                                                                                                                          |
| init   | The scaling is determined from the initial value. Use this if the sizes of the components of the initial<br>value give a good estimate of the order of magnitude of the solution. |
| none   | No scaling is applied.                                                                                                                                                            |
| manual | The scaling is user controlled by setting the property scaleval.                                                                                                                  |
| parent | Scaling method is inherited from the parent Variables feature (only for subattributes).                                                                                           |

