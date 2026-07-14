# **SEE ALSO**

Cylinder

*UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection*

Combine selections of entities or objects using a Boolean operation.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"UnionSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"IntersectionSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"DifferenceSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"ComplementSelection");
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
```

#### **DESCRIPTION**

Use UnionSelection to get all entities/objects that belong to at least one of the input selections. Use IntersectionSelection to get all entities/objects that belong to all input selections. Use DifferenceSelection to get all entities/objects that belong some of the add selections, but do not belong to any of the subtract selections. Use ComplementSelection to get all entities/objects of the given dimension that do not belong to any input selection.

For DifferenceSelection, the following properties are available:

| PROPERTY     | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| add          | String[]                                                                                    | {}                            | Tags of selections to add.                                                                                                                            |
| color        | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property. |
| contributeto | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                         |
| customcolor  | RGB-triplet                                                                                 | Next available theme<br>color | The color to use. Active when color is set to<br>custom.                                                                                              |
| entitydim    | -1   0   1   2   3                                                                          | space dimension               | Dimension of entities to select1 means Object.                                                                                                        |
| selkeep      | on   off                                                                                    | on                            | Keep the selection within the geometry sequence.                                                                                                      |
| selshow      | on   off                                                                                    | on                            | Show selection in physics, materials, and so on; in<br>part instances; or in 3D from a plane geometry.                                                |
| subtract     | String[]                                                                                    | {}                            | Tags of selections to subtract.                                                                                                                       |

For the other selections, the following properties are available:

| PROPERTY     | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between<br>1 and the<br>number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| contributeto | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                         |
| customcolor  | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| entitydim    | -1   0   1   2   3                                                                             | space dimension               | Dimension of entities to select1 means Object.                                                                                                        |
| input        | String[]                                                                                       | {}                            | Tags of input selections.                                                                                                                             |

| PROPERTY | VALUE                                                                                                                                                                           | DEFAULT                                                                                                                                                                                                              | DESCRIPTION                                                                                                                                               |
|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| selkeep  | on   off                                                                                                                                                                        | on                                                                                                                                                                                                                   | Keep the selection within the geometry sequence.                                                                                                          |
| selshow  | If the level is not<br>Object, the<br>allowed values<br>are on   off. If<br>the level is<br>Object, the<br>allowed values<br>are all   obj  <br>dom   bnd   edg<br>  pnt   off. | If the level is not<br>Object, the default<br>value is on. If the<br>level is Object, the<br>default value is all<br>in a component's<br>geometry, obj in a<br>part, and dom in a<br>work plane's Plane<br>Geometry. | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry. obj is not<br>available in a component's geometry. |

See Selections of Geometric Entities for general information about selections.

#### **EXAMPLE**

In an array of blocks, select all vertices whose distance to the origin is between 2.5 and 3.5. This results in 22 vertices in 7 different objects.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.create("arr1", "Array");
  g.feature("arr1").selection("input").set("blk1");
  g.feature("arr1").set("size", new int[]{3,3,1});
  g.feature("arr1").set("displ", new double[]{1.5,1.5,0});
  g.run("arr1");
  g.create("ballsel1","BallSelection");
  g.feature("ballsel1").set("entitydim", 0);
  g.feature("ballsel1").set("r", 3.5);
  g.feature().duplicate("ballsel2","ballsel1");
  g.feature("ballsel2").set("r", 2.5);
  g.create("difsel1", "DifferenceSelection");
  g.feature("difsel1").set("entitydim", 0);
  g.feature("difsel1").set("add", new String[]{"ballsel1"});
  g.feature("difsel1").set("subtract", new String[]{"ballsel2"});
  g.run("difsel1");
  String[] obj = g.selection("difsel1").objects();
  int nVtx = 0;
  for (int i=0; i<obj.length; ++i)
    nVtx += g.selection("difsel1").entities(obj[i],0).length;
  // obj.length = 7, nVtx = 22
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.create('arr1', 'Array');
  g.feature('arr1').selection('input').set('blk1');
  g.feature('arr1').set('size', [3,3,1]);
  g.feature('arr1').set('displ', [1.5,1.5,0]);
  g.run('arr1');
  g.create('ballsel1','BallSelection');
  g.feature('ballsel1').set('entitydim', 0);
  g.feature('ballsel1').set('r', 3.5);
  g.feature.duplicate('ballsel2','ballsel1');
  g.feature('ballsel2').set('r', 2.5);
  g.create('difsel1', 'DifferenceSelection');
```

```
g.feature('difsel1').set('entitydim', 0);
g.feature('difsel1').set('add', {'ballsel1'});
g.feature('difsel1').set('subtract', {'ballsel2'});
g.run('difsel1');
obj = g.selection('difsel1').objects;
nVtx = 0;
for i=1:length(obj)
  nVtx = nVtx + length(g.selection('difsel1').entities(obj(i),0));
end
% length(obj) = 7, nVtx = 22
```

## **SEE ALSO**

AdjacentSelection, BallSelection, BoxSelection, CylinderSelection, Disk Selection, ExplicitSelection

