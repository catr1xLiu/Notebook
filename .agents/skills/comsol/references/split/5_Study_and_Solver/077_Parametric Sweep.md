# *Parametric Sweep*

Use the Parametric Sweep study step when you want to find the solution to a sequence of stationary or time-dependent problems that arise when you vary some parameters of interest.

## **SYNTAX**

```
model.study(stdname).create(fname, "Parametric");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-148: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY           | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                  |
|--------------------|-------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| keepbeforeandafter | on   off          | off     | Store solutions not only before but also after<br>the stop condition has been fulfilled (only for<br>parametric sweep study steps in job<br>configurations). |
| plistarr           | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                                                                                           |
| pname              | Vector of strings |         | Parameter names.                                                                                                                                             |
| punit              | Vector of strings |         | Parameter units.                                                                                                                                             |

TABLE 6-148: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY  | VALUE                       | DEFAULT | DESCRIPTION                                                                                 |
|-----------|-----------------------------|---------|---------------------------------------------------------------------------------------------|
| stopcond  | String                      |         | Stop condition expression (only for parametric<br>sweep study steps in job configurations). |
| sweeptype | filled   sparse  <br>switch | sparse  | Sweep type.                                                                                 |

TABLE 6-149: ADVANCED AND OTHER PROPERTIES.

| PROPERTY      | VALUE                                      | DEFAULT    | DESCRIPTION                                                                                                                                                |
|---------------|--------------------------------------------|------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| accumtable    | String                                     | new        | Accumulated probe table.                                                                                                                                   |
| accumtableall | on   off                                   | on         | Use all probes for the accumulated probe<br>table.                                                                                                         |
| clearprevrom  | true   false                               | true       | Clear previously generated reduced-order<br>models.                                                                                                        |
| defsolvergen  | global   first  <br>last   all             | global     | Control when a solver sequence should be<br>generated during a parametric sweep using<br>global parameters or the first, last, or each<br>parameter tuple. |
| filename      | String                                     |            | Filename.                                                                                                                                                  |
| keepgenrom    | true   false                               | true       | Keep the generating reduced-order model.                                                                                                                   |
| keeprom       | on   off                                   | on         | Keep reduced-order models.                                                                                                                                 |
| keepsol       | last   all                                 |            | Keep solutions (only the last or all<br>solutions).                                                                                                        |
| plot          | on   off                                   | off        | Plot while solving.                                                                                                                                        |
| plotgroup     | String                                     | default    | Plot group to use for plot while solving.                                                                                                                  |
| probes        | Vector of strings                          |            | Probes to use when probesel=manual.                                                                                                                        |
| probesel      | all   none   manual                        | all        | Probes to compute.                                                                                                                                         |
| reusesol      | true   false                               | false      | Reuse solution from previous step.                                                                                                                         |
| romtagsuffix  | parindex  <br>parnameval  <br>parnamevalnz | parnameval | Add as suffix to tag: index, parameter name<br>and value (the default), or name and<br>nonzero value.                                                      |
| save          | on   off                                   |            | Save each solution as a model file.                                                                                                                        |
| switchcase    | Vector with entries<br>"all" and "user".   | {"all"}    | Cases, one per parameter switch.                                                                                                                           |
| switchlistarr | Vector of integer<br>vectors               |            | Integer case numbers. One list of integers<br>(for example, range(1,1,10)) per<br>parameter switch.                                                        |
| switchname    | Vector of strings                          |            | Parameter switches.                                                                                                                                        |
| useaccumtable | on   off                                   | on         | Use an accumulated probe table.                                                                                                                            |

TABLE 6-150: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE        | DEFAULT | DESCRIPTION                  |
|-------------|--------------|---------|------------------------------|
| pdistrib    | true   false | false   | Distribute parametric sweep. |
| paramselect | auto   off   | auto    | Use parametric solver.       |

