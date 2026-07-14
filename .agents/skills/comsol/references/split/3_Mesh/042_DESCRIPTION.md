# **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CornerRefinement") to decrease the element size defined in the sequence at vertices in 2D and edges in 3D that define a sharp corner. Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"CornerRefinement") to decrease the element size for the feature *<ftag>* that can be any of the types Edge, FreeQuad, FreeTri, or FreeTet.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() or model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature(*<ftag1>*).selection() to specify the domain selection. If you do not specify any selection, the feature is defined on the entire geometry.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection("corner").set() to specify a selection of corners to include or exclude from the automatic selection of corners.

The following properties are available:

TABLE 4-27: VALID PROPERTIES.

| NAME       | VALUE             | DEFAULT                   | DESCRIPTION                                                                             |
|------------|-------------------|---------------------------|-----------------------------------------------------------------------------------------|
| boundary   | Selection         |                           | Boundary selection.                                                                     |
| corner     | Selection         |                           | Corners to include or exclude.                                                          |
| filter     | include   exclude |                           | Exclude or include only selected corners.                                               |
| minangle   | double            | 240 [deg]                 | Minimum angle between two boundaries (sharp corner) for<br>decreasing the element size. |
| refinement | double            | 0.25 in 2D,<br>0.35 in 3D | Factor multiplying the element size at sharp corners. The<br>valid range is [0 1].      |
| usefilter  | on   off          | off                       | Filter implicitly defined corners.                                                      |

#### **SEE ALSO**

BndLayer, BndLayerProp, CornerProp

