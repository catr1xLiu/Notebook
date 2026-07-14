# *CollapseFaceRegions*

Collapse face regions.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CollapseFaceRegions");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(<tag>).create(<ftag>),"CollapseFaceRegions") to collapse narrow face regions.

Use model.component(*<ctag>*).geom(<tag>).feature(*<ftag>*).selection("input") to select the faces where narrow regions should be collapsed. The default selection is empty.

The feature collapses narrow face regions by determining narrow regions of a face and then collapsing those resulting sliver faces.

The output object is a virtual geometry.

The following properties are available:

| PROPERTY  | VALUE            | DEFAULT | DESCRIPTION                                                                                     |
|-----------|------------------|---------|-------------------------------------------------------------------------------------------------|
| input     | Selection        |         | Faces for which narrow regions should be collapsed.                                             |
| maxwidth  | double           | 0.001   | The maximum width of a face region to be collapsed when<br>narrowtol is set to manual.          |
| narrowtol | auto  <br>manual | auto    | Use an automatic or manual tolerance for the maximum width of<br>a face region to be collapsed. |

## **SEE ALSO**

MergeEdges, CollapseEdges, CollapseFaces

*Compose, Union, Intersection, Difference*

Compose objects using a Boolean set formula.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Compose");
model.component(<ctag>).geom(<tag>).create(<ftag>,"Union");
model.component(<ctag>).geom(<tag>).create(<ftag>,"Intersection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"Difference");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,*operationName*) to combine geometric objects in different ways.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection(*property*) to select the objects to combine. The default selection is empty.

The following properties are available:

TABLE 3-43: VALID PROPERTIES FOR THE COMPOSE AND BOOLEAN OPERATIONS.

| PROPERTY     | VALUE                                                                                                   | DEFAULT                                | DESCRIPTION                                                                                                                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------------------|----------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| absrepairtol | double                                                                                                  | geom( <tag>).<br/>absRepairTol()</tag> | Absolute repair tolerance.                                                                                                                                                                                    |
| color        | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none                                   | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| customcolor  | RGB-triplet                                                                                             | Next available theme<br>color          | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| formula      | String                                                                                                  |                                        | Set formula (only for Compose feature).                                                                                                                                                                       |
| input        | Selection                                                                                               |                                        | Objects to compose.                                                                                                                                                                                           |
| input2       | Selection                                                                                               |                                        | Objects to subtract (only for the Difference feature).                                                                                                                                                        |
| intbnd       | on   off                                                                                                | on                                     | Keep interior boundaries.                                                                                                                                                                                     |

TABLE 3-43: VALID PROPERTIES FOR THE COMPOSE AND BOOLEAN OPERATIONS.

| PROPERTY      | VALUE                                            | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|--------------------------------------------------|-----------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| keep          | on   off                                         | off                                     | Keep input objects (not for the Difference feature).                                                                                                                                                                                       |
| keepadd       | on   off                                         | off                                     | Keep input objects to add (only for the Difference<br>feature).                                                                                                                                                                            |
| keeplowerdim  | on   off                                         | off                                     | Keep lower-dimensional intersections (only for the<br>Intersection feature).                                                                                                                                                               |
| keepsubtract  | on   off                                         | off                                     | Keep input objects to subtract (only for the<br>Difference feature).                                                                                                                                                                       |
| repairtol     | double                                           | geom( <tag>).<br/>repairTol()</tag>     | Relative repair tolerance, relative to size of union of<br>inputs.                                                                                                                                                                         |
| repairtoltype | auto  <br>relative  <br>absolute                 | geom( <tag>).<br/>repairTolType()</tag> | Repair tolerance type: automatic, relative, or<br>absolute.                                                                                                                                                                                |
| selresult     | on   off                                         | off                                     | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off | dom                                     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from<br>a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| propagatesel  | on   off                                         | on                                      | Propagate selections from input objects to resulting<br>objects.                                                                                                                                                                           |
| contributeto  | String                                           | none                                    | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

The following Boolean operation is performed:

- **•** For Compose, the input objects are combined using the set formula in the property formula. The operators +, \*, and - correspond to the set operations union, intersection, and difference, respectively. The precedence of the operators + and - are the same. \* has higher precedence.
- **•** For Union, the objects in input are united.
- **•** For Intersection, the objects in input are intersected.
- **•** For Difference, the objects in input2 are subtracted from the union of the objects in input to form a set difference.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-44: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

The following properties are also supported, see the Delete feature:

TABLE 3-45: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE      | DEFAULT | DESCRIPTION                                                                                                               |
|----------|------------|---------|---------------------------------------------------------------------------------------------------------------------------|
| edge     | all   none | none    | Delete isolated edges on a face (3D). Delete interior edges and edges not<br>adjacent to a domain (2D; alias for indbnd). |

TABLE 3-45: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE      | DEFAULT | DESCRIPTION                                                           |  |
|----------|------------|---------|-----------------------------------------------------------------------|--|
| face     | all   none | none    | Delete interior faces (3D; alias for intbnd).                         |  |
| point    | all   none | none    | Delete isolated vertices (points) on a face (3D) or in a domain (2D). |  |

The property out is no longer available.

## **SEE ALSO**

ConvertToSolid, ConvertToSurface, ConvertToCurve, ConvertToPoint, Finalize, Partition

