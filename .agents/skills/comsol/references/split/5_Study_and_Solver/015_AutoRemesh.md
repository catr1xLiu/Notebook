# *AutoRemesh*

Iteratively and automatically create deformed geometries and remesh these geometries. In each step, map the solution and restart the simulation.

#### **SYNTAX**

model.sol(sname).feature(tname).create(fname,"AutoRemesh") model.sol(sname).feature(tname).feature(fname).set(pname,pvalue)

#### **DESCRIPTION**

Operation feature. The following property/values are accepted:

TABLE 6-27: VALID PROPERTY/VALUE PAIRS FOR AUTOREMESH.

| PROPERTY                    | VALUE                                                            | DEFAULT | DESCRIPTION                                                                                                        |
|-----------------------------|------------------------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------|
| autoremeshgeom              | String                                                           |         | Name of geometry sequence.                                                                                         |
| consistentremesh            | on   off                                                         | off     | Consistent initialization after remesh.                                                                            |
| initialstepremesh           | positive scalar                                                  | 0.001   | Initial time step size after remesh.                                                                               |
| initialstepremesh<br>active | on   off                                                         | off     | Use initialstepremesh.                                                                                             |
| remeshtimes                 | double array                                                     |         | Times for remeshing, if stepcondtype is spectime.                                                                  |
| remeshtimestep              | double                                                           |         | Time step for remeshing, if stepcondtype is<br>specstep.                                                           |
| solutionremesh              | tout   tstep                                                     | tstep   | Solution to use for remeshing.                                                                                     |
| stopcondtype                | quality  <br>distortion  <br>general  <br>spectime  <br>specstep | quality | Type of condition for remeshing: mesh quality,<br>distortion, general, specified times, or specified time<br>step. |
| stopdistexpr                | String                                                           |         | Distortion expression, if stepcondtype is<br>distortion.                                                           |
| stopdistval                 | String                                                           | 2       | Maximum distortion allowed, if stepcondtype is<br>distortion.                                                      |
| stopexpr                    | String                                                           |         | Mesh quality expression, if stepcondtype is<br>quality.                                                            |
| stopgenexpr                 | String                                                           |         | Logical condition for remeshing, if stepcondtype is<br>general.                                                    |
| stopval                     | String                                                           | 0.2     | Minimal mesh quality, if stepcondtype is quality.                                                                  |
| storesolmesh                | on   off                                                         | on      | Store solutions when new meshes are created.                                                                       |

The automatic remeshing solver works in one geometry at a time. You specify the name of the geometry sequence in the property autoremeshgeom. Automatic remeshing is available for Time-Dependent studies and is intended for use with the moving meshes and deformed geometries.

Use the stopcondtype property to select the type of condition for when remeshing should occur:

- **•** quality. This means that the solver remeshes when the value of stopexpr becomes smaller than the value of stopval.
- **•** distortion. This means that the solver remeshes when the value of stopdistexpr becomes larger than the value of stopdistval.
- **•** general. This means that the solver remeshes when the stopgenexpr property becomes true (nonzero).
- **•** spectime. This means that the solver remeshes at the times given in remeshtimes.
- **•** specstep. This means that the solver remeshes at the time step given in remeshtimestep.

The solutionremesh property determines which previous solution is used for the remeshing:

- **•** tout means that remeshing is done on the last solution that would have been stored by the solver if remeshing would not have occurred. This setting discards any solver progress done since the last output.
- **•** tstep means that the remeshing is done using the solution from the last solver step before the condition for remeshing became fulfilled. Only the very last solver step, at which the condition was triggered, is discarded. Typically this setting is preferred because then the progress of the automatic remeshing does not depend on the solver's list of output times.

After each remeshing, the time integration is restarted and you can control the time stepping by the Time type analogous properties consistentremesh and initialstepremesh.

If the time integrator runs into problems, the computation is restarted at the beginning of the previous time interval using stricter time stepping controls.

