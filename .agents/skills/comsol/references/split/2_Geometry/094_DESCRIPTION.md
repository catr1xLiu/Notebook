# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"IgnoreFaces") to ignore faces in 3D.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the faces to ignore. The default selection is empty.

The feature removes the selected faces that are isolated or that are between two domains. In the latter case, the operation forms a composite domain. The output object is a virtual geometry.

The following properties are available:

TABLE 3-92: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT | DESCRIPTION                            |
|-------------|-----------|---------|----------------------------------------|
| input       | Selection |         | Faces to ignore.                       |
| ignoreadj   | on   off  | on      | Ignore edges and vertices on boundary. |
| keepformesh | on   off  | off     | Keep faces for mesh control.           |

Use ignoreadj to specify if the feature also removes the ignorable edges and vertices on the boundary of each resulting composite domain.

Use keepformesh to keep the ignored faces while meshing, to help you in constructing the mesh.

## **EXAMPLE**

Ignore faces to form one composite domain. The operation also creates composite faces and composite edges.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.create("cyl1", "Cylinder");
  g.run("fin");
  g.create("igf1", "IgnoreFaces");
  g.feature("igf1").selection("input").set("fin", 6, 7, 10);
  g.run("igf1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component().create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.create('cyl1', 'Cylinder');
  g.run('fin');
  g.create('igf1', 'IgnoreFaces');
  g.feature('igf1').selection('input').set('fin', [6, 7, 10]);
  g.run('igf1');
```

#### **SEE ALSO**

CompositeDomains, IgnoreEdges, IgnoreVertices, MeshControlFaces

