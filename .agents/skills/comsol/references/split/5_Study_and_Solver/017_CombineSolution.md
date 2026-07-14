# *CombineSolution*

Combine two solutions using concatenation or summing of solutions or by removing solutions.

## **SYNTAX**

```
model.sol(sname).create(fname,"CombineSolution")
model.sol(sname).feature(fname).set(pname,pvalue)
```

#### **DESCRIPTION**

This feature combines solutions by concatenation or summation. The concatenation can, for example, take two time-dependent solutions solver over different time spans and combine them into a single time-dependent solution including all times from both solutions. You can also remove solutions. Stationary solutions are not possible to use. The following properties are accepted:

TABLE 6-29: VALID COMBINESOLUTION PROPERTIES.

| PROPERTY       | VALUE   | DEFAULT | DESCRIPTION                                                                                   |
|----------------|---------|---------|-----------------------------------------------------------------------------------------------|
| addinterpparam | Boolean | true    | Add interpolated solution<br>at intersection points for<br>continuous parameter<br>intervals. |
| addinterpt     | Boolean | true    | Add interpolated solution<br>at intersection times.                                           |
| clearscrsol    | Boolean | false   | Clear the source solution<br>when creating a weighted<br>summation or removing<br>solutions.  |

TABLE 6-29: VALID COMBINESOLUTION PROPERTIES.

| PROPERTY                     | VALUE                               | DEFAULT         | DESCRIPTION                                                                                                 |
|------------------------------|-------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------|
| concatmethod                 | firstprecedence  <br>includeall     | firstprecedence | For soloper set to<br>concatenation, make<br>first solution have<br>precedence or include all<br>solutions. |
| conjugatepairconsecutivesort | Boolean                             | true            | Use a conjugate-pair<br>consecutive sort of<br>eigenvalues regardless of<br>the sorting method.             |
| cssol                        | current   any available<br>solution | current         | The solution to sum, when<br>soloper is set to<br>summation.                                                |
| cssol1                       | current   any available<br>solution | current         | The first solution to<br>concatenate, when<br>soloper is set to<br>concatenation.                           |
| cssol2                       | current   any available<br>solution | current         | The second solution to<br>sum, when soloper is set<br>to concatenation.                                     |
| cssolwghtsum                 | current   any available<br>solution | current         | The solution to use for a<br>weighted solution, when<br>soloper is set to wgtsum.                           |
| excludeorinclude             | explicit   implicit                 | explicit        | Exclude or include selected<br>solutions when soloper is<br>set to remsol.                                  |
| excmethod                    | explicit   implicit                 | explicit        | Exclude method: explicit<br>or implicit selection.                                                          |
| incmethod                    | explicit   implicit                 | explicit        | Include method: explicit or<br>implicit selection.                                                          |
| interpandsort                | auto   manual                       | auto            | Automatic or manual<br>interpolation and sort<br>settings if soloper is set<br>to concatenation.            |
| keeplog                      | true   false                        | false           | Keep warnings in stored<br>log.                                                                             |
| listsolnum                   | vector of integers                  | {1}             | Indices to solutions to use<br>as linearization points<br>when solnum =<br>from_list.                       |
| manualsolnum                 | vector of positive<br>integers      |                 | Identifies the solutions<br>used when solnum =<br>manual.                                                   |
| removesol                    | current   any available<br>solution | current         | The solution to remove<br>from, when soloper is set<br>to remsol.                                           |
| remsolfromexprexc            | String                              |                 | Logical expression for<br>solutions to exclude, when<br>soloper is set to remsol.                           |
| remsolfromexprinc            | String                              |                 | Logical expression for<br>solutions to include, when<br>soloper is set to remsol.                           |

TABLE 6-29: VALID COMBINESOLUTION PROPERTIES.

| PROPERTY             | VALUE                                                                         | DEFAULT         | DESCRIPTION                                                                                                                                                                                    |
|----------------------|-------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| solnum               | all   from_list  <br>manual                                                   | all             | Selection of solutions to<br>exclude or include, when<br>soloper is set to remsol:<br>All, from listsolnum, or<br>from manualsolnum.                                                           |
| soloper              | concatenation  <br>summation   wgtsum  <br>gensum   remsol                    | concatenation   | Combine solutions using<br>concatenation, summation,<br>weighted summation,<br>general summation, or<br>remove solutions.                                                                      |
| solutiontype         | parametric   time  <br>eigenvalue                                             | parametric      | Specify a solution type if<br>interpandsort is set to<br>manual.                                                                                                                               |
| sortdiscontinparams  | Boolean                                                                       | true            | Sort discontinuous<br>single-parameter values.                                                                                                                                                 |
| sorteigexpression    | String                                                                        |                 | The expressions used to<br>sort the eigenvalues or<br>eigenfrequencies. Specified<br>using setIndex().                                                                                         |
| sorteigmethod        | predefined   manual                                                           | predefined      | Use a predefined or<br>manual sorting method, if<br>sorteigvalues is set to<br>true.                                                                                                           |
| sorteigorder         | ascend   descend                                                              | ascend          | Sort eigenvalues in<br>ascending or descending<br>order, if sorteigvalues<br>is set to true.                                                                                                   |
| sorteigprimarily     | realpart   imagpart  <br>realpartmagnitude  <br>imagpartmagnitude  <br>absval | See description | Primary sorting<br>expression, if<br>sorteigmethod is set to<br>predefined. For<br>eigenvalues, the default is<br>realpart; for<br>eigenfrequencies, the<br>default is imagpart.               |
| sorteigsecondly      | realpart   imagpart  <br>realpartmagnitude  <br>imagpartmagnitude  <br>absval | See description | Secondary sorting<br>expression, if<br>sorteigmethod is set to<br>predefined. For<br>eigenvalues, the default is<br>imagpart; for<br>eigenfrequencies, the<br>default is<br>imagpartmagnitude. |
| sorteigvalues        | Boolean                                                                       | true            | Sort eigenvalues.                                                                                                                                                                              |
| sortontransformedeig | true   false                                                                  | true            | Sort based on transformed<br>eigenvalues, if<br>sorteigmethod is set to<br>predefined.                                                                                                         |

TABLE 6-29: VALID COMBINESOLUTION PROPERTIES.

| PROPERTY      | VALUE              | DEFAULT | DESCRIPTION                                                                                      |
|---------------|--------------------|---------|--------------------------------------------------------------------------------------------------|
| weightsmethod | oneexpr   listexpr | oneexpr | Use one expression or a<br>list of expressions for the<br>weighted summation.                    |
| weightoneexpr | String             | 1       | A single expression as<br>weight for the summation<br>(when weightsmethod is<br>set to oneexpr). |

When weightsmethod is set to listexpr, use setIndex with the properties wsolnum. weightlistexpr, and weightlistexpractive to specify the index (solution number), lists of weights, and active flags, respectively, for the case with a list of weights for a weighted summation. See setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

