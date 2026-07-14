# *Global Weak Contribution*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalWeakContribution") creates a global weak contribution feature that adds one or more global scalar weak expression to the overall system of equations. For a Global Weak Contribution feature, the following properties are available.

TABLE 2-26: PROPERTIES FOR GLOBALWEAKCONTRIBUTION.

| PROPERTY       | VALUE        | DEFAULT | DESCRIPTION       |
|----------------|--------------|---------|-------------------|
| weakExpression | String array | {}      | Weak expressions. |

## *Global Constraint*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalConstraint") creates a global constraint feature that adds a single scalar constraint to the overall system of equations. For a Global Constraint feature, the following properties are available.

TABLE 2-27: PROPERTIES FOR GLOBALCONSTRAINT.

| PROPERTY        | VALUE                   | DEFAULT   | DESCRIPTION                     |
|-----------------|-------------------------|-----------|---------------------------------|
| constraint      | String                  | 0         | Constraint expression.          |
| constraintForce | String                  | 0         | Constraint force expression.    |
| reactionTerms   | symmetric   userDefined | symmetric | Application of reaction forces. |

#### *Dependent Variable Field*

model.component(*<ctag>*).common().create(*<tag>*,"DependentVariableField") creates a dependent variable field definition feature that declares a scalar or vector field on a selection. For a Dependent Variable field definition, the following properties are available.

TABLE 2-28: PROPERTIES FOR DEPENDENTVARIABLEFIELD.

| PROPERTY                    | VALUE                                                                           | DEFAULT                                                                     | DESCRIPTION                                                                 |
|-----------------------------|---------------------------------------------------------------------------------|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| boundaryFlux                | on   off                                                                        | on                                                                          | Define accurate boundary<br>flux variables for<br>postprocessing.           |
| boundaryFluxSmoothing       | on   off                                                                        | on                                                                          | Smooth boundary flux<br>variables.                                          |
| componentFrame              | mesh   geometry  <br>material   spatial  <br>allCovariant  <br>allContravariant | spatial                                                                     | Frame of vector variable<br>components.                                     |
| components                  | String array                                                                    | { <field><x>,<br/><field<y>,<br/><field<z>}</field<z></field<y></x></field> | Component names when<br>declared on a single frame.                         |
| condition                   | String                                                                          | 0                                                                           | Boolean condition true in<br>elements where shape<br>functions are defined. |
| conditionActive             | on   off                                                                        | off                                                                         | Use element set condition.                                                  |
| derivativeFrame             | all   mesh   geometry  <br>material   spatial                                   | all                                                                         | Frames where gradient<br>component variables will be<br>defined.            |
| fieldType                   | scalar   inPlaneVector  <br>outOfPlaneVector  <br>threeComponentVector          | scalar                                                                      | Number of field<br>components and<br>interpretation.                        |
| initialTimeDerivative       | String                                                                          | 0                                                                           | Initial time derivative of<br>scalar field.                                 |
| initialValue                | String                                                                          | 0                                                                           | Initial value of scalar field.                                              |
| initialVector               | String array                                                                    | {0,0,0}                                                                     | Initial value of vector field.                                              |
| initialVectorTimeDerivative | String array                                                                    | {0,0,0}                                                                     | Initial value of vector field.                                              |
| interiorFluxEstimate        | String array                                                                    | {0,0,0}                                                                     | Domain expression<br>estimating the flux in the<br>domain.                  |
| elementOrder                | 0 1 2 3 4 5 6 7 <br>userDefined                                                 | 2                                                                           | Element order. Available<br>values depend on the shape<br>function type.    |
| elementOrderExpression      | String                                                                          | 2                                                                           | User-defined element<br>order                                               |
| quantity                    | none   <quantity_id></quantity_id>                                              | dimensionless                                                               | State physical quantity                                                     |
| referenceFrame              | mesh   geometry  <br>material   spatial                                         | spatial                                                                     | Frame in which the<br>interiorFluxEstimate<br>components are entered.       |
| shapeFunctionType           | <shape_function_id></shape_function_id>                                         | shlag                                                                       | Shape function type ID.                                                     |
| slits                       | Selection                                                                       | empty                                                                       | Selection where a<br>discontinuity is introduced.                           |
| timeDerivatives             | off   solver   frequency                                                        | solver                                                                      | Definition of time<br>derivatives.                                          |

TABLE 2-28: PROPERTIES FOR DEPENDENTVARIABLEFIELD.

| PROPERTY  | VALUE          | DEFAULT | DESCRIPTION                                                |
|-----------|----------------|---------|------------------------------------------------------------|
| unit      | <unit></unit>  | 1       | State unit                                                 |
| valueType | real   complex | complex | Value type when using<br>splitting of complex<br>variables |

## *Weak Contribution*

model.component(*<ctag>*).common().create(*<tag>*,"WeakContribution") creates a weak contribution feature that adds a weak expression on a selection to the overall system of equations. For a Weak Contribution feature, the following properties are available.

TABLE 2-29: PROPERTIES FOR WEAKCONTRIBUTION.

| PROPERTY                   | VALUE                                   | DEFAULT | DESCRIPTION                                     |
|----------------------------|-----------------------------------------|---------|-------------------------------------------------|
| weakExpression             | String                                  | 0       | Weak expression                                 |
| integrationOrder           | 0 2 4 6 8 <br>userDefined               | 4       | Integration order.                              |
| integrationOrderExpression | String                                  | 4       | User-defined integration order.                 |
| quadratureFrame            | mesh   geometry  <br>material   spatial | spatial | Frame in which the integration is<br>performed. |

#### *Constraint*

model.component(*<ctag>*).common().create(*<tag>*,"Constraint") creates a constraint feature that adds a scalar or vector constraint on a selection. The constraint can be added to the overall system of equations as a pointwise constraint, a weak constraint, or be enforced by a penalty term. For a Constraint feature, the following properties are available.

TABLE 2-30: PROPERTIES FOR CONSTRAINT.

| PROPERTY                   | VALUE                              | DEFAULT   | DESCRIPTION                                                                |
|----------------------------|------------------------------------|-----------|----------------------------------------------------------------------------|
| constraint                 | String                             | 0         | Constraint expression.                                                     |
| constraintForce            | String                             | 0         | Constraint force<br>expression.                                            |
| constraintMethod           | elemental   nodal                  | elemental | Pointwise constraint<br>method.                                            |
| constraintType             | pointwise   weak  <br>Nitsche      | pointwise | Constraint implementation.                                                 |
| excludedBoundaries         | Selection                          | empty     | Boundaries excluded from<br>a domain constraint.                           |
| excludedEdges              | Selection                          | empty     | Edges excluded from a<br>domain or boundary<br>constraint.                 |
| excludedPoints             | Selection                          | empty     | Points excluded from a<br>constraint.                                      |
| formulation                | symmetric   skew  <br>nonsymmetric | skew      | Nitsche method<br>formulation.                                             |
| integrationOrder           | 0 2 4 6 8 <br>userDefined          | 4         | Integration order for weak<br>and Nitsche<br>implementations.              |
| integrationOrderExpression | String                             | 4         | User-defined integration<br>order for weak and Nitsche<br>implementations. |

TABLE 2-30: PROPERTIES FOR CONSTRAINT.

| PROPERTY               | VALUE                                           | DEFAULT                                | DESCRIPTION                                                                      |
|------------------------|-------------------------------------------------|----------------------------------------|----------------------------------------------------------------------------------|
| interiorFlux           | String array                                    | {0,0,0}                                | Interior flux in equation<br>being constrained by the<br>Nitsche method.         |
| elementOrder           | 0 1 2 3 4 5 6 7 <br>userDefined                 | 2                                      | Element order for<br>pointwise and weak<br>constraints.                          |
| elementOrderExpression | String                                          | 2                                      | User-defined element<br>order for pointwise and<br>weak constraints.             |
| lmName                 | String                                          | lm_ <tag></tag>                        | Lagrange multiplier variable<br>name for weak constraint.                        |
| penaltyFactor          | String                                          | 24*dvol_spatial/<br>mean(dvol_spatial) | User-defined penalty factor<br>for the Nitsche method.                           |
| penaltyFactorControl   | auto  <br>userDefined                           | auto                                   | Nitsche method penalty<br>factor selection strategy.                             |
| quadratureFrame        | mesh   geometry  <br>material  <br>spatial      | spatial                                | Frame in which integration<br>of weak and Nitsche<br>contributions is performed. |
| reactionTerms          | symmetric  <br>userDefined                      | symmetric                              | Application of reaction<br>forces.                                               |
| referenceFrame         | mesh   geometry  <br>material  <br>spatial      | spatial                                | Frame in which the Nitsche<br>interior flux is interpreted.                      |
| shapeFunctionType      | <shape_function_<br>id&gt;</shape_function_<br> | shlag                                  | Shape function type ID.                                                          |
| vectorConstraint       | String array                                    | {0,0,0}                                | Vector constraint<br>expression.                                                 |
| vectorConstraintForce  | String array                                    | {0,0,0}                                | Vector constraint force<br>expression.                                           |

### *ControlVariableField*

model.component(*<ctag>*).common().create(*<tag>*,"ControlVariableField") creates a control variable field feature that adds a control variable to some geometric entity for use in a sensitivity analysis. For a control variable field definition, the following properties are available, in addition to the Selections.

TABLE 2-31: PROPERTIES FOR CONTROLVARIABLEFIELD.

| PROPERTY          | VALUE          | DEFAULT | DESCRIPTION                                                     |
|-------------------|----------------|---------|-----------------------------------------------------------------|
| initialValue      | String array   | {}      | Initial value expressions.                                      |
| lbound            | double         | 0       | Lower bound.                                                    |
| order             | 1 2 3 4        | 1       | Element order.                                                  |
| scale             | double         | 1       | Scaling of the control variable.                                |
| shapeFunctionType | shlag   shdisc | shlag   | The shape function type: Lagrange or<br>discontinuous Lagrange. |
| ubound            | double         | 0       | Upper bound.                                                    |
| useBounds         | true   false   | true    | Use bounds for the control variable.                            |

## *ParticipationFactors*

model.component(*<ctag>*).common().create(*<tag>*,"ParticipationFactors") creates a participation factors feature setting up variables for participation factor evaluation. For a ParticipationFactors definition, the following properties are available.

TABLE 2-32: PROPERTIES FOR PARTICIPATIONFACTORS.

| PROPERTY | VALUE        | DEFAULT         | DESCRIPTION                                                       |
|----------|--------------|-----------------|-------------------------------------------------------------------|
| cor      | com   user   | com             | Center of rotation definition: Center of<br>mass or user defined. |
| point    | String array | {"0", "0", "0"} | The point for the center of rotation, if<br>cor is set to user.   |

## *ResponseSpectrum*

model.component(*<ctag>*).common().create(*<tag>*,"ResponseSpectrum") creates a response spectrum feature preparing a structural model for response spectrum evaluation. For a Response Spectrum feature, the following properties are available.

TABLE 2-33: PROPERTIES FOR RESPONSESPECTRUM.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION                                                                   |
|----------|--------|---------|-------------------------------------------------------------------------------|
| eigStudy | String | none    | Tag of a Study containing at least one<br>Eigenfrequency study step, or none. |

## *BucklingImperfection*

model.component(*<ctag>*).common().create(*<tag>*,"BucklingImperfection") creates a buckling imperfection feature preparing a structural model for performing a buckling analysis with an initial imperfection based on a preceding linear buckling analysis. For a Buckling Imperfection feature, the following properties are available:

TABLE 2-34: PROPERTIES FOR BUCKLINGIMPERFECTION.

| PROPERTY               | VALUE  | DEFAULT                   | DESCRIPTION                                                                            |
|------------------------|--------|---------------------------|----------------------------------------------------------------------------------------|
| LoadParameter          | String | Any existing<br>parameter | The load parameter for the nonlinear buckling study.                                   |
| NonlinearBucklingStudy | String | new                       | Tag of the study to use as the linear buckling study, or<br>new to create a new study. |
| Study                  | String | none                      | Tag of the study to use as the linear buckling study, or<br>none.                      |

This feature requires a license for the Structural Mechanics Module.

### *AmbientProperties*

model.component(*<ctag>*).common().create(*<tag>*,"AmbientProperties") creates an ambient properties feature. Ambient properties can be set manually, or imported from meteorological data. For an Ambient Properties feature, Table 2-35 lists the properties that are available for the default setting of the AmbientData property.

TABLE 2-35: PROPERTIES FOR AMBIENTPROPERTIES.

| PROPERTY    | VALUE                                                       | DEFAULT   | DESCRIPTION                |
|-------------|-------------------------------------------------------------|-----------|----------------------------|
| AmbientData | UserDef  <br>MeteorologicalData  <br>MeteorologicalData2017 | UserDef   | Source of ambient data.    |
| T_amb       | double                                                      | 293.15[K] | Ambient temperature.       |
| p_amb       | double                                                      | 1[atm]    | Ambient absolute pressure. |
| phi_amb     | double                                                      | 0         | Ambient relative humidity. |
| v_amb       | double                                                      | 0[m/s]    | Wind velocity.             |

TABLE 2-35: PROPERTIES FOR AMBIENTPROPERTIES.

| PROPERTY | VALUE  | DEFAULT     | DESCRIPTION                                      |
|----------|--------|-------------|--------------------------------------------------|
| Isn_amb  | double | 1000[W/m^2] | Clear sky noon beam normal<br>irradiance.        |
| Ish_amb  | double | 0[W/m^2]    | Clear sky noon diffuse<br>horizontal irradiance. |

#### *GlobalReducedModelInputs*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalReducedModelInputs") creates a reduced model inputs feature defining control variables for use as inputs when training a reduced model. For a Global Reduced Model Inputs definition, the following properties are available.

TABLE 2-36: PROPERTIES FOR GLOBALREDUCEDMODELINPUTS.

| PROPERTY   | VALUE        | DEFAULT | DESCRIPTION                                                                       |
|------------|--------------|---------|-----------------------------------------------------------------------------------|
| name       | String array | {}      | Names of global scalar variables to be<br>made available as reduced model inputs. |
| expression | String array | {}      | Online value expressions, one for each<br>variable in name.                       |

