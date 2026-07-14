# *Rotate*

Rotate objects about a point in 2D or an axis in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Rotate");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Rotate") to rotate geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to rotate. The default selection is empty.

The following properties are available:

TABLE 3-152: VALID PROPERTIES FOR ROTATE.

| NAME          | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ax2           | double[2]                                                                                | {0,0}                         | Spherical angles theta and phi, used if axistype is<br>spherical.                                                                                                                                                                          |
| ax3           | double[3]                                                                                | {0,0,1}                       | Axis vector, used if axistype is cartesian.                                                                                                                                                                                                |
| axis          | double[]                                                                                 | {0,0,1}                       | Rotation axis. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical. Alias for ax2 and ax3.                                                                                                           |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. Used if specify<br>is set to axis.                                                                                                                                                                        |
| color         | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                           |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| edge          | Selection                                                                                |                               | Edge selection. Used when specify is set to edge.                                                                                                                                                                                          |
| eulerang      | double[3]                                                                                | {0,0,0}                       | Intrinsic Z-X-Z Euler angles α, β, and γ, used if<br>specify is set to eulerang.                                                                                                                                                           |
| input         | Selection                                                                                |                               | Objects to rotate.                                                                                                                                                                                                                         |
| keep          | on   off                                                                                 | off                           | Keep input objects.                                                                                                                                                                                                                        |
| pos           | double[]                                                                                 |                               | Center of rotation.                                                                                                                                                                                                                        |
| propagatesel  | on   off                                                                                 | on                            | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                           |
| rot           | double[]                                                                                 | 0                             | Rotation angles for one or more rotations of the<br>input objects, used if specify is set to axis.                                                                                                                                         |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| specify       | axis   eulerang  <br>edge                                                                | axis                          | Specify an axis of rotation, Euler angles (Z-X-Z), or<br>a straight edge.                                                                                                                                                                  |
| workplane     | xyplane   work-plane<br>feature tag                                                      | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is the<br>global Cartesian coordinate system.                                                                                                 |
| workplanesrc  | this   part-instance<br>feature tag                                                      | this                          | Part-instance feature to take the work plane from<br>(in 3D only).                                                                                                                                                                         |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Rotate.

The following attributes are available:

TABLE 3-153: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

The possibility to set and get a rotation matrix has been removed.

The property out is no longer available.

## **EXAMPLE**

The commands below create and then rotate an ellipse by 10 degrees about (2, 3):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("e1","Ellipse");
  g.feature("e1").set("semiaxes","1 3");
  g.create("r1","Rotate");
  g.feature("r1").selection("input").set("e1");
  g.feature("r1").set("rot",10);
  g.feature("r1").set("pos", "2 3");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('e1','Ellipse');
  g.feature('e1').set('semiaxes','1 3');
  g.create('r1','Rotate');
  g.feature('r1').selection('input').set('e1');
  g.feature('r1').set('rot',10);
  g.feature('r1').set('pos', '2 3');
  g.run;
```

