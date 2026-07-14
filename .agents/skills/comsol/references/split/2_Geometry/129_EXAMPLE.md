# **EXAMPLE**

The following commands generate a point at (1, 2) in a 2D geometry:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("p1","Point");
  g.feature("p1").set("p",new double[][]{{1},{2}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
```

```
g.create('p1','Point');
g.feature('p1').set('p',[1,2]);
g.run;
```

