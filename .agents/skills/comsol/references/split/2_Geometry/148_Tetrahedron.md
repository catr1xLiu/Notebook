# *Tetrahedron*

Create a solid or surface tetrahedron in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>)create(<ftag>,"Tetrahedron");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Tetrahedron") to create a tetrahedron. The following properties are available:

TABLE 3-172: VALID PROPERTY/VALUE PAIR FOR TETRAHEDRON.

| PROPERTY NAME | PROPERTY VALUE                                                                              | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|---------------------------------------------------------------------------------------------|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                                    | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                      |
| contributeto  | String                                                                                      | none                                    | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color           | The color to use. Active when color is set to custom.                                                                                                                                                                              |
| p             | double[3][4]                                                                                | {{0,0,1,0},<br>{0,1,0,0},<br>{0,0,0,1}} | Corner coordinates.                                                                                                                                                                                                                |
| selresult     | on   off                                                                                    | off                                     | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                               | dom                                     | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| type          | solid   surface                                                                             | solid                                   | Object type.                                                                                                                                                                                                                       |

TABLE 3-172: VALID PROPERTY/VALUE PAIR FOR TETRAHEDRON.

| PROPERTY NAME | PROPERTY VALUE                     | DEFAULT | DESCRIPTION                                                                                                                   |
|---------------|------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------|
| workplanesrc  | this  <br>part-instance<br>feature | this    | Part-instance feature to take the work plane from.                                                                            |
| workplane     | xyplane  <br>work-plane<br>feature | xyplane | Work-plane feature that defines the coordinate system.<br>The default, xyplane, is the global Cartesian<br>coordinate system. |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-173: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"tetrahedron3") creates a solid tetrahedron.
model.component(<ctag>).geom(<tag>).create(<ftag>,"tetrahedron2") creates a surface tetrahedron.
```

## **EXAMPLE**

The following commands generate a solid tetrahedron object:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("t1","Tetrahedron");
  g.feature("t1").set("p", new double[][]{{0,0,1,0},{0,0.8,1,0},{0,0.1,0,0.2}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('t1','Tetrahedron');
  g.feature('t1').set('p', [[0,0,1,0];[0,0.8,1,0];[0,0.1,0,0.2]]);
  g.run;
```

#### **SEE ALSO**

Hexahedron, Pyramid

