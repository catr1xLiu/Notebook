# *CollapseEdges*

Collapse edges.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CollapseEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CollapseEdges") to collapse edges.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the edges to collapse. The default selection is empty.

The feature collapses an edge by removing it, merging its adjacent vertices to the vertex with lowest index, and reconnecting the adjacent edges to the merged vertex.

The output object is a virtual geometry.

The following properties are available:

TABLE 3-42: VALID PROPERTIES.

| NAME         | VALUE     | DEFAULT | DESCRIPTION                                                               |
|--------------|-----------|---------|---------------------------------------------------------------------------|
| input        | Selection |         | Edges to collapse.                                                        |
| ignoremerged | on   off  | on      | Specifies if the operation tries to ignore the resulting merged vertices. |

