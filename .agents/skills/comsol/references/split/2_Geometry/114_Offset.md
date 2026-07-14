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

