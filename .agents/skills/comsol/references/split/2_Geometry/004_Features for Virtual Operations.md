# *Features for Virtual Operations*

Table 3-11 lists the features that correspond to virtual operations:

TABLE 3-11: VIRTUAL GEOMETRY RELATED FEATURES (ONLY 2D AND 3D).

| NAME                | DESCRIPTION                                                                                                                 |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------|
| IgnoreVertices      | Virtually remove isolated vertices or vertices adjacent to two edges only                                                   |
| IgnoreEdges         | Virtually remove isolated edges or edges adjacent to precisely two faces or between<br>two domains                          |
| IgnoreFaces         | Virtually remove isolated faces or faces between two domains                                                                |
| CompositeEdges      | Form virtual composite edges from sets of connected edges by ignoring the vertices<br>between the edges in each set         |
| CompositeFaces      | Form virtual composite faces from sets of connected faces by ignoring the edges<br>between the faces in each set            |
| CompositeDomains    | Form virtual composite domains from sets of connected domains by ignoring the<br>boundaries between the domains in each set |
| CollapseEdges       | Virtually collapse each edge into a vertex by merging its adjacent vertices                                                 |
| CollapseFaces       | Virtually collapse faces                                                                                                    |
| CollapseFaceRegions | Virtually detect and collapse regions of faces narrower than a specified size                                               |
| MergeEdges          | Virtually merge edges adjacent to face                                                                                      |
| MergeVertices       | Virtually merge one adjacent vertex of an edge with the other adjacent vertex                                               |
| RemoveDetails       | Automatically remove small details in a geometry by using virtual operations                                                |

