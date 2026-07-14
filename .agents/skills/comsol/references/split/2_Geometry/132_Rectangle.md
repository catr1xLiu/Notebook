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

