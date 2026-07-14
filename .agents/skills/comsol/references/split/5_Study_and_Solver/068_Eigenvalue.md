# *Eigenvalue*

The Eigenvalue study step is used to compute eigenmodes and eigenvalues of a linear or linearized model.

## **SYNTAX**

```
model.study(stdname).create(fname, "Eigenvalue");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-122: PROPERTIES FOR THE EIGENVALUE STUDY SETTINGS.

| PROPERTY     | VALUE                                           | DEFAULT | DESCRIPTION                                                                                                                                |
|--------------|-------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------|
| appnreigs    | Integer                                         | 20      | Approximate number of eigenvalues.                                                                                                         |
| approxnep    | tol   fixed                                     | tol     | Taylor expansion truncation using a tolerance<br>or a fixed truncation, when eigsolver is set<br>to arpacknonlinear.                       |
| chkeigregion | on   off                                        | on      | Perform consistency check.                                                                                                                 |
| eigli        | Real scalar                                     | 0       | Largest imaginary part.                                                                                                                    |
| eiglr        | Real scalar                                     | 0       | Largest real part.                                                                                                                         |
| eigmethod    | manual   region  <br>all                        | manual  | Eigenvalue search method; the all method<br>finds all eigenvalues for a full matrix and can<br>only be used for small eigenvalue problems. |
| eigsi        | Real scalar                                     | 0       | Smallest imaginary part.                                                                                                                   |
| eigsolver    | arpack   feast  <br>lapack  <br>arpacknonlinear | arpack  | Which eigenvalue solver to use: ARPACK,<br>FEAST, LAPACK (filled matrix), or ARPACK<br>nonlinear.                                          |
| eigsr        | Real scalar                                     | 0       | Smallest real part.                                                                                                                        |
| eigwhich     | lm   lr   sr   li   si                          | lm      | Eigenfrequency search method around shift.                                                                                                 |
| expdegnep    | Integer                                         | 3       | Degree of the Taylor expansion, if approxnep<br>is set to fixed.                                                                           |

TABLE 6-122: PROPERTIES FOR THE EIGENVALUE STUDY SETTINGS.

| PROPERTY         | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                         |
|------------------|------------------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------------------------------------------|
| linplistsolnum   | Integer array                                                                      | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to from_list.       |
| linpmanualsolnum | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual. |
| linpmethod       | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.             |
| linpsol          | zero   solution object                                                             | zero            | Linearization point solution.                                                                       |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1               | Indices to solutions to use as linearization<br>points.                                             |
| linpsoluse       | current   manual  <br>solution store tag                                           | current         | Subsolution that defines linearization point for<br>the Eigenvalue study step.                      |
| linpsolusesolnum | Integer                                                                            | 1               | Index for the solution to use when<br>linpsoluse is set to manual.                                  |
| linpstudy        | String                                                                             | zero            | Study that defines linearization point for the<br>Eigenvalue study step.                            |
| linpt            | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                 |
| maxdegnep        | Integer                                                                            | 5               | The maximum degree for the Taylor expansion<br>truncation, if approxnep is set to tol.              |
| maxnreigs        | Integer                                                                            | 200             | Maximum number of eigenvalues.                                                                      |
| neigs            | Integer                                                                            | 6               | Desired number of eigenvalues.                                                                      |
| neigsactive      | on   off                                                                           | off             | Set desired number of eigenvalues.                                                                  |
| pdistrib         | on   off                                                                           | off             | Distribute parametric sweep.                                                                        |
| scalingnep       | double                                                                             | 1               | Eigenvalue scaling factor, when eigsolver is<br>set to arpacknonlinear.                             |
| shift            | Complex scalar                                                                     | 0               | Shift.                                                                                              |
| shiftactive      | on   off                                                                           | off             | Use shift.                                                                                          |
| toltruncationnep | double                                                                             | 1E-12           | Tolerance for the Taylor expansion truncation,<br>if approxnep is set to tol.                       |
| useparam         | on   off                                                                           | off             | Auxiliary sweep.                                                                                    |

TABLE 6-123: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |

TABLE 6-123: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY              | VALUE           | DEFAULT | DESCRIPTION                          |
|-----------------------|-----------------|---------|--------------------------------------|
| disableFrameControl   | Reference Array |         | See Physics and Variables Selection. |
| discretization        | String Map      |         | See Physics and Variables Selection. |
| equationform          | String Map      |         | See Physics and Variables Selection. |
| equationform_freq     | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src | String Map      |         | See Physics and Variables Selection. |
| reconstructors        | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable    | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-124: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-125: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

The following ARPACK properties are available when eigsolver is set to arpack and useparam (auxiliary sweep) is on:

TABLE 6-126: ARPACK PROPERTIES FOR AUXILIARY SWEEPS

| PROPERTY            | VALUE                   | DEFAULT | DESCRIPTION                                                                                                                                                                               |
|---------------------|-------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| auxsweepeigval      | default  <br>preveigval | default | ARPACK starting vector: the default or from<br>previous eigenvalues.                                                                                                                      |
| auxsweepeigvalshift | average  <br>closest    | closest | ARPACK shift from previous eigenvalues: average of<br>converged eigenvalues or eigenvalue closest to the<br>previous shift, if auxsweepeigvec is set to<br>preveigvec.                    |
| auxsweepeigvec      | default  <br>preveigvec | default | ARPACK shift: as specified (default) or based on<br>eigenvalues from last parameter (preveigvec).                                                                                         |
| auxsweepeigvecstart | sum   closest           | sum     | ARPACK starting vector from previous<br>eigenfrequencies: summation of all eigenvalues or<br>eigenvector with eigenvalue closest to the shift, if<br>auxsweepeigval is set to preveigval. |

For the adaptation and error estimates settings, see Table 6-171.

