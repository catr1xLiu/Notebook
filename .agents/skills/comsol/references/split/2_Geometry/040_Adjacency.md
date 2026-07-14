# *Adjacency*

The following geometry adjacency information methods are available:

TABLE 3-21: GEOMETRY ADJACENCY INFORMATION METHODS.

| METHOD                    | 1D | 2D | 3D | OUTPUT TYPE |
|---------------------------|----|----|----|-------------|
| getStartEnd()             | √  | √  | √  | int[2][]    |
| getUpDown()               | √  | √  | √  | int[2][]    |
| getUpDownExt()            | √  | √  | √  | int[2][]    |
| getVertexDomain()         |    | √  | √  | int[]       |
| getSD()                   |    | √  | √  | double[]    |
| getAdj(int,int)           | √  | √  | √  | int[][]     |
| getAdj(int,int,int)       | √  | √  | √  | int[]       |
| getAdjOrient(int,int)     | √  | √  | √  | int[][]     |
| getAdjOrient(int,int,int) | √  | √  | √  | int[][]     |

- **•** getStartEnd returns the start and end vertices of all edges in the first and second row of the returned matrix.
- **•** getUpDown returns the up and down domain number for all boundaries in the first and second row of the returned matrix. All void regions have the domain number 0.
- **•** getUpDownExt returns the up and down domain number for all boundaries in the first and second row of the returned matrix, using an extended domain numbering where void regions have different domain numbers. The infinite void region has domain number 0. The finite void regions have negative domain numbers. However, if voidsAreLabeled() returns false, the extended domain numbering is not available, and then all void regions have domain number 0.
- **•** getVertexDomain returns the domain index for each vertex. For nonisolated vertices, the domain index is -1.
- **•** getSD returns the domain index for each vertex. For nonisolated vertices, the domain index is NaN.

- **•** a = getAdj(fromDim, toDim) returns a matrix where a[fromIdx]=getAdj(fromDim,toDim,fromIdx) contains the entities in dimension toDim that are adjacent to entity fromIdx in dimension fromDim.
- **•** ao = getAdjOrient(fromDim, toDim) returns a matrix where ao[fromIdx]=getAdjOrient(fromDim, toDim,fromIdx) contains the orientation flag for the entities in getAdj(fromDim,toDim,fromIdx). The orientation flag is 1 if the adjacent entities have the same orientation, and -1 if they have the opposite orientation, and 2 if the relative orientation cannot be determined (for instance, for an edge interior to a face).

