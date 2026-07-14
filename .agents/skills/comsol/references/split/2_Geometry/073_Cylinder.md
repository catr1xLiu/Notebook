# *Cylinder*

Create a solid or hollow (surface) cylinder in 3D. The cylinder is a right circular cylinder; that is, a cylinder that has circles as bases aligned one directly above the other.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Cylinder");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Cylinder") to create a cylinder. The following properties are available:

TABLE 3-60: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE                                                                                       | DEFAULT | DESCRIPTION                                                                                                                                                                                                      |
|----------|---------------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis     | double[]                                                                                    | {0,0,1} | Direction of the axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if axistype<br>is spherical.                                                                                                |
| axistype | x   y   z   cartesian<br>  spherical                                                        | z       | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                         |
| color    | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none    | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a<br>custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |

TABLE 3-60: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                      | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|--------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| customcolor   | RGB-triplet                                | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| layer         | double[]                                   |                               | Thicknesses of layers.                                                                                                                                                                                                             |
| layertop      | on   off                                   | off                           | Apply layers on top.                                                                                                                                                                                                               |
| layerbottom   | on   off                                   | off                           | Apply layers on bottom.                                                                                                                                                                                                            |
| layerside     | on   off                                   | on                            | Apply layers on side.                                                                                                                                                                                                              |
| h             | double                                     | 1                             | Height.                                                                                                                                                                                                                            |
| pos           | double[]                                   | {0,0,0}                       | Center of the bottom circle.                                                                                                                                                                                                       |
| r             | double                                     | 1                             | Radius of bottom circle.                                                                                                                                                                                                           |
| rot           | double                                     | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| type          | solid   surface                            | solid                         | Object type.                                                                                                                                                                                                                       |
| sellayer      | on   off                                   | off                           | Create layer selections.                                                                                                                                                                                                           |
| sellayershow  | on   off                                   | on                            | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                                             |
| selresult     | on   off                                   | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt   off | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                     | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-instance<br>feature            | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane  <br>work-plane feature            | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-61: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"cylinder3") creates a solid cylinder.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"cylinder2") creates a surface cylinder.

The following properties are also available:

TABLE 3-62: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                               |
|----------|----------|---------|-------------------------------------------|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian |
| x, y, z  | double   | 0       | Alias for pos                             |

The property const is no longer available.

## **EXAMPLE**

The following commands generate a surface cylinder and a solid cylinder:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.angularUnit("rad");
  g.create("c2","Cylinder");
  g.feature("c2").set("type","surface");
  g.feature("c2").set("r",0.5);
  g.feature("c2").set("h",4);
  g.feature("c2").set("pos","1 1 0");
  g.feature("c2").set("axis","pi/2 0");
  g.create("c3","Cylinder");
  g.feature("c3").set("r",20);
  g.feature("c3").set("h",40);
  g.feature("c3").set("pos","0 0 -100");
  g.feature("c3").set("axis","1 1 1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.angularUnit('rad');
  g.create('c2','Cylinder');
  g.feature('c2').set('type','surface');
  g.feature('c2').set('r',0.5);
  g.feature('c2').set('h',4);
  g.feature('c2').set('pos','1 1 0');
  g.feature('c2').set('axis','pi/2 0');
  g.create('c3','Cylinder');
  g.feature('c3').set('r',20);
  g.feature('c3').set('h',40);
  g.feature('c3').set('pos','0 0 -100');
  g.feature('c3').set('axis','1 1 1');
  g.run;
SEE ALSO
```

Cone, ECone

