# *PartitionFaces*

Partition faces in 3D geometries at some positions on the faces.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"PartitionFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

The Partition Faces operation partitions selected faces at specified locations. You can specify the positions using vertices to define curve segments, adjacent edges that are extended, or a work plane.

The following properties are available:

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                   |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of<br>resulting objects in physics, materials, and so on,<br>or in part instances. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| extendededge  | Selection                                                                                |                               | Planar edges defining partitioning lines, circles,<br>or planes.                                                                                                                                                                   |
| face          | Selection                                                                                |                               | Faces to partition.                                                                                                                                                                                                                |
| partitionwith | workplane  <br>curvesegments  <br>extendededges                                          | curvesegments                 | Method for partitioning the faces.                                                                                                                                                                                                 |
| vertexsegment | Selection                                                                                |                               | Vertices that define the curve segments.                                                                                                                                                                                           |
| workplane     | String                                                                                   |                               | Work plane to partition with.                                                                                                                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-133: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **SEE ALSO**

Partition, PartitionDomains, PartitionEdges

