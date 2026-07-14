![](_page_0_Picture_0.jpeg)

# COMSOL Multiphysics

Programming Reference Manual

# COMSOL Multiphysics ® Programming Reference Manual

© 1998–2024 COMSOL

Protected by patents listed on [www.comsol.com/patents](www.comsol.com/patents/), or see Help > About COMSOL Multiphysics on the File menu in the COMSOL Desktop for less detailed lists of U.S. Patents that may apply. Patents pending.

This Documentation and the Programs described herein are furnished under the COMSOL Software License Agreement [\(www.comsol.com/sla\)](https://www.comsol.com/sla/) and may be used or copied only under the terms of the license agreement.

COMSOL, the COMSOL logo, COMSOL Multiphysics, COMSOL Desktop, COMSOL Compiler, COMSOL Server, and LiveLink are either registered trademarks or trademarks of COMSOL AB. All other trademarks are the property of their respective owners, and COMSOL AB and its subsidiaries and products are not affiliated with, endorsed by, sponsored by, or supported by those trademark owners. For a list of such trademark owners, see [www.comsol.com/trademarks.](https://www.comsol.com/trademarks/)

Version: COMSOL 6.3

### Contact Information

Visit the Contact COMSOL page at [www.comsol.com/contact](https://www.comsol.com/contact/) to submit general inquiries or search for an address and phone number. You can also visit the Worldwide Sales Offices page at [www.comsol.com/contact/offices](https://www.comsol.com/contact/offices/) for address and contact information.

If you need to contact Support, an online request form is located on the COMSOL Access page at [www.comsol.com/support/case](https://www.comsol.com/support/case/). Useful links:

- Support Center: [www.comsol.com/support](https://www.comsol.com/support/)
- Product Download: [www.comsol.com/product-download](https://www.comsol.com/product-download/)
- Product Updates: [www.comsol.com/product-update](https://www.comsol.com/product-update)
- COMSOL Blog: [www.comsol.com/blogs](https://www.comsol.com/blogs/)
- Discussion Forum: [www.comsol.com/forum](https://www.comsol.com/forum/)
- Events: [www.comsol.com/events](https://www.comsol.com/events/)
- COMSOL Video Gallery: [www.comsol.com/videos](https://www.comsol.com/videos/)
- Support Knowledge Base: [www.comsol.com/support/knowledgebase](https://www.comsol.com/support/knowledgebase/)
- Learning Center:<https://www.comsol.com/support/learning-center>

Part number: CM020007

## Contents

### Chapter 1: Introduction

| About the COMSOL API<br>18                                                                                                           |  |
|--------------------------------------------------------------------------------------------------------------------------------------|--|
| Additional COMSOL API Documentation 18                                                                                               |  |
| Where Do I Find More Information? 18                                                                                                 |  |
| Getting Started<br>20                                                                                                                |  |
| The Model Object 20                                                                                                                  |  |
| Compiling a Model File for Java® 20                                                                                                  |  |
|                                                                                                                                      |  |
| The Model File for Java<br>21                                                                                                        |  |
| Running a Compiled Model File for Java from the Desktop 22                                                                           |  |
| Running a Compiled Model File as a Batch Job from the Desktop<br>22                                                                  |  |
| Running a Compiled Model File with the COMSOL Batch Command 22                                                                       |  |
| Getting the COMSOL Installation Path from the Windows Registry<br>22<br>Setting up Eclipse for Compiling and Running a Java® File 22 |  |
|                                                                                                                                      |  |
|                                                                                                                                      |  |
| Chapter 2: General Commands                                                                                                          |  |
|                                                                                                                                      |  |
| About General Commands<br>26                                                                                                         |  |
| Overview of General-Purpose Commands 26                                                                                              |  |
| About Name, Identifier, and Tag Properties 28                                                                                        |  |
| get* and Selection Access Methods 29                                                                                                 |  |
| set() 31                                                                                                                             |  |
| setEntry() 32                                                                                                                        |  |
| setIndex()<br>32                                                                                                                     |  |
| hasTag() 33                                                                                                                          |  |
| Methods Associated to Set, SetIndex, and the Various Get Methods 33                                                                  |  |
| Special Property Types 34                                                                                                            |  |
| Selections<br>34                                                                                                                     |  |
| Color Themes 37                                                                                                                      |  |
| The loadFile and saveFile Methods 37                                                                                                 |  |
| Inserting Features from Other Models 38                                                                                              |  |
| ModelUtil 39                                                                                                                         |  |
| model 44                                                                                                                             |  |
| model.attr() 47                                                                                                                      |  |
| model.attr( <tag>)<br/> 48</tag>                                                                                                     |  |
| model.batch() 49                                                                                                                     |  |
| model.bem()<br>55                                                                                                                    |  |
| model.coeff() 58                                                                                                                     |  |
| model.common() 60                                                                                                                    |  |
| model.component() 80                                                                                                                 |  |
| model.constr() 82                                                                                                                    |  |
| model.coordSystem() 85                                                                                                               |  |
| model.cpl() 92                                                                                                                       |  |
| model.elem() 99                                                                                                                      |  |
| model.elementSet()<br>102                                                                                                            |  |
| model.externalInterface<br>104                                                                                                       |  |
|                                                                                                                                      |  |

model.extraDim() . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 104

| model.field()<br>105                              |
|---------------------------------------------------|
| model.form()<br>105                               |
| model.frame()<br>106                              |
| model.func()<br>108                               |
| model.geom()<br>131                               |
| model.group()<br>139                              |
| model.init()<br>139                               |
| model.intRule()<br>140                            |
| model.massProp()<br>140                           |
| model.material()<br>142                           |
| model.mesh()<br>153                               |
| model.methodCall()<br>157                         |
| model.modelNode()<br>159                          |
| model.multiphysics()<br><br>159                   |
| model.nodeGroup()<br>160                          |
| model.ode()<br>161                                |
| model.opt()<br>163                                |
|                                                   |
| Least-Squares Objective Functions<br>164          |
| model.pair()<br>165                               |
| model.param() and model.result().param()<br>169   |
| model.physics()<br>170                            |
| model.probe()<br>175                              |
| model.reduced()<br>177                            |
| model.result()<br>185                             |
| model.savePoint()<br><br>192                      |
| model.selection()<br>192                          |
| model.shape()<br>201                              |
| model.sol()<br>203                                |
| model.solverEvent()<br>207                        |
| model.study()<br>209                              |
| model.thermodynamics()<br>214                     |
| model.unitSystem()<br>216                         |
| model.variable()<br>218                           |
| model.view()<br>220                               |
| model.weak()<br>230                               |
|                                                   |
| Plotting and Exporting Images<br>232              |
| Overview<br>232                                   |
| Properties for the image() Objects<br>232         |
|                                                   |
| Errors and Warnings<br>236                        |
| Introduction<br>236                               |
| Retrieving Problem Information<br>236             |
|                                                   |
| Chapter 3: Geometry                               |
| About Geometry Commands<br>240                    |
| Features for Creating Geometric Primitives<br>240 |
| Features for Geometric Operations<br>241          |
| Selection Features<br>243                         |
| Features for Virtual Operations<br>243            |
| Features for Mesh Control<br>244                  |

| Geometric Model Information Methods                      | 244 |
|----------------------------------------------------------|-----|
| Working with a Geometry Sequence                         | 247 |
| Adding a Model Component (Geometry)                      | 247 |
| Adding a Geometry Feature                                | 247 |
| Editing a Geometry Feature                               | 248 |
| Building Geometry Features                               | 249 |
| Feature Status                                           | 250 |
| Accessing Geometry Object Names<br>                      | 250 |
| Deleting and Disabling Geometry Features                 | 251 |
| Deleting Geometry Objects                                | 251 |
| Moving and Scaling Geometry Objects                      | 252 |
| Plotting a Geometry Sequence                             | 252 |
| Geometry Attribute Methods                               | 252 |
| Geometry Settings                                        | 254 |
| Length Unit                                              | 254 |
| Angular Unit<br>                                         | 254 |
| Scale Values When Changing Unit                          | 254 |
| Geometry Representation in 3D and for Boolean Operations | 255 |
| Default Repair Tolerances                                | 255 |
| Automatic Rebuild                                        | 256 |
| Constraints and Dimensions                               | 256 |
| Work Planes                                              | 258 |
| Selections of Geometric Entities                         | 259 |
| Named Selections                                         | 259 |
| Using Selection Features                                 | 259 |
| Cumulative Selections                                    | 260 |
| Vectorized Selections of Geometric Entities<br>          | 260 |
| Geometry Cleanup                                         | 261 |
| Virtual Operations                                       | 262 |
| About Virtual Operations<br>                             | 262 |
| Mesh Control Entities                                    | 262 |
| Geometry Object Information                              | 263 |
| General Information<br>                                  | 263 |
| Geometric Entity Counters                                | 264 |
| Adjacency<br>                                            | 264 |
| Evaluation on an Edge                                    | 265 |
| Evaluation on a Face                                     | 266 |
| Geometry Representation Arrays                           | 267 |
| Measurements                                             | 269 |
| Measurement Methods<br>                                  | 269 |
| Selecting Objects and Entities to Measure                | 270 |
| Inserting Geometry Sequences from File                   | 271 |
| Example of Importing Geometry Sequences                  | 271 |

| Exporting Geometry to File                                       | 272 |
|------------------------------------------------------------------|-----|
| Exporting to CAD File Formats                                    | 272 |
| Exporting to an STL File                                         | 272 |
| Compatibility for MPHBIN and MPHTXT in 2D and 3D                 | 273 |
| Advanced Settings for DXF Files in 2D                            | 273 |
|                                                                  |     |
| Creating and Using Geometry Parts                                | 274 |
| Geometry Commands                                                | 276 |
| AdjacentSelection<br>                                            | 277 |
| Array                                                            | 279 |
| BallSelection, BoxSelection, CylinderSelection, Disk Selection   | 281 |
| BezierPolygon                                                    | 284 |
| Block                                                            | 285 |
| CentroidMeasurement                                              | 288 |
| Chamfer                                                          | 288 |
| Circle                                                           | 290 |
| CircularArc                                                      | 292 |
| CollapseEdges                                                    | 293 |
|                                                                  |     |
| CollapseFaces                                                    | 294 |
| CollapseFaceRegions                                              | 294 |
| Compose, Union, Intersection, Difference                         | 295 |
| CompositeCurve                                                   | 297 |
| CompositeDomains                                                 | 298 |
| CompositeEdges                                                   | 300 |
| CompositeFaces                                                   | 301 |
| Cone                                                             | 302 |
| ConvertToSolid, ConvertToSurface, ConvertToCurve, ConvertToPoint | 304 |
| CrossSection                                                     | 305 |
| CubicBezier                                                      | 308 |
| Cylinder                                                         | 309 |
| Delete                                                           | 311 |
| DistanceMeasurement                                              | 313 |
| ECone                                                            | 314 |
| EditObject                                                       | 316 |
| Ellipse                                                          | 318 |
| Ellipsoid                                                        | 320 |
| ExplicitSelection                                                | 321 |
| Extract                                                          | 323 |
| Extrude                                                          | 324 |
| Fillet                                                           | 327 |
| Finalize                                                         | 328 |
| FromMesh                                                         | 329 |
| Helix                                                            | 330 |
| Hexahedron                                                       | 332 |
| If, ElseIf, Else, EndIf                                          | 334 |
| IgnoreEdges                                                      | 335 |
| IgnoreFaces                                                      | 336 |
|                                                                  |     |
| IgnoreVertices                                                   | 337 |
| Import DXF                                                       | 338 |
| Import Geometry Sequence                                         | 340 |
| Import Mesh Part or Meshing Sequence                             | 341 |
| Import mphbin/mphtxt                                             | 343 |
| InterpolationCurve                                               | 345 |

| LogicalExpressionSelection                                                      |
|---------------------------------------------------------------------------------|
| MergeEdges                                                                      |
| MergeFaces                                                                      |
| MergeVertices                                                                   |
| MeshControlDomains                                                              |
| MeshControlEdges                                                                |
| MeshControlFaces                                                                |
| MeshControlVertices                                                             |
| Mirror                                                                          |
| Move, Copy                                                                      |
| Offset                                                                          |
| ParameterCheck                                                                  |
|                                                                                 |
| ParametricCurve                                                                 |
| ParametricSurface                                                               |
| PartInstance                                                                    |
| Partition                                                                       |
| PartitionDomains                                                                |
| PartitionEdges                                                                  |
| PartitionFaces                                                                  |
| Point                                                                           |
| Polygon                                                                         |
| Pyramid                                                                         |
| QuadraticBezier                                                                 |
| Rectangle                                                                       |
| RemoveDetails                                                                   |
| Revolve                                                                         |
| RigidTransform                                                                  |
| Rotate                                                                          |
| Scale<br>                                                                       |
|                                                                                 |
| Sphere                                                                          |
| Split                                                                           |
| Square                                                                          |
| Sweep                                                                           |
| Tangent                                                                         |
| Tetrahedron<br>                                                                 |
| Thicken2D                                                                       |
| Torus                                                                           |
| UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection |
| WorkPlane                                                                       |

Interval . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 346

| Using Mesh-Based Geometries                   |  |  |  |  |  |  |  |  |  |  | 420        |
|-----------------------------------------------|--|--|--|--|--|--|--|--|--|--|------------|
| Feature Status                                |  |  |  |  |  |  |  |  |  |  | 421        |
| Deleting Mesh Features                        |  |  |  |  |  |  |  |  |  |  | 421        |
| Disabling Mesh Features                       |  |  |  |  |  |  |  |  |  |  | 421        |
| Clearing Meshes                               |  |  |  |  |  |  |  |  |  |  | 421        |
| Locking Meshes                                |  |  |  |  |  |  |  |  |  |  | 422        |
| Units                                         |  |  |  |  |  |  |  |  |  |  | 422        |
| Selections<br>                                |  |  |  |  |  |  |  |  |  |  | 422        |
|                                               |  |  |  |  |  |  |  |  |  |  |            |
| Mesh Settings                                 |  |  |  |  |  |  |  |  |  |  | 424        |
| Automatic Rebuild                             |  |  |  |  |  |  |  |  |  |  | 424        |
| Length and Angular Units                      |  |  |  |  |  |  |  |  |  |  | 424        |
| Geometric Model<br>                           |  |  |  |  |  |  |  |  |  |  | 424        |
|                                               |  |  |  |  |  |  |  |  |  |  |            |
| Physics-Controlled Meshing                    |  |  |  |  |  |  |  |  |  |  | 426        |
| Geometric Analysis, Detail Size Contribution  |  |  |  |  |  |  |  |  |  |  | 426        |
| Selecting Contributing Physics                |  |  |  |  |  |  |  |  |  |  | 426        |
|                                               |  |  |  |  |  |  |  |  |  |  |            |
| Adaptively Refined Meshes                     |  |  |  |  |  |  |  |  |  |  | 428        |
|                                               |  |  |  |  |  |  |  |  |  |  |            |
| Information and Statistics                    |  |  |  |  |  |  |  |  |  |  | 429        |
| Statistics                                    |  |  |  |  |  |  |  |  |  |  | 429        |
| Number and Types of Elements                  |  |  |  |  |  |  |  |  |  |  | 430        |
| Quality of Elements                           |  |  |  |  |  |  |  |  |  |  | 430        |
| Volume of Elements and Mesh                   |  |  |  |  |  |  |  |  |  |  | 432        |
| Growth Rate in Mesh                           |  |  |  |  |  |  |  |  |  |  | 432        |
| Mesh Status                                   |  |  |  |  |  |  |  |  |  |  | 432        |
| Mesh Plot                                     |  |  |  |  |  |  |  |  |  |  | 432        |
| Measurements                                  |  |  |  |  |  |  |  |  |  |  | 433        |
| Information on the Geometric Model            |  |  |  |  |  |  |  |  |  |  | 433        |
|                                               |  |  |  |  |  |  |  |  |  |  |            |
| Getting and Setting Mesh Data                 |  |  |  |  |  |  |  |  |  |  | 434        |
| Accessing Mesh Data                           |  |  |  |  |  |  |  |  |  |  | 434        |
| Setting or Modifying Mesh Data                |  |  |  |  |  |  |  |  |  |  | 435        |
| Block Versions                                |  |  |  |  |  |  |  |  |  |  | 437        |
| Mesh Element Numbering Conventions            |  |  |  |  |  |  |  |  |  |  | 438        |
|                                               |  |  |  |  |  |  |  |  |  |  |            |
| Errors, Warnings, and Information             |  |  |  |  |  |  |  |  |  |  | 440        |
| Encountering Problems when Building the Mesh  |  |  |  |  |  |  |  |  |  |  | 440        |
| Continue Meshing                              |  |  |  |  |  |  |  |  |  |  | 440        |
| Operations Stopping if Errors                 |  |  |  |  |  |  |  |  |  |  | 440        |
| Retrieving Mesh Problem Information           |  |  |  |  |  |  |  |  |  |  | 440        |
| Retrieving Information About the Latest Build |  |  |  |  |  |  |  |  |  |  | 441        |
| Exporting Meshes to Files                     |  |  |  |  |  |  |  |  |  |  | 442        |
| Exporting Mesh to a File                      |  |  |  |  |  |  |  |  |  |  | 442        |
| Exporting Mesh to a COMSOL Multiphysics File  |  |  |  |  |  |  |  |  |  |  | 442        |
| Exporting Mesh to a NASTRAN® File             |  |  |  |  |  |  |  |  |  |  | 442        |
| Exporting Mesh to a Sectionwise Format        |  |  |  |  |  |  |  |  |  |  | 443        |
|                                               |  |  |  |  |  |  |  |  |  |  |            |
| Exporting Mesh to a 3MF Format                |  |  |  |  |  |  |  |  |  |  | 443        |
|                                               |  |  |  |  |  |  |  |  |  |  |            |
| Mesh Commands                                 |  |  |  |  |  |  |  |  |  |  | 444        |
| Adapt<br>AdjacentSelection<br>                |  |  |  |  |  |  |  |  |  |  | 444<br>446 |
|                                               |  |  |  |  |  |  |  |  |  |  |            |

| Ball              | <br>447                |
|-------------------|------------------------|
| BndLayer          | <br>448                |
| BndLayerProp      | <br>45 I               |
| Box               | 452                    |
| CollapseEntities  | <br>453                |
| Convert           | 454                    |
| CopyEdge          | <br>455                |
| СоруFace          | 457                    |
| CopyDomain        | <br>458                |
| Сору              | 460                    |
| CornerProp        | <br>46 I               |
| CornerRefinement  | 462                    |
| CreateDomains     | 463                    |
| CreateEdges       | 464                    |
| CreateFaces       | 466                    |
| CreateVertices    | 467                    |
| Cylinder          | <br>468                |
| PeleteEntities    | 469                    |
| DetectFaces       | 470                    |
| Distribution      | 470                    |
| Edge              | 472                    |
| EdgeGroup         | 473                    |
| EdgeMap           | 473                    |
| ExplicitSelection | 475                    |
| FillHoles         | 475                    |
| FixedMesh         | 175<br>476             |
| FreeQuad          | 477                    |
| -reeTet           | 478                    |
| -reeTri           | 479                    |
|                   | 48 I                   |
| denticalMesh      | 48 I                   |
| mport             | <del>4</del> 81<br>487 |
| mprint            | <del>4</del> 07<br>488 |
| ntersectPlane     | <del>4</del> 00<br>489 |
|                   | 407<br>493             |
| oinEntities       | 493<br>493             |
| LogicalExpression | 493<br>494             |
| Map               | <del>494</del><br>495  |
| MergeEntities     |                        |
| OnePointMap       | 496<br>400             |
| Reference         | 498<br>499             |
| Refine            | 499<br>                |
| RemeshDomains     | 50 I                   |
| RemeshEdges       | 50 I                   |
| RemeshFaces       | 502                    |
| Scale             | 503                    |
| Size              | 504<br>                |
| SizeExpression    | 507<br>                |
| Sweep             | 508                    |
| Transform         | 510                    |
| TwoPointMap       | 511                    |
| Jnion             | 512                    |
| Vertex            | <br>513                |

# Chapter 5: Elements and Shape Function Programming

|                                    | Shape Functions and Element Types<br>Shape Function Types (Elements) |  |  |  |  |  |  |  |  |  |  | 516<br>516 |
|------------------------------------|----------------------------------------------------------------------|--|--|--|--|--|--|--|--|--|--|------------|
| Chapter 6: Solvers and Study Steps |                                                                      |  |  |  |  |  |  |  |  |  |  |            |
|                                    | About Solver Commands                                                |  |  |  |  |  |  |  |  |  |  | 526        |
|                                    | Features Producing and Manipulating Solutions                        |  |  |  |  |  |  |  |  |  |  | 526        |
|                                    | Features with Solver Settings                                        |  |  |  |  |  |  |  |  |  |  | 527        |
|                                    | Solution Object Information Methods                                  |  |  |  |  |  |  |  |  |  |  | 528        |
|                                    | Solution Feature Information Methods                                 |  |  |  |  |  |  |  |  |  |  | 530        |
|                                    | Solution Object Data                                                 |  |  |  |  |  |  |  |  |  |  | 531        |
|                                    | General Information                                                  |  |  |  |  |  |  |  |  |  |  | 531        |
|                                    | Solution Data                                                        |  |  |  |  |  |  |  |  |  |  | 533        |
|                                    | SolutionInfo Object and Its Methods                                  |  |  |  |  |  |  |  |  |  |  | 534        |
|                                    | Solution Creation                                                    |  |  |  |  |  |  |  |  |  |  | 537        |
|                                    | General Matrix Information                                           |  |  |  |  |  |  |  |  |  |  | 538        |
|                                    | Matrix Data                                                          |  |  |  |  |  |  |  |  |  |  | 539        |
|                                    | Matrix Creation                                                      |  |  |  |  |  |  |  |  |  |  | 540        |
|                                    | The clist and cname Properties                                       |  |  |  |  |  |  |  |  |  |  | 541        |
|                                    | Adaption                                                             |  |  |  |  |  |  |  |  |  |  | 542        |
|                                    | Advanced                                                             |  |  |  |  |  |  |  |  |  |  | 542        |
|                                    | Assemble                                                             |  |  |  |  |  |  |  |  |  |  | 544        |
|                                    | AutoRemesh                                                           |  |  |  |  |  |  |  |  |  |  | 545        |
|                                    | AWE                                                                  |  |  |  |  |  |  |  |  |  |  | 547        |
|                                    | CombineSolution                                                      |  |  |  |  |  |  |  |  |  |  | 549        |
|                                    | CopySolution                                                         |  |  |  |  |  |  |  |  |  |  | 552        |
|                                    | Eigenvalue                                                           |  |  |  |  |  |  |  |  |  |  | 552        |
|                                    | EigenvalueAttrib                                                     |  |  |  |  |  |  |  |  |  |  | 557        |
|                                    | EigenvalueParam                                                      |  |  |  |  |  |  |  |  |  |  | 557        |
|                                    |                                                                      |  |  |  |  |  |  |  |  |  |  |            |
|                                    | FFT                                                                  |  |  |  |  |  |  |  |  |  |  | 558        |
|                                    | For, EndFor                                                          |  |  |  |  |  |  |  |  |  |  | 562        |
|                                    | FullyCoupled                                                         |  |  |  |  |  |  |  |  |  |  | 562        |
|                                    | HardwareAcceleration                                                 |  |  |  |  |  |  |  |  |  |  | 568        |
|                                    | InputMatrix                                                          |  |  |  |  |  |  |  |  |  |  | 569        |
|                                    | Linear                                                               |  |  |  |  |  |  |  |  |  |  | 570        |
|                                    | LowerLimit                                                           |  |  |  |  |  |  |  |  |  |  | 583        |
|                                    | LumpedStep                                                           |  |  |  |  |  |  |  |  |  |  | 583        |
|                                    | Modal                                                                |  |  |  |  |  |  |  |  |  |  | 584        |
|                                    | ModalReduction                                                       |  |  |  |  |  |  |  |  |  |  | 588        |
|                                    | Optimization                                                         |  |  |  |  |  |  |  |  |  |  | 591        |
|                                    | Parametric                                                           |  |  |  |  |  |  |  |  |  |  | 598        |
|                                    | PlugFlow                                                             |  |  |  |  |  |  |  |  |  |  | 600        |
|                                    | ProperOrthogonalDecomposition                                        |  |  |  |  |  |  |  |  |  |  | 600        |
|                                    | Previous Solution                                                    |  |  |  |  |  |  |  |  |  |  | 601        |
|                                    | Segregated                                                           |  |  |  |  |  |  |  |  |  |  | 602        |
|                                    | SegregatedStep                                                       |  |  |  |  |  |  |  |  |  |  | 604        |
|                                    | Sensitivity                                                          |  |  |  |  |  |  |  |  |  |  | 607        |
|                                    | StatAcceleration                                                     |  |  |  |  |  |  |  |  |  |  | 608        |
|                                    | StateSpace                                                           |  |  |  |  |  |  |  |  |  |  | 608        |

| Stationary<br><br>610                                                          |
|--------------------------------------------------------------------------------|
| StopCondition<br>612                                                           |
| StoreSolution<br>612                                                           |
| StudyStep<br>613                                                               |
| Time<br>614                                                                    |
| TimeAdaption<br>622                                                            |
| TimeDiscrete<br>624                                                            |
| TimeExplicit<br>626                                                            |
| TimeParametric<br>628                                                          |
| UpperLimit<br>628                                                              |
| Variables<br>629                                                               |
| XmeshInfo<br>631                                                               |
|                                                                                |
| Studies and Study Steps<br>635                                                 |
| Introduction<br>635                                                            |
| Batch<br>638                                                                   |
| Batch Sweep<br><br>639                                                         |
| Bidirectionally Coupled Particle Tracing<br>640                                |
| Bidirectionally Coupled Ray Tracing<br>643                                     |
| Cluster Computing<br>646                                                       |
| Cluster Sweep<br>648                                                           |
| Eigenfrequency<br>650                                                          |
| Eigenvalue<br>653                                                              |
| Stationary Then Eigenfrequency<br>656                                          |
| Frequency Domain and Frequency-Domain Perturbation<br>656                      |
| Frequency to Time FFT<br>659                                                   |
| Function Sweep<br>661                                                          |
| Material Sweep<br><br>662                                                      |
| Model Reduction<br>663                                                         |
| Multigrid Level<br>665                                                         |
| Parametric Sweep<br>666                                                        |
| Ray Tracing<br>667                                                             |
| Schrödinger–Poisson<br>670                                                     |
| Sensitivity<br>673                                                             |
| Stationary<br><br>674                                                          |
| Surrogate Model Training<br>679                                                |
| Time Dependent<br>683                                                          |
| Time Discrete<br>686                                                           |
| Time to Frequency FFT<br>688                                                   |
|                                                                                |
| Chapter 7: Results                                                             |
| About Results Commands<br>692                                                  |
| Commands Grouped by Function<br><br>695                                        |
| Use of Datasets<br>701                                                         |
|                                                                                |
| Extracting and Storing Plot Data<br>704                                        |
| Retrieving Plot Data<br>704                                                    |
| Retrieving Numerical Results<br>705                                            |
| Updating Plots, Storing and Clearing Plot Data, and Previewing Datasets<br>707 |
|                                                                                |

| Solution Selection                                           | 708 |
|--------------------------------------------------------------|-----|
| About Selecting Solutions<br>                                | 708 |
| Selecting Solutions by Solution Number                       | 708 |
| Selecting Solutions by Solution Level                        | 708 |
| Choosing Solution Selection Method                           | 709 |
| Results Configurations                                       | 709 |
|                                                              |     |
| Custom Color Tables                                          | 710 |
| Overview                                                     | 710 |
| API Methods for colorTable                                   | 710 |
| Properties for colorTable<br>                                | 710 |
|                                                              |     |
| Stepping Through Plots                                       | 712 |
| API Methods for Stepping Through Plots                       | 712 |
|                                                              |     |
| Results Commands                                             | 713 |
| Animation                                                    | 713 |
| Annotation                                                   | 718 |
| AnnotationData                                               | 721 |
| Array 1D, Array 2D, Array3D                                  | 723 |
| ArrayFactor                                                  | 724 |
| ArrowData                                                    | 725 |
| ArrowVolume, ArrowSurface, ArrowLine, ArrowPoint             | 728 |
| AvVolume, AvSurface, AvLine                                  | 732 |
| Average, Integral, Maximum, Minimum                          | 736 |
| Beam                                                         | 737 |
| Color                                                        | 738 |
| Comparison                                                   | 740 |
| Contour (Plot)                                               | 741 |
| Contour (Dataset)                                            | 746 |
| ContourSeries                                                | 746 |
| CoordSysLine, CoordSysSurface, CoordSysVolume, CoordSysPoint | 751 |
| CutLine2D, CutLine3D                                         | 755 |
| CutPlane                                                     | 756 |
| CutPoint1D, CutPoint2D, CutPoint3D<br>                       | 757 |
| Data                                                         | 759 |
| Deform                                                       | 762 |
| Directivity                                                  | 763 |
| Edge2D, Edge3D                                               | 768 |
| Embed1D, Embed2D                                             | 768 |
| EnergyDecay                                                  | 769 |
| ErrorBars                                                    | 770 |
| Eval                                                         | 770 |
| EvalAberration                                               | 773 |
| EvalGlobal                                                   | 774 |
| EvalGlobalMatrix                                             | 777 |
| EvalGlobalSweep                                              | 780 |
| EvalPoint                                                    | 781 |
| EvalPointMatrix                                              | 785 |
| EvaluationGroup                                              | 788 |
| Export                                                       | 790 |
| Extrude1D, Extrude2D                                         | 791 |
| Filter (Dataset)<br>                                         | 791 |
| Filter (Plot Attribute)                                      | 793 |

| Filter (Particle Tracing, Point Trajectories, Ray Tracing)     |  | 793 |
|----------------------------------------------------------------|--|-----|
| Filter (Table Graph)                                           |  | 794 |
| Function                                                       |  | 794 |
| Function2D                                                     |  | 798 |
| Function3D                                                     |  | 800 |
| Global (Numerical)                                             |  | 804 |
| Global (Plot)                                                  |  | 806 |
| GraphMarker                                                    |  | 811 |
| Grid1D, Grid2D, Grid3D                                         |  | 813 |
| Height, AberrationHeight, HistogramHeight, TableHeight         |  | 815 |
| Histogram                                                      |  | 817 |
| Image (Export)                                                 |  | 821 |
| Image (Plot)                                                   |  | 824 |
| ImageOverlay                                                   |  | 827 |
| ImpulseResponse                                                |  | 828 |
| InterferencePattern                                            |  | 832 |
| Interp                                                         |  | 835 |
| IntersectionPoint2D, IntersectionPoint3D                       |  | 837 |
| IntVolume, IntSurface, IntLine                                 |  | 839 |
| Isosurface (Plot)                                              |  | 843 |
| Isosurface (Dataset)                                           |  | 848 |
| IsosurfaceSeries                                               |  | 848 |
|                                                                |  |     |
| Join                                                           |  | 852 |
| JointProbabilityDistribution                                   |  | 853 |
| KernelDensityEstimation                                        |  | 854 |
| LayeredMaterial                                                |  | 855 |
| LayeredMaterialSlice<br>                                       |  | 856 |
| Line                                                           |  | 861 |
| LineData                                                       |  | 866 |
| LineGraph                                                      |  | 870 |
| LineSegments                                                   |  | 874 |
| Marker                                                         |  | 877 |
| MassProperties<br>                                             |  | 879 |
| MaterialAppearance                                             |  | 882 |
| MatrixHistogram                                                |  | 883 |
| MaxMinVolume, MaxMinSurface, MaxMinLine, MaxMinPoint           |  | 887 |
| MaxVolume, MaxSurface, MaxLine, MinVolume, MinSurface, MinLine |  | 891 |
| MeasureVolume, MeasureSurface, MeasureLine, MeasureDistance    |  | 895 |
| Mesh (Plot)                                                    |  | 899 |
| Mesh (Dataset)<br>                                             |  | 901 |
| Mesh (Export)                                                  |  | 902 |
| MeshImportParameters                                           |  | 903 |
| Mirror2D, Mirror3D                                             |  | 903 |
| Multislice                                                     |  | 905 |
| Nyquist                                                        |  | 909 |
| OctaveBand                                                     |  | 912 |
| OpticalAberration                                              |  | 916 |
| Parametric1D, Parametric2D                                     |  | 920 |
| ParCurve2D, ParCurve3D                                         |  | 920 |
| ParSurface                                                     |  | 921 |
| Particle<br>                                                   |  | 922 |
| Particle (1D Plot)                                             |  | 927 |
| Particle (Dataset)                                             |  | 931 |
| Particle (Evaluation)                                          |  | 932 |

| ParticleBin                                           | 934 |
|-------------------------------------------------------|-----|
| ParticleMass                                          | 935 |
| ParticleTrajectories                                  | 940 |
| Partition                                             | 944 |
| Pellets                                               | 945 |
| PhasePortrait                                         | 949 |
| Pipe                                                  | 952 |
| Plot                                                  | 952 |
| PlotGroup1D, PlotGroup2D, PlotGroup3D                 | 954 |
| PoincareMap                                           | 964 |
| Point                                                 | 966 |
| PointData                                             | 971 |
| PointGraph                                            | 973 |
| PointTrajectories                                     | 978 |
| PolarGroup                                            | 982 |
| Polarization                                          | 985 |
| PrincipalLine, PrincipalSurface, PrincipalVolume      | 988 |
| RadiationPattern                                      | 992 |
|                                                       |     |
| RadiationPattern (Export)                             | 997 |
| Ray (1D Plot) 1000                                    |     |
| Ray (Dataset) 1004                                    |     |
| Ray (Evaluation) 1004                                 |     |
| RayBin 1007                                           |     |
| RayTrajectories 1008                                  |     |
| Receiver2D, Receiver3D 1011                           |     |
| ReflectionGraph, ImpedanceGraph, AdmittanceGraph 1012 |     |
| ResponseSpectrum2D, ResponseSpectrum3D 1016           |     |
| Revolve1D, Revolve2D 1018                             |     |
| ScatterVolume, ScatterSurface 1020                    |     |
| Sector2D, Sector3D<br>1023                            |     |
| Selection (Dataset Attribute) 1025                    |     |
| Selection (Plot Attribute) 1025                       |     |
| Shell 1026                                            |     |
| Slice 1027                                            |     |
| SmithGroup 1033                                       |     |
| SobolIndex 1036                                       |     |
| Solution 1037                                         |     |
| Spatial FFT 1038                                      |     |
| Spot Diagram 1039                                     |     |
| Streamline 1042                                       |     |
| StreamlineMultislice 1049                             |     |
| StreamlineSurface<br>1055                             |     |
| Surface (Plot) 1060                                   |     |
| Surface (Dataset) 1065                                |     |
| SurfaceData 1065                                      |     |
| SurfaceSlit 1069                                      |     |
| SystemMatrix 1074                                     |     |
| Table 1075                                            |     |
| Table (Export) 1078                                   |     |
| Table (Plot) 1079                                     |     |
| TableAnnotation 1082                                  |     |
| TableContour 1084                                     |     |
|                                                       |     |
| TableErrorBars<br>1089                                |     |
| TableHistogram 1090                                   |     |

| TableSurface<br>1096                               |  |
|----------------------------------------------------|--|
| TimeAverage, TimeIntegral 1100                     |  |
| ThroughThickness 1101                              |  |
| Touchstone 1106                                    |  |
| Transformation2D, Transformation3D 1107            |  |
| Transformation 1108                                |  |
| Transparency 1109                                  |  |
| TubeData 1110                                      |  |
| VisualEffects 1112                                 |  |
| Volume 1113                                        |  |
| Waterfall 1117                                     |  |
| Whirl 1120                                         |  |
| Chapter 8: Graphical User Interfaces               |  |
| Getting Started<br>1126                            |  |
| Example Graphical User Interface<br>1127           |  |
| Introduction 1127                                  |  |
| Downloading Extra Material 1128                    |  |
| Creating the Code for the Model 1128               |  |
| Construction of the Initial GUI with Graphics 1129 |  |
| Handling of Progress Information 1131              |  |
| Setting Up Inputs From the GUI to the Model 1132   |  |
| Displaying Results in the GUI 1134                 |  |
| Other Details 1135                                 |  |
| GUI Classes<br>1139                                |  |
| ProgressContext 1139                               |  |
| ProgressWorker 1139                                |  |
| SWTGraphicsPanel 1140                              |  |
| SwingGraphicsPanel 1140                            |  |
| Chapter 9: The COMSOL File Formats                 |  |
| File Formats<br>1142                               |  |
| Data Formats<br>1143                               |  |
| Spreadsheet Data Format<br>1143                    |  |
| Grid Data Format 1144                              |  |
| Sectionwise Data Format 1144                       |  |
| Supported Microsoft Excel File Types 1145          |  |
| Color Tables and Color Themes<br>1146              |  |
| About Color Tables 1146                            |  |
| Continuous Color Tables 1146                       |  |
| Discrete Color Tables 1146                         |  |
| About Color Themes 1147                            |  |
|                                                    |  |

TablePoint . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . . 1092

| Materials<br>1150                                      |
|--------------------------------------------------------|
| The Model XML-File Format 1150                         |
| Supported Material Types and Settings 1151             |
| Supported Property Groups and Material Properties 1156 |
| Supported Physical Quantities for Model Inputs 1195    |
| Supported Functions and Settings 1197                  |
|                                                        |
| Native Binary Data Files and Text Data Files<br>1199   |
| File Structure 1199                                    |
| Objects 1200                                           |
| Terminology<br>1200                                    |
| Text File Format 1201                                  |
| Binary File Format 1201                                |
| Serializable Classes<br>1202                           |
| BezierCurve 1202                                       |
| BezierSurf 1204                                        |
| BezierTri 1204                                         |
| BSplineCurve 1205                                      |
| BSplineSurf 1207                                       |
|                                                        |
| Ellipse 1208                                           |
| Geom1<br>1208                                          |
| Geom2<br>1209                                          |
| Geom3<br>1211                                          |
| GeomCurve 1214                                         |
| GeomSurf 1214                                          |
| Mesh 1214                                              |
| MeshCurve 1215                                         |
| MeshSurf 1216                                          |
| PolChain 1216                                          |
| Selection 1217                                         |
| Serializable 1218                                      |
| Straight 1218                                          |
| Transform 1218                                         |
| Example of the Serialization Format 1219               |
| Index<br>1223                                          |

# Introduction

1

This *COMSOL*® *Multiphysics Programming Reference Manual* details features and techniques that help you control COMSOL Multiphysics® using the application programming interface (API) for use with the Java® programming language. The COMSOL API can be used in the Application Builder, in model methods and the Shell window in the COMSOL Desktop®, in a model file for Java, and from the LiveLink*™ for* MATLAB® interface. If you are using the COMSOL API from the Application Builder, see also the *Application Programming Guide* for useful information when creating methods for applications.

#### In this chapter:

- **•** About the COMSOL API
- **•** Getting Started

# About the COMSOL API

You can use the COMSOL API to develop custom applications based on COMSOL. The easiest way to create such applications is by using the Application Builder available with the COMSOL software.

You can run Java class files with COMSOL API-based applications in different ways:

- **•** In the Application Builder as part of methods that you add using the Method Editor in the Application Builder's development environment (see also the *Application Programming Guide*).
- **•** From the COMSOL Desktop®. A model created using a class file appears automatically in the Desktop.
- **•** From a batch sequence in a study.
- **•** Using the comsol batch command.

You can create model methods for use with the Model Builder tree when creating and running COMSOL Multiphysics models in the COMSOL Desktop. The COMSOL Desktop also includes a Shell window, from which you can run COMSOL API commands.

The LiveLink™ *for* MATLAB® operates using the COMSOL API and additional utility M-file functions. See the *LiveLink™ for MATLAB* ®*User's Guide* for additional information.

Code examples for the individual API functions in this guide show what the code looks like when using Java® and when using the LiveLink™ *for* MATLAB®.

### *Additional COMSOL API Documentation*

You find additional COMSOL API documentation for specialized API commands, which is available with the Model Manager and with corresponding COMSOL products, in the following COMSOL documents:

- **•** The *Model Manager Reference Manual*.
- **•** The *CAD Import Module User's Guide*.
- **•** The *Design Module User's Guide*.
- **•** The *ECAD Import Module User's Guide*.
- **•** The CAD LiveLink™ products' *User's Guides*.

### *Where Do I Find More Information?*

A number of online resources have more information about COMSOL, including licensing and technical information. The electronic documentation, topic-based (or context-based) help, and the Application Libraries are all accessed through the COMSOL Desktop.

![](_page_17_Picture_19.jpeg)

If you are reading the documentation as a PDF file on your computer, the blue links do not work to open an application or content referenced in a different guide. However, if you are using the Help system in COMSOL Multiphysics, these links work to open other modules, application examples, and documentation sets.

#### **CONTACTING COMS OL BY EMAIL**

For general product information, contact COMSOL at info@comsol.com.