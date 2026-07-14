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

