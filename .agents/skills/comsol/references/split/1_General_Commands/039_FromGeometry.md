# *FromGeometry*

model.component(*<ctag>*).coordSystem().create(*<tag7>*,*<gtag>*,"FromGeometry") creates a coordinate system taken from a work plane in a 3D geometry or defined in a 3D geometry part that is included in the geometry as a part instance. You can specify which work plane to use:

TABLE 2-56: PROPERTIES FOR SYSTEM FROM GEOMETRY.

| PROPERTY     | VALUE                                                  | DEFAULT       | DESCRIPTION                                                                                                                   |
|--------------|--------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------|
| coord        | String matrix                                          | [(r, phi, a)] | Coordinate names.                                                                                                             |
| frametype    | string (mesh  <br>material  <br>spatial  <br>geometry) | material      | The frame type.                                                                                                               |
| workplane    | String                                                 | xyplane       | Name of work plane to use. The default value<br>represents a global Cartesian coordinate system.                              |
| workplanesrc | this   part<br>instance feature                        | this          | Part-instance feature to take the work plane from.                                                                            |
| workplane    | xyplane   work<br>plane feature                        | xyplane       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global Cartesian<br>coordinate system. |

