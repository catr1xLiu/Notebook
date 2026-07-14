# *Move, Copy*

Move or copy geometry objects by translation.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Move");
model.component(<ctag>).geom(<tag>).create(<ftag>,"Copy");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Move") to move geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Copy") to move a copy of geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to move or copy. The default selection is empty.

The following properties are available:

TABLE 3-115: VALID PROPERTIES FOR MOVE AND COPY.

| NAME           | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|----------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| contributeto   | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor    | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| displx         | double[]                                                                                    | 0                             | x displacement. Used when specify is displ.                                                                                                                                                                   |
| disply         | double[]                                                                                    | 0                             | y displacement. Used when specify is displ.                                                                                                                                                                   |
| displz         | double[]                                                                                    | 0                             | z displacement. Used when specify is displ.                                                                                                                                                                   |
| newpos         | vertices   coord                                                                            | vertices                      | The new (destination) position. Used when specify<br>is pos.                                                                                                                                                  |
| newposvertices | Selection                                                                                   |                               | Vertices to move to. Used when newpos is<br>vertices.                                                                                                                                                         |

TABLE 3-115: VALID PROPERTIES FOR MOVE AND COPY.

| NAME          | VALUE                                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|-----------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| newposx       | double[]                                      | 0       | x-coordinates of new positions. Used when newpos<br>is coord.                                                                                                                                                                      |
| newposy       | double[]                                      | 0       | y-coordinates of new positions. Used when newpos<br>is coord.                                                                                                                                                                      |
| newposz       | double[]                                      | 0       | z-coordinates of new positions. Used when newpos<br>is coord.                                                                                                                                                                      |
| oldpos        | vertex   coord                                | vertex  | The old (original) position. Used when specify is<br>pos.                                                                                                                                                                          |
| oldposvertex  | Selection                                     |         | Vertex to move to. Used when oldpos is vertex.                                                                                                                                                                                     |
| oldposcoord   | double[sdim]                                  | 0       | Coordinates of old position. Used when oldpos is<br>coord.                                                                                                                                                                         |
| propagatesel  | on   off                                      | on      | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                   |
| selresult     | on   off                                      | off     | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off | dom     | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| specify       | displ   pos                                   | displ   | Specify displacement vector or positions.                                                                                                                                                                                          |
| workplanesrc  | this   part-instance<br>feature               | this    | Part-instance feature to take the work plane from (in<br>3D only).                                                                                                                                                                 |
| workplane     | xyplane  <br>work-plane feature               | xyplane | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is the<br>global Cartesian coordinate system.                                                                                         |

If displ is a one-dimensional array, a single copy of each input object is created using the translation vector displ. If displ is a two-dimensional array, several copies can be created, where the nth copy has translation displ[i][n] in the ith coordinate.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Move, and Copy.

The following attributes are available:

TABLE 3-116: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

The sequence below moves a circle from the origin to (2, 3):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("c1","Circle");
  g.create("m1","Move");
  g.feature("m1").selection("input").set("c1");
```

```
g.feature("m1").set("displ", new double[][]{{2},{3}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.create('m1','Move');
  g.feature('m1').selection('input').set('c1');
  g.feature('m1').set('displ', [2,3]);
  g.run;
```

#### **SEE ALSO**

Array, Mirror, Rotate, Scale, RigidTransform

