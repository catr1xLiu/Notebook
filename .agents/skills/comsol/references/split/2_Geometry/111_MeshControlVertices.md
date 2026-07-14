# *MeshControlVertices*

Define mesh control vertices.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MeshControlVertices");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MeshControlVertices") to define mesh control vertices.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the vertices to include. The default selection is empty.

The feature removes the selected vertices that are isolated or that are adjacent to precisely two edges. The vertices are kept for mesh control.

The following properties are available:

TABLE 3-112: VALID PROPERTIES.

| NAME  | VALUE     | DEFAULT | DESCRIPTION          |
|-------|-----------|---------|----------------------|
| input | Selection |         | Vertices to include. |

#### **SEE ALSO**

IgnoreVertices, MeshControlFaces, MeshControlEdges

