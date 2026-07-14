# **SEE ALSO**

RemeshDomains, RemeshFaces

Create an unstructured quadrilateral mesh.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"FreeQuad");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,ftype);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>***).**create(*<ftag>*,"FreeQuad") to create an unstructured quadrilateral mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the domain (boundary in 3D) selection. If you do not specify any selection the feature creates a mesh on the remaining geometric entities in 2D. In 3D, the default selection is empty.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add attribute features.

The following properties are available:

TABLE 4-52: AVAILABLE PROPERTIES FOR FREEQUAD.

| PROPERTY       | VALUE                                           | DEFAULT                                                                  | DESCRIPTION                                                                                                                            |
|----------------|-------------------------------------------------|--------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------|
| defectremoval  | double                                          | 1.0                                                                      | Relative size factor for identification local defects. Only<br>available for imported meshes in 3D.                                    |
| method         | auto  <br>legacy52  <br>legacy52a  <br>legacy54 | auto in new<br>models;<br>legacy52a or<br>legacy54 in<br>migrated models | The quad meshing algorithm to use.                                                                                                     |
| simplifymesh   | on   off                                        | on                                                                       | Boolean specifying if the original mesh should be<br>simplified. Only available for imported meshes in 3D.                             |
| simplifytol    | double                                          | 0.01                                                                     | Relative simplification tolerance. Only available for<br>imported meshes in 3D.                                                        |
| smoothcontrol  | on   off                                        | on                                                                       | Specifies if the operation smooths the mesh across<br>removed control entities. Only available when generating<br>mesh for a geometry. |
| smoothmaxdepth | integer                                         | 4                                                                        | Specifies the maximum element smoothing depth. Only<br>available when generating mesh for a geometry.                                  |
| smoothmaxiter  | integer                                         | 4                                                                        | Specifies the number of smoothing iterations. Only<br>available when generating mesh for a geometry.                                   |
| xscale         | double                                          | 1                                                                        | Scale geometry in x direction before meshing.                                                                                          |
| yscale         | double                                          | 1                                                                        | Scale geometry in y direction before meshing.                                                                                          |
| zscale         | double                                          | 1                                                                        | Scale geometry in z direction before meshing.                                                                                          |

See the FreeTet feature for more information on the properties.

The following attribute features are used:

TABLE 4-53: ATTRIBUTE FEATURES FOR FREEQUAD.

| FEATURE          | REMARKS                                                                                    |  |
|------------------|--------------------------------------------------------------------------------------------|--|
| CornerRefinement | Used when generating mesh on faces. Only available when generating mesh for a<br>geometry, |  |
| Distribution     | Used when defined on edges.                                                                |  |
| Size             | All properties are used.                                                                   |  |
| SizeExpression   | All properties are used. Only available when generating mesh for a geometry.               |  |

For imported meshes, there is a default size attribute under the FreeQuad feature with the tag size. You can access it using model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature("size").

#### **COMPATIBILITY**

See FreeTet.

#### **SEE ALSO**

Size, SizeExpression, CornerRefinement, Distribution, IdenticalMesh, FreeTri, RemeshFaces

## *FreeTet*

Create an unstructured tetrahedral mesh.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"FreeTet");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,ftype);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"FreeTet") to create an unstructured tetrahedral mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the domain selection. If you do not specify any selection the feature creates a mesh on the remaining geometric entities.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add attribute features.

The following properties are available:

TABLE 4-54: AVAILABLE PROPERTIES FOR FREETET.

| PROPERTY      | VALUE                       | DEFAULT | DESCRIPTION                                                                                                                            |
|---------------|-----------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------|
| method        | auto   del  <br>dellegacy52 | auto    | Delaunay meshing algorithm to use.                                                                                                     |
| optlevel      | basic   medium  <br>high    | basic   | Optimization level for the mesh element quality.                                                                                       |
| optcurved     | on   off                    | on      | Avoid inverted curved mesh elements.                                                                                                   |
| optlarge      | on   off                    | off     | Avoid mesh elements that are too large.                                                                                                |
| optsmall      | on   off                    | off     | Avoid mesh elements that are too small.                                                                                                |
| smoothcontrol | on   off                    | on      | Specifies if the operation smooths the mesh across<br>removed control entities. Only available when<br>generating mesh for a geometry. |

TABLE 4-54: AVAILABLE PROPERTIES FOR FREETET.

| PROPERTY       | VALUE   | DEFAULT | DESCRIPTION                                                                                           |
|----------------|---------|---------|-------------------------------------------------------------------------------------------------------|
| smoothmaxiter  | integer | 4       | Specifies the number of smoothing iterations. Only<br>available when generating mesh for a geometry.  |
| smoothmaxdepth | integer | 4       | Specifies the maximum element smoothing depth.<br>Only available when generating mesh for a geometry. |
| xscale         | double  | 1       | Scale geometry in x direction before meshing.                                                         |
| yscale         | double  | 1       | Scale geometry in y direction before meshing.                                                         |
| zscale         | double  | 1       | Scale geometry in z direction before meshing.                                                         |

The mesher does not stop if it encounters an error. Instead, it continues to mesh remaining entities. Before finishing, all errors are collected and reported as feature problems. You can use the output to visually examine the partial mesh; this can help you understand what the problems are and how they can be fixed.

The method property determines the Delaunay tessellation algorithm to use. The default is auto, which makes the FreeTet mesh generator determine the best algorithm for each domain. The del1 Delaunay algorithm is the Delaunay algorithm used in earlier COMSOL versions. The del2 Delaunay algorithm is an alternative version of the algorithm, which under some conditions can modify the boundary mesh to simplify the meshing.

The properties xscale, yscale, and zscale specify scalar factors in each axis direction that the geometry is scaled by before meshing. The resulting mesh is then scaled back to fit the original geometry. The values of other properties correspond to the scaled geometry. By default, no scaling is done.

The following attribute features are used:

TABLE 4-55: ATTRIBUTE FEATURES FOR FREETET.

| FEATURE          | REMARKS                                                                                    |
|------------------|--------------------------------------------------------------------------------------------|
| CornerRefinement | Used when generating mesh on faces. Only available when generating mesh for a<br>geometry, |
| Distribution     | Used when defined on edges. Only available when generating mesh for a geometry.            |
| Size             | All properties are used.                                                                   |
| SizeExpression   | All properties are used. Only available when generating mesh for a geometry.               |

For imported meshes, there is a default size attribute under the FreeTet feature with the tag size. You can access it using model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature("size").

#### **SEE ALSO**

Size, SizeExpression, CornerRefinement, Distribution, IdenticalMesh, FreeTri

