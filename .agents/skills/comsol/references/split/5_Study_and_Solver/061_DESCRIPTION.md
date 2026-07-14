# **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-90: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY  | VALUE             | DEFAULT | DESCRIPTION                                                        |
|-----------|-------------------|---------|--------------------------------------------------------------------|
| plistarr  | Real matrix       |         | List of parameter values. One row of values per<br>parameter name. |
| pname     | Vector of strings |         | Parameter names.                                                   |
| punit     | Vector of strings |         | Parameter units.                                                   |
| sweeptype | filled   sparse   | sparse  | Sweep type.                                                        |

TABLE 6-91: PROPERTIES FOR OUTPUT WHILE SOLVING.

| PROPERTY      | VALUE               | DEFAULT | DESCRIPTION                                    |
|---------------|---------------------|---------|------------------------------------------------|
| accumtable    | String              | new     | Accumulated probe table.                       |
| accumtableall | on   off            | on      | Use all probes for the accumulated probe table |
| probes        | Vector of strings   |         | Probes to use when probesel=manual.            |
| probesel      | all   none   manual | all     | Probes to compute.                             |
| useaccumtable | on   off            | on      | Use accumulated probe table.                   |

TABLE 6-92: PROPERTIES FOR BATCH SETTINGS.

| PROPERTY            | VALUE      | DEFAULT        | DESCRIPTION                                                           |
|---------------------|------------|----------------|-----------------------------------------------------------------------|
| batchfile           | String     | batchmodel.mph | Name of batch model file.                                             |
| clearmesh           | on   off   | on             | Clear meshes.                                                         |
| clearsol            | on   off   | on             | Clear solutions.                                                      |
| extsolvergen        | on   off   | off            | Generate solver sequence in external<br>process.                      |
| paramfilename       | on   index | on             | Add parameter names and values or shorter<br>indices to the filename. |
| savefile            | on   off   | off            | Output model to file.                                                 |
| serverdir           | String     |                | Server directory.                                                     |
| specserverdir       | on   off   | off            | Specify server directory path.                                        |
| sychaccumprobetable | on   off   | on             | Synchronize accumulated probe table.                                  |
| synchsolutions      | on   off   | off            | Synchronize solutions.                                                |

TABLE 6-93: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                          |
|-------------|----------|---------|--------------------------------------|
| graphics    | on   off | off     | Use graphics.                        |
| maxalive    | Integer  |         | Alive time (seconds).                |
| maxallow    | Integer  | 1       | Maximum number of simultaneous jobs. |
| maxrestarts | Integer  |         | Maximum number of job restarts.      |

