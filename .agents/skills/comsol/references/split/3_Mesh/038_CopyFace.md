# *CopyFace*

Copy a face mesh to copy meshes on faces using a rigid body transformation with a scale factor. Use the attributes EdgeMap, OnePointMap, TwoPointMap to control the orientation of the source mesh on the destination.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"CopyFace");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,maptype);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CopyFace") to copy mesh between faces in a 3D geometry.

If you want to specify the orientation of the source mesh on the destination, use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*maptype*) to add an EdgeMap, OnePointMap, or TwoPointMap attribute feature.

The following properties are available:

TABLE 4-23: AVAILABLE PROPERTIES FOR COPYFACE

| PROPERTY       | VALUE                         | DEFAULT | DESCRIPTION                                                                     |
|----------------|-------------------------------|---------|---------------------------------------------------------------------------------|
| copymethod     | auto   singlecopy   arraycopy | auto    | Type of copy operation.                                                         |
| source         | Selection                     | Empty   | Source boundaries.                                                              |
| destination    | Selection                     | Empty   | Destination boundary.                                                           |
| smoothcontrol  | on   off                      | on      | Specifies if the operation smooths the mesh<br>across removed control entities. |
| smoothmaxiter  | integer                       | 4       | Specifies the number of smoothing iterations.                                   |
| smoothmaxdepth | integer                       | 4       | Specifies the maximum element smoothing<br>depth.                               |

Use the properties source and destination to specify the source and destination boundaries. The copymethod property determines which type of copy is used: single copy (all-to-one), array copy (one-to-one), or automatic detection. The value auto lets the software choose between single copy (all-to-one), array copy (one-to-one), or a mixture of the two.

## **EXAMPLE**

Mesh Face 1 of a block and copy the mesh to the opposite Face 6.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
```

```
GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  MeshSequence m= model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("blk1", "Block");
  g.run();
  m.create("ftri1", "FreeTri");
  m.feature("ftri1").selection().set(new int[]{1});
  m.create("cpf1", "CopyFace");
  m.feature("cpf1").selection("source").set(new int[]{1});
  m.feature("cpf1").selection("destination").set(new int[]{6});
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('blk1', 'Block');
  g.run;
  m.create('ftri1', 'FreeTri');
  m.feature('ftri1').selection().set(1);
  m.create('cpf1', 'CopyFace');
  m.feature('cpf1').selection('source').set(1);
  m.feature('cpf1').selection('destination').set(6);
  m.run;
```

IdenticalMesh, CopyEdge, CopyDomain, Copy, EdgeMap, OnePointMap, TwoPointMap

## *CopyDomain*

Copy a domain mesh to copy meshes on domains using a rigid body transformation with a scale factor. Use the attributes EdgeMap, OnePointMap, TwoPointMap to control the orientation of the source mesh on the destination.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"CopyDomain");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,maptype);
```

