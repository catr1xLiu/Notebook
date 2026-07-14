# **EXAMPLES OF SETTING OR MODIFYING MESH DATA**

The following examples create a triangular mesh on a square, extracts the vertices and the triangles. Then the vertices are transformed and inserted into a new meshing sequence.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1", 2);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  // Create a rectangle and a mesh
  model.component("comp1").geom("geom1").create("r1", "Rectangle");
  m.create("ftri1", "FreeTri");
  m.run();
  double[][] vtx = m.getVertex();
  int[][] tri = m.getElem("tri");
  // Transform x-coordinates
```

```
for (int k=0; k<vtx[0].length; k++)
    vtx[0][k] *= 0.5;
  // Create a new geometry and mesh
  model.component("comp1").geom().create("geom2", 2);
  MeshSequence m2 = model.component("comp1").mesh().create("mesh2", "geom2");
  // Insert vertices and triangles and create mesh
  m2.data().setElem("tri", tri);
  m2.data().setVertex(vtx);
  m2.data().createMesh();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 2);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  % Create a rectangle and a mesh
  model.component('comp1').geom('geom1').create('r1', 'Rectangle');
  m.create('ftri1', 'FreeTri');
  m.run;
  vtx = m.getVertex;
  tri = m.getElem('tri');
  % Transform x-coordinates
  vtx(1,:) = vtx(1,:)*0.5;
  % Create a new geometry and mesh
  model.component('comp1').geom.create('geom2', 2);
  m2 = model.component('comp1').mesh.create('mesh2', 'geom2');
  % Insert vertices and triangles and create mesh
  m2.data.setElem('tri', tri);
  m2.data.setVertex(vtx);
  m2.data.createMesh;
```

