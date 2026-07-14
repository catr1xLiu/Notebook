# **SEE ALSO**

Circle

Create a solid or surface ellipsoid in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Ellipsoid");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Ellipsoid") to create an ellipsoid. The following properties are available:

TABLE 3-74: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the local z-axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if axistype<br>is spherical.                                                                                                          |
| axistype      | x   y   z   cartesian<br>  spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is<br>only available when selresult in active.                      |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| layer         | double[]                                                                                 |                               | Thicknesses of layers.                                                                                                                                                                                                             |
| pos           | double[]                                                                                 | {0,0,0}                       | Center.                                                                                                                                                                                                                            |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| sellayer      | on   off                                                                                 | off                           | Create layer selections.                                                                                                                                                                                                           |
| sellayershow  | on   off                                                                                 | on                            | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                                             |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd<br>  edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| semiaxes      | double[3]                                                                                | {1,1,1}                       | Semiaxes.                                                                                                                                                                                                                          |
| type          | solid   surface                                                                          | solid                         | Object type.                                                                                                                                                                                                                       |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane  <br>work-plane feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-75: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ellipsoid3") creates a solid ellipsoid.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ellipsoid2") creates a surface ellipsoid.

The following properties are also available:

TABLE 3-76: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| a, b, c  | double   | 1       | Alias for semiaxes.                        |
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

### **EXAMPLE**

The following commands create a surface and solid ellipsoid, where the position and semiaxes are defined in two alternative ways:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("e2","Ellipsoid");
  g.feature("e2").set("type","surface");
  g.feature("e2").set("pos","0 1 0");
  g.create("e3","Ellipsoid");
  g.feature("e3").set("semiaxes","12 10 8");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('e2','Ellipsoid');
  g.feature('e2').set('type','surface');
  g.feature('e2').set('pos','0 1 0');
  g.create('e3','Ellipsoid');
  g.feature('e3').set('semiaxes','12 10 8');
  g.run;
```

