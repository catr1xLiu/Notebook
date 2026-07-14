# *ParamVertexData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                        |
|---------------|----------|------------------------------------|
| int           |          | Vertex index (1-based).            |
| double[2]     |          | Parameter values in the surface.   |
| int           |          | Face index (1-based).              |
| int           |          | Surface index (1-based).           |
| double        |          | Relative tolerance for the vertex. |

## *EdgeData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                                                                       |
|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| int[2]        |          | Start and end vertex of the edge, respectively (1-based).                                                                                         |
| double[2]     |          | Parameter values of the start and end vertices.                                                                                                   |
| int           |          | Index of a domain if the edge is not adjacent to a face, and is unspecified<br>otherwise.                                                         |
| int           |          | Signed index of the underlying curve (1-based). The sign indicates the<br>direction of the edge relative to the curve. Is 0 if there is no curve. |
| double        |          | Relative tolerance of the edge.                                                                                                                   |

