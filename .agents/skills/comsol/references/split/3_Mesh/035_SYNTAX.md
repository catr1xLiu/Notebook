# **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"BndLayer");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"BndLayerProp");
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"BndLayer") to create a boundary layer mesh in domains in 2D and 3D, and on faces in 3D.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the domain or boundary selection. If you do not specify the selection, the feature operates on all domains or on all boundaries depending on the selection dimension of the corresponding BndLayerProp attribute.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"BndLayerProp") to add a BndLayerProp attribute feature defining the locations and properties of the boundary layers.

The feature reads properties from the BndLayerProp attribute feature.

The following properties are available:

TABLE 4-16: AVAILABLE PROPERTIES FOR BNDLAYER.

| PROPERTY         | VALUE                              | DEFAULT  | DESCRIPTION                                                                                                                                    |
|------------------|------------------------------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------|
| sharpcorners     | none   split  <br>trim             | split    | Specifies the handling of sharp corners in 2D and<br>sharp edges in 3D.                                                                        |
| layerdec         | integer                            | 2        | Maximum difference in number of boundary layers<br>between neighboring points on boundary layer<br>boundaries. For all values of sharpcorners. |
| method           | latest  <br>legacy60  <br>legacy61 | latest   | Specify the boundary layer method to use.                                                                                                      |
| smoothtransition | on   off                           | on       | Specifies if the operation smooths the transition to<br>interior mesh.                                                                         |
| splitangle       | double                             | 240[deg] | Minimum angle between boundary layer boundaries<br>to introduce a boundary layer split. When<br>sharpcorners is split.                         |
| splitdivangle    | double                             | 100[deg] | Maximum angle per split. When sharpcorners is<br>split.                                                                                        |
| trimmaxangle     | double                             | 50[deg]  | Maximum angle for boundary layer trimming in<br>narrow corners. For all values of sharpcorners.                                                |
| trimminangle     | double                             | 240[deg] | Minimum angle between boundary layer boundaries<br>for boundary layer trimming. When<br>sharpcorners is trim.                                  |
| smoothmaxiter    | integer                            | 4        | Specifies the number of smoothing iterations.<br>When smoothtransition is on.                                                                  |
| smoothmaxdepth   | integer                            | 6        | Specifies the maximum element smoothing depth.<br>When smoothtransition is on.                                                                 |

## **EXAMPLES**

Insert boundary layers to an existing mesh containing both quadrilateral elements and triangular elements.

*Code for Use with Java*

```
Model model = ModelUtil.create("Model");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1", 2);
MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
g.create("sq1", "Square");
g.create("sq2", "Square");
g.feature("sq2").setIndex("pos", "1", 0);
g.create("c1", "Circle");
g.feature("c1").set("r", "0.2");
g.feature("c1").setIndex("pos", "1.5", 0);
g.feature("c1").setIndex("pos", "0.5", 1);
g.create("co1", "Compose");
g.feature("co1").selection("input").init().set(new String[]{"c1", "sq1", "sq2"});
g.feature("co1").set("formula", "sq1+sq2-c1");
```

```
g.run();
  m.create("map1", "Map");
  m.feature("map1").selection().geom("geom1", 2);
  m.feature("map1").selection().set(new int[]{1});
  m.create("ftri1", "FreeTri");
  m.create("bl1", "BndLayer");
  m.feature("bl1").create("blp", "BndLayerProp");
  m.feature("bl1").feature("blp").selection().set(new int[]{2, 3, 5, 6, 8, 9, 10, 11});
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('sq1', 'Square');
  g.create('sq2', 'Square');
  g.feature('sq2').setIndex('pos', '1', 0);
  g.create('c1', 'Circle');
  g.feature('c1').set('r', '0.2');
  g.feature('c1').setIndex('pos', '1.5', 0);
  g.feature('c1').setIndex('pos', '0.5', 1);
  g.create('co1', 'Compose');
  g.feature('co1').selection('input').init.set({'c1', 'sq1', 'sq2'});
  g.feature('co1').set('formula', 'sq1+sq2-c1');
  g.run;
  m.create('map1', 'Map');
  m.feature('map1').selection.geom('geom1', 2);
  m.feature('map1').selection.set(1);
  m.create('ftri1', 'FreeTri');
  m.create('bl1', 'BndLayer');
  m.feature('bl1').create('blp', 'BndLayerProp');
  m.feature('bl1').feature('blp').selection.set([2, 3, 5, 6, 8, 9, 10, 11]);
  m.run;
Create a boundary layer mesh consisting of prism elements along the boundary layer boundaries and tetrahedral 
elements in the interior:
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("blk1", "Block");
  g.feature("blk1").setIndex("size", "10", 0);
  g.feature("blk1").setIndex("size", "5", 1);
  g.feature("blk1").setIndex("size", "5", 2);
  g.create("sph1", "Sphere");
  g.feature("sph1").setIndex("pos", "3", 0);
  g.feature("sph1").setIndex("pos", "2.5", 1);
  g.feature("sph1").setIndex("pos", "2.5", 2);
  g.create("dif1", "Difference");
  g.feature("dif1").selection("input").init().set(new String[]{"blk1"});
  g.feature("dif1").selection("input2").init().set(new String[]{"sph1"});
  g.run();
  m.create("ftet1", "FreeTet");
  m.create("bl1", "BndLayer");
  m.feature("bl1").create("blp", "BndLayerProp");
  m.feature("bl1").feature("blp").selection().
   set(new int[]{2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13});
```

```
m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('blk1', 'Block');
  g.feature('blk1').setIndex('size', '10', 0);
  g.feature('blk1').setIndex('size', '5', 1);
  g.feature('blk1').setIndex('size', '5', 2);
  g.create('sph1', 'Sphere');
  g.feature('sph1').setIndex('pos', '3', 0);
  g.feature('sph1').setIndex('pos', '2.5', 1);
  g.feature('sph1').setIndex('pos', '2.5', 2);
  g.create('dif1', 'Difference');
  g.feature('dif1').selection('input').init.set({'blk1'});
  g.feature('dif1').selection('input2').init.set({'sph1'});
  g.run;
  m.create('ftet1', 'FreeTet');
  m.create('bl1', 'BndLayer');
  m.feature('bl1').create('blp', 'BndLayerProp');
  m.feature('bl1').feature('blp').selection.set(2:13);
  m.run;
```

BndLayerProp, Map, Sweep

