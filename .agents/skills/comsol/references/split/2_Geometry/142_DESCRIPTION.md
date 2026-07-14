# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Scale") to scale geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to scale. The default selection is empty.

The following properties are available:

TABLE 3-154: VALID PROPERTIES FOR SCALE.

| NAME          | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                      |
| factor        | double   double[]                                                                           | 1                             | Scale factor(s).                                                                                                                                                                                                                           |
| input         | Selection                                                                                   |                               | Objects to scale.                                                                                                                                                                                                                          |
| keep          | on   off                                                                                    | off                           | Keep input objects.                                                                                                                                                                                                                        |
| propagatesel  | on   off                                                                                    | on                            | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                           |
| pos           | double[]                                                                                    | 0                             | Center of scaling.                                                                                                                                                                                                                         |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                               | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| workplanesrc  | this  <br>part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from (in<br>3D only).                                                                                                                                                                         |
| workplane     | xyplane  <br>work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate system<br>(in 3D only). The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                 |

If factor is an array, the inputs are scaled by the factor[i] in the ith coordinate.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Scale.

The following attributes are available:

TABLE 3-155: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

The sequence below scales the unit circle by (1, 2) about (2, 3):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
```

```
g.create("c1","Circle");
  g.create("s1","Scale");
  g.feature("s1").selection("input").set("c1");
  g.feature("s1").set("factor", "1,2");
  g.feature("s1").set("pos",new double[]{2,3});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.create('s1','Scale');
  g.feature('s1').selection('input').set('c1');
  g.feature('s1').set('factor', '1,2');
  g.feature('s1').set('pos',[2,3]);
  g.run;
```

#### **COMPATIBILITY**

The property out is no longer available.

## **SEE ALSO**

Mirror, Move, Copy, Rotate, RigidTransform

