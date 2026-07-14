# **COMPATIBILITY**

The plane type circularedge from earlier versions is still valid as an alternative to its replacement circleperpendicular, and the plane type general from earlier versions is still valid as an alternative to its replacement coordinates.

## **EXAMPLE**

Create a work plane with a rectangle. When the work plane is built, the rectangle is embedded in the space of the 3D sequence:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("wp1","WorkPlane");
  g.feature("wp1").set("quickplane","yz");
  g.feature("wp1").geom().create("r1","Rectangle");
  g.feature("wp1").geom().feature("r1").set("pos", "1 1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
```

```
model.component.create('comp1');
g = model.component('comp1').geom.create('geom1',3);
g.create('wp1','WorkPlane');
g.feature('wp1').set('quickplane','yz');
g.feature('wp1').geom.create('r1','Rectangle');
g.feature('wp1').geom.feature('r1').set('pos', '1 1');
g.run;
```

## **SEE ALSO**

CrossSection, Extrude, Partition, Revolve, Sweep

