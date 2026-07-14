# *CreateVertices*

Create vertices in a mesh that defines its own geometric model.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"CreateVertices");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CreateVertices") to create additional vertices in a mesh that defines its own geometric model. For more information, see Geometric Model.

Convert existing mesh vertices into vertex elements, refine existing elements by inserting points into them, or create new vertex elements in void or in unmeshed domains. In the general case, converting mesh vertices is most easily done setting the coord value due to the snapping tolerance. This option also makes it possible to create vertices that are not connected to an existing mesh.

The following properties are available:

TABLE 4-38: AVAILABLE PROPERTIES FOR CREATEVERTICES.

| PROPERTY    | VALUE                 | DEFAULT   | DESCRIPTION                                                                                                                                   |
|-------------|-----------------------|-----------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| vertexspec  | coord  <br>meshvertex | coord     | Specify if to enter approximate point coordinates or to specify<br>the exact mesh vertex coordinates.                                         |
| coordformat | component  <br>point  | component | Specify if to enter arrays of the x, y, and z components or if to<br>specify a matrix containing all points. Use when vertexspec is<br>coord. |
| x           | double[]              | {}        | Enter x-coordinates when coordformat is component.                                                                                            |
| y           | double[]              | {}        | Enter y-coordinates when coordformat is component.                                                                                            |

TABLE 4-38: AVAILABLE PROPERTIES FOR CREATEVERTICES.

| PROPERTY   | VALUE      | DEFAULT | DESCRIPTION                                                                                                                                         |
|------------|------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| z          | double[]   | {}      | Enter z-coordinates (3D only) when coordformat is<br>component.                                                                                     |
| points     | double[][] | {}      | Enter the point coordinates when coordformat is point.<br>Specify, x, y, and z (3D only) values.                                                    |
| relsnaptol | double     | 0.001   | The snapping tolerance relative to diameter of the mesh<br>bounding box diameter. Enter value between 0 and 1. Is used<br>when vertexspec is coord. |
| coordsel   | double[][] | {}      | Enter exact coordinates of mesh vertex when vertexspec is<br>meshvertex. Specify, x, y, and z (3D only) values.                                     |
| selvtx     | on   off   | on      | Specifies if to create a selection of resulting vertices.                                                                                           |
| selvtxshow | on   off   | on      | Show vertex selection in physics, materials, and so on. For mesh<br>parts, this option shows selection outside the part. Used if<br>selvtx is on.   |

CreateDomains, CreateEdges, CreateFaces

## *Cylinder*

Split geometric entities of an imported mesh by a cylinder.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Cylinder");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Cylinder") to split geometric entities of an imported 3D mesh by an element set defined by a cylinder.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify geometric entities to split. If you do not specify the selection, the feature operates on the entire geometry.

The following properties are available:

TABLE 4-39: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE                                | DEFAULT     | DESCRIPTION                                                                                                    |
|-----------|--------------------------------------|-------------|----------------------------------------------------------------------------------------------------------------|
| r         | double                               | 1           | Radius of the cylinder.                                                                                        |
| top       | double                               | inf         | Coordinate of upper boundary circle in local coordinate<br>system.                                             |
| bottom    | double                               | -inf        | Coordinate of lower boundary circle in local coordinate<br>system.                                             |
| pos       | double[]                             | {0,0,0}     | Position of the cylinder.                                                                                      |
| axistype  | x   y   z   Cartesian  <br>spherical | z           | Coordinate system used for axis. The value is<br>synchronized with axis.                                       |
| axis      | double[]                             | {0,0,1}     | Direction of the axis. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is spherical. |
| condition | allvertices  <br>somevertex          | allvertices | Condition for inclusion of an element.                                                                         |

TABLE 4-39: AVAILABLE PROPERTIES.

| PROPERTY   | VALUE    | DEFAULT | DESCRIPTION                                            |
|------------|----------|---------|--------------------------------------------------------|
| selinside  | on   off | off     | Create selection of all entities inside the cylinder.  |
| seloutside | on   off | off     | Create selection of all entities outside the cylinder. |

TABLE 4-40: AVAILABLE ADDITIONAL PROPERTIES WHEN SELINSIDE AND SELOUTSIDE ARE SET TO ON.

| PROPERTY           | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                            |
|--------------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colorinside        | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either<br>given as an integer indicating a color in the<br>color theme, or as a custom color in the<br>customcolorinside property.  |
| coloroutside       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either<br>given as an integer indicating a color in the<br>color theme, or as a custom color in the<br>customcoloroutside property. |
| customcolorinside  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorinside<br>is set to custom.                                                                                                         |
| customcoloroutside | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when<br>coloroutside is set to custom.                                                                                                        |
| selinsideshow      | all   dom   bnd   pnt  <br>off                                                           | dom                           | Show the selection on the specified entity<br>level in physics, materials, and so on. For<br>mesh parts, this option shows selection<br>outside the part.              |
| seloutsideshow     | all   dom   bnd   pnt  <br>off                                                           | dom                           | Show the selection on the specified entity<br>level in physics, materials, and so on. For<br>mesh parts, this option shows selection<br>outside the part.              |

Import, Ball, Box, DetectFaces, LogicalExpression

