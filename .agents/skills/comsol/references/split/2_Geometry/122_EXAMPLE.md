# **EXAMPLE**

Create an interior boundary in a cylinder by partitioning it with an oblique work plane:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("cyl1", "Cylinder");
  g.feature("cyl1").set("h", 10);
  g.create("wp1", "WorkPlane");
  g.feature("wp1").set("planetype", "general");
  g.feature("wp1").setIndex("genpoints", 4, 0, 2);
  g.feature("wp1").setIndex("genpoints", 5, 1, 2);
  g.feature("wp1").setIndex("genpoints", 5, 2, 2);
  g.create("par1", "Partition");
  g.feature("par1").selection("input").set("cyl1");
  g.feature("par1").set("partitionwith", "workplane");
  g.run("par1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom', 3);
  g.create('cyl1', 'Cylinder');
```

```
g.feature('cyl1').set('h', 10);
g.create('wp1', 'WorkPlane');
g.feature('wp1').set('planetype', 'general');
g.feature('wp1').setIndex('genpoints', 4, 0, 2);
g.feature('wp1').setIndex('genpoints', 5, 1, 2);
g.feature('wp1').setIndex('genpoints', 5, 2, 2);
g.create('par1', 'Partition');
g.feature('par1').selection('input').set('cyl1');
g.feature('par1').set('partitionwith', 'workplane');
g.run('par1');
```

### **SEE ALSO**

Compose, Union, Intersection, Difference, WorkPlane, PartitionDomains, PartitionEdges

