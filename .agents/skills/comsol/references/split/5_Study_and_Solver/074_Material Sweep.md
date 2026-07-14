# *Material Sweep*

A Material Sweep study step is a special case of a Parametric Sweep study step, where the solver sweeps over materials defined under a Switch node in the Model Builder.

## **SYNTAX**

```
model.study(stdname).create(fname, "MaterialSweep");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-140: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY | VALUE                                    | DEFAULT | DESCRIPTION                                                                                        |
|----------|------------------------------------------|---------|----------------------------------------------------------------------------------------------------|
| plistarr | Vector of integer<br>vectors             |         | Integer case numbers. One list of integers (for<br>example, range(1,1,10)) per material<br>switch. |
| pname    | Vector of strings                        |         | Material switches.                                                                                 |
| pcase    | Vector with entries<br>"all" and "user". | ["all"] | Cases, one per material switch.                                                                    |

TABLE 6-141: ADVANCED AND OTHER PROPERTIES.

| PROPERTY      | VALUE                          | DEFAULT | DESCRIPTION                                                                                                                                              |
|---------------|--------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| accumtable    | String                         | new     | Accumulated probe table.                                                                                                                                 |
| accumtableall | on   off                       | on      | Use all probes for the accumulated probe table.                                                                                                          |
| defsolvergen  | global   first  <br>last   all | global  | Control when a solver sequence should be<br>generated during a material sweep using global<br>parameters or the first, last, or each parameter<br>tuple. |
| filename      | String                         |         | Filename.                                                                                                                                                |
| keepsol       | last   all                     |         | Keep solutions (only the last or all solutions).                                                                                                         |
| pdistrib      | true   false                   | false   | Distribute parametric sweep.                                                                                                                             |
| plot          | on   off                       | off     | Plot while solving.                                                                                                                                      |
| plotgroup     | String                         | default | Plot group to use for plot while solving.                                                                                                                |
| probes        | Vector of strings              |         | Probes to use when probesel=manual.                                                                                                                      |
| probesel      | all   none   manual            | all     | Probes to compute.                                                                                                                                       |
| save          | on   off                       |         | Save each solution as a model file.                                                                                                                      |
| useaccumtable | on   off                       | on      | Use an accumulated probe table.                                                                                                                          |

