# *Stationary*

A Stationary study step is intended for a stationary or steady-state situation where you can use a stationary solver, including mesh adaptation and error estimation (see Table 6-171).

## **SYNTAX**

```
model.study(stdname).create(fname, "Stationary");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-166: PROPERTIES FOR STUDY SETTINGS

| PROPERTY              | VALUE           | DEFAULT | DESCRIPTION                                                                                                                                                              |
|-----------------------|-----------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| geometricNonlinearity | Boolean         | false   | Include geometric nonlinearity. Available if the<br>license includes the Structural Mechanics<br>Module, Acoustics Module, MEMS Module, or<br>Multibody Dynamics Module. |
| stol                  | Positive scalar | 0.001   | Relative tolerance, is usestol is set to true.                                                                                                                           |
| usestol               | Boolean         | false   | Use a user-defined relative tolerance.                                                                                                                                   |

TABLE 6-167: PROPERTIES FOR RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |

TABLE 6-168: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

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

TABLE 6-169: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

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

TABLE 6-169: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

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

TABLE 6-170: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-171: PROPERTIES FOR MESH ADAPTATION AND ERROR ESTIMATES.

| PROPERTY       | VALUE                  | DEFAULT   | DESCRIPTION                                                                                                                                                                                |
|----------------|------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| adapgeom       | String                 |           | Adaptation in geometry.                                                                                                                                                                    |
| adapsolnum     | Array of integers>0    | 1         | Indices.                                                                                                                                                                                   |
| adaptselection | selection              | all()     | The selection for the adaptation (the<br>default is the entire geometry). See<br>Selections.                                                                                               |
| adderrestvars  | errandres   err   none | errandres | Add variables for error estimation:<br>error estimates and residuals<br>(errandres), error estimates only<br>(err), or no variables (none).                                                |
| adjppr         | on   off               | on        | Adjoint solution error estimate (for<br>adaptation). The on value<br>corresponds to PPR for Lagrange,<br>and the off value corresponds to<br>Interpolation error in the user<br>interface. |

TABLE 6-171: PROPERTIES FOR MESH ADAPTATION AND ERROR ESTIMATES.

| PROPERTY                | VALUE                           | DEFAULT                                               | DESCRIPTION                                                                                                                                                  |
|-------------------------|---------------------------------|-------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| allowcoarsening         | on   off                        | on                                                    | Controls if the mesh can be<br>coarsened by the general<br>modification method<br>(meshadaptmethod set to modify).                                           |
| elementspar             | Positive scalar                 | 0.5                                                   | Element fraction (for adaptation).                                                                                                                           |
| elselect                | globalmin   worst  <br>elements | globalmin                                             | Method for selecting elements to<br>refine (for adaptation).                                                                                                 |
| erredim                 | domain   boundary   edge        | domain                                                | Geometric entity selection for the<br>adaptation. edge is only available in<br>3D.                                                                           |
| errestandadap           | none   adaption   errest        | none                                                  | Perform adaptation or error<br>estimation (or none).                                                                                                         |
| errestim                | l2errest   goalerrest           | l2errest<br>for adaption;<br>goalerrest<br>for errest | Error estimate.                                                                                                                                              |
| gfunc                   | String                          |                                                       | Functional when goalfunctype is<br>set to gfman.                                                                                                             |
| goalerrest              | on   off                        | off                                                   | Goal-oriented error estimation.                                                                                                                              |
| goalfuncpredef          | gfint   gfl2   gfl1  <br>gflinf | gfint                                                 | Predefined functionals for the<br>solution when goalfunctype is set<br>to gfpredef: integral (the default),<br>L2 norm, L1 norm, or approximate<br>max norm. |
| goalfunctype            | gfpredef   gfman                | gfpredef                                              | Functional type: predefined (the<br>default) or manual.                                                                                                      |
| goalorientedtermination | off   auto   manual             | off                                                   | Activate goal-oriented termination.<br>See below for additional properties<br>when set to manual.                                                            |
| goeloglevel             | minimal   normal  <br>detailed  | normal                                                | Level of information in the log for<br>adaptation using goal-oriented<br>termination.                                                                        |
| goeplot                 | Boolean                         | true                                                  | Output goal-oriented termination<br>increments.                                                                                                              |
| goetableid              | table name   new                | new                                                   | Table to use for convergence<br>information from adaptation using<br>goal-oriented termination.                                                              |
| globalminpar            | Positive scalar                 | 1.7                                                   | Element growth rate (for<br>adaptation).                                                                                                                     |
| l2scale                 | String                          | 1                                                     | Scaling factor.                                                                                                                                              |
| l2staborder             | String                          | 2                                                     | Stability estimate derivative order                                                                                                                          |
| maxrefinement           | scalar integer                  | 5                                                     | Maximum number of element<br>refinements (available when<br>meshadaptmethod is not<br>rebuild).                                                              |
| maxscale                | Double                          | 3                                                     | Maximum coarsening factor (for<br>adaptation).                                                                                                               |
| maxt                    | Double                          | 1E7                                                   | Maximum number of elements (for<br>adaptation).                                                                                                              |

TABLE 6-171: PROPERTIES FOR MESH ADAPTATION AND ERROR ESTIMATES.

| PROPERTY        | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                         |
|-----------------|-----------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| meshadaptmethod | modify   rebuild  <br>regular   longest | longest | The refinement method for mesh<br>adaptation (general mesh<br>modification, rebuild mesh, regular<br>refinement, or longest edge<br>refinement)                                                                                                     |
| ngen            | Scalar integer                          | 2       | Maximum number of refinements<br>(for adaptation).                                                                                                                                                                                                  |
| resorder        | String                                  | 0       | Residual order.                                                                                                                                                                                                                                     |
| savesolsref     | true   false                            | true    | Save solution on every refined mesh<br>(for adaptation).                                                                                                                                                                                            |
| selection       | first   last   all  <br>manual          | last    | Solution selection: the first or last<br>solution, all solutions, or manual,<br>using weights and solution number<br>indices in adapsolnum.<br>Eigenfrequency studies use all with<br>weights set to 1, which then uses<br>the first solution only. |
| weights         | double[] (positive values)              | 1.0     | Weight for each selected solution<br>(for adaptation).                                                                                                                                                                                              |
| window          | graphics   new                          | new     | Plot window to use for displaying<br>converge of goal-oriented<br>termination.                                                                                                                                                                      |
| worstpar        | positive scalar                         |         | Controls refinement if<br>elselect=worst (for adaptation).                                                                                                                                                                                          |

When the goalorientedtermination property is set to manual, you can add goal-oriented termination expression using the setIndex() method:

- **•** goalorientedterminationexpression: The expression for goal-oriented termination.
- **•** goalorientedterminationtolerance: The tolerance for the goal-oriented termination.
- **•** goalorientedtolerancetype: The tolerance type: "relative" or "absolute".
- **•** goalorientedterminationactive: If the goal-oriented expression is active or not (true or false).

TABLE 6-172: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY          | VALUE                              | DEFAULT                      | DESCRIPTION                                                                                   |
|-------------------|------------------------------------|------------------------------|-----------------------------------------------------------------------------------------------|
| constraintgroup   | Matrix with "on"/<br>"off" entries | Matrix<br>with only<br>"off" | Constraint group status (active or not). One<br>row per load case.                            |
| loadcase          | Vector of strings                  |                              | Load cases.                                                                                   |
| loadgroup         | Matrix with "on"/<br>"off" entries | Matrix<br>with only<br>"off" | Load group status (active or not). One row per<br>load case.                                  |
| loadgroupweight   | Real matrix                        | off                          | Weight of each load case (as a scalar number).<br>One row per load case.                      |
| pcontinuation     | String                             |                              | Continuation parameter when<br>pcontinuationmode = manual.                                    |
| pcontinuationmode | no   last   manual                 | last                         | Determines if a continuation sweep should be<br>performed for one of the parameters in pname. |
| pdistrib          | on   off                           | off                          | Distribute parametric sweep.                                                                  |

TABLE 6-172: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE             | DEFAULT | DESCRIPTION                                                                  |
|-------------|-------------------|---------|------------------------------------------------------------------------------|
| plistarr    | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.           |
| pname       | Vector of strings |         | Parameter names.                                                             |
| preusesol   | no   yes   auto   | no      | Determines how the converged solutions are<br>reused in the parameter sweep. |
| punit       | Vector of strings |         | Parameter units.                                                             |
| sweeptype   | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                      |
| useloadcase | on   off          | off     | Define load cases.                                                           |
| useparam    | on   off          | off     | Auxiliary sweep.                                                             |

