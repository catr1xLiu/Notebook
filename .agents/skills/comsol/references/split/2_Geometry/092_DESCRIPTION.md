# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"IgnoreEdges") to ignore edges.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the edges to ignore. The default selection is empty.

The feature removes the selected edges that are isolated, that are adjacent to precisely two faces, or that are between two domains. If an edge is adjacent to two faces in 3D, the operations forms a composite face, if an edge is between two domains in 2D, the operation forms composite domain. The output object is a virtual geometry.

The following properties are available:

TABLE 3-91: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT | DESCRIPTION                  |
|-------------|-----------|---------|------------------------------|
| input       | Selection |         | Edges to ignore.             |
| ignorevtx   | on   off  | on      | Ignore vertices on boundary. |
| keepformesh | on   off  | off     | Keep edges for mesh control. |

Use ignorevtx to specify if the feature also removes the ignorable vertices on the boundary of each resulting composite face.

Use keepformesh to keep the ignored edges while meshing, to help you in constructing the mesh.

#### **EXAMPLE**

Create a sphere and ignore all edges and, implicitly, all vertices.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("sph1", "Sphere");
  g.create("ige1", "IgnoreEdges");
  g.feature("ige1").selection("input").set("fin(1)", 1,2,3,4,5,6,7,8,9,10,11,12);
  g.run("ige1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('sph1', 'Sphere');
  g.create('ige1', 'IgnoreEdges');
  g.feature('ige1').selection('input').set('fin(1)', 1:12);
  g.run('ige1');
```

## **SEE ALSO**

CompositeFaces, IgnoreFaces, IgnoreVertices, MeshControlEdges

