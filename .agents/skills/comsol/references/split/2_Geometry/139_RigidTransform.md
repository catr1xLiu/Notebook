# *RigidTransform*

Perform a rigid transform (translation and rotation) of 3D geometry objects. You can use this feature to position and orient geometry objects by matching a coordinate system (work plane) with another coordinate system (work plane) and then optionally performing a rotation and translation in the work plane's coordinate system.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"RigidTransform");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"RigidTransform") to make a rigid transform of 3D geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects for which to perform a rigid transform. The default selection is empty.

The following properties are available:

TABLE 3-150: VALID PROPERTIES FOR RIGIDTRANSFORM.

| NAME         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ax2          | double[2]                                                                                | {0,0}                         | Spherical angles theta and phi, used if axistype is<br>spherical.                                                                                                                                                |
| ax3          | double[3]                                                                                | {0,0,1}                       | Axis vector, used if axistype is cartesian.                                                                                                                                                                      |
| axis         | double[]                                                                                 | {0,0,1}                       | Rotation axis. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical. Alias for ax2 and ax3.                                                                                 |
| axistype     | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. Used if specify<br>is set to axis.                                                                                                                                              |
| color        | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |
| contributeto | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| displ        | double[3]                                                                                | {0,0,0}                       | Displacement.                                                                                                                                                                                                    |
| edge         | Selection                                                                                |                               | Edge selection. Used when specify is set to edge.                                                                                                                                                                |

TABLE 3-150: VALID PROPERTIES FOR RIGIDTRANSFORM.

| NAME          | VALUE                                      | DEFAULT | DESCRIPTION                                                                                                                                                                          |
|---------------|--------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eulerang      | double[3]                                  | {0,0,0} | Intrinsic Z-X-Z Euler angles α, β, and γ, used if<br>specify is set to eulerang.                                                                                                     |
| input         | object selection                           |         | Geometry objects to perform a rigid<br>transformation of.                                                                                                                            |
| keep          | on   off                                   | off     | Keep input objects.                                                                                                                                                                  |
| propagatesel  | on   off                                   | on      | Propagate selections from input objects to resulting<br>objects.                                                                                                                     |
| rot           | double[]                                   | 0       | Rotation angles for one or more rotations of the<br>input objects, used if specify is set to axis.                                                                                   |
| selresult     | on   off                                   | off     | Create selections of all resulting objects.                                                                                                                                          |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off | dom     | Show selections, if selresult is on, in physics,<br>materials, and so on. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| specify       | axis   eulerang  <br>edge                  | axis    | Specify an axis of rotation, Euler angles (Z-X-Z), or<br>a straight edge.                                                                                                            |
| workplane     | xyplane   work-plane<br>feature tag        | xyplane | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                        |
| workplaneobj  | xyplane   work-plane<br>feature tag        | xyplane | The work plane for the geometry objects.                                                                                                                                             |
| workplanesrc  | this  part-instance<br>feature tag         | this    | The source to take the work plane from.                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-151: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **SEE ALSO**

Mirror, Move, Copy, Scale, Rotate

