# *StatAcceleration*

Handle stationary acceleration for nonlinear problems with time-periodic stationary solution.

## **SYNTAX**

model.sol(sname).feature(solv).create(fname,"StatAcceleration")

## **DESCRIPTION**

This feature can added as a subfeature to the Time-Dependent Solver and the Time Discrete Solver. Instead of time marching the problem from start to finish, the Stationary Acceleration node solves for a number of periods and then extrapolates the solution forward in time based on the average solution and the average time derivative. This solution process is repeated until the average time derivative has reached steady state.

TABLE 6-68: VALID PROPERTIES FOR STATACCELERATION.

| PROPERTY       | VALUE             | DEFAULT    | DESCRIPTION                                                                    |
|----------------|-------------------|------------|--------------------------------------------------------------------------------|
| acccomp        | vector of strings |            | Variable components to use stationary acceleration on<br>if accvarspec=manual. |
| accvar         | vector of strings |            | Variables to use stationary acceleration on.                                   |
| accvarspec     | all   manual      | all        | Include all components or specify which manually.                              |
| stataccfreq    | String            | 13.56[MHz] | Frequency of periodic solution.                                                |
| statacctol     | double            | 0.01       | Stationary tolerance.                                                          |
| stataccnperext | integer           | 50         | Number of extrapolation cycles.                                                |
| stataccnperavg | integer           | 5          | Number of period averaging cycles.                                             |
| stataccsmooth  | integer           | 10         | Number of smoothing cycles.                                                    |

