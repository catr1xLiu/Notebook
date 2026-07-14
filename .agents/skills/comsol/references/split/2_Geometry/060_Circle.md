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

