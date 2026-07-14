# **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CopyDomain") to copy mesh between domains in a 2D or 3D geometry.

If you want to specify the orientation of the source mesh on the destination, use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*maptype*) to add an EdgeMap, OnePointMap, or TwoPointMap attribute feature.

The following properties are available:

TABLE 4-24: AVAILABLE PROPERTIES FOR COPYDOMAIN.

| PROPERTY    | VALUE                         | DEFAULT | DESCRIPTION             |
|-------------|-------------------------------|---------|-------------------------|
| copymethod  | auto   singlecopy   arraycopy | auto    | Type of copy operation. |
| source      | Selection                     | Empty   | Source domains.         |
| destination | Selection                     | Empty   | Destination domains.    |

TABLE 4-24: AVAILABLE PROPERTIES FOR COPYDOMAIN.

| PROPERTY       | VALUE    | DEFAULT | DESCRIPTION                                                                     |
|----------------|----------|---------|---------------------------------------------------------------------------------|
| smoothcontrol  | on   off | on      | Specifies if the operation smooths the mesh<br>across removed control entities. |
| smoothmaxiter  | integer  | 4       | Specifies the number of smoothing iterations.                                   |
| smoothmaxdepth | integer  | 4       | Specifies the maximum element smoothing<br>depth.                               |

Use the properties source and destination to specify the source and destination boundaries. The copymethod property determines which type of copy is used: single copy (all-to-one), array copy (one-to-one), or automatic detection. The value auto lets the software choose between single copy (all-to-one), array copy (one-to-one), or a mixture of the two.

#### **EXAMPLE**

Mesh block 1 and copy the mesh to block 2.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("blk1", "Block");
  g.create("blk2", "Block");
  g.feature("blk2").setIndex("pos", "2", 0);
  g.run();
  m.create("ftet1", "FreeTet");
  m.feature("ftet1").selection().set(new int[]{1});
  m.create("cpd1", "CopyDomain");
  m.feature("cpd1").selection("source").set(new int[]{1});
  m.feature("cpd1").selection("destination").set(new int[]{2});
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('blk1', 'Block');
  g.create('blk2', 'Block');
  g.feature('blk2').setIndex('pos', '2', 0);
  g.run;
  m.create('ftet1', 'FreeTet');
  m.feature('ftet1').selection().set(1);
  m.create('cpd1', 'CopyDomain');
  m.feature('cpd1').selection('source').set(1);
  m.feature('cpd1').selection('destination').set(2);
  m.run;
```

