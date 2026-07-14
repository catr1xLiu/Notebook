# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MergeVertices") to merge two vertices.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("keepvtx") to select the vertex to keep. The default selection is empty.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("removevtx") to select the vertex to remove. The default selection is empty.

The feature merges the two vertices by collapsing the edge between the vertices and reconnecting the edges adjacent to the removed vertex to the resulting merged vertex.

The output object is a virtual geometry.

The following properties are available:

TABLE 3-108: VALID PROPERTIES.

| NAME      | VALUE     | DEFAULT | DESCRIPTION       |
|-----------|-----------|---------|-------------------|
| keepvtx   | Selection |         | Vertex to keep.   |
| removevtx | Selection |         | Vertex to remove. |

## **SEE ALSO**

CollapseEdges

