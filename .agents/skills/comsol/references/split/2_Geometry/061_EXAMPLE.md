# **EXAMPLE**

The sequence below creates a unit disk (solid circle object).

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("c1","Circle");
  g.feature("c1").set("pos",new double[]{2,3});
  String base = g.feature("c1").getString("base");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.feature('c1').set('pos',[2,3]);
  base = g.feature('c1').getString('base');
  g.run;
```

#### **SEE ALSO**

Ellipse

Create a circular arc in 2D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CircularArc");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CirularArc") to create a circular arc in 2D. The following properties are available:

TABLE 3-40: VALID PROPERTY/VALUE PAIRS FOR A CIRCULAR ARC.

| PROPERTY      | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1        | double                                                                                      | 0                             | Start angle (in degrees).                                                                                                                                                                                                                  |
| angle2        | double                                                                                      | 90                            | End angle (in degrees).                                                                                                                                                                                                                    |
| center        | double[2]                                                                                   | {0,0}                         | Center coordinates.                                                                                                                                                                                                                        |
| clockwise     | on   off                                                                                    | off                           | Clockwise direction.                                                                                                                                                                                                                       |
| color         | none   custom  <br>integer between<br>1 and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| point1        | double[2]                                                                                   | {1,0}                         | Starting point.                                                                                                                                                                                                                            |
| point2        | double[2]                                                                                   | {0,1}                         | Endpoint.                                                                                                                                                                                                                                  |
| specify       | center   endsr  <br>endsangle1  <br>endsangle2                                              | center                        | Properties to specify.                                                                                                                                                                                                                     |
| r             | double                                                                                      | 1                             | Radius.                                                                                                                                                                                                                                    |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| shortarc      | on   off                                                                                    | on                            | Use the shorter arc.                                                                                                                                                                                                                       |
| type          | solid   curve                                                                               | solid                         | Object type.                                                                                                                                                                                                                               |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see CircularArc.

The following attributes are available:

TABLE 3-41: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

### **EXAMPLE**

The sequence below creates a circular arc that is a half circle with the center in (0.5, 0.5) and endpoints in (0, 0) and (1, 1), specified using the center, radius, and angles.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("ca1", "CircularArc");
  g.feature("ca1").set("center", new double[]{0.5, 0.5});
  g.feature("ca1").set("r", 0.707106781187);
  g.feature("ca1").set("angle1", 225);
  g.feature("ca1").set("angle2", 45);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('ca1','CircularArc');
  g.feature('ca1').set('center',[0.5, 0.5]);
  g.feature('ca1').set('r', 1/sqrt(2));
  g.feature('ca1').set('angle1', 225);
  g.feature('ca1').set('angle2', 45);
  g.run;
```

## **SEE ALSO**

Circle, CompositeCurve

