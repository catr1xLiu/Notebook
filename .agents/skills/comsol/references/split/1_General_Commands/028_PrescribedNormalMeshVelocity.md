# *PrescribedNormalMeshVelocity*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedNormalMeshVelocity") or model.component(*<ctag>*).common()

.create(*<tag>*,"PrescribedNormalMeshVelocityDeformedGeometry") creates a prescribed normal mesh velocity feature acting on the spatial or material frame mesh, respectively. For a PrescribedNormalMeshVelocity definition, the following property is available.

TABLE 2-45: PROPERTY FOR PRESCRIBEDNORMALMESHVELOCITY.

| PROPERTY                 | VALUE  | DEFAULT | DESCRIPTION                          |
|--------------------------|--------|---------|--------------------------------------|
| prescribedNormalVelocity | String | 0       | The prescribed normal mesh velocity. |

## *RotatingBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"RotatingBoundary") or model.component(*<ctag>*).common().create(*<tag>*,"RotatingBoundaryDeformedGeometry") creates a rotating boundary feature acting on the spatial or material frame mesh, respectively. For a RotatingBoundary definition, the following properties are available.

TABLE 2-46: PROPERTY FOR ROTATINGBOUNDARY.

| PROPERTY                         | VALUE                                                                                                              | DEFAULT                                     | DESCRIPTION                                                                                        |
|----------------------------------|--------------------------------------------------------------------------------------------------------------------|---------------------------------------------|----------------------------------------------------------------------------------------------------|
| angularVelocity                  | String                                                                                                             | 0                                           | The angular velocity<br>when rotationType is<br>set to<br>rotationalVelocity.                      |
| appliedMoment                    | String                                                                                                             | 0                                           | The applied moment<br>when rotationType is<br>set to rigidBody.                                    |
| initialAngle                     | String                                                                                                             | 0                                           | The initial angle when<br>rotationType is set to<br>rotationalVelocity<br>or rigidBody.            |
| initialAngularVelocity           | String                                                                                                             | 0                                           | The initial angular<br>velocity when<br>rotationType is set to<br>rigidBody.                       |
| momentOfInertia                  | String                                                                                                             | 0                                           | The moment of inertia<br>when rotationType is<br>set to rigidBody.                                 |
| revolutionsPerTime               | String                                                                                                             | 0                                           | The revolutions per time<br>when rotationType is<br>set to<br>rotationalVelocity.                  |
| rotationAngle                    | String                                                                                                             | 0                                           | The rotational angle<br>when rotationType is<br>set to userDefined.                                |
| rotationAxis                     | String array                                                                                                       | {"0", "0", "0"}                             | The rotation axis (3D<br>only).                                                                    |
| rotationAxisBasePoint            | String array                                                                                                       | {"0", "0", "0"}<br>(3D); {"0", "0"}<br>(2D) | The rotation axis base<br>point.                                                                   |
| rotationType                     | userDefined  <br>rotationalVelocity  <br>rigidBody                                                                 |                                             |                                                                                                    |
| rotationalVelocity<br>Expression | generalAngularVelocity  <br>constantAngularVelocity  <br>constantRevolutionsPerTime<br>  generalRevolutionsPerTime | constantAngular<br>Velocity                 | The rotational velocity<br>expression to use when<br>rotationType is set to<br>rotationalVelocity. |

#### *Slip*

model.component(*<ctag>*).common().create(*<tag>*,"Slip") or

model.component(*<ctag>*).common().create(*<tag>*,"SlipDeformedGeometry") creates a mesh slip feature acting on the spatial or material frame mesh, respectively. This feature has a boundary selection only.

#### *Symmetry*

model.component(*<ctag>*).common().create(*<tag>*,"Symmetry") or

model.component(*<ctag>*).common().create(*<tag>*,"SymmetryDeformedGeometry") creates a symmetry feature acting on the spatial or material frame mesh, respectively. This feature has a boundary selection only.

> The ControlFunction, DensityTopology, FixedTopologyDomain, FixedTopologyBoundary, FreeShapeDomain, FreeShapeBoundary, FreeShapeShell, FreeShapeSymmetry, FixedShapeBoundary, FixedShapeEdge, FixedShapePoint,

![](_page_50_Picture_7.jpeg)

GlobalLeastSquaresObjective, LeastSquaresObjective, MaterialTopologyDomain, MaterialTopologyBoundary, PolynomialBoundary, PolynomialShell,

VoidTopologyDomain, and VoidTopologyBoundary features below require the Optimization Module.

