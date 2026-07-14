# **EXAMPLE**

The following commands create a block in 3D and a line segment from a vertex in that block to a point with the coordinates (0, 1, 2):

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.create("ls1", "LineSegment");
  g.feature("ls1").set("specify1", "vertex");
  g.feature("ls1").set("specify2", "coord");
  g.feature("ls1").selection("vertex1").set("blk1(1)", new int[]{1});
  g.feature("ls1").set("coord2", new double[]{0, 1, 2});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.create('ls1', 'LineSegment');
  g.feature('ls1').set('specify1', 'vertex');
  g.feature('ls1').set('specify2', 'coord');
  g.feature('ls1').selection('vertex1').set('blk1(1)', 1);
  g.feature('ls1').set('coord2', [0, 1, 2]);
  g.run;
```

