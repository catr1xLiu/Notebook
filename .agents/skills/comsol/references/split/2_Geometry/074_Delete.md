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

