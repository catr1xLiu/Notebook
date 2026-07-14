# *PartitionDomains*

Partition domains in 2D or 3D geometries with curves and surfaces defined in various ways.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"PartitionDomains");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

The Partition Domains operation partitions selected domains using curves or surfaces defined by vertices, edges, faces, work planes, or objects.

The following properties are available:

| PROPERTY     | VALUE                                                                                          | DEFAULT                                | DESCRIPTION                                                                                                                                                                                                   |
|--------------|------------------------------------------------------------------------------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| absrepairtol | double                                                                                         | geom( <tag>).<br/>absRepairTol()</tag> | Absolute repair tolerance.                                                                                                                                                                                    |
| color        | none   custom  <br>integer between<br>1 and the<br>number of<br>colors in the<br>current theme | none                                   | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is<br>only available when selresult in active. |
| contributeto | String                                                                                         | none                                   | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor  | RGB-triplet                                                                                    | Next available theme<br>color          | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| domain       | Selection                                                                                      |                                        | Selection of domains to partition.                                                                                                                                                                            |
| edge         | Selection                                                                                      |                                        | Edges that define the partitioning curves (2D).                                                                                                                                                               |
| extendededge | Selection                                                                                      |                                        | Edges whose underlying curves define the<br>partitioning curves (2D).                                                                                                                                         |
| extendedface | Selection                                                                                      |                                        | Faces whose underlying surfaces define the<br>partitioning surfaces (3D).                                                                                                                                     |
| face         | Selection                                                                                      |                                        | Faces that define the partitioning surfaces (3D).                                                                                                                                                             |
| keepobject   | on   off                                                                                       | on                                     | Keep objects used to partition the geometry with,<br>when partitionwith is set to objects.                                                                                                                    |
| object       | Selection                                                                                      |                                        | Geometry objects used to partition domains.                                                                                                                                                                   |

| PROPERTY      | VALUE                                                                              | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| partitionwith | linesegments  <br>lines   edges  <br>extendededges<br>  objects in 2D<br>workplane | linesegments in 2D,<br>workplane in 3D  | Method for partitioning the domains. The objects<br>option is not available for partitioning domains after<br>a form union/assembly operation.                                                                                             |
|               | faces  <br>extendedfaces<br>  objects in 3D                                        |                                         |                                                                                                                                                                                                                                            |
| propagatesel  | on   off                                                                           | on                                      | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                           |
| repairtol     | double                                                                             | geom( <tag>).<br/>repairTol()</tag>     | Relative repair tolerance, relative to size of union of<br>inputs.                                                                                                                                                                         |
| repairtoltype | auto  <br>relative  <br>absolute                                                   | geom( <tag>).<br/>repairTolType()</tag> | Repair tolerance type: automatic, relative, or<br>absolute.                                                                                                                                                                                |
| selresult     | on   off                                                                           | off                                     | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                      | dom                                     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| vertexsegment | Selection                                                                          |                                         | Vertices that define the line segments (2D).                                                                                                                                                                                               |
| vertexline    | Selection                                                                          |                                         | Vertices that define the lines (2D).                                                                                                                                                                                                       |
| workplane     | String                                                                             |                                         | Work plane to partition with (3D).                                                                                                                                                                                                         |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-131: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

