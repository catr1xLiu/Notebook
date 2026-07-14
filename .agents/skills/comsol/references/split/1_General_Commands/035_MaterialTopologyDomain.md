# *MaterialTopologyDomain*

model.component(*<ctag>*).common().create(*<tag>*,"MaterialTopologyDomain") creates a material topology domain feature for topology optimization.

## *MaterialTopologyBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"MaterialTopologyBoundary") creates a material topology boundary feature for topology optimization.

## *PolynomialBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"PolynomialBoundary") creates a polynomial boundary feature for shape optimization in 2D only.

## *Transformation*

model.component(*<ctag>*).common().create(*<tag>*,"Transformation") creates a linear shape domain feature for shape optimization.

#### *VoidTopologyDomain*

model.component(*<ctag>*).common().create(*<tag>*,"VoidTopologyDomain") creates a void topology domain feature for topology optimization.

#### *VoidTopologyBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"VoidTopologyBoundary") creates a void topology boundary feature for topology optimization.

## *MirrorTopology*

model.component(*<ctag>*).common().create(*<tag>*,"MirrorTopology") creates a mirror symmetry feature for topology optimization.

## *SectorTopology*

model.component(*<ctag>*).common().create(*<tag>*,"SectorTopology") creates a sector symmetry feature for topology optimization.

The following properties are available for the common optimization features.

TABLE 2-47: PROPERTIES FOR COMMON OPTIMIZATION FEATURES.

| PROPERTY            | VALUE                                              | DEFAULT                        | DESCRIPTION                                                                                                                                            |
|---------------------|----------------------------------------------------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| beta                | double                                             | 8                              | The projection slope when<br>projectionType is set to<br>TanhProjection.                                                                               |
| d0                  | String array                                       | {0,0,0}                        | Initial control displacement.                                                                                                                          |
| discretization      | linear   constant                                  |                                | The discretization: linear or constant.                                                                                                                |
| filterType          | Helmholtz  <br>No_filter                           | Helmholtz                      | The filter type for filtering of the<br>density: Helmholtz filtering or no<br>filtering.                                                               |
| filterLengthType    | Mesh   Custom                                      | Mesh                           | L_min is taken as h when<br>filterLengthType is set to Mesh.                                                                                           |
| filterRadiusType    | Small   Medium  <br>Large   Custom                 | Large                          | L_min is taken as 1, 1.5, and 2 times<br>the maximumDisplacement, when<br>the filterRadiusType is set to<br>Small, Medium, and Large,<br>respectively. |
| fixedDensityType    | Custom   Material<br>  Void                        | Material                       | theta_fix is taken as 0 when<br>fixedDensityType is set to Void,<br>and it is taken as 0 when<br>fixedDensityType is set to<br>Material.               |
| interpolationType   | SIMP   Darcy  <br>Linear_interp  <br>RAMP   Custom | SIMP                           | The interpolation type: SIMP, Darcy,<br>linear, RAMP, or user defined.                                                                                 |
| L_min               | String                                             | h                              | Filter radius when filterType is<br>set to Helmholtz.                                                                                                  |
| maximumDisplacement | double                                             | 5% of geometry<br>bounding box | Maximum displacement (in each<br>coordinate direction).                                                                                                |
| normal              | double array                                       | {0,0,1}                        | Prescribed normal vector.                                                                                                                              |
| order               | positive integer                                   | 2                              | Polynomial order.                                                                                                                                      |
| p_SIMP              | double                                             | 3                              | SIMP exponent, when<br>interpolationType is set to SIMP.                                                                                               |
| projectionType      | No_projection  <br>TanhProjection                  | No_projection                  | The projection type: No projection<br>or hyperbolic tangent projection.                                                                                |
| q_Darcy             | double                                             | 0.01                           | Darcy interpolation, when<br>interpolationType is set to<br>Darcy.                                                                                     |
| q_RAMP              | double                                             | 3                              | RAMP parameter, when<br>interpolationType is set to RAMP.                                                                                              |
| simpExponentType    | Auto   Custom                                      | Auto                           | p_SIMP is taken as 3, when<br>setsimpExponentType is set to<br>Auto.                                                                                   |

TABLE 2-47: PROPERTIES FOR COMMON OPTIMIZATION FEATURES.

| PROPERTY     | VALUE                   | DEFAULT        | DESCRIPTION                                                                     |
|--------------|-------------------------|----------------|---------------------------------------------------------------------------------|
| theta0       | double                  | 0.5            | Initial value for the discretization.                                           |
| thetaMinType | Auto   Custom           | Auto           | theta_min is taken as 0.001 when<br>thetaMinType is set to Auto.                |
| theta_beta   | double                  | 0.5            | The projection point when<br>projectionType is set to<br>TanhProjection.        |
| theta_fix    | double                  | 1              | Material volume factor constraint.                                              |
| theta_min    | double                  | 0.001          | Minimum penalized volume fraction,<br>when interpolationType is set to<br>SIMP. |
| theta_u      | String                  | 1-dtopo#.theta | User-defined interpolation                                                      |
| type         | bernstein  <br>lagrange | bernstein      | Polynomial type.                                                                |

*SurrogateModelGeometrySampling*

model.component(*<ctag>*).common().create(*<tag>*,"SurrogateModelGeometrySampling") creates a geometry sampling feature for surrogate model training.

The following properties are available for a SurrogateModelGeometrySampling definition:

TABLE 2-48: PROPERTIES FOR THE SURROGATEMODELGEOMETRYSAMPLING FEATURE.

| VALUE          | VALUE                                      | DEFAULT                         | DESCRIPTION                                                                                                                                                                                            |
|----------------|--------------------------------------------|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| samplemethod   | selection  <br>grid   mesh                 | selection                       | Use selection to sample on all mesh vertices in the<br>selection of the computational mesh, use grid to<br>uniformly sample on a grid and use mesh to<br>interpolate the solution on a different mesh. |
| frame          | mesh   geometry<br>  material  <br>spatial | material                        | The coordinate frame to sample in.                                                                                                                                                                     |
| dim1min        | double                                     | 0                               | The lower bound of the grid in the first dimension<br>when samplemethod is set to grid.                                                                                                                |
| dim1max        | double                                     | 1                               | The upper bound of the grid in the first dimension<br>when samplemethod is set to grid.                                                                                                                |
| dim1resolution | positive integer                           | 1000 (1D), 100<br>(2D), 30 (3D) | The number of points the grid is uniformly<br>discretized with in the first dimension when<br>samplemethod is set to grid.                                                                             |
| dim2min        | double                                     | 0                               | The lower bound of the grid in the second<br>dimension when samplemethod is set to grid.                                                                                                               |
| dim2max        | double                                     | 1                               | The upper bound of the grid in the second<br>dimension when samplemethod is set to grid.                                                                                                               |
| dim2resolution | positive integer                           | 1000 (1D), 100<br>(2D), 30 (3D) | The number of points the grid is uniformly<br>discretized with in the second dimension when<br>samplemethod is set to grid.                                                                            |
| dim3min        | double                                     | 0                               | The lower bound of the grid in the third<br>dimension when samplemethod is set to grid.                                                                                                                |
| dim3max        | double                                     | 1                               | The upper bound of the grid in the third<br>dimension when samplemethod is set to grid.                                                                                                                |
| dim3resolution | positive integer                           | 1000 (1D), 100<br>(2D), 30 (3D) | The number of points the grid is uniformly<br>discretized with in the third dimension when<br>samplemethod is set to grid.                                                                             |

TABLE 2-48: PROPERTIES FOR THE SURROGATEMODELGEOMETRYSAMPLING FEATURE.

| VALUE             | VALUE             | DEFAULT | DESCRIPTION                                                     |
|-------------------|-------------------|---------|-----------------------------------------------------------------|
| geometryselection | selection         | all()   | The selection to use when samplemethod is set<br>to selection.  |
| mesh              | reference to mesh |         | The mesh to interpolate on when samplemethod<br>is set to mesh. |

