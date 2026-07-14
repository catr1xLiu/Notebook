# *Piecewise*

Generate a *piecewise* interpolation function, which is created by splicing together several functions, each defined on one interval.

TABLE 2-84: PIECEWISE PROPERTIES.

| NAME        | VALUE                                            | DEFAULT      | DESCRIPTION                                                         |
|-------------|--------------------------------------------------|--------------|---------------------------------------------------------------------|
| arg         | String                                           | x            | The argument to the function.                                       |
| extrap      | const   interior  <br>none   periodic  <br>value | const        | The extrapolation method.                                           |
| extrapvalue | double                                           | 0            | The extrapolation value if extrap is value.                         |
| funcname    | String                                           | The tag name | The name of the function.                                           |
| pieces      | N-by-3 String array                              | Empty        | (left, right, expression) for each interval.                        |
| pname       | String array                                     | {}           | Local parameter names, using setIndex.                              |
| plist       | String array                                     | {}           | Local parameter expressions, using setIndex.                        |
| smooth      | none   cont   contd1  <br>contd2                 | none         | The type of smoothing.                                              |
| smoothzone  | double                                           | 0.1          | The relative size of the smoothing zone if smoothing is<br>enabled. |

TABLE 2-84: PIECEWISE PROPERTIES.

| NAME    | VALUE  | DEFAULT | DESCRIPTION                                                    |
|---------|--------|---------|----------------------------------------------------------------|
| argunit | String |         | A comma-separated list of required units for each<br>argument. |
| fununit | String |         | The unit of the function's result.                             |

#### *GaussianPulse*

Generate a *Gaussian pulse* function. This function is the common bell-shaped curve (Gaussian function).

TABLE 2-85: GAUSSIAN PULSE PROPERTIES.

| NAME          | VALUE              | DEFAULT      | DESCRIPTION                                                   |
|---------------|--------------------|--------------|---------------------------------------------------------------|
| baseline      | double             | 0            | The baseline for the function.                                |
| funcname      | String             | The tag name | The name of the function.                                     |
| integralvalue | double             | 1            | The integral value, when normalization is set to integral.    |
| location      | String             | 0            | Where the pulse peaks.                                        |
| peakvalue     | double             | 1            | The peak value, when normalization is set to peak.            |
| sigma         | String             | 1            | The standard deviation of the underlying normal distribution. |
| normalization | integral  <br>peak | integral     | The normalization method to use.                              |

#### *Ramp*

Generate a *ramp* function.

TABLE 2-86: RAMP PROPERTIES.

| NAME                   | VALUE   | DEFAULT      | DESCRIPTION                                                                                |
|------------------------|---------|--------------|--------------------------------------------------------------------------------------------|
| baseline               | double  | 0            | The baseline for the function.                                                             |
| cutoffactive           | boolean | false        | If true, then the ramp ends when it reaches the cutoff<br>value.                           |
| cutoff                 | double  | 1            | If cutoffactive is true, the level where the ramp ends.                                    |
| funcname               | String  | The tag name | The name of the function.                                                                  |
| location               | String  | 0            | Where the ramp starts.                                                                     |
| slope                  | String  | 1            | The slope of the ramp.                                                                     |
| ncontder               | 1 or 2  | 2            | The number of continuous derivatives if smoothing is<br>enabled.                           |
| smoothzonecutoffactive | boolean | false        | Smooth the transition where the ramp ends at the<br>cutoff.                                |
| smoothzonelocactive    | boolean | false        | Smooth the transition where the ramp starts.                                               |
| smoothzonecutoff       | double  | 0.1          | The relative size of the smoothing zone for the cutoff,<br>if smoothing is enabled.        |
| smoothzoneloc          | double  | 0.1          | The relative size of the smoothing zone where the<br>ramp starts, if smoothing is enabled. |

## *Rectangle*

Generate a *rectangle*-shaped function.

TABLE 2-87: RECTANGLE PROPERTIES.

| NAME      | VALUE  | DEFAULT      | DESCRIPTION                     |
|-----------|--------|--------------|---------------------------------|
| amplitude | double | 1            | The amplitude for the function. |
| baseline  | double | 0            | The baseline for the function.  |
| funcname  | String | The tag name | The name of the function.       |
| lower     | String | -0.5         | Where the high zone begins.     |

TABLE 2-87: RECTANGLE PROPERTIES.

| NAME       | VALUE   | DEFAULT | DESCRIPTION                                                         |
|------------|---------|---------|---------------------------------------------------------------------|
| ncontder   | 1 or 2  | 2       | The number of continuous derivatives if smoothing is enabled.       |
| smooth     | boolean | true    | Smooth the transitions?                                             |
| smoothzone | String  | 0.1     | The size of the smoothing zone on both sides of the<br>transitions. |
| upper      | String  | 0.5     | Where the high zone ends.                                           |

#### *Step*

Generate a *step* function.

TABLE 2-88: STEP PROPERTIES.

| NAME        | VALUE                       | DEFAULT      | DESCRIPTION                                                                       |
|-------------|-----------------------------|--------------|-----------------------------------------------------------------------------------|
| baseline    | double                      | 0            | The baseline for the function.                                                    |
| from        | String                      | 0            | The value to the left of the location.                                            |
| funcname    | String                      | The tag name | The name of the function.                                                         |
| location    | String                      | 0            | Where the step is located.                                                        |
| locationdef | beginning  <br>middle   end | middle       | Location for the smoothing: beginning of step, middle of step,<br>or end of step. |
| ncontder    | 1 or 2                      | 2            | The number of continuous derivatives if smoothing is enabled.                     |
| smooth      | boolean                     | true         | Smooth the transition?                                                            |
| smoothzone  | String                      | 0.1          | The size of the smoothing zone on both sides of location.                         |
| to          | String                      | 1            | The value to the right of the location.                                           |

#### *Triangle*

Generate a *triangle*-shaped function.

TABLE 2-89: TRIANGLE PROPERTIES.

| NAME       | VALUE   | DEFAULT      | DESCRIPTION                                                   |
|------------|---------|--------------|---------------------------------------------------------------|
| amplitude  | double  | 1            | The amplitude for the function.                               |
| baseline   | double  | 0            | The baseline for the function.                                |
| funcname   | String  | The tag name | The name of the function.                                     |
| lower      | String  | -0.5         | Where the high zone begins.                                   |
| ncontder   | 1 or 2  | 2            | The number of continuous derivatives if smoothing is enabled. |
| smooth     | boolean | true         | Smooth the transitions.                                       |
| smoothzone | String  | 0.1          | Size of smoothing zone on both sides of the transitions.      |
| upper      | String  | 0.5          | Where the high zone ends.                                     |

