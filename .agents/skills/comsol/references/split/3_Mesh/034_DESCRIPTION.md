# **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Ball") to split geometric entities of an imported 2D or 3D mesh by an element set defined by a ball.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify geometric entities to split. If you do not specify the selection, the feature operates on the entire geometry.

The following properties are available:

TABLE 4-14: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE                    | DEFAULT     | DESCRIPTION                            |
|-----------|--------------------------|-------------|----------------------------------------|
| condition | allvertices   somevertex | allvertices | Condition for inclusion of an element. |
| posx      | double                   | 0           | Center, first coordinate.              |
| posy      | double                   | 0           | Center, second coordinate.             |
| posz      | double                   | 0           | Center, third coordinate.              |
| r         | double                   | 1           | Radius.                                |

TABLE 4-14: AVAILABLE PROPERTIES.

| PROPERTY   | VALUE    | DEFAULT | DESCRIPTION                                           |
|------------|----------|---------|-------------------------------------------------------|
| selinside  | on   off | off     | Create selection of all entities inside the<br>ball.  |
| seloutside | on   off | off     | Create selection of all entities outside the<br>ball. |

TABLE 4-15: AVAILABLE ADDITIONAL PROPERTIES WHEN SELINSIDE AND SELOUTSIDE ARE SET TO ON.

| PROPERTY           | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                            |
|--------------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colorinside        | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either<br>given as an integer indicating a color in the<br>color theme, or as a custom color in the<br>customcolorinside property.  |
| coloroutside       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either<br>given as an integer indicating a color in the<br>color theme, or as a custom color in the<br>customcoloroutside property. |
| customcolorinside  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorinside<br>is set to custom.                                                                                                         |
| customcoloroutside | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when<br>coloroutside is set to custom.                                                                                                        |
| selinsideshow      | all   dom   bnd   pnt  <br>off                                                           | dom                           | Show the selection on the specified entity<br>level in physics, materials, and so on. For<br>mesh parts, this option shows selection<br>outside the part.              |
| seloutsideshow     | all   dom   bnd   pnt  <br>off                                                           | dom                           | Show the selection on the specified entity<br>level in physics, materials, and so on. For<br>mesh parts, this option shows selection<br>outside the part.              |

Import, Box, Cylinder, DetectFaces, LogicalExpression

## *BndLayer*

Create a boundary layer mesh. Supported for domains in 2D and 3D as well as for faces in 3D. For imported meshes, the domains must contain a mesh. Use FreeTet to fill unmeshed domains before creating a boundary layer mesh.

