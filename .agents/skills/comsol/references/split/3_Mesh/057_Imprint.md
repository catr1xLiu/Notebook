# *Imprint*

Make imprints of faces, edges, or vertices onto another face in a 3D mesh.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Imprint");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Imprint") to imprint entities onto faces in a 3D mesh. Supported source input: boundaries, edges, or points. Supported destination input: boundaries. Specify the source and destination entities of the imprint as specified in Table 4-12.

The following properties are available:

TABLE 4-12: AVAILABLE PROPERTIES FOR IMPRINT.

| PROPERTY    | VALUE           | DEFAULT | DESCRIPTION                                                                                                                    |
|-------------|-----------------|---------|--------------------------------------------------------------------------------------------------------------------------------|
| source      | Selection       |         | Entity selection of dimension 0,1, or 2.                                                                                       |
| destination | Selection       |         | Entity selection of dimension 2.                                                                                               |
| symmetric   | on   off        | off     | Specify if to imprint on destination only (off) or<br>both source and destination (on). Used when<br>source is of dimension 2. |
| placement   | linear   curved | curved  | Specifies the placement of mesh vertices on the<br>destination.                                                                |

TABLE 4-12: AVAILABLE PROPERTIES FOR IMPRINT.

| PROPERTY       | VALUE                      | DEFAULT | DESCRIPTION                                                                                                                                                           |
|----------------|----------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| precision      | [0, 1]                     | 0.5     | Specifies the precision with which to make the<br>imprints. A value close to 1 gives a more exact<br>imprint. Used when source is of dimension 2.                     |
| groupadjedg    | on   off                   | off     | Group adjacent edges that seem to be part of<br>the loop. Used when source is of dimension 1.                                                                         |
| distancetype   | auto   absolute   relative | auto    | Specify how to control the maximum distance<br>to bridge when imprinting.                                                                                             |
| maxabsdistance | double                     |         | Absolute maximum distance between source<br>and destination. Used when distancetype is<br>absolute.                                                                   |
| maxreldistance | double                     | 0.01    | Specify a relative maximum distance. The value<br>is relative to the length of the longest side of the<br>mesh's bounding box. Used when<br>distancetype is relative. |

MergeEntities, DeleteEntities, Import

## *IntersectLine*

Intersect an imported 2D mesh with a straight line. The operation will partition geometric entities and intersect mesh elements to introduce straight boundaries in an intersected domain.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"IntersectLine");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"IntersectLine") to partition geometric entities and mesh elements of an imported mesh by specifying a straight line.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the geometric entities to split with the line. If you do not specify the selection, the feature operates on the entire geometry.

The following properties are available:

TABLE 4-13: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE                      | DEFAULT | DESCRIPTION                                      |
|-----------|----------------------------|---------|--------------------------------------------------|
| point     | vertex   coord             | coord   | How the point is specified.                      |
| coord     | double[]                   | {0 0}   | Point on line, if point is coord.                |
| vertex    | vertex selection           |         | Specify the point by selection of vertex.        |
| direction | vertex   coord   vector    | vector  | How the direction is specified.                  |
| coord2    | double[]                   | {0 1}   | Second point on line, if direction is coord.     |
| dirvector | double[]                   | {0 1}   | Direction of line, if direction is vector.       |
| vertex2   | vertex selection           |         | Second point on line, if direction is<br>vertex. |
| toltype   | auto   relative   absolute | auto    | Snapping tolerance specification.                |

TABLE 4-13: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE           | DEFAULT | DESCRIPTION                                                                |
|-----------|-----------------|---------|----------------------------------------------------------------------------|
| abstol    | double          |         | Absolute point snapping tolerance, if<br>toltype is absolute.              |
| reltol    | double          | 0.01    | Relative point snapping tolerance, if toltype<br>is relative.              |
| placement | linear   curved | curved  | Specifies the placement of mesh vertices in<br>the line intersection.      |
| selabove  | on   off        | off     | Specifies if to create a selection of resulting<br>domains above the line. |
| selbelow  | on   off        | off     | Specifies if to create a selection of resulting<br>domains below the line. |
| selinter  | on   off        | off     | Specifies if to create a selection of resulting<br>intersection edges.     |

TABLE 4-14: AVAILABLE ADDITIONAL PROPERTIES WHEN SELABOVE, SELBELOW. AND SELINTER ARE SET TO ON.

| PROPERTY         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                 |
|------------------|------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colorabove       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either given<br>as an integer indicating a color in the color<br>theme, or as a custom color in the<br>customcolorabove property.                        |
| colorbelow       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either given<br>as an integer indicating a color in the color<br>theme, or as a custom color in the<br>customcolorbelow property.                        |
| customcolorabove | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorabove is<br>set to custom.                                                                                                                               |
| customcolorbelow | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorbelow is<br>set to custom.                                                                                                                               |
| selaboveshow     | off   all   pnt   bnd  <br>dom                                                           | dom                           | Specifies on which geometric level the selection<br>is shown in physics, materials, and so on. For<br>mesh parts, this option shows selection outside<br>the part. Used if selabove is on.  |
| selbelowshow     | off   all   pnt   bnd  <br>dom                                                           | dom                           | Specifies on which geometric level the selection<br>is shown in physics,, materials, and so on. For<br>mesh parts, this option shows selection outside<br>the part. Used if selbelow is on. |
| selintershow     | on   off                                                                                 | on                            | Show edge selection in physics, materials, and so<br>on. For mesh parts, this option shows selection<br>outside the part. Used if selinter is on.                                           |

Import, IntersectPlane, Ball, Box, Cylinder, LogicalExpression

## *IntersectPlane*

Intersect an imported 3D mesh with a plane. The operation will partition geometric entities and intersect mesh entities to introduce planar intersections. Supported entities are unmeshed domains, boundaries, and edges. Meshed faces are created within the intersection edges if the edges form closed loops.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"IntersectPlane");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"IntersectPlane") to partition geometric entities and mesh elements of an imported 3D mesh by specifying a plane.

The following properties are available:

TABLE 4-15: AVAILABLE PROPERTIES.

| PROPERTY        | VALUE                                                                                | DEFAULT | DESCRIPTION                                                                                                               |
|-----------------|--------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------|
| planetype       | quick   faceparallel  <br>edgeparallel  <br>normalvector   vertices  <br>coordinates | quick   | How the plane is specified. See tables<br>Table 4-17 to Table 4-23 for additional<br>properties.                          |
| additionalplane | on   off                                                                             | off     | Specify if to add additional parallel planes                                                                              |
| planedistance   | double[]                                                                             |         | Sequence of numbers specifying desired<br>offsets of additional planes. Both positive and<br>negative values are allowed. |
| reversedistance | on   off                                                                             | off     | Generate the additional planes in the opposite<br>direction                                                               |
| createface      | on   off                                                                             | on      | Generate faces for closed loops in the<br>intersection                                                                    |
| toltype         | auto   relative   absolute                                                           | auto    | How snapping tolerance is specified.                                                                                      |
| abstol          | double                                                                               |         | Absolute point snapping tolerance, if<br>toltype is absolute.                                                             |
| reltol          | double                                                                               | 0.01    | Relative point snapping tolerance, if toltype<br>is relative.                                                             |
| cleanup         | on   off                                                                             | on      | Cleanup of resulting mesh by collapsing mesh<br>edges within specified toltype tolerance.                                 |
| placement       | linear   curved                                                                      | curved  | Specifies the placement of mesh vertices in<br>the plane intersection.                                                    |
| selabove        | on   off                                                                             | off     | Specifies if to create a selection of resulting<br>domains above the plane.                                               |
| selbelow        | on   off                                                                             | off     | Specifies if to create a selection of resulting<br>domains below the plane.                                               |
| selinter        | on   off                                                                             | off     | Specifies if to create a face selection of<br>resulting boundaries in intersection plane.                                 |
| selinteredg     | on   off                                                                             | off     | Specifies if to create an edge selection of<br>resulting intersection edges in the plane.                                 |

## *Quick*

This defines a plane parallel to one of the global coordinate planes.

TABLE 4-16: VALID PROPERTIES, QUICK.

| PROPERTY   | VALUE                          | DEFAULT | DESCRIPTION                                           |
|------------|--------------------------------|---------|-------------------------------------------------------|
| quickplane | xy   yz   zx   yx  <br>zy   xz | xy      | Specify which coordinate plane to use.                |
| quickx     | double                         | 0       | x-coordinate for plane (used when plane is yz or zy). |

TABLE 4-16: VALID PROPERTIES, QUICK.

| PROPERTY        | VALUE                | DEFAULT  | DESCRIPTION                                           |
|-----------------|----------------------|----------|-------------------------------------------------------|
| quicky          | double               | 0        | y-coordinate for plane (used when plane is xz or zx). |
| quickz          | double               | 0        | z-coordinate for plane (used when plane is xy or yx). |
| quickoffsettype | distance  <br>vertex | distance | Type of offset specification.                         |
| offsetvertex    | Selection            |          | Specify vertex when quickoffsettype is vertex.        |

## *Face Parallel*

This specifies a plane that is parallel to a planar face in a mesh.

TABLE 4-17: VALID PROPERTIES, FACEPARALLEL.

| PROPERTY     | VALUE             | DEFAULT  | DESCRIPTION                                         |
|--------------|-------------------|----------|-----------------------------------------------------|
| face         | Selection         |          | Planar face selection.                              |
| offset       | double            | 0        | Specify offset in the normal direction of<br>plane. |
| reverse      | on   off          | off      | Reverse normal direction of plane.                  |
| offsettype   | distance   vertex | distance | Type of offset specification.                       |
| offsetvertex | Selection         |          | Specify vertex when offsettype is vertex.           |

## *Edge Parallel*

This defines a plane that is parallel to a planar edge in a mesh.

TABLE 4-18: VALID PROPERTIES, EDGEPARALLEL.

| PROPERTY     | VALUE             | DEFAULT  | DESCRIPTION                                      |
|--------------|-------------------|----------|--------------------------------------------------|
| planaredge   | Selection         |          | Planar edge selection.                           |
| offset       | double            | 0        | Specify offset in the normal direction of plane. |
| reverse      | on   off          | off      | Reverse normal direction of plane.               |
| offsettype   | distance   vertex | distance | Type of offset specification.                    |
| offsetvertex | Selection         |          | Specify vertex when offsettype is vertex.        |

