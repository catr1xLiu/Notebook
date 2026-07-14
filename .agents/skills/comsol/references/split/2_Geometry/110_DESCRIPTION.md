# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MeshControlEdges") to define mesh control edges.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the edges to include. The default selection is empty.

The feature removes the selected edges that are isolated, that are adjacent to precisely two faces (in 3D), or that are between two domains (in 2D). The edges are kept for mesh control.

The following properties are available:

TABLE 3-110: VALID PROPERTIES.

| NAME       | VALUE     | DEFAULT | DESCRIPTION                     |
|------------|-----------|---------|---------------------------------|
| input      | Selection |         | Edges to ignore.                |
| includevtx | on   off  | on      | Include start and end vertices. |

Use includevtx to specify if the feature also removes the ignorable start and end vertices of the edge.

#### **SEE ALSO**

IgnoreEdges, MeshControlDomains, MeshControlFaces, MeshControlVertices

Define mesh control faces.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MeshControlFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MeshControlFaces") to define mesh control faces in 3D.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the faces to include. The default selection is empty.

The feature removes the selected faces that are isolated or that are between two domains. The faces are kept for mesh control.

The following properties are available:

TABLE 3-111: VALID PROPERTIES.

| NAME       | VALUE     | DEFAULT | DESCRIPTION                             |
|------------|-----------|---------|-----------------------------------------|
| input      | Selection |         | Faces to include.                       |
| includeadj | on   off  | on      | Include edges and vertices on boundary. |

Use includeadj to specify if the feature also includes the ignorable edges and vertices on the boundary of each resulting composite domain.

#### **SEE ALSO**

IgnoreFaces, MeshControlDomains, MeshControlEdges, MeshControlVertices

