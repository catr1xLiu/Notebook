# *General Information*

TABLE 3-19: GENERAL GEOMETRY INFORMATION METHODS.

| METHOD           | OUTPUT TYPE    |
|------------------|----------------|
| check()          | void           |
| exists()         | Boolean        |
| getBoundingBox() | double[sdim*2] |
| getSDim()        | int            |
| getType()        | String         |
| hasCadRep()      | Boolean        |

- **•** check() issues an exception if the object is invalid.
- **•** exists() returns true if an object exists.
- **•** getBoundingBox() returns a bounding box for the object in the order xmin, xmax, ymin, ymax, zmin, and zmax.
- **•** getSDim() returns the space dimension of the geometry.
- **•** getType() returns the object type: solid, surface, curve, point, mixed, or empty.
- **•** hasCadRep() returns true if the object is represented using the CAD kernel (Parasolid).

The following geometric entity counter methods are available:

TABLE 3-20: GEOMETRIC ENTITY COUNTER METHODS.

| METHOD             | 1D | 2D | 3D | OUTPUT TYPE |
|--------------------|----|----|----|-------------|
| getNEntities()     | √  | √  | √  | int[]       |
| getNVertices()     | √  | √  | √  | int         |
| getNEdges()        | √  | √  | √  | int         |
| getNFaces()        |    |    | √  | int         |
| getNBoundaries()   | √  | √  | √  | int         |
| getNDomains()      | √  | √  | √  | int         |
| getNEntitiesMesh() | √  | √  | √  | int[]       |

- **•** getNEntities returns a vector of length 2 in 1D, length 3 in 2D, and length 4 in 3D. The vectors contain the number of geometric entities for each entity dimension. The methods getNVertices, getNEdges, getNFaces, getNBoundaries, and getNDomains return the number of entities of the specified type.
- **•** getNEntitiesMesh returns a vector of length 2 in 1D, length 3 in 2D, and length 4 in 3D. The vectors contain the number of geometric entities for each entity dimension in the geometry used for meshing. If there are no mesh control entities in the geometry, the output is identical to that of getNEntities.

