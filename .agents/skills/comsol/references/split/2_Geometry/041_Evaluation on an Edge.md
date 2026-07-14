# *Evaluation on an Edge*

The following edge evaluation methods are available in 2D and 3D:

TABLE 3-22: EDGE EVALUATION METHODS IN 2D AND 3D.

| METHOD                       | 2D | 3D | OUTPUT TYPE |
|------------------------------|----|----|-------------|
| edgeParamRange(int)          | √  | √  | double[2]   |
| edgeX(int, double[])         | √  | √  | double[][D] |
| edgeDX(int, double[])        | √  | √  | double[][D] |
| edgeDDX(int, double[])       | √  | √  | double[][D] |
| edgeDDDX(int, double[])      | √  | √  | double[][D] |
| edgeNormal(int, double[])    | √  |    | double[][D] |
| edgeCurvature(int, double[]) | √  | √  | double[]    |
| edgeTorsion(int, double[])   |    | √  | double[]    |

The first input argument of all methods is the edge number. The second input argument, when it exists, is an array of parameter values for which to perform evaluation on the edge. For all but the first method, the first index in the output corresponds to the different parameter values, and the second index corresponds to the spatial coordinates.

- **•** edgeParamRange returns the parameter range for evaluation on the edge.
- **•** edgeX evaluates the parameters to coordinate values.
- **•** edgeDX evaluates the parameters to first-order derivative values.
- **•** edgeDDX evaluates the parameters to second-order derivative values.
- **•** edgeDDX evaluates the parameters to second-order derivative values.
- **•** edgeDDDX evaluates the parameters to third-order derivative values.
- **•** edgeNormal evaluates the parameters to normal vector values.
- **•** edgeCurvature evaluates the parameters to curvature values.
- **•** edgeTorsion evaluates the parameters to torsion values.

The following edge evaluation method is available in 3D:

TABLE 3-23: EDGE EVALUATION METHOD IN 3D.

| METHOD                                | OUTPUT TYPE |
|---------------------------------------|-------------|
| edgeMaxFaceAngle(int[], int[], int[]) | double[]    |

This method computes the maximum along a 3D edge of the angle (in radians) between the normal vectors of two faces that are adjacent to the edge. The input arguments are a vector of edge indices, a vector of indices for the first face, and a vector of indices for the second face. The output is a double array, where the maximum is defined as the value closest to π/2 radians. The method is vectorized so that the *N*th entry in the returned array is the maximum along edge[*N*] of the angle between faces face1[*N*] and face2[*N*]. The edge and face numbers are one-based.

Use the following methods for face evaluation in 3D. They do not work on composite faces in virtual geometry objects.

TABLE 3-24: FACE EVALUATION METHODS IN 3D.

| METHOD                               | OUTPUT TYPE       |
|--------------------------------------|-------------------|
| faceParamRange(int)                  | double[4]         |
| faceX(int, double[][2])              | double[][3]       |
| faceDX(int, double[][2])             | double[][3][2]    |
| faceDDX(int, double[][2])            | double[][3][2][2] |
| faceNormal(int, double[][2])         | double[][3]       |
| faceFF1(int, double[][2])            | double[][2][2]    |
| faceFF2(int, double[][2])            | double[][2][2]    |
| faceGaussCurvature(int, double[][2]) | double[]          |
| faceMeanCurvature(int, double[][2])  | double[]          |

The first input argument of all methods is the face number. The second input argument, when it exists, is a matrix of parameter points, for which to perform evaluation. For all but the first method, the first index in the output corresponds to the different parameter points.

- **•** faceParamRange returns two parameter ranges for evaluation on the face.
- **•** faceX evaluates the parameters to coordinate values.
- **•** faceDX evaluates the parameters to first order derivative values.
- **•** faceDDX evaluates the parameters to second order derivative values.
- **•** faceNormal evaluates the parameters to normal vector values.
- **•** faceFF1 evaluates the parameters to the first fundamental form values.
- **•** faceFF2 evaluates the parameters to the second fundamental form values.
- **•** faceGaussCurvature evaluates the parameters to Gauss curvature values.
- **•** faceMeanCurvature evaluates the parameters to mean curvature values.

Use the following methods to access the arrays in the internal representation of COMSOL Multiphysics geometry objects. They do not work on objects represented using the CAD kernel, assembly geometries, or virtual geometries.

TABLE 3-25: GET ARRAYS IN GEOMETRY REPRESENTATION.

| METHOD            | 1D | 2D | 3D | OUTPUT TYPE |
|-------------------|----|----|----|-------------|
| getVertex()       | √  | √  | √  | double[][]  |
| getEdge()         |    | √  | √  | double[][]  |
| getFace()         |    |    | √  | double[][]  |
| getPVertex()      |    |    | √  | double[][]  |
| getPEdge()        |    |    | √  | double[][]  |
| getVertexCoord()  | √  | √  | √  | double[][]  |
| voidsAreLabeled() | √  | √  | √  | Boolean     |

- **•** In 2D and 3D, getVertex returns (sdim+2)-by-nv matrix representing the vertices of the object. The first sdim rows are the coordinates of the vertices. Row sdim+1 contains the domain number if the vertex is isolated and is unspecified otherwise. The last row contains a relative local tolerance for the vertex. For nontolerant vertices the tolerance is NaN. This method does not work on virtual geometry objects.
- **•** In 1D, getVertex returns a 3-by-nvtx matrix representing the vertices of the 1D object. Row 1 provides the coordinates of the vertices. Rows 2 and 3 provide the up and down domain numbers, respectively.
- **•** getPVertex returns a 6-by-npv matrix containing embeddings of vertices in faces. Row 1 contains the vertex index (that is, column from getVertex), rows 2 and 3 contain (*s*, *t*) coordinates of the vertex on the face, row 4 contains a face index, and row 5 contains the surface index into the surfaces. Row 6 contains a relative local tolerance for the vertex. This method does not work on virtual geometry objects.
- **•** In 3D, getEdge returns a 7-by-ne matrix representing the edges of the 3D object. Rows 1 and 2 contain the start and end vertex indices of the edge (0 if they do not exist), respectively. Rows 3 and 4 give the parameter values of these vertices. Row 5 gives the index of a domain if the edge is not adjacent to a face, and is unspecified otherwise. Row 6 gives a sign and an index to the underlying curve. The sign indicates the direction of the edge relative the curve. Finally, row 7 contains a relative local tolerance for the edge. This method does not work on virtual geometry objects.
- **•** In 2D, getEdge returns a 8-by-ne matrix representing the edges of the 2D object. Rows 1 and 2 contain the start and end vertex indices of the edge, respectively (0 if they do not exist). Rows 3 and 4 give the parameter values of these vertices. Rows 5 and 6 contain the left and right domain number of the edge, respectively. Row 7 gives a sign and an index to the array of underlying curves. The sign indicates the direction of the edge relative the curve. Row 8 contains a relative local tolerance for the edge.
- **•** getPEdge returns a 10-by-npe matrix representing the embeddings of the edges in faces. The first row gives the index of the edge in getEdge. Rows 2 and 3 contain the start and end vertex indices from getPVertex, respectively. Rows 4 and 5 give the parameter values of these vertices. Row 6 and 7 give the indices of the faces to the left and right of the edge, respectively. Row 8 gives a sign and index to the parameter curve (if any), and row 9 gives the index to the surface. Row 10 contains a relative local tolerance for the edge. This method does not work on virtual geometry objects.
- **•** getFace returns a 4-by-nf matrix representing the faces of the 3D geometry. Rows 1 and 2 contain the up and down domain index of the face, respectively, and row 3 contains the surface index of the face. Row 4 contains a relative local tolerance for the face. This method does not work on virtual geometry objects.

- **•** getVertexCoord returns a matrix with the vertex coordinates. Its dimension is the space dimension times the number of vertices.
- **•** voidsAreLabeled returns true if all finite void regions are labeled with negative domain indices in the serialization (mphtxt or mphbin file). This also affects the domain indices in the following methods: getAdjExt(), getAdjOrientExt(), getUpDownExt(), getFace(), getEdge(), and getVertex(). It returns false if some finite void regions might be denoted with 0 in the serialization, like in version 4.2.

