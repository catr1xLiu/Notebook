# **SEE ALSO**

MergeVertices, CollapseFaces, CollapseFaceRegions

Collapse faces.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CollapseFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(<tag>).create(<ftag>),"CollapseFaces") to collapse faces.

Use model.component(*<ctag>*).geom(<tag>).feature(*<ftag>*).selection("input") to select the faces to collapse. The default selection is empty.

The feature collapses a face by removing it, merging its adjacent opposite edges into one or more edges or collapsing all adjacent edges into one vertex, and reconnecting the adjacent faces to the merged edges or vertex.

The output object is a virtual geometry.

The following properties are available:

| PROPERTY         | VALUE            | DEFAULT | DESCRIPTION                                                                                                |
|------------------|------------------|---------|------------------------------------------------------------------------------------------------------------|
| collvtxtol       | auto  <br>manual | auto    | Use an automatic or manual tolerance for the maximum<br>perimeter of a face to be collapsed into a vertex. |
| input            | Selection        |         | Faces to collapse.                                                                                         |
| ignoremerged     | on   off         | off     | Specifies if the operation tries to ignore the resulting merged<br>entities.                               |
| maxfaceperimeter | double           | 0.001   | The maximum perimeter of a face to be collapsed into a vertex<br>when collvtxtol is set to manual.         |

#### **SEE ALSO**

MergeEdges, CollapseEdges, CollapseFaceRegions

