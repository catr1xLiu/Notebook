# *IgnoreVertices*

Ignore vertices by removing the selected vertices that are isolated or that are adjacent to precisely two edges.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"IgnoreVertices");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"IgnoreVertices") to ignore vertices.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the vertices to ignore. The default selection is empty.

The feature removes the selected vertices that are isolated or that are adjacent to precisely two edges. If a vertex is adjacent to two edges, the operation forms a composite edge. The output object is a virtual geometry.

The following properties are available:

TABLE 3-93: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT | DESCRIPTION                     |
|-------------|-----------|---------|---------------------------------|
| input       | Selection |         | Vertices to ignore.             |
| keepformesh | on   off  | off     | Keep vertices for mesh control. |

Use keepformesh to keep the ignored vertices while meshing, to help you in constructing the mesh.

#### **EXAMPLE**

Create an ellipse and ignore vertices 1 and 3, which gives you two remaining edges in the final geometry.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
```

```
GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  model.mesh().create("mesh1", "geom1");
  g.create("e1", "Ellipse");
  g.run("fin");
  g.create("igv1", "IgnoreVertices");
  g.feature("igv1").selection("input").set("fin", 1, 3);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  model.mesh.create('mesh1', 'geom1');
  g.create('e1', 'Ellipse');
  g.run('fin');
  g.create('igv1', 'IgnoreVertices');
  g.feature('igv1').selection('input').set('fin', 1, 3);
  g.run;
```

## **SEE ALSO**

CompositeEdges, IgnoreEdges, IgnoreFaces, MeshControlVertices

