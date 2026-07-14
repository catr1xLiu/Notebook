# *Cylindrical*

model.component(*<ctag>*).coordSystem().create(*<tag5>*,*<gtag>*,"Cylindrical") creates a cylindrical coordinate system, which you can use in 2D and 3D where rotational symmetry about the axis is required. You can specify the origin, axis direction and radial base vector.

TABLE 2-54: PROPERTIES FOR CYLINDRICAL SYSTEM.

| PROPERTY         | VALUE                           | DEFAULT       | DESCRIPTION                                                                                                                   |
|------------------|---------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------|
| coord            | String matrix                   | [(r, phi, a)] | Coordinate names.                                                                                                             |
| origin           | String array                    | (0,0,0)       | Origin of system.                                                                                                             |
| axis             | String array                    | (0,0,1)       | Axis direction.                                                                                                               |
| radialbasevector | String array                    | (1,0,0)       | Radial base vector direction a j = 0.                                                                                         |
| workplanesrc     | this   part<br>Instance feature | this          | Part-instance feature to take the work plane<br>from.                                                                         |
| workplane        | xyplane   work<br>plane feature | xyplane       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system. |

model.component(*<ctag>*).coordSystem(*<tag5>*).set("origin", new String[]{"1","0","0"}) sets the origin to (1,0,0).

## *Spherical*

model.component(*<ctag>*).coordSystem().create(*<tag6>*,*<gtag>*,"Spherical") creates a spherical coordinate system, which you can use in 3D to define a field or property using spherical coordinates. You can specify the origin, zenith axis (θ = 0), and azimuth axis (θ = π/2, ϕ = 0).

TABLE 2-55: PROPERTIES FOR SPHERICAL SYSTEM.

| PROPERTY         | VALUE                           | DEFAULT       | DESCRIPTION                                                                                                                   |
|------------------|---------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------|
| coord            | String matrix                   | [(r, phi, a)] | Coordinate names.                                                                                                             |
| origin           | String array                    | (0,0,0)       | Origin of system.                                                                                                             |
| axis             | String array                    | (0, 0, 1)     | Zenith axis direction.                                                                                                        |
| radialbasevector | String array                    | (1, 0, 0)     | Azimuth axis direction.                                                                                                       |
| workplanesrc     | this   part<br>Instance feature | this          | Part-instance feature to take the work plane<br>from.                                                                         |
| workplane        | xyplane   work<br>plane feature | xyplane       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system. |

model.component(*<ctag>*).coordSystem(*<tag6>*).set("origin", new String[]{"1","0","0"}) sets the origin to (1,0,0).

