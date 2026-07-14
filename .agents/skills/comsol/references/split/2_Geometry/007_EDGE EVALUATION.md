# **EDGE EVALUATION**

TABLE 3-16: EDGE EVALUATION METHODS.

| METHOD         | NOTES | DESCRIPTION                   |
|----------------|-------|-------------------------------|
| edgeParamRange |       | Get parameter range of edge   |
| edgeX          | 1     | Evaluate coordinates.         |
| edgeDX         | 1     | Evaluate first derivative.    |
| edgeDDX        | 1     | Evaluate second derivative.   |
| edgeDDDX       | 1     | Evaluate third derivative.    |
| edgeNormal     | 1     | Evaluate normal vector in 2D. |

TABLE 3-16: EDGE EVALUATION METHODS.

| METHOD        | NOTES | DESCRIPTION             |
|---------------|-------|-------------------------|
| edgeCurvature | 1     | Evaluate curvature.     |
| edgeTorsion   | 1     | Evaluate torsion in 3D. |
|               |       |                         |

<sup>1</sup> For a mesh, the evaluation is done on a smooth interpolated edge curve.

#### **FACE EVALUATION**

TABLE 3-17: FACE EVALUATION METHODS.

| METHOD             | NOTES | DESCRIPTION                       |
|--------------------|-------|-----------------------------------|
| faceParamRange     | 1,2   | Get parameter ranges of face.     |
| faceX              | 1,2   | Evaluate coordinates.             |
| faceDX             | 1,2   | Evaluate first derivatives.       |
| faceDDX            | 1,2   | Evaluate second derivatives.      |
| faceNormal         | 1,2   | Evaluate normal vector.           |
| faceFF1            | 1,2   | Evaluate first fundamental form.  |
| faceFF2            | 1,2   | Evaluate second fundamental form. |
| faceGaussCurvature | 1,2   | Evaluate Gauss curvature.         |
| faceMeanCurvature  | 1,2   | Evaluate mean curvature.          |

<sup>1</sup> Not supported for geometric models defined by a mesh.

## **GEOMETRY REPRESENTATION ARRAYS**

TABLE 3-18: GET ARRAYS IN GEOMETRY REPRESENTATION.

| METHOD         | NOTES | DESCRIPTION                                               |
|----------------|-------|-----------------------------------------------------------|
| getVertex      | 1,3   | Get vertex matrix.                                        |
| getEdges       | 1,3   | Get edge matrix.                                          |
| getFaces       | 1,3   | Get face matrix.                                          |
| getPVertex     | 1,3   | Get parameter vertices (embeddings of vertices in faces). |
| getPEdge       | 1,3   | Get parameter edges (embeddings of edges in faces).       |
| getVertexCoord |       | Get vertex coordinates.                                   |

<sup>1</sup> Not supported for geometric models defined by a mesh.

![](_page_6_Picture_13.jpeg)

In the GeomSequence interface, the GeomInfo methods give information about the finalized geometry of the geometry sequence. However, for a GeomSequence whose component's geometric model is defined by a MeshSequence, the GeomInfo methods instead return information about that geometric model. The behavior in this case might change in a future version.

GeomSequence.obj gives information about a geometry object resulting from a geometry feature.

You can use GeomSequence.axisymmetric(boolean) to change its axisymmetry status.

<sup>2</sup> Only supported for faces that are not virtual.

<sup>3</sup> Only supported on geometry objects using the COMSOL kernel, and not for assembly geometries or virtual geometries.

