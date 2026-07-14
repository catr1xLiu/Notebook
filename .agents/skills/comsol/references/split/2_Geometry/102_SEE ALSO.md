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

