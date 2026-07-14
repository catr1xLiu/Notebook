# *Eigenvalue*

Solve a PDE eigenvalue problem.

## **SYNTAX**

```
model.sol(sname).create(fname,"Eigenvalue")
model.sol(sname).feature(fname).set(pname,value)
model.sol(sname).feature(fname).create(fname2,LinearType)
model.sol(sname).feature(fname).create(fname2,"Advanced")
```

Here LinearType is any of the allowed linear solver feature types.

#### **DESCRIPTION**

Operation feature.

For both linear and nonlinear problems, the eigenvalue problem is that of the linearization about a solution *U*0. If the eigenvalue appears nonlinearly, COMSOL Multiphysics reduces the problem to a quadratic approximation around a value λ0 specified by the property eigref. The discretized form of the problem reads

$$KU - (\lambda - \lambda_0)DU + (\lambda - \lambda_0)^2 EU = -N_F \Lambda$$

$$NU = M$$

where *K*, *D*, *E*, *N*, and *NF* are evaluated for *U* = *U*0 and λ=λ0. Λ is the Lagrange multiplier vector, and λ is the eigenvalue. The eigenvalue name can be given by the property eigname. The linearization point *U*0 can be given with the property U. The shift, described below, is compensated according to the linearization point for the eigenvalue. Therefore, changing the linearization point has no effect at all for linear or quadratic eigenvalue problems. The eigenvalue search method can be manual or a region in the complex plane (controlled by the property eigmethod) for the ARPACK eigenvalue solver or by stochastic estimation or a manually defined half or full contour in the complex plane for the FEAST eigenvalue solver. There is also a LAPACK eigenvalue for small filled matrices.

The eigenvalue feature accepts the following properties:

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY                     | VALUES           | DEFAULT | DESCRIPTION                                                                                                                                                             |
|------------------------------|------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| appnreigs                    | positive integer |         | Approximate number of eigenvalues<br>(for eigmethod = region).                                                                                                          |
| approxnep                    | tol   fixed      | tol     | Taylor expansion truncation using a<br>tolerance or a fixed truncation,<br>when eigsolver is set to<br>arpacknonlinear.                                                 |
| chkeigregion                 | true   false     | false   | Perform eigenvalue region<br>consistency check when eigsolver<br>is arpack and eigmethod is<br>region.                                                                  |
| clist                        | String array     |         | Provide values for constants as input<br>parameters using a string array; for<br>the corresponding constant names,<br>use cname. See The clist and<br>cname Properties. |
| cname                        | String array     |         | Provide names of constants as input<br>parameters using a string array; for<br>the corresponding constant values,<br>use clist. See The clist and<br>cname Properties.  |
| computeandstorelefteig       | auto   on   off  | auto    | Compute and store left<br>eigenvectors.                                                                                                                                 |
| conangle                     | integer          | 0       | Rotation angle of the ellipse contour<br>(−180 – 180 degrees), when<br>eigsolver is feast and<br>searchcon is wholecon.                                                 |
| conjugatepairconsecutivesort | true   false     | true    | Use a conjugate-pair consecutive<br>sort regardless of the sorting<br>method.                                                                                           |
| conlbdy                      | real scalar      | 0       | Lower bound of search interval,<br>when eigsolver is feast and<br>searchcon is halfcon.                                                                                 |
| conmid                       | real scalar      | 0       | Center of the ellipse contour, when<br>eigsolver is feast and<br>searchcon is wholecon.                                                                                 |
| conrad                       | real scalar      | 1       | Horizontal radius of the ellipse<br>contour, when eigsolver is feast<br>and searchcon is wholecon.                                                                      |
| conradyhm                    | real scalar      | 0.15    | Imaginary semiaxis, when<br>eigsolver is feast and<br>searchcon is halfcon.                                                                                             |

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY             | VALUES                                          | DEFAULT | DESCRIPTION                                                                                            |
|----------------------|-------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------|
| control              | String                                          | user    | Name of the controlling study step<br>or user if the feature is controlled<br>manually.                |
| conubdy              | real scalar                                     | 1       | Upper bound of search interval,<br>when eigsolver is feast and<br>searchcon is halfcon.                |
| distrlinsol          | true   false                                    | false   | Distribute linear system solution.                                                                     |
| eighermchk           | true   false                                    | false   | Real symmetric or Hermitian<br>eigenvalue solver consistency check,<br>if eigsolver is feast.          |
| eigli                | real scalar                                     | 0       | Largest imaginary value of search<br>region when eigsolver is arpack.                                  |
| eiglr                | real scalar                                     | 0       | Largest real value of search region<br>when eigsolver is arpack.                                       |
| eigmethod            | manual   region                                 | manual  | Eigenvalue search method when<br>eigsolver is arpack: around a<br>shift or using a rectangular region. |
| eigname              | String                                          | lambda  | Name of eigenvalue variable.                                                                           |
| eigref               | String                                          | 0       | Linearization point for the<br>eigenvalue.                                                             |
| eigreschk            | true   false                                    | false   | Add an a posteriori residual check.                                                                    |
| eigsi                | real scalar                                     | 0       | Smallest imaginary value of search<br>region when eigsolver is arpack.                                 |
| eigsr                | real scalar                                     | 0       | Smallest real value of search region<br>when eigsolver is arpack.                                      |
| eigsolver            | arpack   feast  <br>lapack  <br>arpacknonlinear | arpack  | Which eigenvalue solver to use:<br>ARPACK, FEAST, LAPACK (filled<br>matrix), or ARPACK nonlinear.      |
| eigsymchk            | true   false                                    | false   | Real symmetric eigenvalue<br>consistency check. Active if<br>usesymeig is auto.                        |
| eigunit              | valid unit                                      | rad/s   | The unit for the eigenvalue.                                                                           |
| eigvfunscale         | average   maximum<br>  mass                     | average | The scaling of eigenvectors: RMS<br>(average), maximum, or so that the<br>modal masses become unity.   |
| eigvfunscaleparam    | positive real scalar                            | 1       | The maximum absolute value for the<br>eigenvector scaling, when<br>eigvfunscale is maximum.            |
| eigwhich             | lm lr sr li si                                  | lm      | Eigenvalue search direction (for<br>eigmethod = manual).                                               |
| expdegnep            | Integer                                         | 3       | Degree of the Taylor expansion, if<br>approxnep is set to fixed.                                       |
| filtereigdescription | array of strings                                |         | The description of the associated<br>entry in filtereigexpression.<br>This is just for usability.      |
| filtereigexpression  | array of strings                                |         | The expressions used to filter the<br>eigenvalues or eigenfrequencies.<br>Specified using setIndex().  |

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY              | VALUES                                   | DEFAULT  | DESCRIPTION                                                                                                                                                               |
|-----------------------|------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| intgtypehm            | auto   gaussf  <br>trapez   zolot        | auto     | Integration type for estimation:<br>automatic, Gauss, or trapezoidal,<br>when eigsolver is feast. Also,<br>you can choose Zolotarev (zolot)<br>when searchcon is halfcon. |
| keeplog               | on   off                                 | off      | Keep warnings in stored log.                                                                                                                                              |
| krylovdim             | positive integer                         | 300      | Dimension of Krylov space when<br>eigsolver is arpack.                                                                                                                    |
| linpmethod            | init   sol                               | init     | Method used for linearization point.                                                                                                                                      |
| linpsol               | zero   solution<br>object                | zero     | Linearization point solution.                                                                                                                                             |
| linpsoluse            | current   manual  <br>solution store tag | current  | Linearization point solution to use.                                                                                                                                      |
| linpsolusesolnum      | integer                                  |          | Index for the solution to use when<br>linpsoluse is set to manual.                                                                                                        |
| maxdegnep             | Integer                                  | 5        | The maximum degree for the Taylor<br>expansion truncation, if approxnep<br>is set to tol.                                                                                 |
| maxeigit              | positive integer                         | 300      | Maximum number of eigenvalue<br>iterations when eigmethod is<br>region.                                                                                                   |
| maxmatsize            | positive integer                         | 2000     | Maximum matrix size, when<br>eigsolver is set to lapack.                                                                                                                  |
| maxnreigs             | positive integer                         | 200      | Maximum number of eigenvalues<br>when eigmethod is region.                                                                                                                |
| maxnumberstoredeigsol | positive integer                         | 1000     | Maximum number of stored<br>solutions, if storeeigsol is set to<br>firstnth.                                                                                              |
| message               | String                                   |          | The log message from the last<br>solution process.                                                                                                                        |
| neigs                 | positive integer                         | 6        | Number of eigenvalues sought when<br>eigsolver is arpack.                                                                                                                 |
| neigsmanual           | positive integer                         | 6        | Approximate number of eigenvalues,<br>when neigsmethodnhm is set to<br>manual, and size of initial search<br>subspace for estimation, when<br>neigsmethodnhm is stochest. |
| neigsmethodnhm        | stochest   manual                        | stochest | The number of eigenvalues,<br>determined using a stochastic<br>estimation algorithm or manually,<br>when eigsolver is feast.                                              |
| nintgptsmethodhmest   | auto   manual                            | auto     | Number of integration points for<br>estimation: automatic or manual,<br>when eigsolver is feast.                                                                          |
| nintgptsmethodhm      | auto   manual                            | auto     | Number of integration points for<br>eigenvalue solver: automatic or<br>manual, when eigsolver is feast.                                                                   |
| nintgptshm            | positive integer                         | 16       | Number of integration points, when<br>nintgptsmethodhm is manual.                                                                                                         |

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY             | VALUES                                                                           | DEFAULT            | DESCRIPTION                                                                                                                                                                           |
|----------------------|----------------------------------------------------------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| nintgptshmest        | positive integer                                                                 | 6                  | Number of integration points for<br>estimation, when<br>nintgptsmethodhmest is manual.                                                                                                |
| qnmaxitnep           | positive integer                                                                 | 20                 | Maximum number of iterations for<br>quasi-Newton refinement, when<br>qnrefinementnep is set to true.                                                                                  |
| qnrefinementnep      | Boolean                                                                          | true               | Use quasi-Newton refinement, when<br>eigsolver is set to<br>arpacknonlinear.                                                                                                          |
| rtol                 | scalar                                                                           | 1e-6               | Relative tolerance.                                                                                                                                                                   |
| searchcon            | halfcon  <br>wholecon                                                            | wholecon           | Specify the eigenvalue search<br>contour when eigsolver is feast:<br>a whole contour or a half contour<br>(Hermitian problem).                                                        |
| shift                | scalar                                                                           | 0                  | Eigenvalue search location when<br>eigsolver is arpack or lapack.                                                                                                                     |
| shiftactive          | on   off                                                                         | off                | Specify eigenvalue search location<br>when eigsolver is arpack.                                                                                                                       |
| shiftregman          | scalar                                                                           | 0                  | Eigenvalue shift (when<br>shiftregselect = manual).                                                                                                                                   |
| shiftregselect       | auto   manual                                                                    | auto               | Search for eigenvalues around (auto<br>= center of search region) when<br>eigsolver is arpack.                                                                                        |
| solnum               | auto   all   positive<br>integer                                                 | auto               | The solution numbers to use.                                                                                                                                                          |
| solutiontype         | parametric   type<br>  eigenvalue                                                | parametric         | The solution type for solutions to<br>concatenate, when interpandsort<br>is set to manual.                                                                                            |
| sorteigexpression    | String                                                                           |                    | The expressions used to sort the<br>eigenvalues or eigenfrequencies.<br>Specified using setIndex().                                                                                   |
| sorteigmethod        | predefined  <br>manual                                                           | predefined         | Use a predefined or manual s                                                                                                                                                          |
| sorteigorder         | ascend   descend                                                                 | ascend             | Sort eigenvalues in ascending or<br>descending order.                                                                                                                                 |
| sorteigprimarily     | realpart  <br>imagpart  <br>realpartmagnitude  <br>imagpartmagnitude  <br>absval | See<br>description | Primary sorting expression, if<br>sorteigmethod is set to<br>predefined. For eigenvalues, the<br>default is realpart; for<br>eigenfrequencies, the default is<br>imagpart.            |
| sorteigsecondly      | realpart  <br>imagpart  <br>realpartmagnitude  <br>imagpartmagnitude  <br>absval | See<br>description | Secondary sorting expression, if<br>sorteigmethod is set to<br>predefined. For eigenvalues, the<br>default is imagpart; for<br>eigenfrequencies, the default is<br>imagpartmagnitude. |
| sortontransformedeig | true   false                                                                     | true               | Sort based on transformed<br>eigenvalues, if sorteigmethod is<br>set to predefined.                                                                                                   |

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY         | VALUES                     | DEFAULT     | DESCRIPTION                                                                                                        |
|------------------|----------------------------|-------------|--------------------------------------------------------------------------------------------------------------------|
| storeeigsol      | all   firstnth             | all         | Store all converged solution or only<br>the first Nth solutions.                                                   |
| storefact        | true   false               | false       | Store linear system factorization.                                                                                 |
| storelinpoint    | on   off                   | off         | Whether to store the linearization<br>point.                                                                       |
| termfeast        | relerrtrace  <br>maxrelres | relerrtrace | Termination criterion: relative error<br>on the trace or maximum relative<br>residual, when eigsolver is<br>feast. |
| tolfactqnnep     | double                     | 1           | Tolerance factor for quasi-Newton<br>refinement, when<br>qnrefinementnep is set to true.                           |
| toltruncationnep | double                     | 1E-12       | Tolerance for the Taylor expansion<br>truncation, if approxnep is set to<br>tol.                                   |
| transcontour     | true   false               | true        | Enter transformed values, when<br>eigsolver is feast and<br>eigmethod is manual.                                   |
| transeigref      | true   false               | true        | Transform eigenvalue linearization<br>point and eigmethod is region.                                               |
| transform        | String                     | none        | Eigenvalue transformation.                                                                                         |
| transshift       | true   false               | true        | Enter transformed values, when<br>eigsolver is arpack.                                                             |
| usesymeig        | auto   false               | auto        | Use real symmetric eigenvalue<br>solver when eigsolver is arpack.                                                  |

Specify where to look for the desired eigenvalues with the property shift. Enter a real or complex scalar; the default value is 0, meaning that the solver tries to find eigenvalues close to 0.

For more information about the eigenvalue solver, see Eigenvalue Solver in the *COMSOL Multiphysics Reference Manual*.

