# *Chamfer*

Create flattened corners in 2D objects. The Design Module also supports 3D chamfers.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Chamfer");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Chamfer") to chamfer corners in 2D.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("point") to select the corners to chamfer. The default selection is empty.

TABLE 3-35: VALID PROPERTY/VALUE PAIRS.

| PROPERTY       | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|----------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| customcolor    | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                      |
| dist           | double                                                                                      | 0                             | Distance from vertex to chamfer.                                                                                                                                                                                                           |
| point          | Selection                                                                                   |                               | Vertices to chamfer.                                                                                                                                                                                                                       |
| pointinsketch  | Selection                                                                                   |                               | Vertices to chamfer in sketch geometry.                                                                                                                                                                                                    |
| selectinsketch | on   off                                                                                    | on                            | Determines whether you can use the pointinsketch<br>property. It can be off in models made in version 6.0 or<br>earlier.                                                                                                                   |
| selresult      | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow  | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto   | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The point property contains the vertices to chamfer in the usual geometry visualization. The pointinsketch property contains the vertices to chamfer in the sketch visualization. These properties are automatically kept synchronized.

Additional properties are available with the Design Module, see Chamfer.

The following attributes are available:

TABLE 3-36: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

