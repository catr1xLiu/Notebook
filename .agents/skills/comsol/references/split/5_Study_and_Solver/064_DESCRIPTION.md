# **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-101: PROPERTIES FOR BIDIRECTIONALLY COUPLED RAY TRACING STUDY SETTINGS.

| PROPERTY            | VALUE                                                | DEFAULT                  | DESCRIPTION                                                                                             |
|---------------------|------------------------------------------------------|--------------------------|---------------------------------------------------------------------------------------------------------|
| charvel             | String                                               | c_const<br>or<br>343 m/s | Group velocity used to convert path lengths to<br>solution times when<br>timestepspec=specifylength.    |
| llist               | Numeric vector                                       |                          | List of path lengths when<br>timestepspec=specifylength.                                                |
| lunit               | String                                               | m                        | Length unit when<br>timestepspec=specifylength.                                                         |
| numberofreflections | Positive integer                                     | 5                        | Maximum number of reflections per ray for<br>automatic stop conditions when<br>raystopcond=reflections. |
| raystopcond         | nostop   noactive  <br>rayintensity  <br>reflections | nostop                   | Automatic stop condition in the default solver<br>sequence.                                             |
| rtol                | Positive scalar                                      | 0.01                     | Relative tolerance, if usertol is on.                                                                   |
| thresholdintensity  | String                                               | 1[W/m^2]                 | Threshold intensity for automatic stop<br>conditions when<br>raystopcond=rayintensity.                  |

TABLE 6-101: PROPERTIES FOR BIDIRECTIONALLY COUPLED RAY TRACING STUDY SETTINGS.

| PROPERTY     | VALUE                          | DEFAULT         | DESCRIPTION                                                                                 |
|--------------|--------------------------------|-----------------|---------------------------------------------------------------------------------------------|
| timestepspec | specifytime  <br>specifylength | specifyt<br>ime | Determines whether the time intervals are<br>entered directly or in terms of a path length. |
| tlist        | Numeric vector                 |                 | Time list when<br>timestepspec=specifytime.                                                 |
| tunit        | String                         | ns or ms        | Time unit when<br>timestepspec=specifytime.                                                 |
| usertol      | on   off                       | off             | Physics-controlled or user-defined tolerance.                                               |

#### TABLE 6-102: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |
| plotfreq  | tout   tsteps       | tout    | Where to update plot.                     |

TABLE 6-103: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

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
| reconstructors            | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable        | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-104: PROPERTIES FOR ITERATIONS SECTION.

| PROPERTY | VALUE            | DEFAULT | DESCRIPTION                                                                  |
|----------|------------------|---------|------------------------------------------------------------------------------|
| expr     | String           | 1       | Global expression used to compute relative error<br>when method=convergence. |
| iter     | Positive integer | 5       | Number of iterations of the solver loop when<br>method=iterations.           |
| maxiter  | Positive integer | 25      | Maximum number of iterations in the solver loop<br>when method=convergence.  |

TABLE 6-104: PROPERTIES FOR ITERATIONS SECTION.

| PROPERTY   | VALUE                       | DEFAULT    | DESCRIPTION                                                                                                                           |
|------------|-----------------------------|------------|---------------------------------------------------------------------------------------------------------------------------------------|
| method     | convergence  <br>iterations | iterations | Choose whether termination of the solver loop<br>is based on the convergence of a global variable<br>or a fixed number of iterations. |
| miniter    | Positive integer            | 1          | Minimum number of iterations in the solver loop<br>when method=convergence.                                                           |
| rtolterm   | Positive real number        | 0.001      | Relative tolerance for termination of the solver<br>loop when method=convergence.                                                     |
| rtolthresh | Positive real number        | 1          | Threshold used to avoid division by zero while<br>computing the relative error when<br>method=convergence.                            |

TABLE 6-105: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| initmethod         | init   sol                                                                          | init    | Method for initial values for variables solved for.                                                                                                                    |
| initstudy          | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| manualsolnum       | Vector of integers                                                                  | [1]     | Index to solution for initial value for variables<br>solved for.                                                                                                       |
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer                      | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                                              |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |
| useinitsol         | on   off                                                                            | off     | User-controlled initial values for variables<br>solved for.                                                                                                            |
| usesol             | on   off                                                                            | off     | User-controlled values for variables not solved<br>for.                                                                                                                |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-106: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-107: PROPERTIES FOR MESH ADAPTATION AND STUDY EXTENSIONS.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                               |
|----------------|-------------------|---------|-------------------------------------------------------------------------------------------|
| adapgeom       | String            |         | Name of geometry to use.                                                                  |
| adaption       | on   off          | off     | Adaptive mesh refinement.                                                                 |
| adaptselection | selection         | all()   | The selection for the adaptation (the default is<br>the entire geometry). See Selections. |
| autoremesh     | on   off          | off     | Automatic remeshing.                                                                      |
| autoremeshgeom | String            |         | Name of geometry to use.                                                                  |
| classicadap    | on   off          | off     | If on, use adaptive method for vector elements<br>from version 6.0 and earlier.           |
| plistarr       | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                        |
| pname          | Vector of strings |         | Parameter names.                                                                          |
| punit          | Vector of strings |         | Parameter units.                                                                          |
| sweeptype      | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                                   |
| useparam       | on   off          | off     | Auxiliary sweep.                                                                          |

