# *Helix*

Create a solid, surface, or curve helix (coil) with a circular cross section in 3D.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Helix");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Helix") to create a helix. The following properties are available:

TABLE 3-86: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                          | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axialpitch    | double                                                                                   | 0.3                              | Axial pitch.                                                                                                                                                                                                                       |
| axis          | double[]                                                                                 | {0,0,1}                          | Direction of the helix axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if<br>axistype is spherical.                                                                                                            |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                                | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| chirality     | right   left                                                                             | right                            | Chirality.                                                                                                                                                                                                                         |
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                             | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| contributeto  | String                                                                                   | none                             | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                              | Next<br>available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| endcaps       | paraaxis   perpaxis  <br>perpspine                                                       | paraaxis                         | Direction of end caps.                                                                                                                                                                                                             |
| grep          | bezier   spline                                                                          | spline                           | Geometry representation.                                                                                                                                                                                                           |
| pos           | double[]                                                                                 | {0,0,0}                          | Position of the object.                                                                                                                                                                                                            |
| radialpitch   | double                                                                                   | 0                                | Radial pitch.                                                                                                                                                                                                                      |
| rmaj          | double                                                                                   | 1                                | Major radius.                                                                                                                                                                                                                      |
| rmin          | double                                                                                   | 0.1                              | Minor radius.                                                                                                                                                                                                                      |
| rot           | double                                                                                   | 0                                | Rotational angle about axis.                                                                                                                                                                                                       |
| rtol          | double                                                                                   | 1e-4                             | Relative tolerance.                                                                                                                                                                                                                |
| selresult     | on   off                                                                                 | off                              | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                              | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in<br>all features. |
| turns         | double                                                                                   | 3                                | Number of turns.                                                                                                                                                                                                                   |
| type          | solid   surface                                                                          | solid                            | Object type.                                                                                                                                                                                                                       |
| twistcomp     | on   off                                                                                 | on                               | Twist compensation.                                                                                                                                                                                                                |
| workplanesrc  | this   part-instance<br>feature                                                          | this                             | Part-instance feature to take the work plane<br>from.                                                                                                                                                                              |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                          | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-87: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **EXAMPLE**

The following sequence generates a surface helix and a solid helix:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  GeomFeature h = g.create("h1","Helix");
  h.set("type","surface");
  h.set("rmaj",2);
  h.set("rmin",0.3);
  h.set("axialpitch",1);
  GeomFeature h2 = g.create("h2","Helix");
  h2.set("rmaj",10);
  h2.set("rmin",2);
  h2.set("axialpitch",1);
  h2.set("pos","0,0,-100");
  h2.set("axis","1,1,1");
  h2.set("rot",60);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  h = g.create('h1','Helix');
  h.set('type','surface');
  h.set('rmaj',2);
  h.set('rmin',0.3);
  h.set('axialpitch',1);
  h2 = g.create('h2','Helix');
  h2.set('rmaj',10);
  h2.set('rmin',2);
  h2.set('axialpitch',1);
  h2.set('pos','0,0,-100');
  h2.set('axis','1,1,1');
  h2.set('rot',60);
  g.run;
SEE ALSO
```

Torus, Sweep

*Hexahedron*

Create a solid or surface hexahedron bounded by bilinear faces.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Hexahedron");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Hexahedron") to create a general hexahedron. The following properties are available:

TABLE 3-88: VALID PROPERTY/VALUE PAIRS FOR HEXAHEDRON.

| PROPERTY NAME | PROPERTY VALUE                                                                              | DEFAULT                                                         | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|---------------------------------------------------------------------------------------------|-----------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                                                            | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                   |
| contributeto  | String                                                                                      | none                                                            | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                                 | Next available theme<br>color                                   | The color to use. Active when color is set<br>to custom.                                                                                                                                                                           |
| p             | double[3][8]                                                                                | {{0,0,1,1,0,0,1,1},<br>{0,1,1,0,0,1,1,0},<br>{0,0,0,0,1,1,1,1}} | Corner coordinates.                                                                                                                                                                                                                |
| selresult     | on   off                                                                                    | off                                                             | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                               | dom                                                             | Show selections, if selresult is on, of<br>resulting objects in physics, materials, and so<br>on, or in part instances. obj is not available<br>in a component's geometry. dom, bnd, and<br>edg are not available in all features. |
| type          | solid   surface                                                                             | solid                                                           | Object type.                                                                                                                                                                                                                       |
| workplanesrc  | this  <br>part-instance<br>feature                                                          | this                                                            | Part-instance feature to take the work plane<br>from.                                                                                                                                                                              |
| workplane     | xyplane  <br>work-plane feature                                                             | xyplane                                                         | Work-plane feature that defines the<br>coordinate system. The default, xyplane, is<br>the global Cartesian coordinate system.                                                                                                      |

For a hexahedron approximately aligned to the coordinate planes, the points in p are ordered as follows:

- **•** The first four points and the last four points projected down to the (*x*, *y*)-plane defines two negatively oriented quadrangles (quadrilaterals).
- **•** The corresponding plane for the second quadrangle must lie above the plane of the first quadrant in the *z* direction.
- **•** Generally oriented hexahedra have the points of p ordered in a similar way, except for a rigid transformation of the defining point set.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-89: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **EXAMPLE**

The following command generates a solid hexahedron object:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("h1","Hexahedron");
  g.feature("h1").set("p",new double[][]
        {{0,0.0,1,1.0,0,0,1.0,1},
         {0,0.8,1,0.0,0,1,1.2,0},
         {0,0.1,0,0.2,1,1,2.0,1}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('h1','Hexahedron');
  g.feature('h1').set('p',...
     [[0,0.0,1,1.0,0,0,1.0,1];...
     [0,0.8,1,0.0,0,1,1.2,0];...
     [0,0.1,0,0.2,1,1,2.0,1]]);
  g.run;
```

#### **SEE ALSO**

Block, Pyramid, Tetrahedron

*If, ElseIf, Else, EndIf*

Construct an If statement, enabling or disabling features depending on conditions in terms of parameters.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,<type>);
model.component(<ctag>).geom(<tag>).createAfter(<ftag>,<type>,<postag>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,*<type>*) to add an If, ElseIf, Else, or EndIf feature after the current feature.

Use model.component(*<ctag>*).geom(<tag>).feature().createAfter(*<ftag>*,*<type>*,*<postag>*) to add an If, ElseIf, Else, or EndIf feature after the feature tagged *<postag>*.

The following property is available for If and ElseIf only:

TABLE 3-90: VALID PROPERTY.

| NAME      | VALUE  | DEFAULT | DESCRIPTION                               |
|-----------|--------|---------|-------------------------------------------|
| condition | double | 1       | Logical condition in terms of parameters. |

#### **EXAMPLE**

Build a block if variant = 1, else build a cone:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.param().set("variant", "1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
```

```
g.create("if1", "If");
  g.feature("if1").set("condition", "variant==1");
  g.create("blk1", "Block");
  g.create("else1", "Else");
  g.create("cone1", "Cone");
  g.create("endif1", "EndIf");
  g.run();
  model.param().set("variant", "2");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.param.set('variant', '1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('if1', 'If');
  g.feature('if1').set('condition', 'variant==1');
  g.create('blk1', 'Block');
  g.create('else1', 'Else');
  g.create('cone1', 'Cone');
  g.create('endif1', 'EndIf');
  g.run;
  model.param.set('variant', '2');
  g.run;
```

