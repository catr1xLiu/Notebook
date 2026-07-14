# *CommonInputDefault*

The Common Model Inputs feature is a default singleton feature (with tag cminpt) that cannot be removed. It controls the default values of model input quantities required as input values to materials and physics features. For the Common Model Inputs definition, the following properties are available.

TABLE 2-37: PROPERTIES FOR COMMONINPUTDEFAULT.

| PROPERTY | VALUE         | DEFAULT | DESCRIPTION                                       |
|----------|---------------|---------|---------------------------------------------------|
| modified | String matrix | {{}}    | Pairs of quantity name and defining<br>expression |

## *CommonInputDef*

model.component(*<ctag>*).common().create(*<tag>*,"CommonInputDef") creates a common model input definition feature overriding the value of a model input quantity on a selection. For a Model Input definition, the following properties are available.

TABLE 2-38: PROPERTIES FOR COMMONINPUTDEF.

| PROPERTY    | VALUE        | DEFAULT       | DESCRIPTION                            |
|-------------|--------------|---------------|----------------------------------------|
| minpDefName | String       | dimensionless | Name of quantity to be defined.        |
| minpScalar  | String       | Empty         | Scalar definition of current quantity. |
| minpVector  | String array | {"1","2","3"} | Vector definition of current quantity. |

Note that changing the minpDefName property resets the corresponding value property to a default value specific to the particular quantity.

#### *PrescribedDeformation*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedDeformation") or model.component(*<ctag>*).common().create(*<tag>*,"PrescribedDeformationDeformedGeometry") creates a prescribed deformation feature acting on the spatial or material frame mesh, respectively. For a PrescribedDeformation definition, the following property is available.

TABLE 2-39: PROPERTY FOR PRESCRIBEDDEFORMATION.

| PROPERTY              | VALUE        | DEFAULT         | DESCRIPTION                        |
|-----------------------|--------------|-----------------|------------------------------------|
| prescribedDeformation | String array | {"0", "0", "0"} | The prescribed deformation vector. |

## *PrescribedMeshVelocity*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedMeshVelocity") or model.component(*<ctag>*).common().create(*<tag>*,"PrescribedMeshVelocityDeformedGeometry") creates a prescribed mesh velocity feature acting on the spatial or material frame mesh, respectively. For a PrescribedMeshVelocity definition, the following property is available.

TABLE 2-40: PROPERTY FOR PRESCRIBEDDEFORMATION.

| PROPERTY               | VALUE        | DEFAULT         | DESCRIPTION                          |
|------------------------|--------------|-----------------|--------------------------------------|
| prescribedMeshVelocity | String array | {"0", "0", "0"} | The prescribed mesh velocity vector. |

#### *RotatingDomain*

model.component(*<ctag>*).common().create(*<tag>*,"RotatingDomain") or model.component(*<ctag>*).common().create(*<tag>*,"RotatingDomainDeformedGeometry") creates a rotating domain feature acting on the spatial or material frame mesh, respectively. For a RotatingDomain definition, the following properties are available.

TABLE 2-41: PROPERTY FOR ROTATINGDOMAIN.

| PROPERTY               | VALUE        | DEFAULT                                     | DESCRIPTION                                                                             |
|------------------------|--------------|---------------------------------------------|-----------------------------------------------------------------------------------------|
| angularVelocity        | String       | 0                                           | The angular velocity<br>when rotationType is<br>set to<br>rotationalVelocity.           |
| appliedMoment          | String       | 0                                           | The applied moment<br>when rotationType is<br>set to rigidBody.                         |
| initialAngle           | String       | 0                                           | The initial angle when<br>rotationType is set to<br>rotationalVelocity<br>or rigidBody. |
| initialAngularVelocity | String       | 0                                           | The initial angular<br>velocity when<br>rotationType is set to<br>rigidBody.            |
| momentOfInertia        | String       | 0                                           | The moment of inertia<br>when rotationType is<br>set to rigidBody.                      |
| revolutionsPerTime     | String       | 0                                           | The revolutions per time<br>when rotationType is<br>set to<br>rotationalVelocity.       |
| rotationAngle          | String       | 0                                           | The rotational angle<br>when rotationType is<br>set to userDefined.                     |
| rotationAxis           | String array | {"0", "0", "0"}                             | The rotation axis (3D<br>only).                                                         |
| rotationAxisBasePoint  | String array | {"0", "0", "0"}<br>(3D); {"0", "0"}<br>(2D) | The rotation axis base<br>point.                                                        |

TABLE 2-41: PROPERTY FOR ROTATINGDOMAIN.

| PROPERTY                         | VALUE                                                                                                              | DEFAULT                     | DESCRIPTION                                                                                        |
|----------------------------------|--------------------------------------------------------------------------------------------------------------------|-----------------------------|----------------------------------------------------------------------------------------------------|
| rotationType                     | userDefined  <br>rotationalVelocity  <br>rigidBody                                                                 |                             |                                                                                                    |
| rotationalVelocity<br>Expression | generalAngularVelocity  <br>constantAngularVelocity  <br>constantRevolutionsPerTime<br>  generalRevolutionsPerTime | constantAngular<br>Velocity | The rotational velocity<br>expression to use when<br>rotationType is set to<br>rotationalVelocity. |

