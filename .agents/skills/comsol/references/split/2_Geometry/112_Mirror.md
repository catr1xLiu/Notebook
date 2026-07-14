# *Mirror*

Reflect (mirror) objects in a plane (3D), a line (2D), or a point (1D).

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Mirror");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Mirror") to mirror geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to mirror. The default selection is empty.

The following properties are available:

TABLE 3-113: VALID PROPERTY/VALUE PAIRS FOR MIRROR.

| PROPERTY      | VALUE                                                                                          | DEFAULT                                | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------------|----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between<br>1 and the<br>number of colors<br>in the current<br>theme | none                                   | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. 2D and 3D only.      |
| customcolor   | RGB-triplet                                                                                    | Next available<br>theme color          | The color to use. Active when color is set to<br>custom. 2D and 3D only.                                                                                                                                                           |
| edge          | Selection                                                                                      |                                        | Edge selection. Used when specify is set to edge.                                                                                                                                                                                  |
| input         | Selection                                                                                      |                                        | Objects to reflect.                                                                                                                                                                                                                |
| keep          | on   off                                                                                       | off                                    | Keep input objects.                                                                                                                                                                                                                |
| pos           | double[]                                                                                       | 0                                      | A point to be fixed during reflection.                                                                                                                                                                                             |
| axis          | double[]                                                                                       | {0 0 1} (3D)<br>{1 0} (2D)<br>{1} (1D) | Vector in the direction to reflect.                                                                                                                                                                                                |
| propagatesel  | on   off                                                                                       | on                                     | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                   |
| selresult     | on   off                                                                                       | off                                    | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                                  | dom                                    | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |

TABLE 3-113: VALID PROPERTY/VALUE PAIRS FOR MIRROR.

| PROPERTY     | VALUE                 | DEFAULT     | DESCRIPTION                                                                          |
|--------------|-----------------------|-------------|--------------------------------------------------------------------------------------|
| specify      | pointnormal  <br>edge | pointnormal | Specify the line of reflection as a point and normal or<br>as a straight edge in 2D. |
| contributeto | String                | none        | Tag of cumulative selection to contribute to.                                        |

In 3D, the input objects are reflected in the plane through pos with normal vector axis. In 2D, the input objects are reflected in the line through pos with normal vector axis. In 1D, the input objects are reflected in the point pos.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Mirror.

The following attributes are available:

TABLE 3-114: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

The property out is no longer available.

#### **EXAMPLE**

A 2D example, mirroring a rectangle:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("r1","Rectangle");
  g.create("m1","Mirror");
  g.feature("m1").selection("input").set("r1");
  g.feature("m1").set("pos","2 2");
  g.feature("m1").set("axis","1 1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.create('m1','Mirror');
  g.feature('m1').selection('input').set('r1');
  g.feature('m1').set('pos','2 2');
  g.feature('m1').set('axis','1 1');
  g.run;
A 3D example, mirroring a block:
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("blk1","Block");
  g.create("m1","Mirror");
  g.feature("m1").selection("input").set("blk1");
  g.feature("m1").set("pos","2 2 2");
```

```
g.feature("m1").set("axis","1 1 1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('blk1','Block');
  g.create('m1','Mirror');
  g.feature('m1').selection('input').set('blk1');
  g.feature('m1').set('pos','2 2 2');
  g.feature('m1').set('axis','1 1 1');
  g.run;
```

## **SEE ALSO**

Move, Copy, Rotate, Scale, RigidTransform

