# *AdjacentSelection*

Create a selection of entities or objects that are adjacent to given selections.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"AdjacentSelection");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

AdjacentSelection creates a selection of all entities of dimension outputdim that are adjacent to at least one entity in the input selections. If the output selection has lower dimension than the input selections, you can use the exterior and interior properties to exclude or include output entities that are exterior/interior to the union of the input selections.

The following properties are available:

| PROPERTY     | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                    | Next available theme<br>color | The color to use. Active when color is set to<br>custom.                                                                                              |
| entitydim    | 0   1   2   3                                                                                  | space dimension               | Dimension of input entities.                                                                                                                          |
| exterior     | on   off                                                                                       | on                            | Include output entities that are exterior to the union<br>of the input selections.                                                                    |
| input        | String[]                                                                                       | {}                            | Tags of input selections.                                                                                                                             |
| interior     | on   off                                                                                       | off                           | Include output entities that are interior to the union of<br>the input selections.                                                                    |
| outputdim    | 0   1   2   3                                                                                  | space dimension - 1           | Dimension of entities to select.                                                                                                                      |
| selkeep      | on   off                                                                                       | on                            | Keep the selection within the geometry sequence.                                                                                                      |
| selshow      | on   off                                                                                       | on                            | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.                                                |
| contributeto | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                         |

See Selections of Geometric Entities for general information about selections.

## **EXAMPLE**

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("sph1", "Sphere");
  g.run("sph1");
  g.create("sel1", "ExplicitSelection");
  g.feature("sel1").selection("selection").init(0);
  g.feature("sel1").selection("selection").set("sph1", new int[]{4});
  g.create("adjsel1", "AdjacentSelection");
  g.feature("adjsel1").set("entitydim", 0);
  g.feature("adjsel1").set("input", new String[]{"sel1"});
  g.run("adjsel1");
  g.create("del1", "Delete");
  g.feature("del1").selection("input").named("adjsel1");
  g.run("del1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('sph1', 'Sphere');
  g.run('sph1');
  g.create('sel1', 'ExplicitSelection');
  g.feature('sel1').selection('selection').init(0);
  g.feature('sel1').selection('selection').set('sph1', 4);
  g.create('adjsel1', 'AdjacentSelection');
  g.feature('adjsel1').set('entitydim', 0);
  g.feature('adjsel1').set('input', 'sel1');
  g.run('adjsel1');
  g.create('del1', 'Delete');
```

```
g.feature('del1').selection('input').named('adjsel1');
g.run('del1');
```

#### **SEE ALSO**

BallSelection, BoxSelection, CylinderSelection, Disk Selection, ExplicitSelection, UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection

