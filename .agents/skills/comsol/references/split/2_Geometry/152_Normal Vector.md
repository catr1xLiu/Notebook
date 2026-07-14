# *Normal Vector*

This creates a work plane defined by a normal vector and a point on the plane. Together with a RigidTransform feature, this makes it possible to orient an object so that one of its planar faces gets a prescribed normal vector.

TABLE 3-187: VALID PROPERTIES, CIRCLE PERPENDICULAR.

| PROPERTY     | VALUE            | DEFAULT | DESCRIPTION                                                            |
|--------------|------------------|---------|------------------------------------------------------------------------|
| normalvector | double[3]        | {0,0,1} | Normal vector.                                                         |
| normalpoint  | coord   vertex   | coord   | Point on plane (defined using coordinates or<br>as a geometry vertex). |
| normalcoord  | double[3]        | {0,0,1} | Coordinates of point, used when<br>normalpoint is set to coord.        |
| normalvertex | Vertex selection |         | Vertex for point, used when normalpoint<br>is set to vertex.           |
| displ        | double[2]        | {0,0}   | Displacements xw and yw.                                               |
| rot          | double           | 0       | Rotation angle.                                                        |

