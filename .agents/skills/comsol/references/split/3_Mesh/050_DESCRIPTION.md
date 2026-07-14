# **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Edge") to create an edge mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the edge selection. If you do not specify a selection, the feature creates a mesh on the remaining entities in 1D. In 3D and 2D, the default selection is empty.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add Size or Distribution attribute features.

The following properties are available:

TABLE 4-47: AVAILABLE PROPERTIES FOR EDGE.

| PROPERTY       | VALUE    | DEFAULT | DESCRIPTION                                                                     |
|----------------|----------|---------|---------------------------------------------------------------------------------|
| smoothcontrol  | on   off | on      | Specifies if the operation smooths the mesh across removed<br>control entities. |
| smoothmaxiter  | integer  | 4       | Specifies the number of smoothing iterations.                                   |
| smoothmaxdepth | integer  | 4       | Specifies the maximum element smoothing depth.                                  |

## **SEE ALSO**

Distribution, Vertex, Size

Define edge groups for mapped meshes.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"EdgeGroup");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"EdgeGroup") to define edge groups for the Map feature *<ftag>*.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature(*<ftag1>*).selection() to specify the domain.

The following properties are available:

TABLE 4-48: AVAILABLE PROPERTIES.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION           |
|----------|-----------|---------|-----------------------|
| edge1    | Selection |         | First group of edges. |
| edge2    | Selection |         | Second group of edge. |
| edge3    | Selection |         | Third group of edge.  |
| edge4    | Selection |         | Fourth group of edge. |

The value of each property is an edge selection that combines edges to defines a logical side of the corresponding domain (in 2D) or boundary (in 3D). No specific ordering of the edges is required.

#### **SEE ALSO**

Distribution, Map, Size

