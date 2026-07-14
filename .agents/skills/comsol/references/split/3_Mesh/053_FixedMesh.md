# *FixedMesh*

Use FixedMesh to keep the mesh fixed on edges (3D) or boundaries (2D) while remeshing the faces (3D) or domains (2D).

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"FixedMesh");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection();
```

#### **DESCRIPTION**

Use model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"FixedMesh") to keep meshes on a selection of edges (3D) or boundaries (2D) fixed for the feature *<ftag1>* that can be any of the types RemeshFaces or RemeshDomains, respectively.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature(*<ftag1>*).selection() to specify the edge (3D) or boundary (2D) selection.

