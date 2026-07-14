# *Frequency Domain and Frequency-Domain Perturbation*

A Frequency Domain study step is used to compute the response of a linear or linearized model subjected to harmonic excitation for one or several frequencies. A Frequency-Domain Perturbation study step is used for studying small oscillations about a biased solution (small-signal analysis).

## **SYNTAX**

```
model.study(stdname).create(fname, "Frequency");
model.study(stdname).create(fname, "Frequencylinearized");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available. The properties for linearization point are only available for the Frequency-Domain Perturbation study step (see Table 6-133 below).

TABLE 6-127: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY       | VALUE       | DEFAULT | DESCRIPTION            |
|----------------|-------------|---------|------------------------|
| loadparameters | String      |         | Load parameter values. |
| plist          | Real vector |         | Frequencies.           |

TABLE 6-127: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY  | VALUE           | DEFAULT | DESCRIPTION                                                                                                     |
|-----------|-----------------|---------|-----------------------------------------------------------------------------------------------------------------|
| preusesol | no   yes   auto | no      | Reuse solution from previous step. The default<br>is auto for MeanEnergies and<br>ReducedElectricField studies. |
| punit     | String          | Hz      | Frequency unit.                                                                                                 |
| stol      | Positive scalar | 0.001   | Relative tolerance, is usestol is set to true.                                                                  |
| usestol   | Boolean         | false   | Use a user-defined relative tolerance.                                                                          |

#### TABLE 6-128: PROPERTIES FOR RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |

#### TABLE 6-129: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

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

TABLE 6-130: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY        | VALUE              | DEFAULT | DESCRIPTION                                                               |
|-----------------|--------------------|---------|---------------------------------------------------------------------------|
| initmethod      | init   sol         | init    | Method for initial values for variables solved for.                       |
| initstudy       | String             |         | Reference to study or "zero" for zero<br>solution.                        |
| manualsolnum    | Vector of integers | [1]     | Index to solution for initial value for variables<br>solved for.          |
| notlistsolnum   | Vector of integers | [1]     | Indices to selected solutions for values for<br>variables not solved for. |
| notmanualsolnum | Vector of integers | [1]     | Indices to solutions for values for variables not<br>solved for.          |
| notsolmethod    | init   sol         | init    | Method for values for variables not solved for.                           |

TABLE 6-130: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
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

TABLE 6-131: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-132: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY          | VALUE              | DEFAULT | DESCRIPTION                                                                                   |
|-------------------|--------------------|---------|-----------------------------------------------------------------------------------------------|
| awe               | on   off           | off     | Use asymptotic waveform evaluation.                                                           |
| awefunc           | Vector of strings  |         | AWE expressions.                                                                              |
| pcontinuation     | String             |         | Continuation parameter when<br>pcontinuationmode = manual.                                    |
| pcontinuationmode | no   last   manual | last    | Determines if a continuation sweep should be<br>performed for one of the parameters in pname. |
| pdistrib          | on   off           | off     | Distribute parametric sweep.                                                                  |
| plistarr          | Real matrix        |         | List of parameter values. One row of values per<br>parameter name.                            |

TABLE 6-132: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY  | VALUE             | DEFAULT | DESCRIPTION                             |
|-----------|-------------------|---------|-----------------------------------------|
| pname     | Vector of strings |         | Parameter names.                        |
| punit     | String            |         | Parameter units.                        |
| sweeptype | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep. |
| useparam  | on   off          | off     | Auxiliary sweep.                        |

TABLE 6-133: LINEARIZATION POINT PROPERTIES FOR THE FREQUENCY-DOMAIN PERTURBATION STUDY STEP

| PROPERTY         | VALUE                                                                              | DEFAULT      | DESCRIPTION                                                                                         |
|------------------|------------------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------|
| linplistsolnum   | Integer array                                                                      | new int[]{1} | List of solutions to use for the linearization point,<br>when linpsolnum is set to from_list.       |
| linpmanualsolnum | Integer array                                                                      | new int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual. |
| linpmethod       | init   sol                                                                         | init         | Method used for linearization point, which for<br>sol is given by the linpsol property.             |
| linpsol          | zero   solution object                                                             | zero         | Linearization point solution.                                                                       |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1            | Indices to solutions to use as linearization points.                                                |
| linpsoluse       | current   manual  <br>solution store tag                                           | current      | Subsolution that defines linearization point for<br>the Eigenvalue study step.                      |
| linpsolusesolnum | integer                                                                            |              | Index for the solution to use when linpsoluse<br>is set to manual.                                  |
| linpstudy        | String                                                                             | zero         | Study that defines the linearization point for the<br>Frequency-Domain Perturbation study step.     |
| linpt            | double                                                                             | 0            | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                 |

For the adaptation and error estimates settings, see Table 6-171.

