# About Geometry Commands

- **•** Features for Creating Geometric Primitives
- **•** Features for Geometric Operations
- **•** Features for Virtual Operations
- **•** Features for Mesh Control
- **•** Geometric Model Information Methods

![](_page_0_Picture_7.jpeg)

For documentation of additional geometry commands available in the Design Module, CAD Import Module, ECAD Import Module, and LiveLink™ for CAD products, see the documentation for each of those products.

![](_page_0_Picture_9.jpeg)

model.geom() — Methods for the main model.geom command.

# *Features for Creating Geometric Primitives*

Table 3-1 is an overview of the features for creating 3D geometric primitives:

TABLE 3-1: 3D GEOMETRIC PRIMITIVES.

| NAME              | DESCRIPTION                                                         |
|-------------------|---------------------------------------------------------------------|
| BezierPolygon     | Chain of connected line segments, quadratic curves, or cubic curves |
| Block             | Right-angled parallelepiped (box)                                   |
| Cone              | Right circular cone or cone frustum                                 |
| CubicBezier       | Rational Bézier curve of degree 3                                   |
| Cylinder          | Right circular cylinder                                             |
| ECone             | Oblique cone or cone frustum with elliptic base                     |
| Ellipsoid         | Ellipsoid                                                           |
| Helix             | Helix solid, surface, or curve                                      |
| Hexahedron        | Hexahedron bounded by bilinear faces                                |
| LineSegment       | Line segment between two vertices or points                         |
| ParametricCurve   | Curve defined by coordinate expressions                             |
| ParametricSurface | Surface defined by coordinate expressions                           |
| Point             | One or several points                                               |
| Polygon           | Chain of connected line segments                                    |
| Pyramid           | Rectangular pyramid                                                 |
| QuadraticBezier   | Rational Bézier curve of degree 2                                   |
| Sphere            | Sphere or ball                                                      |
| Tetrahedron       | Tetrahedron                                                         |
| Torus             | Torus                                                               |

Table 3-2 is an overview of the features for creating 2D geometric primitives:

TABLE 3-2: 2D GEOMETRIC PRIMITIVES.

| NAME            | DESCRIPTION                                                         |
|-----------------|---------------------------------------------------------------------|
| BezierPolygon   | Chain of connected line segments, quadratic curves, or cubic curves |
| Circle          | Circle or disc                                                      |
| CircularArc     | Circular arc                                                        |
| CubicBezier     | Rational Bézier curve of degree 3                                   |
| Ellipse         | Ellipse                                                             |
| LineSegment     | Line segment between two vertices or points                         |
| ParametricCurve | Curve defined by coordinate expressions                             |
| Point           | One or several points                                               |
| Polygon         | Chain of connected line segments                                    |
| QuadraticBezier | Rational Bézier curve of degree 2                                   |
| Rectangle       | Rectangle                                                           |
| Square          | Square                                                              |

Table 3-3 is an overview of the features for creating 1D geometric primitives:

TABLE 3-3: 1D GEOMETRIC PRIMITIVES.

| NAME     | DESCRIPTION                                     |
|----------|-------------------------------------------------|
| Interval | One interval, or a chain of connected intervals |
| Point    | One or several points                           |

# *Features for Geometric Operations*

The Import feature imports geometry objects from a file or from another geometry. The FromMesh feature constructs a geometry object from a (deformed) mesh.

Table 3-4 through Table 3-8 list the features that create new geometric objects from existing ones, Table 3-9 lists programming features for construction of geometry parts with conditionally active geometry features, for example.

TABLE 3-4: WORK-PLANE RELATED FEATURES (ONLY 3D, EXCEPT FOR CROSSSECTION).

| NAME         | DESCRIPTION                                                            |  |
|--------------|------------------------------------------------------------------------|--|
| WorkPlane    | Create a work plane for drawing 2D objects that are embedded into 3D   |  |
| Extrude      | Extrude planar faces in 3D                                             |  |
| Revolve      | Revolve planar faces in 3D                                             |  |
| Sweep        | Sweep one or several faces along a spine curve to create a solid in 3D |  |
| CrossSection | Create 2D geometry from intersection of 3D geometry with work plane    |  |

TABLE 3-5: BOOLEAN AND PARTITIONING OPERATIONS.

| NAME             | DESCRIPTION                                                                             |
|------------------|-----------------------------------------------------------------------------------------|
| Compose          | Compose geometry objects using a set formula                                            |
| Difference       | Subtract geometry objects from geometry objects                                         |
| Intersection     | Intersect geometry objects                                                              |
| Union            | Unite geometry objects                                                                  |
| Partition        | Partition a 2D or 3D geometry using tool objects or (3D only) a work plane              |
| PartitionDomains | Partition domains in 2D or 3D geometries along some partitioning lines, edges, or faces |

TABLE 3-5: BOOLEAN AND PARTITIONING OPERATIONS.

| NAME           | DESCRIPTION                                                                          |
|----------------|--------------------------------------------------------------------------------------|
| PartitionEdges | Partition edges in 2D or 3D geometries at some partitioning vertices along the edges |
| PartitionFaces | Partition faces in 3D geometries at some partitioning curves on the edges            |

See Compose, Union, Intersection, Difference for information about those Boolean operations.

TABLE 3-6: LINEAR TRANSFORMATIONS.

| NAME           | DESCRIPTION                                                              |
|----------------|--------------------------------------------------------------------------|
| Array          | Rectangular or linear array of geometry objects                          |
| Mirror         | Reflect objects in a plane (3D), a line (2D), or a point (1D)            |
| RigidTransform | Make a rigid transform (translation and rotation) of 3D geometry objects |
| Rotate         | Rotate geometry objects about a centerpoint                              |
| Scale          | Scale geometric objects about a centerpoint                              |
| Move           | Translate geometry objects                                               |
| Copy           | Make a displaced copy of geometry objects                                |

See Move, Copy for details about those linear transformations.

TABLE 3-7: OBJECT TYPE CONVERSIONS.

| NAME             | DESCRIPTION                                                 |
|------------------|-------------------------------------------------------------|
| ConvertToSolid   | Unite and convert objects to a single solid object          |
| ConvertToSurface | Unite and convert 3D objects to a single surface object     |
| ConvertToCurve   | Unite and convert 2D or 3D objects to a single curve object |
| ConvertToPoint   | Unite and convert objects to a single point object          |

See ConvertToSolid, ConvertToSurface, ConvertToCurve, ConvertToPoint for information about those conversion operations.

TABLE 3-8: OTHER OPERATIONS.

| NAME     | DESCRIPTION                                                                                                |
|----------|------------------------------------------------------------------------------------------------------------|
| Chamfer  | Chamfer corners in 2D geometry objects                                                                     |
| Fillet   | Fillet corners in 2D geometry objects                                                                      |
| Tangent  | Line segment tangent to an edge in 2D                                                                      |
| Delete   | Delete entities (domains, boundaries, edges, or points) from objects, or delete entire geometry<br>objects |
| Split    | Split geometry objects into their constituent entities                                                     |
| Finalize | Form union or assembly by combining all geometry objects                                                   |

TABLE 3-9: PROGRAMMING AND PARTS FEATURES.

| NAME                    | DESCRIPTION                                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------------------------------|
| If, ElseIf, Else, EndIf | Construct an If statement, enabling or disabling features depending on conditions in<br>terms of parameters |
| ParameterCheck          | Check the value of parameters.                                                                              |
| PartInstance            | Create an instance of a geometry part.                                                                      |

Table 3-10 lists the features that correspond to selections:

TABLE 3-10: SELECTIONS.

| NAME                  | DESCRIPTION                                                                       |
|-----------------------|-----------------------------------------------------------------------------------|
| AdjacentSelection     | Selection of entities or objects that are adjacent to given selections            |
| ExplicitSelection     | Explicit selection of entities or objects                                         |
| BallSelection         | Selection of entities or objects that (partly) lie inside a ball                  |
| BoxSelection          | Selection of entities or objects that (partly) lie inside a box                   |
| CylinderSelection     | Selection of entities or objects that (partly) lie inside a cylinder              |
| ComplementSelection   | Selection of entities or objects that is the complement of the input selections   |
| DifferenceSelection   | Selection of entities or objects that is the difference of the input selections   |
| IntersectionSelection | Selection of entities or objects that is the intersection of the input selections |
| UnionSelection        | Selection of entities or objects that is the union of the input selections        |

See BallSelection, BoxSelection, CylinderSelection, Disk Selection and UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection for information about those selections.

# *Features for Virtual Operations*

Table 3-11 lists the features that correspond to virtual operations:

TABLE 3-11: VIRTUAL GEOMETRY RELATED FEATURES (ONLY 2D AND 3D).

| NAME                | DESCRIPTION                                                                                                                 |
|---------------------|-----------------------------------------------------------------------------------------------------------------------------|
| IgnoreVertices      | Virtually remove isolated vertices or vertices adjacent to two edges only                                                   |
| IgnoreEdges         | Virtually remove isolated edges or edges adjacent to precisely two faces or between<br>two domains                          |
| IgnoreFaces         | Virtually remove isolated faces or faces between two domains                                                                |
| CompositeEdges      | Form virtual composite edges from sets of connected edges by ignoring the vertices<br>between the edges in each set         |
| CompositeFaces      | Form virtual composite faces from sets of connected faces by ignoring the edges<br>between the faces in each set            |
| CompositeDomains    | Form virtual composite domains from sets of connected domains by ignoring the<br>boundaries between the domains in each set |
| CollapseEdges       | Virtually collapse each edge into a vertex by merging its adjacent vertices                                                 |
| CollapseFaces       | Virtually collapse faces                                                                                                    |
| CollapseFaceRegions | Virtually detect and collapse regions of faces narrower than a specified size                                               |
| MergeEdges          | Virtually merge edges adjacent to face                                                                                      |
| MergeVertices       | Virtually merge one adjacent vertex of an edge with the other adjacent vertex                                               |
| RemoveDetails       | Automatically remove small details in a geometry by using virtual operations                                                |

# *Features for Mesh Control*

Table 3-12 lists the features that correspond to mesh control operations:

TABLE 3-12: MESH CONTROL RELATED FEATURES (ONLY 2D AND 3D).

| NAME                | DESCRIPTION                        |
|---------------------|------------------------------------|
| MeshControlVertices | Use vertices for mesh control only |
| MeshControlEdges    | Use edges for mesh control only    |
| MeshControlFaces    | Use faces for mesh control only    |
| MeshControlDomains  | Use domains for mesh control only  |

# *Geometric Model Information Methods*

Every geometry object in a geometry sequence, as well as the finalized geometry, have an associated GeomInfo object for which you can get information about the geometric model.

To get the GeomInfo object for a geometry object *<objtag>*, use:

```
GeomInfo info = model.component(<ctag>).geom(<tag>).obj(<objtag>);
```

To get the GeomInfo object for the finalized geometry or for the geometric model of a component that is defined by a mesh, use:

```
GeomInfo info = model.component(<ctag>).geom(<tag>).info();
```

For more information about getting information for meshes, see Information on the Geometric Model.

![](_page_4_Picture_11.jpeg)

For a GeomSequence whose component's geometric model is defined by a MeshSequence, the GeomInfo methods return information about that geometric model, not about the GeomSequence. The behavior in this case might change in a future version.

### **GENERAL INFORMATION**

TABLE 3-13: GENERAL GEOMETRY INFORMATION METHODS.

| METHOD         | DESCRIPTION                                                                                                                                                 |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| check          | Throw an exception if the geometry or mesh is invalid.                                                                                                      |
| getBoundingBox | Return bounding box as the bounding-box coordinates (xmin, xmax, ymin, ymax,).                                                                              |
| getSDim        | Get the space dimension.                                                                                                                                    |
| getType        | Get the geometry object type (solid, surface, curve, point, mixed, or empty).                                                                               |
| hasCadRep      | Check if this is a 3D geometry represented using the CAD kernel.                                                                                            |
| isAssembly     | Check if this is a geometry of assembly type (originating from a Form Assembly feature),<br>including virtual geometries based on a real assembly geometry. |
| isMesh         | Return true if this geometric model is represented by a mesh (rather than a geometry).                                                                      |
| isVirtual      | Return true if this is a virtual geometry.                                                                                                                  |

#### **GEOMETRIC ENTITY COUNTERS**

TABLE 3-14: GEOMETRIC ENTITY COUNTERS.

| METHOD           | DESCRIPTION                                                                     |
|------------------|---------------------------------------------------------------------------------|
| getNEntities     | Get number of entities of different dimensions                                  |
| getNVertices     | Get number of vertices                                                          |
| getNEdges        | Get number of edges                                                             |
| getNFaces        | Get number of faces                                                             |
| getNBoundaries   | Get number of boundaries                                                        |
| getNDomains      | Get number of domains                                                           |
| getNEntitiesMesh | Get number of entities of different dimensions in the geometry used for meshing |

#### **ADJACENCY**

TABLE 3-15: ADJACENCY BETWEEN GEOMETRIC ENTITIES.

| METHOD          | DESCRIPTION                             |
|-----------------|-----------------------------------------|
| getStartEnd     | Get start and end vertices of edges     |
| getUpDown       | Get up and down domain indices          |
| getUpDownExt    | Get up and down extended domain indices |
| getVertexDomain | Get domain index for isolated vertices  |
| getSD           | Get domain index for isolated vertices  |
| getAdj          | Get adjacency matrices                  |
| getAdjOrient    | Get adjacency orientation               |

# **EDGE EVALUATION**

TABLE 3-16: EDGE EVALUATION METHODS.

| METHOD         | NOTES | DESCRIPTION                   |
|----------------|-------|-------------------------------|
| edgeParamRange |       | Get parameter range of edge   |
| edgeX          | 1     | Evaluate coordinates.         |
| edgeDX         | 1     | Evaluate first derivative.    |
| edgeDDX        | 1     | Evaluate second derivative.   |
| edgeDDDX       | 1     | Evaluate third derivative.    |
| edgeNormal     | 1     | Evaluate normal vector in 2D. |

TABLE 3-16: EDGE EVALUATION METHODS.

| METHOD        | NOTES | DESCRIPTION             |
|---------------|-------|-------------------------|
| edgeCurvature | 1     | Evaluate curvature.     |
| edgeTorsion   | 1     | Evaluate torsion in 3D. |
|               |       |                         |

<sup>1</sup> For a mesh, the evaluation is done on a smooth interpolated edge curve.

#### **FACE EVALUATION**

TABLE 3-17: FACE EVALUATION METHODS.

| METHOD             | NOTES | DESCRIPTION                       |
|--------------------|-------|-----------------------------------|
| faceParamRange     | 1,2   | Get parameter ranges of face.     |
| faceX              | 1,2   | Evaluate coordinates.             |
| faceDX             | 1,2   | Evaluate first derivatives.       |
| faceDDX            | 1,2   | Evaluate second derivatives.      |
| faceNormal         | 1,2   | Evaluate normal vector.           |
| faceFF1            | 1,2   | Evaluate first fundamental form.  |
| faceFF2            | 1,2   | Evaluate second fundamental form. |
| faceGaussCurvature | 1,2   | Evaluate Gauss curvature.         |
| faceMeanCurvature  | 1,2   | Evaluate mean curvature.          |

<sup>1</sup> Not supported for geometric models defined by a mesh.

## **GEOMETRY REPRESENTATION ARRAYS**

TABLE 3-18: GET ARRAYS IN GEOMETRY REPRESENTATION.

| METHOD         | NOTES | DESCRIPTION                                               |
|----------------|-------|-----------------------------------------------------------|
| getVertex      | 1,3   | Get vertex matrix.                                        |
| getEdges       | 1,3   | Get edge matrix.                                          |
| getFaces       | 1,3   | Get face matrix.                                          |
| getPVertex     | 1,3   | Get parameter vertices (embeddings of vertices in faces). |
| getPEdge       | 1,3   | Get parameter edges (embeddings of edges in faces).       |
| getVertexCoord |       | Get vertex coordinates.                                   |

<sup>1</sup> Not supported for geometric models defined by a mesh.

![](_page_6_Picture_13.jpeg)

In the GeomSequence interface, the GeomInfo methods give information about the finalized geometry of the geometry sequence. However, for a GeomSequence whose component's geometric model is defined by a MeshSequence, the GeomInfo methods instead return information about that geometric model. The behavior in this case might change in a future version.

GeomSequence.obj gives information about a geometry object resulting from a geometry feature.

You can use GeomSequence.axisymmetric(boolean) to change its axisymmetry status.

<sup>2</sup> Only supported for faces that are not virtual.

<sup>3</sup> Only supported on geometry objects using the COMSOL kernel, and not for assembly geometries or virtual geometries.

# Working with a Geometry Sequence

This section describes how to construct geometries using Java® methods. A *geometry* is defined by a *geometry sequence* consisting of *geometry features*. Each feature generates a set of *output geometry objects* when you *build* the feature. An *operation feature* takes previously generated geometry objects as input and usually deletes them. You can create named selections by adding *selection features*. Each geometry sequence in 1D ends with a Finalize feature that forms a single output object by uniting all existing geometry objects. A geometry sequence in 2D or 3D also contains a Finalize feature, but in 2D and 3D it is possible to add features corresponding to *virtual operations* after the Finalize feature (see Virtual Operations for more information). The output object of the last feature of a sequence is referred to as the *finalized geometry*. The finalized geometry is used for meshing and physics modeling.

In 3D, you can also add work planes (see Work Planes for more information), where you can add 2D geometry sequences that build 2D geometries that you can use to embed, extrude, and revolve in the 3D geometry.

![](_page_7_Picture_3.jpeg)

# *Adding a Model Component (Geometry)*

To add a new geometry to the model object model, enter

```
model.component(<ctag>).geom().create(<tag>,sDim);
```

where *<tag>* is the geometry's tag (an identifier of your choice), and sDim is its space dimension (1, 2, or 3).

The geometry is added to the last created model component. If no model component exists in the model, a model component node tagged comp1 is automatically created for you. A physics interface using the geometry must belong to the same model component as the geometry.

You can change the model component of a geometry by entering

```
model.component(<ctag>).geom(<tag>);
```

where *<ctag>* is the tag of a component node.

# *Adding a Geometry Feature*

To add a feature to a geometry tagged *<tag>*, enter

```
model.component(<ctag>).geom(<tag>).create(<ftag>,ftype);
```

where *<ftag>* is the feature's tag (an identifier of your choice), and *ftype* is the feature's type. Feature types are capitalized and case-sensitive, for example Rectangle.

When you add a feature, it is inserted after the *current feature*. You can get the tag of the current feature type by entering

```
String ftag = model.component(<ctag>).geom(<tag>).current();
```

If ftag is the empty string, the current feature is the beginning of the geometry sequence, that is, the empty state before all features. When the feature has been added, it automatically becomes current, but it is not built automatically.

All properties in a new feature get a default value.

# *Editing a Geometry Feature*

To change a property value in a feature, enter

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
```

where *property* is a property name and *<value>* is a property value.

All numeric properties can be given either as a numeric value or as a string expression that can contain parameters defined in model.param(). When building the feature, the string expressions are evaluated using the current values of the parameters.

To get the value of a property, enter one of the following, depending on the type of the property:

```
double d = model.component(<ctag>).geom(<tag>).feature(<ftag>).getDouble(property);
String s = model.component(<ctag>).geom(<tag>).feature(<ftag>).getString(property);
double[] da = model.component(<ctag>).geom(<tag>).feature(<ftag>).
getDoubleArray(property);
String[] sa = model.component(<ctag>).geom(<tag>).feature(<ftag>).
getStringArray(property);
double[][] dm = model.component(<ctag>).geom(<tag>).feature(<ftag>).
getDoubleMatrix(property);
String[][] sm = model.component(<ctag>).geom(<tag>).feature(<ftag>).
getStringMatrix(property);
```

If you request a numerical value for a string property, it is evaluated using the current values of the parameters in model.param().

![](_page_8_Picture_12.jpeg)

- **•** get\* and Selection Access Methods
- **•** set()

#### **SELECTIONS**

There are primitive features and operation features. Operations features take existing geometry objects as input and create new geometry objects from them. The input objects are usually specified in the input selection:

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("input").
   set(inputObjects);
```

where inputObjects is a string array with object or feature names. If inputObjects contains a feature name, it refers to all objects generated by this feature. If you have defined a named selection of objects, you can refer to it using the named method (see Selection Features below).

![](_page_8_Picture_19.jpeg)

Geometry Object Selection Methods

Usually, the input objects of an operation feature is removed when building the feature. To change this behavior, a property keep is available for many operations features. If keep is set to on, the input objects are kept when building the feature.

#### **ATTRIBUTES**

Attributes are string values that can be assigned to geometric entities or geometry objects. The available attributes are described in Geometry Attribute Methods. To set an attribute on all resulting objects of a feature, enter

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(<attribute>,<value>);
```

To get the attribute value set in a feature, enter

```
String value = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   getAttribute(<attribute>);
```

For a work plane, you can in addition set and get attributes on the 2D features in the Plane Geometry sequence as follows, for example:

```
model.component("comp1").geom("geom1").feature("wp1").geom().feature("r1").
   setAttribute("construction", "on");
String value = model.component("comp1").geom("geom1").feature("wp1").geom().
   feature("r1").getAttribute("construction");
```

# *Building Geometry Features*

To generate the output objects of a feature, you must *build* the feature. Enter

```
model.component(<ctag>).geom(<tag>).run(<ftag>);
```

to build the feature *<ftag>* and all its preceding features (the features are built in the order from the first to the last). When the build has completed, the feature *<ftag>* becomes current.

To build all preceding features of the feature *<ftag>*, enter

```
model.component(<ctag>).geom(<tag>).runPre(<ftag>);
```

To build all features, including the Finalize feature and the virtual operations, enter

```
model.component(<ctag>).geom(<tag>).run();
```

![](_page_9_Picture_16.jpeg)

If the current feature was before the Finalize feature, this operation sets the current feature to be the feature preceding Finalize.

# **ERRORS**

If an error occurs when building a feature, the build stops, and the feature before the failing feature becomes current. The failing feature gets an *error feature* appended, which contains the error message. To access the error message, enter

```
String msg = model.component(<ctag>).geom(<tag>).feature(<ftag>).message();
```

To access the error feature, its message and detailed message, enter

```
String msg = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   problem("error").getString("message");
String det = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   problem("error").getString("details");
```

## **WARNINGS**

After a successful build, a feature can get warning features appended, which contain warning messages. To access the first warning message, enter

```
String msg = model.component(<ctag>).geom(<tag>).feature(<ftag>).message();
```

To access the warning features, their messages and detailed messages, enter

```
String msg = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   problem(<wtag>).getString("message");
String det = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   problem(<wtag>).getString("details");
```

where *<wtag>* is warning1, warning2, and so on.

#### **RETRIEVING INFORMATION ABOUT THE LATEST BUILD**

The following methods are available to retrieve the information specific to the build of a geometry feature.

To see the COMSOL version number (and architecture) used for the latest build of the feature *<ftag>*, use

```
String version = model.component(<ctag>).geom(<tag>).feature(<ftag>).
buildComsolVersion();
```

To get access to the date and time of the last time a feature was built, enter

```
String date = model.component(<ctag>).geom(<tag>).feature(<ftag>).buildDate();
```

The methods above return empty strings if the feature has not yet been built. Use

```
int time = model.component(<ctag>).geom(<tag>).feature(<ftag>).buildTime();
```

to get the time (in seconds) it took to build the feature the last time it was built. In case the feature has not been built, it will return -1.

# *Feature Status*

The *status* of a feature can be one of the following:

- **•** *Built* or *warning.* This means that the none of the feature's properties have changed since the feature was last built, and the features of the input objects are all built. If the status is *warning*, the feature contains warning messages.
- **•** *Edited*. This means that some of the feature's properties have changed since the feature was last built.
- **•** *Needs rebuild*. This means that the feature generating some input object is not built.
- **•** *Error*. This means that the feature contains an error message.

You can examine the status of a feature by entering

```
String status = model.geom(<tag>).feature(<ftag>).status();
```

# *Accessing Geometry Object Names*

Each feature produces one or several output geometry objects. To get the names of these objects, enter

```
String[] oNames = model.component(<ctag>).geom(<tag>).feature(<ftag>).objectNames();
```

To get the names of all currently existing geometry objects (the geometry objects that were generated by the last build), enter

```
String[] oNames = model.component(<ctag>).geom(<tag>).objectNames();
```

To access one of these objects, you can enter

```
GeomObject go = model.component(<ctag>).geom(<tag>).obj(<objname>);
```

where the string *<objname>* is an object name. If *<objname>* does not exist in the current state, you get an error message. You can get information about the geometry object go by using the *geometry information methods*, for example,

#### Geometry Object Information

To access the finalized geometry (the output of the last feature), use

```
model.component(<ctag>).geom(<tag>)
```

## **NAMING OF GEOMETRY OBJECTS**

The names of the output objects of a feature are formed by appending characters after the feature's tag, in one of the following ways:

- **•** ftag(index). For example, split1(1), split1(2), split1(3) if the feature tagged split1 has three output objects. This method is used for most features.
- **•** ftag(i1,i2,...). For example, arr1(1,1), arr1(1,2), arr(2,1), arr1(2,2) for a 2-by-2 array feature tagged arr1. This method is only used for the Array feature.
- **•** ftag.objectNameIn2D. For example, wp1.r1, wp1.pt1(1), wp1.pt1(2) if the work-plane feature wp1 contains the 2D objects r1, pt1(1), and pt1(2). This method is only used for the WorkPlane feature.
- **•** ftag.objectNameIn3D. For example, cro1.blk1 and cro1.cyl1. This method is used for the CrossSection feature.
- **•** ftag.objectName. This method can be used for the Import feature, and then objectName is taken from the CAD file.

# *Deleting and Disabling Geometry Features*

To delete a feature, enter

```
model.component(<ctag>).geom(<tag>).feature().remove(<ftag>);
```

To disable a feature, enter

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).active(false);
```

The disabled feature does not affect the finalized geometry — its output is empty. To enable a disabled feature, enter

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).active(true);
```

You can get the enabled/disabled status of a feature by entering

```
boolean isEnabled = model.component(<ctag>).geom(<tag>).feature(<ftag>).active();
```

# *Deleting Geometry Objects*

You can use the following operation to delete objects from the geometry sequence.

```
model.component(<ctag>).geom(<tag>).delete(String[]);
```

In the input string array you specify the names of the objects to delete. The operation deletes objects that correspond to primitive geometry features by removing these features from the sequence. The operation then deletes the remaining objects by adding and building a Delete feature with the objects in its selection.

![](_page_11_Picture_25.jpeg)

When using the delete operation the status of the current feature and all its preceding features must be built.

You can use the following operation to delete some edges from a Polygon or CompositeCurve object in a 2D geometry:

```
String[] remaining = model.component(<ctag>).geom(<tag>).deleteEdges(<objname>, <edges>);
```

This operation deletes the given edges by using a combination of the following methods:

- **•** Removing the geometry feature.
- **•** Removing points from a Polygon feature.
- **•** Splitting a Polygon or Composite Curve feature into several features.

The return array contains the tags of the remaining (if any) and created (if any) features.

# *Moving and Scaling Geometry Objects*

You can use the following operations to move or scale objects from the geometry sequence.

```
model.component(<ctag>).geom(<tag>).move(String[] obj, double[] dist);
model.component(<ctag>).geom(<tag>).
   scale(String[] obj, double[] factor, double[] center);
model.component(<ctag>).geom(<tag>).scale(String[] obj, double factor, double[] center);
```

The input array obj specifies the objects to move or scale. The dist array specifies the move distance in each axis direction. The factor array specifies an anisotropic scaling and the factor scalar specifies an isotropic scaling. The center array specifies the scaling centerpoint. When possible, the move and scale operations modify the corresponding geometry features in the sequence. Not all features can be moved or scaled by modifying their properties, in which case move or scale features are added to the geometry sequence instead.

![](_page_12_Picture_11.jpeg)

When using the move or scale operations the status of the current feature and all its preceding features must be built.

# *Plotting a Geometry Sequence*

Use the image().plot() method for plotting the geometry sequence in a window:

```
model.geom("geom1").image().plot();
```

See Plotting and Exporting Images for more information.

# *Geometry Attribute Methods*

Attributes are string values that can be assigned to geometric entities or geometry objects. Currently, there are only two types of attributes:

- **•** The Construction geometry attribute. See Construction Geometry for more information.
- **•** The PCB component attribute that can appear when importing components from some ECAD files. The PCB component attribute also has a field that has the tag package. This field assigns a component type to each component.

Get the type of the attribute, for example Construction or PCBComponent. The method returns a string.

```
model.geom(<gtag>).attribute(<atag>).getType();
```

where *<atag>* is the tag of the attribute, for example imp1.component.

Get the tag/name of the attribute, for example construction, imp1.component. The method returns a string.

```
model.geom(<gtag>).attribute(<atag>).tag();
```

Get the (localized) label of the attribute, for example Construction geometry or PCB component. The method returns a string.

```
model.geom(<gtag>).attribute(<atag>).label();
```

Get the whole objects that have the given attribute value *<value>* in the current state of the geometry sequence. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).objects(<value>);
```

Get the objects that have some entity in dimension *<dim>* that have the given attribute value*<value>* in the current state of the geometry sequence. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).objects(<value>, <dim>);
```

Get the entities in dimension *<dim>* in the object *<oname>* that have the given attribute value *<value>* in the current state of the geometry sequence. The method returns an integer array.

```
model.geom(<gtag>).attribute(<atag>).entities(<value>, <oname>, <dim>);
```

For the finalized geometry: Get the entities in dimension *<dim>* that have the given attribute value *<value>*. The method returns an integer array.

```
model.geom(<gtag>).attribute(<atag>).entities(<value>, <dim>);
```

Get all values of the attribute that exist in the current state of the geometry sequence. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).values();
```

Get all values of the attribute that exist in the finalized geometry. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).valuesFinal();
```

Get all tags of the fields of the attribute. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).fieldTags();
```

Get the field value of a given field for a given attribute value. The method returns a string.

```
model.geom(<gtag>).attribute(<atag>).fieldValue(<attributeValue>, <fieldTag>);
```

# Geometry Settings

You can control the following general settings for a geometry:

- **•** Length Unit
- **•** Angular Unit
- **•** Scale Values When Changing Unit
- **•** Geometry Representation in 3D and for Boolean Operations
- **•** Default Repair Tolerances
- **•** Automatic Rebuild
- **•** Constraints and Dimensions. (with the Design Module)

# *Length Unit*

The default length unit is meter. To change the length unit, enter

```
model.component(<ctag>).geom(<tag>).lengthUnit(newLengthUnit);
where newLengthUnit is a string like "mm", "in", or "ft".
```

To get the current length unit, enter

```
String currentUnit = model.geom(<tag>).lengthUnit();
```

The length unit is used in fields for lengths and for visualization of the geometry. In fields you can override the unit (for example, by entering 13[mm]). When solving the model, all lengths are converted to meters.

# *Angular Unit*

The default angular unit is degrees. To change the angular unit, enter

```
model.component(<ctag>).geom(<tag>).angularUnit(newAngularUnit);
```

where *newAngularUnit* is deg or rad.

To get the current angular unit, enter

```
String currentUnit = model.component(<ctag>).geom(<tag>).angularUnit();
```

The angular is used in fields for angles. You can override the unit, for example by entering 0.3[rad]. Numeric inputs and outputs of trigonometric functions are always assumed to be in radians, though.

# *Scale Values When Changing Unit*

When you change the length unit or angular unit there are two possibilities to interpret pure numeric values in the geometry and meshing sequences. The first possibility is to reinterpret the numeric value in the new unit; a circle of radius 1.0 (meter) becomes a circle of radius 1.0 (millimeter), assuming the length unit changes from meter to millimeter.

The other possibility is to scale the numbers; a circle of radius 1.0 (meter) becomes a circle of radius 1000.0 (millimeter). To control the behavior, use

```
model.component(<ctag>).geom(<tag>).scaleUnitValue(newScaleValue);
```

where *newScaleValue* is true if you want values to be scaled, and false otherwise. The default value is false.

To get the currently used method, enter

```
boolean currentScaleValue = model.component(<ctag>).geom(<tag>).scaleUnitValue();
```

# *Geometry Representation in 3D and for Boolean Operations*

This settings is only relevant if you have a license for the CAD Import Module. The geometry representation determines which kernel (geometric modeler) that COMSOL uses to represent and operate on the geometry objects: the CAD Import Module's kernel (Parasolid) or COMSOL's own kernel. To change the geometry representation, enter

```
model.component(<ctag>).geom(<tag>).geomrep(newGeomRep);
where newGeomRep is comsol or cadps.
```

- **•** If you choose cadps, all objects and operations that support the CAD kernel (Parasolid kernel) use it. For example, the Work Plane, Extrude, and Revolve features currently do not support this kernel.
- **•** If you choose comsol, all objects are represented using the COMSOL kernel.

When you change the geometry representation, all nodes that support the CAD kernel get an *edited* status. To rebuild the geometry using the new kernel, use the run method.

To get the geometry representation of the geometry sequence *<tag>*, enter

```
model.component(<ctag>).geom(<tag>).geomrep();
```

When you create a new model (application), its default geometry representation is controlled by the preference setting **Geometry>Geometry representation>In new applications** (geometry.geomrep.default). To change or read this preference setting, enter

```
ModelUtil.setDefaultGeometryKernel(defaultGeomRep);
  ModelUtil.getDefaultGeometryKernel();
where defaultGeomRep is cadps or comsol.
```

When you open an existing model, you normally use the geometry representation used in the model. To always convert the geometry to the COMSOL kernel, change the preference setting **Geometry>Geometry representation> When opening an existing application** to **Convert to COMSOL kernel** (geometry.geomrep.open). To change or read this preference setting, enter

```
ModelUtil.setOpenGeometryKernel(openGeomRep);
ModelUtil.getOpenGeometryKernel();
```

where *openGeomRep* is model or comsol.

#### **USING THE DESIGN MODULE BOOLEAN OPERATIONS**

When you use the CAD kernel in 3D and the license includes the Design Module, you can use the Boolean operations from the Deign Module kernel (Parasolid kernel) by entering

```
model.component(<ctag>).geom(<tag>).designBooleans(true);
```

The default setting for Design Module Boolean operations is controlled by the preference setting **Geometry>Design Module Boolean operations>Use in new models**.

# *Default Repair Tolerances*

The repair tolerance for the applicable geometry operations can be of three types: automatic (the default), relative, or absolute. The automatic repair tolerance provides suitable settings when using the CAD kernel; when using the COMSOL kernel, it sets a relative repair tolerance of 1e-6. You specify the default repair tolerance type by entering:

```
model.component(<ctag>).geom(<tag>).repairTolType(<newRepairTolType>)
```

where *<newRepairTolType>* is any of auto, relative, or absolute.

The *default relative repair tolerance* is 1e-6 (it can be any positive scalar value smaller than 0.1). You can change it by entering

```
model.component(<ctag>).geom(<tag>).repairTol(<newRelativeRepairtol>);
```

When doing so, the software also sets the repairTolType to relative. To get the current default relative repair tolerance, enter

```
double reptol = model.component(<ctag>).geom(<tag>).repairTol();
```

The *default absolute repair tolerance* is 1e-6 (it can be any positive scalar value). You can change it by entering

```
model.component(<ctag>).geom(<tag>).absRepairTol(<newAbsoluteRepairtol>);
```

When doing so, the software also sets the repairTolType to absolute. To get the current default absolute repair tolerance, enter

```
double reptol = model.component(<ctag>).geom(<tag>).absRepairTol();
```

The default repair tolerance is the default value that is used when you add a new feature that has the repair tolerance properties — for example, Boolean operations and conversions. Changing the default repair tolerance does not affect the tolerances in existing features. Adjust the repair tolerance if you experience problems with a Boolean operation.

# *Automatic Rebuild*

The autoRebuild setting controls if the geometry sequence is automatically rebuilt when clicking a node in the model tree outside the geometry sequence. You can change it by entering:

```
model.component(<ctag>).geom(<tag>).autoRebuild(<newAutoRebuild>);
```

The default geometry representation is controlled by the preference setting **Geometry>Automatic rebuild when leaving geometry>Default in new geometries**.

The autoBuildNew setting controls if certain geometry operations will be built automatically when you add them, provided that you have preselected a sufficient number of entities or objects. You can change it by entering:

```
model.component(<ctag>).geom(<tag>).autoBuildNew(<AutoBuildNew>);
where <AutoBuildNew> is true or false.
```

The default for building geometry operations automatically is controlled by the preference setting **Geometry>Build new operations automatically>Default in new geometries**.

*Constraints and Dimensions.*

where *<newAutoRebuild>* is on or off.

![](_page_16_Picture_19.jpeg)

These settings are only available if the geometry is 2D and you have a license for the Design Module.

To enable or disable the constraints and dimensions functionality, enter

```
model.component(<ctag>).geom(<tag>).useConstrDim(enable);
```

To determine whether the constraints and dimensions functionality is enabled, enter

boolean enabled = model.component(*<ctag>*).geom(*<tag>*).useConstrDim();

model.component(*<ctag>*).geom(*<tag>*).constrDimBuild(value) determines what constraint and dimension features to use when building the geometry. Valid values are:

- **•** "all": All (enabled) constraint and dimension features are used. This is the default.
- **•** "none": No constraint and dimension features are used.
- **•** "uptotarget": All (enabled) constraint and dimension features up to the feature to build are used.

String value = model.component(*<ctag>*).geom(*<tag>*).constrDimBuild() returns the constraints and dimensions to use when building. The default is "all".

String status = model.component(*<ctag>*).geom(*<tag>*).constrDimStatus() gets a description of the overall status of the constraints and dimensions.

# Work Planes

In 3D, you can create 3D objects by defining 2D objects in *work planes* and then *extruding* and *revolving* these into 3D objects. You can also get a *cross section* 2D object by intersecting a 3D object with the work plane.

To add a WorkPlane feature, use

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"WorkPlane");
```

You access a work planes 2D geometry sequence by the geom() method. To add a 2D feature to a work plane, use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).geom().create(*<ftag1>*,*ftype*); where *<ftag>* refers to a WorkPlane feature and *ftype* refers to a 2D feature type.

![](_page_18_Picture_5.jpeg)

The Finalize feature is optional for work planes but is necessary if you want to add virtual operations to the work plane sequence. It then needs to be created, as specified in Finalize.

A work plane's geometry sequence inherits its settings from its 3D sequence.

![](_page_18_Picture_8.jpeg)

For more information on the settings for a geometry sequence see Geometry Settings.

When you build a work-plane feature, its corresponding 2D sequence builds automatically and the geometry objects defined by the 2D sequence *embed* into 3D geometry objects in the 3D sequence. You can then extrude or revolve these embedded point, curve, or surface objects into curve, surface, or solid objects, respectively, using Extrude or Revolve features, respectively.

![](_page_18_Picture_11.jpeg)

Methods on model.component(*<ctag>*).geom(*<tag>*) can also be used on model. component(*<ctag>*).geom(*<tag>*).feature(*<wptag>*).geom().

# Selections of Geometric Entities

![](_page_19_Picture_1.jpeg)

The following sections contains information about selections of geometric entities in geometry objects; that is, those geometry objects (such as geometry primitives) and the entities that they consist of, which is useful for the preprocessing stages. For information about selection of geometric entities in the finalized geometry (domains, boundaries, edges, and points) used for specifying materials and physics, for example, see Selections and model.selection().

# *Named Selections*

You can create named selections of entities in geometry objects or of whole geometry objects in two ways:

- **•** By setting the selresult property to on in an arbitrary geometry feature. This creates a selection containing the feature's output objects, and derived selections of entities for each entity type (domain, boundary, edge, and point). For the Import feature, there is an additional selindividual property, which creates selections corresponding to individual geometry objects.
- **•** By adding a selection feature, see Using Selection Features. If this defines a selection of whole objects, derived selections of entities are also created for each entity type (domain, boundary, edge, and point).

You get the tags of the created named selections by

```
String[] selTags = model.component(<ctag>).geom(<tag>).feature(<ftag>).
outputSelection();
```

You can access a named selection by model.geom(*<gtag>*).selection(*<seltag>*), where *<seltag>* is the selection's tag. Usually, *<seltag>* is the same as the tag of the feature that created the selection, but derived selections of entities have a suffix .dom, .bnd, .edg, or .pnt.

You can use a named selection as an input selection in a geometry feature that comes after the feature that created the selection in the geometry sequence, as follows:

```
model.component(<ctag>).geom(<gtag>).feature(<ftag2>).selection(<propname>).
named(<trimmedseltag>);
```

Here, *<trimmedseltag>* is the selection's tag without the suffix.

Each named selection of entities in the geometry sequence can also be used as a named selection on the finalized geometry. You can access this named selection by model.component(*<ctag>*).selection(*<gtag>*\_*<seltag>*). However, if the selection was derived from a selection of whole objects, you access the corresponding selection on the finalized geometry by model.component(*<ctag>*).selection(*<gtag>*\_*<trimmedseltag>*\_*<lvl>*), where *<lvl>* is one of dom, bnd, edg, or pnt. Named selections on the finalized geometry are described in model. selection().

To get the selected objects for a named selection, use

```
String[] so = model.component(<ctag>).geom(<gtag>).selection(<seltag>).objects();
```

# *Using Selection Features*

A selection features in the geometry sequence creates a selection of geometric entities or objects that is a subset of all entities or objects that were generated by the sequence of features preceding the selection feature.

**•** Use the ExplicitSelection feature to create a selection of entities or objects that you specify explicitly.

- **•** Use the BallSelection, BoxSelection, CylinderSelection, or DiskSelection feature to create a selection of entities or objects that partly or completely lie inside a given ball, box, cylinder, or disk. The input entities or objects to select among can be all entities or objects generated by the preceding features, or a subset of these entities or objects defined by a set of input selections.
- **•** Use the UnionSelection, IntersectionSelection, DifferenceSelection, and ComplementSelection features to combine a set of input selections using a Boolean operation.
- **•** Use AdjacentSelection to create a selection of entities of a given dimension that are adjacent to entities in a set of input selections.

When using input selections, the input selections must be defined by features that come before the selection feature in the geometry sequence. You set the input selections in the input property (add and subtract for DifferenceSelection), where you use trimmed tags (that is, tags without the suffix) to refer to the input selections. Usually, the trimmed tag is the same as the tag of the feature that defined the input selection. It can happen that an input selection selects entities or objects that no longer exist after building the feature preceding the selection feature. In this case, the input selection is interpreted by using an associative mapping to existing entities or objects.

# *Cumulative Selections*

```
To create a cumulative selection tagged <seltag>, use
```

To make a geometry feature contribute its selection to a cumulative selection, use

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).set("contributeto",<seltag>);
```

model.component(*<ctag>*).geom(*<tag>*).selection().create(*<seltag>*,"CumulativeSelection");

To remove the contribution of a geometry feature to a cumulative selection, use

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).set("contributeto","none");
```

To control whether the cumulative selection is available outside the geometry sequence, use

```
model.component(<ctag>).geom(<tag>).selection(<seltag>).show(<boolean>);
```

To query whether the cumulative selection is available outside the geometry sequence, use

```
boolean show = model.component(<ctag>).geom(<tag>).selection(<seltag>).show();
```

# *Vectorized Selections of Geometric Entities*

For all selections of geometric entities, you can use the add method in a way that the following example demonstrates:

```
model.view("view1").hideObjects("hide1").add(new String[]{"arr1(2,1,1)", "arr1(3,1,1)"}, 
new int[][]{{1, 2, 3, 4, 5, 6}, {1, 2, 3, 4});
```

This code adds all given entities for each object to the selection. In the same way, you can use vectorized calls to the set and remove methods.

# Geometry Cleanup

In 3D it is possible to remove small details in the geometry by running a *geometry cleanup*. Gaps, narrow domain regions, narrow face regions, sliver faces, small faces, and short edges that are smaller than the estimated, or manually set, detail size are considered to be small details and are therefore considered unwanted. This will typically reduce the number of elements in the mesh and therefore reduce computation time and memory consumption. If the geometry is a single vertex, cleanup is not available.

To access the cleanup tool for the geometry *<gtag>*, enter

```
model.geom(<gtag>).cleanup();
```

To estimate the detail size that is used for the geometry analysis and automatic cleanup, use the method below. Details smaller than the returned value are considered unwanted by default.

```
model.geom(<gtag>).cleanup().estimateDetailSize();
```

It is possible to manually set a different detail size using the detailsize property.

```
model.geom(<gtag>).cleanup().set("detailsize",<value>);
```

The default value is 0 or an estimated detail size. The detail size *<value>* must be larger than 1e-6 times the size of the geometry and less then 0.1 times the size of the geometry. If *<value>* is set to 0 when you run the analysis or automatic cleanup, it will be set to the estimated detail size.

To run the geometry analysis to detect small details with the current detail size, use the method below.

```
model.geom(<gtag>).cleanup().analyze();
```

Use the method below to get the time it took to analyze or clean up the geometry. It returns -1 if the analysis has not been built.

```
model.geom(<gtag>).cleanup().buildTime();
```

Get a list of all detail types that were found in the last analysis by entering

```
model.geom(<gtag>).cleanup().details();
```

and get the estimated max and min size for each detail of the specified type *<type>* that were found in the last analysis by entering

```
model.geom(<gtag>).cleanup().detailSizes(<type>);
```

To run automatic cleanup with the current detail size, enter

```
model.geom(<gtag>).cleanup().run();
```

To revert changes to the model done by cleanup, enter

```
model.geom(<gtag>).cleanup().revert();
```

The automatic cleanup can add Mesh-Based Geometries for some of the cleaning. See Using Mesh-Based Geometries for more information.

# Virtual Operations

# *About Virtual Operations*

In 2D and 3D it is possible to reduce the number of vertices, edges, faces, and domains of the geometry by using *virtual operation features*. To add the first virtual operation feature to a sequence you need to build the finalize feature by entering

```
model.component(<ctag>).geom(<tag>).run("fin");
```

You can then add the virtual operation feature by entering

```
model.component(<ctag>).geom(<tag>).create(<ftag>,ftype);
```

where *<ftag>* is the feature's tag (an identifier of your choice), and *ftype* is the feature's type. To build the feature, enter

```
model.component(<ctag>).geom(<tag>).run(<ftag>);
```

To build all features, including the finalize feature and all virtual operation features, and to create the finalized geometry, enter

```
model.component(<ctag>).geom(<tag>).run();
```

The finalized geometry of a sequence that contains virtual operation features is referred to as a *virtual geometry*. If you form a composite edge, face, or domain by using a CompositeEdges, CompositeFaces, or CompositeDomains feature, respectively (or the analogues IgnoreVertices, IgnoreEdges, or IgnoreFaces features) the resulting edge, face, or domain is referred to as a *virtual composite edge*, *virtual composite face*, or *virtual composite domain*, respectively, or more generally, a *virtual composite entity*.

# *Mesh Control Entities*

Sometimes it is desirable to use certain geometric entities only when constructing the mesh. For example, you can add a curve inside a domain to control mesh element size there. If you mark this curve as a *mesh control entity*, it is not included in the geometry used when defining the physics. An advantage is that the final mesh need not respect this curve exactly; it is used only to control element size. You can use the keepformesh property of the Composite and Ignore features described above to define mesh control entities. Alternatively, you can use the MeshControlDomains, MeshControlVertices, MeshControlEdges, or MeshControlFaces features.

# Geometry Object Information

You can get the geometry object named *<objname>* via

model.component(*<ctag>*).geom(*<tag>*).obj(*<objname>*)

![](_page_23_Picture_3.jpeg)

Accessing Geometry Object Names

The geometry itself,

model.component(*<ctag>*).geom(*<tag>*)

works as an object, namely the final geometry resulting from the sequence. To get information about these objects, you can apply the methods described in this section.

![](_page_23_Picture_8.jpeg)

A geometry part does not have a finalized geometry, so these methods are not applicable for geometry parts. See Creating and Using Geometry Parts for information about applicable methods when working with geometry parts.

# *General Information*

TABLE 3-19: GENERAL GEOMETRY INFORMATION METHODS.

| METHOD           | OUTPUT TYPE    |
|------------------|----------------|
| check()          | void           |
| exists()         | Boolean        |
| getBoundingBox() | double[sdim*2] |
| getSDim()        | int            |
| getType()        | String         |
| hasCadRep()      | Boolean        |

- **•** check() issues an exception if the object is invalid.
- **•** exists() returns true if an object exists.
- **•** getBoundingBox() returns a bounding box for the object in the order xmin, xmax, ymin, ymax, zmin, and zmax.
- **•** getSDim() returns the space dimension of the geometry.
- **•** getType() returns the object type: solid, surface, curve, point, mixed, or empty.
- **•** hasCadRep() returns true if the object is represented using the CAD kernel (Parasolid).

The following geometric entity counter methods are available:

TABLE 3-20: GEOMETRIC ENTITY COUNTER METHODS.

| METHOD             | 1D | 2D | 3D | OUTPUT TYPE |
|--------------------|----|----|----|-------------|
| getNEntities()     | √  | √  | √  | int[]       |
| getNVertices()     | √  | √  | √  | int         |
| getNEdges()        | √  | √  | √  | int         |
| getNFaces()        |    |    | √  | int         |
| getNBoundaries()   | √  | √  | √  | int         |
| getNDomains()      | √  | √  | √  | int         |
| getNEntitiesMesh() | √  | √  | √  | int[]       |

- **•** getNEntities returns a vector of length 2 in 1D, length 3 in 2D, and length 4 in 3D. The vectors contain the number of geometric entities for each entity dimension. The methods getNVertices, getNEdges, getNFaces, getNBoundaries, and getNDomains return the number of entities of the specified type.
- **•** getNEntitiesMesh returns a vector of length 2 in 1D, length 3 in 2D, and length 4 in 3D. The vectors contain the number of geometric entities for each entity dimension in the geometry used for meshing. If there are no mesh control entities in the geometry, the output is identical to that of getNEntities.

# *Adjacency*

The following geometry adjacency information methods are available:

TABLE 3-21: GEOMETRY ADJACENCY INFORMATION METHODS.

| METHOD                    | 1D | 2D | 3D | OUTPUT TYPE |
|---------------------------|----|----|----|-------------|
| getStartEnd()             | √  | √  | √  | int[2][]    |
| getUpDown()               | √  | √  | √  | int[2][]    |
| getUpDownExt()            | √  | √  | √  | int[2][]    |
| getVertexDomain()         |    | √  | √  | int[]       |
| getSD()                   |    | √  | √  | double[]    |
| getAdj(int,int)           | √  | √  | √  | int[][]     |
| getAdj(int,int,int)       | √  | √  | √  | int[]       |
| getAdjOrient(int,int)     | √  | √  | √  | int[][]     |
| getAdjOrient(int,int,int) | √  | √  | √  | int[][]     |

- **•** getStartEnd returns the start and end vertices of all edges in the first and second row of the returned matrix.
- **•** getUpDown returns the up and down domain number for all boundaries in the first and second row of the returned matrix. All void regions have the domain number 0.
- **•** getUpDownExt returns the up and down domain number for all boundaries in the first and second row of the returned matrix, using an extended domain numbering where void regions have different domain numbers. The infinite void region has domain number 0. The finite void regions have negative domain numbers. However, if voidsAreLabeled() returns false, the extended domain numbering is not available, and then all void regions have domain number 0.
- **•** getVertexDomain returns the domain index for each vertex. For nonisolated vertices, the domain index is -1.
- **•** getSD returns the domain index for each vertex. For nonisolated vertices, the domain index is NaN.

- **•** a = getAdj(fromDim, toDim) returns a matrix where a[fromIdx]=getAdj(fromDim,toDim,fromIdx) contains the entities in dimension toDim that are adjacent to entity fromIdx in dimension fromDim.
- **•** ao = getAdjOrient(fromDim, toDim) returns a matrix where ao[fromIdx]=getAdjOrient(fromDim, toDim,fromIdx) contains the orientation flag for the entities in getAdj(fromDim,toDim,fromIdx). The orientation flag is 1 if the adjacent entities have the same orientation, and -1 if they have the opposite orientation, and 2 if the relative orientation cannot be determined (for instance, for an edge interior to a face).

# *Evaluation on an Edge*

The following edge evaluation methods are available in 2D and 3D:

TABLE 3-22: EDGE EVALUATION METHODS IN 2D AND 3D.

| METHOD                       | 2D | 3D | OUTPUT TYPE |
|------------------------------|----|----|-------------|
| edgeParamRange(int)          | √  | √  | double[2]   |
| edgeX(int, double[])         | √  | √  | double[][D] |
| edgeDX(int, double[])        | √  | √  | double[][D] |
| edgeDDX(int, double[])       | √  | √  | double[][D] |
| edgeDDDX(int, double[])      | √  | √  | double[][D] |
| edgeNormal(int, double[])    | √  |    | double[][D] |
| edgeCurvature(int, double[]) | √  | √  | double[]    |
| edgeTorsion(int, double[])   |    | √  | double[]    |

The first input argument of all methods is the edge number. The second input argument, when it exists, is an array of parameter values for which to perform evaluation on the edge. For all but the first method, the first index in the output corresponds to the different parameter values, and the second index corresponds to the spatial coordinates.

- **•** edgeParamRange returns the parameter range for evaluation on the edge.
- **•** edgeX evaluates the parameters to coordinate values.
- **•** edgeDX evaluates the parameters to first-order derivative values.
- **•** edgeDDX evaluates the parameters to second-order derivative values.
- **•** edgeDDX evaluates the parameters to second-order derivative values.
- **•** edgeDDDX evaluates the parameters to third-order derivative values.
- **•** edgeNormal evaluates the parameters to normal vector values.
- **•** edgeCurvature evaluates the parameters to curvature values.
- **•** edgeTorsion evaluates the parameters to torsion values.

The following edge evaluation method is available in 3D:

TABLE 3-23: EDGE EVALUATION METHOD IN 3D.

| METHOD                                | OUTPUT TYPE |
|---------------------------------------|-------------|
| edgeMaxFaceAngle(int[], int[], int[]) | double[]    |

This method computes the maximum along a 3D edge of the angle (in radians) between the normal vectors of two faces that are adjacent to the edge. The input arguments are a vector of edge indices, a vector of indices for the first face, and a vector of indices for the second face. The output is a double array, where the maximum is defined as the value closest to π/2 radians. The method is vectorized so that the *N*th entry in the returned array is the maximum along edge[*N*] of the angle between faces face1[*N*] and face2[*N*]. The edge and face numbers are one-based.

Use the following methods for face evaluation in 3D. They do not work on composite faces in virtual geometry objects.

TABLE 3-24: FACE EVALUATION METHODS IN 3D.

| METHOD                               | OUTPUT TYPE       |
|--------------------------------------|-------------------|
| faceParamRange(int)                  | double[4]         |
| faceX(int, double[][2])              | double[][3]       |
| faceDX(int, double[][2])             | double[][3][2]    |
| faceDDX(int, double[][2])            | double[][3][2][2] |
| faceNormal(int, double[][2])         | double[][3]       |
| faceFF1(int, double[][2])            | double[][2][2]    |
| faceFF2(int, double[][2])            | double[][2][2]    |
| faceGaussCurvature(int, double[][2]) | double[]          |
| faceMeanCurvature(int, double[][2])  | double[]          |

The first input argument of all methods is the face number. The second input argument, when it exists, is a matrix of parameter points, for which to perform evaluation. For all but the first method, the first index in the output corresponds to the different parameter points.

- **•** faceParamRange returns two parameter ranges for evaluation on the face.
- **•** faceX evaluates the parameters to coordinate values.
- **•** faceDX evaluates the parameters to first order derivative values.
- **•** faceDDX evaluates the parameters to second order derivative values.
- **•** faceNormal evaluates the parameters to normal vector values.
- **•** faceFF1 evaluates the parameters to the first fundamental form values.
- **•** faceFF2 evaluates the parameters to the second fundamental form values.
- **•** faceGaussCurvature evaluates the parameters to Gauss curvature values.
- **•** faceMeanCurvature evaluates the parameters to mean curvature values.

Use the following methods to access the arrays in the internal representation of COMSOL Multiphysics geometry objects. They do not work on objects represented using the CAD kernel, assembly geometries, or virtual geometries.

TABLE 3-25: GET ARRAYS IN GEOMETRY REPRESENTATION.

| METHOD            | 1D | 2D | 3D | OUTPUT TYPE |
|-------------------|----|----|----|-------------|
| getVertex()       | √  | √  | √  | double[][]  |
| getEdge()         |    | √  | √  | double[][]  |
| getFace()         |    |    | √  | double[][]  |
| getPVertex()      |    |    | √  | double[][]  |
| getPEdge()        |    |    | √  | double[][]  |
| getVertexCoord()  | √  | √  | √  | double[][]  |
| voidsAreLabeled() | √  | √  | √  | Boolean     |

- **•** In 2D and 3D, getVertex returns (sdim+2)-by-nv matrix representing the vertices of the object. The first sdim rows are the coordinates of the vertices. Row sdim+1 contains the domain number if the vertex is isolated and is unspecified otherwise. The last row contains a relative local tolerance for the vertex. For nontolerant vertices the tolerance is NaN. This method does not work on virtual geometry objects.
- **•** In 1D, getVertex returns a 3-by-nvtx matrix representing the vertices of the 1D object. Row 1 provides the coordinates of the vertices. Rows 2 and 3 provide the up and down domain numbers, respectively.
- **•** getPVertex returns a 6-by-npv matrix containing embeddings of vertices in faces. Row 1 contains the vertex index (that is, column from getVertex), rows 2 and 3 contain (*s*, *t*) coordinates of the vertex on the face, row 4 contains a face index, and row 5 contains the surface index into the surfaces. Row 6 contains a relative local tolerance for the vertex. This method does not work on virtual geometry objects.
- **•** In 3D, getEdge returns a 7-by-ne matrix representing the edges of the 3D object. Rows 1 and 2 contain the start and end vertex indices of the edge (0 if they do not exist), respectively. Rows 3 and 4 give the parameter values of these vertices. Row 5 gives the index of a domain if the edge is not adjacent to a face, and is unspecified otherwise. Row 6 gives a sign and an index to the underlying curve. The sign indicates the direction of the edge relative the curve. Finally, row 7 contains a relative local tolerance for the edge. This method does not work on virtual geometry objects.
- **•** In 2D, getEdge returns a 8-by-ne matrix representing the edges of the 2D object. Rows 1 and 2 contain the start and end vertex indices of the edge, respectively (0 if they do not exist). Rows 3 and 4 give the parameter values of these vertices. Rows 5 and 6 contain the left and right domain number of the edge, respectively. Row 7 gives a sign and an index to the array of underlying curves. The sign indicates the direction of the edge relative the curve. Row 8 contains a relative local tolerance for the edge.
- **•** getPEdge returns a 10-by-npe matrix representing the embeddings of the edges in faces. The first row gives the index of the edge in getEdge. Rows 2 and 3 contain the start and end vertex indices from getPVertex, respectively. Rows 4 and 5 give the parameter values of these vertices. Row 6 and 7 give the indices of the faces to the left and right of the edge, respectively. Row 8 gives a sign and index to the parameter curve (if any), and row 9 gives the index to the surface. Row 10 contains a relative local tolerance for the edge. This method does not work on virtual geometry objects.
- **•** getFace returns a 4-by-nf matrix representing the faces of the 3D geometry. Rows 1 and 2 contain the up and down domain index of the face, respectively, and row 3 contains the surface index of the face. Row 4 contains a relative local tolerance for the face. This method does not work on virtual geometry objects.

- **•** getVertexCoord returns a matrix with the vertex coordinates. Its dimension is the space dimension times the number of vertices.
- **•** voidsAreLabeled returns true if all finite void regions are labeled with negative domain indices in the serialization (mphtxt or mphbin file). This also affects the domain indices in the following methods: getAdjExt(), getAdjOrientExt(), getUpDownExt(), getFace(), getEdge(), and getVertex(). It returns false if some finite void regions might be denoted with 0 in the serialization, like in version 4.2.

# Measurements

Geometric measurements is a tool to measure geometric entities and objects. You access it by entering

```
model.component(<ctag>).geom(<tag>).measure();
```

using the GeomSequence.measure() method.

This command measures objects that exist in the current build state (corresponding to what you would see in the COMSOL Desktop). You cannot measure objects not yet built or object that are built but has been consumed as input in another operation.

The geometric measurements tool supports the applicable measurement options (for computing a volume, for example) used with the measure method in the section below.

See also CentroidMeasurement and DistanceMeasurement that creates parameters to be used in geometry features and when setting up the physics.

# *Measurement Methods*

All the measurement methods assume that you have selected one or several entities that you want to measure.

To get the volume, area, or length of a selection of entities, enter

```
double vol = model.component(<ctag>).geom(<tag>).measure().getVolume();
```

To get the surface area surrounding selected 3D domains or the perimeter of selected 3D boundaries or 2D domains, enter

```
double bndVol = model.component(<ctag>).geom(<tag>).measure().getBoundaryVolume();
```

To get the area of a selection of faces (3D) or domains (2D), enter

```
double area = model.component(<ctag>).geom(<tag>).measure().getArea();
```

To get the surrounding boundary area of a selection of 3D domains, enter

```
double surrBndArea = model.component(<ctag>).geom(<tag>).measure().getBoundaryArea();
```

To get the perimeter of a selection of faces in 3D or 2D domains, enter

```
double perimeter = model.component(<ctag>).geom(<tag>).measure().getPerimeter();
```

To get the length of a selection of edges or 1D domains, enter

```
double length = model.component(<ctag>).geom(<tag>).measure().getLength();
```

The volumes, areas, and lengths are approximate because they are based on approximating the geometry with a triangular or polygonal mesh (corresponding to a rendering mesh with the rendering detail set to fine).

If you have selected two vertices, you can get their distance by entering

```
double[] d = model.component(<ctag>).geom(<tag>).measure().getVtxDistance();
```

d[0] is the distance, and d[i] is the distance in the ith coordinate (i = 1, 2, 3).

If you have selected one vertex, you can get its coordinates by entering

```
double[] coord = model.component(<ctag>).geom(<tag>).measure().getVtxCoord();
```

To get the total number of entities in the selected objects, enter

```
int[] entitiesPerDimension = model.component(<ctag>).geom(<tag>).measure().
getNEntities();
```

To get the total number of finite voids in the selected objects or finalized geometry, enter

```
int finiteVoids = model.component(<ctag>).geom(<tag>).measure().getNFiniteVoids();
```

# *Selecting Objects and Entities to Measure*

To select entities you want to measure, enter

```
model.component(<ctag>).geom(<tag>).measure().selection().init(entDim);
model.component(<ctag>).geom(<tag>).measure().selection().set(<objname>,entities);
```

where *entDim* is the dimension of the entities, *<objname>* is the object name, and *entities* is an integer array containing the entity numbers.

For more information about selecting geometry objects, see Geometry Object Selection Methods.

# Inserting Geometry Sequences from File

To insert a geometry sequence from an MPH-file, enter

```
model.component(<ctag>).geom(<tag>).insertFile(<filename>, <sequencename>);
```

where *<filename>* and *<sequencename>* are strings. The *<filename>* can also be a model location URI used to identify a model version in a Model Manager database.

To insert a geometry sequence from a different model component, enter

```
model.component(<ctag>).geom(<tag>).insertSequence(<ctag2>, <sequencename>);
where <ctag2> and <sequencename> are strings.
```

*Example of Importing Geometry Sequences*

The following sequence imports three different geometry sequences from two different files:

```
Code for Use with Java
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("g", 2);
  g.insertFile("filename", "geom1");
  ModelUtil.load("Model2", "filename2");
  g.insertSequence("Model2", "geom1/wp1");
  g.insertSequence("Model2", "geom1/wp2");
Code for Use with MATLAB
  model.component.create('comp1');
  g = model.geom.create('g', 2);
  g.insertFile('filename', 'geom1');
  ModelUtil.load('Model2', 'filename2');
  g.insertSequence('Model2', 'geom1/wp1');
  g.insertSequence('Model2', 'geom1/wp2');
```

# Exporting Geometry to File

To export the finalized geometry to a file, enter

```
model.component(<ctag>).geom(<tag>).exportFinal(<filename>);
```

where *<filename>* is a string for a file system path or a file location URI referencing a file version in a Model Manager database.

To export selected geometry objects to a file, first select the objects to export using

```
model.component(<ctag>).geom(<tag>).export().selection().set(<objnames>);
```

Set the file format using

```
model.component(<ctag>).geom(<tag>).export().setType(<format>);
```

where *<format>* can be set to any of the type values in Table 3-26.

Check which file format is set using

```
String formatType = model.component(<ctag>).geom(<tag>).export().getType();
```

Export the file by entering

```
model.component(<ctag>).geom(<tag>).export(<filename>);
```

The file can be of any of the following formats:

TABLE 3-26: VALID FILE FORMATS.

| NOTE                                      | FILE EXTENSIONS | TYPE VALUE     |  |
|-------------------------------------------|-----------------|----------------|--|
|                                           | .mphbin         | nativebin      |  |
|                                           | .mphtxt         | nativeascii    |  |
| 1                                         | .x_b, .xmt_bin  | parasolidbin   |  |
| 1                                         | .x_t, .xmt_txt  | parasolidascii |  |
| 1                                         | .sab            | acisbin        |  |
| 1                                         | .sat            | acisascii      |  |
| 1                                         | .igs, .iges     | iges           |  |
| 1                                         | .step, .stp     | step           |  |
| STEP File (3D)<br>.stl<br>STL Binary (3D) |                 |                |  |
|                                           | .stl            | stlascii       |  |
|                                           | .dxf            | dxf            |  |
|                                           |                 |                |  |

This format requires a license for the CAD Import Module, Design Module, or a LiveLink product for a CAD package.

# *Exporting to CAD File Formats*

See the section Export, ExportFinal in the documentation for the *CAD Import Module*.

# *Exporting to an STL File*

An alternative way of setting the STL file formats is to use

```
model.component(<ctag>).geom(<tag>).export().setSTLFormat(<format>);
```

where *<format>* is string with only two allowed values: binary and text. The methods setType(*<format>*) and setSTLFormat(*<format>*) will set the correct value for the other, so you only need to use one of them.

Use the following methods to select domains or boundaries to export:

```
model.component(<ctag>).geom(<tag>).export().selection().init(<edim>);
  model.component(<ctag>).geom(<tag>).export().selection().set(<objnames>, <entlst>);
Use the following methods to select objects to export:
  model.component(<ctag>).geom(<tag>).export().selection().init();
  model.component(<ctag>).geom(<tag>).export().selection().set(<objnames>);
Finish the export by using the following line
  model.component(<ctag>).geom(<tag>).export(<filename>);
```

# *Compatibility for MPHBIN and MPHTXT in 2D and 3D*

If you want to open a COMSOL Multiphysics geometry file in an earlier versions of COMSOL Multiphysics, you might need to set the COMSOL Multiphysics version using

```
model.component(<ctag>).geom(<tag>).export().setCompat(<ver>);
where <ver> is a string 4.0 (only 3D), 4.0a (only 3D), 4.2a, 4.3b, 5.1, or 5.5.
```

# *Advanced Settings for DXF Files in 2D*

Set the curve representation for DXF export using

```
model.component(<ctag>).geom(<tag>).export().setDxfCurveRep(<rep>);
 where <rep> is set to exact, approxspline, or polygon.
```

Get the curve representation for DXF export using the following method. The method returns a string value.

```
model.component(<ctag>).geom(<tag>).export().getDxfCurveRep();
```

Use the below method to set the approximation detail for the DXF export.

```
model.component(<ctag>).geom(<tag>).export().setDxfApproxDetail(<detail>);
```

where *<detail>* is graphics, coarse, normal, or fine. This is used when getDxfCurveRep() is approxspline or polygon.

Get approximation detail for DXF export. The method returns a string value.

```
model.component(<ctag>).geom(<tag>).export().getDxfApproxDetail();
```

Set how to handle edges surrounding domains using the following method

```
model.component(<ctag>).geom(<tag>).export().setDxfDomainHandling(<handling>);
```

where *<handling>* is set to edgesdomainwise or intedgesonce.

Get domain handling for DXF export. The method returns a string value.

```
model.component(<ctag>).geom(<tag>).export().getDxfDomainHandling();
```

# Creating and Using Geometry Parts

For a description of geometry parts, see Using Geometry Parts in the *COMSOL Multiphysics Reference Manual*.

```
To create a geometry part, enter
```

```
model.geom().create(<tag>, "Part", sDim);
where <tag> is the parts tag, and sDim is its space dimension (1, 2, or 3).
```

To add an input parameter to the part, enter

```
model.geom(<tag>).inputParam().set(<name>, <expr>, <descr>);
```

where the description *<descr>* can be omitted.

Similarly, add a local parameter by

```
model.geom(<tag>).localParam().set(<name>, <expr>, <descr>);
```

The containers model.component(*<ctag>*).geom(*<tag>*).inputParam() and model.component(*<ctag>*). geom(*<tag>*).localParam() also support the other methods listed in model.param() and model.result(). param().

To add a local function of the type *<type>*, enter

```
model.geom(<tag>).func().create(<ftag>,<type>);
```

See model.func() for more information. To return a list of all local functions, enter

```
model.geom(<tag>).func();
```

![](_page_34_Picture_14.jpeg)

The Finalize feature is optional for geometry parts but is necessary if you want to add virtual operations to the part sequence. It then needs to be created, as specified in Finalize.

To load one or more geometry parts, enter

```
model.geom().load(<tags>, <filename>, <partTagsInFile>);
```

where *<tags>* is a list of part tags, *<filename>* is the filename of the MPH-file where the parts are defined or a model location URI used to identify a model version in a Model Manager database, and *<partTagsInFile>* is a list of the parts' tags in that file. If model.geom(*<gtag>*) is a geometry part, model.geom(*<gtag>*).loaded() returns true if the part was created by loading it from a file.

To get the filename of a loaded part, enter

```
model.geom(<gtag>).filename();
```

To change the filename of a loaded part, enter

```
model.geom(<gtag>).filename(<filename>);
```

where *<filename>* is the new filename or a model location URI used to identify a model version in a Model Manager database.

For a loaded part, to return the comments from the MPH-file, enter

```
model.geom(<gtag>).commentsInFile();
```

For a loaded part, to return the last modification date from the MPH-file, enter

```
model.geom(<gtag>).dateModifiedInFile();
```

```
To get the tag that a loaded part has in the MPH-file, enter
  model.geom(<gtag>).tagInFile();
To get the label that a loaded part has in the MPH-file, enter
  model.geom(<gtag>).labelInFile();
For a loaded part, to return the version from the MPH-file, enter
  model.geom(<gtag>).versionInFile();
To reload (update) a loaded part after its definition has been changed, enter
  model.geom(<gtag>).reload();
To make keeping selections active by default in part instances, use
  model.geom(<gtag>).keepSelInInstances(true);
By default, this property is set to false. To see the current setting, use
  boolean keep = model.geom(<gtag>).keepSelInInstances();
To call a geometry part in a component geometry, add a PartInstance feature:
  model.component(<ctag>).geom(<gtag>).create(<ftag>, "PartInstance");
See PartInstance for details.
To debug a call to part, you can step into it using
  model.component(<ctag>).geom(<gtag>).stepInto(<ftag>);
You can then apply the usual geometry sequence methods on the local part instance, for example,
  model.component(<ctag>).geom(<gtag>).feature(<ftag>).geom().run(<ftag2>);
to build the feature <ftag2> in the local part instance.
To make the part a part variant, enter
  model.geom(<tag>).partVariant(true);
To check if the part is a part variant, enter
  model.geom(<tag>).partVariant();
```

# Geometry Commands

## *Geometry Commands (A to L)*

- **•** AdjacentSelection
- **•** Array
- **•** BallSelection, BoxSelection, CylinderSelection, Disk Selection
- **•** BezierPolygon
- **•** Block
- **•** CentroidMeasurement
- **•** Chamfer
- **•** Circle
- **•** CircularArc
- **•** CollapseEdges
- **•** CollapseFaces
- **•** Compose, Union, Intersection, Difference
- **•** CompositeCurve
- **•** CompositeDomains
- **•** CompositeEdges
- **•** CompositeFaces
- **•** Cone
- **•** ConvertToSolid, ConvertToSurface, ConvertToCurve, ConvertToPoint
- **•** CrossSection
- **•** CubicBezier
- **•** Cylinder
- **•** Delete
- **•** DistanceMeasurement

- **•** ECone
- **•** EditObject
- **•** Ellipse
- **•** Ellipsoid
- **•** ExplicitSelection
- **•** Extract
- **•** Extrude
- **•** Fillet
- **•** Finalize
- **•** FromMesh
- **•** Helix
- **•** Hexahedron
- **•** If, ElseIf, Else, EndIf
- **•** IgnoreEdges
- **•** IgnoreFaces
- **•** IgnoreVertices
- **•** Import DXF
- **•** Import Geometry Sequence
- **•** Import Mesh Part or Meshing Sequence
- **•** Import mphbin/mphtxt
- **•** InterpolationCurve
- **•** Interval
- **•** LineSegment
- **•** LogicalExpressionSelection

## *Geometry Commands (M to Z)*

- **•** MergeEdges
- **•** MergeFaces
- **•** MergeVertices
- **•** MeshControlDomains
- **•** MeshControlEdges
- **•** MeshControlFaces
- **•** MeshControlVertices
- **•** Mirror
- **•** Move, Copy
- **•** Offset
- **•** ParameterCheck
- **•** ParametricCurve
- **•** ParametricSurface
- **•** PartInstance
- **•** Partition
- **•** PartitionDomains
- **•** PartitionEdges
- **•** PartitionFaces
- **•** Point
- **•** Polygon

- **•** Pyramid
- **•** QuadraticBezier
- **•** Rectangle
- **•** RemoveDetails
- **•** Revolve
- **•** RigidTransform
- **•** Rotate
- **•** Scale
- **•** Sphere
- **•** Split
- **•** Square
- **•** Sweep
- **•** Tangent
- **•** Tetrahedron
- **•** Thicken2D
- **•** Torus
- **•** UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection
- **•** WorkPlane

# *AdjacentSelection*

Create a selection of entities or objects that are adjacent to given selections.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"AdjacentSelection");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

AdjacentSelection creates a selection of all entities of dimension outputdim that are adjacent to at least one entity in the input selections. If the output selection has lower dimension than the input selections, you can use the exterior and interior properties to exclude or include output entities that are exterior/interior to the union of the input selections.

The following properties are available:

| PROPERTY     | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                    | Next available theme<br>color | The color to use. Active when color is set to<br>custom.                                                                                              |
| entitydim    | 0   1   2   3                                                                                  | space dimension               | Dimension of input entities.                                                                                                                          |
| exterior     | on   off                                                                                       | on                            | Include output entities that are exterior to the union<br>of the input selections.                                                                    |
| input        | String[]                                                                                       | {}                            | Tags of input selections.                                                                                                                             |
| interior     | on   off                                                                                       | off                           | Include output entities that are interior to the union of<br>the input selections.                                                                    |
| outputdim    | 0   1   2   3                                                                                  | space dimension - 1           | Dimension of entities to select.                                                                                                                      |
| selkeep      | on   off                                                                                       | on                            | Keep the selection within the geometry sequence.                                                                                                      |
| selshow      | on   off                                                                                       | on                            | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.                                                |
| contributeto | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                         |

See Selections of Geometric Entities for general information about selections.

## **EXAMPLE**

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("sph1", "Sphere");
  g.run("sph1");
  g.create("sel1", "ExplicitSelection");
  g.feature("sel1").selection("selection").init(0);
  g.feature("sel1").selection("selection").set("sph1", new int[]{4});
  g.create("adjsel1", "AdjacentSelection");
  g.feature("adjsel1").set("entitydim", 0);
  g.feature("adjsel1").set("input", new String[]{"sel1"});
  g.run("adjsel1");
  g.create("del1", "Delete");
  g.feature("del1").selection("input").named("adjsel1");
  g.run("del1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('sph1', 'Sphere');
  g.run('sph1');
  g.create('sel1', 'ExplicitSelection');
  g.feature('sel1').selection('selection').init(0);
  g.feature('sel1').selection('selection').set('sph1', 4);
  g.create('adjsel1', 'AdjacentSelection');
  g.feature('adjsel1').set('entitydim', 0);
  g.feature('adjsel1').set('input', 'sel1');
  g.run('adjsel1');
  g.create('del1', 'Delete');
```

```
g.feature('del1').selection('input').named('adjsel1');
g.run('del1');
```

#### **SEE ALSO**

BallSelection, BoxSelection, CylinderSelection, Disk Selection, ExplicitSelection, UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection

# *Array*

Create a block-shaped (3D), rectangular (2D, 3D), or linear array of geometry objects.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Array");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Array") to create an array of geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to array. The default selection is empty.

The following properties are available:

TABLE 3-27: VALID PROPERTIES FOR ARRAY.

| NAME          | VALUE                                                                                                | DEFAULT                                                              | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current theme | none                                                                 | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property.                                                                                   |
| customcolor   | RGB-triplet                                                                                          | Next available<br>theme color                                        | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| input         | Selection                                                                                            |                                                                      | Objects to array.                                                                                                                                                                                                                       |
| displ         | double[sdim]                                                                                         | 1                                                                    | Displacements in axis directions.                                                                                                                                                                                                       |
| propagatesel  | on   off                                                                                             | on                                                                   | Propagate selections from input objects to moved objects.                                                                                                                                                                               |
| size          | int   int[sdim]                                                                                      | 1                                                                    | Array size.                                                                                                                                                                                                                             |
| selresult     | on   off                                                                                             | off                                                                  | Create selections of all resulting objects of this feature.                                                                                                                                                                             |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off                                                     | The highest<br>available entity<br>level except<br>obj; usually dom. | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |

If size is a scalar, a linear (oblique) array with size copies of the input objects is constructed. The displacement between two consecutive copies is given by the vector displ. The names of the output objects are ftag(i), where ftag is the tag of the feature, and i is a 1-based index. If there are more than one input object, the output objects are named ftag(i,in), where in is a 1-based index corresponding to the input objects.

2D: If size is an array of length 2, a rectangular array with size[0]-by-size[1] copies of the input object is constructed. The *x*- and *y*-displacements are displ[0] and displ[1], respectively. The names of the output objects are ftag(i1,i2), where ftag is the name of the feature, and i1 and i2 are 1-based indices. If there are more than one input object, the output objects are named ftag(i1,i2,in), where in is a 1-based index corresponding to the input objects.

3D: If size is an array of length 3, a three-dimensional (block shaped) array with size[0]-by-size[1]-by-size[2] copies of the input object is constructed. The *x*-, *y*-, and *z*-displacements are displ[0], displ[1], and displ[2], respectively. The names of the output objects are ftag(i1,i2,i3), where ftag is the name of the feature, and i1, i2, and i3 are 1-based indices. If there are more than one input object, the output objects are named ftag(i1,i2,i3,in), where in is a 1-based index corresponding to the input objects.

The input object is deleted and an identical object is constructed as a part of the array.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Array.

The following attributes are available:

TABLE 3-28: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

In COMSOL Multiphysics 5.2, the selresult property replaced the createselection property. createselection is still supported for backward compatibility.

model.geom(*<tag>*).create(*<ftag>*,"arrayr") constructs an Array feature

## **EXAMPLE**

The following sequence creates a block with four equally-sized holes:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("cyl1","Cylinder");
  g.create("arr1","Array");
  g.feature("arr1").selection("input").set("cyl1");
  g.feature("arr1").set("displ", "4 4 0");
  g.feature("arr1").set("size", "2 2 1");
  g.create("blk1","Block");
  g.feature("blk1").set("size", "10 14 5");
  g.feature("blk1").set("pos", "-3 -5 -4");
  g.create("dif1","Difference");
  g.feature("dif1").selection("input").set("blk1");
  g.feature("dif1").selection("input2").set("arr1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('cyl1','Cylinder');
```

```
g.create('arr1','Array');
g.feature('arr1').selection('input').set('cyl1');
g.feature('arr1').set('displ', '4 4 0');
g.feature('arr1').set('size', '2 2 1');
g.create('blk1','Block');
g.feature('blk1').set('size', '10 14 5');
g.feature('blk1').set('pos', '-3 -5 -4');
g.create('dif1','Difference');
g.feature('dif1').selection('input').set('blk1');
g.feature('dif1').selection('input2').set('arr1');
g.run;
```

## **SEE ALSO**

Move, Copy

*BallSelection, BoxSelection, CylinderSelection, Disk Selection*

Create selections of geometric entities or objects that (partly) lie inside a ball, box, cylinder, or disk.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"BallSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"BoxSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"CylinderSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"DiskSelection");
model.component(<ctag>).geom(<tag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).getType(property);
```

## **DESCRIPTION**

The following general properties are available:

| PROPERTY     | VALUE                                                                                 | DEFAULT                       | DESCRIPTION                                                                                                                                              |
|--------------|---------------------------------------------------------------------------------------|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| angletol     | double                                                                                | 5                             | Angle tolerance for continuity evaluation.                                                                                                               |
| color        | none   custom   integer<br>between 1 and the number of<br>colors in the current theme | none                          | The color of the selection, either given as<br>an integer indicating a color in the color<br>theme, or as a custom color in the<br>customcolor property. |
| condition    | intersects   inside  <br>somevertex   allvertices                                     | intersects                    | Condition for inclusion of an entity.                                                                                                                    |
| customcolor  | RGB-triplet                                                                           | Next available<br>theme color | The color to use. Active when color is set<br>to custom.                                                                                                 |
| entitydim    | -1   0   1   2   3                                                                    | space dimension               | Dimension of entities to select1 means<br>Object.                                                                                                        |
| groupcontang | on   off                                                                              | off                           | Continuous tangent mode.                                                                                                                                 |
| input        | String[]                                                                              | {}                            | Tags of input selections, only used when<br>inputent is selections.                                                                                      |
| inputent     | all   selections                                                                      | all                           | Select among all entities or entities defined<br>by the input property.                                                                                  |
| selkeep      | on   off                                                                              | on                            | Keep the selection within the geometry<br>sequence.                                                                                                      |
| selshow      | on   off                                                                              | on                            | Show selection in physics, materials, and so<br>on; in part instances; or in 3D from a plane<br>geometry.                                                |
| contributeto | String                                                                                | none                          | Tag of cumulative selection to contribute to.                                                                                                            |

For BallSelection, you define the ball using the following properties (using the geometry sequence's length unit):

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION                        |
|----------|--------|---------|------------------------------------|
| posx     | double | 0       | Center of ball, first coordinate.  |
| posy     | double | 0       | Center of ball, second coordinate. |
| posz     | double | 0       | Center of ball, third coordinate.  |
| r        | double | 0       | Radius of ball.                    |

For BoxSelection, you define the box using the following properties (using the geometry sequence's length unit):

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION                  |
|----------|--------|---------|------------------------------|
| xmax     | double | inf     | Maximum x-coordinate of box. |
| xmin     | double | -inf    | Minimum x-coordinate of box. |
| ymax     | double | inf     | Maximum y-coordinate of box. |
| ymin     | double | -inf    | Minimum y-coordinate of box. |
| zmax     | double | inf     | Maximum z-coordinate of box. |
| zmin     | double | -inf    | Minimum z-coordinate of box. |

For CylinderSelection, you define the cylinder using the following properties (using the geometry sequence's length unit):

| PROPERTY | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                                               |
|----------|-----------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1   | double                                  | 0       | Start angle.                                                                                                                                              |
| angle2   | double                                  | 360     | End angle (default: 360 degrees; that is, a full cylinder).                                                                                               |
| axis     | double[]                                | {0,0,0} | Direction of cylinder axis. Vector has length 3 if axistype is<br>cartesian and length 2 is axistype is spherical. Not used<br>if axistype is x, y, or z. |
| axistype | x   y   z  <br>cartesian  <br>spherical | z       | Type of axis or coordinate system used for axis. The value is<br>synchronized with axis.                                                                  |
| bottom   | double                                  | -inf    | Coordinate of bottom face in local coordinate system.                                                                                                     |
| pos      | double[]                                | {0,0,0} | Base point.                                                                                                                                               |
| r        | double<br>(nonnegative)                 | 0       | Outer radius.                                                                                                                                             |
| rin      | double<br>(nonnegative)                 | 0       | Inner radius.                                                                                                                                             |
| top      | double                                  | inf     | Coordinate of top face in local coordinate system.                                                                                                        |

For DiskSelection, you define the disk using the following properties (using the geometry sequence's length unit):

| PROPERTY | VALUE                   | DEFAULT | DESCRIPTION                                             |
|----------|-------------------------|---------|---------------------------------------------------------|
| angle1   | double                  | 0       | Start angle.                                            |
| angle2   | double                  | 360     | End angle (default: 360 degrees; that is, a full disk). |
| posx     | double                  | 0       | Center of disk, first coordinate.                       |
| posy     | double                  | 0       | Center of disk, second coordinate.                      |
| r        | double<br>(nonnegative) | 0       | Outer radius.                                           |
| rin      | double<br>(nonnegative) | 0       | Inner radius.                                           |

You select the input entities or objects to select among using the properties entitydim, inputent, and input. For a boundary or edge selection in 2D or 3D, you can force the selection to select whole groups of entities by setting the property groupcontang to on. Each group consists of adjacent entities that meet at an angle less than angletol.

The output entities/objects are determined by the property condition:

- **•** intersects: All entities/objects that intersect the ball/box/cylinder are included.
- **•** inside: All entities/objects that are completely inside the ball/box/cylinder are included.
- **•** somevertex: All entities/objects that have at least one adjacent vertex inside the ball/box/cylinder are included.
- **•** allvertices: All entities/objects that have all adjacent vertices inside the ball/box/cylinder are included.

For intersects and inside, the rendering mesh is used for the calculation. You can set the resolution of the rendering mesh using

```
ModelUtil.setPreference("graphics.rendering.detail",<detail>);
where <detail> is coarse, normal, fine, or wireframe.
```

See Selections of Geometric Entities for general information about selections.

#### **EXAMPLE**

In a 10-by-10 array of squares, delete the squares that lie in the box *x*>9.5, *y*>9.5.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  g.create("sq1", "Square");
  g.create("arr1", "Array");
  g.feature("arr1").selection("input").set("sq1");
  g.feature("arr1").set("fullsize", new int[]{10,10});
  g.feature("arr1").set("displ", new double[]{2,2});
  g.run("arr1");
  g.create("boxsel1","BoxSelection");
  g.feature("boxsel1").set("entitydim", -1);
  g.feature("boxsel1").set("xmin", 9.5);
  g.feature("boxsel1").set("ymin", 9.5);
  g.create("del1", "Delete");
  g.feature("del1").selection("input").init();
  g.feature("del1").selection("input").named("boxsel1");
  g.run("del1");
  // g.objectNames().length = 75
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  g.create('sq1', 'Square');
  g.create('arr1', 'Array');
  g.feature('arr1').selection('input').set('sq1');
  g.feature('arr1').set('fullsize', [10,10]);
  g.feature('arr1').set('displ', [2,2]);
  g.run('arr1');
  g.create('boxsel1','BoxSelection');
  g.feature('boxsel1').set('entitydim', -1);
  g.feature('boxsel1').set('xmin', 9.5);
  g.feature('boxsel1').set('ymin', 9.5);
  g.create('del1', 'Delete');
  g.feature('del1').selection('input').init;
  g.feature('del1').selection('input').named('boxsel1');
```

```
g.run('del1');
% length(g.objectNames)= 75
```

#### **SEE ALSO**

AdjacentSelection, ExplicitSelection, UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection

# *BezierPolygon*

Create a curve or solid polygon consisting of Bézier segments in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"BezierPolygon");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"BezierPolygon") to create a Bézier polygon or a line segment. The following properties are available:

TABLE 3-29: VALID PROPERTY/VALUE PAIRS FOR BEZIERPOLYGON.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| degree        | int[]   int                                                                              | 1                             | Degree of Bézier segments.                                                                                                                                                                                                                 |
| p             | double[][]                                                                               |                               | Control points.                                                                                                                                                                                                                            |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom in 2D<br>edg in 3D.       | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| type          | solid   open   closed                                                                    | solid (2D)<br>open (3D)       | Object type. solid is not available in 3D.                                                                                                                                                                                                 |
| w             | double[]                                                                                 |                               | Weights.                                                                                                                                                                                                                                   |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from (in 3D only).                                                                                                                                                                         |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is<br>the global Cartesian coordinate system.                                                                                                 |

If type is open or closed, a curve consisting of line, quadratic, or cubic rational Bézier segments is constructed. If type is solid, the solid enclosed by such a closed polygon is constructed. If type is closed or solid, but the first and last control points are different, an extra linear segment is added to close the curve.

The degree of the nth segment is degree[n], and it must be 1 (linear), 2 (quadratic), or 3 (cubic). The nth segment has degree[n]+1 control points and weights. The weights are stored consecutively in the array w, which has length degree[0]+...+degree[N-1]+N, where N is the number of segments. The ith coordinates of the control points are stored consecutively in the array p[i]. Adjacent segments share the common control point, which means that p[i] has length degree[0]+...+degree[N-1]+1.

For a linear or cubic segment, the default weights are 1. For a quadratic segment, the default weights are 1, 1/ , 1. 2

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see BezierPolygon.

The following attributes are available:

TABLE 3-30: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

## **COMPATIBILITY**

From version 5.5, the BezierPolygon feature is deprecated. Instead of BezierPolygon, use the CircularArc, CompositeCurve, CubicBezier, InterpolationCurve, Polygon, or QuadraticBezier feature.

#### **EXAMPLE**

Construct a solid triangle b1 and an elliptic arc b2:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("b1","BezierPolygon");
  g.feature("b1").set("p", new double[][]{{0, 0, 2}, {1, 0 ,0}});
  g.create("b2","BezierPolygon");
  g.feature("b2").set("type","open");
  g.feature("b2").set("degree",2);
  g.feature("b2").set("p", new double[][]{{0, 1, 0}, {1, 2, 0}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('b1','BezierPolygon');
  g.feature('b1').set('p', [[0, 0, 2]; [1, 0 ,0]]);
  g.create('b2','BezierPolygon');
  g.feature('b2').set('type','open');
  g.feature('b2').set('degree',2);
  g.feature('b2').set('p', [[0, 1, 0]; [1, 2,0]]);
  g.run;
```

## **SEE ALSO**

CircularArc, CompositeDomains, CubicBezier, Polygon, QuadraticBezier

# *Block*

Create a right-angled solid or surface block in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Block");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Block") to create a block. The following properties are available:

TABLE 3-31: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                       | DEFAULT                             | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis          | double[]                                                                                    | {0,0,1}                             | Direction of the edge on the local z-axis. Vector has<br>length 3 if axistype is cartesian, and length 2 if<br>axistype is spherical.                                                                                              |
| axistype      | x   y   z  <br>cartesian  <br>spherical                                                     | z                                   | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| base          | corner   center                                                                             | corner                              | Positions the object either centered about pos or with<br>one corner in pos.                                                                                                                                                       |
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none                                | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                      |
| customcolor   | RGB-triplet                                                                                 | Next<br>available<br>theme<br>color | The color to use. Active when color is set to custom.                                                                                                                                                                              |
| layer         | double[]                                                                                    |                                     | Thicknesses of layers.                                                                                                                                                                                                             |
| layertop      | on   off                                                                                    | off                                 | Apply layers on top.                                                                                                                                                                                                               |
| layerbottom   | on   off                                                                                    | on                                  | Apply layers on bottom.                                                                                                                                                                                                            |
| layerleft     | on   off                                                                                    | off                                 | Apply layers to the left.                                                                                                                                                                                                          |
| layerright    | on   off                                                                                    | off                                 | Apply layers to the right.                                                                                                                                                                                                         |
| layerfront    | on   off                                                                                    | off                                 | Apply layers on front.                                                                                                                                                                                                             |
| layerback     | on   off                                                                                    | off                                 | Apply layers on back.                                                                                                                                                                                                              |
| size          | double[]                                                                                    | {1,1,1}                             | Edge lengths.                                                                                                                                                                                                                      |
| pos           | double[]                                                                                    | {0,0,0}                             | Position of the object.                                                                                                                                                                                                            |
| rot           | double                                                                                      | 0                                   | Rotational angle about axis.                                                                                                                                                                                                       |
| type          | solid   surface                                                                             | solid                               | Object type.                                                                                                                                                                                                                       |
| sellayer      | on   off                                                                                    | off                                 | Create layer selections.                                                                                                                                                                                                           |
| sellayershow  | on   off                                                                                    | on                                  | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                                             |
| selresult     | on   off                                                                                    | off                                 | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                               | dom                                 | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                                                                      | none                                | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |

TABLE 3-31: VALID PROPERTY/VALUE PAIRS.

| PROPERTY     | VALUE                           | DEFAULT | DESCRIPTION                                                                                                                   |
|--------------|---------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------|
| workplanesrc | this   part-instance<br>feature | this    | Part-instance feature to take the work plane from.                                                                            |
| workplane    | xyplane  <br>work-plane feature | xyplane | Work-plane feature that defines the coordinate system.<br>The default, xyplane, is the global Cartesian<br>coordinate system. |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-32: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"block2") constructs a solid block.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"block3") constructs a surface block.

The following properties are also available:

TABLE 3-33: VALID PROPERTY/VALUE PAIRS.

| PROPERTY   | VALUE    | DEFAULT | DESCRIPTION                                |
|------------|----------|---------|--------------------------------------------|
| ax2        | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3        | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| lx, ly, lz | double   | 1       | Alias for size.                            |
| x, y, z    | double   | 0       | Alias for pos.                             |

The property const is no longer available.

## **EXAMPLE**

The following commands create a solid and surface block, where the position is defined in the two alternative ways.

*Code for Use with Java*

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("b1","Block");
  g.feature("b1").set("size","1 2.1 0.5");
  g.feature("b1").set("base","center");
  g.feature("b1").set("pos","1 0 1");
  g.feature("b1").set("axis","1 0 0");
  g.feature("b1").set("rot",30);
  double[] a = g.feature("b1").getDoubleArray("pos");
  g.create("b2","Block");
  g.feature("b2").set("type","surface");
  g.feature("b2").set("size","1 2.1 0.5");
  g.feature("b2").set("pos",a);
  String b = g.feature("b2").getString("pos");
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('b1','Block');
  g.feature('b1').set('size','1 2.1 0.5');
```

```
g.feature('b1').set('base','center');
g.feature('b1').set('pos','1 0 1');
g.feature('b1').set('axis','1 0 0');
g.feature('b1').set('rot',30);
a = g.feature('b1').getDoubleArray('pos');
g.create('b2','Block');
g.feature('b2').set('type','surface');
g.feature('b2').set('size','1 2.1 0.5');
g.feature('b2').set('pos',a);
b = g.feature('b2').getString('pos');
```

## **SEE ALSO**

Hexahedron

# *CentroidMeasurement*

Create parameters for the average position of a selection of vertices.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CentroidMeasurement");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CentroidMeasurement") to create parameters for the average position of vertices.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("ent").set() to select the vertices to measure. The default selection is empty.

Use double[] parvalues = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*). getDoubleArray("parval"); to access the parameter values.

TABLE 3-34: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                                                               |
|----------|-----------|---------|---------------------------------------------------------------------------|
| ent      | Selection |         | Specify the vertex selection.                                             |
| parname  | String[]  |         | Parameter names. The array has the length of the space<br>dimension, sdim |
| parval   | double[]  |         | To access the parameter values (read-only).                               |

## **SEE ALSO**

DistanceMeasurement, Measurement Methods

# *Chamfer*

Create flattened corners in 2D objects. The Design Module also supports 3D chamfers.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Chamfer");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Chamfer") to chamfer corners in 2D.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("point") to select the corners to chamfer. The default selection is empty.

TABLE 3-35: VALID PROPERTY/VALUE PAIRS.

| PROPERTY       | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|----------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| customcolor    | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                      |
| dist           | double                                                                                      | 0                             | Distance from vertex to chamfer.                                                                                                                                                                                                           |
| point          | Selection                                                                                   |                               | Vertices to chamfer.                                                                                                                                                                                                                       |
| pointinsketch  | Selection                                                                                   |                               | Vertices to chamfer in sketch geometry.                                                                                                                                                                                                    |
| selectinsketch | on   off                                                                                    | on                            | Determines whether you can use the pointinsketch<br>property. It can be off in models made in version 6.0 or<br>earlier.                                                                                                                   |
| selresult      | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow  | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto   | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The point property contains the vertices to chamfer in the usual geometry visualization. The pointinsketch property contains the vertices to chamfer in the sketch visualization. These properties are automatically kept synchronized.

Additional properties are available with the Design Module, see Chamfer.

The following attributes are available:

TABLE 3-36: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

# **EXAMPLE**

Chamfer a rectangle.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1",2);
g.create("r1","Rectangle");
g.create("cha1","Chamfer");
g.feature("cha1").selection("point").set("r1(1)",new int[]{1,2,3,4});
```

```
g.feature("cha1").set("dist",0.1);
  g.run();
Code for use MATLAB
  Model model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.create('cha1','Chamfer');
  g.feature('cha1').selection('point').set('r1(1)',{1,2,3,4});
  g.feature('cha1').set('dist',0.1);
  g.run;
```

## **DIAGNOSTICS**

If a chamfer cannot be created according to the specified properties, this vertex is ignored. When the chamfers generate intersections with other edges in the geometry, an error message is given.

#### **SEE ALSO**

Fillet

# *Circle*

Create a circle or disk in 2D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Circle");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Circle") to create a disk in 2D. The following properties are available:

TABLE 3-37: VALID PROPERTY/VALUE PAIRS.

| PROPERTY    | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|-------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle       | double                                                                                      | 360                           | Circle sector angle.                                                                                                                                                                                          |
| base        | corner   center                                                                             | center                        | Positions the object either centered about pos or with<br>the lower-left corner of a surrounding box in pos                                                                                                   |
| color       | none   custom  <br>integer between<br>1 and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| customcolor | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| layer       | double[]                                                                                    |                               | Thicknesses of layers.                                                                                                                                                                                        |
| pos         | double[]                                                                                    | {0,0}                         | Position of the object.                                                                                                                                                                                       |
| r           | double                                                                                      | 1                             | Radius.                                                                                                                                                                                                       |
| rot         | double                                                                                      | 0                             | Rotational angle about pos.                                                                                                                                                                                   |
| type        | solid   curve                                                                               | solid                         | Object type.                                                                                                                                                                                                  |
| sellayer    | on   off                                                                                    | off                           | Create layer selections.                                                                                                                                                                                      |

TABLE 3-37: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|--------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| sellayershow  | on   off                             | on      | Show layer selections in physics/instances/3D (used if<br>sellayer is on)                                                                                                                                                                  |
| selresult     | on   off                             | off     | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off | dom     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                               | none    | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Circle.

The following attributes are available:

TABLE 3-38: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"circ2") creates a solid disk.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"circ1") creates a circle curve.

The following properties are also available:

TABLE 3-39: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION    |
|----------|--------|---------|----------------|
| x, y     | double | 0       | Alias for pos. |

The property const is no longer available.

# **EXAMPLE**

The sequence below creates a unit disk (solid circle object).

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("c1","Circle");
  g.feature("c1").set("pos",new double[]{2,3});
  String base = g.feature("c1").getString("base");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.feature('c1').set('pos',[2,3]);
  base = g.feature('c1').getString('base');
  g.run;
```

#### **SEE ALSO**

Ellipse

Create a circular arc in 2D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CircularArc");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CirularArc") to create a circular arc in 2D. The following properties are available:

TABLE 3-40: VALID PROPERTY/VALUE PAIRS FOR A CIRCULAR ARC.

| PROPERTY      | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1        | double                                                                                      | 0                             | Start angle (in degrees).                                                                                                                                                                                                                  |
| angle2        | double                                                                                      | 90                            | End angle (in degrees).                                                                                                                                                                                                                    |
| center        | double[2]                                                                                   | {0,0}                         | Center coordinates.                                                                                                                                                                                                                        |
| clockwise     | on   off                                                                                    | off                           | Clockwise direction.                                                                                                                                                                                                                       |
| color         | none   custom  <br>integer between<br>1 and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| point1        | double[2]                                                                                   | {1,0}                         | Starting point.                                                                                                                                                                                                                            |
| point2        | double[2]                                                                                   | {0,1}                         | Endpoint.                                                                                                                                                                                                                                  |
| specify       | center   endsr  <br>endsangle1  <br>endsangle2                                              | center                        | Properties to specify.                                                                                                                                                                                                                     |
| r             | double                                                                                      | 1                             | Radius.                                                                                                                                                                                                                                    |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| shortarc      | on   off                                                                                    | on                            | Use the shorter arc.                                                                                                                                                                                                                       |
| type          | solid   curve                                                                               | solid                         | Object type.                                                                                                                                                                                                                               |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see CircularArc.

The following attributes are available:

TABLE 3-41: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

### **EXAMPLE**

The sequence below creates a circular arc that is a half circle with the center in (0.5, 0.5) and endpoints in (0, 0) and (1, 1), specified using the center, radius, and angles.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("ca1", "CircularArc");
  g.feature("ca1").set("center", new double[]{0.5, 0.5});
  g.feature("ca1").set("r", 0.707106781187);
  g.feature("ca1").set("angle1", 225);
  g.feature("ca1").set("angle2", 45);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('ca1','CircularArc');
  g.feature('ca1').set('center',[0.5, 0.5]);
  g.feature('ca1').set('r', 1/sqrt(2));
  g.feature('ca1').set('angle1', 225);
  g.feature('ca1').set('angle2', 45);
  g.run;
```

## **SEE ALSO**

Circle, CompositeCurve

# *CollapseEdges*

Collapse edges.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CollapseEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CollapseEdges") to collapse edges.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the edges to collapse. The default selection is empty.

The feature collapses an edge by removing it, merging its adjacent vertices to the vertex with lowest index, and reconnecting the adjacent edges to the merged vertex.

The output object is a virtual geometry.

The following properties are available:

TABLE 3-42: VALID PROPERTIES.

| NAME         | VALUE     | DEFAULT | DESCRIPTION                                                               |
|--------------|-----------|---------|---------------------------------------------------------------------------|
| input        | Selection |         | Edges to collapse.                                                        |
| ignoremerged | on   off  | on      | Specifies if the operation tries to ignore the resulting merged vertices. |

# **SEE ALSO**

MergeVertices, CollapseFaces, CollapseFaceRegions

Collapse faces.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CollapseFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(<tag>).create(<ftag>),"CollapseFaces") to collapse faces.

Use model.component(*<ctag>*).geom(<tag>).feature(*<ftag>*).selection("input") to select the faces to collapse. The default selection is empty.

The feature collapses a face by removing it, merging its adjacent opposite edges into one or more edges or collapsing all adjacent edges into one vertex, and reconnecting the adjacent faces to the merged edges or vertex.

The output object is a virtual geometry.

The following properties are available:

| PROPERTY         | VALUE            | DEFAULT | DESCRIPTION                                                                                                |
|------------------|------------------|---------|------------------------------------------------------------------------------------------------------------|
| collvtxtol       | auto  <br>manual | auto    | Use an automatic or manual tolerance for the maximum<br>perimeter of a face to be collapsed into a vertex. |
| input            | Selection        |         | Faces to collapse.                                                                                         |
| ignoremerged     | on   off         | off     | Specifies if the operation tries to ignore the resulting merged<br>entities.                               |
| maxfaceperimeter | double           | 0.001   | The maximum perimeter of a face to be collapsed into a vertex<br>when collvtxtol is set to manual.         |

#### **SEE ALSO**

MergeEdges, CollapseEdges, CollapseFaceRegions

# *CollapseFaceRegions*

Collapse face regions.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CollapseFaceRegions");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(<tag>).create(<ftag>),"CollapseFaceRegions") to collapse narrow face regions.

Use model.component(*<ctag>*).geom(<tag>).feature(*<ftag>*).selection("input") to select the faces where narrow regions should be collapsed. The default selection is empty.

The feature collapses narrow face regions by determining narrow regions of a face and then collapsing those resulting sliver faces.

The output object is a virtual geometry.

The following properties are available:

| PROPERTY  | VALUE            | DEFAULT | DESCRIPTION                                                                                     |
|-----------|------------------|---------|-------------------------------------------------------------------------------------------------|
| input     | Selection        |         | Faces for which narrow regions should be collapsed.                                             |
| maxwidth  | double           | 0.001   | The maximum width of a face region to be collapsed when<br>narrowtol is set to manual.          |
| narrowtol | auto  <br>manual | auto    | Use an automatic or manual tolerance for the maximum width of<br>a face region to be collapsed. |

## **SEE ALSO**

MergeEdges, CollapseEdges, CollapseFaces

*Compose, Union, Intersection, Difference*

Compose objects using a Boolean set formula.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Compose");
model.component(<ctag>).geom(<tag>).create(<ftag>,"Union");
model.component(<ctag>).geom(<tag>).create(<ftag>,"Intersection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"Difference");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,*operationName*) to combine geometric objects in different ways.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection(*property*) to select the objects to combine. The default selection is empty.

The following properties are available:

TABLE 3-43: VALID PROPERTIES FOR THE COMPOSE AND BOOLEAN OPERATIONS.

| PROPERTY     | VALUE                                                                                                   | DEFAULT                                | DESCRIPTION                                                                                                                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| absrepairtol | double                                                                                                  | geom( <tag>).<br/>absRepairTol()</tag> | Absolute repair tolerance.                                                                                                                                                                                    |
| color        | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none                                   | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| customcolor  | RGB-triplet                                                                                             | Next available theme<br>color          | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| formula      | String                                                                                                  |                                        | Set formula (only for Compose feature).                                                                                                                                                                       |
| input        | Selection                                                                                               |                                        | Objects to compose.                                                                                                                                                                                           |
| input2       | Selection                                                                                               |                                        | Objects to subtract (only for the Difference feature).                                                                                                                                                        |
| intbnd       | on   off                                                                                                | on                                     | Keep interior boundaries.                                                                                                                                                                                     |

TABLE 3-43: VALID PROPERTIES FOR THE COMPOSE AND BOOLEAN OPERATIONS.

| PROPERTY      | VALUE                                            | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|--------------------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| keep          | on   off                                         | off                                     | Keep input objects (not for the Difference feature).                                                                                                                                                                                       |
| keepadd       | on   off                                         | off                                     | Keep input objects to add (only for the Difference<br>feature).                                                                                                                                                                            |
| keeplowerdim  | on   off                                         | off                                     | Keep lower-dimensional intersections (only for the<br>Intersection feature).                                                                                                                                                               |
| keepsubtract  | on   off                                         | off                                     | Keep input objects to subtract (only for the<br>Difference feature).                                                                                                                                                                       |
| repairtol     | double                                           | geom( <tag>).<br/>repairTol()</tag>     | Relative repair tolerance, relative to size of union of<br>inputs.                                                                                                                                                                         |
| repairtoltype | auto  <br>relative  <br>absolute                 | geom( <tag>).<br/>repairTolType()</tag> | Repair tolerance type: automatic, relative, or<br>absolute.                                                                                                                                                                                |
| selresult     | on   off                                         | off                                     | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off | dom                                     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from<br>a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| propagatesel  | on   off                                         | on                                      | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                           |
| contributeto  | String                                           | none                                    | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

The following Boolean operation is performed:

- **•** For Compose, the input objects are combined using the set formula in the property formula. The operators +, \*, and - correspond to the set operations union, intersection, and difference, respectively. The precedence of the operators + and - are the same. \* has higher precedence.
- **•** For Union, the objects in input are united.
- **•** For Intersection, the objects in input are intersected.
- **•** For Difference, the objects in input2 are subtracted from the union of the objects in input to form a set difference.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-44: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

The following properties are also supported, see the Delete feature:

TABLE 3-45: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE      | DEFAULT | DESCRIPTION                                                                                                               |
|----------|------------|---------|---------------------------------------------------------------------------------------------------------------------------|
| edge     | all   none | none    | Delete isolated edges on a face (3D). Delete interior edges and edges not<br>adjacent to a domain (2D; alias for indbnd). |

TABLE 3-45: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE      | DEFAULT | DESCRIPTION                                                           |  |
|----------|------------|---------|-----------------------------------------------------------------------|--|
| face     | all   none | none    | Delete interior faces (3D; alias for intbnd).                         |  |
| point    | all   none | none    | Delete isolated vertices (points) on a face (3D) or in a domain (2D). |  |

The property out is no longer available.

## **SEE ALSO**

ConvertToSolid, ConvertToSurface, ConvertToCurve, ConvertToPoint, Finalize, Partition

# *CompositeCurve*

Form composite curves in 2D that has a sequence of child features of the following types: Polygon, CircularArc, InterpolationCurve, QuadraticBezier, and CubicBezier.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).feature().compositeCurves(<ftags>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).feature().
  removeCurveComponents(<childtags>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

String remaining = model.component(*<ctag>*).geom(*<tag>*).feature().compositeCurves(*<ftags>*) creates or extends a CompositeCurve or Polygon feature by joining the curve features tagged *<ftags>*. These input features must be of one of the following types: Polygon, CircularArc, InterpolationCurve, QuadraticBezier, CubicBezier, or CompositeCurve. The returned string is the tag of the created or remaining feature.

String[] remaining = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).feature(). removeCurveComponents(*<childtags>*) removes the children with the given tags from the geometry feature list of the CompositeCurve feature tagged *<ftag>*. This can result in the CompositeCurve feature being split into several features. The remaining children can be reordered. The return array contains the tags of the remaining or created features.

The following properties are available:

TABLE 3-46: VALID PROPERTIES FOR COMPOSITECURVE.

| PROPERTY     | VALUE                                                                                                   | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| contributeto | String                                                                                                  | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor  | RGB-triplet                                                                                             | Next available theme<br>color | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| selresult    | on   off                                                                                                | off                           | Create selections of all resulting objects.                                                                                                                                                                   |

TABLE 3-46: VALID PROPERTIES FOR COMPOSITECURVE.

| PROPERTY      | VALUE                                            | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|--------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off | dom     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from<br>a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| type          | solid  <br>curve                                 | curve   | Object type (in the case when the curve is closed).                                                                                                                                                                                        |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-47: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **EXAMPLE**

Create a composite curve that includes two previously created circular arcs, "ca1" and "ca2".

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom", 2);
  g.create("ca1", "CircularArc");
  g.feature("ca1").set("angle1", 225);
  g.feature("ca1").set("angle2", 45);
  g.create("ca2", "CircularArc");
  g.feature("ca2").set("angle1", 225);
  g.feature("ca2").set("angle2", 180);
  g.feature().compositeCurves("ca1", "ca2");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom', 2);
  g.create('ca1', 'CircularArc');
  g.feature('ca1').set('angle1', 225);
  g.feature('ca1').set('angle2', 45);
  g.create('ca2', 'CircularArc');
  g.feature('ca2').set('angle1', 225);
  g.feature('ca2').set('angle2', 180);
  g.feature().compositeCurves(['ca1';'ca2']);
  g.run;
```

#### **SEE ALSO**

CircularArc, CubicBezier, InterpolationCurve, Polygon, QuadraticBezier

# *CompositeDomains*

Form composite domains.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CompositeDomains");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CompositeDomains") to form composite domains.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the domains to composite. The default selection is empty.

The feature forms a composite domain for each connected domain component of the selected domains by ignoring the boundaries between the domains. The output object is a virtual geometry.

The following properties are available:

TABLE 3-48: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT<br>DESCRIPTION |                                                  |
|-------------|-----------|------------------------|--------------------------------------------------|
| ignoreadj   | on   off  | on                     | Ignore edges (3D only) and vertices on boundary. |
| input       | Selection |                        | Edges to composite.                              |
| keepformesh | on   off  | off                    | Keep input domains for mesh control.             |

Use ignoreadj to specify if the feature also removes the ignorable edges (3D only) and vertices on the boundary of each resulting composite domain.

Use keepformesh to keep the input domains while meshing, to help you in constructing the mesh.

## **EXAMPLE**

Create a composite domain of domain 2 and 3.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom", 2);
  g.create("r1", "Rectangle");
  g.create("c1", "Circle");
  g.run("fin");
  g.create("cmd1","CompositeDomains");
  g.feature("cmd1").selection("input").set("fin", 2, 3);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom', 2);
  g.create('r1', 'Rectangle');
  g.create('c1', 'Circle');
  g.run('fin');
  g.create('cmd1','CompositeDomains');
  g.feature('cmd1').selection('input').set('fin', 2, 3);
  g.run;
```

# **SEE ALSO**

CompositeEdges, CompositeFaces, IgnoreEdges, IgnoreFaces

Form composite edges.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CompositeEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CompositeEdges") to form composite edges.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the edges to concatenate. The default selection is empty.

The feature forms a composite edge for each connected edge component (of manifold type) of the selected edges by ignoring the vertices between the edges. The output object is a virtual geometry.

The following properties are available:

TABLE 3-49: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT | DESCRIPTION                        |
|-------------|-----------|---------|------------------------------------|
| input       | Selection |         | Edges to composite.                |
| keepformesh | on   off  | off     | Keep input edges for mesh control. |

Use keepformesh to keep the input edges while meshing, to help you in constructing the mesh.

Note that the operation never forms composite edges that are closed loops or periodic, that is, every resulting edge has distinct start and end vertices.

#### **EXAMPLE**

Compose edges 2 and 4 of a circle into one edge.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  g.create("c1", "Circle");
  g.run("fin");
  g.create("cme1", "CompositeEdges");
  g.feature("cme1").selection("input").set("fin", 2, 4);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  g.create('c1', 'Circle');
  g.run('fin');
  g.create('cme1', 'CompositeEdges');
  g.feature('cme1').selection('input').set('fin', 2, 4);
  g.run;
```

#### **SEE ALSO**

CompositeDomains, CompositeFaces, IgnoreVertices

Form composite faces.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CompositeFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CompositeFaces") to form composite faces.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the faces to concatenate. The default selection is empty.

The feature forms a composite face for each connected face component (of manifold type) of the selected faces by ignoring the edges between the faces. The output object is a virtual geometry.

The following properties are available:

TABLE 3-50: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT                                   | DESCRIPTION         |  |
|-------------|-----------|-------------------------------------------|---------------------|--|
| input       | Selection |                                           | Faces to composite. |  |
| ignorevtx   | on   off  | on<br>Ignore vertices on boundary.        |                     |  |
| keepformesh | on   off  | off<br>Keep input faces for mesh control. |                     |  |

Use ignorevtx to specify if the feature also removes the ignorable vertices on the boundary of each resulting composite face.

Use keepformesh to keep the input faces while meshing, to help you in constructing the mesh.

## **EXAMPLE**

A COMSOL Multiphysics standard cone has six faces. Using the following composite face operation, the result is a cone with three faces: top, bottom, and side.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("cone1", "Cone");
  g.run("fin");
  g.create("cmf1", "CompositeFaces");
  g.feature("cmf1").selection("input").set("fin", 1, 2, 5, 6);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('cone1', 'Cone');
  g.run('fin');
  g.create('cmf1', 'CompositeFaces');
  g.feature('cmf1').selection('input').set('fin', [1, 2, 5, 6]);
  g.run;
```

## **SEE ALSO**

CompositeDomains, CompositeEdges, IgnoreEdges

Create a right circular cone or cone frustum (conical frustum, truncated cone) in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Cone");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Cone") to create a cone. The following properties are available:

TABLE 3-51: VALID PROPERTY/VALUE PAIRS.

| PROPERTY     | VALUE                                                                                    | DEFAULT                                  | DESCRIPTION                                                                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ang          | double                                                                                   | arctan(1/2)<br>(about 26.565<br>degrees) | The cone's semiangle; that is, the angle between the<br>axis and a generator of the conical surface.                                                                                                             |
| axis         | double[]                                                                                 | {0,0,1}                                  | Direction of the axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if axistype<br>is spherical.                                                                                                |
| axistype     | x   y   z   cartesian  <br>spherical                                                     | z                                        | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                         |
| color        | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                                     | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color            | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| h            | double                                                                                   | 1                                        | Height.                                                                                                                                                                                                          |
| layer        | double[]                                                                                 |                                          | Thicknesses of layers.                                                                                                                                                                                           |
| layertop     | on   off                                                                                 | off                                      | Apply layers on top.                                                                                                                                                                                             |
| layerbottom  | on   off                                                                                 | off                                      | Apply layers on bottom.                                                                                                                                                                                          |
| layerside    | on   off                                                                                 | on                                       | Apply layers on side.                                                                                                                                                                                            |
| pos          | double[]                                                                                 | {0,0,0}                                  | Center of the bottom circle.                                                                                                                                                                                     |
| r            | double                                                                                   | 1                                        | Radius of bottom circle.                                                                                                                                                                                         |
| rot          | double                                                                                   | 0                                        | Rotational angle about axis.                                                                                                                                                                                     |
| rtop         | double                                                                                   | 0.5                                      | Radius of top circle.                                                                                                                                                                                            |
| specifytop   | angle   radius                                                                           | angle                                    | If axistype is angle, the radius of the top circle is<br>given by the ang property. If axistype is radius,<br>the radius of the top circle is given by the rtop<br>property.                                     |
| type         | solid   surface                                                                          | solid                                    | Object type.                                                                                                                                                                                                     |
| sellayer     | on   off                                                                                 | off                                      | Create layer selections.                                                                                                                                                                                         |
| sellayershow | on   off                                                                                 | on                                       | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                           |
| selresult    | on   off                                                                                 | off                                      | Create selections of all resulting objects.                                                                                                                                                                      |

TABLE 3-51: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                      | DEFAULT | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|--------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off | dom     | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                     | none    | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-instance<br>feature            | this    | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature            | xyplane | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-52: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"cone3") creates a solid cone.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"cone2") creates a surface cone.

The following properties are also available:

TABLE 3-53: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |  |
|----------|----------|---------|--------------------------------------------|--|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |  |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |  |
| x, y, z  | double   | 0       | Alias for pos.                             |  |

The property const is no longer available.

# **EXAMPLE**

Create a cone with an apex:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  double h = 3;
  double r = 2;
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.angularUnit("rad");
  g.create("c1","Cone");
  g.feature("c1").set("r",r);
  g.feature("c1").set("h",h);
  g.feature("c1").set("ang", Math.atan(r/h));
  double ang = g.feature("c1").getDouble("ang");
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  h = 3;
```

```
r = 2;
  g = model.component('comp1').geom.create('geom1',3);
  g.angularUnit('rad');
  g.create('c1','Cone');
  g.feature('c1').set('r',r);
  g.feature('c1').set('h',h);
  g.feature('c1').set('ang', atan2(r,h));
  ang = g.feature('c1').getDouble('ang');
Create a truncated and rotated cone:
Code for Use with Java
  g.create("c2","Cone");
  g.feature("c2").set("pos", "1 -2 4");
  g.feature("c2").set("axis", "1 -1 0.3");
  g.feature("c2").set("rot",Math.PI/3);
  g.run();
Code for Use with MATLAB
  g.create('c2','Cone');
  g.feature('c2').set('pos', '1 -2 4');
  g.feature('c2').set('axis', '1 -1 0.3');
  g.feature('c2').set('rot', pi/3);
  g.run;
```

## **SEE ALSO**

Cylinder, ECone

*ConvertToSolid, ConvertToSurface, ConvertToCurve, ConvertToPoint*

Unite and convert objects to a solid, surface, curve, or point object.

# **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ConvertToSolid");
model.component(<ctag>).geom(<tag>).create(<ftag>,"ConvertToSurface");
model.component(<ctag>).geom(<tag>).create(<ftag>,"ConvertToCurve");
model.component(<ctag>).geom(<tag>).create(<ftag>,"ConvertToPoint");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,*convertOperation*) to reduce or extend the topological dimension of objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to convert. The default selection is empty.

The following properties are available:

TABLE 3-54: VALID PROPERTIES FOR THE CONVERSION OPERATIONS.

| PROPERTY      | VALUE                                                                                                   | DEFAULT                                                                                                                           | DESCRIPTION                                                                                                                                                                                                                                   |
|---------------|---------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| absrepairtol  | double                                                                                                  | geom( <tag>).<br/>absRepairTol()</tag>                                                                                            | Absolute repair tolerance.                                                                                                                                                                                                                    |
| color         | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none                                                                                                                              | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                              |
| contributeto  | String                                                                                                  | none                                                                                                                              | Tag of cumulative selection to contribute to.                                                                                                                                                                                                 |
| customcolor   | RGB-triplet                                                                                             | Next available theme color                                                                                                        | The color to use. Active when color is set<br>to custom.                                                                                                                                                                                      |
| input         | Selection                                                                                               |                                                                                                                                   | Objects to convert.                                                                                                                                                                                                                           |
| keep          | on   off                                                                                                | off                                                                                                                               | Keep input objects.                                                                                                                                                                                                                           |
| repairtol     | double                                                                                                  | geom( <tag>).<br/>repairTol()</tag>                                                                                               | Relative repair tolerance, relative to size of<br>union of inputs. Only used if unite is on.                                                                                                                                                  |
| repairtoltype | auto  <br>relative  <br>absolute                                                                        | geom( <tag>).<br/>repairTolType()</tag>                                                                                           | Repair tolerance type: automatic, relative, or<br>absolute. Only used if unite is on.                                                                                                                                                         |
| propagatesel  | on   off                                                                                                | on                                                                                                                                | Propagate selections from input objects to<br>resulting objects.                                                                                                                                                                              |
| selresult     | on   off                                                                                                | off                                                                                                                               | Create selections of all resulting objects.                                                                                                                                                                                                   |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off                                                        | dom for ConvertToSolid; bnd<br>for ConvertToSurface; bnd<br>(2D) or edg (3D) for<br>ConvertToCurve; and pnt for<br>ConvertToPoint | Show selections, if selresult is on, in<br>physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.<br>obj is not available in a component's<br>geometry. dom, bnd, and edg are not<br>available in all features. |
| unite         | on   off                                                                                                | on                                                                                                                                | Union of input objects.                                                                                                                                                                                                                       |

The input objects are united, and the resulting object is then converted to the requested type.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-55: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

# **SEE ALSO**

Compose, Union, Intersection, Difference

# *CrossSection*

Create a 2D geometry from a cross section of a 3D geometry.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CrossSection");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("input");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

In a 2D geometry, use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CrossSection") to create 2D geometry objects by intersecting 3D geometry objects with a work plane. Select the work plane using the workplane property, whose value is the 3D sequence's tag followed by a slash and the work-plane feature's tag, for example geom1/wp1. By default, you get the last work plane in the last 3D geometry.

In a 2D sequence of a work-plane feature, use model.component(*<ctag>*).geom(*<tag>*).feature(*<wptag>*). geom().create(*<ftag>*,"CrossSection") to create 2D geometry objects by intersecting 3D geometry objects with the work plane.

By default, you get the intersection for all 3D objects that were generated by the features preceding the work-plane feature. To select a subset of these objects, set the intersect property to selected, and use the property input to select the 3D objects to intersect.

It is recommended to add a command to run the node before building the CrossSection. Building the previous feature is done automatically in the user interface, but needs to be done manually in the API to make sure the geometry is updated if you, for example, run a parametric sweep changing dimensions in the geometry.

The following properties are available:

TABLE 3-56: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                       | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                      |
|---------------|---------------------------------------------------------------------------------------------|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| absrepairtol  | double                                                                                      | geom( <tag>).<br/>absRepairTol()</tag>  | Absolute repair tolerance.                                                                                                                                                                                       |
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none                                    | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active. |
| contributeto  | String                                                                                      | none                                    | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| customcolor   | RGB-triplet                                                                                 | Next available theme<br>color           | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| input         | Selection                                                                                   | empty                                   | Selection of objects to intersect.                                                                                                                                                                               |
| intersect     | all   selected                                                                              | all                                     | Intersect all objects or selected objects.                                                                                                                                                                       |
| repairtol     | double                                                                                      | geom( <tag>).<br/>repairTol()</tag>     | Relative repair tolerance, relative to size of each<br>input object.                                                                                                                                             |
| repairtoltype | auto   relative  <br>absolute                                                               | geom( <tag>).<br/>repairTolType()</tag> | Repair tolerance type: automatic, relative, or<br>absolute.                                                                                                                                                      |
| selfrom3D     | true   false                                                                                | false                                   | Create selections from the 3D geometry.                                                                                                                                                                          |
| selfrom3dshow | true   false                                                                                | false                                   | Show created selections from 3D in, for<br>example, material and physics settings. Not<br>available for in work planes.                                                                                          |
| selresult     | on   off                                                                                    | off                                     | Create selections of all resulting objects.                                                                                                                                                                      |

TABLE 3-56: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|--------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresultshow | all   obj   dom  <br>bnd   pnt   off | dom     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| workplane     | String                               |         | Work plane to intersect with.                                                                                                                                                                                                              |

The following attributes are available:

TABLE 3-57: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

Create a work plane though the axis of a torus. In a 2D axisymmetric geometry, create the cross section of the torus using the work plane. Note that the last run() command removes the part of the cross section that falls in the region *r*<0.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g1 = model.component("comp1").geom().create("geom1", 3);
  g1.create("tor1", "Torus");
  g1.run("tor1");
  g1.create("wp1", "WorkPlane");
  g1.feature("wp1").set("planetype", "circularedge");
```

g1.feature("wp1").selection("circedge").set("tor1", 15);

```
model.component().create("comp2");
GeomSequence g2 =model.component("comp2").geom().create("geom2", 2);
g2.axisymmetric(true);
g2.create("cro1", "CrossSection");
```

g2.run("cro1"); // Two circles g2.run(); // One circle

```
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g1 = model.component('comp1').geom.create('geom1', 3);
  g1.create('tor1', 'Torus');
  g1.run('tor1');
  g1.create('wp1', 'WorkPlane');
  g1.feature('wp1').set('planetype', 'circularedge');
  g1.feature('wp1').selection('circedge').set('tor1', 15);
  model.component.create('comp2');
  g2 = model.component('comp2').geom.create('geom2', 2);
  g2.axisymmetric(true);
  g2.create('cro1', 'CrossSection');
  g2.run('cro1'); % Two circles
  g2.run; % One circle
```

#### **SEE ALSO**

Projection, WorkPlane

Create a rational Bézier curve of degree 3 in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CubicBezier");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CubicBezier") to create a cubic Bézier curve in 2D or 3D. The following properties are available:

TABLE 3-58: VALID PROPERTY/VALUE PAIRS FOR A CUBIC BÉZIER CURVE.

| PROPERTY      | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between<br>1 and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| p             | double[sdim][4]                                                                             | 0                             | Control points.                                                                                                                                                                                                                            |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| w             | double[4]                                                                                   | 1                             | Weights for the control points.                                                                                                                                                                                                            |
| workplanesrc  | this  <br>part-instance<br>feature                                                          | this                          | Par-instance feature to take the work plane from (in<br>3D only).                                                                                                                                                                          |
| workplane     | xyplane  <br>work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate system<br>(in 3D only). The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                 |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see CubicBezier.

The following attributes are available:

TABLE 3-59: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **EXAMPLE**

The following commands creates a cubic Bézier curve in 2D with control points in (0, 0); (1, 3); (2, −2); and (3, 0):

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1",3);
g.create("cb1", "CubicBezier");
g.feature("cb1").setIndex("p", 1, 0, 1);
g.feature("cb1").setIndex("p", 3, 1, 1);
g.feature("cb1").setIndex("p", 2, 0, 2);
g.feature("cb1").setIndex("p", -2, 1, 2);
g.feature("cb1").setIndex("p", 3, 0, 3);
g.run();
```

The zero values are default values and are therefore not set.

## *Code for Use with MATLAB*

```
model = ModelUtil.create('Model');
model.component.create('comp1');
g = model.component('comp1').geom.create('geom1', 3);
g.create('cb1','CubicBezier');
g.feature('cb1').setIndex('p', 1, 0, 1);
g.feature('cb1').setIndex('p', 3, 1, 1);
g.feature('cb1').setIndex('p', 2, 0, 2);
g.feature('cb1').setIndex('p', -2, 1, 2);
g.feature('cb1').setIndex('p', 3, 0, 3);
g.run;
```

The zero values are default values and are therefore not set.

## **SEE ALSO**

CompositeCurve, QuadraticBezier

# *Cylinder*

Create a solid or hollow (surface) cylinder in 3D. The cylinder is a right circular cylinder; that is, a cylinder that has circles as bases aligned one directly above the other.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Cylinder");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Cylinder") to create a cylinder. The following properties are available:

TABLE 3-60: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE                                                                                       | DEFAULT | DESCRIPTION                                                                                                                                                                                                      |
|----------|---------------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis     | double[]                                                                                    | {0,0,1} | Direction of the axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if axistype<br>is spherical.                                                                                                |
| axistype | x   y   z   cartesian<br>  spherical                                                        | z       | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                         |
| color    | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none    | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a<br>custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |

TABLE 3-60: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                      | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|--------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| customcolor   | RGB-triplet                                | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| layer         | double[]                                   |                               | Thicknesses of layers.                                                                                                                                                                                                             |
| layertop      | on   off                                   | off                           | Apply layers on top.                                                                                                                                                                                                               |
| layerbottom   | on   off                                   | off                           | Apply layers on bottom.                                                                                                                                                                                                            |
| layerside     | on   off                                   | on                            | Apply layers on side.                                                                                                                                                                                                              |
| h             | double                                     | 1                             | Height.                                                                                                                                                                                                                            |
| pos           | double[]                                   | {0,0,0}                       | Center of the bottom circle.                                                                                                                                                                                                       |
| r             | double                                     | 1                             | Radius of bottom circle.                                                                                                                                                                                                           |
| rot           | double                                     | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| type          | solid   surface                            | solid                         | Object type.                                                                                                                                                                                                                       |
| sellayer      | on   off                                   | off                           | Create layer selections.                                                                                                                                                                                                           |
| sellayershow  | on   off                                   | on                            | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                                             |
| selresult     | on   off                                   | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt   off | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                     | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-instance<br>feature            | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane  <br>work-plane feature            | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-61: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"cylinder3") creates a solid cylinder.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"cylinder2") creates a surface cylinder.

The following properties are also available:

TABLE 3-62: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                               |
|----------|----------|---------|-------------------------------------------|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian |
| x, y, z  | double   | 0       | Alias for pos                             |

The property const is no longer available.

## **EXAMPLE**

The following commands generate a surface cylinder and a solid cylinder:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.angularUnit("rad");
  g.create("c2","Cylinder");
  g.feature("c2").set("type","surface");
  g.feature("c2").set("r",0.5);
  g.feature("c2").set("h",4);
  g.feature("c2").set("pos","1 1 0");
  g.feature("c2").set("axis","pi/2 0");
  g.create("c3","Cylinder");
  g.feature("c3").set("r",20);
  g.feature("c3").set("h",40);
  g.feature("c3").set("pos","0 0 -100");
  g.feature("c3").set("axis","1 1 1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.angularUnit('rad');
  g.create('c2','Cylinder');
  g.feature('c2').set('type','surface');
  g.feature('c2').set('r',0.5);
  g.feature('c2').set('h',4);
  g.feature('c2').set('pos','1 1 0');
  g.feature('c2').set('axis','pi/2 0');
  g.create('c3','Cylinder');
  g.feature('c3').set('r',20);
  g.feature('c3').set('h',40);
  g.feature('c3').set('pos','0 0 -100');
  g.feature('c3').set('axis','1 1 1');
  g.run;
SEE ALSO
```

Cone, ECone

# *Delete*

Delete vertices, edges, faces, domains, or geometric objects.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Delete");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Delete") to delete geometric entities.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the entities to delete. To set the selection level for the selection object, and to select the input entities see Geometry Object Selection Methods.

The default selection is empty.

TABLE 3-63: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                                   | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|---------------------------------------------------------------------------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| input         | Selection                                                                                               |                               | Vertices, edges, faces, domains, or objects to delete.                                                                                                                                                                                  |
| color         | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active.                           |
| compat        | 4.2a   4.3                                                                                              | 4.3                           | Algorithm version.                                                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                                             | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| selresult     | on   off                                                                                                | off                           | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off                                                        | dom                           | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| contributeto  | String                                                                                                  | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                           |

Deleting a domain, face, or edge automatically deletes all lower-dimensional adjacent entities, except those needed to bound surviving entities.

In 2D and 3D, vertices that are adjacent to an edge cannot be deleted.

In 3D, an edge can be deleted if it has no adjacent faces, or if it is interior to a face.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-64: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

# **COMPATIBILITY**

In version 4.3, the algorithm was changed slightly. The main difference is that the old algorithm preserved the object type for solid, surface, and curve objects. To get the old behavior, set compat to 4.2a.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"del") creates a Delete feature.

## **EXAMPLE**

Delete face 5 from a surface block:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g =model.component("comp1").geom().create("geom1",3);
  g.create("blk1","Block");
  g.feature("blk1").set("type", "surface");
  g.run("blk1");
```

```
g.create("del1","Delete");
  g.feature("del1").selection("input").set("blk1",5);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('blk1','Block');
  g.feature('blk1').set('type', 'surface');
  g.run('blk1');
  g.create('del1','Delete');
  g.feature('del1').selection('input').set('blk1',5);
  g.run;
```

## **SEE ALSO**

Compose, Union, Intersection, Difference, Extract

# *DistanceMeasurement*

Create parameters that measure the shortest Euclidean distance and vectorial distances between two points or between a point and an edge.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"DistanceMeasurement");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"DistanceMeasurement") to create parameters for distance and vectorial distance.

Use the following methods to specify the dimension of the second entity as well as selecting it:

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("ent2").init()
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("ent2").set()
```

to select the end edge, boundary or point of the measurement. The default selection is empty.

Use double[] parvalues = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*). getDoubleArray("parvalvec"); to access the parameter values (similar for parval).

TABLE 3-65: VALID PROPERTY/VALUE PAIRS.

| PROPERTY   | VALUE     | DEFAULT | DESCRIPTION                                                                                           |  |
|------------|-----------|---------|-------------------------------------------------------------------------------------------------------|--|
| ent1       | Selection |         | Specify a vertex as first entity.                                                                     |  |
| ent2       | Selection |         | Specify a second entity. Dimension 0 and 1 supported.                                                 |  |
| extendent  | on   off  | off     | Extend a straight or circular edge specified in ent2.                                                 |  |
| parname    | String    |         | Parameter names for the Euclidean distance.                                                           |  |
| parnamevec | String[]  |         | Parameter names for the vectorial distances. The array has the<br>length of the space dimension, sdim |  |
| parval     | double    |         | To access parameter value of Euclidean distance (read-only).                                          |  |
| parvalvec  | double[]  |         | To access parameter values of vectorial distances (read-only).                                        |  |

# **SEE ALSO**

CentroidMeasurement, Measurement Methods

Create a solid or surface eccentric oblique cone or frustum in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ECone");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ECone") to create an eccentric oblique cone. The following properties are available:

TABLE 3-66: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle         | double                                                                                   | 360                           | Ellipse sector angle.                                                                                                                                                                                                              |
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the normal to the bottom ellipse.<br>Vector has length 3 if axistype is cartesian,<br>and length 2 if axistype is spherical.                                                                                          |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| displ         | double[2]                                                                                | {0,0}                         | Displacement of top ellipse relative to bottom<br>ellipse in the local coordinate system.                                                                                                                                          |
| h             | double                                                                                   | 1                             | Height.                                                                                                                                                                                                                            |
| pos           | double[3]                                                                                | {0,0,0}                       | Center of the bottom ellipse.                                                                                                                                                                                                      |
| r             | double                                                                                   | 1                             | Radius of bottom ellipse.                                                                                                                                                                                                          |
| rat           | double                                                                                   | 0.5                           | Ratio between perimeter for top ellipse and<br>bottom ellipse.                                                                                                                                                                     |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| semiaxes      | double[2]                                                                                | {1,1}                         | Semiaxes of bottom ellipse.                                                                                                                                                                                                        |
| type          | solid   surface                                                                          | solid                         | Object type.                                                                                                                                                                                                                       |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-67: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"econe3") creates a solid eccentric cone.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"econe2") creates a surface eccentric cone.

The following properties are also available:

TABLE 3-68: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| a, b     | double   | 1       | Alias for semiaxes.                        |
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

## **EXAMPLES**

*Code for Use with Java*

Create a truncated eccentric cone with the base face in the *xy*-plane:

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("e1","ECone");
  g.feature("e1").set("semiaxes","10 40");
  g.feature("e1").set("h",20);
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('e1','ECone');
  g.feature('e1').set('semiaxes','10 40');
  g.feature('e1').set('h',20);
Create an eccentric cone with an apex, that is, a singular patch, on top:
Code for Use with Java
  g.create("e2","ECone");
  g.feature("e2").set("semiaxes","1 2");
  g.feature("e2").set("h",4);
  g.feature("e2").set("rat",0);
  g.feature("e2").set("displ","1 1");
  g.feature("e2").set("pos","100 100 100");
  g.feature("e2").set("axis","0 1 4");
  g.feature("e2").set("rot",45);
  g.run();
Code for Use with MATLAB
  g.create('e2','ECone');
  g.feature('e2').set('semiaxes','1 2');
```

```
g.feature('e2').set('h',4);
g.feature('e2').set('rat',0);
g.feature('e2').set('displ','1 1');
g.feature('e2').set('pos','100 100 100');
g.feature('e2').set('axis','0 1 4');
g.feature('e2').set('rot',45);
g.run;
```

## **SEE ALSO**

Cone, Cylinder

# *EditObject*

Create an edit object feature in 2D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"EditObject");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).vertexNew();
model.component(<ctag>).geom(<tag>).feature(<ftag>).vertexDelete(<vertex>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).vertexSnap(<vertex>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).startVertexDisconnect(<edge>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).endVertexDisconnect(<edge>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).edgeNew();
model.component(<ctag>).geom(<tag>).feature(<ftag>).edgeDelete(<edge>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"EditObject") to create an edit object feature.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).vertexNew() to add a new vertex to the object.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).vertexDelete(*<vertex>*) to delete *<vertex>* from the object.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).vertexSnap(*<vertex>*) to delete *<vertex>* from the object, and move any adjacent edges to the closest remaining vertex.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).startVertexDisconnect(*<edge>*) to create a new vertex and use this vertex as the start vertex for *<edge>*.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).endVertexDisconnect(*<edge>*) to create a new vertex and use this vertex as the end vertex for *<edge>*.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).edgeNew() to add a new edge to the object.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).edgeDelete(*<edge>*) to delete *<edge>* from the object.

The following properties are available:

TABLE 3-69: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                       | DEFAULT                          | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                             | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| customcolor   | RGB-triplet                                                                                 | Next<br>available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| input         | Selection                                                                                   |                                  | Geometry object to edit.                                                                                                                                                                                                                   |
| vertex        | integer   ""                                                                                |                                  | Vertex to edit.                                                                                                                                                                                                                            |
| xvertex       | double                                                                                      | 0                                | x-coordinate of vertex being edited.                                                                                                                                                                                                       |
| yvertex       | double                                                                                      | 0                                | y-coordinate of vertex being edited.                                                                                                                                                                                                       |
| edge          | integer   ""                                                                                |                                  | Edge to edit.                                                                                                                                                                                                                              |
| x             | double[]                                                                                    |                                  | x-coordinates of control points of edge being edited.                                                                                                                                                                                      |
| y             | double[]                                                                                    |                                  | y-coordinates of control points of edge being edited.                                                                                                                                                                                      |
| weights       | double[]                                                                                    |                                  | Weights of control points of edge being edited.                                                                                                                                                                                            |
| knots         | double[]                                                                                    |                                  | Knots of NURBS curve for edge being edited.                                                                                                                                                                                                |
| degree        | 1   2   3                                                                                   |                                  | Degree of edge being edited.                                                                                                                                                                                                               |
| start         | integer   ""                                                                                |                                  | Start vertex of edge being edited.                                                                                                                                                                                                         |
| end           | integer   ""                                                                                |                                  | End vertex of edge being edited.                                                                                                                                                                                                           |
| selresult     | on   off                                                                                    | off                              | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                              | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                                                                      | none                             | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-70: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

# **EXAMPLE**

The following sequence edits a circle, setting the degree of one edge to one to create a straight edge:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1", 2);
g.create("c1", "Circle");
g.run("c1");
g.create("edo1", "EditObject");
```

```
g.feature("edo1").selection("input").set(new String[]{"c1"});
  g.feature("edo1").set("edge", "1");
  g.feature("edo1").set("degree", "1");
  g.run("edo1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  g.create('c1', 'Circle');
  g.run('c1');
  g.create('edo1', 'EditObject');
  g.feature('edo1').selection('input').set({'c1'});
  g.feature('edo1').set('edge', '1');
  g.feature('edo1').set('degree', '1');
  g.run('edo1');
```

## **SEE ALSO**

BezierPolygon

*Ellipse*

Create a solid or curved ellipse in 2D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Ellipse");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Ellipse") to create an ellipse. The following properties are available:

TABLE 3-71: VALID PROPERTIES FOR ELLIPSE.

| PROPERTY     | VALUE                                                                                          | DEFAULT                             | DESCRIPTION                                                                                                                                                                                                   |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| base         | corner  <br>center                                                                             | center                              | Positions the object either centered about pos or with the<br>lower left corner of surrounding box in pos.                                                                                                    |
| color        | none   custom  <br>integer between<br>1 and the<br>number of colors<br>in the current<br>theme | none                                | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |
| contributeto | String                                                                                         | none                                | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor  | RGB-triplet                                                                                    | Next<br>available<br>theme<br>color | The color to use. Active when color is set to custom.                                                                                                                                                         |
| layer        | double[]                                                                                       |                                     | Thicknesses of layers.                                                                                                                                                                                        |
| pos          | double[]                                                                                       | {0,0}                               | Position of the object.                                                                                                                                                                                       |
| rot          | double                                                                                         | 0                                   | Rotational angle about pos.                                                                                                                                                                                   |
| sellayer     | on   off                                                                                       | off                                 | Create layer selections.                                                                                                                                                                                      |
| sellayershow | on   off                                                                                       | on                                  | Show layer selections in physics/instances/3D (used if<br>sellayer is on)                                                                                                                                     |

TABLE 3-71: VALID PROPERTIES FOR ELLIPSE.

| PROPERTY      | VALUE                                | DEFAULT | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|--------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresult     | on   off                             | off     | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow | all   obj   dom  <br>bnd   pnt   off | dom     | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| semiaxes      | double[]                             | {1,1}   | Semiaxes.                                                                                                                                                                                                                               |
| type          | solid   curve                        | solid   | Object type.                                                                                                                                                                                                                            |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Ellipse.

The following attributes are available:

TABLE 3-72: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ellip2") is a solid ellipse.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ellip1") is an ellipse curve.

The following properties are also available:

TABLE 3-73: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION         |
|----------|--------|---------|---------------------|
| a, b     | double | 1       | Alias for semiaxes. |
| x, y     | double | 0       | Alias for pos.      |

The property const is no longer available.

## **EXAMPLE**

The following sequence creates a solid ellipse:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("e1","Ellipse");
  g.feature("e1").set("semiaxes","1 0.3");
  g.feature("e1").set("rot",45);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('e1','Ellipse');
  g.feature('e1').set('semiaxes','1 0.3');
  g.feature('e1').set('rot',45);
  g.run;
```

# **SEE ALSO**

Circle

Create a solid or surface ellipsoid in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Ellipsoid");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Ellipsoid") to create an ellipsoid. The following properties are available:

TABLE 3-74: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the local z-axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if axistype<br>is spherical.                                                                                                          |
| axistype      | x   y   z   cartesian<br>  spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is<br>only available when selresult in active.                      |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| layer         | double[]                                                                                 |                               | Thicknesses of layers.                                                                                                                                                                                                             |
| pos           | double[]                                                                                 | {0,0,0}                       | Center.                                                                                                                                                                                                                            |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| sellayer      | on   off                                                                                 | off                           | Create layer selections.                                                                                                                                                                                                           |
| sellayershow  | on   off                                                                                 | on                            | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                                             |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd<br>  edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| semiaxes      | double[3]                                                                                | {1,1,1}                       | Semiaxes.                                                                                                                                                                                                                          |
| type          | solid   surface                                                                          | solid                         | Object type.                                                                                                                                                                                                                       |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane  <br>work-plane feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-75: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ellipsoid3") creates a solid ellipsoid.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ellipsoid2") creates a surface ellipsoid.

The following properties are also available:

TABLE 3-76: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| a, b, c  | double   | 1       | Alias for semiaxes.                        |
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

### **EXAMPLE**

The following commands create a surface and solid ellipsoid, where the position and semiaxes are defined in two alternative ways:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("e2","Ellipsoid");
  g.feature("e2").set("type","surface");
  g.feature("e2").set("pos","0 1 0");
  g.create("e3","Ellipsoid");
  g.feature("e3").set("semiaxes","12 10 8");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('e2','Ellipsoid');
  g.feature('e2').set('type','surface');
  g.feature('e2').set('pos','0 1 0');
  g.create('e3','Ellipsoid');
  g.feature('e3').set('semiaxes','12 10 8');
  g.run;
```

# **SEE ALSO**

Sphere

# *ExplicitSelection*

Create explicit selections of geometric entities or objects.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ExplicitSelection");
model.component(<ctag>).geom(<tag>).feature().selection("selection");
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
```

## **DESCRIPTION**

The following properties are available:

| PROPERTY     | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| angletol     | double                                                                                         | 5                             | Angle tolerance for continuity evaluation.                                                                                                            |
| color        | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| contributeto | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                         |
| customcolor  | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| groupcontang | on   off                                                                                       | off                           | Continuous tangent mode.                                                                                                                              |
| selection    | Selection                                                                                      | empty                         | Selection of entities or objects.                                                                                                                     |
| selkeep      | on   off                                                                                       | on                            | Keep the selection within the geometry sequence.                                                                                                      |
| selshow      | on   off                                                                                       | on                            | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.                                                |

Use the selection methods described in the section "Geometry Object Selection Methods" under model. component(*<ctag>*).geom() to specify the selection model.component(*<ctag>*).geom(*<tag>*).feature(). selection("selection").

For a boundary or edge selection in 2D or 3D, you can force the selection to select whole groups of entities by setting the property groupcontang to on. Each group consists of adjacent entities that meet at an angle less than angletol.

See Selections of Geometric Entities for general information about selections.

#### **COMPATIBILITY**

The following alias can also be used:

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Selection");
```

## **EXAMPLE**

The sequence below creates a block and a cylinder and creates a selection of face 4 of the block. This corresponds to faces 9 and 13 in the finalized geometry.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.run("blk1");
  g.create("sel1","ExplicitSelection");
  g.feature("sel1").selection("selection").init(2);
  g.feature("sel1").selection("selection").set("blk1", new int[]{4});
  g.create("cyl1", "Cylinder");
  g.run();
  int[] faces = model.selection("geom1_sel1").entities(2);
```

```
// faces = 9, 13
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.run('blk1');
  g.create('sel1','ExplicitSelection');
  g.feature('sel1').selection('selection').init(2);
  g.feature('sel1').selection('selection').set('blk1', 4);
  g.create('cyl1', 'Cylinder');
  g.run;
  faces = model.selection('geom1_sel1').entities(2);
  % faces = 9, 13
```

#### **SEE ALSO**

AdjacentSelection, BallSelection, BoxSelection, CylinderSelection, Disk Selection, UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection

# *Extract*

Extract vertices, edges, faces, domains to new objects of the corresponding level, or extract geometric objects to keep only the extracted objects and delete all other objects.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Extract");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Extract") to extract geometric entities and objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the entities to extract. To set the selection level for the selection object, and to select the input entities see Geometry Object Selection Methods.

The default selection is empty.

TABLE 3-77: VALID PROPERTY/VALUE PAIRS FOR EXTRACT.

| PROPERTY      | VALUE                                                                                                   | DEFAULT | DESCRIPTION                                                                                                                                                                                                   |
|---------------|---------------------------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| input         | Selection                                                                                               |         | Vertices, edges, faces, domains, or objects to extract.                                                                                                                                                       |
| inputhandling | keep  <br>remainder  <br>remove                                                                         | keep    | Select how to handle the input objects.                                                                                                                                                                       |
| color         | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none    | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |

TABLE 3-77: VALID PROPERTY/VALUE PAIRS FOR EXTRACT.

| PROPERTY      | VALUE                                            | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|--------------------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| customcolor   | RGB-triplet                                      | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| propagatesel  | on   off                                         | on                            | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                        |
| selresult     | on   off                                         | off                           | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off | dom                           | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| contributeto  | String                                           | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                           |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-78: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **SEE ALSO**

## Delete

# *Extrude*

Extrude planar faces into 3D objects.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Extrude");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Extrude") to extrude objects from a work plane or planar faces in the 3D geometry.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the work plane objects to extrude. The default selection is all available objects from the last preceding work plane.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("inputface") to select the faces to extrude. Faces are extruded when the workplane property is none; otherwise work plane objects are extruded.

The following properties are available:

TABLE 3-79: VALID PROPERTY/VALUE PAIRS FOR EXTRUDE.

| PROPERTY       | VALUES                                                                                   | DEFAULT                                        | DESCRIPTION                                                                                                                                                                                                                        |
|----------------|------------------------------------------------------------------------------------------|------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                                           | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| contributeto   | String                                                                                   | none                                           | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| crossfaces     | on   off                                                                                 | on                                             | Keep cross-sectional faces.                                                                                                                                                                                                        |
| customcolor    | RGB-triplet                                                                              | Next available<br>theme color                  | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| displ          | double[nd][2]                                                                            | {{0,0}}                                        | Displacement (parallel to work plane) of<br>extrusion top (of each layer) in local coordinate<br>system.                                                                                                                           |
| distance       | double   double[nd]                                                                      | 1                                              | Extrusion distance(s), that is, local z-coordinate<br>for the top (of each layer). Used if specify is set<br>to distances.                                                                                                         |
| extrudefrom    | workplane   faces  <br>edges   vertices                                                  | workplane, if<br>available,<br>otherwise faces | Extrude work plane objects, planar faces, edges,<br>or vertices in 3D.                                                                                                                                                             |
| includeinput   | boolean                                                                                  | true                                           | Include (planar) input faces when forming the<br>extruded object.                                                                                                                                                                  |
| input          | Selection                                                                                | all objects                                    | Objects to extrude.                                                                                                                                                                                                                |
| inputedge      | Selection                                                                                |                                                | Edges to extrude. Used if extrudefrom is<br>edges.                                                                                                                                                                                 |
| intputface     | Selection                                                                                |                                                | Faces to extrude. Used if extrudefrom is<br>faces.                                                                                                                                                                                 |
| inputvertex    | Selection                                                                                |                                                | Vertices to extrude. Used if extrudefrom is<br>vertices.                                                                                                                                                                           |
| propagatesel   | on   off                                                                                 | on                                             | Propagate selections from input objects to<br>resulting objects.                                                                                                                                                                   |
| reverse        | on   off                                                                                 | off                                            | Reverse the extrude direction.                                                                                                                                                                                                     |
| scale          | double[nd][2]                                                                            | {{1,1}}                                        | Scale of extrusion top (of each layer).                                                                                                                                                                                            |
| selextrude     | on   off                                                                                 | off                                            | Extrude selections from work plane (used if<br>extrudefrom is workplane)                                                                                                                                                           |
| selextrudeshow | on   off                                                                                 | on                                             | Show extruded selections in physics/instances<br>(only used when selextrude is on)                                                                                                                                                 |
| selresult      | on   off                                                                                 | off                                            | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow  | all   obj   dom   bnd<br>  edg   pnt   off                                               | dom                                            | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in<br>all features. |
| specify        | distances  <br>vertices                                                                  | distances                                      | Specification of extrusion distances: as distances<br>using the distance property or by specifying<br>vertices in the 3D geometry using the vertex<br>property.                                                                    |
| twist          | double   double[nd]                                                                      | 0                                              | Twist angle (of each layer).                                                                                                                                                                                                       |

TABLE 3-79: VALID PROPERTY/VALUE PAIRS FOR EXTRUDE.

| PROPERTY  | VALUES    | DEFAULT | DESCRIPTION                                                    |
|-----------|-----------|---------|----------------------------------------------------------------|
| vertex    | Selection |         | Vertices to extrude to. Used if specify is set to<br>vertices. |
| workplane | String    |         | Work plane to extrude.                                         |

Each planar input is extruded in *n*d layers defined by a local coordinate system. By default, *n*d=1. The property distance is the extrusion distance (of each layer) in the *z*-axis direction of the local system. The properties displ, scale, and twist define the translation displacements, scale factors and rotation of the top (of each layer) with respect to the bottom of the extruded object. The last array dimension in the properties displ, scale, and twist can be omitted if the same value is desired for all layers.

When extruding work plane objects, the local system is defined as the local system of the work plane. When extruding faces, the local system is defined by the face with the smallest face number in the object that comes first in the geometry sequence. The local *z*-axis is parallel to the face normal and located at the center of the face. The local *x*-axis is defined by the tangent direction corresponding to the first parameter in the surface representation for the face.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-80: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

The cubic interpolated extrusion is no longer supported.

The following property is also supported:

TABLE 3-81: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUES     | DEFAULT | DESCRIPTION                                            |
|----------|------------|---------|--------------------------------------------------------|
| face     | all   none | all     | Cross-sectional faces to delete, alias for crossfaces. |
| keep     | on   off   | off     | Alias for unite property with opposite value.          |

## **EXAMPLE**

Creation of a cylinder of height 1.3:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("wp1","WorkPlane");
  g.feature("wp1").geom().create("c1","Circle");
  g.run("wp1");
  g.create("e1","Extrude");
  g.feature("e1").set("distance",1.3);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('wp1','WorkPlane');
```

```
g.feature('wp1').geom.create('c1','Circle');
g.run('wp1');
g.create('e1','Extrude');
g.feature('e1').set('distance',1.3);
g.run;
```

## **SEE ALSO**

Revolve, WorkPlane

# *Fillet*

Create circular rounded corners (fillets) in 2D geometry objects. The Design Module supports 3D fillets.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Fillet");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Fillet") to round corners in 2D.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("point") to select which corners to round. The default selection is empty.

TABLE 3-82: VALID PROPERTY/VALUE PAIRS.

| PROPERTY       | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                             |
|----------------|------------------------------------------------------------------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active.                           |
| customcolor    | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| point          | Selection                                                                                      |                               | Vertices to fillet.                                                                                                                                                                                                                     |
| pointinsketch  | Selection                                                                                      |                               | Vertices to fillet in sketch geometry.                                                                                                                                                                                                  |
| radius         | double                                                                                         | 0                             | Radius of fillet.                                                                                                                                                                                                                       |
| selectinsketch | on   off                                                                                       | on                            | Determines whether you can use the pointinsketch<br>property. It can be off in models made in version 6.0 or<br>earlier.                                                                                                                |
| selresult      | on   off                                                                                       | off                           | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow  | all   obj   dom<br>  bnd   pnt  <br>off                                                        | dom                           | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| contributeto   | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                           |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The point property contains the vertices to fillet in the usual geometry visualization. The pointinsketch property contains the vertices to fillet in the sketch visualization. These properties are automatically kept synchronized.

Additional properties are available with the Design Module, see Fillet.

The following attributes are available:

TABLE 3-83: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

Fillet a rectangle object:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("r1","Rectangle");
  g.create("fil1","Fillet");
  g.feature("fil1").selection("point").set("r1(1)",new int[]{1,2,3,4});
  g.feature("fil1").set("radius",0.1);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.create('fil1','Fillet');
  g.feature('fil1').selection('point').set('r1(1)',1:4);
  g.feature('fil1').set('radius',0.1);
  g.run;
```

#### **DIAGNOSTICS**

If Fillet does not succeed in creating a rounded corner according to the specified radius, the vertex is skipped. When a fillet intersects another edge, the function generates an error message.

## **SEE ALSO**

Chamfer

# *Finalize*

Form a union or assembly by combining all geometry objects. The only allowed tag for the Finalize feature is "fin".

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create("fin", "FormUnion");
model.component(<ctag>).geom(<tag>).create("fin", "FormAssembly");
model.component(<ctag>).geom(<tag>).feature("fin").set(property,<value>);
model.component(<ctag>).geom(<tag>).feature("fin").getType(property);
```

#### **DESCRIPTION**

The Finalize feature (Form Union/Assembly) combines all available geometry objects in the sequence to form a single geometry object. There can only be one Finalize feature per geometry sequence and is added by default for all geometry sequences except for geometry parts and work plane sequences. For 2D, 3D, work plane, and geometry part sequences, you can modify the finalized object by using virtual operations.

![](_page_89_Picture_1.jpeg)

The Finalize feature is optional for work plane and geometry part sequences but is necessary if you want to add virtual operations. It then needs to be manually created.

The output of the last geometry feature is the *finalized geometry* used when meshing and when setting up physics. If the property action is set to union, and multiple geometry objects are present in the geometry sequence, the objects are combined into a single object with multiple domains corresponding to the input objects and overlaps between these. In a 1D and 2D axisymmetric geometry, the union action also removes the part of the geometry that falls in the region *r*<0.

Set the property action to assembly to keep multiple objects in the finalized geometry. Use this option when modeling physics that needs separate geometry objects, for example, when modeling mechanical contact.

TABLE 3-84: VALID PROPERTIES.

| NAME          | VALUE                                   | DEFAULT  | DESCRIPTION                                                       |
|---------------|-----------------------------------------|----------|-------------------------------------------------------------------|
| absrepairtol  | double                                  | 1e-6     | Absolute repair tolerance.                                        |
| action        | union   assembly                        | union    | Handling of multiple objects,                                     |
| createpairs   | on   off                                | on       | Create pairs. Used if action is assembly,                         |
| frame         | mesh   geometry  <br>material   spatial | spatial  | Frame used for automatically generated Identity pair<br>features. |
| imprint       | on   off                                | off      | Create imprints. Used if action is assembly,                      |
| repairtol     | double                                  | 1e-6     | Relative repair tolerance, relative to size of union of inputs.   |
| repairtoltype | auto   relative  <br>absolute           | auto     | Repair tolerance type: automatic, relative, or absolute.          |
| pairtype      | identity   contact                      | identity | Type of pairs to create,                                          |
| splitpairs    | on   off                                | off      | Create one pair for each connected set of touching<br>boundaries, |

#### **SEE ALSO**

Compose, Union, Intersection, Difference

# *FromMesh*

Create geometry (deformed configuration) from a (deformed) mesh.

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
```

To create a geometry sequence from a deformed mesh, use the createDeformedConfig method on a solution dataset, see Solution. Such a geometry sequence contains a FromMesh feature. This feature has the following properties

TABLE 3-85: VALID PROPERTIES FOR FROMMESH.

| NAME         | VALUE            | DESCRIPTION                                                                                                                                      |
|--------------|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| solution     | String           | Tag of solver sequence to take the deformed mesh from, or<br>none.                                                                               |
| enableupdate | on   off   none  | Enable update of the deformed configuration using the<br>importData() method.                                                                    |
| outertype    | solnum   none    | If the solver used a parametric sweep, then outertype is<br>solnum. Only used if enableupdate is on.                                             |
| outersolnum  | integer          | The index of the outer solution to use. Only used if<br>outertype is solnum.                                                                     |
| solvertype   | solnum   none    | If you can choose among the solver's solution vectors using<br>a solution number, then solvertype is solnum. Only used<br>if enableupdate is on. |
| solnum       | integer   interp | The index of the solution vector to use. Only used if<br>solvertype is solnum.                                                                   |
| timeinterp   | on   off         | The timeinterp property is on if solnum is interp.                                                                                               |
| t            | double           | Time to interpolate solution at. Only used if timeinterp<br>is on.                                                                               |
| solnumdescr  | String           | Description of the chosen solution. Only used if<br>enableupdate is off.                                                                         |

These properties determine the solution from which the deformed mesh is taken. You should not change the properties solution, enableupdate, outertype, solvertype, timeinterp, or solnumdescr. Only change the properties outersolnum, solnum, and t (but only if enableupdate is on).

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData() updates the geometry based on the current value of the solution in the feature's corresponding solver sequence.

# *Helix*

Create a solid, surface, or curve helix (coil) with a circular cross section in 3D.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Helix");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Helix") to create a helix. The following properties are available:

TABLE 3-86: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                          | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axialpitch    | double                                                                                   | 0.3                              | Axial pitch.                                                                                                                                                                                                                       |
| axis          | double[]                                                                                 | {0,0,1}                          | Direction of the helix axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if<br>axistype is spherical.                                                                                                            |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                                | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| chirality     | right   left                                                                             | right                            | Chirality.                                                                                                                                                                                                                         |
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                             | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| contributeto  | String                                                                                   | none                             | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                              | Next<br>available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| endcaps       | paraaxis   perpaxis  <br>perpspine                                                       | paraaxis                         | Direction of end caps.                                                                                                                                                                                                             |
| grep          | bezier   spline                                                                          | spline                           | Geometry representation.                                                                                                                                                                                                           |
| pos           | double[]                                                                                 | {0,0,0}                          | Position of the object.                                                                                                                                                                                                            |
| radialpitch   | double                                                                                   | 0                                | Radial pitch.                                                                                                                                                                                                                      |
| rmaj          | double                                                                                   | 1                                | Major radius.                                                                                                                                                                                                                      |
| rmin          | double                                                                                   | 0.1                              | Minor radius.                                                                                                                                                                                                                      |
| rot           | double                                                                                   | 0                                | Rotational angle about axis.                                                                                                                                                                                                       |
| rtol          | double                                                                                   | 1e-4                             | Relative tolerance.                                                                                                                                                                                                                |
| selresult     | on   off                                                                                 | off                              | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                              | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in<br>all features. |
| turns         | double                                                                                   | 3                                | Number of turns.                                                                                                                                                                                                                   |
| type          | solid   surface                                                                          | solid                            | Object type.                                                                                                                                                                                                                       |
| twistcomp     | on   off                                                                                 | on                               | Twist compensation.                                                                                                                                                                                                                |
| workplanesrc  | this   part-instance<br>feature                                                          | this                             | Part-instance feature to take the work plane<br>from.                                                                                                                                                                              |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                          | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-87: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **EXAMPLE**

The following sequence generates a surface helix and a solid helix:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  GeomFeature h = g.create("h1","Helix");
  h.set("type","surface");
  h.set("rmaj",2);
  h.set("rmin",0.3);
  h.set("axialpitch",1);
  GeomFeature h2 = g.create("h2","Helix");
  h2.set("rmaj",10);
  h2.set("rmin",2);
  h2.set("axialpitch",1);
  h2.set("pos","0,0,-100");
  h2.set("axis","1,1,1");
  h2.set("rot",60);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  h = g.create('h1','Helix');
  h.set('type','surface');
  h.set('rmaj',2);
  h.set('rmin',0.3);
  h.set('axialpitch',1);
  h2 = g.create('h2','Helix');
  h2.set('rmaj',10);
  h2.set('rmin',2);
  h2.set('axialpitch',1);
  h2.set('pos','0,0,-100');
  h2.set('axis','1,1,1');
  h2.set('rot',60);
  g.run;
SEE ALSO
```

Torus, Sweep

*Hexahedron*

Create a solid or surface hexahedron bounded by bilinear faces.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Hexahedron");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Hexahedron") to create a general hexahedron. The following properties are available:

TABLE 3-88: VALID PROPERTY/VALUE PAIRS FOR HEXAHEDRON.

| PROPERTY NAME | PROPERTY VALUE                                                                              | DEFAULT                                                         | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|---------------------------------------------------------------------------------------------|-----------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                                                            | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                   |
| contributeto  | String                                                                                      | none                                                            | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                                 | Next available theme<br>color                                   | The color to use. Active when color is set<br>to custom.                                                                                                                                                                           |
| p             | double[3][8]                                                                                | {{0,0,1,1,0,0,1,1},<br>{0,1,1,0,0,1,1,0},<br>{0,0,0,0,1,1,1,1}} | Corner coordinates.                                                                                                                                                                                                                |
| selresult     | on   off                                                                                    | off                                                             | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                               | dom                                                             | Show selections, if selresult is on, of<br>resulting objects in physics, materials, and so<br>on, or in part instances. obj is not available<br>in a component's geometry. dom, bnd, and<br>edg are not available in all features. |
| type          | solid   surface                                                                             | solid                                                           | Object type.                                                                                                                                                                                                                       |
| workplanesrc  | this  <br>part-instance<br>feature                                                          | this                                                            | Part-instance feature to take the work plane<br>from.                                                                                                                                                                              |
| workplane     | xyplane  <br>work-plane feature                                                             | xyplane                                                         | Work-plane feature that defines the<br>coordinate system. The default, xyplane, is<br>the global Cartesian coordinate system.                                                                                                      |

For a hexahedron approximately aligned to the coordinate planes, the points in p are ordered as follows:

- **•** The first four points and the last four points projected down to the (*x*, *y*)-plane defines two negatively oriented quadrangles (quadrilaterals).
- **•** The corresponding plane for the second quadrangle must lie above the plane of the first quadrant in the *z* direction.
- **•** Generally oriented hexahedra have the points of p ordered in a similar way, except for a rigid transformation of the defining point set.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-89: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **EXAMPLE**

The following command generates a solid hexahedron object:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("h1","Hexahedron");
  g.feature("h1").set("p",new double[][]
        {{0,0.0,1,1.0,0,0,1.0,1},
         {0,0.8,1,0.0,0,1,1.2,0},
         {0,0.1,0,0.2,1,1,2.0,1}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('h1','Hexahedron');
  g.feature('h1').set('p',...
     [[0,0.0,1,1.0,0,0,1.0,1];...
     [0,0.8,1,0.0,0,1,1.2,0];...
     [0,0.1,0,0.2,1,1,2.0,1]]);
  g.run;
```

#### **SEE ALSO**

Block, Pyramid, Tetrahedron

*If, ElseIf, Else, EndIf*

Construct an If statement, enabling or disabling features depending on conditions in terms of parameters.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,<type>);
model.component(<ctag>).geom(<tag>).createAfter(<ftag>,<type>,<postag>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,*<type>*) to add an If, ElseIf, Else, or EndIf feature after the current feature.

Use model.component(*<ctag>*).geom(<tag>).feature().createAfter(*<ftag>*,*<type>*,*<postag>*) to add an If, ElseIf, Else, or EndIf feature after the feature tagged *<postag>*.

The following property is available for If and ElseIf only:

TABLE 3-90: VALID PROPERTY.

| NAME      | VALUE  | DEFAULT | DESCRIPTION                               |
|-----------|--------|---------|-------------------------------------------|
| condition | double | 1       | Logical condition in terms of parameters. |

#### **EXAMPLE**

Build a block if variant = 1, else build a cone:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.param().set("variant", "1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
```

```
g.create("if1", "If");
  g.feature("if1").set("condition", "variant==1");
  g.create("blk1", "Block");
  g.create("else1", "Else");
  g.create("cone1", "Cone");
  g.create("endif1", "EndIf");
  g.run();
  model.param().set("variant", "2");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.param.set('variant', '1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('if1', 'If');
  g.feature('if1').set('condition', 'variant==1');
  g.create('blk1', 'Block');
  g.create('else1', 'Else');
  g.create('cone1', 'Cone');
  g.create('endif1', 'EndIf');
  g.run;
  model.param.set('variant', '2');
  g.run;
```

# *IgnoreEdges*

Ignore edges by removing selected edges that are isolated, adjacent to precisely two faces, or between two domains.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"IgnoreEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"IgnoreEdges") to ignore edges.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the edges to ignore. The default selection is empty.

The feature removes the selected edges that are isolated, that are adjacent to precisely two faces, or that are between two domains. If an edge is adjacent to two faces in 3D, the operations forms a composite face, if an edge is between two domains in 2D, the operation forms composite domain. The output object is a virtual geometry.

The following properties are available:

TABLE 3-91: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT | DESCRIPTION                  |
|-------------|-----------|---------|------------------------------|
| input       | Selection |         | Edges to ignore.             |
| ignorevtx   | on   off  | on      | Ignore vertices on boundary. |
| keepformesh | on   off  | off     | Keep edges for mesh control. |

Use ignorevtx to specify if the feature also removes the ignorable vertices on the boundary of each resulting composite face.

Use keepformesh to keep the ignored edges while meshing, to help you in constructing the mesh.

#### **EXAMPLE**

Create a sphere and ignore all edges and, implicitly, all vertices.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("sph1", "Sphere");
  g.create("ige1", "IgnoreEdges");
  g.feature("ige1").selection("input").set("fin(1)", 1,2,3,4,5,6,7,8,9,10,11,12);
  g.run("ige1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('sph1', 'Sphere');
  g.create('ige1', 'IgnoreEdges');
  g.feature('ige1').selection('input').set('fin(1)', 1:12);
  g.run('ige1');
```

## **SEE ALSO**

CompositeFaces, IgnoreFaces, IgnoreVertices, MeshControlEdges

# *IgnoreFaces*

Ignore faces by removing the selected faces that are isolated or that are between two domains.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"IgnoreFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"IgnoreFaces") to ignore faces in 3D.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the faces to ignore. The default selection is empty.

The feature removes the selected faces that are isolated or that are between two domains. In the latter case, the operation forms a composite domain. The output object is a virtual geometry.

The following properties are available:

TABLE 3-92: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT | DESCRIPTION                            |
|-------------|-----------|---------|----------------------------------------|
| input       | Selection |         | Faces to ignore.                       |
| ignoreadj   | on   off  | on      | Ignore edges and vertices on boundary. |
| keepformesh | on   off  | off     | Keep faces for mesh control.           |

Use ignoreadj to specify if the feature also removes the ignorable edges and vertices on the boundary of each resulting composite domain.

Use keepformesh to keep the ignored faces while meshing, to help you in constructing the mesh.

## **EXAMPLE**

Ignore faces to form one composite domain. The operation also creates composite faces and composite edges.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.create("cyl1", "Cylinder");
  g.run("fin");
  g.create("igf1", "IgnoreFaces");
  g.feature("igf1").selection("input").set("fin", 6, 7, 10);
  g.run("igf1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component().create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.create('cyl1', 'Cylinder');
  g.run('fin');
  g.create('igf1', 'IgnoreFaces');
  g.feature('igf1').selection('input').set('fin', [6, 7, 10]);
  g.run('igf1');
```

#### **SEE ALSO**

CompositeDomains, IgnoreEdges, IgnoreVertices, MeshControlFaces

# *IgnoreVertices*

Ignore vertices by removing the selected vertices that are isolated or that are adjacent to precisely two edges.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"IgnoreVertices");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"IgnoreVertices") to ignore vertices.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the vertices to ignore. The default selection is empty.

The feature removes the selected vertices that are isolated or that are adjacent to precisely two edges. If a vertex is adjacent to two edges, the operation forms a composite edge. The output object is a virtual geometry.

The following properties are available:

TABLE 3-93: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT | DESCRIPTION                     |
|-------------|-----------|---------|---------------------------------|
| input       | Selection |         | Vertices to ignore.             |
| keepformesh | on   off  | off     | Keep vertices for mesh control. |

Use keepformesh to keep the ignored vertices while meshing, to help you in constructing the mesh.

#### **EXAMPLE**

Create an ellipse and ignore vertices 1 and 3, which gives you two remaining edges in the final geometry.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
```

```
GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  model.mesh().create("mesh1", "geom1");
  g.create("e1", "Ellipse");
  g.run("fin");
  g.create("igv1", "IgnoreVertices");
  g.feature("igv1").selection("input").set("fin", 1, 3);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  model.mesh.create('mesh1', 'geom1');
  g.create('e1', 'Ellipse');
  g.run('fin');
  g.create('igv1', 'IgnoreVertices');
  g.feature('igv1').selection('input').set('fin', 1, 3);
  g.run;
```

## **SEE ALSO**

CompositeEdges, IgnoreEdges, IgnoreFaces, MeshControlVertices

# *Import DXF*

Import geometry objects from a DXF file to a 2D geometry.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Import");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Import") to create a geometry import feature. When the property filename is set to a file recognized as a DXF CAD drawing, the property type is set to dxf and the following properties are available:

TABLE 3-94: VALID PROPERTY/VALUE PAIRS.

| PROPERTY     | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                      |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| alllayers    | String[]                                                                                    |                               | Read-only property that returns all layers in the<br>DXF file. Access it using model.<br>component( <ctag>).geom(<tag>).<br/>feature(<ftag>).<br/>getStringArray('alllayers');</ftag></tag></ctag>               |
| color        | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active. |
| contributeto | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| convert      | solid   curve   off                                                                         | solid                         | Options to unite all objects in each layer and<br>make all void regions solid.                                                                                                                                   |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| filename     | String                                                                                      |                               | Filename.                                                                                                                                                                                                        |

TABLE 3-94: VALID PROPERTY/VALUE PAIRS.

| PROPERTY          | VALUE                                | DEFAULT    | DESCRIPTION                                                                                                                                                                                                                                |
|-------------------|--------------------------------------|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| layers            | String[]                             | all layers | Layers to import.                                                                                                                                                                                                                          |
| repairgeom        | on   off                             | on         | Repair geometry.                                                                                                                                                                                                                           |
| repairtol         | double                               | 1e-5       | Repair tolerance, relative to size of union of<br>imported objects.                                                                                                                                                                        |
| selresult         | on   off                             | off        | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow     | all   obj   dom  <br>bnd   pnt   off | dom        | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| selindividual     | on   off                             | off        | Create selections of individual objects.                                                                                                                                                                                                   |
| selindividualshow | all   dom   bnd  <br>pnt   off       | dom        | Show selections of individual objects in physics,<br>materials, and so on; in part instances; or in 3D if<br>in a Work Plane's Plane Geometry, when<br>selindividual is on.                                                                |
| type              | dxf                                  |            | Type of import.                                                                                                                                                                                                                            |

The file specified by filename can be of any of the following formats:

TABLE 3-95: SUPPORTED FILE FORMATS.

| FILE FORMAT | FILE EXTENSIONS |
|-------------|-----------------|
| DXF         | .dxf            |

The imported objects are represented using the COMSOL geometry modeler.

The method

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData() imports the file again.

If selresult is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point), for use in the geometry sequence. To access the object selection, use model.geom(*<tag>*). selection(*<ftag>*), where *<tag>* is the geometry tag and *<ftag>* is the feature tag. To access the other selections, use model.geom(*<tag>*).selection(*<ftag>.<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D). If, in addition, selresultshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>\_<ftag>\_<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D).

If selindividual is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point) of each individual object, for use in the geometry sequence. To access the object selections, use model.geom(*<tag>*).selection(*<otag>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*. To access the other selections, use model.geom(*<tag>*).selection(*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. If, in addition, selindividualshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>*\_*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*.

The following attributes are available:

TABLE 3-96: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

## **COMPATIBILITY**

The following property is also supported:

| PROPERTY | VALUE                      | DEFAULT | DESCRIPTION                                                  |
|----------|----------------------------|---------|--------------------------------------------------------------|
| coercion | solid   face   curve   off | solid   | Alias for convert. The value face is equivalent<br>to solid. |

# *Import Geometry Sequence*

Import geometry objects from another geometry sequence.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Import");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Import") to create a geometry import feature. Set the property mesh to the tag of a meshing sequence of another model component in the model.

| PROPERTY          | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|-------------------|------------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color             | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| contributeto      | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor       | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| sequence          | String                                                                                         |                               | Tag of other geometry sequence.                                                                                                                                                                                                            |
| selresult         | on   off                                                                                       | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow     | all   obj   dom<br>  bnd   edg  <br>pnt   off                                                  | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from<br>a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| selindividual     | on   off                                                                                       | off                           | Create selections of individual objects.                                                                                                                                                                                                   |
| selindividualshow | all   dom   bnd<br>  edg   pnt  <br>off                                                        | dom                           | Show selections, when selindividual is on, of<br>individual objects in physics, materials, and so on; in<br>part instances; or in 3D from a plane geometry.                                                                                |
| type              | sequence                                                                                       |                               | Type of import.                                                                                                                                                                                                                            |

When building, the import feature takes all the existing objects in the specified sequence and imports them into the feature's sequence.

The method

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData()
```

imports the sequence again. The imported objects are represented using the COMSOL Multiphysics geometry modeler or the CAD Import Module's geometry modeler (Parasolid).

If selresult is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point), for use in the geometry sequence. To access the object selection, use model.geom(*<tag>*). selection(*<ftag>*), where *<tag>* is the geometry tag and *<ftag>* is the feature tag. To access the other selections, use model.geom(*<tag>*).selection(*<ftag>.<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D). If, in addition, selresultshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>\_<ftag>\_<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D).

If selindividual is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point) of each individual object, for use in the geometry sequence. To access the object selections, use model.geom(*<tag>*).selection(*<otag>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*. To access the other selections, use model.geom(*<tag>*).selection(*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. If, in addition, selindividualshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>*\_*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*.

The following attributes are available:

TABLE 3-97: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

## **SEE ALSO**

Import 3D CAD, Import DXF, Import of ECAD Files, Import Mesh Part or Meshing Sequence, Import mphbin/mphtxt

*Import Mesh Part or Meshing Sequence*

Create a geometry object from an imported mesh.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Import");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Import") to create a geometry import feature. Set the property sequence to the tag of another geometry sequence in the model.

| PROPERTY          | VALUE                                                                                          | DEFAULT                          | DESCRIPTION                                                                                                                                                                                                                             |
|-------------------|------------------------------------------------------------------------------------------------|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color             | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                             | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active.                           |
| customcolor       | RGB-triplet                                                                                    | Next<br>available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| mesh              | String                                                                                         | none                             | Tag of meshing sequence or mesh part to import, or none<br>to create a new mesh part from a mesh file.                                                                                                                                  |
| meshfilename      | String                                                                                         |                                  | Path to mesh file to import when mesh is set to none.                                                                                                                                                                                   |
| type              | Mesh                                                                                           |                                  | Type of import.                                                                                                                                                                                                                         |
| selresult         | on   off                                                                                       | off                              | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow     | all   obj   dom<br>  bnd   edg  <br>pnt   off                                                  | dom                              | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| selindividual     | on   off                                                                                       | off                              | Create selections of individual objects.                                                                                                                                                                                                |
| selindividualshow | all   dom   bnd<br>  edg   pnt  <br>off                                                        | dom                              | Show selections of individual objects in physics, materials,<br>and so on, or in part instances, when selindividual is<br>on.                                                                                                           |
| contributeto      | String                                                                                         | none                             | Tag of cumulative selection to contribute to.                                                                                                                                                                                           |
| defectremoval     | double                                                                                         | 1.0                              | Relative size factor for identification local defects (3D<br>only).                                                                                                                                                                     |
| simplifymesh      | on   off                                                                                       | on                               | Boolean specifying if the original mesh should be simplified<br>(3D only).                                                                                                                                                              |
| simplifytol       | double                                                                                         | 0.01                             | Relative simplification tolerance (3D only).                                                                                                                                                                                            |

When building, the import feature takes the finalized mesh (if the sequence imports a mesh) or the current mesh (if it is not an imported mesh) of the specified sequence and constructs a corresponding geometry object.

## The method

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData()
```

imports the sequence again. The imported objects are represented using the COMSOL Multiphysics geometry modeler. The CAD Import Module's geometry modeler (Parasolid) does not support these types of geometries.

If selresult is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point), for use in the geometry sequence. To access the object selection, use model.geom(*<tag>*). selection(*<ftag>*), where *<tag>* is the geometry tag and *<ftag>* is the feature tag. To access the other selections, use model.geom(*<tag>*).selection(*<ftag>.<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt. If, in addition, selresultshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>\_<ftag>\_<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt.

If selindividual is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point) of each individual object, for use in the geometry sequence. To access the object selections, use model.geom(*<tag>*).selection(*<otag>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*. To access the other selections, use model.geom(*<tag>*).selection(*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. If, in addition, selindividualshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>*\_*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*.

The following attributes are available:

TABLE 3-98: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

# *Import mphbin/mphtxt*

Import geometry objects from a file using COMSOL Multiphysics geometry formats: binary or text.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Import");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Import") to create a geometry import feature. When the property filename is set to a file recognized as an MPHBIN- or MPHTXT-file, the property type is set to native and the following properties are available:

TABLE 3-99: VALID PROPERTY/VALUE PAIRS.

| PROPERTY       | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|----------------|------------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| contributeto   | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor    | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| filename       | String                                                                                         |                               | Filename.                                                                                                                                                                                                     |
| includevirtual | boolean                                                                                        | true                          | Include virtual operations when importing the<br>geometry. Not available in 1D and in work planes,<br>where virtual operations are always excluded.                                                           |
| selresult      | on   off                                                                                       | off                           | Create selections of all resulting objects.                                                                                                                                                                   |

TABLE 3-99: VALID PROPERTY/VALUE PAIRS.

| PROPERTY          | VALUE                                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                |
|-------------------|-----------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresultshow     | all   obj   dom<br>  bnd   edg  <br>pnt   off | dom     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| selindividual     | on   off                                      | off     | Create selections of individual objects.                                                                                                                                                                                                   |
| selindividualshow | all   dom  <br>bnd   edg   pnt<br>  off       | dom     | Show selections, when selindividual is on, of<br>individual objects in physics, materials, and so on; in<br>part instances; or in 3D from a plane geometry.                                                                                |
| type              | native                                        |         | Type of import.                                                                                                                                                                                                                            |

The file specified by filename can be of any of the following formats:

TABLE 3-100: SUPPORTED FILE FORMATS.

| FILE FORMAT                | FILE EXTENSIONS |  |
|----------------------------|-----------------|--|
| COMSOL Multiphysics Binary | .mphbin         |  |
| COMSOL Multiphysics Text   | .mphtxt         |  |

The imported objects are represented using COMSOL's geometry kernel or the CAD Import Module's geometry kernel (Parasolid).

The method

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData()

imports the file again.

If selresult is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point), for use in the geometry sequence. To access the object selection, use model.geom(*<tag>*). selection(*<ftag>*), where *<tag>* is the geometry tag and *<ftag>* is the feature tag. To access the other selections, use model.geom(*<tag>*).selection(*<ftag>.<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D). If, in addition, selresultshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>\_<ftag>\_<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D).

If selindividual is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point) of each individual object, for use in the geometry sequence. To access the object selections, use model.geom(*<tag>*).selection(*<otag>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*. To access the other selections, use model.geom(*<tag>*).selection(*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. If, in addition, selindividualshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>*\_*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*.

The following attributes are available:

TABLE 3-101: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

Create a curve interpolating or approximating a sequence of points in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"InterpolationCurve");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property)
model.component(<ctag>).geom(<tag>).feature(<ftag>).importToTable();
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

To create an interpolation curve use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,

"InterpolationCurve") The following properties are available:

TABLE 3-102: VALID PROPERTY/VALUE PAIRS FOR INTERPOLATIONCURVE.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| endcond       | none   zerocurv  <br>tangent                                                             | none                          | Condition at endpoint: none, a tangent<br>condition, or zero curvature                                                                                                                                                                     |
| endtang       | double[sdim]                                                                             | {1,0} or {1,0,<br>0}          | Tangent direction at endpoint (if endcond is<br>tangent).                                                                                                                                                                                  |
| filename      | String                                                                                   |                               | If source is file, the file that contains the data.                                                                                                                                                                                        |
| rtol          | double                                                                                   | 0                             | Maximum relative error. 0 implies<br>interpolation.                                                                                                                                                                                        |
| source        | table   file   vectors                                                                   | table                         | Whether data is specified as vectors, a table,<br>or read from a file.                                                                                                                                                                     |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom in 2D; edg in<br>3D       | Show selections, if selresult is on, in<br>physics, materials, and so on; in part instances;<br>or in 3D from a plane geometry. obj is not<br>available in a component's geometry. dom, bnd,<br>and edg are not available in all features. |
| startcond     | none   zerocurv  <br>tangent                                                             | none                          | Condition at starting point: none, a tangent<br>condition, or zero curvature.                                                                                                                                                              |
| starttang     | double[sdim]                                                                             | {1,0} or {1,0,<br>0}          | Tangent direction at starting point (if<br>startcond is tangent).                                                                                                                                                                          |
| struct        | sectionwise  <br>spreadsheet                                                             | spreadsheet                   | The data format if source is file.                                                                                                                                                                                                         |
| table         | double[][]                                                                               |                               | Data points, size N*sdim.                                                                                                                                                                                                                  |
| type          | open   closed   solid                                                                    | open                          | Type of curve.                                                                                                                                                                                                                             |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from (in 3D only).                                                                                                                                                                         |

TABLE 3-102: VALID PROPERTY/VALUE PAIRS FOR INTERPOLATIONCURVE.

| PROPERTY  | VALUE                           | DEFAULT | DESCRIPTION                                                                                                                                   |
|-----------|---------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| workplane | xyplane   work-plane<br>feature | xyplane | Work-plane feature that defines the<br>coordinate system (in 3D only). The default,<br>xyplane, is the global Cartesian coordinate<br>system. |
| x         | double[]                        | {}      | x-coordinates for data points.                                                                                                                |
| y         | double[]                        | {}      | y-coordinates for data points.                                                                                                                |
| z         | double[]                        | {}      | z-coordinates for data points.                                                                                                                |

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importToTable() to read data from the file defined by the filename property and store the data in the table property. The source property is also changed to table.

When building the feature, if the start condition or end condition is zero curvature, the corresponding (currently inactive) tangent direction property should be set to the tangent vector of the resulting curve.

If source is file, the interpolation curve is not automatically rebuilt when the data in the file changes. Use model. component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData() to rebuild the interpolation curve after such a change.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see InterpolationCurve.

The following attributes are available:

TABLE 3-103: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT                                                | DESCRIPTION |
|--------------|----------|--------------------------------------------------------|-------------|
| construction | on   off | off<br>Designate the resulting objects as construction |             |
|              |          |                                                        | geometry.   |

#### **EXAMPLE**

The following commands create a curve interpolating four points in 2D:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  g.create("ic1","InterpolationCurve");
  g.feature("ic1").set("table",new double[][]{{0,0}, {1,0}, {1,1}, {0,1}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  g.create('ic1','InterpolationCurve');
  g.feature('ic1').set('table',[[0,0]; [1,0]; [1,1]; [0,1]]);
  g.run;
```

## **SEE ALSO**

CubicBezier, QuadraticBezier

# *Interval*

Create one or several connected intervals in 1D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Interval");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Interval") to create one or more intervals. The following properties are available:

TABLE 3-104: VALID PROPERTY/VALUE PAIRS FOR INTERVAL.

| PROPERTY      | VALUE                             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                     |  |
|---------------|-----------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| contributeto  | String                            | none    | Tag of cumulative selection to contribute to.                                                                                                                                                                                   |  |
| coord         | double[]                          | {0,1}   | Coordinates in table (used when coordsource is set to<br>table).                                                                                                                                                                |  |
| coordsource   | table  <br>vector                 | table   | Data source for coordinates: a table or a vector of<br>coordinates (used when specify is set to coord).                                                                                                                         |  |
| coordvec      | double[]                          | {0,1}   | Coordinates in table (used when coordsource is set to<br>table).                                                                                                                                                                |  |
| left          | double                            | 0       | Left endpoint (used when specify is set to len).                                                                                                                                                                                |  |
| lensource     | table  <br>vector                 | table   | Data source for interval lengths: a table or a vector of<br>lengths (used when specify is set to len).                                                                                                                          |  |
| len           | double[]                          | {1}     | Lengths in table (used when lensource is set to table).                                                                                                                                                                         |  |
| lensource     | table  <br>vector                 | table   | Data source for interval lengths: a table or a vector of<br>lengths (used when specify is set to len).                                                                                                                          |  |
| lenvec        | double[]                          | {1}     | Lengths in vector field (used when lensource is set to<br>table).                                                                                                                                                               |  |
| selresult     | on   off                          | off     | Create selections of all resulting objects.                                                                                                                                                                                     |  |
| selresultshow | all   obj  <br>dom   bnd  <br>off | dom     | Show selections, if selresult is on, of resulting objects<br>in physics, materials, and so on, or in part instances. obj is<br>not available in a component's geometry. dom, bnd, and<br>edg are not available in all features. |  |
| specify       | coord   len                       | coord   | Specify coordinates or interval lengths.                                                                                                                                                                                        |  |

To specify one interval, set the properties p1 and p2. Then, intervals is automatically set to one.

To specify a sequence of connected intervals, set the property p. Then, intervals is automatically set to many.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"solid1") creates an interval.

The properties above were added in version 5.4; there is backward compatibility with respect to the previous properties as follows:

- **•** The property intervals set to one corresponds to coordsource set to table.
- **•** The property intervals set to many corresponds to coordsource set to vector.
- **•** Setting or getting the value of the property p1 operates on the first element of the coord array.
- **•** Setting or getting the value of the property p2 operates on the last (or second) element of the coord array.
- **•** Setting or getting the value of the property p operates on the coordvec array.

#### **EXAMPLE**

The following commands create a solid consisting of two intervals:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",1);
  g.create("i1","Interval");
  g.feature("i1").set("p","0 1 3");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',1);
  g.create('i1','Interval');
  g.feature('i1').set('p','0 1 3');
  g.run;
```

#### **SEE ALSO**

BezierPolygon

# *LineSegment*

Create line segments in 2D and 3D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"LineSegment");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"LineSegment") to create a line segment. The following properties are available:

TABLE 3-105: VALID PROPERTY/VALUE PAIRS FOR LINESEGMENT.

| PROPERTY     | VALUE                                                                                                   | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |  |
|--------------|---------------------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| color        | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |  |
| contributeto | String                                                                                                  | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |  |
| coord1       | double[]                                                                                                | zero vector                   | Coordinates for starting point (with specify1 set to<br>coord).                                                                                                                                               |  |
| coord2       | double[]                                                                                                | zero vector                   | Coordinates for endpoint (with specify2 set to coord).                                                                                                                                                        |  |
| customcolor  | RGB-triplet                                                                                             | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                         |  |
| p2           | Selection                                                                                               | 1                             | Endpoint (with specify2 set to vertex).                                                                                                                                                                       |  |
| selresult    | on   off                                                                                                | off                           | Create selections of all resulting objects.                                                                                                                                                                   |  |

TABLE 3-105: VALID PROPERTY/VALUE PAIRS FOR LINESEGMENT.

| PROPERTY      | VALUE                              | DEFAULT | DESCRIPTION                                                                                                                                                                                                                     |  |
|---------------|------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| selresultshow | all   obj  <br>dom   bnd  <br>off  | dom     | Show selections, if selresult is on, of resulting objects<br>in physics, materials, and so on, or in part instances. obj is<br>not available in a component's geometry. dom, bnd, and<br>edg are not available in all features. |  |
| specify1      | vertex  <br>coord                  | vertex  | Type of starting point specification.                                                                                                                                                                                           |  |
| specify2      | vertex  <br>coord                  | vertex  | Type of endpoint specification.                                                                                                                                                                                                 |  |
| vertex1       | Selection                          | 0       | Starting point (with specify1 set to vertex).                                                                                                                                                                                   |  |
| workplanesrc  | this  <br>part-instance<br>feature | this    | Part-instance feature to take the work plane from (in 3D<br>and for coordinates only).                                                                                                                                          |  |
| workplane     | xyplane  <br>work-plane<br>feature | xyplane | Work-plane feature that defines the coordinate system (in<br>3D and for coordinates only). The default, xyplane, is the<br>global Cartesian coordinate system.                                                                  |  |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see LineSegment.

The following attributes are available:

TABLE 3-106: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT                                                | DESCRIPTION |
|--------------|----------|--------------------------------------------------------|-------------|
| construction | on   off | off<br>Designate the resulting objects as construction |             |
|              |          |                                                        | geometry.   |

# **EXAMPLE**

The following commands create a block in 3D and a line segment from a vertex in that block to a point with the coordinates (0, 1, 2):

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.create("ls1", "LineSegment");
  g.feature("ls1").set("specify1", "vertex");
  g.feature("ls1").set("specify2", "coord");
  g.feature("ls1").selection("vertex1").set("blk1(1)", new int[]{1});
  g.feature("ls1").set("coord2", new double[]{0, 1, 2});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.create('ls1', 'LineSegment');
  g.feature('ls1').set('specify1', 'vertex');
  g.feature('ls1').set('specify2', 'coord');
  g.feature('ls1').selection('vertex1').set('blk1(1)', 1);
  g.feature('ls1').set('coord2', [0, 1, 2]);
  g.run;
```

# **SEE ALSO**

BezierPolygon

Combine selections of entities or objects using a logical expression.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"LogicalExpressionSelection");
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
```

#### **DESCRIPTION**

For LogicalExpressionSelection, the following properties are available:

| PROPERTY     | VALUE                                                                                                                                                                           | DEFAULT                                                                                                                                                                                                              | DESCRIPTION                                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between<br>1 and the<br>number of<br>colors in the<br>current theme                                                                                  | none                                                                                                                                                                                                                 | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property.                 |
| contributeto | String                                                                                                                                                                          | none                                                                                                                                                                                                                 | Tag of cumulative selection to contribute to.                                                                                                                         |
| customcolor  | RGB-triplet                                                                                                                                                                     | Next available<br>theme color                                                                                                                                                                                        | The color to use. Active when color is set to custom.                                                                                                                 |
| entitydim    | -1   0   1   2   3                                                                                                                                                              | space dimension                                                                                                                                                                                                      | Dimension of entities to select1 means Object.                                                                                                                        |
| expression   | String                                                                                                                                                                          |                                                                                                                                                                                                                      | The logical expression to use. It can contain parentheses<br>and the   , &&, and ! Boolean operators, operating on<br>the tags of existing named geometry selections. |
| selkeep      | on   off                                                                                                                                                                        | on                                                                                                                                                                                                                   | Keep the selection within the geometry sequence.                                                                                                                      |
| selshow      | If the level is not<br>Object, the<br>allowed values<br>are on   off. If<br>the level is<br>Object, the<br>allowed values<br>are all   obj  <br>dom   bnd   edg<br>  pnt   off. | If the level is not<br>Object, the default<br>value is on. If the<br>level is Object, the<br>default value is all<br>in a component's<br>geometry, obj in a<br>part, and dom in a<br>work plane's Plane<br>Geometry. | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry. obj is not<br>available in a component's geometry.             |

See Selections of Geometric Entities for general information about selections.

## **SEE ALSO**

AdjacentSelection, BallSelection, BoxSelection, CylinderSelection, Disk Selection, ExplicitSelection, UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection

# *MergeEdges*

Merge edges adjacent to faces.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MergeEdges");
model.component(<ctag>).geom(<tag>).feature().selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
```

Use model.component(*<ctag>*).geom(<tag>).create(*<ftag>*,"MergeEdges") to merge edges adjacent to face.

Use model.component(*<ctag>*).geom(<tag>).feature(*<ftag>*).selection("keepedg") to select the edges to keep. The default selection is empty.

Use model.component(*<ctag>*).geom(<tag>).feature(*<ftag>*).selection("removeedg") to select the edges to remove. The default selection is empty.

The feature merges the edges by collapsing the face between the edges and reconnecting the faces adjacent to the removed edges to the resulting merged edges.

The output object is a virtual geometry.

The following properties are available:

| PROPERTY  | VALUE     | DEFAULT | DESCRIPTION      |
|-----------|-----------|---------|------------------|
| keepedg   | Selection |         | Edges to keep.   |
| removeedg | Selection |         | Edges to remove. |

## **SEE ALSO**

CollapseFaces, CollapseFaceRegions

# *MergeFaces*

The feature merges the selected faces by collapsing the gap between the faces. The output object is a virtual geometry.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MergeFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MergeFaces") to merge faces using the following properties:

TABLE 3-107: VALID PROPERTIES.

| NAME           | VALUE                       | DEFAULT | DESCRIPTION                                                                                                                                                                 |  |
|----------------|-----------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| pairing        | auto   manual               | auto    | Specifies how to pair the faces in the merge.                                                                                                                               |  |
| input          | Selection                   |         | Faces to merge. Used if pairing is auto.                                                                                                                                    |  |
| keepfac        | Selection                   |         | Faces to keep. Used if pairing is manual.                                                                                                                                   |  |
| removefac      | Selection                   |         | Faces to remove. Used if pairing is manual.                                                                                                                                 |  |
| distancetype   | auto   relative  <br>manual | auto    | Specifies how to enter the maximum distance to bridge.                                                                                                                      |  |
| maxreldistance | Double                      | 0.01    | Maximum distance between faces to be merged, relative to<br>size of geometry. Used if distancetype is relative.                                                             |  |
| maxabsdistance | Double                      |         | Maximum absolute distance between faces to be merged.<br>Used if distancetype is absolute.                                                                                  |  |
| method         | imprint  <br>one-to-one     | imprint | Specifies how to pair the entities. The option imprint<br>creates an imprint of the entities to remove on the keep<br>side. Used when the geometry representation is cadps. |  |

TABLE 3-107: VALID PROPERTIES.

| NAME          | VALUE    | DEFAULT | DESCRIPTION                                                                                                                                       |
|---------------|----------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| precision     | [0,1]    | 0.5     | Specifies the precision with which to make the imprints. A<br>value close to 1 gives a more exact imprint. Used when<br>method is imprint.        |
| forceonetoone | on   off | off     | Forces the faces on the remove side to be matched with<br>the keep side without any imprints. Used when the<br>geometry representation is comsol. |
| createdom     | on   off | on      | Specify if to create domains for each watertight finite void<br>region.                                                                           |

Read more about the geometry representation in the section Geometry Representation in 3D and for Boolean Operations.

#### **SEE ALSO**

Geometry Cleanup

# *MergeVertices*

Merge two vertices.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MergeVertices");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MergeVertices") to merge two vertices.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("keepvtx") to select the vertex to keep. The default selection is empty.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("removevtx") to select the vertex to remove. The default selection is empty.

The feature merges the two vertices by collapsing the edge between the vertices and reconnecting the edges adjacent to the removed vertex to the resulting merged vertex.

The output object is a virtual geometry.

The following properties are available:

TABLE 3-108: VALID PROPERTIES.

| NAME      | VALUE     | DEFAULT | DESCRIPTION       |
|-----------|-----------|---------|-------------------|
| keepvtx   | Selection |         | Vertex to keep.   |
| removevtx | Selection |         | Vertex to remove. |

## **SEE ALSO**

CollapseEdges

# *MeshControlDomains*

Define mesh control domains.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MeshControlDomains");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MeshControlDomains") to define mesh control domains.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the domains to include. The default selection is empty.

The feature creates a composite domain by removing all faces (in 3D) or edges (in 2D) between the selected domains and adjacent domains. The removed entities are kept for mesh control.

The following property is available:

TABLE 3-109: VALID PROPERTIES.

| NAME  | VALUE     | DEFAULT | DESCRIPTION      |
|-------|-----------|---------|------------------|
| input | Selection |         | Edges to ignore. |

### **SEE ALSO**

MeshControlFaces, MeshControlEdges

# *MeshControlEdges*

Define mesh control edges.

# **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MeshControlEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MeshControlEdges") to define mesh control edges.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the edges to include. The default selection is empty.

The feature removes the selected edges that are isolated, that are adjacent to precisely two faces (in 3D), or that are between two domains (in 2D). The edges are kept for mesh control.

The following properties are available:

TABLE 3-110: VALID PROPERTIES.

| NAME       | VALUE     | DEFAULT | DESCRIPTION                     |
|------------|-----------|---------|---------------------------------|
| input      | Selection |         | Edges to ignore.                |
| includevtx | on   off  | on      | Include start and end vertices. |

Use includevtx to specify if the feature also removes the ignorable start and end vertices of the edge.

#### **SEE ALSO**

IgnoreEdges, MeshControlDomains, MeshControlFaces, MeshControlVertices

Define mesh control faces.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MeshControlFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MeshControlFaces") to define mesh control faces in 3D.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the faces to include. The default selection is empty.

The feature removes the selected faces that are isolated or that are between two domains. The faces are kept for mesh control.

The following properties are available:

TABLE 3-111: VALID PROPERTIES.

| NAME       | VALUE     | DEFAULT | DESCRIPTION                             |
|------------|-----------|---------|-----------------------------------------|
| input      | Selection |         | Faces to include.                       |
| includeadj | on   off  | on      | Include edges and vertices on boundary. |

Use includeadj to specify if the feature also includes the ignorable edges and vertices on the boundary of each resulting composite domain.

#### **SEE ALSO**

IgnoreFaces, MeshControlDomains, MeshControlEdges, MeshControlVertices

# *MeshControlVertices*

Define mesh control vertices.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MeshControlVertices");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MeshControlVertices") to define mesh control vertices.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the vertices to include. The default selection is empty.

The feature removes the selected vertices that are isolated or that are adjacent to precisely two edges. The vertices are kept for mesh control.

The following properties are available:

TABLE 3-112: VALID PROPERTIES.

| NAME  | VALUE     | DEFAULT | DESCRIPTION          |
|-------|-----------|---------|----------------------|
| input | Selection |         | Vertices to include. |

#### **SEE ALSO**

IgnoreVertices, MeshControlFaces, MeshControlEdges

# *Mirror*

Reflect (mirror) objects in a plane (3D), a line (2D), or a point (1D).

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Mirror");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Mirror") to mirror geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to mirror. The default selection is empty.

The following properties are available:

TABLE 3-113: VALID PROPERTY/VALUE PAIRS FOR MIRROR.

| PROPERTY      | VALUE                                                                                          | DEFAULT                                | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------------|----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between<br>1 and the<br>number of colors<br>in the current<br>theme | none                                   | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. 2D and 3D only.      |
| customcolor   | RGB-triplet                                                                                    | Next available<br>theme color          | The color to use. Active when color is set to<br>custom. 2D and 3D only.                                                                                                                                                           |
| edge          | Selection                                                                                      |                                        | Edge selection. Used when specify is set to edge.                                                                                                                                                                                  |
| input         | Selection                                                                                      |                                        | Objects to reflect.                                                                                                                                                                                                                |
| keep          | on   off                                                                                       | off                                    | Keep input objects.                                                                                                                                                                                                                |
| pos           | double[]                                                                                       | 0                                      | A point to be fixed during reflection.                                                                                                                                                                                             |
| axis          | double[]                                                                                       | {0 0 1} (3D)<br>{1 0} (2D)<br>{1} (1D) | Vector in the direction to reflect.                                                                                                                                                                                                |
| propagatesel  | on   off                                                                                       | on                                     | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                   |
| selresult     | on   off                                                                                       | off                                    | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                                  | dom                                    | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |

TABLE 3-113: VALID PROPERTY/VALUE PAIRS FOR MIRROR.

| PROPERTY     | VALUE                 | DEFAULT     | DESCRIPTION                                                                          |
|--------------|-----------------------|-------------|--------------------------------------------------------------------------------------|
| specify      | pointnormal  <br>edge | pointnormal | Specify the line of reflection as a point and normal or<br>as a straight edge in 2D. |
| contributeto | String                | none        | Tag of cumulative selection to contribute to.                                        |

In 3D, the input objects are reflected in the plane through pos with normal vector axis. In 2D, the input objects are reflected in the line through pos with normal vector axis. In 1D, the input objects are reflected in the point pos.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Mirror.

The following attributes are available:

TABLE 3-114: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

The property out is no longer available.

#### **EXAMPLE**

A 2D example, mirroring a rectangle:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("r1","Rectangle");
  g.create("m1","Mirror");
  g.feature("m1").selection("input").set("r1");
  g.feature("m1").set("pos","2 2");
  g.feature("m1").set("axis","1 1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.create('m1','Mirror');
  g.feature('m1').selection('input').set('r1');
  g.feature('m1').set('pos','2 2');
  g.feature('m1').set('axis','1 1');
  g.run;
A 3D example, mirroring a block:
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("blk1","Block");
  g.create("m1","Mirror");
  g.feature("m1").selection("input").set("blk1");
  g.feature("m1").set("pos","2 2 2");
```

```
g.feature("m1").set("axis","1 1 1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('blk1','Block');
  g.create('m1','Mirror');
  g.feature('m1').selection('input').set('blk1');
  g.feature('m1').set('pos','2 2 2');
  g.feature('m1').set('axis','1 1 1');
  g.run;
```

## **SEE ALSO**

Move, Copy, Rotate, Scale, RigidTransform

# *Move, Copy*

Move or copy geometry objects by translation.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Move");
model.component(<ctag>).geom(<tag>).create(<ftag>,"Copy");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Move") to move geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Copy") to move a copy of geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to move or copy. The default selection is empty.

The following properties are available:

TABLE 3-115: VALID PROPERTIES FOR MOVE AND COPY.

| NAME           | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|----------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| contributeto   | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor    | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| displx         | double[]                                                                                    | 0                             | x displacement. Used when specify is displ.                                                                                                                                                                   |
| disply         | double[]                                                                                    | 0                             | y displacement. Used when specify is displ.                                                                                                                                                                   |
| displz         | double[]                                                                                    | 0                             | z displacement. Used when specify is displ.                                                                                                                                                                   |
| newpos         | vertices   coord                                                                            | vertices                      | The new (destination) position. Used when specify<br>is pos.                                                                                                                                                  |
| newposvertices | Selection                                                                                   |                               | Vertices to move to. Used when newpos is<br>vertices.                                                                                                                                                         |

TABLE 3-115: VALID PROPERTIES FOR MOVE AND COPY.

| NAME          | VALUE                                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|-----------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| newposx       | double[]                                      | 0       | x-coordinates of new positions. Used when newpos<br>is coord.                                                                                                                                                                      |
| newposy       | double[]                                      | 0       | y-coordinates of new positions. Used when newpos<br>is coord.                                                                                                                                                                      |
| newposz       | double[]                                      | 0       | z-coordinates of new positions. Used when newpos<br>is coord.                                                                                                                                                                      |
| oldpos        | vertex   coord                                | vertex  | The old (original) position. Used when specify is<br>pos.                                                                                                                                                                          |
| oldposvertex  | Selection                                     |         | Vertex to move to. Used when oldpos is vertex.                                                                                                                                                                                     |
| oldposcoord   | double[sdim]                                  | 0       | Coordinates of old position. Used when oldpos is<br>coord.                                                                                                                                                                         |
| propagatesel  | on   off                                      | on      | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                   |
| selresult     | on   off                                      | off     | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off | dom     | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| specify       | displ   pos                                   | displ   | Specify displacement vector or positions.                                                                                                                                                                                          |
| workplanesrc  | this   part-instance<br>feature               | this    | Part-instance feature to take the work plane from (in<br>3D only).                                                                                                                                                                 |
| workplane     | xyplane  <br>work-plane feature               | xyplane | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is the<br>global Cartesian coordinate system.                                                                                         |

If displ is a one-dimensional array, a single copy of each input object is created using the translation vector displ. If displ is a two-dimensional array, several copies can be created, where the nth copy has translation displ[i][n] in the ith coordinate.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Move, and Copy.

The following attributes are available:

TABLE 3-116: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

The sequence below moves a circle from the origin to (2, 3):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("c1","Circle");
  g.create("m1","Move");
  g.feature("m1").selection("input").set("c1");
```

```
g.feature("m1").set("displ", new double[][]{{2},{3}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.create('m1','Move');
  g.feature('m1').selection('input').set('c1');
  g.feature('m1').set('displ', [2,3]);
  g.run;
```

#### **SEE ALSO**

Array, Mirror, Rotate, Scale, RigidTransform

# *Offset*

Offset the edges of 2D curve or solid objects in the normal direction.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Offset");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Offset") to create an offset feature tagged *<ftag>* in the 2D geometry sequence with the tag *<tag>*.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the entities to offset. To set the selection level for the selection object, and to select the input entities see Geometry Object Selection Methods. For example, use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*). selection("input").init(1) to set the selection to be a selection of boundaries (geometric entities of dimension 1) for the offset feature with the tag *<ftag>* in the 2D geometry sequence with the tag *<tag>*.

The following properties are available:

TABLE 3-117: VALID PROPERTY/VALUE PAIRS FOR OFFSET.

| PROPERTY      | VALUE                                          | DEFAULT | DESCRIPTION                                                                                                                                                 |
|---------------|------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| input         | Selection                                      |         | Objects, domains, or boundaries to offset.                                                                                                                  |
| keep          | on   off                                       | on      | Keep input objects.                                                                                                                                         |
| distance      | double                                         | 0       | Offset distance.                                                                                                                                            |
| reverse       | on   off                                       | off     | Reverse the offset direction.                                                                                                                               |
| convexcorner  | fillet   tangent<br>  extend  <br>noconnection | fillet  | Handling of offset edges in convex corners.                                                                                                                 |
| trim          | on   off                                       | on      | Trim the offset edges in concave corners.                                                                                                                   |
| propagatesel  | on   off                                       | on      | Propagate selections from input objects to resulting<br>objects.                                                                                            |
| selresult     | on   off                                       | off     | Create selections of all resulting objects.                                                                                                                 |
| selresultshow | all   obj   dom  <br>bnd   pnt   off           | dom     | Show selections, if selresult is on, in physics, materials,<br>and so on; or in 3D from a plane geometry. obj is not<br>available in a component's geometry |

TABLE 3-117: VALID PROPERTY/VALUE PAIRS FOR OFFSET.

| PROPERTY     | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                         |
| contributeto | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |

The following attributes are available:

TABLE 3-118: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **SEE ALSO**

Thicken2D

# *ParameterCheck*

Check the values of parameters.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ParameterCheck");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(<tag>).create(<ftag>,"ParameterCheck") to check parameter values and issue an error if the check condition is fulfilled (being nonzero); for example, the condition r>30[mm] results in an error is the value of parameter r is larger than 30 mm. The following properties are available:

TABLE 3-119: VALID PROPERTY/VALUE PAIRS FOR PARAMETERCHECK.

| PROPERTY    | VALUE              | DEFAULT      | DESCRIPTION                                                                                                            |
|-------------|--------------------|--------------|------------------------------------------------------------------------------------------------------------------------|
| condition   | double             | 1            | The condition that checks some value of the parameters.<br>The error appears if the value of the condition is nonzero. |
| message     | string             | empty string | The error or warning message that is displayed if<br>condition is fulfilled.                                           |
| messagetype | error  <br>warning | error        | Specifies if to display an error or warning message if<br>condition is fulfilled.                                      |

# *ParametricCurve*

Create a parametric curve defined by coordinate expressions in 2D or 3D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ParametricCurve");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ParametericCurve") to create a parametric curve. Self-intersecting curves are not supported, except the case of a closed curve (that is, when the starting point and endpoint coincide). The following properties are available:

TABLE 3-120: VALID PROPERTY/VALUE PAIRS.

| PROPERTY       | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|----------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis           | double[]                                                                                 | {0,0,1}                       | Direction of the z-axis of the local coordinate<br>system. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical.                                                                                      |
| axistype       | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                                   |
| color          | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| coord          | String[2]   String[3]                                                                    | empty                         | Coordinates of parametric curve as function of<br>parameter.                                                                                                                                                                               |
| customcolor    | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| maxknots       | int                                                                                      | 1000                          | Maximum number of knots.                                                                                                                                                                                                                   |
| parname        | String                                                                                   | s                             | Parameter name.                                                                                                                                                                                                                            |
| parmax         | double                                                                                   | 1                             | Maximum parameter value.                                                                                                                                                                                                                   |
| parmin         | double                                                                                   | 0                             | Minimum parameter value.                                                                                                                                                                                                                   |
| pos            | double[]                                                                                 | {0,0,0}                       | Position of the object.                                                                                                                                                                                                                    |
| reparameterize | true   false                                                                             | false                         | Reparameterize the curve using the arc length.                                                                                                                                                                                             |
| rot            | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                               |
| rtol           | double                                                                                   | 1e-6                          | Relative tolerance.                                                                                                                                                                                                                        |
| selresult      | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow  | all   obj   dom   bnd  <br>edg   pnt   off                                               | bnd in 2D; edg<br>in 3D       | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| contributeto   | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| workplanesrc   | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from (in 3D only).                                                                                                                                                                         |
| workplane      | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is<br>the global Cartesian coordinate system.                                                                                                 |

The expressions in coord can contain functions defined in the model. If the definition of such a function is changed, the parametric curve is not automatically rebuilt. Use model.component(*<ctag>*).geom(*<tag>*). feature(*<ftag>*).importData() to rebuild the parametric curve after such a change.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-121: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **EXAMPLE**

The following commands create a parametric curve in 3D with the shape of a helix:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("pc1","ParametricCurve");
  g.feature("pc1").set("parmax","2*pi");
  g.feature("pc1").set("coord",new String[]{"cos(s)","sin(s)","s*0.2"});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('pc1','ParametricCurve');
  g.feature('pc1').set('parmax','2*pi');
  g.feature('pc1').set('coord',{'cos(s)','sin(s)','s*0.2'});
  g.run;
```

#### **SEE ALSO**

BezierPolygon, ParametricSurface

# *ParametricSurface*

Create a parametric surface defined by coordinate expressions in 3D.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ParametricSurface");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ParametericSurface") to create a parametric surface. Self-intersecting surfaces are not supported. The following properties are available:

TABLE 3-122: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the z-axis of the local coordinate<br>system. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical.                                                                              |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| coord         | String[3]                                                                                | empty                         | Coordinates of parametric surface as function of<br>parameters.                                                                                                                                                                    |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| maxknots      | int                                                                                      | 10                            | Maximum number of knots in each parameter<br>coordinate.                                                                                                                                                                           |
| parname1      | String                                                                                   | s1                            | First parameter name.                                                                                                                                                                                                              |
| parname2      | String                                                                                   | s2                            | Second parameter name.                                                                                                                                                                                                             |
| parmax1       | double                                                                                   | 1                             | Maximum value of first parameter.                                                                                                                                                                                                  |
| parmax2       | double                                                                                   | 1                             | Maximum value of second parameter.                                                                                                                                                                                                 |
| parmin1       | double                                                                                   | 0                             | Minimum value of first parameter.                                                                                                                                                                                                  |
| parmin2       | double                                                                                   | 0                             | Minimum value of second parameter.                                                                                                                                                                                                 |
| pos           | double[]                                                                                 | {0,0,0}                       | Position of the object.                                                                                                                                                                                                            |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| rtol          | double                                                                                   | 1e-6                          | Relative tolerance.                                                                                                                                                                                                                |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | bnd                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in<br>all features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from.                                                                                                                                                                              |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

The expressions in coord can contain functions defined in the model. If the definition of such a function is changed, the parametric surface is not automatically rebuilt. Use model.component(*<ctag>*).geom(*<tag>*). feature(*<ftag>*).importData() to rebuild the parametric surface after such a change.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-123: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **EXAMPLE**

The following commands create a parametric surface in 3D with the shape of a twisted rectangle:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("ps1","ParametricSurface");
  g.feature("ps1").set("parmin1","-1");
  g.feature("ps1").set("parmax2","pi");
  g.feature("ps1").set("coord",new String[]{"s1*cos(s2)","s1*sin(s2)","s2"});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('ps1','ParametricSurface');
  g.feature('ps1').set('parmin1','-1');
  g.feature('ps1').set('parmax2','pi');
  g.feature('ps1').set('coord',{'s1*cos(s2)','s1*sin(s2)','s2'});
  g.run;
```

## **SEE ALSO**

ParametricCurve

# *PartInstance*

Create an instance of a geometry part.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"PartInstance");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom().geomSequenceMethod;
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

# **DESCRIPTION**

This feature creates an instance of a geometry part with new values of its input parameters. Use model. component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).geom() to access its local copy of the part.

The following properties are available:

TABLE 3-124: VALID PROPERTY/VALUE PAIRS.

| PROPERTY  | VALUES   | DEFAULT | DESCRIPTION                                        |
|-----------|----------|---------|----------------------------------------------------|
| part      | String   |         | Tag of part to call, or local to use a local part. |
| inputname | String[] |         | Names of the input parameters (read-only).         |
| inputexpr | String[] |         | Expressions for the input parameters.              |

The default for part is the first part in model.geom(), or local if there is none.

In 3D, the following additional properties are available to control the positioning of the output objects:

TABLE 3-125: VALID PROPERTY/VALUE PAIRS IN 3D.

| PROPERTY      | VALUES                                  | DEFAULT | DESCRIPTION                                                                                                                      |
|---------------|-----------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------|
| ax2           | double[2]                               | {0,0}   | Spherical angles theta and phi, used if axistype is<br>spherical.                                                                |
| ax3           | double[3]                               | {0,0,1} | Axis vector, used if axistype is cartesian.                                                                                      |
| axis          | double[]                                | {0,0,1} | Rotation axis. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is spherical. Alias<br>for ax2 and ax3. |
| axistype      | x   y   z  <br>cartesian  <br>spherical | z       | Coordinate system used for axis. Used if specify is set to<br>axis.                                                              |
| displ         | double[3]                               | {0,0,0} | Displacement vector.                                                                                                             |
| edge          | Selection                               |         | Edge selection. Used when specify is set to edge.                                                                                |
| eulerang      | double[3]                               | {0,0,0} | Intrinsic Z-X-Z Euler angles α, β, and γ, used if specify is<br>set to eulerang.                                                 |
| rot           | double                                  | 0       | Rotation angle, used if specify is set to axis.                                                                                  |
| specify       | axis   eulerang<br>  edge               | axis    | Specify an axis of rotation, Euler angles (Z-X-Z) or a<br>straight edge.                                                         |
| workplanepart | String                                  | xyplane | Tag of work plane in the geometry part, or xyplane.                                                                              |
| workplanesrc  | String                                  | this    | Tag of PartInstance feature to take work plane from, or<br>this to take it from this sequence.                                   |
| workplane     | String                                  | xyplane | Tag of work plane to match, or xyplane.                                                                                          |

In 2D, the following additional properties are available to control the positioning of the output objects:

TABLE 3-126: VALID PROPERTY/VALUE PAIRS IN 2D.

| PROPERTY | VALUES    | DEFAULT | DESCRIPTION          |
|----------|-----------|---------|----------------------|
| displ    | double[2] | {0,0}   | Displacement vector. |
| rot      | double    | 0       | Rotation angle.      |

For each geometric entity level (object, domain, boundary, edge, and point) that exists in the geometry, there is in addition the following properties related to the output selections for that level:

TABLE 3-127: VALID PROPERTY/VALUE PAIRS FOR OUTPUT SELECTIONS.

| PROPERTY             | VALUES                         | DEFAULT  | DESCRIPTION                                                                                                                 |
|----------------------|--------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------|
| selcolorlevel        | String[]                       | all none | Colors of selections (read-only). This property is only<br>available for domains and boundaries in 3D and domains in<br>2D. |
| selkeepnoncontr      | on   off                       | on       | Keep all noncontributing selections.                                                                                        |
| seltaglevel          | String[]                       |          | Tags of selections (read-only).                                                                                             |
| selnamelevel         | String[]                       |          | Names of selections (read-only).                                                                                            |
| selcontributetolevel | String[]                       | all none | Tags of cumulative selections to contribute to, or none to<br>not contribute.                                               |
| selkeeplevel         | String[] with<br>on/off values | all off  | Keep selection from part (only used when<br>selkeepnoncontr is off).                                                        |
| selshowlevel         | String[] with<br>on/off values | all on   | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.                      |

where *level* is obj, dom, bnd, edg, or pnt for geometry objects, domains, boundaries, edges, and points, respectively.

The following attributes are available:

TABLE 3-128: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

In version 5.1, the following properties were deprecated and replaced:

TABLE 3-129: DEPRECATED PROPERTIES.

| PREVIOUS NAME | NEW NAME IN 5.1 |
|---------------|-----------------|
| arg           | inputname       |
| argexpr       | inputexpr       |
| argvalue      | inputvalue      |
| argdescr      | inputdescr      |
| subsequence   | part            |
| workplanesub  | workplanepart   |

### **EXAMPLE**

Create a geometry part that makes a torus of revolution angle *a*, where *a* is an argument (default value: 90 degrees). Then add work planes for the two planar face to make it easy to position the result:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  GeomSequence p = model.geom().create("part1", "Part", 3);
  p.inputParam().set("a", 90);
  p.create("tor1", "Torus");
  p.feature("tor1").set("angle", "a");
  p.run("tor1");
  p.create("wp1", "WorkPlane");
  p.feature("wp1").set("planetype", "faceparallel");
  p.feature("wp1").selection("face").set("tor1", new int[]{1});
  p.feature("wp1").set("reverse", "on");
  p.create("wp2", "WorkPlane");
  p.feature("wp2").set("planetype", "faceparallel");
  p.feature("wp2").selection("face").set("tor1", new int[]{6});
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  p = model.geom.create('part1', 'Part', 3);
  p.inputParam.set('a', 90);
  p.create('tor1', 'Torus');
  p.feature('tor1').set('angle', 'a');
  p.run('tor1');
  p.create('wp1', 'WorkPlane');
  p.feature('wp1').set('planetype', 'faceparallel');
  p.feature('wp1').selection('face').set('tor1', 1);
  p.feature('wp1').set('reverse', 'on');
  p.create('wp2', 'WorkPlane');
```

p.feature('wp2').set('planetype', 'faceparallel'); p.feature('wp2').selection('face').set('tor1', 6);

Create two part instances of this geometry part. The first has *a* = 90 (the default value), and the second has *a* = 120. The objects are positioned so that the two circular faces match, with a rotation angle of 50 degrees.

```
Code for Use with Java
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("pi1", "PartInstance");
  g.create("pi2", "PartInstance");
  g.feature("pi2").setIndex("inputexpr", 120, 0);
  g.feature("pi2").set("workplanepart", "wp1");
  g.feature("pi2").set("workplanesrc", "pi1");
  g.feature("pi2").set("workplane", "wp2");
  g.feature("pi2").set("rot", 50);
  g.run("pi2");
Code for Use with MATLAB
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('pi1', 'PartInstance');
  g.create('pi2', 'PartInstance');
  g.feature('pi2').setIndex('inputexpr', 120, 0);
  g.feature('pi2').set('workplanepart', 'wp1');
  g.feature('pi2').set('workplanesrc', 'pi1');
  g.feature('pi2').set('workplane', 'wp2');
  g.feature('pi2').set('rot', 50);
  g.run('pi2');
SEE ALSO
If, ElseIf, Else, EndIf
```

Partition 2D and 3D geometry objects using tool objects or a work plane.

# **SYNTAX**

*Partition*

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Partition");
model.component(<ctag>).geom(<tag>).feature().selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

## **DESCRIPTION**

The Partition Boolean operation partitions each input object using a set of tool objects or (in 3D only) a work plane. That is, within the input object new boundaries, edges, and vertices are created that come from the tools or the work plane.

The following properties are available:

| PROPERTY      | VALUE               | DEFAULT                                | DESCRIPTION                                   |
|---------------|---------------------|----------------------------------------|-----------------------------------------------|
| absrepairtol  | double              | geom( <tag>).<br/>absRepairTol()</tag> | Absolute repair tolerance.                    |
| contributeto  | String              | none                                   | Tag of cumulative selection to contribute to. |
| input         | Selection           | empty                                  | Objects to partition.                         |
| keepinput     | on   off            | off                                    | Keep input objects.                           |
| keeptool      | on   off            | off                                    | Keep tool objects.                            |
| partitionwith | objects   workplane | objects                                | Partition with tool objects or a work plane.  |

| PROPERTY      | VALUE                                      | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                                                   |
|---------------|--------------------------------------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| propagatesel  | on   off                                   | on                                      | Propagate selections from input objects to<br>resulting objects.                                                                                                                                                                              |
| repairtol     | double                                     | geom( <tag>).<br/>repairTol()</tag>     | Relative repair tolerance, relative to size of<br>union of inputs.                                                                                                                                                                            |
| repairtoltype | auto   relative  <br>absolute              | geom( <tag>).<br/>repairTolType()</tag> | Repair tolerance type: automatic, relative, or<br>absolute.                                                                                                                                                                                   |
| selresult     | on   off                                   | off                                     | Create selections of all resulting objects.                                                                                                                                                                                                   |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off | dom                                     | Show selections, if selresult is on, in<br>physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.<br>obj is not available in a component's<br>geometry. dom, bnd, and edg are not<br>available in all features. |
| tool          | Selection                                  | empty                                   | Tool objects.                                                                                                                                                                                                                                 |
| workplane     | String                                     |                                         | Work plane to partition with.                                                                                                                                                                                                                 |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-130: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

# **COMPATIBILITY**

The keep property has been deprecated in version 5.3a. Instead, use the new properties keepinput and keeptool. If you set keep to on, both keepinput and keeptool. If you get the value of keep, it is on if keepinput and keeptool are on.

# **EXAMPLE**

Create an interior boundary in a cylinder by partitioning it with an oblique work plane:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("cyl1", "Cylinder");
  g.feature("cyl1").set("h", 10);
  g.create("wp1", "WorkPlane");
  g.feature("wp1").set("planetype", "general");
  g.feature("wp1").setIndex("genpoints", 4, 0, 2);
  g.feature("wp1").setIndex("genpoints", 5, 1, 2);
  g.feature("wp1").setIndex("genpoints", 5, 2, 2);
  g.create("par1", "Partition");
  g.feature("par1").selection("input").set("cyl1");
  g.feature("par1").set("partitionwith", "workplane");
  g.run("par1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom', 3);
  g.create('cyl1', 'Cylinder');
```

```
g.feature('cyl1').set('h', 10);
g.create('wp1', 'WorkPlane');
g.feature('wp1').set('planetype', 'general');
g.feature('wp1').setIndex('genpoints', 4, 0, 2);
g.feature('wp1').setIndex('genpoints', 5, 1, 2);
g.feature('wp1').setIndex('genpoints', 5, 2, 2);
g.create('par1', 'Partition');
g.feature('par1').selection('input').set('cyl1');
g.feature('par1').set('partitionwith', 'workplane');
g.run('par1');
```

### **SEE ALSO**

Compose, Union, Intersection, Difference, WorkPlane, PartitionDomains, PartitionEdges

# *PartitionDomains*

Partition domains in 2D or 3D geometries with curves and surfaces defined in various ways.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"PartitionDomains");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

The Partition Domains operation partitions selected domains using curves or surfaces defined by vertices, edges, faces, work planes, or objects.

The following properties are available:

| PROPERTY     | VALUE                                                                                          | DEFAULT                                | DESCRIPTION                                                                                                                                                                                                   |
|--------------|------------------------------------------------------------------------------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| absrepairtol | double                                                                                         | geom( <tag>).<br/>absRepairTol()</tag> | Absolute repair tolerance.                                                                                                                                                                                    |
| color        | none   custom  <br>integer between<br>1 and the<br>number of<br>colors in the<br>current theme | none                                   | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is<br>only available when selresult in active. |
| contributeto | String                                                                                         | none                                   | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor  | RGB-triplet                                                                                    | Next available theme<br>color          | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| domain       | Selection                                                                                      |                                        | Selection of domains to partition.                                                                                                                                                                            |
| edge         | Selection                                                                                      |                                        | Edges that define the partitioning curves (2D).                                                                                                                                                               |
| extendededge | Selection                                                                                      |                                        | Edges whose underlying curves define the<br>partitioning curves (2D).                                                                                                                                         |
| extendedface | Selection                                                                                      |                                        | Faces whose underlying surfaces define the<br>partitioning surfaces (3D).                                                                                                                                     |
| face         | Selection                                                                                      |                                        | Faces that define the partitioning surfaces (3D).                                                                                                                                                             |
| keepobject   | on   off                                                                                       | on                                     | Keep objects used to partition the geometry with,<br>when partitionwith is set to objects.                                                                                                                    |
| object       | Selection                                                                                      |                                        | Geometry objects used to partition domains.                                                                                                                                                                   |

| PROPERTY      | VALUE                                                                              | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| partitionwith | linesegments  <br>lines   edges  <br>extendededges<br>  objects in 2D<br>workplane | linesegments in 2D,<br>workplane in 3D  | Method for partitioning the domains. The objects<br>option is not available for partitioning domains after<br>a form union/assembly operation.                                                                                             |
|               | faces  <br>extendedfaces<br>  objects in 3D                                        |                                         |                                                                                                                                                                                                                                            |
| propagatesel  | on   off                                                                           | on                                      | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                           |
| repairtol     | double                                                                             | geom( <tag>).<br/>repairTol()</tag>     | Relative repair tolerance, relative to size of union of<br>inputs.                                                                                                                                                                         |
| repairtoltype | auto  <br>relative  <br>absolute                                                   | geom( <tag>).<br/>repairTolType()</tag> | Repair tolerance type: automatic, relative, or<br>absolute.                                                                                                                                                                                |
| selresult     | on   off                                                                           | off                                     | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                      | dom                                     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| vertexsegment | Selection                                                                          |                                         | Vertices that define the line segments (2D).                                                                                                                                                                                               |
| vertexline    | Selection                                                                          |                                         | Vertices that define the lines (2D).                                                                                                                                                                                                       |
| workplane     | String                                                                             |                                         | Work plane to partition with (3D).                                                                                                                                                                                                         |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-131: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

# **SEE ALSO**

Partition, PartitionEdges, PartitionFaces

# *PartitionEdges*

Partition edges in 2D or 3D geometries at some positions along the edges.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"PartitionEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

The Partition Edges operation partitions selected edges at specified locations. You can specify the positions using parameters based on the arc length or existing vertices whose orthogonal projections on the edges specify the positions.

The following properties are available:

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the number<br>of colors in the current<br>theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, in<br>physics, materials, and so on; in part instances;<br>or in 3D from a plane geometry. obj is not<br>available in a component's geometry. dom, bnd,<br>and edg are not available in all features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| edge          | Selection                                                                                |                               | Selection of edges to partition.                                                                                                                                                                                                           |
| position      | arclength   projection                                                                   | arclength                     | Specifies the position along the selected edges.                                                                                                                                                                                           |
| param         | double[]                                                                                 |                               | Relative arc length parameters.                                                                                                                                                                                                            |
| vertexproj    | Selection                                                                                |                               | Vertices to project on the selected edges.                                                                                                                                                                                                 |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-132: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

# **SEE ALSO**

Partition, PartitionDomains, PartitionFaces

# *PartitionFaces*

Partition faces in 3D geometries at some positions on the faces.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"PartitionFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

The Partition Faces operation partitions selected faces at specified locations. You can specify the positions using vertices to define curve segments, adjacent edges that are extended, or a work plane.

The following properties are available:

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                   |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of<br>resulting objects in physics, materials, and so on,<br>or in part instances. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| extendededge  | Selection                                                                                |                               | Planar edges defining partitioning lines, circles,<br>or planes.                                                                                                                                                                   |
| face          | Selection                                                                                |                               | Faces to partition.                                                                                                                                                                                                                |
| partitionwith | workplane  <br>curvesegments  <br>extendededges                                          | curvesegments                 | Method for partitioning the faces.                                                                                                                                                                                                 |
| vertexsegment | Selection                                                                                |                               | Vertices that define the curve segments.                                                                                                                                                                                           |
| workplane     | String                                                                                   |                               | Work plane to partition with.                                                                                                                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-133: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **SEE ALSO**

Partition, PartitionDomains, PartitionEdges

# *Point*

Create a point object in 1D, 2D, or 3D.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Point");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Point") to create one or more points. The following property is available:

TABLE 3-134: VALID PROPERTY/VALUE PAIR.

| PROPERTY NAME | PROPERTY VALUE                     | DEFAULT                        | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| p             | double[]  <br>double[][]           | 0                              | Coordinates.                                                                                                                                                                                                                               |
| selresult     | on   off                           | off                            | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   bnd<br>  pnt   off     | pnt in 2D and 3D;<br>bnd in 1D | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                             | none                           | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| workplanesrc  | this  <br>part-instance<br>feature | this                           | Part-instance feature to take the work plane from (in<br>3D only).                                                                                                                                                                         |
| workplane     | xyplane  <br>work-plane<br>feature | xyplane                        | Work-plane feature that defines the coordinate system<br>(in 3D only). The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                 |

If p is a one-dimensional array, a single point with these coordinates is constructed. If p is a two-dimensional array, a point object containing several points is constructed, where the nth point has ith coordinate p[i][n].

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Point.

The following attributes are available:

TABLE 3-135: VALID ATTRIBUTES.

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                                               |
|--------------|----------|---------|-------------------------------------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. Available only in 2D and 3D. |

## **COMPATIBILITY**

The following aliases work in 1D, 2D, and 3D, respectively:

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"point1");
model.component(<ctag>).geom(<tag>).create(<ftag>,"point2");
model.component(<ctag>).geom(<tag>).create(<ftag>,"point3");
```

# **EXAMPLE**

The following commands generate a point at (1, 2) in a 2D geometry:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("p1","Point");
  g.feature("p1").set("p",new double[][]{{1},{2}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
```

```
g.create('p1','Point');
g.feature('p1').set('p',[1,2]);
g.run;
```

# *Polygon*

Create curve or solid polygon consisting of line segments in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Polygon");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Polygon") to create a polygon or a line segment. The following properties are available

TABLE 3-136: VALID PROPERTY/VALUE PAIRS FOR POLYGON.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| filename      | String                                                                                   |                               | If source is file, the file that contains the<br>vertex coordinates.                                                                                                                                                                       |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom in 2D; edg in<br>3D       | Show selections, if selresult is on, in<br>physics, materials, and so on; in part instances;<br>or in 3D from a plane geometry. obj is not<br>available in a component's geometry. dom, bnd,<br>and edg are not available in all features. |
| source        | table   file   vectors                                                                   | vectors                       | Whether vertex coordinates are specified as<br>vectors, a table, or read from a file.                                                                                                                                                      |
| table         | double[][]                                                                               |                               | The vertex coordinates when source is<br>table, size N*sdim.                                                                                                                                                                               |
| type          | solid   open   closed                                                                    | solid (2D)<br>open (3D)       | Object type. solid is not available in 3D.                                                                                                                                                                                                 |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from (in 3D only).                                                                                                                                                                         |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is<br>the global Cartesian coordinate system.                                                                                                 |
| x             | double[]                                                                                 | {}                            | x-coordinates for vertices.                                                                                                                                                                                                                |
| y             | double[]                                                                                 | {}                            | y-coordinates for vertices.                                                                                                                                                                                                                |
| z             | double[]                                                                                 | {}                            | z-coordinates for vertices.                                                                                                                                                                                                                |

If type is open or closed, a curve consisting of line segments is constructed. If type is solid, the solid enclosed by such a closed polygon is constructed. If type is closed or solid, but the first and last control points are different, an extra segment is added to close the curve.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importToTable() to read data from the file defined by the filename property and store the data in the table property. The source property is also changed to table.

If source is file, the polygon is not automatically rebuilt when the data in the file changes. Use model. component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData() to rebuild the polygon after such a change.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Polygon.

The following attributes are available:

TABLE 3-137: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"line1") constructs an open polygon.
model.component(<ctag>).geom(<tag>).create(<ftag>,"poly1") constructs a closed polygon.
model.component(<ctag>).geom(<tag>).create(<ftag>,"line2") or model.component(<ctag>).
geom(<tag>).create(<ftag>,"poly2") constructs a solid polygon.
```

## **EXAMPLE**

Construct a solid triangle pol1:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("pol1","Polygon");
  g.feature("pol1").set("x","0,0,2").set("y","1,0,0");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('pol1','Polygon');
  g.feature('pol1').set('x','0,0,2').set('y','1,0,0');
  g.run;
```

## **SEE ALSO**

CubicBezier, QuadraticBezier

# *Pyramid*

Create solid or surface rectangular pyramid or frustum in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Pyramid");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Pyramid") to create a pyramid. The following properties are available:

TABLE 3-138: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| a, b          | double                                                                                   | 1                             | Side lengths for bottom rectangle.                                                                                                                                                                                                 |
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the axis orthogonal to the bottom<br>rectangle. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical.                                                                            |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| h             | double                                                                                   | 1                             | Height.                                                                                                                                                                                                                            |
| pos           | double[]                                                                                 | {0,0,0}                       | Center of the bottom rectangle.                                                                                                                                                                                                    |
| rat           | double                                                                                   | 0.5                           | Ratio of perimeter of top rectangle and bottom<br>rectangle.                                                                                                                                                                       |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| type          | solid   surface                                                                          | solid                         | Object type.                                                                                                                                                                                                                       |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-Instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-139: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"pyramid3") creates a solid pyramid.
model.component(<ctag>).geom(<tag>).create(<ftag>,"pyramid2") creates a surface pyramid.
```

The following properties are also available:

TABLE 3-140: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

#### **EXAMPLE**

Create a pyramid frustum with the base face in the *xy*-plane:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("e1","Pyramid");
  g.feature("e1").set("a",10).set("b",40);
  g.feature("e1").set("h",20);
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('e1','Pyramid');
  g.feature('e1').set('a',10).set('b',40);
  g.feature('e1').set('h',20);
Create a pyramid with an apex:
Code for Use with Java
  g.create("e2","Pyramid");
  g.feature("e2").set("a",1).set("b",2);
  g.feature("e2").set("h",4);
  g.feature("e2").set("rat",0);
  g.feature("e2").set("pos","100 100 100");
  g.feature("e2").set("axis","0 1 4");
  g.feature("e2").set("rot",45);
  g.run();
Code for Use with MATLAB
  g.create('e2','Pyramid');
  g.feature('e2').set('a',1).set('b',2);
  g.feature('e2').set('h',4);
  g.feature('e2').set('rat',0);
  g.feature('e2').set('pos','100 100 100');
  g.feature('e2').set('axis','0 1 4');
  g.feature('e2').set('rot',45);
  g.run;
```

## **SEE ALSO**

Cone, ECone

Create a rational Bézier curve of degree 2 in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"QuadraticBezier");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"QuadraticBezier") to create a quadratic Bézier curve in 2D or 3D. The following properties are available:

TABLE 3-141: VALID PROPERTY/VALUE PAIRS FOR A QUADRATIC BÉZIER CURVE.

| PROPERTY      | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between<br>1 and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is<br>only available when selresult in active.                              |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| p             | double[sdim][3]                                                                             | 0                             | Control points.                                                                                                                                                                                                                            |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from<br>a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| w             | double[3]                                                                                   | {1, 1/sqrt(2),1}              | Weights for the control points.                                                                                                                                                                                                            |
| workplanesrc  | this  <br>part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from<br>(in 3D only).                                                                                                                                                                         |
| workplane     | xyplane  <br>work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is the<br>global Cartesian coordinate system.                                                                                                 |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see QuadraticBezier.

The following attributes are available:

TABLE 3-142: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **EXAMPLE**

The following commands creates a quadratic Bézier curve in 2D with control points in (4, 2); (8, 8); and (16, 4):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("qb1", "QuadraticBezier");
  g.feature("qb1").setIndex("p", 4, 0, 0);
  g.feature("qb1").setIndex("p", 2, 1, 0);
  g.feature("qb1").setIndex("p", 8, 0, 1);
  g.feature("qb1").setIndex("p", 8, 1, 1);
  g.feature("qb1").setIndex("p", 16, 0, 2);
  g.feature("qb1").setIndex("p", 4, 1, 2);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('qb1','QuadraticBezier');
  g.feature('qb1').setIndex('p', 4, 0, 0);
  g.feature('qb1').setIndex('p', 2, 1, 0);
  g.feature('qb1').setIndex('p', 8, 0, 1);
  g.feature('qb1').setIndex('p', 8, 1, 1);
  g.feature('qb1').setIndex('p', 16, 0, 2);
  g.feature('qb1').setIndex('p', 4, 1, 2);
  g.run;
```

## **SEE ALSO**

CubicBezier, CompositeCurve

# *Rectangle*

Create a solid or curve rectangle in 2D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Rectangle");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Rectangle") to create a rectangle. The following properties are available:

TABLE 3-143: VALID PROPERTY/VALUE PAIRS.

| PROPERTY     | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| base         | corner   center                                                                             | corner                        | Positions the object either centered about pos or with the<br>lower-left corner in pos.                                                                                                                       |
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |
| contributeto | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                         |
| layer        | double[]                                                                                    |                               | Thicknesses of layers.                                                                                                                                                                                        |
| layerleft    | on   off                                                                                    | off                           | Apply layers to the left.                                                                                                                                                                                     |

TABLE 3-143: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                | DEFAULT | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|--------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| layerright    | on   off                             | off     | Apply layers to the right.                                                                                                                                                                                                              |
| layertop      | on   off                             | off     | Apply layers on top.                                                                                                                                                                                                                    |
| layerbottom   | on   off                             | on      | Apply layers on bottom.                                                                                                                                                                                                                 |
| pos           | double[]                             | {0,0}   | Position of the object.                                                                                                                                                                                                                 |
| rot           | double                               | 0       | Rotational angle about pos.                                                                                                                                                                                                             |
| sellayer      | on   off                             | off     | Create layer selections.                                                                                                                                                                                                                |
| sellayershow  | on   off                             | on      | Show layer selections in physics/instances/3D (used if<br>sellayer is on)                                                                                                                                                               |
| selresult     | on   off                             | off     | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow | all   obj   dom  <br>bnd   pnt   off | dom     | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| size          | double[]                             | {1,1}   | Side lengths.                                                                                                                                                                                                                           |
| type          | solid   curve                        | solid   | Object type.                                                                                                                                                                                                                            |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Rectangle.

The following attributes are available:

TABLE 3-144: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

# **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"rect2") creates a solid rectangle.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"rect1") creates a curve rectangle.

The following properties are also available:

TABLE 3-145: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION     |
|----------|--------|---------|-----------------|
| lx, ly   | double | 1       | Alias for size. |
| x, y     | double | 0       | Alias for pos.  |

The property const is no longer available.

# *RemoveDetails*

Remove small details from the geometry.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"RemoveDetails");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("input");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"RemoveDetails") to automatically remove small details from the geometry. You can also add extra local virtual operations using the following syntax (in this example, adding an IgnoreEdges operation):

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).create("IgnoreEdges", "ige1");
```

You can then build that local virtual operation using

```
model.component(<ctag>).geom(<tag>).run("<ftag>/ige1");
```

You can also use the selection property input:

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("input");
```

If the RemoveDetails operation is in the automatic state, use the .problems() syntax to retrieve information on warnings (if any). The problem list is cleared if you switch to the manual state.

The following properties are available:

TABLE 3-146: VALID PROPERTY/VALUE PAIRS FOR REMOVEDETAILS.

| PROPERTY       | VALUES                        | DEFAULT   | DESCRIPTION                                                                                                       |
|----------------|-------------------------------|-----------|-------------------------------------------------------------------------------------------------------------------|
| automatic      | on   off                      | on        | Mode of operation.                                                                                                |
| contangletol   | double                        | 5 degrees | Maximum allowed angular tangent deviation across a<br>vertex or edge to be ignored.                               |
| contvertices   | boolean                       | true      | Specifies if vertices with continuous tangent are ignored.                                                        |
| detailsizetype | auto   relative  <br>absolute | auto      | Detail size type: automatic, relative, or absolute.                                                               |
| input          | Selection                     |           | Entities for which to remove small details.                                                                       |
| maxrelsize     | double                        | 0.001     | Maximum relative detail size, relative to size of geometry.                                                       |
| maxabssize     | double                        |           | Maximum absolute detail size.                                                                                     |
| selection      | geometry  <br>entities        | geometry  | Remove small details from the entire geometry or from<br>geometric entities specified using the input.            |
| shortedges     | boolean                       | true      | Specifies if short edges are removed.                                                                             |
| sliverfaces    | boolean                       | true      | Specifies if sliver faces are removed.                                                                            |
| smallfaces     | boolean                       | true      | Specifies if small faces are removed.                                                                             |
| thindomains    | boolean                       | true      | Specifies if thin domains (that is, domains with a<br>thickness less than the specified detail size) are removed. |

# *Revolve*

Revolve planar faces in 3D.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Revolve");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Revolve") to revolve objects from a work plane.

Use model.component(*<ctag>*).geom(<tag>).feature(<ftag>).selection("input") to select the work plane objects to revolve. The default selection is all available objects from the last preceding work plane.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("inputface") to select the faces to revolve. Faces are revolved when the workplane property is none; otherwise, work plane objects are revolved.

The following properties are available:

TABLE 3-147: VALID PROPERTY/VALUE PAIRS FOR REVOLVE.

| PROPERTY       | VALUES                                                                                      | DEFAULT                                        | DESCRIPTION                                                                                                                                                                                                      |
|----------------|---------------------------------------------------------------------------------------------|------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1         | double                                                                                      | 0                                              | Start revolution angle.                                                                                                                                                                                          |
| angle2         | double                                                                                      | 0                                              | End revolution angle.                                                                                                                                                                                            |
| angtype        | specang   full                                                                              | specang                                        | Type of specification.                                                                                                                                                                                           |
| axis           | double[2]                                                                                   | {0,1}                                          | Direction of axis of revolution (in local<br>coordinate system).                                                                                                                                                 |
| axis3          | double[3]                                                                                   | {0,1,0}                                        | Direction of axis of revolution (in 3D coordinate<br>system).                                                                                                                                                    |
| axistype       | 2d   3d   edge                                                                              | 2d                                             | Type of revolution axis.                                                                                                                                                                                         |
| color          | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none                                           | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |
| contributeto   | String                                                                                      | none                                           | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| customcolor    | RGB-triplet                                                                                 | Next available<br>theme color                  | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| edge           | Selection                                                                                   |                                                | Specifies a straight edge used as revolution axis<br>when axistype is edge.                                                                                                                                      |
| input          | Selection                                                                                   | all objects                                    | Objects to revolve.                                                                                                                                                                                              |
| intputedge     | Selection                                                                                   |                                                | Edges to revolve. Used if revolvefrom is<br>edges.                                                                                                                                                               |
| intputface     | Selection                                                                                   |                                                | Faces to revolve. Used if revolvefrom is<br>faces.                                                                                                                                                               |
| intputvertex   | Selection                                                                                   |                                                | Vertices to revolve. Used if revolvefrom is<br>vertices.                                                                                                                                                         |
| origfaces      | on   off                                                                                    | on                                             | Keep original faces.                                                                                                                                                                                             |
| pos            | double[2]                                                                                   | {0,0}                                          | A point on the axis of revolution (in work plane's<br>coordinate system).                                                                                                                                        |
| pos3           | double[3]                                                                                   | {0,0,0}                                        | A point on the axis of revolution (in 3D<br>coordinate system).                                                                                                                                                  |
| propagatesel   | on   off                                                                                    | on                                             | Propagate selections from input objects to<br>resulting objects.                                                                                                                                                 |
| revolvefrom    | workplane   faces<br>  edges   vertices                                                     | workplane, if<br>available, otherwise<br>faces | Revolve work plane objects, faces, edges, or<br>vertices from 3D objects.                                                                                                                                        |
| selrevolve     | on   off                                                                                    | off                                            | Revolve selections from work plane (used if<br>revolvefrom is workplane)                                                                                                                                         |
| selrevolveshow | on   off                                                                                    | on                                             | Show revolved selections in physics/instances<br>(only used when selrevolve is on)                                                                                                                               |
| selresult      | on   off                                                                                    | off                                            | Create selections of all resulting objects.                                                                                                                                                                      |

TABLE 3-147: VALID PROPERTY/VALUE PAIRS FOR REVOLVE.

| PROPERTY      | VALUES                                        | DEFAULT | DESCRIPTION                                                                                                                                                                                                |
|---------------|-----------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off | dom     | Show selections of resulting objects in physics,<br>materials, and so on, or in part instances. obj is<br>not available in a component's geometry. dom,<br>bnd, and edg are not available in all features. |
| unite         | on   off                                      | on      | Unite revolved objects with input objects.                                                                                                                                                                 |
| workplane     | String                                        |         | Work plane to revolve or none to revolve faces.                                                                                                                                                            |

Each 2D object in input or planar face in inputface is revolved about the revolution axis. The range of angles is given by the properties angle1 and angle2. If axistype is 2d, the revolution axis is defined in a local coordinate system. The revolution axis goes through pos with direction axis. If axistype is 3d, the revolution axis is defined in the 3D coordinate system. The revolution axis goes through pos3 with direction axis3.

When revolving work plane objects, the local system is defined as the local system of the work plane. When revolving faces, the local system is defined by the face with the smallest face number in the object that comes first in the geometry sequence. The local *z*-axis is parallel to the face normal and located at the center of the face. The local *x*-axis is defined by the tangent direction corresponding to the first parameter in the surface representation for the face.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-148: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

# **COMPATIBILITY**

Additional properties:

TABLE 3-149: VALID PROPERTY/VALUE PAIRS FOR COMPATIBILITY.

| PROPERTY | VALUES             | DEFAULT       | DESCRIPTION                                            |
|----------|--------------------|---------------|--------------------------------------------------------|
| angles   | double   double[2] | 2*pi          | Alias for angle1 and angle2.                           |
| keep     | on   off           | off           | Alias for unite property with opposite value.          |
| revaxis  | double[2][2]       | {{0,0},{0,1}} | Alias for pos (first column) and axis (second column). |

# **EXAMPLE**

Create a torus about the *y*-axis:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.geom().create("geom1",3);
  g.create("wp1","WorkPlane");
  g.feature("wp1").geom().create("c1", "Circle");
  g.feature("wp1").geom().feature("c1").set("pos", "2 0");
  g.run("wp1");
  g.create("r1","Revolve");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  g = model.geom.create('geom1',3);
```

```
g.create('wp1','WorkPlane');
g.feature('wp1').geom.create('c1', 'Circle');
g.feature('wp1').geom.feature('c1').set('pos', '2 0');
g.run('wp1');
g.create('r1','Revolve');
g.run;
```

#### **SEE ALSO**

Extrude, WorkPlane

# *RigidTransform*

Perform a rigid transform (translation and rotation) of 3D geometry objects. You can use this feature to position and orient geometry objects by matching a coordinate system (work plane) with another coordinate system (work plane) and then optionally performing a rotation and translation in the work plane's coordinate system.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"RigidTransform");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"RigidTransform") to make a rigid transform of 3D geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects for which to perform a rigid transform. The default selection is empty.

The following properties are available:

TABLE 3-150: VALID PROPERTIES FOR RIGIDTRANSFORM.

| NAME         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ax2          | double[2]                                                                                | {0,0}                         | Spherical angles theta and phi, used if axistype is<br>spherical.                                                                                                                                                |
| ax3          | double[3]                                                                                | {0,0,1}                       | Axis vector, used if axistype is cartesian.                                                                                                                                                                      |
| axis         | double[]                                                                                 | {0,0,1}                       | Rotation axis. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical. Alias for ax2 and ax3.                                                                                 |
| axistype     | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. Used if specify<br>is set to axis.                                                                                                                                              |
| color        | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |
| contributeto | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| displ        | double[3]                                                                                | {0,0,0}                       | Displacement.                                                                                                                                                                                                    |
| edge         | Selection                                                                                |                               | Edge selection. Used when specify is set to edge.                                                                                                                                                                |

TABLE 3-150: VALID PROPERTIES FOR RIGIDTRANSFORM.

| NAME          | VALUE                                      | DEFAULT | DESCRIPTION                                                                                                                                                                          |
|---------------|--------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eulerang      | double[3]                                  | {0,0,0} | Intrinsic Z-X-Z Euler angles α, β, and γ, used if<br>specify is set to eulerang.                                                                                                     |
| input         | object selection                           |         | Geometry objects to perform a rigid<br>transformation of.                                                                                                                            |
| keep          | on   off                                   | off     | Keep input objects.                                                                                                                                                                  |
| propagatesel  | on   off                                   | on      | Propagate selections from input objects to resulting<br>objects.                                                                                                                     |
| rot           | double[]                                   | 0       | Rotation angles for one or more rotations of the<br>input objects, used if specify is set to axis.                                                                                   |
| selresult     | on   off                                   | off     | Create selections of all resulting objects.                                                                                                                                          |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off | dom     | Show selections, if selresult is on, in physics,<br>materials, and so on. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| specify       | axis   eulerang  <br>edge                  | axis    | Specify an axis of rotation, Euler angles (Z-X-Z), or<br>a straight edge.                                                                                                            |
| workplane     | xyplane   work-plane<br>feature tag        | xyplane | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                        |
| workplaneobj  | xyplane   work-plane<br>feature tag        | xyplane | The work plane for the geometry objects.                                                                                                                                             |
| workplanesrc  | this  part-instance<br>feature tag         | this    | The source to take the work plane from.                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-151: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **SEE ALSO**

Mirror, Move, Copy, Scale, Rotate

# *Rotate*

Rotate objects about a point in 2D or an axis in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Rotate");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Rotate") to rotate geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to rotate. The default selection is empty.

The following properties are available:

TABLE 3-152: VALID PROPERTIES FOR ROTATE.

| NAME          | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ax2           | double[2]                                                                                | {0,0}                         | Spherical angles theta and phi, used if axistype is<br>spherical.                                                                                                                                                                          |
| ax3           | double[3]                                                                                | {0,0,1}                       | Axis vector, used if axistype is cartesian.                                                                                                                                                                                                |
| axis          | double[]                                                                                 | {0,0,1}                       | Rotation axis. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical. Alias for ax2 and ax3.                                                                                                           |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. Used if specify<br>is set to axis.                                                                                                                                                                        |
| color         | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                           |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| edge          | Selection                                                                                |                               | Edge selection. Used when specify is set to edge.                                                                                                                                                                                          |
| eulerang      | double[3]                                                                                | {0,0,0}                       | Intrinsic Z-X-Z Euler angles α, β, and γ, used if<br>specify is set to eulerang.                                                                                                                                                           |
| input         | Selection                                                                                |                               | Objects to rotate.                                                                                                                                                                                                                         |
| keep          | on   off                                                                                 | off                           | Keep input objects.                                                                                                                                                                                                                        |
| pos           | double[]                                                                                 |                               | Center of rotation.                                                                                                                                                                                                                        |
| propagatesel  | on   off                                                                                 | on                            | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                           |
| rot           | double[]                                                                                 | 0                             | Rotation angles for one or more rotations of the<br>input objects, used if specify is set to axis.                                                                                                                                         |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| specify       | axis   eulerang  <br>edge                                                                | axis                          | Specify an axis of rotation, Euler angles (Z-X-Z), or<br>a straight edge.                                                                                                                                                                  |
| workplane     | xyplane   work-plane<br>feature tag                                                      | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is the<br>global Cartesian coordinate system.                                                                                                 |
| workplanesrc  | this   part-instance<br>feature tag                                                      | this                          | Part-instance feature to take the work plane from<br>(in 3D only).                                                                                                                                                                         |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Rotate.

The following attributes are available:

TABLE 3-153: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

The possibility to set and get a rotation matrix has been removed.

The property out is no longer available.

## **EXAMPLE**

The commands below create and then rotate an ellipse by 10 degrees about (2, 3):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("e1","Ellipse");
  g.feature("e1").set("semiaxes","1 3");
  g.create("r1","Rotate");
  g.feature("r1").selection("input").set("e1");
  g.feature("r1").set("rot",10);
  g.feature("r1").set("pos", "2 3");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('e1','Ellipse');
  g.feature('e1').set('semiaxes','1 3');
  g.create('r1','Rotate');
  g.feature('r1').selection('input').set('e1');
  g.feature('r1').set('rot',10);
  g.feature('r1').set('pos', '2 3');
  g.run;
```

# **SEE ALSO**

Mirror, Move, Copy, Scale, RigidTransform

*Scale*

Scale objects around a point.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Scale");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Scale") to scale geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to scale. The default selection is empty.

The following properties are available:

TABLE 3-154: VALID PROPERTIES FOR SCALE.

| NAME          | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                      |
| factor        | double   double[]                                                                           | 1                             | Scale factor(s).                                                                                                                                                                                                                           |
| input         | Selection                                                                                   |                               | Objects to scale.                                                                                                                                                                                                                          |
| keep          | on   off                                                                                    | off                           | Keep input objects.                                                                                                                                                                                                                        |
| propagatesel  | on   off                                                                                    | on                            | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                           |
| pos           | double[]                                                                                    | 0                             | Center of scaling.                                                                                                                                                                                                                         |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                               | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| workplanesrc  | this  <br>part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from (in<br>3D only).                                                                                                                                                                         |
| workplane     | xyplane  <br>work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate system<br>(in 3D only). The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                 |

If factor is an array, the inputs are scaled by the factor[i] in the ith coordinate.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Scale.

The following attributes are available:

TABLE 3-155: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

The sequence below scales the unit circle by (1, 2) about (2, 3):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
```

```
g.create("c1","Circle");
  g.create("s1","Scale");
  g.feature("s1").selection("input").set("c1");
  g.feature("s1").set("factor", "1,2");
  g.feature("s1").set("pos",new double[]{2,3});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.create('s1','Scale');
  g.feature('s1').selection('input').set('c1');
  g.feature('s1').set('factor', '1,2');
  g.feature('s1').set('pos',[2,3]);
  g.run;
```

#### **COMPATIBILITY**

The property out is no longer available.

## **SEE ALSO**

Mirror, Move, Copy, Rotate, RigidTransform

# *Sphere*

Create a solid ball or surface sphere in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Sphere");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Sphere") to create a sphere. The following properties are available:

TABLE 3-156: VALID PROPERTY/VALUE PAIRS FOR SPHERE.

| PROPERTY     | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis         | double[]                                                                                 | {0,0,1}                       | Direction of the local z-axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if<br>axistype is spherical.                                                                                        |
| axistype     | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                         |
| color        | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |
| contributeto | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| layer        | double[]                                                                                 |                               | Thicknesses of layers.                                                                                                                                                                                           |
| pos          | double[]                                                                                 | {0,0,0}                       | Center.                                                                                                                                                                                                          |

TABLE 3-156: VALID PROPERTY/VALUE PAIRS FOR SPHERE.

| PROPERTY      | VALUE                                      | DEFAULT | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|--------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| r             | double                                     | 1       | Radius.                                                                                                                                                                                                                            |
| rot           | double                                     | 0       | Rotational angle about axis.                                                                                                                                                                                                       |
| sellayer      | on   off                                   | off     | Create layer selections.                                                                                                                                                                                                           |
| sellayershow  | on   off                                   | on      | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                                             |
| selresult     | on   off                                   | off     | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off | dom     | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in<br>all features. |
| type          | solid   surface                            | solid   | Object type.                                                                                                                                                                                                                       |
| workplanesrc  | this   part-instance<br>feature            | this    | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature            | xyplane | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-157: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"sphere3") creates a solid sphere.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"sphere2") creates a surface sphere.

The following properties are also available:

TABLE 3-158: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

# **EXAMPLE**

The following commands create a surface and solid sphere, where the position and radius are defined differently:

*Code for Use with Java*

```
Model model = ModelUtil.create("Model1");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1",3);
g.create("s2","Sphere");
g.feature("s2").set("type","surface");
g.feature("s2").set("pos","0 1 0");
g.create("s3","Sphere");
g.feature("s3").set("r",4);
```

```
g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('s2','Sphere');
  g.feature('s2').set('type','surface');
  g.feature('s2').set('pos','0 1 0');
  g.create('s3','Sphere');
  g.feature('s3').set('r',4);
  g.run;
SEE ALSO
Ellipsoid
Split
```

Split (explode) objects into domains, faces, edges, or vertices.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Split");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Split") to split geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to split. The default selection is empty.

TABLE 3-159: VALID PROPERTY/VALUE PAIRS FOR SPLIT.

| PROPERTY      | VALUE                                                                                                   | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|---------------------------------------------------------------------------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in<br>the current<br>theme | none                          | The color of the selection, either given as an integer indicating<br>a color in the color theme, or as a custom color in the<br>customcolor property. Coloring is only available when<br>selresult in active.                           |
| customcolor   | RGB-triplet                                                                                             | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| input         | Selection                                                                                               |                               | Objects to split.                                                                                                                                                                                                                       |
| keep          | on   off                                                                                                | off                           | Keep input objects.                                                                                                                                                                                                                     |
| propagatesel  | on   off                                                                                                | on                            | Propagate selections from input objects to resulting objects.                                                                                                                                                                           |
| selresult     | on   off                                                                                                | off                           | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off                                                        | dom                           | Show selections, if selresult is on, in physics, materials, and<br>so on; in part instances; or in 3D from a plane geometry. obj<br>is not available in a component's geometry. dom, bnd, and edg<br>are not available in all features. |
| contributeto  | String                                                                                                  | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                           |

- **•** A solid object is split into solids corresponding to its domains.
- **•** A surface object is split into surface objects corresponding to its faces.
- **•** A curve object is split into curve objects corresponding to its edges.
- **•** A point object is split into point objects corresponding to its vertices.
- **•** A general (mixed) object is split into solids (corresponding to the domains), surface objects (corresponding to faces not adjacent to a domain), curve objects (corresponding to edges not adjacent to a face or domain), and point objects (corresponding to vertices not adjacent to an edge, face, or domain).

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-160: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

Split union of a solid circle and a solid rectangle.

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("r1","Rectangle");
  g.create("c1","Circle");
```

g.create("u1","Union");

```
g.feature("u1").selection("input").set(new String[]{"r1","c1"});
  g.create("spl1","Split");
  g.feature("spl1").selection("input").set("u1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.create('c1','Circle');
  g.create('u1','Union');
  g.feature('u1').selection('input').set({'r1','c1'});
  g.create('spl1','Split');
  g.feature('spl1').selection('input').set('u1');
  g.run;
```

## **SEE ALSO**

Compose, Union, Intersection, Difference, Delete

*Square*

Create a solid or curve square in 2D.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Square");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Square") to create a square. The following properties are available:

TABLE 3-161: VALID PROPERTY/VALUE PAIRS FOR SQUARE.

| PROPERTY    | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|-------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| base        | corner   center                                                                             | corner                        | Positions the object either centered about pos or with<br>the lower left corner in pos.                                                                                                                       |
| color       | none   custom  <br>integer between<br>1 and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| customcolor | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                         |
| layer       | double[]                                                                                    |                               | Thicknesses of layers.                                                                                                                                                                                        |
| layerleft   | on   off                                                                                    | off                           | Apply layers to the left.                                                                                                                                                                                     |
| layerright  | on   off                                                                                    | off                           | Apply layers to the right.                                                                                                                                                                                    |
| layertop    | on   off                                                                                    | off                           | Apply layers on top.                                                                                                                                                                                          |
| layerbottom | on   off                                                                                    | on                            | Apply layers on bottom.                                                                                                                                                                                       |
| pos         | double[]                                                                                    | {0,0}                         | Position of the object.                                                                                                                                                                                       |
| rot         | double                                                                                      | 0                             | Rotational angle about pos.                                                                                                                                                                                   |
| size        | double                                                                                      | 1                             | Side length.                                                                                                                                                                                                  |
| type        | solid   curve                                                                               | solid                         | Object type.                                                                                                                                                                                                  |

TABLE 3-161: VALID PROPERTY/VALUE PAIRS FOR SQUARE.

| PROPERTY      | VALUE                                | DEFAULT<br>DESCRIPTION |                                                                                                                                                                                                                                            |
|---------------|--------------------------------------|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| sellayer      | on   off                             | off                    | Create layer selections.                                                                                                                                                                                                                   |
| sellayershow  | on   off                             | on                     | Show layer selections in physics/instances/3D (used if<br>sellayer is on)                                                                                                                                                                  |
| selresult     | on   off                             | off                    | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off | dom                    | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                               | none                   | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Square.

The following attributes are available:

TABLE 3-162: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"square2") creates a solid square. model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"square1") creates a curve square.

The following properties are also available:

TABLE 3-163: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION     |
|----------|--------|---------|-----------------|
| l        | double | 1       | Alias for size. |
| x, y     | double | 0       | Alias for pos.  |

The property const is no longer available.

# **EXAMPLE**

The sequence below creates a unit solid square:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("sq1","Square");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom',2);
  g.create('sq1','Square');
  g.run;
```

#### **SEE ALSO**

Rectangle

Sweep one or several faces, edges, or points along a spine curve into solids, surfaces, or curves in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Sweep");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Sweep") to sweep faces, edges, or points along a spine curve.

Use to the following methods to set the dimension of the entities to sweep and to select the entities:

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).
                         selection("enttosweep").init(entDim);
model.component(<ctag>).geom(<tag>).feature(<ftag>).
                         selection("enttosweep").set(<objname>,entities);
```

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("edge") to select the edges to sweep along.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("diredge") to select the edge whose direction defines the positive sweep direction. If this selection is empty, it is automatically set when the edge selection is set. The diredge selection can be empty if the edge selection contains a single edge.

The following properties are available:

TABLE 3-164: VALID PROPERTY/VALUE PAIRS FOR SWEEP.

| PROPERTY     | VALUES                                                                                   | DEFAULT                          | DESCRIPTION                                                                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| adjustlen    | double                                                                                   | 0.1                              | Adjustment parameter length at start of spine.<br>Only used if spineperpstart is on.                                                                                                                             |
| adjustlenend | double                                                                                   | 0.1                              | Adjustment parameter length at end. Only<br>used if spineperpend is on.                                                                                                                                          |
| color        | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                             | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active. |
| contributeto | String                                                                                   | none                             | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| customcolor  | RGB-triplet                                                                              | Next<br>available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| crossfaces   | on   off                                                                                 | off                              | Create cross-sectional faces. Only used if<br>enttosweep has geometric entity level 2.                                                                                                                           |
| diredge      | Selection                                                                                |                                  | Direction-defining edge.                                                                                                                                                                                         |
| edge         | Selection                                                                                |                                  | Edges that form spine curve of the sweep.                                                                                                                                                                        |
| enttomatch   | Selection                                                                                |                                  | Entities to match (with level 2, 1, or 0). Only<br>used if spineperpend is on.                                                                                                                                   |
| enttosweep   | Selection                                                                                |                                  | Entities to sweep (supported levels 2, 1, or 0).                                                                                                                                                                 |
| grep         | bezier   spline                                                                          | spline                           | Geometry representation.                                                                                                                                                                                         |

TABLE 3-164: VALID PROPERTY/VALUE PAIRS FOR SWEEP.

| PROPERTY           | VALUES                                           | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                        |
|--------------------|--------------------------------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| includefinal       | on   off                                         | off       | Include all used input objects in Finalize<br>operation.                                                                                                                                                                           |
| keep               | on   off                                         | on        | Keep input objects.                                                                                                                                                                                                                |
| manualdir          | on   off                                         | on        | Manual control of sweep direction.                                                                                                                                                                                                 |
| matchvertices      | on   off                                         | off       | Add twisting and scaling to match vertices.                                                                                                                                                                                        |
| maxknots           | int                                              | 1000      | Maximum number of knots.                                                                                                                                                                                                           |
| movetospine        | on   off                                         | off       | Move entities to sweep to spine start and<br>match work plane coordinate system with<br>spine.                                                                                                                                     |
| parameterization   | arclength  <br>normalizedarclength<br>  internal | arclength | Parameterization of the spine curve: arc length,<br>normalized arc length, or the internal<br>parameterization in the geometry's data<br>structures.                                                                               |
| parname            | String                                           | s         | Parameter name.                                                                                                                                                                                                                    |
| projvector         | String[]                                         | {0,0,1}   | The vector to follow when controlling the<br>twisting of the cross section. Only used if<br>twisting is projvector.                                                                                                                |
| propagatesel       | on   off                                         | on        | Propagate selections from input objects to<br>resulting objects.                                                                                                                                                                   |
| reversedir         | on   off                                         | off       | Reverse sweep direction. Only used if<br>manualdir is on.                                                                                                                                                                          |
| rtol               | double                                           | 1e-4      | Relative tolerance.                                                                                                                                                                                                                |
| scale              | String                                           | 1         | Scale factor for cross section.                                                                                                                                                                                                    |
| selresult          | on   off                                         | off       | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow      | all   obj   dom   bnd  <br>edg   pnt   off       | dom       | Show selections, if selresult is on, of<br>resulting objects in physics, materials, and so<br>on, or in part instances. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| smooth             | on   off                                         | on        | Smooth edge connections.                                                                                                                                                                                                           |
| spineperpend       | on   off                                         | off       | Make spine perpendicular to entities to match<br>at end of spine curve.                                                                                                                                                            |
| spineperpstart     | on   off                                         | off       | Make spine perpendicular to entities to sweep<br>at start of spine curve.                                                                                                                                                          |
| twist              | String                                           | 0         | Twist angle for cross section.                                                                                                                                                                                                     |
| twisting           | none   projvector  <br>curvature                 | none      | Select how the twisting of cross section is<br>done.                                                                                                                                                                               |
| vertexinenttosweep | Selection                                        |           | Vertex in entity to sweep. Only used if<br>matchvertices is on.                                                                                                                                                                    |
| vertextomatch      | Selection                                        |           | Vertex to match at end. Only used if<br>matchvertices is on.                                                                                                                                                                       |

If includefinal is off, input objects are automatically removed in the Finalize (Form Union/Assembly) operation if they are completely used by this feature. Objects used in enttosweep are considered completely used if all of their entities of the selected dimension (2, 1, or 0) are included in enttosweep. Objects used in edge are considered completely used if all their edges are included in edge. If an object is considered completely used by one property but not completely used by another property, the object is not removed in the Finalize operation. If includefinal is on, input objects are not removed in the Finalize operation.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-165: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

#### **COMPATIBILITY**

In COMSOL Multiphysics 4.2a and earlier versions, the positive sweep direction was defined as the curve direction instead of the edge direction.

#### **EXAMPLE**

Create a half torus about the *y*-axis using a sweep operation:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("wp1","WorkPlane");
  g.feature("wp1").geom().create("c1","Circle");
  g.create("pc1","ParametricCurve");
  g.create("swe1","Sweep");
  g.feature("pc1").set("parmax","pi");
  g.feature("pc1").set("coord",new String[]{"(cos(s)-1)*3","0","sin(s)*3"});
  g.feature("swe1").selection("enttosweep").set("wp1.c1", new int[]{1});
  g.feature("swe1").selection("edge").set("pc1(1)",new int[]{1});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('wp1','WorkPlane');
  g.feature('wp1').geom.create('c1','Circle');
  g.create('pc1','ParametricCurve');
  g.create('swe1','Sweep');
  g.feature('pc1').set('parmax','pi');
  g.feature('pc1').set('coord',{'(cos(s)-1)*3','0','sin(s)*3'});
  g.feature('swe1').selection('enttosweep').set('wp1.c1', 1);
  g.feature('swe1').selection('edge').set('pc1(1)', 1);
  g.run;
```

# **SEE ALSO**

Extrude, Helix, Revolve, WorkPlane

# *Tangent*

Create a tangent line segment to one or two 2D edges.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Tangent");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Tangent") to create a line segment tangent to two edges or tangent to one edge with a fixed endpoint. The following properties are available:

TABLE 3-166: VALID PROPERTY/VALUE PAIRS FOR TANGENT.

| PROPERTY      | VALUE                                | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|--------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| contributeto  | String                               | none    | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| edge          | Selection                            |         | Edge in a geometry object to find tangent to.                                                                                                                                                                                              |
| selresult     | on   off                             | off     | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   bnd   edg  <br>pnt   off | bnd     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| start         | double                               | 0.5     | Start guess for parameter value of point of<br>tangency.                                                                                                                                                                                   |
| type          | edge   point   coord                 | edge    | Type of tangent.                                                                                                                                                                                                                           |

If type is edge a common tangent line to two edges are constructed. Then, the following additional properties are available:

TABLE 3-167: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                                             |
|----------|-----------|---------|---------------------------------------------------------|
| edge2    | Selection |         | Second edge in some geometry object to find tangent to. |
| start2   | double    | 0.5     | Start guess for parameter value of point of tangency.   |

If type is point a tangent line through a given point is constructed. Then, the following additional property is available:

TABLE 3-168: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                    |
|----------|-----------|---------|--------------------------------|
| point    | Selection |         | Point in some geometry object. |

If type is coord a tangent line through a point with given coordinates are constructed. Then, the following additional property is available:

TABLE 3-169: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION  |
|----------|----------|---------|--------------|
| coord    | double[] | {0,0}   | Coordinates. |

If a tangent cannot be found, a tangent to some adjacent edge is constructed, if possible.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-170: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(gname).create(fname,"tangent") creates a Tangent feature.

The following properties are no longer supported:

model.component().create("comp1");

g.feature("c2").set("pos", "2 2");

g.create("c1","Circle"); g.create("c2","Circle");

TABLE 3-171: OBSOLETE PROPERTY/VALUE PAIRS.

| PROPERTY NAME | PROPERTY VALUE        | DEFAULT               | DESCRIPTION                                                 |
|---------------|-----------------------|-----------------------|-------------------------------------------------------------|
| edim1         | 0   1                 | geometry<br>dependent | Starting point element dimension: 0 for vertex, 1 for edge. |
| edim2         | 0   1                 | geometry<br>dependent | Ending point element dimension: 0 for vertex, 1 for edge.   |
| dom1          | integer               | 1                     | Starting point entity number.                               |
| dom2          | integer               | 1                     | Ending point entity number.                                 |
| out           | cell array of Strings | {}                    | Additional output data.                                     |
| start1        | double                | 0.5                   | Starting point parameter value on specified edge.           |

## **EXAMPLE**

The following sequence generates a tangent from the unit circle to the point (2, 0):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("c1","Circle");
  g.run("c1");
  g.create("tan1","Tangent");
  g.feature("tan1").set("type","coord");
  g.feature("tan1").selection("edge").set("c1",3);
  g.feature("tan1").set("coord","2 0");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.run('c1');
  g.create('tan1','Tangent');
  g.feature('tan1').set('type','coord');
  g.feature('tan1').selection('edge').set('c1',3);
  g.feature('tan1').set('coord','2 0');
  g.run;
The following sequence generates a common tangent between two circles:
Code for Use with Java
  Model model = ModelUtil.create("Model1");
```

GeomSequence g = model.component("comp1").geom().create("geom1",2);

```
g.run("c2");
  g.create("tan1","Tangent");
  g.feature("tan1").selection("edge").set("c1",4);
  g.feature("tan1").selection("edge2").set("c2",4);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.create('c2','Circle');
  g.feature('c2').set('pos', '2 2');
  g.run('c2');
  g.create('tan1','Tangent');
  g.feature('tan1').selection('edge').set('c1',4);
  g.feature('tan1').selection('edge2').set('c2',4);
  g.run;
```

#### **SEE ALSO**

BezierPolygon

# *Tetrahedron*

Create a solid or surface tetrahedron in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>)create(<ftag>,"Tetrahedron");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Tetrahedron") to create a tetrahedron. The following properties are available:

TABLE 3-172: VALID PROPERTY/VALUE PAIR FOR TETRAHEDRON.

| PROPERTY NAME | PROPERTY VALUE                                                                              | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|---------------------------------------------------------------------------------------------|-----------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                                    | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                      |
| contributeto  | String                                                                                      | none                                    | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color           | The color to use. Active when color is set to custom.                                                                                                                                                                              |
| p             | double[3][4]                                                                                | {{0,0,1,0},<br>{0,1,0,0},<br>{0,0,0,1}} | Corner coordinates.                                                                                                                                                                                                                |
| selresult     | on   off                                                                                    | off                                     | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                               | dom                                     | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| type          | solid   surface                                                                             | solid                                   | Object type.                                                                                                                                                                                                                       |

TABLE 3-172: VALID PROPERTY/VALUE PAIR FOR TETRAHEDRON.

| PROPERTY NAME | PROPERTY VALUE                     | DEFAULT | DESCRIPTION                                                                                                                   |
|---------------|------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------|
| workplanesrc  | this  <br>part-instance<br>feature | this    | Part-instance feature to take the work plane from.                                                                            |
| workplane     | xyplane  <br>work-plane<br>feature | xyplane | Work-plane feature that defines the coordinate system.<br>The default, xyplane, is the global Cartesian<br>coordinate system. |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-173: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"tetrahedron3") creates a solid tetrahedron.
model.component(<ctag>).geom(<tag>).create(<ftag>,"tetrahedron2") creates a surface tetrahedron.
```

## **EXAMPLE**

The following commands generate a solid tetrahedron object:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("t1","Tetrahedron");
  g.feature("t1").set("p", new double[][]{{0,0,1,0},{0,0.8,1,0},{0,0.1,0,0.2}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('t1','Tetrahedron');
  g.feature('t1').set('p', [[0,0,1,0];[0,0.8,1,0];[0,0.1,0,0.2]]);
  g.run;
```

#### **SEE ALSO**

Hexahedron, Pyramid

# *Thicken2D*

Thicken the edges of 2D curve or solid objects in the normal direction to convert them into solid objects.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Thicken2D");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Thicken2D") to create a thicken feature tagged *<ftag>* in the 2D geometry sequence with the tag *<tag>*.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the entities to thicken. To set the selection level for the selection object, and to select the input entities see Geometry Object Selection Methods. For example, use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*). selection("input").init(1) to set the selection to be a selection of boundaries (geometric entities of dimension 1) for the thicken feature with the tag *<ftag>* in the 2D geometry sequence with the tag *<tag>*.

The following properties are available:

TABLE 3-174: VALID PROPERTY/VALUE PAIRS FOR THICKEN2D.

| PROPERTY      | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| input         | Selection                                                                                   |                               | Objects or boundaries to thicken.                                                                                                                                                                             |
| keep          | on   off                                                                                    | off                           | Keep input objects.                                                                                                                                                                                           |
| offset        | symmetric  <br>asymmetric                                                                   | symmetric                     | Type of thicken.                                                                                                                                                                                              |
| totalthick    | double                                                                                      | 0                             | Total thickness. Used if offset is symmetric.                                                                                                                                                                 |
| downthick     | double                                                                                      | 0                             | Upside thickness. Used if offset is asymmetric.                                                                                                                                                               |
| upthick       | double                                                                                      | 0                             | Downside thickness. Used if offset is asymmetric.                                                                                                                                                             |
| ends          | straight  <br>circular                                                                      | straight                      | Determines if the edges at the ends of the thickened<br>object are straight or circular. Used if offset is symmetric.                                                                                         |
| convexcorner  | fillet   tangent<br>  extend  <br>noconnection                                              | fillet                        | Handling of offset edges in convex corners.                                                                                                                                                                   |
| propagatesel  | on   off                                                                                    | on                            | Propagate selections from input objects to resulting<br>objects.                                                                                                                                              |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                   |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics, materials,<br>and so on; or in 3D from a plane geometry. obj is not<br>available in a component's geometry                                                   |
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                         |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |

The following attributes are available:

TABLE 3-175: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **SEE ALSO**

Offset, Thicken

*Torus*

Create a solid or surface torus in 3D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Torus");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Torus") to create a torus. The following properties are available:

TABLE 3-176: VALID PROPERTY/VALUE PAIRS FOR TORUS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle         | double                                                                                   | 360                           | Revolution angle.                                                                                                                                                                                                                  |
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the revolution axis. Vector has length<br>3 if axistype is cartesian, and length 2 if<br>axistype is spherical.                                                                                                       |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| intfaces      | on   off                                                                                 | off                           | Create cross section faces inside the torus.                                                                                                                                                                                       |
| pos           | double[]                                                                                 | {0,0,0}                       | Center coordinates.                                                                                                                                                                                                                |
| rmaj          | double                                                                                   | 1                             | Directrix radius.                                                                                                                                                                                                                  |
| rmin          | double                                                                                   | 0.5                           | Generatrix radius.                                                                                                                                                                                                                 |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| type          | solid   surface                                                                          | solid                         | Object type.                                                                                                                                                                                                                       |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-177: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"torus3") creates a solid torus.
```

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"torus2") creates a surface torus.

The following properties are also available:

TABLE 3-178: VALID PROPERTY/VALUE PAIRS FOR TORUS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

### **EXAMPLE**

The following sequence generates a surface torus and a solid torus:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("t2","Torus");
  g.feature("t2").set("type","surface");
  g.feature("t2").set("rmaj",2);
  g.feature("t2").set("rmin",1);
  g.create("t3","Torus");
  g.feature("t3").set("rmaj",10);
  g.feature("t3").set("rmin",2);
  g.feature("t3").set("pos","0,0,-100");
  g.feature("t3").set("axis","1,1,1");
  g.feature("t3").set("rot",60);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('t2','Torus');
  g.feature('t2').set('type','surface');
  g.feature('t2').set('rmaj',2);
  g.feature('t2').set('rmin',1);
  g.create('t3','Torus');
  g.feature('t3').set('rmaj',10);
  g.feature('t3').set('rmin',2);
  g.feature('t3').set('pos','0,0,-100');
  g.feature('t3').set('axis','1,1,1');
  g.feature('t3').set('rot',60);
  g.run;
```

# **SEE ALSO**

Cylinder

*UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection*

Combine selections of entities or objects using a Boolean operation.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"UnionSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"IntersectionSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"DifferenceSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"ComplementSelection");
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
```

#### **DESCRIPTION**

Use UnionSelection to get all entities/objects that belong to at least one of the input selections. Use IntersectionSelection to get all entities/objects that belong to all input selections. Use DifferenceSelection to get all entities/objects that belong some of the add selections, but do not belong to any of the subtract selections. Use ComplementSelection to get all entities/objects of the given dimension that do not belong to any input selection.

For DifferenceSelection, the following properties are available:

| PROPERTY     | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| add          | String[]                                                                                    | {}                            | Tags of selections to add.                                                                                                                            |
| color        | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property. |
| contributeto | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                         |
| customcolor  | RGB-triplet                                                                                 | Next available theme<br>color | The color to use. Active when color is set to<br>custom.                                                                                              |
| entitydim    | -1   0   1   2   3                                                                          | space dimension               | Dimension of entities to select1 means Object.                                                                                                        |
| selkeep      | on   off                                                                                    | on                            | Keep the selection within the geometry sequence.                                                                                                      |
| selshow      | on   off                                                                                    | on                            | Show selection in physics, materials, and so on; in<br>part instances; or in 3D from a plane geometry.                                                |
| subtract     | String[]                                                                                    | {}                            | Tags of selections to subtract.                                                                                                                       |

For the other selections, the following properties are available:

| PROPERTY     | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between<br>1 and the<br>number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| contributeto | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                         |
| customcolor  | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| entitydim    | -1   0   1   2   3                                                                             | space dimension               | Dimension of entities to select1 means Object.                                                                                                        |
| input        | String[]                                                                                       | {}                            | Tags of input selections.                                                                                                                             |

| PROPERTY | VALUE                                                                                                                                                                           | DEFAULT                                                                                                                                                                                                              | DESCRIPTION                                                                                                                                               |
|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| selkeep  | on   off                                                                                                                                                                        | on                                                                                                                                                                                                                   | Keep the selection within the geometry sequence.                                                                                                          |
| selshow  | If the level is not<br>Object, the<br>allowed values<br>are on   off. If<br>the level is<br>Object, the<br>allowed values<br>are all   obj  <br>dom   bnd   edg<br>  pnt   off. | If the level is not<br>Object, the default<br>value is on. If the<br>level is Object, the<br>default value is all<br>in a component's<br>geometry, obj in a<br>part, and dom in a<br>work plane's Plane<br>Geometry. | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry. obj is not<br>available in a component's geometry. |

See Selections of Geometric Entities for general information about selections.

#### **EXAMPLE**

In an array of blocks, select all vertices whose distance to the origin is between 2.5 and 3.5. This results in 22 vertices in 7 different objects.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.create("arr1", "Array");
  g.feature("arr1").selection("input").set("blk1");
  g.feature("arr1").set("size", new int[]{3,3,1});
  g.feature("arr1").set("displ", new double[]{1.5,1.5,0});
  g.run("arr1");
  g.create("ballsel1","BallSelection");
  g.feature("ballsel1").set("entitydim", 0);
  g.feature("ballsel1").set("r", 3.5);
  g.feature().duplicate("ballsel2","ballsel1");
  g.feature("ballsel2").set("r", 2.5);
  g.create("difsel1", "DifferenceSelection");
  g.feature("difsel1").set("entitydim", 0);
  g.feature("difsel1").set("add", new String[]{"ballsel1"});
  g.feature("difsel1").set("subtract", new String[]{"ballsel2"});
  g.run("difsel1");
  String[] obj = g.selection("difsel1").objects();
  int nVtx = 0;
  for (int i=0; i<obj.length; ++i)
    nVtx += g.selection("difsel1").entities(obj[i],0).length;
  // obj.length = 7, nVtx = 22
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.create('arr1', 'Array');
  g.feature('arr1').selection('input').set('blk1');
  g.feature('arr1').set('size', [3,3,1]);
  g.feature('arr1').set('displ', [1.5,1.5,0]);
  g.run('arr1');
  g.create('ballsel1','BallSelection');
  g.feature('ballsel1').set('entitydim', 0);
  g.feature('ballsel1').set('r', 3.5);
  g.feature.duplicate('ballsel2','ballsel1');
  g.feature('ballsel2').set('r', 2.5);
  g.create('difsel1', 'DifferenceSelection');
```

```
g.feature('difsel1').set('entitydim', 0);
g.feature('difsel1').set('add', {'ballsel1'});
g.feature('difsel1').set('subtract', {'ballsel2'});
g.run('difsel1');
obj = g.selection('difsel1').objects;
nVtx = 0;
for i=1:length(obj)
  nVtx = nVtx + length(g.selection('difsel1').entities(obj(i),0));
end
% length(obj) = 7, nVtx = 22
```

## **SEE ALSO**

AdjacentSelection, BallSelection, BoxSelection, CylinderSelection, Disk Selection, ExplicitSelection

# *WorkPlane*

Create a work plane in 3D for drawing 2D objects that can be extruded, revolved, or embedded.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"WorkPlane");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom().geomSequenceMethod
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom().feature();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

A work plane embeds 2D objects in 3D. The sections below describe how to define the location of the work plane and how to create 2D objects in it. You can also use a work plane in the CrossSection and Partition features. In that case, you do not need to draw anything in the work plane.

## *Unite Objects*

There is an option to unite all objects in the work plane before using the 2D geometry in 3D. Uniting all objects can improve the handling of the 2D geometry when extruding it, for example. You can control the union of 2D objects using the following properties:

TABLE 3-179: VALID PROPERTIES, UNITE OBJECTS.

| PROPERTY      | VALUE                         | DEFAULT   | DESCRIPTION                                                     |
|---------------|-------------------------------|-----------|-----------------------------------------------------------------|
| absrepairtol  | double                        | See below | Absolute repair tolerance.                                      |
| repairtol     | double                        | See below | Relative repair tolerance, relative to size of union of inputs. |
| repairtoltype | auto   relative  <br>absolute | See below | Repair tolerance type: automatic, relative, or absolute.        |
| unite         | on   off                      | off       | Unite objects.                                                  |

The tolerance settings are active when unite is set to on. The default values for the repair tolerance is taken from the geometry sequence's default repair tolerance.

## *Visualization*

To control the in-plane visualization of the 3D geometry, the visualization of the local coordinate system, and to activate the ability to draw directly on the work plane in 3D, use the following properties:

TABLE 3-180: VALID PROPERTIES, VISUALIZATION.

| PROPERTY         | VALUE   | DEFAULT | DESCRIPTION                       |
|------------------|---------|---------|-----------------------------------|
| showcoincident   | boolean | true    | Show coincident 3D geometry.      |
| showintersection | boolean | true    | Show intersection of 3D geometry. |
| showcoordsys     | boolean | true    | Show local coordinate system.     |
| showprojection   | boolean | true    | Show projection of 3D geometry.   |
| workplane3d      | boolean | true    | Draw on work plane in 3D.         |

## *Defining the Location of the Work Plane*

A work plane has a local coordinate system that is orthonormal and positively oriented (right-handed). The work plane coincides with the *xy*-plane in the local coordinate system. The following properties control how the work plane is defined.

TABLE 3-181: VALID PROPERTIES, LOCATION.

| PROPERTY     | VALUE                                                                                                                             | DEFAULT | DESCRIPTION                                   |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------|---------|-----------------------------------------------|
| planetype    | quick   faceparallel  <br>edgeparallel   edgeangle  <br>circleperpendicular  <br>normal   vertices  <br>coordinates   transformed | quick   | Type of data defining the work plane.         |
| contributeto | String                                                                                                                            | none    | Tag of cumulative selection to contribute to. |

For information about the selresult and contributeto properties, see Selections of Geometric Entities. Note that in a work plane's Plane Geometry, the selresultshow and selindividualshow properties are not available.

Depending on planetype, additional properties are available.

## *Quick*

This creates a work plane parallel to one of the global coordinate planes.

TABLE 3-182: VALID PROPERTIES, QUICK.

| PROPERTY        | VALUE                          | DEFAULT  | DESCRIPTION                                                |
|-----------------|--------------------------------|----------|------------------------------------------------------------|
| quickplane      | xy   yz   zx   yx  <br>zy   xz | xy       | Coordinate plane.                                          |
| quickx          | double                         | 0        | x-coordinate for work plane (used when plane is yz or zy). |
| quicky          | double                         | 0        | y-coordinate for work plane (used when plane is xz or zx). |
| quickz          | double                         | 0        | z-coordinate for work plane (used when plane is xy or yx). |
| quickoffsettype | distance  <br>vertex           | distance | Type of offset specification.                              |
| offsetvertex    | Selection                      |          | Vertex for offset.                                         |
| quickorigin     | global  <br>vertexproj         | global   | Origin of local coordinate system.                         |
| originvertex    | Selection                      |          | Vertex for origin.                                         |
| quickaxis       | natural  <br>vertexproj        | natural  | Local x-axis.                                              |
| axisvertex      | Selection                      |          | Vertex for axis.                                           |
| displ           | double[2]                      | {0,0}    | Displacement of local coordinate system.                   |
| rot             | double                         | 0        | Rotation angle of local coordinate system.                 |

## *Face Parallel*

This creates a work plane that is parallel to a planar face in a geometry object

TABLE 3-183: VALID PROPERTIES, FACE PARALLEL.

| PROPERTY             | VALUE                                  | DEFAULT    | DESCRIPTION                                            |
|----------------------|----------------------------------------|------------|--------------------------------------------------------|
| face                 | Selection                              |            | Planar face.                                           |
| offset               | double                                 | 0          | Signed offset in the direction of the local<br>z-axis. |
| reverse              | on   off                               | off        | Reverse direction of local z-axis.                     |
| offsettype           | distance   vertex                      | distance   | Type of offset specification.                          |
| offsetvertex         | Selection                              |            | Vertex for offset.                                     |
| origin               | facecenter   boxcorner  <br>vertexproj | facecenter | Origin of local coordinate system.                     |
| originvertex         | Selection                              |            | Vertex for origin.                                     |
| faceparallel<br>axis | s1   s2   vertexproj                   | s1         | Local x-axis.                                          |
| axisvertex           | Selection                              |            | Vertex for axis.                                       |
| displ                | double[2]                              | {0,0}      | Displacement of local coordinate system.               |
| rot                  | double                                 | 0          | Rotation angle of local coordinate system.             |

## *Edge Parallel*

This creates a work plane that is parallel to a planar edge in a geometry object.

TABLE 3-184: VALID PROPERTIES, FACE PARALLEL.

| PROPERTY               | VALUE                                   | DEFAULT     | DESCRIPTION                                         |
|------------------------|-----------------------------------------|-------------|-----------------------------------------------------|
| edge                   | Selection                               |             | Planar edge.                                        |
| offset                 | double                                  | 0           | Signed offset in the direction of the local z-axis. |
| origin                 | edgecenter   boxcorner                  | edgecenter  | Origin of local coordinate system.                  |
| reverse                | on   off                                | off         | Reverse direction of local z-axis.                  |
| offsettype             | distance   vertex                       | distance    | Type of offset specification.                       |
| offsetvertex           | Selection                               |             | Vertex for offset.                                  |
| edgeparallel<br>origin | startvertex   endvertex  <br>vertexproj | startvertex | Origin of local coordinate system.                  |
| originvertex           | Selection                               |             | Vertex for origin.                                  |
| edgeparallel<br>axis   | tangent   vertexproj                    | tangent     | Local x-axis.                                       |
| axisvertex             | Selection                               |             | Vertex for axis.                                    |
| displ                  | double[2]                               | {0,0}       | Displacement of local coordinate system.            |
| rot                    | double                                  | 0           | Rotation angle of local coordinate system.          |

## *Edge Angle*

This creates a work plane through a straight edge of a geometry object. The work plane makes a given angle with the tangent plane of a face in the same geometry object. The face must be adjacent to the edge, and its tangent plane must be the same at all points on the edge. The origin of the local coordinate system coincides with the start vertex (if reverse is off) or end vertex (if reverse is on) of the edge. The direction of the local *x*-axis coincides with the direction of the edge (if reverse is off) or its opposite (if reverse is on). If the property angle is zero, the direction of the local *y*-axis points into the face. In general, the local coordinate system is rotated by angle about the local *x*-axis.

TABLE 3-185: VALID PROPERTIES, EDGE ANGLE.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                                |  |
|----------|-----------|---------|--------------------------------------------|--|
| angle    | double    | 0       | Angle between face and work plane.         |  |
| edge     | Selection |         | Straight edge.                             |  |
| adjface  | Selection |         | Face adjacent to edge in the same object.  |  |
| reverse  | on   off  | off     | Reverse direction of local x-axis.         |  |
| displ    | double[2] | {0,0}   | Displacement of local coordinate system.   |  |
| rot      | double    | 0       | Rotation angle of local coordinate system. |  |

## *Circle Perpendicular*

This creates a work plane that is perpendicular to a given circular edge. The origin of the local coordinate system is at the circle's center. By default, the local *x*-axis goes through the edge's start vertex. Thus, if the geometry is rotationally symmetric, the symmetry axis coincides with the local *y*-axis.

TABLE 3-186: VALID PROPERTIES, CIRCLE PERPENDICULAR.

| PROPERTY   | VALUE                                    | DEFAULT     | DESCRIPTION                                |
|------------|------------------------------------------|-------------|--------------------------------------------|
| circedge   | Selection                                | empty       | Circular edge.                             |
| circpoint  | startvertex   endvertex  <br>othervertex | startvertex | Point on plane.                            |
| circvertex | Selection                                |             | Vertex on plane.                           |
| circoffset | double                                   | 0           | Offset angle.                              |
| reverse    | on   off                                 | off         | Reverse direction of local x-axis.         |
| displ      | double[2]                                | {0,0}       | Displacement of local coordinate system.   |
| rot        | double                                   | 0           | Rotation angle of local coordinate system. |

# *Normal Vector*

This creates a work plane defined by a normal vector and a point on the plane. Together with a RigidTransform feature, this makes it possible to orient an object so that one of its planar faces gets a prescribed normal vector.

TABLE 3-187: VALID PROPERTIES, CIRCLE PERPENDICULAR.

| PROPERTY     | VALUE            | DEFAULT | DESCRIPTION                                                            |
|--------------|------------------|---------|------------------------------------------------------------------------|
| normalvector | double[3]        | {0,0,1} | Normal vector.                                                         |
| normalpoint  | coord   vertex   | coord   | Point on plane (defined using coordinates or<br>as a geometry vertex). |
| normalcoord  | double[3]        | {0,0,1} | Coordinates of point, used when<br>normalpoint is set to coord.        |
| normalvertex | Vertex selection |         | Vertex for point, used when normalpoint<br>is set to vertex.           |
| displ        | double[2]        | {0,0}   | Displacements xw and yw.                                               |
| rot          | double           | 0       | Rotation angle.                                                        |

# *Vertices*

This creates a work plane parallel to a plane through three vertices v1, v2, and v3. When offset=0, the origin of the local coordinate system coincides with the first vertex v1. The *x*-axis of the local coordinate system is in the

direction v2-v1. The direction of the local *z*-axis is given by the cross product (v2-v1)x(v3-v1) or its opposite (if reverse is on).

TABLE 3-188: VALID PROPERTIES, VERTICES.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                                         |
|----------|-----------|---------|-----------------------------------------------------|
| offset   | double    | 0       | Signed offset in the direction of the local z-axis. |
| reverse  | on   off  | off     | Reverse direction of local z-axis.                  |
| vertex1  | Selection |         | First vertex.                                       |
| vertex2  | Selection |         | Second vertex.                                      |
| vertex3  | Selection |         | Third vertex.                                       |
| displ    | double[2] | {0,0}   | Displacement of local coordinate system.            |
| rot      | double    | 0       | Rotation angle of local coordinate system.          |

## *Coordinates*

This creates a work plane through three points p1, p2, and p3. The origin of the local coordinate system coincides with the first point p1. The *x*-axis of the local coordinate system is in the direction p2-p1. The direction of the local *z*-axis is given by the cross product (p2-p1)x(p3-p1).

TABLE 3-189: VALID PROPERTY, COORDINATES.

| PROPERTY  | VALUE        | DEFAULT                   | DESCRIPTION |
|-----------|--------------|---------------------------|-------------|
| genpoints | double[3][3] | {{0,0,0},{1,0,0},{0,1,0}} | Points.     |

genpoints[n][i] is the *i*th coordinate of the *n*th point.

## *Transformed*

This creates a work plane as a transformation of another work plane, using a displacement and a rotation.

TABLE 3-190: VALID PROPERTIES, TRANSFORMED.

| PROPERTY      | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                                          |
|---------------|-----------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| transax2      | double[2]                               | {0,0}   | Spherical angles theta and phi, used if transaxistype is<br>spherical.                                                                               |
| transax3      | double[3]                               | {0,0,1} | Axis vector, used if transaxistype is cartesian.                                                                                                     |
| transaxis     | double[]                                | {0,0,1} | Rotation axis. Vector has length 3 if transaxistype is<br>cartesian, and length 2 if transaxistype is<br>spherical. Alias for transax2 and transax3. |
| transaxistype | x   y   z  <br>cartesian  <br>spherical | z       | Coordinate system used for axis. Used if transspecify is<br>set to axis.                                                                             |
| transdispl    | double[3]                               | {0,0,0} | Displacement of local coordinate system.                                                                                                             |
| transedge     | Selection                               |         | Edge selection. Used when transspecify is set to edge.                                                                                               |
| transeulerang | double[3]                               | {0,0,0} | Intrinsic Z-X-Z Euler angles α, β, and γ, used if<br>transspecify is set to eulerang.                                                                |
| transrot      | double                                  | 0       | Rotation angle, if transspecify is not set to eulerang.                                                                                              |
| transspecify  | axis   eulerang<br>  edge               | axis    | Specify an axis of rotation, Euler angles (Z-X-Z), or a<br>straight edge.                                                                            |
| workplanesrc  | String                                  | this    | Tag of PartInstance feature to take work plane from, or<br>this to take work plane from this sequence.                                               |
| workplane     | String                                  | xyplane | Tag of input work plane, or xyplane.                                                                                                                 |

## *Part Instances*

In a geometry part, the following property is available:

TABLE 3-191: VALID PROPERTY IN A FEATURE IN A GEOMETRY PART.

| PROPERTY      | VALUE    | DEFAULT | DESCRIPTION                                                               |
|---------------|----------|---------|---------------------------------------------------------------------------|
| showworkplane | on   off | on      | Show work plane in part instances. This property is only available if the |
|               |          |         | work plane is in a geometry part.                                         |

## *Selections of Resulting Entities*

For selections of resulting entities, the following properties are available:

TABLE 3-192: VALID PROPERTIES FOR SELECTIONS OF RESULTING ENTITIES.

| PROPERTY      | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                                                                                                                     |
|---------------|-----------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selplaneshow  | on   off                                | off     | Show selections from Plane Geometry in physics or part instances.                                                                                                                                                               |
| selresult     | on   off                                | off     | Create selections of all resulting objects.                                                                                                                                                                                     |
| selresultshow | all   obj  <br>bnd   edg  <br>pnt   off | bnd     | Show selections, if selresult is on, of resulting objects in<br>physics, materials, and so on, or in part instances. obj is not<br>available in a component's geometry. dom, bnd, and edg are not<br>available in all features. |

## *Creating 2D Objects in the Work Plane*

The work plane owns a geometry sequence that contains the features that define the 2D objects you draw in the work plane. You access this geometry sequence by

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom()
```

where *<ftag>* is the name of the work-plane feature. You can add geometry features in this 2D sequence as usual.

## *Attributes*

The following attributes are available:

TABLE 3-193: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

# **COMPATIBILITY**

The plane type circularedge from earlier versions is still valid as an alternative to its replacement circleperpendicular, and the plane type general from earlier versions is still valid as an alternative to its replacement coordinates.

## **EXAMPLE**

Create a work plane with a rectangle. When the work plane is built, the rectangle is embedded in the space of the 3D sequence:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("wp1","WorkPlane");
  g.feature("wp1").set("quickplane","yz");
  g.feature("wp1").geom().create("r1","Rectangle");
  g.feature("wp1").geom().feature("r1").set("pos", "1 1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
```

```
model.component.create('comp1');
g = model.component('comp1').geom.create('geom1',3);
g.create('wp1','WorkPlane');
g.feature('wp1').set('quickplane','yz');
g.feature('wp1').geom.create('r1','Rectangle');
g.feature('wp1').geom.feature('r1').set('pos', '1 1');
g.run;
```

## **SEE ALSO**

CrossSection, Extrude, Partition, Revolve, Sweep

# Mesh

Details include reference information about the mesh commands and utility methods.

## In this chapter:

- **•** About Mesh Commands
- **•** Working with a Meshing Sequence
- **•** Mesh Settings
- **•** Physics-Controlled Meshing
- **•** Adaptively Refined Meshes
- **•** Information and Statistics
- **•** Getting and Setting Mesh Data
- **•** Errors, Warnings, and Information
- **•** Exporting Meshes to Files
- **•** Mesh Commands