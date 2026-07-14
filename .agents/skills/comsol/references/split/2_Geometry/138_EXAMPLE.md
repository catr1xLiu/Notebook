# **EXAMPLE**

Create a torus about the *y*-axis:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.geom().create("geom1",3);
  g.create("wp1","WorkPlane");
  g.feature("wp1").geom().create("c1", "Circle");
  g.feature("wp1").geom().feature("c1").set("pos", "2 0");
  g.run("wp1");
  g.create("r1","Revolve");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  g = model.geom.create('geom1',3);
```

```
g.create('wp1','WorkPlane');
g.feature('wp1').geom.create('c1', 'Circle');
g.feature('wp1').geom.feature('c1').set('pos', '2 0');
g.run('wp1');
g.create('r1','Revolve');
g.run;
```

#### **SEE ALSO**

Extrude, WorkPlane

