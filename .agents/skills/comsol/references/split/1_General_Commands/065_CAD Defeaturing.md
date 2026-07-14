# *CAD Defeaturing*

If you have a license for the CAD Import Module, or a LiveLink™ product for CAD software, the following functionality is available. For details, see the *CAD Import Module User's Guide*.

model.component(*<ctag>*).geom(*<tag>*).defeaturing(*tooltag*).*defeaturingMethod* uses a defeaturing tool to create a feature that deletes small details. Available tools are listed in the *CAD Import Module User's Guide.*

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).find() searches for small details, for a defeaturing feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).detail().*selMethod* manipulates the selection of details to remove, for a defeaturing feature *<ftag>*.

*Geometry Object Selection Methods*

For a geometry object selection sel, the following methods are available:

sel.init() sets the selection to be a selection of whole geometry objects. Subsequent calls to set, add, and remove select objects.

sel.init(*dim*) sets the selection property to be a selection of geometric entities of dimension *dim*. Subsequent calls to all, set, add, remove, and clear select entities.

The following three methods are applicable when the selection consists of whole objects. The argument *<onames>* can be an array of strings, or several string arguments.

sel.set(*<onames>*) sets the selection to be the objects *<onames>*.

sel.add(*<onames>*) adds the objects *<onames>* to the selection.

sel.remove(*<onames>*) removes the objects *<onames>* from the selection.

The following seven methods are applicable when the selection consists of geometric entities. The argument *<entities>* can be an array of integers or several integer arguments.

sel.all(*<oname>*) sets the selection to be all the entities of object *<oname>*. The selections on other objects are not affected.

sel.all() sets the selection to be all entities (of the given dimension) of all available objects.

sel.set(*<oname>*,*<entities>*) sets the selection on object *<oname>* to be *<entities>*. The selections on other objects are not affected.

sel.add(*<oname>*,*<entities>*) adds the entities *<entities>* to the selection on object *<oname>*. The selections on other objects are not affected.

sel.remove(*<oname>*,*<entities>*) removes the entities *<entities>* from the selection on object *<oname>*. The selections on other objects are not affected.

sel.clear() removes all entities from the selection.

The set, add, and remove methods can all be vectorized. See Selections of Geometric Entities for more information.

sel.clear(*<oname>*) clears the selection on object *<oname>*. The selections on other objects are not affected.

To let the selection be defined by a named selection, use:

sel.named(*<seltag>*) where *<seltag>* is the trimmed tag of a named selection defined by a preceding feature in the geometry sequence. See Selections of Geometric Entities for more information.

To get information about the selection, use:

String[] onames = sel.objects() returns the names of the selected objects.

int dim = sel.dim() returns the dimension for the entities in the selection if the selection consists of geometric entities; otherwise, it returns −1.

int[] dims = sel.dimension() returns an array of length 1 containing the entity dimension if the selection consists of geometric entities; otherwise, it returns an empty array.

int[] ent = sel.entities(*<oname>*,*dim*) returns the entities in the selection on object *<oname>* at the given dimension, if the selection consists of geometric entities.

int[] ent = sel.entities(*<oname>*) returns the entities in the selection on object *<oname>*, if the selection consists of geometric entities.

String[] seltag = sel.named() returns the trimmed tag of the named selection that this selection refers to, or an empty string if the selection does not refer to a named selection.

## *If Statements*

Use model.geom(<tag>).create(*<ftag>*,*<type>*) to add an If, Else If, Else, or End If feature after the current feature.

Use model.geom(<tag>).createAfter(*<ftag>*,*<type>*,*<postag>*) to add an If, Else If, Else, or End If feature after the feature tagged *<postag>*.

*Insert Sequence*

model.geom(*<tag>*).insertFile(*<filename>*,*<gtag>*); inserts a geometry sequence, with tag *<gtag>*, from another model file, with the filename *<filename>*, into the geometry sequence with tag *<tag>*.

model.geom(*<tag>*).insertSequence(*<mtag>*,*<gtag>*); inserts a geometry sequence, with tag *<gtag>*, from another model, with tag *<mtag>*, into the current geometry sequence with tag *<tag>*.

#### **EXAMPLE**

Create a 2D geometry model as the union of a circle and rectangle.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g =model.component("comp1").geom().create("geom1",2);
  g.create("r1","Rectangle");
  g.feature("r1").set("size",new double[]{0.5,1});
  g.feature("r1").set("pos",new double[]{-1,0});
  g.create("c1","Circle");
  g.feature("c1").set("r",0.5);
  g.feature("c1").set("pos",new double[]{0.5,0});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component().create('comp1');
  g =model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.feature('r1').set('size',[0.5,1]);
  g.feature('r1').set('pos',[-1,0]);
  g.create('c1','Circle');
  g.feature('c1').set('r',0.5);
  g.feature('c1').set('pos',[0.5,0]);
  g.run;
```

#### **COMPATIBILITY**

From version 5.6, for a selection of entities, the method objects() returns feature tags for objects that are created by a feature that creates exactly one geometry object.

From version 5.1, the access method argument() is deprecated and replaced with inputParam(), and the access method param() is deprecated and replaced with localParam(). The methods link(…), linked(), and relink() are deprecated and replaced with load(…), loaded(), and reload(), respectively.

From version 4.4, the method

```
model.geom(<tag>).runAll();
is deprecated. Instead, use
  model.component(<ctag>).geom(<tag>).run(<ftag>);
to specify to which feature node in the geometry sequence you wan to run.
From version 4.3a, the methods
  model.geom(<tag>).object(<objname>)
  String[] onames = sel.object()
are deprecated and replaced by the following methods:
  model.component(<ctag>).geom(<tag>).obj(<objname>)
  String[] onames = sel.objects()
```

#### **SEE ALSO**

```
model.mesh()
```

