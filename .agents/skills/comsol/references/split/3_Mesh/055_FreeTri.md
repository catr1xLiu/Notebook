# *FreeTri*

Create an unstructured triangular mesh in domains in 2D and on faces in 3D. Can also be used to remesh faces in a 3D surface mesh.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"FreeTri");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,ftype);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"FreeTri") to create an unstructured triangular mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the domain (boundary in 3D) selection. If you do not specify any selection the feature creates a mesh on the remaining geometric entities in 2D. In 3D, the default selection is empty.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add attribute features.

The following properties are available:

TABLE 4-56: AVAILABLE PROPERTIES FOR FREETRI.

| PROPERTY       | VALUE           | DEFAULT | DESCRIPTION                                                                                                                            |
|----------------|-----------------|---------|----------------------------------------------------------------------------------------------------------------------------------------|
| defectremoval  | double          | 1.0     | Relative size factor for identification local defects.<br>Only available 3D meshes that define their own<br>geometric model.           |
| method         | auto   af   del | auto    | Triangulation method to use.                                                                                                           |
| narrowreg      | on   off        | off     | Specifies if to resolve the mesh with respect to<br>adjacent narrow domain regions.                                                    |
| simplifymesh   | on   off        | on      | Boolean specifying if the original mesh should be<br>simplified. Only available 3D meshes that define their<br>own geometric model.    |
| simplifytol    | double          | 0.01    | Relative simplification tolerance. Only available 3D<br>meshes that define their own geometric model.                                  |
| smoothcontrol  | on   off        | on      | Specifies if the operation smooths the mesh across<br>removed control entities. Only available for meshes<br>conforming with geometry. |
| smoothmaxiter  | integer         | 4       | Specifies the number of smoothing iterations. Only<br>available for meshes conforming with geometry.                                   |
| smoothmaxdepth | integer         | 4       | Specifies the maximum element smoothing depth.<br>Only available for meshes conforming with geometry.                                  |
| xscale         | double          | 1       | Scale geometry in x direction before meshing.                                                                                          |
| yscale         | double          | 1       | Scale geometry in y direction before meshing.                                                                                          |
| zscale         | double          | 1       | Scale geometry in z direction before meshing.                                                                                          |

Use the property method to specify the method used to triangulate domains in 2D and faces in 3D. A Delaunay based method is used if the property is set to del and an advancing front method is used if the property is set to af. If method is set to auto, the program tries to choose the best method for each geometric entity.

The following attribute features are used:

TABLE 4-57: ATTRIBUTE FEATURES FOR FREETRI.

| FEATURE          | REMARKS                                                                                    |
|------------------|--------------------------------------------------------------------------------------------|
| CornerRefinement | Used when generating mesh on faces. Only available when generating mesh for a<br>geometry, |
| Distribution     | Used when defined on edges.                                                                |
| Size             | All properties are used.                                                                   |
| SizeExpression   | All properties are used. Only available when generating mesh for a geometry.               |

For imported meshes, there is a default size attribute under the FreeTri feature with the tag size. You can access it using model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature("size").

## **COMPATIBILITY**

See FreeTet.

Size, SizeExpression, CornerRefinement, Distribution, IdenticalMesh, FreeTet, FreeQuad, RemeshFaces

