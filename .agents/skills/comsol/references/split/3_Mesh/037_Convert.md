# *Convert*

Convert a mesh to a simplex mesh.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Convert");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Convert") to convert nonsimplex elements in a 2D or 3D mesh to simplex elements, that is, triangles and tetrahedra. The convert feature is also available for imported meshing sequences.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the domain or face selection. If you do not specify the selection the feature converts all quadrilateral, pyramidal, prismatic, and hexahedral elements in the mesh.

The following properties are available:

TABLE 4-21: AVAILABLE PROPERTIES.

| PROPERTY    | VALUE             | DEFAULT  | DESCRIPTION                                             |
|-------------|-------------------|----------|---------------------------------------------------------|
| splitmethod | diagonal   center | diagonal | Split method for quadrilateral and hexahedral elements. |

Use the property splitmethod to specify how to split quadrilateral and hexahedral elements into triangular and tetrahedral elements, respectively. Use the diagonal option to split each quadrilateral element into two triangular elements and each hexahedral element into five tetrahedral element. Use the center option to split each quadrilateral element into four triangular elements and each hexahedral element into 28 tetrahedral elements. The conversion also affects quadrilateral elements on the boundaries of the specified domains in 3D, which are converted into two triangular elements (when the option diagonal is used) or four triangular elements (when the option center is used).

### **EXAMPLES**

Create a mapped quad mesh on a unit rectangle and convert each quadrilateral element into four triangular elements:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1", 2);
MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
```

```
g.create("r1", "Rectangle");
  g.run();
  m.create("map1", "Map");
  m.create("conv1", "Convert");
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('r1', 'Rectangle');
  g.run;
  m.create('map1', 'Map');
  m.create('conv1', 'Convert');
  m.run;
Create a prism mesh and then convert each prism into three tetrahedral elements:
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("blk1", "Block");
  g.run();
  m.create("ftri1", "FreeTri");
  m.feature("ftri1").selection().set(new int[]{1});
  m.create("swe1", "Sweep");
  m.create("conv1", "Convert");
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
  m.create('swe1', 'Sweep');
  m.create('conv1', 'Convert');
  m.run;
SEE ALSO
BndLayer, Map, Refine, Sweep
CopyEdge
```

Copy an edge mesh to copy meshes on edges.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"CopyEdge");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CopyEdge") to copy mesh between edges in a 2D or 3D geometry.

The following properties are available:

TABLE 4-22: AVAILABLE PROPERTIES FOR COPYEDGE.

| PROPERTY       | VALUE                         | DEFAULT | DESCRIPTION                                                                     |
|----------------|-------------------------------|---------|---------------------------------------------------------------------------------|
| copymethod     | auto   singlecopy   arraycopy | auto    | Type of copy operation.                                                         |
| direction      | auto   same   opposite        | auto    | Direction of the copied mesh.                                                   |
| source         | Selection                     | Empty   | Source edges.                                                                   |
| destination    | Selection                     | Empty   | Destination edges.                                                              |
| smoothcontrol  | on   off                      | on      | Specifies if the operation smooths the mesh<br>across removed control entities. |
| smoothmaxdepth | integer                       | 4       | Specifies the maximum element smoothing<br>depth.                               |
| smoothmaxiter  | integer                       | 4       | Specifies the number of smoothing iterations.                                   |

Use the properties source and destination to specify the source and destination edges. The copymethod property determines which type of copy is used: single copy (all-to-one), array copy (one-to-one), or automatic detection. The value auto lets the software choose between single copy (all-to-one), array copy (one-to-one), or a mixture of the two. The direction property controls the orientation of the copied mesh, and is relative the direction of the source edge with smallest number and the direction of the destination edge.

Copying a mesh is only possible if the destination edge is not adjacent to a meshed domain. The copy feature overwrites any existing mesh on the destination edge.

## **EXAMPLE**

Mesh Edge 1 and copy the mesh to Edges 2, 3, and 4.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("sq1", "Square");
  g.run();
  m.create("edg1", "Edge");
  m.feature("edg1").selection().set(new int[]{1});
  m.create("cpe1", "CopyEdge");
  m.feature("cpe1").selection("source").set(new int[]{1});
  m.feature("cpe1").selection("destination").set(new int[]{2, 3, 4});
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
```

```
g.create('sq1', 'Square');
g.run;
m.create('edg1', 'Edge');
m.feature('edg1').selection().set(1);
m.create('cpe1', 'CopyEdge');
m.feature('cpe1').selection('source').set(1);
m.feature('cpe1').selection('destination').set(2:4);
m.run;
```

IdenticalMesh, CopyFace, CopyDomain, Copy

