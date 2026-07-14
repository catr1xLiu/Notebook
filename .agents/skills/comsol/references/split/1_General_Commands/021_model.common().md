# *model.common()*

The common list contains nodes that have different purposes depending on the node type. The type is assigned when the node is created. All other properties are set and accessed using generic set and get methods as described under set() and get\* and Selection Access Methods. The different types may or may not use a selection. The following node types are currently defined:

TABLE 2-15: COMMON FEATURE TYPES.

| TYPE                  | PURPOSE          | DESCRIPTION                                                                                              |
|-----------------------|------------------|----------------------------------------------------------------------------------------------------------|
| ExpressionOperator    | Variable utility | Define an operator evaluating different<br>parameterized expressions on different<br>geometric entities. |
| OperatorContribution  | Variable utility | Override the definition of an expression<br>operator.                                                    |
| Matrix                | Variable utility | Define a matrix of variables. Uses a selection.                                                          |
| MatrixInverse         | Variable utility | Compute the inverse of a matrix. Uses a<br>selection.                                                    |
| MatrixDiagonalization | Variable utility | Diagonalize a symmetric 3-by-3 matrix. Uses a<br>selection.                                              |
| MatrixDecomposition   | Variable utility | Use SVD to decompose a matrix. Uses a<br>selection.                                                      |
| VectorTransform       | Variable utility | Transform a vector from one coordinate<br>system to another.                                             |

TABLE 2-15: COMMON FEATURE TYPES.

| TYPE                        | PURPOSE               | DESCRIPTION                                                                                |
|-----------------------------|-----------------------|--------------------------------------------------------------------------------------------|
| MatrixTransform             | Variable utility      | Transform matrix indices between coordinate<br>systems.                                    |
| StateVariables              | Variable utility      | Define state variables and reinitialization rules.                                         |
| ControlVariableField        | Variable utility      | Define control variables on geometric entities.                                            |
| Global Dependent Variables  | Equation contribution | Declare global scalar degrees of freedom.                                                  |
| Global Weak Contribution    | Equation contribution | Add a global scalar weak contribution.                                                     |
| Global Constraint           | Equation contribution | Add a global scalar constraint.                                                            |
| Dependent Variable Field    | Equation contribution | Declare a dependent variable field on a<br>selection.                                      |
| Weak Contribution           | Equation contribution | Add a weak contribution on a selection.                                                    |
| Constraint                  | Equation contribution | Add a constraint on a selection.                                                           |
| ParticipationFactors        | Physics variables     | Set up participation factor evaluation.                                                    |
| ResponseSpectrum            | Physics variables     | Set up response spectrum evaluation.                                                       |
| AmbientProperties           | Physics variables     | Set up ambient thermal conditions using<br>meteorological data.                            |
| GlobalReducedModelInputs    | Control variables     | Define global control variables for use as inputs<br>to model reduction.                   |
| Control Function            | Optimization          | Define a control variable field and a filtered<br>density field for topology optimization. |
| FixedTopologyDomain         | Optimization          | Define a fixed topology domain for topology<br>optimization.                               |
| FixedTopologyBoundary       | Optimization          | Define a fixed topology boundary for topology<br>optimization.                             |
| FreeShapeDomain             | Optimization          | Define a free shape domain for shape<br>optimization.                                      |
| FreeShapeBoundary           | Optimization          | Define a free shape boundary for shape<br>optimization.                                    |
| FreeShapeShell              | Optimization          | Define a free shape shell for shape optimization.                                          |
| PolynomialShell             | Optimization          | Define a polynomial shell for shape<br>optimization.                                       |
| FreeShapeSymmetry           | Optimization          | Define a symmetry or roller condition for<br>shape optimization.                           |
| FixedShapePoint             | Optimization          | Define a fixed shape point in 2D for shape<br>optimization.                                |
| FixedShapeEdge              | Optimization          | Define a fixed shape edge in 3D for shape<br>optimization.                                 |
| FixedShapeBoundary          | Optimization          | Define a fixed shape boundary for shape<br>optimization.                                   |
| FixedShapeBoundary          | Optimization          | Define a mirror symmetry domain or boundary<br>for shape optimization.                     |
| FixedShapeBoundary          | Optimization          | Define a sector symmetry domain or boundary<br>for shape optimization.                     |
| GlobalLeastSquaresObjective | Optimization          | Define a global least-squares objective.                                                   |
| LeastSquaresObjective       | Optimization          | Define a least-squares objective.                                                          |
| MaterialTopologyDomain      | Optimization          | Define a material topology domain for topology<br>optimization.                            |

TABLE 2-15: COMMON FEATURE TYPES.

| TYPE                             | PURPOSE                              | DESCRIPTION                                                                          |
|----------------------------------|--------------------------------------|--------------------------------------------------------------------------------------|
| MaterialTopologyBoundary         | Optimization                         | Define a material topology boundary for<br>topology optimization.                    |
| PolynomialBoundary               | Optimization                         | Defined a polynomial boundary in 2D for shape<br>optimization,.                      |
| VoidTopologyDomain               | Optimization                         | Define a void topology domain for topology<br>optimization.                          |
| VoidTopologyBoundary             | Optimization                         | Define a void topology boundary for topology<br>optimization.                        |
| MirrorTopology                   | Optimization                         | Define a mirror symmetry domain or boundary<br>for topology optimization.            |
| SectorTopology                   | Optimization                         | Define a sector symmetry domain or boundary<br>for topology optimization.            |
| CommonInputDefault               | Default model inputs                 | Set default values of input quantities required<br>by materials.                     |
| CommonInputDef                   | Default model inputs                 | Override values of input quantities on selected<br>entities.                         |
| PrescribedDeformation            | Moving mesh and<br>deformed geometry | Prescribe a mesh deformation on domains.<br>Uses a selection.                        |
| PrescribedMeshVelocity           | Moving mesh and<br>deformed geometry | Prescribe a mesh velocity of a deforming<br>domain boundary. Uses a selection.       |
| RotatingDomain                   | Moving mesh and<br>deformed geometry | Prescribe rotation of a domain. Uses a<br>selection.                                 |
| DeformingDomain                  | Moving mesh and<br>deformed geometry | Specify free deformation of domains. Uses a<br>selection.                            |
| FixedBoundary                    | Moving mesh and<br>deformed geometry | Prescribe zero displacement of a deforming<br>domain boundary. Uses a selection.     |
| PrescribedMeshDisplacement       | Moving mesh and<br>deformed geometry | Prescribe displacement of a deforming domain<br>boundary. Uses a selection.          |
| PrescribedNormalMeshVelocity     | Moving mesh and<br>deformed geometry | Prescribe velocity of a deforming domain<br>boundary. Uses a selection.              |
| PrescribedNormalMeshDisplacement | Moving mesh and<br>deformed geometry | Prescribe a normal displacement of a deforming<br>domain boundary. Uses a selection. |
| RotatingBoundary                 | Moving mesh and<br>deformed geometry | Prescribe rotation of a boundary. Uses a<br>selection.                               |
| Slip                             | Moving mesh and<br>deformed geometry | Prescribe mesh slip behavior of a deforming<br>domain boundary. Uses a selection.    |
| Symmetry                         | Moving mesh and<br>deformed geometry | Prescribe symmetry on a deforming domain<br>boundary. Uses a selection.              |
| SurrogateModelGeometrySampling   | Surrogate modeling                   | Geometry sampling for surrogate modeling.                                            |

![](_page_36_Picture_2.jpeg)

All types with an optimization purpose require the Optimization Module.

![](_page_36_Picture_4.jpeg)

Moving mesh and deformed geometry features exist in two versions which differ in type ID and in which frame they control, but are otherwise identical. The deformed geometry version controlling the material frame uses a type ID with DeformedGeometry appended.

#### **SYNTAX**

```
model.component(<ctag>).common().create(<tag>,type);
model.component(<ctag>).common(<tag>).set(property, <value>);
model.component(<ctag>).common(<tag>).image()
```

#### **DESCRIPTION**

model.component(*<ctag>*).common().create(*<tag>*,*type*) creates a common feature node with the given tag and type.

model.component(*<ctag>*).common(*<tag>*).set(*property, <value>*) sets a named property in the common feature with tag *<tag>* in component *<ctag>*.

#### *ExpressionOperator*

model.component(*<ctag>*).common().create(*<tag>*,"ExpressionOperator") creates an expression operator feature. The following properties are available.

TABLE 2-16: PROPERTIES FOR EXPRESSIONOPERATOR.

| PROPERTY   | VALUE                        | DEFAULT                                       | DESCRIPTION                                                                            |
|------------|------------------------------|-----------------------------------------------|----------------------------------------------------------------------------------------|
| argument   | String array                 | {}                                            | List of argument formal variable names.                                                |
| dimensions | String array                 | {}                                            | List of unit expressions for each argument.                                            |
| expression | String                       | Empty                                         | An expression in terms of formal<br>arguments and other variables.                     |
| passbyval  | String array of on or<br>off | String array with all elements<br>set to off. | Pass the arguments by reference (when set<br>to "off") or by value (when set to "on"). |

#### *OperatorContribution*

model.component(*<ctag>*).common(*<exop>*).create(*<tag>*,"OperatorContribution") creates an Operator Contribution feature as a subfeature to the Expression Operator feature with tag *<exop>*. The following properties are available.

TABLE 2-17: PROPERTY FOR OPERATORCONTRIBUTION.

| PROPERTY   | VALUE  | DEFAULT | DESCRIPTION                                                        |
|------------|--------|---------|--------------------------------------------------------------------|
| expression | String | Empty   | An expression in terms of formal<br>arguments and other variables. |

