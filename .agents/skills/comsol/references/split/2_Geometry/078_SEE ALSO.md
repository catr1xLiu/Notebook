# **SEE ALSO**

CentroidMeasurement, Measurement Methods

Create a solid or surface eccentric oblique cone or frustum in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ECone");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ECone") to create an eccentric oblique cone. The following properties are available:

TABLE 3-66: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle         | double                                                                                   | 360                           | Ellipse sector angle.                                                                                                                                                                                                              |
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the normal to the bottom ellipse.<br>Vector has length 3 if axistype is cartesian,<br>and length 2 if axistype is spherical.                                                                                          |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| displ         | double[2]                                                                                | {0,0}                         | Displacement of top ellipse relative to bottom<br>ellipse in the local coordinate system.                                                                                                                                          |
| h             | double                                                                                   | 1                             | Height.                                                                                                                                                                                                                            |
| pos           | double[3]                                                                                | {0,0,0}                       | Center of the bottom ellipse.                                                                                                                                                                                                      |
| r             | double                                                                                   | 1                             | Radius of bottom ellipse.                                                                                                                                                                                                          |
| rat           | double                                                                                   | 0.5                           | Ratio between perimeter for top ellipse and<br>bottom ellipse.                                                                                                                                                                     |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| semiaxes      | double[2]                                                                                | {1,1}                         | Semiaxes of bottom ellipse.                                                                                                                                                                                                        |
| type          | solid   surface                                                                          | solid                         | Object type.                                                                                                                                                                                                                       |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-67: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"econe3") creates a solid eccentric cone.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"econe2") creates a surface eccentric cone.

The following properties are also available:

TABLE 3-68: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| a, b     | double   | 1       | Alias for semiaxes.                        |
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

## **EXAMPLES**

*Code for Use with Java*

Create a truncated eccentric cone with the base face in the *xy*-plane:

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("e1","ECone");
  g.feature("e1").set("semiaxes","10 40");
  g.feature("e1").set("h",20);
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('e1','ECone');
  g.feature('e1').set('semiaxes','10 40');
  g.feature('e1').set('h',20);
Create an eccentric cone with an apex, that is, a singular patch, on top:
Code for Use with Java
  g.create("e2","ECone");
  g.feature("e2").set("semiaxes","1 2");
  g.feature("e2").set("h",4);
  g.feature("e2").set("rat",0);
  g.feature("e2").set("displ","1 1");
  g.feature("e2").set("pos","100 100 100");
  g.feature("e2").set("axis","0 1 4");
  g.feature("e2").set("rot",45);
  g.run();
Code for Use with MATLAB
  g.create('e2','ECone');
  g.feature('e2').set('semiaxes','1 2');
```

```
g.feature('e2').set('h',4);
g.feature('e2').set('rat',0);
g.feature('e2').set('displ','1 1');
g.feature('e2').set('pos','100 100 100');
g.feature('e2').set('axis','0 1 4');
g.feature('e2').set('rot',45);
g.run;
```

## **SEE ALSO**

Cone, Cylinder

