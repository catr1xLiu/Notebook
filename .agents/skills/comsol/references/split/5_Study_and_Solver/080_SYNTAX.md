# **SYNTAX**

```
model.study(stdname).create(fname, "SchrodingerPoisson");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-157: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY     | VALUE                    | DEFAULT | DESCRIPTION                                                                                                                                       |
|--------------|--------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| appnreigs    | Integer                  | 20      | Approximate number of eigenfrequencies.                                                                                                           |
| chkeigregion | on   off                 | on      | Perform consistency check.                                                                                                                        |
| eigli        | Real scalar              | 0       | Largest imaginary part.                                                                                                                           |
| eiglr        | Real scalar              | 0       | Largest real part.                                                                                                                                |
| eigmethod    | manual   region  <br>all | manual  | Eigenvalue search method; the all method<br>finds all eigenvalues for a full matrix and can<br>only be used for small eigenfrequency<br>problems. |
| eigsi        | Real scalar              | 0       | Smallest imaginary part.                                                                                                                          |
| eigsr        | Real scalar              | 0       | Smallest real part.                                                                                                                               |
| eigwhich     | lm   lr   sr   li   si   | lm      | Eigenfrequency search method around shift.                                                                                                        |
| maxnreigs    | Integer                  | 200     | Maximum number of eigenfrequencies.                                                                                                               |
| neigs        | Integer                  | 6       | Desired number of eigenfrequencies.                                                                                                               |
| neigsactive  | on   off                 | off     | Set desired number of eigenfrequencies.                                                                                                           |
| shift        | Complex scalar           | 0       | Shift.                                                                                                                                            |
| shiftactive  | on   off                 | off     | Use shift.                                                                                                                                        |

#### TABLE 6-158: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |
| plotfreq  | tout   tsteps       | tout    | Where to update plot.                     |

TABLE 6-159: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

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
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |
| discretization            | String Map      |         | See Physics and Variables Selection. |
| equationform              | String Map      |         | See Physics and Variables Selection. |
| equationform_freq         | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src     | String Map      |         | See Physics and Variables Selection. |

TABLE 6-159: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY           | VALUE      | DEFAULT | DESCRIPTION                          |
|--------------------|------------|---------|--------------------------------------|
| reconstructors     | String Map |         | See Physics and Variables Selection. |
| useadvanceddisable | on   off   | off     | See Physics and Variables Selection. |

TABLE 6-160: PROPERTIES FOR ITERATIONS SECTION.

| PROPERTY   | VALUE                                                                                     | DEFAULT    | DESCRIPTION                                                                                                                                                                 |
|------------|-------------------------------------------------------------------------------------------|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| atolterm   | Positive real number                                                                      | 1E-6       | Absolute tolerance for termination of the solver<br>loop when method =<br>minimization_of_global_variable.                                                                  |
| expr       | String                                                                                    | 1          | Global expression used to compute relative error<br>when method!=iterations.                                                                                                |
| iter       | Positive integer                                                                          | 5          | Number of iterations of the solver loop when<br>method=iterations.                                                                                                          |
| maxiter    | Positive integer                                                                          | 25         | Maximum number of iterations in the solver loop<br>when method!=iterations.                                                                                                 |
| method     | minimization_of_<br>global_variable<br> convergence_of_<br>global_variable <br>iterations | iterations | Choose whether termination of the solver loop<br>is based on the convergence of a global variable,<br>minimization of a global variable or a fixed<br>number of iterations. |
| miniter    | Positive integer                                                                          | 1          | Minimum number of iterations in the solver loop<br>when method!=iterations.                                                                                                 |
| rtolterm   | Positive real number                                                                      | 0.001      | Relative tolerance for termination of the solver<br>loop when method =<br>convergence_of_global_variable.                                                                   |
| rtolthresh | Positive real number                                                                      | 1          | Threshold used to avoid division by zero while<br>computing the relative error when method =<br>convergence_of_global_variable.                                             |

TABLE 6-161: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY        | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                       |
|-----------------|-------------------------------------------------------------------------------------|---------|-----------------------------------------------------------------------------------|
| initmethod      | init   sol                                                                          | init    | Method for initial values for variables solved for.                               |
| initstudy       | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                |
| manualsolnum    | Vector of integers                                                                  | [1]     | Index to solution for initial value for variables<br>solved for.                  |
| notlistsolnum   | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.         |
| notmanualsolnum | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                  |
| notsolmethod    | init   sol                                                                          | init    | Method for values for variables not solved for.                                   |
| notsolnum       | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                    |
| notstudy        | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                |
| nott            | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for. |

TABLE 6-161: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                          | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|----------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| outputInterface    | The interfaces to use<br>as key                                |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                     |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                     |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                         |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |
| useinitsol         | on   off                                                       | off     | User-controlled initial values for variables<br>solved for.                                                                                                            |
| usesol             | on   off                                                       | off     | User-controlled values for variables not solved<br>for.                                                                                                                |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-162: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-163: PROPERTIES FOR MESH ADAPTATION AND STUDY EXTENSIONS.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                               |
|----------------|-------------------|---------|-------------------------------------------------------------------------------------------|
| adapgeom       | String            |         | Name of geometry to use.                                                                  |
| adaption       | on   off          | off     | Adaptive mesh refinement.                                                                 |
| adaptselection | selection         | all()   | The selection for the adaptation (the default is<br>the entire geometry). See Selections. |
| autoremesh     | on   off          | off     | Automatic remeshing.                                                                      |
| autoremeshgeom | String            |         | Name of geometry to use.                                                                  |
| plistarr       | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                        |
| pname          | Vector of strings |         | Parameter names.                                                                          |
| punit          | Vector of strings |         | Parameter units.                                                                          |
| sweeptype      | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                                   |
| useparam       | on   off          | off     | Auxiliary sweep.                                                                          |

