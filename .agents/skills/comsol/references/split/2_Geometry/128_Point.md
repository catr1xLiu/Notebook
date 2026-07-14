# *Point*

Create a point object in 1D, 2D, or 3D.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Point");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Point") to create one or more points. The following property is available:

TABLE 3-134: VALID PROPERTY/VALUE PAIR.

| PROPERTY NAME | PROPERTY VALUE                     | DEFAULT                        | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| p             | double[]  <br>double[][]           | 0                              | Coordinates.                                                                                                                                                                                                                               |
| selresult     | on   off                           | off                            | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   bnd<br>  pnt   off     | pnt in 2D and 3D;<br>bnd in 1D | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                             | none                           | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| workplanesrc  | this  <br>part-instance<br>feature | this                           | Part-instance feature to take the work plane from (in<br>3D only).                                                                                                                                                                         |
| workplane     | xyplane  <br>work-plane<br>feature | xyplane                        | Work-plane feature that defines the coordinate system<br>(in 3D only). The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                 |

If p is a one-dimensional array, a single point with these coordinates is constructed. If p is a two-dimensional array, a point object containing several points is constructed, where the nth point has ith coordinate p[i][n].

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Point.

The following attributes are available:

TABLE 3-135: VALID ATTRIBUTES.

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                                               |
|--------------|----------|---------|-------------------------------------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. Available only in 2D and 3D. |

## **COMPATIBILITY**

The following aliases work in 1D, 2D, and 3D, respectively:

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"point1");
model.component(<ctag>).geom(<tag>).create(<ftag>,"point2");
model.component(<ctag>).geom(<tag>).create(<ftag>,"point3");
```

