# *Pyramid*

Create solid or surface rectangular pyramid or frustum in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Pyramid");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Pyramid") to create a pyramid. The following properties are available:

TABLE 3-138: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| a, b          | double                                                                                   | 1                             | Side lengths for bottom rectangle.                                                                                                                                                                                                 |
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the axis orthogonal to the bottom<br>rectangle. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical.                                                                            |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| h             | double                                                                                   | 1                             | Height.                                                                                                                                                                                                                            |
| pos           | double[]                                                                                 | {0,0,0}                       | Center of the bottom rectangle.                                                                                                                                                                                                    |
| rat           | double                                                                                   | 0.5                           | Ratio of perimeter of top rectangle and bottom<br>rectangle.                                                                                                                                                                       |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| type          | solid   surface                                                                          | solid                         | Object type.                                                                                                                                                                                                                       |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-Instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-139: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"pyramid3") creates a solid pyramid.
model.component(<ctag>).geom(<tag>).create(<ftag>,"pyramid2") creates a surface pyramid.
```

The following properties are also available:

TABLE 3-140: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

#### **EXAMPLE**

Create a pyramid frustum with the base face in the *xy*-plane:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("e1","Pyramid");
  g.feature("e1").set("a",10).set("b",40);
  g.feature("e1").set("h",20);
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('e1','Pyramid');
  g.feature('e1').set('a',10).set('b',40);
  g.feature('e1').set('h',20);
Create a pyramid with an apex:
Code for Use with Java
  g.create("e2","Pyramid");
  g.feature("e2").set("a",1).set("b",2);
  g.feature("e2").set("h",4);
  g.feature("e2").set("rat",0);
  g.feature("e2").set("pos","100 100 100");
  g.feature("e2").set("axis","0 1 4");
  g.feature("e2").set("rot",45);
  g.run();
Code for Use with MATLAB
  g.create('e2','Pyramid');
  g.feature('e2').set('a',1).set('b',2);
  g.feature('e2').set('h',4);
  g.feature('e2').set('rat',0);
  g.feature('e2').set('pos','100 100 100');
  g.feature('e2').set('axis','0 1 4');
  g.feature('e2').set('rot',45);
  g.run;
```

## **SEE ALSO**

Cone, ECone

Create a rational Bézier curve of degree 2 in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"QuadraticBezier");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"QuadraticBezier") to create a quadratic Bézier curve in 2D or 3D. The following properties are available:

TABLE 3-141: VALID PROPERTY/VALUE PAIRS FOR A QUADRATIC BÉZIER CURVE.

| PROPERTY      | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between<br>1 and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is<br>only available when selresult in active.                              |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| p             | double[sdim][3]                                                                             | 0                             | Control points.                                                                                                                                                                                                                            |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from<br>a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| w             | double[3]                                                                                   | {1, 1/sqrt(2),1}              | Weights for the control points.                                                                                                                                                                                                            |
| workplanesrc  | this  <br>part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from<br>(in 3D only).                                                                                                                                                                         |
| workplane     | xyplane  <br>work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is the<br>global Cartesian coordinate system.                                                                                                 |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see QuadraticBezier.

The following attributes are available:

TABLE 3-142: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **EXAMPLE**

The following commands creates a quadratic Bézier curve in 2D with control points in (4, 2); (8, 8); and (16, 4):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("qb1", "QuadraticBezier");
  g.feature("qb1").setIndex("p", 4, 0, 0);
  g.feature("qb1").setIndex("p", 2, 1, 0);
  g.feature("qb1").setIndex("p", 8, 0, 1);
  g.feature("qb1").setIndex("p", 8, 1, 1);
  g.feature("qb1").setIndex("p", 16, 0, 2);
  g.feature("qb1").setIndex("p", 4, 1, 2);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('qb1','QuadraticBezier');
  g.feature('qb1').setIndex('p', 4, 0, 0);
  g.feature('qb1').setIndex('p', 2, 1, 0);
  g.feature('qb1').setIndex('p', 8, 0, 1);
  g.feature('qb1').setIndex('p', 8, 1, 1);
  g.feature('qb1').setIndex('p', 16, 0, 2);
  g.feature('qb1').setIndex('p', 4, 1, 2);
  g.run;
```

## **SEE ALSO**

CubicBezier, CompositeCurve

