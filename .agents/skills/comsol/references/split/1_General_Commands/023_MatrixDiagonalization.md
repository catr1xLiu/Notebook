# *MatrixDiagonalization*

model.component(*<ctag>*).common().create(*<tag>*,"MatrixDiagonalization") creates a matrix diagonalization feature. For a MatrixDiagonalization definition, the following properties are available.

TABLE 2-20: PROPERTIES FOR MATRIXDIAGONALIZATION.

| PROPERTY                    | VALUE         | DEFAULT                                                   | DESCRIPTION                                                 |
|-----------------------------|---------------|-----------------------------------------------------------|-------------------------------------------------------------|
| computeExponential          | true   false  | false                                                     | Compute matrix exponential.                                 |
| ignoreJacobianContributions | true   false  | true                                                      | Ignore solution dependencies.                               |
| matrix                      | String matrix | {{"1", "0", "0"},<br>{"0", "1", "0"},<br>{"0", "0", "1"}} | The matrix elements of the<br>square matrix to diagonalize. |

## *MatrixDecomposition*

model.component(*<ctag>*).common().create(*<tag>*,"MatrixDecomposition") creates a matrix decomposition (SVD) feature. For a MatrixDecomposition definition, the following properties are available.

TABLE 2-21: PROPERTIES FOR MATRIXDECOMPOSITION.

| PROPERTY                    | VALUE                           | DEFAULT                                                   | DESCRIPTION                                                                   |
|-----------------------------|---------------------------------|-----------------------------------------------------------|-------------------------------------------------------------------------------|
| computeLeftSingularVectors  | true   false                    | true                                                      | Compute left singular<br>vectors.                                             |
| computeRightSingularVectors | true   false                    | true                                                      | Compute right singular<br>vectors.                                            |
| computeRotationMatrix       | true   false                    | true                                                      | Compute rotation matrix.                                                      |
| computeStretchMatrix        | true   false                    | true                                                      | Compute stretch matrix.                                                       |
| format                      | full   symmetric<br>  hermitian | full                                                      | Matrix format.                                                                |
| matrix                      | String matrix                   | {{"1", "0", "0"},<br>{"0", "1", "0"},<br>{"0", "0", "1"}} | The matrix elements of the<br>square matrix to decompose.                     |
| size                        | Integer                         | 3                                                         | Matrix size. Valid values: 1–9,<br>representing 1-by-1 to 9-by-9<br>matrices. |

## *VectorTransform*

model.component(*<ctag>*).common().create(*<tag>*,"VectorTransform"*, <component>*) creates a vector transformation feature that transforms vectors from one coordinate system to another. For a VectorTransform definition, the following properties are available.

TABLE 2-22: PROPERTIES FOR VECTORTRANSFORM.

| PROPERTY                        | VALUE                                                                  | DEFAULT        | DESCRIPTION                                                |
|---------------------------------|------------------------------------------------------------------------|----------------|------------------------------------------------------------|
| componentChange                 | none   raiseIndex  <br>lowerIndex                                      | none           | Raise or lower index of output<br>vector.                  |
| inputComponents                 | contravariant  <br>covariant                                           | contravariant  | Input component type.                                      |
| inputReferenceFrame             | mesh   geometry  <br>material   spatial                                | spatial        | Reference frame for relative input<br>coordinate system.   |
| inputSystem                     | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Coordinate system to which input<br>components refer.      |
| inputVolumeReference<br>System  | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Input volume reference for density<br>transforms.          |
| metric                          | material   spatial                                                     | spatial        | Metric for raising or lowering<br>indices.                 |
| outputReferenceFrame            | mesh   geometry  <br>material   spatial                                | spatial        | Reference frame for relative output<br>coordinate system.  |
| outputSystem                    | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Coordinate system to user for<br>output vector components. |
| outputVolumeReference<br>System | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Output volume reference for<br>density transforms.         |
| transform                       | vector  <br>vectorDensity  <br>scalarFlux  <br>directedAreaElement     | vector         | Transform rule to apply.                                   |
| vector                          | String array                                                           | {"0","0","0"}  | Input vector components.                                   |

## *MatrixTransform*

model.component(*<ctag>*).common().create(*<tag>*,"MatrixTransform"*, <component>*) creates a matrix transformation feature that transforms matrix indices from one coordinate system to another. For a MatrixTransform definition, the following properties are available.

TABLE 2-23: PROPERTIES FOR MATRIXTRANSFORM.

| PROPERTY                      | VALUE                                                                  | DEFAULT        | DESCRIPTION                                                  |
|-------------------------------|------------------------------------------------------------------------|----------------|--------------------------------------------------------------|
| componentChange               | none   raiseIndex  <br>lowerIndex                                      | none           | Raise or lower index of output<br>vector.                    |
| format                        | full   symmetric                                                       | full           | Form of input matrix.                                        |
| inputColumnComponents         | contravariant  <br>covariant                                           | contravariant  | Input column index component<br>type.                        |
| inputColumnReference<br>Frame | mesh   geometry  <br>material   spatial                                | spatial        | Reference frame for relative<br>column input system.         |
| inputColumnSystem             | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Coordinate system to which<br>input column components refer. |
| inputComponents               | contravariant  <br>covariant                                           | contravariant  | Input component type for<br>symmetric matrix.                |

TABLE 2-23: PROPERTIES FOR MATRIXTRANSFORM.

| PROPERTY                        | VALUE                                                                  | DEFAULT                                                   | DESCRIPTION                                                           |
|---------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------|-----------------------------------------------------------------------|
| inputReferenceFrame             | mesh   geometry  <br>material   spatial                                | spatial                                                   | Reference frame for relative<br>symmetric input coordinate<br>system. |
| inputRowComponents              | contravariant  <br>covariant                                           | contravariant                                             | Input row index component<br>type.                                    |
| inputRowReference<br>Frame      | mesh   geometry  <br>material   spatial                                | spatial                                                   | Reference frame for relative row<br>input coordinate system.          |
| inputRowSystem                  | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Coordinate system to which<br>input row components refer.             |
| inputSystem                     | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Coordinate system to which<br>symmetric input components<br>refer.    |
| inputVolumeReference<br>System  | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Input volume reference for<br>density transforms.                     |
| matrix                          | String matrix                                                          | {{"0", "0", "0"},<br>{"0", "0", "0"},<br>{"0", "0", "0"}} | Input matrix components.                                              |
| columnMetric                    | material   spatial                                                     | spatial                                                   | Metric for raising or lowering<br>column indices.                     |
| rowMetric                       | material   spatial                                                     | spatial                                                   | Metric for raising or lowering<br>row indices.                        |
| outputColumnReference<br>Frame  | mesh   geometry  <br>material   spatial                                | spatial                                                   | Reference frame for relative<br>output column coordinate<br>system.   |
| outputColumnSystem              | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Coordinate system to user for<br>output matrix column indices.        |
| outputRowReferenceFra<br>me     | mesh   geometry  <br>material   spatial                                | spatial                                                   | Reference frame for relative<br>output row coordinate system.         |
| outputRowSystem                 | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Coordinate system to user for<br>output matrix row indices.           |
| outputVolumeReference<br>System | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Output volume reference for<br>density transforms.                    |
| transform                       | vector  <br>tensorDensity  <br>vectorFlux                              | tensor                                                    | Transform rule to apply.                                              |

#### *StateVariables*

model.component(*<ctag>*).common().create(*<tag>*,"StateVariables") creates a state variable definition feature that declares state variables and specifies initialization and update expressions. For a State Variables definition, the following properties are available.

TABLE 2-24: PROPERTIES FOR STATEVARIABLES.

| PROPERTY     | VALUE                              | DEFAULT | DESCRIPTION                |
|--------------|------------------------------------|---------|----------------------------|
| description  | String array                       | {}      | State descriptions.        |
| initialValue | String array                       | {}      | Initial value expressions. |
| order        | 0 2 4 6 8 10 12 14 <br>userDefined | 4       | Integration point order.   |

TABLE 2-24: PROPERTIES FOR STATEVARIABLES.

| PROPERTY         | VALUE                                          | DEFAULT       | DESCRIPTION                                             |
|------------------|------------------------------------------------|---------------|---------------------------------------------------------|
| orderExpression  | String                                         | 4             | User-defined order                                      |
| quantity         | none   <quantity_id></quantity_id>             | dimensionless | State physical quantity                                 |
| state            | String array                                   | {}            | State names.                                            |
| unit             | <unit></unit>                                  | 1             | State unit                                              |
| update           | beforeStep   afterStep  <br>onlyInitialization | beforeStep    | When to apply the update<br>expressions.                |
| updateExpression | String array                                   | {}            | Update expressions.                                     |
| valueType        | real   complex                                 | complex       | Value type when using splitting of<br>complex variables |

## *Global Dependent Variables*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalDependentVariables") creates a global dependent variables definition feature that declares global degrees of freedom. For a Global Dependent Variables feature, the following properties are available.

TABLE 2-25: PROPERTIES FOR GLOBALDEPENDENTVARIABLES.

| PROPERTY              | VALUE                              | DEFAULT       | DESCRIPTION                                              |
|-----------------------|------------------------------------|---------------|----------------------------------------------------------|
| description           | String array                       | {}            | DOF descriptions.                                        |
| initialTimeDerivative | String array                       | {}            | Initial time derivative<br>expressions.                  |
| initialValue          | String array                       | {}            | Initial value expressions.                               |
| quantity              | none   <quantity_id></quantity_id> | dimensionless | State physical quantity.                                 |
| timeDerivatives       | off   solver   frequency           | solver        | Definition of time derivatives.                          |
| unit                  | <unit></unit>                      | 1             | State unit.                                              |
| valueType             | real   complex                     | complex       | Value type when using splitting of<br>complex variables. |

