# *Vertices*

This creates a plane parallel to a plane through three vertices v1, v2, and v3.

TABLE 4-20: VALID PROPERTIES, VERTICES.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                     |
|----------|-----------|---------|---------------------------------|
| vertex1  | Selection |         | Specification of first vertex.  |
| vertex2  | Selection |         | Specification of second vertex. |
| vertex3  | Selection |         | Specification of third vertex.  |

TABLE 4-20: VALID PROPERTIES, VERTICES.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                      |
|----------|----------|---------|--------------------------------------------------|
| offset   | double   | 0       | Specify offset in the normal direction of plane. |
| reverse  | on   off | off     | Reverse normal direction of plane.               |

## *Coordinates*

This creates a plane through three points p1, p2, and p3.

TABLE 4-21: VALID PROPERTY, COORDINATES.

| PROPERTY  | VALUE        | DEFAULT                   | DESCRIPTION              |
|-----------|--------------|---------------------------|--------------------------|
| genpoints | double[3][3] | {{0,0,0},{1,0,0},{0,1,0}} | Specification of points. |

genpoints[n][i] is the *i*th coordinate of the *n*th point.

TABLE 4-22: AVAILABLE ADDITIONAL PROPERTIES WHEN SELABOVE, SELBELOW. SELINTER AND SELINTEREDG ARE SET TO ON.

| PROPERTY         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                 |
|------------------|------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colorabove       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either given<br>as an integer indicating a color in the color<br>theme, or as a custom color in the<br>customcolorabove property.                        |
| colorbelow       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either given<br>as an integer indicating a color in the color<br>theme, or as a custom color in the<br>customcolorbelow property.                        |
| colorinter       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the face selection, either given as<br>an integer indicating a color in the color theme,<br>or as a custom color in the customcolorinter<br>property.                          |
| customcolorabove | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorabove is<br>set to custom.                                                                                                                               |
| customcolorbelow | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorbelow is<br>set to custom.                                                                                                                               |
| customcolorinter | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorinter is<br>set to custom.                                                                                                                               |
| selaboveshow     | off   all   pnt   edg  <br>bnd   dom                                                     | dom                           | Specifies on which geometric level the selection<br>is shown in physics, materials, and so on. For<br>mesh parts, this option shows selection outside<br>the part. Used if selabove is on.  |
| selbelowshow     | off   all   pnt   edg  <br>bnd   dom                                                     | dom                           | Specifies on which geometric level the selection<br>is shown in physics,, materials, and so on. For<br>mesh parts, this option shows selection outside<br>the part. Used if selbelow is on. |
| selintershow     | on   off                                                                                 | on                            | Show face selection in physics, materials, and so<br>on. For mesh parts, this option shows selection<br>outside the part. Used if selinter is on.                                           |
| selinteredgshow  | on   off                                                                                 | on                            | Show edge selection in physics, materials, and so<br>on. For mesh parts, this option shows selection<br>outside the part. Used if selinteredg is on.                                        |

## **SEE ALSO**

Import, IntersectLine, Ball, Box, Cylinder, LogicalExpression

Join geometric entities of an imported mesh.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"JoinEntities");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"JoinEntities") to join adjacent geometric entities of an imported 2D or 3D mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify geometric entities to join.

The following properties are available:

TABLE 4-23: AVAILABLE PROPERTIES.

| PROPERTY | VALUE   | DEFAULT | DESCRIPTION                                                           |
|----------|---------|---------|-----------------------------------------------------------------------|
| joinadj  | Boolean | true    | Specifies if the operation joins lower dimensional adjacent entities. |

## **SEE ALSO**

Import, DeleteEntities

## *LogicalExpression*

Split geometric entities of an imported mesh by specifying a logical expression.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"LogicalExpression");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"LogicalExpression") to split entities of an imported mesh by specifying an element set based on a logical expression.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the geometric entities for which you want to define an element selection. If you do not specify the selection, the feature operates on the entire geometry.

The following properties are available:

TABLE 4-24: AVAILABLE PROPERTIES.

| PROPERTY   | VALUE                    | DEFAULT     | DESCRIPTION                                                                                                                                            |
|------------|--------------------------|-------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| expression | String                   | 1           | Logical expression, where the valid variables<br>are: x, y, and z; h and qual; and istri,<br>isquad, istet, ispyr, isprism, ishex, and<br>meshelement. |
| condition  | allvertices   somevertex | allvertices | Condition for inclusion of an element.                                                                                                                 |

TABLE 4-24: AVAILABLE PROPERTIES.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                                                              |
|----------|----------|---------|------------------------------------------------------------------------------------------|
| seltrue  | on   off | off     | Create selection of all entities in the region<br>where the logical expression is true.  |
| selfalse | on   off | off     | Create selection of all entities in the region<br>where the logical expression is false. |

TABLE 4-25: AVAILABLE ADDITIONAL PROPERTIES WHEN SELTRUE AND SELFALSE ARE SET TO ON.

| PROPERTY         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                          |
|------------------|------------------------------------------------------------------------------------------|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colortrue        | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either<br>given as an integer indicating a color in the<br>color theme, or as a custom color in the<br>customcolortrue property.  |
| colorfalse       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either<br>given as an integer indicating a color in the<br>color theme, or as a custom color in the<br>customcolorfalse property. |
| customcolortrue  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colortrue is<br>set to custom.                                                                                                         |
| customcolorfalse | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorfalse<br>is set to custom.                                                                                                        |
| seltrueshow      | all   dom   bnd   pnt  <br>off                                                           | dom                           | Show the selection on the specified entity<br>level in physics, materials, and so on. For<br>mesh parts, this option shows selection<br>outside the part.            |
| selfalseshow     | all   dom   bnd   pnt  <br>off                                                           | dom                           | Show the selection on the specified entity<br>level in physics, materials, and so on. For<br>mesh parts, this option shows selection<br>outside the part.            |

Import, Ball, Box, Cylinder, DetectFaces

## *Map*

Create a structured (mapped) quadrilateral mesh in domains in 2D and on faces in 3D. The mapped mesher maps a regular grid defined on a logical unit square onto each domain or face. The mapping method is based on transfinite interpolation. The operation can also be used to remesh meshes that define their own geometric model.

