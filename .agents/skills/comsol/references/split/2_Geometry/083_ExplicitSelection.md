# *ExplicitSelection*

Create explicit selections of geometric entities or objects.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ExplicitSelection");
model.component(<ctag>).geom(<tag>).feature().selection("selection");
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
```

## **DESCRIPTION**

The following properties are available:

| PROPERTY     | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| angletol     | double                                                                                         | 5                             | Angle tolerance for continuity evaluation.                                                                                                            |
| color        | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| contributeto | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                         |
| customcolor  | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| groupcontang | on   off                                                                                       | off                           | Continuous tangent mode.                                                                                                                              |
| selection    | Selection                                                                                      | empty                         | Selection of entities or objects.                                                                                                                     |
| selkeep      | on   off                                                                                       | on                            | Keep the selection within the geometry sequence.                                                                                                      |
| selshow      | on   off                                                                                       | on                            | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.                                                |

Use the selection methods described in the section "Geometry Object Selection Methods" under model. component(*<ctag>*).geom() to specify the selection model.component(*<ctag>*).geom(*<tag>*).feature(). selection("selection").

For a boundary or edge selection in 2D or 3D, you can force the selection to select whole groups of entities by setting the property groupcontang to on. Each group consists of adjacent entities that meet at an angle less than angletol.

See Selections of Geometric Entities for general information about selections.

#### **COMPATIBILITY**

The following alias can also be used:

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Selection");
```

## **EXAMPLE**

The sequence below creates a block and a cylinder and creates a selection of face 4 of the block. This corresponds to faces 9 and 13 in the finalized geometry.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.run("blk1");
  g.create("sel1","ExplicitSelection");
  g.feature("sel1").selection("selection").init(2);
  g.feature("sel1").selection("selection").set("blk1", new int[]{4});
  g.create("cyl1", "Cylinder");
  g.run();
  int[] faces = model.selection("geom1_sel1").entities(2);
```

```
// faces = 9, 13
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.run('blk1');
  g.create('sel1','ExplicitSelection');
  g.feature('sel1').selection('selection').init(2);
  g.feature('sel1').selection('selection').set('blk1', 4);
  g.create('cyl1', 'Cylinder');
  g.run;
  faces = model.selection('geom1_sel1').entities(2);
  % faces = 9, 13
```

#### **SEE ALSO**

AdjacentSelection, BallSelection, BoxSelection, CylinderSelection, Disk Selection, UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection

