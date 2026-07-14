# **SEE ALSO**

IdenticalMesh, CopyEdge, CopyFace, Copy, EdgeMap, OnePointMap, TwoPointMap

Copy a mesh between edges, boundaries, domains, or between different meshing sequences. In 2D and 3D, use the attributes EdgeMap, OnePointMap, TwoPointMap to control the orientation of the source mesh on the destination.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Copy");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,maptype);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Copy") to copy a mesh between meshing sequences. Any meshing sequence can be used as the source of the operation, whereas the destination sequence cannot contain an imported mesh. The dimension of the source sequence must be less than or equal to the dimension of the destination sequence.

The following properties are available (for 1D meshes, only the mesh property is available):

TABLE 4-25: AVAILABLE PROPERTIES FOR COPY.

| PROPERTY       | VALUE                         | DEFAULT                               | DESCRIPTION                                                                                    |
|----------------|-------------------------------|---------------------------------------|------------------------------------------------------------------------------------------------|
| mesh           | String   none                 | Native<br>sequence<br>(none in<br>1D) | Specifies the source mesh.                                                                     |
| copymethod     | auto   singlecopy   arraycopy | auto                                  | Type of copy operation.                                                                        |
| dimension      | all, 1, 2, or 3 (in 3D)       | 2 in 2D,<br>3 in 3D                   | Specifies the dimension for the operation. all<br>means that the entire mesh should be copied. |
| source         | Selection                     | Empty                                 | Specifies the selection of source entities.                                                    |
| buildsource    | on   off                      | off                                   | Build source mesh automatically.                                                               |
| destination    | Selection                     | Empty                                 | Specifies the selection of destination entities.                                               |
| smoothcontrol  | on   off                      | on                                    | Specifies if the operation smooths the mesh<br>across removed control entities.                |
| smoothmaxiter  | integer                       | 4                                     | Specifies the number of smoothing iterations.                                                  |
| smoothmaxdepth | integer                       | 4                                     | Specifies the maximum element smoothing<br>depth.                                              |

Use the properties source and destination to specify the geometric entities of the source and destination (except when the dimension is set to copy the entire geometry). The copymethod property determines which type of copy is used: single copy (all-to-one), array copy (one-to-one), or automatic detection. The value auto lets the software choose between single copy (all-to-one), array copy (one-to-one), or a mixture of the two.

## **EXAMPLE**

The following example shows how to use the Copy feature with a modified geometry from an imported mesh:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence geom1 = model.component("comp1").geom().create("geom1", 2);
  geom1.create("c1", "Circle");
  MeshSequence mesh1 = model.component("comp1").mesh().create("mesh1", "geom1");
  mesh1.run();
  model.component().create("comp2");
```

```
GeomSequence geom2 = model.component("comp2").geom().create("geom2", 2);
  GeomFeature imp1 = geom2.create("imp1", "Import");
  imp1.set("type", "mesh");
  imp1.set("mesh", "mesh1");
  GeomFeature r1 = geom2.create("r1", "Rectangle");
  r1.set("size", new String[]{"3", "3"});
  r1.set("base", "center");
  MeshSequence mesh2 = model.component("comp2").mesh().create("mesh2", "geom2");
  MeshFeature copy1 = mesh2.create("copy1", "Copy");
  copy1.set("mesh", "mesh1");
  copy1.set("dimension", 2);
  copy1.selection("source").set(1);
  copy1.selection("destination").set(2);
  mesh2.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  geom1 = model.component('comp1').geom.create('geom1', 2);
  geom1.create('c1', 'Circle');
  mesh1 = model.component('comp1').mesh.create('mesh1', 'geom1');
  mesh1.run;
  model.component.create('comp2');
  geom2 = model.component('comp2').geom.create('geom2', 2);
  imp1 = geom2.create('imp1', 'Import');
  imp1.set('type', 'mesh');
  imp1.set('mesh', 'mesh1');
  r1 = geom2.create('r1', 'Rectangle');
  r1.set('size', {'3', '3'});
  r1.set('base', 'center');
  mesh2 = model.component('comp2').mesh.create('mesh2', 'geom2');
  copy1 = mesh2.create('copy1', 'Copy');
  copy1.set('mesh', 'mesh1');
  copy1.set('dimension', 2);
  copy1.selection('source').set(1);
  copy1.selection('destination').set(2);
  mesh2.run;
```

IdenticalMesh, CopyEdge, CopyFace, CopyDomain, EdgeMap, OnePointMap, TwoPointMap

## *CornerProp*

To override the corner settings of BndLayer for a selection of corners.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"CornerProp");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).
  set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"CornerProp") to override the corner settings for the feature *<ftag>* that can be of the type BndLayer.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature(*<ftag1>*).selection() to specify the vertex selection in 2D and the vertex or edge selection in 3D. The selection is empty by default.

The following properties are available:

TABLE 4-26: VALID PROPERTIES.

| NAME              | VALUE                  | DEFAULT | DESCRIPTION                                                                                                                                                                             |
|-------------------|------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| cornerhandling    | trim   split  <br>none | trim    | Specify how to handle sharp corners for vertices in 2D<br>and edges in 3D.                                                                                                              |
| cornerhandlingvtx | trim   none            | trim    | Specify how to handle sharp corners for vertices in 3D.<br>Used if the parent BndLayer feature has a domain<br>selection.                                                               |
| splitcondition    | on   off               | off     | Specify if to use an angle condition for the split. Used if<br>cornerhandling is split. Not supported for vertices<br>in 3D when the parent BndLayer feature has a domain<br>selection. |
| splitdivangle     | double                 | 100     | Maximum angle for split. Used if cornerhandling is<br>split.                                                                                                                            |
| splitminangle     | double                 | 240     | Split for angles greater than specified value. Used if<br>splitcondition is on.                                                                                                         |
| trimcondition     | on   off               | off     | Specify if to use angle conditions for the trimming. Used if<br>cornerhandling is trim. Not supported for vertices in<br>3D when the parent BndLayer feature has a domain<br>selection. |
| trimmaxangle      | double                 | 50      | Trim for angles less than specified value. Used if<br>trimcondition is on.                                                                                                              |
| trimminangle      | double                 | 240     | Trim for angles greater than specified value. Used if<br>trimcondition is on.                                                                                                           |

It can be useful to filter out the corners of CornerProp in a CornerRefinement feature to either include them in the refinement if trim is used, or to exclude them if split or none is used.

