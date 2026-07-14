# **COMPATIBILITY**

In version 4.3, the algorithm was changed slightly. The main difference is that the old algorithm preserved the object type for solid, surface, and curve objects. To get the old behavior, set compat to 4.2a.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"del") creates a Delete feature.

## **EXAMPLE**

Delete face 5 from a surface block:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g =model.component("comp1").geom().create("geom1",3);
  g.create("blk1","Block");
  g.feature("blk1").set("type", "surface");
  g.run("blk1");
```

```
g.create("del1","Delete");
  g.feature("del1").selection("input").set("blk1",5);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('blk1','Block');
  g.feature('blk1').set('type', 'surface');
  g.run('blk1');
  g.create('del1','Delete');
  g.feature('del1').selection('input').set('blk1',5);
  g.run;
```

## **SEE ALSO**

Compose, Union, Intersection, Difference, Extract

