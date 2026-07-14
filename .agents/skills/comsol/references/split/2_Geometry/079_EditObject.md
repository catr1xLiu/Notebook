# *EditObject*

Create an edit object feature in 2D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"EditObject");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).vertexNew();
model.component(<ctag>).geom(<tag>).feature(<ftag>).vertexDelete(<vertex>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).vertexSnap(<vertex>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).startVertexDisconnect(<edge>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).endVertexDisconnect(<edge>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).edgeNew();
model.component(<ctag>).geom(<tag>).feature(<ftag>).edgeDelete(<edge>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"EditObject") to create an edit object feature.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).vertexNew() to add a new vertex to the object.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).vertexDelete(*<vertex>*) to delete *<vertex>* from the object.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).vertexSnap(*<vertex>*) to delete *<vertex>* from the object, and move any adjacent edges to the closest remaining vertex.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).startVertexDisconnect(*<edge>*) to create a new vertex and use this vertex as the start vertex for *<edge>*.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).endVertexDisconnect(*<edge>*) to create a new vertex and use this vertex as the end vertex for *<edge>*.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).edgeNew() to add a new edge to the object.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).edgeDelete(*<edge>*) to delete *<edge>* from the object.

The following properties are available:

TABLE 3-69: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                       | DEFAULT                          | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|---------------------------------------------------------------------------------------------|----------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                             | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| customcolor   | RGB-triplet                                                                                 | Next<br>available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| input         | Selection                                                                                   |                                  | Geometry object to edit.                                                                                                                                                                                                                   |
| vertex        | integer   ""                                                                                |                                  | Vertex to edit.                                                                                                                                                                                                                            |
| xvertex       | double                                                                                      | 0                                | x-coordinate of vertex being edited.                                                                                                                                                                                                       |
| yvertex       | double                                                                                      | 0                                | y-coordinate of vertex being edited.                                                                                                                                                                                                       |
| edge          | integer   ""                                                                                |                                  | Edge to edit.                                                                                                                                                                                                                              |
| x             | double[]                                                                                    |                                  | x-coordinates of control points of edge being edited.                                                                                                                                                                                      |
| y             | double[]                                                                                    |                                  | y-coordinates of control points of edge being edited.                                                                                                                                                                                      |
| weights       | double[]                                                                                    |                                  | Weights of control points of edge being edited.                                                                                                                                                                                            |
| knots         | double[]                                                                                    |                                  | Knots of NURBS curve for edge being edited.                                                                                                                                                                                                |
| degree        | 1   2   3                                                                                   |                                  | Degree of edge being edited.                                                                                                                                                                                                               |
| start         | integer   ""                                                                                |                                  | Start vertex of edge being edited.                                                                                                                                                                                                         |
| end           | integer   ""                                                                                |                                  | End vertex of edge being edited.                                                                                                                                                                                                           |
| selresult     | on   off                                                                                    | off                              | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                              | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                                                                      | none                             | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-70: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

