# **EXAMPLE**

Chamfer a rectangle.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1",2);
g.create("r1","Rectangle");
g.create("cha1","Chamfer");
g.feature("cha1").selection("point").set("r1(1)",new int[]{1,2,3,4});
```

```
g.feature("cha1").set("dist",0.1);
  g.run();
Code for use MATLAB
  Model model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.create('cha1','Chamfer');
  g.feature('cha1').selection('point').set('r1(1)',{1,2,3,4});
  g.feature('cha1').set('dist',0.1);
  g.run;
```

## **DIAGNOSTICS**

If a chamfer cannot be created according to the specified properties, this vertex is ignored. When the chamfers generate intersections with other edges in the geometry, an error message is given.

#### **SEE ALSO**

Fillet

