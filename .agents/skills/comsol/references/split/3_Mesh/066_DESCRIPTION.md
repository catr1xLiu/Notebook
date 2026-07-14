# **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Size") to specify element size properties in the sequence. Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"Size") to specify element size properties for the feature *<ftag>* that can be any of the types Edge, FreeQuad, FreeTri, FreeTet, Map, or Sweep.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() or model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature(*<ftag1>*).selection() to specify the geometric entity selection. If you do not specify any selection the size feature is defined on all geometric entities. The selection is not available for the *default size feature*, tagged size.

The following properties are available:

TABLE 4-35: FEATURE PROPERTIES DEFINED.

| PROPERTY      | VALUE                                                                        | DEFAULT               | DESCRIPTION                                                                                                                                   |
|---------------|------------------------------------------------------------------------------|-----------------------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| custom        | on   off                                                                     | off                   | Set custom to on to activate all mesh parameters.                                                                                             |
| hauto         | 1, 2, …,9                                                                    | 5                     | Specifies automatic settings for all mesh parameters<br>when custom is off. 1 is the finest and 9 is the<br>coarsest predefined size setting. |
| hcurve        | double                                                                       | 0.3   0.6             | Curvature mesh size.                                                                                                                          |
| hcurveactive  | on   off                                                                     | on                    | Specifies if hcurve is used.                                                                                                                  |
| hgrad         | double                                                                       | 1.3   1.5             | Element growth rate.                                                                                                                          |
| hgradactive   | on   off                                                                     | on                    | Specifies if hgrad is used.                                                                                                                   |
| hmax          | double                                                                       | geometry<br>dependent | Maximum element size.                                                                                                                         |
| hmaxactive    | on   off                                                                     | on                    | Specifies if hmax is used.                                                                                                                    |
| hmin          | double                                                                       | geometry<br>dependent | Minimum element size.                                                                                                                         |
| hminactive    | on   off                                                                     | on                    | Specifies if hmin is used.                                                                                                                    |
| hnarrow       | double                                                                       | 0.5                   | Resolution of narrow regions.                                                                                                                 |
| hnarrowactive | on   off                                                                     | on                    | Specifies if hnarrow is used.                                                                                                                 |
| table         | cfd   default  <br>plasma   semi  <br>coarseadaptation  <br>timeexplicitwave | default               | Specifies for which physics the element size is<br>calibrated.                                                                                |

![](_page_89_Picture_3.jpeg)

The properties with names ending in active are not available for the default size feature.

The property table specifies the physics for which the element size is calibrated.

Hauto is a nonnegative scalar. This value is used to set several mesh parameters in order to get a mesh of desired size. Smaller values of hauto generate finer meshes with more elements. The integers between 1 and 9 has a special interpretation; they correspond to the mesh settings **Normal**, **Fine**, **Coarse**, and so forth in COMSOL Multiphysics. The value 5 correspond to **Normal**. When you set the property hauto, all other properties are set to their default value, according to the following tables (for table set to default). Other noninteger values provide mesh parameters that are interpolated from the values in the tables.

TABLE 4-36: MESH PARAMETERS SET BY THE PROPERTY HAUTO IN 2D (FOR DEFAULT TABLE).

| HAUTO | HMAXFACT | HCURVE | HGRAD | HMINFACT | HNARROW |
|-------|----------|--------|-------|----------|---------|
| 1     | 0.01     | 0.2    | 1.1   | 2e-5     | 1       |
| 2     | 0.02     | 0.25   | 1.2   | 7.5e-5   | 1       |
| 3     | 0.037    | 0.25   | 1.25  | 1.25e-4  | 1       |
| 4     | 0.053    | 0.3    | 1.3   | 3e-4     | 1       |
| 5     | 0.067    | 0.3    | 1.3   | 3e-4     | 1       |
| 6     | 0.1      | 0.4    | 1.4   | 0.002    | 1       |
| 7     | 0.13     | 0.6    | 1.5   | 0.006    | 1       |
| 8     | 0.2      | 0.8    | 1.8   | 0.016    | 1       |
| 9     | 0.33     | 1      | 2     | 0.05     | 0.9     |

TABLE 4-37: MESH PARAMETERS SET BY THE PROPERTY HAUTO IN 3D (FOR DEFAULT TABLE).

| HAUTO | HMAXFACT | HCURVE | HGRAD | HMINFACT | HNARROW |
|-------|----------|--------|-------|----------|---------|
| 1     | 0.02     | 0.2    | 1.3   | 2e-4     | 1       |
| 2     | 0.035    | 0.3    | 1.35  | 0.0015   | 0.85    |
| 3     | 0.055    | 0.4    | 1.4   | 0.004    | 0.7     |
| 4     | 0.08     | 0.5    | 1.45  | 0.01     | 0.6     |
| 5     | 0.1      | 0.6    | 1.5   | 0.018    | 0.5     |
| 6     | 0.15     | 0.7    | 1.6   | 0.028    | 0.4     |
| 7     | 0.19     | 0.8    | 1.7   | 0.04     | 0.3     |
| 8     | 0.3      | 0.9    | 1.85  | 0.054    | 0.2     |
| 9     | 0.5      | 1      | 2     | 0.07     | 0.1     |

The property hcurve is a real value that relates the mesh size to the curvature of the geometry boundaries. The Gaussian radius of curvature is multiplied by the hcurve factor to obtain the mesh size along the boundary. The specified hcurve is only used if hcurveactive is on, otherwise hcurve is taken from a preceding size feature in the sequence. In the default size feature, tagged size, hcurve is always active and there is no hcurveactive property.

The property hgrad tells how fast the element size — measured as the length of the longest edge of the element — can grow from a region with small elements to a region with larger elements. If two elements lie one unit length apart, the difference in element size can be at most hgrad. The specified hgrad is only used if hgradactive is on, otherwise hgrad is taken from a preceding size feature in the sequence. In the default size feature, hgrad is always active and there is no hcurvegrad property.

The hmax parameter controls the size of the elements in the mesh. The algorithm aims at creating a mesh where no element size exceeds hmax. The default hmax value is hmaxfact \* maxdist, where maxdist is the longest axis parallel distance in the geometry. The specified hmax is only used if hmaxactive is on, otherwise hmax is taken from a preceding size feature in the sequence. In the default size feature, hmax is always active and there is no hmaxactive property.

You can use hmin to control the minimum size of the elements. The main purpose of this parameter is to prevent the generation of many small elements near small curved parts of the geometry. The default hmin value is hminfact \* maxdist, where maxdist is the longest axis parallel distance in the geometry. The specified hmin is only used if hminactive is on, otherwise hmin is taken from a preceding size feature in the sequence. In the default size feature, hmin is always active and there is no hminactive property.

The hnarrow parameter controls the size of the elements in narrow regions. Increasing values of this property decrease the size of the elements in narrow regions. If the value of hnarrow is less than one, elements that are anisotropic in size might be generated in narrow regions. The specified hnarrow is only used if hnarrowactive is on, otherwise hnarrow is taken from a preceding size feature in the sequence. In the default size feature, hnarrow is always active and there is no hnarrowactive property.

The values of hauto, hcurve, hgrad, hmax, hmin, and hnarrow are positive real scalars, or strings that evaluate to positive real scalars, given the evaluation context provided by model.param().

It is not possible to specify coarser size settings on the boundary of a domain than on the domain. The finer settings on the domain is inherited by its boundaries and, in 3D, edges. A warning is issued when settings are overwritten by inheritance. If you need to create coarser mesh on a boundary, you should first mesh the boundary then add the finer size settings on the domain for the corresponding FreeTet, FreeTri, or FreeQuad operation.

## **SEE ALSO**

Distribution, Scale, SizeExpression

Specify a mesh size expression.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"SizeExpression");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).importData();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"SizeExpression");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).
      set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"SizeExpression") to specify a mesh element size expression in the sequence. Use

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"SizeExpression") to specify an element size expression for the feature *<ftag>* that can be any of the types Edge, FreeQuad, FreeTri, or FreeTet.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() or model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature(*<ftag1>*).selection() to specify the geometric entity selection. If you do not specify any selection, the size expression feature is defined on all geometric entities.

You can use mesh.feature(*<ftag>*).importData() to reevaluate the size expression, taking an updated model into account.

The following properties are available.

TABLE 4-38: FEATURE PROPERTIES FOR SIZEEXPRESSION.

| PROPERTY       | VALUE                                  | DEFAULT                               | DESCRIPTION                                                                                         |
|----------------|----------------------------------------|---------------------------------------|-----------------------------------------------------------------------------------------------------|
| adapsolnum     | Array of integers>0                    | 1                                     | Solution number indices.                                                                            |
| cellsize       | Positive scalar                        | Geometry<br>bounding box size /<br>25 | Grid cell size.                                                                                     |
| elementspar    | Positive scalar                        |                                       | Controls refinement if elselect = elements.                                                         |
| elselect       | globalmin   worst  <br>elements        |                                       | Method to select elements to refine.                                                                |
| errorexpr      | String                                 |                                       | Error expression.                                                                                   |
| exprtype       | size   error                           | size                                  | Type of expression for the adaptive mesh<br>generation: an absolute size or an error<br>expression. |
| evaltype       | grid   solution  <br>initialexpression | grid                                  | Specification of mesh to evaluate on.                                                               |
| globalminparam | Positive scalar                        |                                       | Controls refinement if elselect =<br>globalmin.                                                     |
| gridtype       | cellresolution  <br>cellsize           | cellresolution                        | Grid specification.                                                                                 |
| hmeshgrad      | Scalar, 1.0 or greater                 | 1.4                                   | Maximum size field growth rate (1.4 means that<br>the mesh can grow by 40%, for example).           |
| horder         | Double array                           | 0                                     | Error orders (see below).                                                                           |

TABLE 4-38: FEATURE PROPERTIES FOR SIZEEXPRESSION.

| PROPERTY        | VALUE                            | DEFAULT                       | DESCRIPTION                                                                                                                              |
|-----------------|----------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| mesh            | auto   tag of other<br>mesh      | auto                          | Mesh for evaluation when evaltype is<br>initialcondition.                                                                                |
| numcell         | Integer                          | 25                            | Number of cells per dimension.                                                                                                           |
| selection       | first   last   all  <br>manual   | last                          | Solution selection: the first or last solution, all<br>solutions, or manual, using weights and<br>solution number indices in adapsolnum. |
| sizeexpr        | String                           | Geometry<br>bounding box size | Size expression to evaluate for the mesh size.                                                                                           |
| solution        | String                           |                               | The solution defining the mesh adaptation.                                                                                               |
| studystep       | none   tag path to<br>study step | none                          | The study step to use. Available when<br>evaltype is initialcondition.                                                                   |
| updatecondition | A parameter name                 |                               | Name of a parameter used to trigger an<br>update.                                                                                        |
| weights         | Double[] (positive<br>values)    | 1.0                           | Weight for each selected solution.                                                                                                       |
| worstpar        | Positive scalar                  |                               | Controls refinement if elselect = worst.                                                                                                 |

For the horder property, its value is automatically calculated in the adaptation algorithm. It is used only when the Element selection method is set to Rough global minimum.

### **SEE ALSO**

Adapt, Distribution, Scale, Size

## *Sweep*

Create a swept mesh in 3D by sweeping the mesh from the source face along the domain to an opposite destination face.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Sweep");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,ftype);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Sweep") to create a swept mesh in 3D.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the domain selection. If you do not specify any selection the feature creates a mesh on the remaining domains.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add a Size or Distribution attribute feature.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the 3D domain selection. If you do not specify any selection the feature creates a mesh on the remaining domains.

The following properties are available:

TABLE 4-39: AVAILABLE PROPERTIES FOR SWEEP.

| PROPERTY         | VALUE                                                                    | DEFAULT                                                                  | DESCRIPTION                                                                                                                     |
|------------------|--------------------------------------------------------------------------|--------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| remeshsourceface | on   off                                                                 | on                                                                       | Specifies if source faces are remeshed when the<br>mesh defines its own geometric model.                                        |
| facemethod       | auto   tri   quad<br>  quadlegacy52  <br>quadlegacy52a  <br>quadlegacy54 | auto for new<br>models; quad or<br>legacyversions for<br>migrated models | Specifies the face meshing method. For meshes<br>defining their own geometric model, it is used<br>when remeshsourceface is on. |
| mapinterpmethod  | auto  <br>transfinite2D  <br>transfinite3D                               | auto                                                                     | Interpolation method for linking faces.                                                                                         |
| smoothcontrol    | on   off                                                                 | on                                                                       | Specifies if the operation smooths the mesh across<br>removed control entities.                                                 |
| smoothmaxiter    | integer                                                                  | 4                                                                        | Specifies the number of smoothing iterations. Used<br>when smoothcontrol is on.                                                 |
| smoothmaxdepth   | integer                                                                  | 4                                                                        | Specifies the maximum element smoothing depth.<br>Used when smoothcontrol is on.                                                |
| sourceface       | Selection                                                                |                                                                          | Source faces selection.                                                                                                         |
| sweeppath        | auto   straight<br>  circular  <br>general                               | auto                                                                     | Sweep path calculation.                                                                                                         |
| targetface       | Selection                                                                |                                                                          | Destination face selection.                                                                                                     |
| targetmesh       | auto   rigid  <br>morph   project                                        | auto                                                                     | Destination mesh method.                                                                                                        |

For more information about meshes that define their own geometric model, see the section Geometric Model.

Use the property sourceface and targetface to specify the source faces and the destination faces of the sweep, respectively. For domains in the feature selection where none of the surrounding faces are specified as either a source or a destination face, the software automatically tries to determine these faces.

Use the property sweeppath if you want to specify the shape of the sweep path. The string is either auto, straight, circular, or general. straight means that all interior mesh points are located on straight lines between the corresponding source and destination points. circular means that all interior mesh points are located on circular arcs between the corresponding source and destination points. general means that the positions of the interior mesh points are determined by a general interpolation procedure. auto, which is default, means that the sweeping algorithm automatically tries to determine if the sweep path is straight or circular. If this is the case sweeppath is set to straight or circular, respectively. Otherwise, sweeppath is set to general.

Any source face that is not meshed, is meshed automatically. The property facemethod controls which face meshing method is used:

- **•** If facemethod is auto, the algorithm tries to mesh the source faces with quads, but switches to triangles if quad meshing fails or if the element quality becomes too low.
- **•** If facemethod is quad, you get quadrilateral face mesh and therefore hexahedral domain mesh.
- **•** If facemethod is tri, you get triangular face mesh and prism elements in the domain.

Use the property targetmesh if you want to specify the method to be used for transferring the source mesh to the destination. See Swept for more information about the values and examples where they would be used.

The following attribute features are used:

TABLE 4-40: ATTRIBUTE FEATURES USED.

| FEATURE      | REMARKS                       |
|--------------|-------------------------------|
| Distribution | Used when defined on domains. |
| Scale        | Scales Size and Distribution. |
| Size         | Defined on domain.            |

If a Distribution feature is defined on a domain, it is used to determine the distribution of element layer in the sweep direction. Otherwise, equidistant element layers are generated.

#### **SEE ALSO**

Distribution, Size, FreeQuad, FreeTri, Map

