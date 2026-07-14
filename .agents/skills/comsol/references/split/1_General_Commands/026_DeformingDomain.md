# *DeformingDomain*

model.component(*<ctag>*).common().create(*<tag>*,"DeformingDomain") or

model.component(*<ctag>*).common().create(*<tag>*,"DeformingDomainDeformedGeometry") creates a deforming domain feature acting on the spatial or material frame mesh, respectively. For a DeformingDomain definition, the following properties are available.

TABLE 2-42: PROPERTY FOR DEFORMINGDOMAIN.

| PROPERTY           | VALUE                                      | DEFAULT         | DESCRIPTION                                                          |
|--------------------|--------------------------------------------|-----------------|----------------------------------------------------------------------|
| initialDeformation | String array                               | {"0", "0", "0"} | The initial deformation of the<br>domain.                            |
| smoothingType      | laplace   winslow  <br>hyperelastic   yeoh | laplace         | The mesh smoothing type: Laplace,<br>Winslow, hyperelastic, or Yeoh. |

## *FixedBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"FixedBoundary") or

model.component(*<ctag>*).common().create(*<tag>*,"FixedBoundaryDeformedGeometry") creates a fixed boundary feature acting on the spatial or material frame mesh, respectively. This feature has a boundary selection only.

#### *PrescribedMeshDisplacement*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedMeshDisplacement") or model.component(*<ctag>*).common()

.create(*<tag>*,"PrescribedMeshDisplacementDeformedGeometry") creates a prescribed mesh displacement feature acting on the spatial or material frame mesh, respectively. For a PrescribedMeshDisplacement definition, the following property is available.

TABLE 2-43: PROPERTY FOR PRESCRIBEDMESHDISPLACEMENT.

| PROPERTY                   | VALUE        | DEFAULT         | DESCRIPTION                       |
|----------------------------|--------------|-----------------|-----------------------------------|
| prescribedMeshDisplacement | String array | {"0", "0", "0"} | The prescribed mesh displacement. |

