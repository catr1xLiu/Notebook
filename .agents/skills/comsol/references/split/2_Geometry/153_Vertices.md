# *Vertices*

This creates a work plane parallel to a plane through three vertices v1, v2, and v3. When offset=0, the origin of the local coordinate system coincides with the first vertex v1. The *x*-axis of the local coordinate system is in the

direction v2-v1. The direction of the local *z*-axis is given by the cross product (v2-v1)x(v3-v1) or its opposite (if reverse is on).

TABLE 3-188: VALID PROPERTIES, VERTICES.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                                         |
|----------|-----------|---------|-----------------------------------------------------|
| offset   | double    | 0       | Signed offset in the direction of the local z-axis. |
| reverse  | on   off  | off     | Reverse direction of local z-axis.                  |
| vertex1  | Selection |         | First vertex.                                       |
| vertex2  | Selection |         | Second vertex.                                      |
| vertex3  | Selection |         | Third vertex.                                       |
| displ    | double[2] | {0,0}   | Displacement of local coordinate system.            |
| rot      | double    | 0       | Rotation angle of local coordinate system.          |

## *Coordinates*

This creates a work plane through three points p1, p2, and p3. The origin of the local coordinate system coincides with the first point p1. The *x*-axis of the local coordinate system is in the direction p2-p1. The direction of the local *z*-axis is given by the cross product (p2-p1)x(p3-p1).

TABLE 3-189: VALID PROPERTY, COORDINATES.

| PROPERTY  | VALUE        | DEFAULT                   | DESCRIPTION |
|-----------|--------------|---------------------------|-------------|
| genpoints | double[3][3] | {{0,0,0},{1,0,0},{0,1,0}} | Points.     |

genpoints[n][i] is the *i*th coordinate of the *n*th point.

## *Transformed*

This creates a work plane as a transformation of another work plane, using a displacement and a rotation.

TABLE 3-190: VALID PROPERTIES, TRANSFORMED.

| PROPERTY      | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                                          |
|---------------|-----------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| transax2      | double[2]                               | {0,0}   | Spherical angles theta and phi, used if transaxistype is<br>spherical.                                                                               |
| transax3      | double[3]                               | {0,0,1} | Axis vector, used if transaxistype is cartesian.                                                                                                     |
| transaxis     | double[]                                | {0,0,1} | Rotation axis. Vector has length 3 if transaxistype is<br>cartesian, and length 2 if transaxistype is<br>spherical. Alias for transax2 and transax3. |
| transaxistype | x   y   z  <br>cartesian  <br>spherical | z       | Coordinate system used for axis. Used if transspecify is<br>set to axis.                                                                             |
| transdispl    | double[3]                               | {0,0,0} | Displacement of local coordinate system.                                                                                                             |
| transedge     | Selection                               |         | Edge selection. Used when transspecify is set to edge.                                                                                               |
| transeulerang | double[3]                               | {0,0,0} | Intrinsic Z-X-Z Euler angles α, β, and γ, used if<br>transspecify is set to eulerang.                                                                |
| transrot      | double                                  | 0       | Rotation angle, if transspecify is not set to eulerang.                                                                                              |
| transspecify  | axis   eulerang<br>  edge               | axis    | Specify an axis of rotation, Euler angles (Z-X-Z), or a<br>straight edge.                                                                            |
| workplanesrc  | String                                  | this    | Tag of PartInstance feature to take work plane from, or<br>this to take work plane from this sequence.                                               |
| workplane     | String                                  | xyplane | Tag of input work plane, or xyplane.                                                                                                                 |

## *Part Instances*

In a geometry part, the following property is available:

TABLE 3-191: VALID PROPERTY IN A FEATURE IN A GEOMETRY PART.

| PROPERTY      | VALUE    | DEFAULT | DESCRIPTION                                                               |
|---------------|----------|---------|---------------------------------------------------------------------------|
| showworkplane | on   off | on      | Show work plane in part instances. This property is only available if the |
|               |          |         | work plane is in a geometry part.                                         |

## *Selections of Resulting Entities*

For selections of resulting entities, the following properties are available:

TABLE 3-192: VALID PROPERTIES FOR SELECTIONS OF RESULTING ENTITIES.

| PROPERTY      | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                                                                                                                     |
|---------------|-----------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selplaneshow  | on   off                                | off     | Show selections from Plane Geometry in physics or part instances.                                                                                                                                                               |
| selresult     | on   off                                | off     | Create selections of all resulting objects.                                                                                                                                                                                     |
| selresultshow | all   obj  <br>bnd   edg  <br>pnt   off | bnd     | Show selections, if selresult is on, of resulting objects in<br>physics, materials, and so on, or in part instances. obj is not<br>available in a component's geometry. dom, bnd, and edg are not<br>available in all features. |

## *Creating 2D Objects in the Work Plane*

The work plane owns a geometry sequence that contains the features that define the 2D objects you draw in the work plane. You access this geometry sequence by

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom()
```

where *<ftag>* is the name of the work-plane feature. You can add geometry features in this 2D sequence as usual.

## *Attributes*

The following attributes are available:

TABLE 3-193: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

