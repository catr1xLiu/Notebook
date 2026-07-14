# *Scaling*

model.component(*<ctag>*).coordSystem().create(*<tag8>*,*<gtag>*,"Scaling") creates a scaling coordinate system that maps the geometry, as represented by the independent coordinates of an underlying frame, onto a virtual geometry represented by virtual scaling system coordinates. Physics interfaces that support infinite elements or perfectly matched layers accept the scaling system coordinates as being the physical domain, in which the underlying frame coordinates are seen as a parameterization. Therefore, using a scaling coordinate system you can arbitrarily deform the domain.

TABLE 2-57: PROPERTY FOR SCALING SYSTEM.

| PROPERTY | VALUE        | DEFAULT | DESCRIPTION         |
|----------|--------------|---------|---------------------|
| map      | String array | (x,y,z) | Coordinate mapping. |

model.component(*<ctag>*).coordSystem(*<tag8>*).setIndex("map", "y+1", 1) sets the second coordinate mapping to *y*+1.

#### *Combined*

model.component(*<ctag>*).coordSystem().create(*<tag9>*,*<gtag>*,"Combined") creates a combined coordinate system that makes it possible to use different coordinate systems in different domains, for example. To add a coordinate system to the combined system and define it on domain 2, use

```
model.component(<ctag>").coordSystem(<tag9>).create(<tag91>, "VectorBase");
model.component("comp3").coordSystem(<tag9>).feature(<tag91>).selection().
      set(new int[]{2});
```

You can specify the frame and the coordinate names for the combined system:

TABLE 2-58: PROPERTIES FOR A COMBINED SYSTEM.

| PROPERTY  | VALUE                                                  | DEFAULT       | DESCRIPTION       |
|-----------|--------------------------------------------------------|---------------|-------------------|
| coord     | String matrix                                          | [(r, phi, a)] | Coordinate names. |
| frametype | string (mesh  <br>material  <br>spatial  <br>geometry) | material      | The frame type.   |

#### *Composite*

model.component(*<ctag>*).coordSystem().create(*<tag9>*,*<gtag>*,"Composite") creates a composite coordinate system that defines a new coordinate system by multiplying the transformation matrices of two other coordinate systems.

TABLE 2-59: PROPERTIES FOR A COMBINED SYSTEM.

| PROPERTY       | VALUE                                   | DEFAULT | DESCRIPTION                                                                  |
|----------------|-----------------------------------------|---------|------------------------------------------------------------------------------|
| baseSystem     | none  <br><coordsys_tag></coordsys_tag> | none    | Reference to a base system.                                                  |
| relativeSystem | none  <br><coordsys_tag></coordsys_tag> | none    | Reference to a system defining its axes<br>relative to the base system axes. |

## *PML*

model.component(*<ctag>*).coordSystem().create(*<tag10>*,*<gtag>*,"PML") creates a PML (perfectly matched layer), which acts as an artificial absorbing layer in a domain for a wave simulation. You can specify the type and scaling of the PML using the following properties:

TABLE 2-60: PROPERTIES FOR PML.

| PROPERTY     | VALUE                            | DEFAULT | DESCRIPTION                                                                                                                          |
|--------------|----------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------|
| d            | String                           | "x"     | The distance function for each stretching<br>direction, if ScalingType is set to<br>userDefined. Set using the setIndex<br>function. |
| directions   | 1, 2, or 3                       | 1       | Number of directions, if ScalingType is set<br>to userDefined.                                                                       |
| dmax         | String                           | "1[m]"  | The thickness for each stretching direction, if<br>ScalingType is set to userDefined. Set<br>using the setIndex function.            |
| imagFunction | none, or any<br>defined function | none    | Imaginary part of stretching function when<br>stretchingType is set to userDefined.                                                  |
| PMLfactor    | double                           | 1       | PML scaling factor.                                                                                                                  |
| PMLgamma     | double                           | 1       | PML scaling curvature factor.                                                                                                        |

TABLE 2-60: PROPERTIES FOR PML.

| PROPERTY             | VALUE                                                      | DEFAULT     | DESCRIPTION                                                                    |
|----------------------|------------------------------------------------------------|-------------|--------------------------------------------------------------------------------|
| realFunction         | none, or any<br>defined function                           | none        | Real part of stretching function when<br>stretchingType is set to userDefined. |
| ScalingType          | Cartesian  <br>Cylindrical  <br>Spherical  <br>userDefined | Cartesian   | The PML scaling type. Spherical is only<br>available in 3D.                    |
| stretchingType       | polynomial  <br>rational  <br>userDefined                  | polynomial  | The coordinate stretching type for the PML<br>scaling.                         |
| typicalWavelength    | double                                                     | 1           | Typical wavelength for the waves.                                              |
| wavelengthSourceType | fromPhysics  <br>userDefined                               | fromPhysics | Take the wavelength from the physics or a<br>user-defined wavelength.          |

