# *Normal Vector*

This specifies a plane defined by a normal vector and a point on the plane.

TABLE 4-19: VALID PROPERTIES, NORMALVECTOR.

| PROPERTY     | VALUE          | DEFAULT | DESCRIPTION                                                            |
|--------------|----------------|---------|------------------------------------------------------------------------|
| normalvector | double[3]      | {0,0,1} | Normal vector specification.                                           |
| normalpoint  | coord   vertex | coord   | Point on plane (defined using coordinates or as a<br>geometry vertex). |
| normalcoord  | double[3]      | {0,0,1} | Coordinates of point, used when normalpoint is set<br>to coord.        |
| normalvertex | Selection      |         | Vertex for point, used when normalpoint is set to<br>vertex.           |

