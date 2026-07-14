# **EXAMPLE**

Create a cone with an apex:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  double h = 3;
  double r = 2;
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.angularUnit("rad");
  g.create("c1","Cone");
  g.feature("c1").set("r",r);
  g.feature("c1").set("h",h);
  g.feature("c1").set("ang", Math.atan(r/h));
  double ang = g.feature("c1").getDouble("ang");
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  h = 3;
```

```
r = 2;
  g = model.component('comp1').geom.create('geom1',3);
  g.angularUnit('rad');
  g.create('c1','Cone');
  g.feature('c1').set('r',r);
  g.feature('c1').set('h',h);
  g.feature('c1').set('ang', atan2(r,h));
  ang = g.feature('c1').getDouble('ang');
Create a truncated and rotated cone:
Code for Use with Java
  g.create("c2","Cone");
  g.feature("c2").set("pos", "1 -2 4");
  g.feature("c2").set("axis", "1 -1 0.3");
  g.feature("c2").set("rot",Math.PI/3);
  g.run();
Code for Use with MATLAB
  g.create('c2','Cone');
  g.feature('c2').set('pos', '1 -2 4');
  g.feature('c2').set('axis', '1 -1 0.3');
  g.feature('c2').set('rot', pi/3);
  g.run;
```

## **SEE ALSO**

Cylinder, ECone

*ConvertToSolid, ConvertToSurface, ConvertToCurve, ConvertToPoint*

Unite and convert objects to a solid, surface, curve, or point object.

