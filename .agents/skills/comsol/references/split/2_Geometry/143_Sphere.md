# *Sphere*

Create a solid ball or surface sphere in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Sphere");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Sphere") to create a sphere. The following properties are available:

TABLE 3-156: VALID PROPERTY/VALUE PAIRS FOR SPHERE.

| PROPERTY     | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis         | double[]                                                                                 | {0,0,1}                       | Direction of the local z-axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if<br>axistype is spherical.                                                                                        |
| axistype     | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                         |
| color        | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |
| contributeto | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| layer        | double[]                                                                                 |                               | Thicknesses of layers.                                                                                                                                                                                           |
| pos          | double[]                                                                                 | {0,0,0}                       | Center.                                                                                                                                                                                                          |

TABLE 3-156: VALID PROPERTY/VALUE PAIRS FOR SPHERE.

| PROPERTY      | VALUE                                      | DEFAULT | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|--------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| r             | double                                     | 1       | Radius.                                                                                                                                                                                                                            |
| rot           | double                                     | 0       | Rotational angle about axis.                                                                                                                                                                                                       |
| sellayer      | on   off                                   | off     | Create layer selections.                                                                                                                                                                                                           |
| sellayershow  | on   off                                   | on      | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                                             |
| selresult     | on   off                                   | off     | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off | dom     | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in<br>all features. |
| type          | solid   surface                            | solid   | Object type.                                                                                                                                                                                                                       |
| workplanesrc  | this   part-instance<br>feature            | this    | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature            | xyplane | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-157: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"sphere3") creates a solid sphere.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"sphere2") creates a surface sphere.

The following properties are also available:

TABLE 3-158: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

