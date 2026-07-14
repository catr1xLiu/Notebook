# About Mesh Commands

Meshes can be either

- **•** conforming with a geometry, or
- **•** define their own geometric model.

The first category involves models that have a geometry sequence with either imported CAD or created in the software. One or several meshes are then generated based on this geometry. Meshes that define their own geometric model typically involve imported meshes or operations that edit a mesh. If such a mesh defines the component's geometric model, the physics can then be defined on the geometric entities of the mesh. For more information, see Geometric Model.

Table 4-1 is an overview of all available mesh operations. The two rightmost columns give information about if an operation is supported for meshes conforming with geometry and meshes defining their own geometric model.

TABLE 4-1: AVAILABLE MESH OPERATIONS.

| FEATURE TYPE     | DESCRIPTION                                                                                            | DEFAULT<br>TAG IN GUI | MESH<br>CONFORMING<br>WITH<br>GEOMETRY | MESH DEFINING<br>ITS OWN<br>GEOMETRIC<br>MODEL |
|------------------|--------------------------------------------------------------------------------------------------------|-----------------------|----------------------------------------|------------------------------------------------|
| Adapt            | Adaptive mesh modification                                                                             | ada                   | √                                      | √                                              |
| Ball             | Partition geometric entities of the mesh by an<br>element set defined by a ball                        | ball                  | √                                      | √                                              |
| BndLayer         | Generate boundary layer mesh                                                                           | bl                    | √                                      | √                                              |
| Box              | Partition geometric entities of the mesh by an<br>element set defined by a box                         | box                   |                                        | √                                              |
| CollapseEntities | Collapse geometric entities of the mesh                                                                | col                   |                                        | √                                              |
| Convert          | Convert nonsimplex elements in the mesh to<br>simplex elements                                         | conv                  | √                                      | √                                              |
| Copy             | Copy a mesh from a meshing sequence                                                                    | copy                  | √                                      |                                                |
| CopyEdge         | Copy mesh between edges                                                                                | cpe                   | √                                      |                                                |
| CopyFace         | Copy mesh between faces                                                                                | cpf                   | √                                      |                                                |
| CopyDomain       | Copy mesh between domains                                                                              | cpd                   | √                                      |                                                |
| CreateDomains    | Create one domain for each finite void region<br>defined by the mesh                                   | dom                   |                                        | √                                              |
| CreateEdges      | Create new edges in the mesh                                                                           | edg                   |                                        | √                                              |
| CreateFaces      | Create new faces in the mesh                                                                           | fac                   |                                        | √                                              |
| CreateVertices   | Create new geometric vertices in the mesh                                                              | vtx                   |                                        | √                                              |
| Cylinder         | Partition geometric entities of the mesh by an<br>element set defined by a cylinder                    | cyl                   |                                        | √                                              |
| DeleteEntities   | Delete geometric entities from the mesh                                                                | dele                  |                                        | √                                              |
| DetectFaces      | Partition faces of the mesh by searching for<br>shapes that are likely to constitute separate<br>faces | detf                  |                                        | √                                              |
| Edge             | Generate mesh for edges                                                                                | edg                   | √                                      |                                                |
| FillHoles        | Repair holes in faces of the mesh                                                                      | fill                  |                                        | √                                              |
| FreeTet          | Generate unstructured tetrahedral mesh                                                                 | ftet                  | √                                      | √                                              |
| FreeTri          | Generate unstructured triangular mesh                                                                  | ftri                  | √                                      | √                                              |

TABLE 4-1: AVAILABLE MESH OPERATIONS.

| FEATURE TYPE      | DESCRIPTION                                                                                   | DEFAULT<br>TAG IN GUI | MESH<br>CONFORMING<br>WITH<br>GEOMETRY | MESH DEFINING<br>ITS OWN<br>GEOMETRIC<br>MODEL |  |
|-------------------|-----------------------------------------------------------------------------------------------|-----------------------|----------------------------------------|------------------------------------------------|--|
| FreeQuad          | Generate unstructured quadrilateral mesh                                                      | fq                    | √                                      | √                                              |  |
| Import            | Import mesh from file or other source                                                         | imp                   |                                        | √                                              |  |
| IntersectLine     | Intersect the mesh with a line (2D)                                                           | lin                   |                                        | √                                              |  |
| IntersectPlane    | Intersect the mesh with a plane (3D)                                                          | pln                   |                                        | √                                              |  |
| JoinEntities      | Join adjacent geometric entities of the mesh                                                  | join                  |                                        | √                                              |  |
| LogicalExpression | Partition geometric entities of the mesh by an<br>element set defined by a logical expression | le                    |                                        | √                                              |  |
| Map               | Generate structured quadrilateral mesh                                                        | map                   | √                                      | √                                              |  |
| MergeEntities     | Merge geometric entities in the mesh                                                          | mrg                   |                                        | √                                              |  |
| Vertex            | Generate a point mesh                                                                         | vtx                   | √                                      |                                                |  |
| Reference         | Refer to another meshing sequence                                                             | rf                    | √                                      |                                                |  |
| Refine            | Refine the mesh                                                                               | ref                   | √                                      | √                                              |  |
| Sweep             | Generate swept mesh                                                                           | swe                   | √                                      | √                                              |  |
| Union             | Unite geometric entities by intersecting mesh<br>elements and merging overlapping elements    | uni                   |                                        | √                                              |  |

Table 4-2 contains an overview of mesh attributes to control the mesh element sizing, layer distributions, scaling, and position of an imported mesh. The two rightmost columns give information about if an attribute is supported for meshes conforming with geometry and meshes defining their own geometric model.

TABLE 4-2: AVAILABLE MESH ATTRIBUTES.

| FEATURE TYPE     | DESCRIPTION                        |     | MESH<br>CONFORMING<br>WITH<br>GEOMETRY | MESH DEFINING<br>ITS OWN<br>GEOMETRIC<br>MODEL |
|------------------|------------------------------------|-----|----------------------------------------|------------------------------------------------|
| BndLayerProp     | Boundary Layer Properties          | blp | √                                      | √                                              |
| CornerRefinement | Corner Refinement                  | cr  | √                                      |                                                |
| Distribution     | Distribution                       | dis | √                                      | √                                              |
| EdgeGroup        | Edge Groups                        | eg  | √                                      |                                                |
| EdgeMap          | Edge Map                           | em  | √                                      |                                                |
| OnePointMap      | One-Point Map                      | pm  | √                                      |                                                |
| Scale            | Scale                              |     | √                                      |                                                |
| Size             | Size                               |     | √                                      | √                                              |
| SizeExpression   | Size Expression                    |     | √                                      |                                                |
| TwoPointMap      | Two-Point Map                      | ppm | √                                      |                                                |
| Transform        | Position, rotate, or scale a mesh. | tr  |                                        | √                                              |

