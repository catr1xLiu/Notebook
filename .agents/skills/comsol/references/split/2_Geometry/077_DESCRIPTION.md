# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"DistanceMeasurement") to create parameters for distance and vectorial distance.

Use the following methods to specify the dimension of the second entity as well as selecting it:

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("ent2").init()
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("ent2").set()
```

to select the end edge, boundary or point of the measurement. The default selection is empty.

Use double[] parvalues = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*). getDoubleArray("parvalvec"); to access the parameter values (similar for parval).

TABLE 3-65: VALID PROPERTY/VALUE PAIRS.

| PROPERTY   | VALUE     | DEFAULT | DESCRIPTION                                                                                           |  |
|------------|-----------|---------|-------------------------------------------------------------------------------------------------------|--|
| ent1       | Selection |         | Specify a vertex as first entity.                                                                     |  |
| ent2       | Selection |         | Specify a second entity. Dimension 0 and 1 supported.                                                 |  |
| extendent  | on   off  | off     | Extend a straight or circular edge specified in ent2.                                                 |  |
| parname    | String    |         | Parameter names for the Euclidean distance.                                                           |  |
| parnamevec | String[]  |         | Parameter names for the vectorial distances. The array has the<br>length of the space dimension, sdim |  |
| parval     | double    |         | To access parameter value of Euclidean distance (read-only).                                          |  |
| parvalvec  | double[]  |         | To access parameter values of vectorial distances (read-only).                                        |  |

