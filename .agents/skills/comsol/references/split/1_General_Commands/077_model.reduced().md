# *model.reduced()*

#### Reduced-order modeling.

There are reduced-order models of different types. The properties listed below are set and accessed using generic set and get methods described in set() and get\* and Selection Access Methods. The following reduced-order model types are currently supported:

TABLE 2-114: REDUCED-ORDER MODEL TYPES.

| TYPE           | DESCRIPTION                                                                                         |
|----------------|-----------------------------------------------------------------------------------------------------|
| ModalFrequency | Created by the Model Reduction study step for a parametric problem using the modal solver.          |
| ModalTransient | Created by the Model Reduction study for a time-dependent problem using the modal solver.           |
| PODFrequency   | Created by the Model Reduction study step for a frequency-dependent problem using POD<br>reduction. |

TABLE 2-114: REDUCED-ORDER MODEL TYPES.

| TYPE            | DESCRIPTION                                                                                                                  |
|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| PODTransient    | Created by the Model Reduction study for a time-dependent problem using POD reduction.                                       |
| AWE             | Created by the Model Reduction study step for a parametric problem using the asymptotic<br>waveform evaluation (AWE) solver. |
| RandomVibration | Uses a Frequency-Domain, Modal Reduced-Order Model to compute model response to<br>random excitations.                       |

#### **SYNTAX**

```
model.reduced()
model.reduced().create(<tag>, <type>);
model.reduced().getM(String)
model.reduced().getN(String)
model.reduced().getNnz(String)
model.reduced().getOutputs()
model.reduced().getParameters()
model.reduced().getSparseMatrixCol(String)
model.reduced().getSparseMatrixRow(String)
model.reduced().getSparseMatrixVal(String)
model.reduced().getSparseMatrixValImag(String)
model.reduced().getVector(String)
model.reduced().getVectorImag(String)
model.reduced().isReal(String)
```

#### **DESCRIPTION**

model.reduced().create(*<tag>*,*<type>*) creates a reduced-model container of the specified type.

Depending on the type of reduced-order model, the following properties are available:

TABLE 2-115: PROPERTIES FOR REDUCED-ORDER MODEL TYPES.

| NAME                 | VALUE         | DEFAULT | DESCRIPTION                                                                        | READ ONLY |
|----------------------|---------------|---------|------------------------------------------------------------------------------------|-----------|
| depvars              | boolean       | false   | Controls if models with output variables<br>should define degrees of freedom.      |           |
| depvarnames          | String array  | {}      | Names of dependent variables.                                                      |           |
| information          | String        | Empty   | Model information.                                                                 | √         |
| logMessage           | String        | Empty   | The Build log.                                                                     | √         |
| matrices             | String matrix | {{}}    | Names and descriptions of matrices.                                                | √         |
| metaCOMSOLVersion    | String        | Empty   | String description of the COMSOL version<br>when the model has been created.       | √         |
| metaCOMSOLVersionInt | String        | Empty   | Numerical representation of the COMSOL<br>version when the model has been created. | √         |
| outputDescr          | String array  | {}      | Descriptions of output variables.                                                  | √         |
| outputExprs          | String array  | {}      | Values or expressions of output variables.                                         | √         |
| outputNames          | String array  | {}      | Names of output variables.                                                         | √         |
| reconstructors       | String array  | {}      | Names of reconstruction variables.                                                 | √         |
| reconstructorDescr   | String array  | {}      | Descriptions of reconstruction variables.                                          | √         |
| vectors              | String matrix | {{}}    | Names and descriptions of vectors.                                                 | √         |

Note that only metaCOMSOLVersion and metaCOMSOLVersionInt are defined for the RandomVibration reducedorder model..

TABLE 2-116: PROPERTIES FOR THE MODALFREQUENCY REDUCED-ORDER MODEL.

| NAME                    | VALUE                    | DEFAULT                                                                                                            | DESCRIPTION                                                                                                                                                     | READ ONLY                                                                                                   |
|-------------------------|--------------------------|--------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| constrStateDescrs       | String array             | Constraint mode Y,<br>where "Y" represents<br>the index of the<br>constraint mode<br>among all constraint<br>modes | Description of the<br>Constraint mode.                                                                                                                          | Read only<br>in the<br>stateless<br>case;<br>editable in<br>the<br>stateful<br>case.                        |
| constrStateExprs        | String array             | {"0"}                                                                                                              | Constraint expression. This<br>is the Model Control Input<br>expression if one was found.<br>Else this expression is 0 per<br>default.                          | If the<br>constraint<br>variable is<br>mapped to<br>an input,<br>then its<br>expression<br>is read<br>only. |
| constrStateNames        | String array             | romX.constrStateY,<br>where "Y" represents<br>the index of the<br>constraint mode<br>among all constraint<br>modes | Constraint DOF variable<br>name (alias). This variable will<br>evaluate to the ROM<br>operator rom1.state(X),<br>with X being the internal<br>state DOF number. | √                                                                                                           |
| constrStateModesIndices | String array             | {}                                                                                                                 | The actual mode index of<br>constraint modes among all<br>modes.                                                                                                | √                                                                                                           |
| constrStateUsed         | String array             | {"off"}                                                                                                            | Flag for enabling and disabling<br>constraints for the constraint<br>variables.                                                                                 |                                                                                                             |
| controls                | String array             | {}                                                                                                                 | Values or expressions of<br>control variables.                                                                                                                  |                                                                                                             |
| controlDescr            | String array             | {}                                                                                                                 | Descriptions of control<br>variables.                                                                                                                           | √                                                                                                           |
| controlNames            | String array             | {}                                                                                                                 | Names of control variables.                                                                                                                                     | √                                                                                                           |
| dampingRatio            | String                   | "0"                                                                                                                | Damping ratio used by<br>Uniform damping.                                                                                                                       |                                                                                                             |
| dampingRatioPerMode     | String array             | {"0"}                                                                                                              | Damping ratio for each<br>eigenmode.                                                                                                                            |                                                                                                             |
| form                    | Automatic  <br>Frequency | Automatic                                                                                                          | Equation form (when<br>interf is stateful): study<br>controlled (Automatic) or<br>frequency domain<br>(Frequency).                                              |                                                                                                             |
| freq                    | String                   | freq                                                                                                               | Value or expression for the<br>frequency, when freq_src<br>is userdef or interf is<br>stateless.                                                                |                                                                                                             |

TABLE 2-116: PROPERTIES FOR THE MODALFREQUENCY REDUCED-ORDER MODEL.

| NAME             | VALUE                   | DEFAULT                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | DESCRIPTION                                                                                     | READ ONLY |
|------------------|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|-----------|
| freq_src         | fromSolver<br>  userdef | fromSolver                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Frequency source: from the<br>solver or a user-defined<br>frequency, when form is<br>Frequency. |           |
| interf           | stateful  <br>stateless | stateless                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Use a stateless or stateful<br>interface.                                                       |           |
| loadfact         | String                  | 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Load factor value or<br>expression.                                                             |           |
| matrices         | String matrix           | {{"Kr",<br>"Stiffness<br>matrix"},<br>{"Kr_c",<br>"Constrained<br>part of stiffness<br>matrix"},<br>{"Dr", "Damping<br>matrix"},<br>{"Dr_c",<br>"Constrained<br>part of damping<br>matrix"},<br>{"Dra", "Damping<br>ratio matrix"},<br>{"Dra_c",<br>"Constrained<br>part of damping<br>ratio matrix"},<br>{"Er", "Mass<br>matrix"},<br>{"Er_c",<br>"Constrained<br>part of mass<br>matrix"},<br>{"Br", "Input<br>matrix"},<br>{"Cr", "Output<br>matrix"},<br>{"F", "Input<br>feedback | Names and descriptions of<br>matrices.                                                          | √         |
| modalfrequencies | String array            | matrix"}}                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Frequency for each<br>eigenmode.                                                                | √         |
| modalDamping     | String                  | noDamping                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Damping of Modal reduced<br>order model.                                                        |           |

TABLE 2-116: PROPERTIES FOR THE MODALFREQUENCY REDUCED-ORDER MODEL.

| NAME            | VALUE         | DEFAULT                                                                                                                                                                                                                                                  | DESCRIPTION                                                                                                                 | READ ONLY |
|-----------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------|
| solveElimSystem | boolean       | false                                                                                                                                                                                                                                                    | Solve an eliminated system<br>with constraints from<br>constrain modes being<br>removed, when interf is<br>set to stateful. |           |
| vectors         | String matrix | {{"L", "Load<br>vector"},<br>{"Y0", "Output<br>bias"},<br>{"EPartSol",<br>"Mass matrix<br>times particular<br>solution"},<br>{"DPartSol",<br>"Damping matrix<br>times particular<br>solution"}},<br>{"CImap",<br>"Constraint<br>modes to inputs<br>map"} | Names and descriptions of<br>vectors.                                                                                       | √         |

TABLE 2-117: PROPERTIES FOR THE MODALTRANSIENT REDUCED-ORDER MODEL.

| NAME                    | VALUE        | DEFAULT                                                                                                            | DESCRIPTION                                                                                                                                                     | READ ONLY                                                                                                   |
|-------------------------|--------------|--------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| constrStateDescrs       | String array | Constraint mode Y,<br>where "Y" represents<br>the index of the<br>constraint mode<br>among all constraint<br>modes | Description of the Constraint<br>mode.                                                                                                                          | Read only<br>in the<br>stateless<br>case;<br>editable in<br>the<br>stateful<br>case.                        |
| constrStateExprs        | String array | {"0"}                                                                                                              | Constraint expression. This is<br>the Model Control Input<br>expression if one was found.<br>Else this expression is 0 per<br>default.                          | If the<br>constraint<br>variable is<br>mapped to<br>an input,<br>then its<br>expression<br>is read<br>only. |
| constrStateNames        | String array | romX.constrStateY,<br>where "Y" represents<br>the index of the<br>constraint mode<br>among all constraint<br>modes | Constraint DOF variable<br>name (alias). This variable will<br>evaluate to the ROM<br>operator rom1.state(X),<br>with X being the internal state<br>DOF number. | √                                                                                                           |
| constrStateModesIndices | String array | {}                                                                                                                 | The actual mode index of<br>constraint modes among all<br>modes.                                                                                                | √                                                                                                           |
| constrStateUsed         | String array | {"off"}                                                                                                            | Flag for enabling and disabling<br>constraints for the constraint<br>variables.                                                                                 |                                                                                                             |

TABLE 2-117: PROPERTIES FOR THE MODALTRANSIENT REDUCED-ORDER MODEL.

| NAME                | VALUE                    | DEFAULT   | DESCRIPTION                                                                                                | READ ONLY |
|---------------------|--------------------------|-----------|------------------------------------------------------------------------------------------------------------|-----------|
| controls            | String array             | {}        | Values or expressions of<br>control variables.                                                             |           |
| controlDescr        | String array             | {}        | Descriptions of control<br>variables.                                                                      | √         |
| controlNames        | String array             | {}        | Names of control variables.                                                                                | √         |
| dampingRatio        | String                   | 0         | Damping ratio used by<br>Uniform damping.                                                                  |           |
| dampingRatioPerMode | String array             | {0}       | Damping ratio for each<br>eigenmode.                                                                       |           |
| form                | Automatic  <br>Transient | Automatic | Equation form (when interf<br>is stateful): study<br>controlled (Automatic) or<br>time domain (Transient). |           |
| interf              | stateful  <br>stateless  | stateless | Use a stateless or stateful<br>interface.                                                                  |           |
| loadfact            | String                   | "1"       | Load factor value or<br>expression.                                                                        |           |

TABLE 2-117: PROPERTIES FOR THE MODALTRANSIENT REDUCED-ORDER MODEL.

| NAME     | VALUE         | DEFAULT                                                            | DESCRIPTION                            | READ ONLY |
|----------|---------------|--------------------------------------------------------------------|----------------------------------------|-----------|
| matrices | String matrix | {{"Kr","Stiffness<br>matrix"},                                     | Names and descriptions of<br>matrices. | √         |
|          |               | {"Kr_c",<br>"Constrained part<br>of stiffness                      |                                        |           |
|          |               | matrix"},                                                          |                                        |           |
|          |               | {"Kr", "Stiffness<br>matrix"},                                     |                                        |           |
|          |               | {"Dr", "Damping<br>matrix"},                                       |                                        |           |
|          |               | {"Dr_c",<br>"Constrained part<br>of damping<br>matrix"},           |                                        |           |
|          |               | {"Dra", "Damping<br>ratio matrix"},                                |                                        |           |
|          |               | {"Dra_c",<br>"Constrained part<br>of damping ratio<br>matrix"},    |                                        |           |
|          |               | {"Er", "Mass<br>matrix"},                                          |                                        |           |
|          |               | {"Er_c",<br>"Constrained part<br>of mass matrix"},                 |                                        |           |
|          |               | {"Br", "Input<br>matrix"},                                         |                                        |           |
|          |               | {"Cr", "Output<br>matrix"},                                        |                                        |           |
|          |               | {"F", "Input<br>feedback<br>matrix"},                              |                                        |           |
|          |               | {"B0r","Initial<br>value input<br>matrix"},                        |                                        |           |
|          |               | {"B0rdot",<br>"Initial value<br>time derivative<br>input matrix"}, |                                        |           |
|          |               | {"Brdot", "Time<br>derivative input<br>matrix"},                   |                                        |           |
|          |               | {"Brdotdot",<br>"Second time<br>derivative input<br>matrix"},      |                                        |           |
|          |               | {"Mc", "Mass<br>matrix"},                                          |                                        |           |
|          |               | {"Mc_c",<br>"Constrained part<br>of mass matrix"},                 |                                        |           |

TABLE 2-117: PROPERTIES FOR THE MODALTRANSIENT REDUCED-ORDER MODEL.

| NAME             | VALUE         | DEFAULT                                                                                                                                                                                                                                                                    | DESCRIPTION                                                                                                                 | READ ONLY |
|------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------|
| matrices         |               | {"MA", "Stiffness<br>matrix"},<br>{"MA_c",<br>"Constrained part<br>of stiffness<br>matrix"},<br>{"MB", "Input<br>matrix"},<br>{"D", "Input<br>feedback<br>matrix"},<br>{"C", "Output<br>matrix"},<br>{"C_c",<br>"Constrained part<br>of output<br>matrix"}}                | Continued from the previous<br>page.                                                                                        | √         |
| modalfrequencies | String array  |                                                                                                                                                                                                                                                                            | Frequency for each<br>eigenmode.                                                                                            | √         |
| modalDamping     | String        | noDamping                                                                                                                                                                                                                                                                  | Damping of Modal reduced<br>order model.                                                                                    |           |
| rtol             | double        | 0.01                                                                                                                                                                                                                                                                       | Relative tolerance.                                                                                                         |           |
| solveElimSystem  | boolean       | false                                                                                                                                                                                                                                                                      | Solve an eliminated system<br>with constraints from<br>constrain modes being<br>removed, when interf is set<br>to stateful. |           |
| time             | String        | t                                                                                                                                                                                                                                                                          | Value or expression for the<br>time, when interf is<br>stateless.                                                           |           |
| vectors          | String matrix | {{"L","Load<br>vector"},<br>{"Y0", "Output<br>bias"},<br>{"U0","Output<br>bias"},<br>{"Udot0","Initial<br>derivative<br>vector"},<br>{"Kud","Stiffness<br>matrix times<br>ud"},<br>{"x0","Initial<br>value vector"}},<br>{"CImap",<br>"Constraint modes<br>to inputs map"} | Names and descriptions of<br>vectors.                                                                                       | √         |

TABLE 2-118: PROPERTY FOR THE AWE REDUCED-ORDER MODEL.

| NAME | VALUE  | DEFAULT | DESCRIPTION                            | READ ONLY |
|------|--------|---------|----------------------------------------|-----------|
| freq | String | freq    | Value or expression for the frequency. |           |

TABLE 2-119: PROPERTIES FOR THE RANDOM VIBRATION MODEL.

| NAME                   | VALUE                                                     | DEFAULT      | DESCRIPTION                                                                                                               |
|------------------------|-----------------------------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------------|
| correlationMatrix      | upper-triangle of a matrix                                | all 0s       | The correlation matrix, when<br>correlationType is<br>crossCorrelated.                                                    |
| correlationType        | uncorrelated  <br>fullyCorrelated  <br>crossCorrelated    | uncorrelated | The correlation type.                                                                                                     |
| fHigh                  | positive double                                           | 1000         | Upper frequency limit as an<br>integration bound.                                                                         |
| fLow                   | positive double                                           | 1            | Lower frequency limit as an<br>integration bound.                                                                         |
| frequencyResponseModel | name of frequency<br>domain, modal reduced<br>order model |              | The frequency response model to use.<br>Specify its components using the<br>setIndex method.                              |
| integrationMethod      | automatic  <br>userDefined                                | automatic    | Use an automatic or user-defined<br>integration method.                                                                   |
| integrationPoints      | integer > 1                                               | 1001         | Number of integration points, if<br>integrationMethod is set to<br>userDefined.                                           |
| powerSpectralDensity   | double scalar vector                                      | all 0s       | The power spectral density for each<br>control name. Specify each power<br>spectral density using the setIndex<br>method. |

For information about the getM, getN, getNnz, isReal, and the getSparseMatrix and getVector methods, see the matrix data tables Table 6-6 and Table 6-7 in the *Solvers and Study Steps* chapter.

