# *Features for Geometric Operations*

The Import feature imports geometry objects from a file or from another geometry. The FromMesh feature constructs a geometry object from a (deformed) mesh.

Table 3-4 through Table 3-8 list the features that create new geometric objects from existing ones, Table 3-9 lists programming features for construction of geometry parts with conditionally active geometry features, for example.

TABLE 3-4: WORK-PLANE RELATED FEATURES (ONLY 3D, EXCEPT FOR CROSSSECTION).

| NAME         | DESCRIPTION                                                            |  |
|--------------|------------------------------------------------------------------------|--|
| WorkPlane    | Create a work plane for drawing 2D objects that are embedded into 3D   |  |
| Extrude      | Extrude planar faces in 3D                                             |  |
| Revolve      | Revolve planar faces in 3D                                             |  |
| Sweep        | Sweep one or several faces along a spine curve to create a solid in 3D |  |
| CrossSection | Create 2D geometry from intersection of 3D geometry with work plane    |  |

TABLE 3-5: BOOLEAN AND PARTITIONING OPERATIONS.

| NAME             | DESCRIPTION                                                                             |
|------------------|-----------------------------------------------------------------------------------------|
| Compose          | Compose geometry objects using a set formula                                            |
| Difference       | Subtract geometry objects from geometry objects                                         |
| Intersection     | Intersect geometry objects                                                              |
| Union            | Unite geometry objects                                                                  |
| Partition        | Partition a 2D or 3D geometry using tool objects or (3D only) a work plane              |
| PartitionDomains | Partition domains in 2D or 3D geometries along some partitioning lines, edges, or faces |

TABLE 3-5: BOOLEAN AND PARTITIONING OPERATIONS.

| NAME           | DESCRIPTION                                                                          |
|----------------|--------------------------------------------------------------------------------------|
| PartitionEdges | Partition edges in 2D or 3D geometries at some partitioning vertices along the edges |
| PartitionFaces | Partition faces in 3D geometries at some partitioning curves on the edges            |

See Compose, Union, Intersection, Difference for information about those Boolean operations.

TABLE 3-6: LINEAR TRANSFORMATIONS.

| NAME           | DESCRIPTION                                                              |
|----------------|--------------------------------------------------------------------------|
| Array          | Rectangular or linear array of geometry objects                          |
| Mirror         | Reflect objects in a plane (3D), a line (2D), or a point (1D)            |
| RigidTransform | Make a rigid transform (translation and rotation) of 3D geometry objects |
| Rotate         | Rotate geometry objects about a centerpoint                              |
| Scale          | Scale geometric objects about a centerpoint                              |
| Move           | Translate geometry objects                                               |
| Copy           | Make a displaced copy of geometry objects                                |

See Move, Copy for details about those linear transformations.

TABLE 3-7: OBJECT TYPE CONVERSIONS.

| NAME             | DESCRIPTION                                                 |
|------------------|-------------------------------------------------------------|
| ConvertToSolid   | Unite and convert objects to a single solid object          |
| ConvertToSurface | Unite and convert 3D objects to a single surface object     |
| ConvertToCurve   | Unite and convert 2D or 3D objects to a single curve object |
| ConvertToPoint   | Unite and convert objects to a single point object          |

See ConvertToSolid, ConvertToSurface, ConvertToCurve, ConvertToPoint for information about those conversion operations.

TABLE 3-8: OTHER OPERATIONS.

| NAME     | DESCRIPTION                                                                                                |
|----------|------------------------------------------------------------------------------------------------------------|
| Chamfer  | Chamfer corners in 2D geometry objects                                                                     |
| Fillet   | Fillet corners in 2D geometry objects                                                                      |
| Tangent  | Line segment tangent to an edge in 2D                                                                      |
| Delete   | Delete entities (domains, boundaries, edges, or points) from objects, or delete entire geometry<br>objects |
| Split    | Split geometry objects into their constituent entities                                                     |
| Finalize | Form union or assembly by combining all geometry objects                                                   |

TABLE 3-9: PROGRAMMING AND PARTS FEATURES.

| NAME                    | DESCRIPTION                                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| If, ElseIf, Else, EndIf | Construct an If statement, enabling or disabling features depending on conditions in<br>terms of parameters |
| ParameterCheck          | Check the value of parameters.                                                                              |
| PartInstance            | Create an instance of a geometry part.                                                                      |

Table 3-10 lists the features that correspond to selections:

TABLE 3-10: SELECTIONS.

| NAME                  | DESCRIPTION                                                                       |
|-----------------------|-----------------------------------------------------------------------------------|
| AdjacentSelection     | Selection of entities or objects that are adjacent to given selections            |
| ExplicitSelection     | Explicit selection of entities or objects                                         |
| BallSelection         | Selection of entities or objects that (partly) lie inside a ball                  |
| BoxSelection          | Selection of entities or objects that (partly) lie inside a box                   |
| CylinderSelection     | Selection of entities or objects that (partly) lie inside a cylinder              |
| ComplementSelection   | Selection of entities or objects that is the complement of the input selections   |
| DifferenceSelection   | Selection of entities or objects that is the difference of the input selections   |
| IntersectionSelection | Selection of entities or objects that is the intersection of the input selections |
| UnionSelection        | Selection of entities or objects that is the union of the input selections        |

See BallSelection, BoxSelection, CylinderSelection, Disk Selection and UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection for information about those selections.

