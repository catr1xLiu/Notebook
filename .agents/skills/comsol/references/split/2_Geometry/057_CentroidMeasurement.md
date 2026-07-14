# *CentroidMeasurement*

Create parameters for the average position of a selection of vertices.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CentroidMeasurement");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CentroidMeasurement") to create parameters for the average position of vertices.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("ent").set() to select the vertices to measure. The default selection is empty.

Use double[] parvalues = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*). getDoubleArray("parval"); to access the parameter values.

TABLE 3-34: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                                                               |
|----------|-----------|---------|---------------------------------------------------------------------------|
| ent      | Selection |         | Specify the vertex selection.                                             |
| parname  | String[]  |         | Parameter names. The array has the length of the space<br>dimension, sdim |
| parval   | double[]  |         | To access the parameter values (read-only).                               |

## **SEE ALSO**

DistanceMeasurement, Measurement Methods

