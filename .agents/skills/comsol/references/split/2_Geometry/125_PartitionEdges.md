# *PartitionEdges*

Partition edges in 2D or 3D geometries at some positions along the edges.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"PartitionEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

The Partition Edges operation partitions selected edges at specified locations. You can specify the positions using parameters based on the arc length or existing vertices whose orthogonal projections on the edges specify the positions.

The following properties are available:

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the number<br>of colors in the current<br>theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, in<br>physics, materials, and so on; in part instances;<br>or in 3D from a plane geometry. obj is not<br>available in a component's geometry. dom, bnd,<br>and edg are not available in all features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| edge          | Selection                                                                                |                               | Selection of edges to partition.                                                                                                                                                                                                           |
| position      | arclength   projection                                                                   | arclength                     | Specifies the position along the selected edges.                                                                                                                                                                                           |
| param         | double[]                                                                                 |                               | Relative arc length parameters.                                                                                                                                                                                                            |
| vertexproj    | Selection                                                                                |                               | Vertices to project on the selected edges.                                                                                                                                                                                                 |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-132: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

