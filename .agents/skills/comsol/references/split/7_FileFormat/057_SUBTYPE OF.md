# **SUBTYPE OF**

Serializable

| DATA TYPE            | VARIABLE | DESCRIPTION                                                                                                                          |
|----------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------|
| integer              |          | Version.                                                                                                                             |
| integer              | type     | Object type: 0 for a point object, 1 for a curve object, 2 for a surface<br>object, 3 for a solid object, and -1 for a mixed object. |
| Boolean              |          | 1 if void regions are labeled; 0 otherwise.                                                                                          |
| double               |          | Relative geometry tolerance.                                                                                                         |
| double               |          | Relative resolution tolerance.                                                                                                       |
| integer              | nv       | Number of vertices.                                                                                                                  |
| VertexData[nv]       | vertex   | Matrix of vertex data.                                                                                                               |
| integer              | npv      | Number of parameter vertices.                                                                                                        |
| ParamVertexData[npv] | pvertex  | Matrix of parameter vertex data.                                                                                                     |
| integer              | ne       | Number of edges.                                                                                                                     |
| EdgeData[ne]         | edge     | Matrix of edge data.                                                                                                                 |
| integer              | npe      | Number of parameter edges.                                                                                                           |
| ParamEdgeData[npe]   | pedge    | Matrix of parameter edge data.                                                                                                       |
| integer              | nf       | Number of faces.                                                                                                                     |
| FaceData[nf]         | face     | Matrix of face data.                                                                                                                 |
| integer              | nc       | Number of curves.                                                                                                                    |
| GeomCurve[nc]        | curves   | Vector of curves.                                                                                                                    |
| integer              | ns       | Number of surfaces.                                                                                                                  |
| GeomSurf[ns]         | surfaces | Vector of surfaces.                                                                                                                  |
| integer              | npc      | Number of parameter curves.                                                                                                          |
| GeomCurve[npc]       | pcurves  | Vector of parameter curves.                                                                                                          |
| integer              | na       | Number of attributes.                                                                                                                |
| Attributes[na]       |          | Attributes. The Attribute type is undocumented because it is only<br>used internally.                                                |

In the table above, the entity types are defined as follows:

## *VertexData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                              |
|---------------|----------|----------------------------------------------------------------------------------------------------------|
| double[3]     |          | Coordinates of the vertex.                                                                               |
| int           |          | The domain number if the vertex is isolated. If the vertex is not isolated this<br>value is unspecified. |
| double        |          | Relative tolerance of the vertex.                                                                        |

