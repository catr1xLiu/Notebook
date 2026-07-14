# **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Map") to create a structured quadrilateral mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the domain (boundary in 3D) selection. If you do not specify any selection the feature creates a mesh on the remaining domains in 2D. In 3D, the default selection is empty.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add a Size, Distribution, or EdgeGroup attribute feature.

The following properties are available:

TABLE 4-26: AVAILABLE PROPERTIES FOR MAP.

| PROPERTY       | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                            |
|----------------|-----------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------|
| adjustedgdistr | on   off                                | off     | When enabled, the mapped mesher adjusts evenly<br>distributed edge mesh.                                                               |
| interpmethod   | auto   transfinite2D  <br>transfinite3D | auto    | Interpolation method (3D meshes only). Only<br>available for meshes conforming with geometry.                                          |
| smoothcontrol  | on   off                                | on      | Specifies if the operation smooths the mesh across<br>removed control entities. Only available for meshes<br>conforming with geometry. |
| smoothmaxiter  | integer                                 | 4       | Specifies the number of smoothing iterations. Used if<br>smoothcontrol is on.                                                          |
| smoothmaxdepth | integer                                 | 4       | Specifies the maximum element smoothing depth.<br>Used if smoothcontrol is on.                                                         |

The following attribute features are used:

TABLE 4-27: ATTRIBUTE FEATURES USED.

| FEATURE      | REMARKS                                           |
|--------------|---------------------------------------------------|
| EdgeGroup    | Defined on the domain/face to be meshed.          |
| Distribution | Used when defined on edges.                       |
| Scale        | Scales Size and Distribution.                     |
| Size         | Defined on domain/face. Uses only hauto and hmax. |

#### **SEE ALSO**

Distribution, Size, EdgeGroup, FreeTri, RemeshFaces, RemeshDomains

## *MergeEntities*

Merge geometric entities of the mesh. The operation can merge points, edges, and boundaries within a tolerance.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"MergeEntities");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"MergeEntities") to merge entities in 3D mesh. Supported input: boundaries, edges, or points. Specify the entities to keep and the entities to be removed by the merge.

The following properties are available:

TABLE 4-28: AVAILABLE PROPERTIES.

| PROPERTY       | VALUE                      | DEFAULT | DESCRIPTION                                                                                                                                |
|----------------|----------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------|
| deformation    | [0, 1]                     | 0       | Specifies how the deformation propagates in the<br>mesh adjacent to the removed entities. 1<br>specifies a translation of the remove side. |
| dimension      | 0   1   2                  | 2       | Specifies the dimension of what to merge. 2<br>specifies boundaries.                                                                       |
| distancetype   | auto   relative   absolute | auto    | Specifies the type maximum distance to enter.                                                                                              |
| keep           | Selection                  |         | Specification of the entities to keep after the<br>merge when pairing is manual.                                                           |
| maxabsdistance | double                     |         | Maximum absolute distance between entities to<br>merge. Used when distancetype is<br>maxabsdistance.                                       |
| maxreldistance | double                     | 0.01    | Maximum relative distance between entities to<br>merge. Used when distancetype is<br>maxreldistance.                                       |
| method         | imprint   one-to-one       | imprint | Specifies how to pair the entities. The option<br>imprint creates an imprint of the entities to<br>remove on the keep side.                |
| pairing        | auto   manual              | auto    | Specify how to pair the entities in the merge,<br>automatically or manual specification of entities<br>to keep and remove.                 |
| placement      | linear   curved            | curved  | Specifies the placement of mesh vertices on the<br>entities to keep.                                                                       |
| precision      | [0, 1]                     | 0.5     | Specifies the precision with which to make the<br>imprints. A value close to 1 gives a more exact<br>imprint. Used when method is imprint. |
| remove         | Selection                  |         | Specification of the entities to remove. Used<br>when pairing is manual.                                                                   |

#### **SEE ALSO**

CollapseEntities, JoinEntities, DeleteEntities, Imprint, Import

## *OnePointMap*

Specify a one-point map for the copy operations and the IdenticalMesh feature to control the orientation of the source mesh on the destination.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"OnePointMap");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"OnePointMap") to define a one-point map for CopyFace or CopyDomain feature *<ftag>*.

The following properties are available:

TABLE 4-29: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE     | DEFAULT | DESCRIPTION                       |
|-----------|-----------|---------|-----------------------------------|
| srcpoint1 | Selection |         | Point on source face/domain.      |
| dstpoint1 | Selection |         | Point on destination face/domain. |

Use the OnePointMap feature if you need to control how the source and destination faces/domains are matched in a copy operation or for an IdenticalMesh feature. When this feature is present, the source mesh is transformed so that srcpoint1 is mapped to dstpoint1.

#### **EXAMPLE**

Create a block and mesh face 4 with a fine mesh near point 8. Copy this mesh onto face 3 and ensure that the fine mesh near point 8 ends up near point 3:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("blk1", "Block");
  g.run();
  m.create("ftri1", "FreeTri");
  m.feature("ftri1").selection().set(new int[]{4});
  m.feature("ftri1").create("size1", "Size");
  m.feature("ftri1").feature("size1").selection().geom("geom1", 0).set(new int[]{8});
  m.feature("ftri1").feature("size1").set("hmax", "0.01");
  m.create("cpf1", "CopyFace");
  m.feature("cpf1").selection("source").geom("geom1", 2).set(new int[]{4});
  m.feature("cpf1").selection("destination").geom("geom1", 2).set(new int[]{3});
  m.feature("cpf1").create("pm1", "OnePointMap");
  m.feature("cpf1").feature("pm1").selection("srcpoint1").set(new int[]{8});
  m.feature("cpf1").feature("pm1").selection("dstpoint1").set(new int[]{3});
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom().create('geom1', 3);
  m = model.component('comp1').mesh().create('mesh1', 'geom1');
  g.create('blk1', 'Block');
  g.run();
  m.create('ftri1', 'FreeTri');
  m.feature('ftri1').selection().set(4);
  m.feature('ftri1').create('size1', 'Size');
  m.feature('ftri1').feature('size1').selection().geom('geom1', 0).set(8);
  m.feature('ftri1').feature('size1').set('hmax', '0.01');
  m.create('cpf1', 'CopyFace');
  m.feature('cpf1').selection('source').geom('geom1', 2).set(4);
  m.feature('cpf1').selection('destination').geom('geom1', 2).set(3);
  m.feature('cpf1').create('pm1', 'OnePointMap');
  m.feature('cpf1').feature('pm1').selection('srcpoint1').set(8);
  m.feature('cpf1').feature('pm1').selection('dstpoint1').set(3);
  m.run();
```

#### **SEE ALSO**

Copy, CopyFace, CopyDomain, EdgeMap, TwoPointMap, IdenticalMesh

Refer to another meshing sequence.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Reference");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).expand();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,ftype);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Reference") to refer to another meshing sequence. Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add Scale attribute features.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).expand() to replace the reference with a copy of the referred sequence, where the attributes have been scaled with the scale attribute features of the reference.

The following properties are available:

TABLE 4-30: AVAILABLE PROPERTIES.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION               |
|----------|--------|---------|---------------------------|
| sequence | String |         | Tag of referred sequence. |

Use the sequence property to specify another meshing sequence on the same geometry. When running the feature, all features of the specified sequence are run in the current context.

It is not allowed to introduce circular references.

## **EXAMPLE**

Create a mixed mesh with quads and triangles on a geometry. Create a second meshing sequence with a scale feature and a reference to the first meshing sequence. The result is a coarser version of the first mesh.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1", 2);
MeshSequence m1 = model.component("comp1").mesh().create("mesh1", "geom1");
g.create("sq1", "Square");
g.create("sq2", "Square");
g.feature("sq2").set("size", "0.5");
g.run();
m1.create("map1", "Map");
m1.feature("map1").selection().geom("geom1", 2).set(new int[]{1});
m1.create("ftri1", "FreeTri");
m1.feature("ftri1").selection().geom("geom1", 2).set(new int[]{2});
m1.run();
MeshSequence m2 = model.mesh().create("mesh2", "geom1");
m2.create("sca1", "Scale");
m2.feature("sca1").set("scale", "2");
m2.create("rf1", "Reference");
m2.feature("rf1").set("sequence", "mesh1");
m2.run();
```

```
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  m1 = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('sq1', 'Square');
  g.create('sq2', 'Square');
  g.feature('sq2').set('size', '0.5');
  g.run();
  m1.create('map1', 'Map');
  m1.feature('map1').selection().geom('geom1', 2).set(1);
  m1.create('ftri1', 'FreeTri');
  m1.feature('ftri1').selection().geom('geom1', 2).set(2);
  m1.run();
  m2 = model.mesh().create('mesh2', 'geom1');
  m2.create('sca1', 'Scale');
  m2.feature('sca1').set('scale', '2');
  m2.create('rf1', 'Reference');
  m2.feature('rf1').set('sequence', 'mesh1');
  m2.run();
```

Scale

