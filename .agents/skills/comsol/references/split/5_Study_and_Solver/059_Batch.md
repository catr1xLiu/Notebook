# *Batch*

Use a Batch study step to start a COMSOL Multiphysics batch process that solves the current study on your computer.

## **SYNTAX**

```
model.study(stdname).create(fname, "Batch");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-88: PROPERTIES FOR BATCH SETTINGS.

| PROPERTY     | VALUE    | DEFAULT        | DESCRIPTION                                      |
|--------------|----------|----------------|--------------------------------------------------|
| batchfile    | String   | batchmodel.mph | Filename.                                        |
| extsolvergen | on   off | off            | Generate solver sequence in external<br>process. |

#### TABLE 6-89: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                          |
|-------------|----------|---------|--------------------------------------|
| graphics    | on   off | off     | Use graphics.                        |
| maxalive    | Integer  |         | Alive time (seconds).                |
| maxallow    | Integer  |         | Maximum number of simultaneous jobs. |
| maxrestarts | Integer  |         | Maximum number of job restarts.      |

