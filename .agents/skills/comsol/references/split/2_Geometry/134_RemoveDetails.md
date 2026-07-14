# *RemoveDetails*

Remove small details from the geometry.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"RemoveDetails");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("input");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"RemoveDetails") to automatically remove small details from the geometry. You can also add extra local virtual operations using the following syntax (in this example, adding an IgnoreEdges operation):

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).create("IgnoreEdges", "ige1");
```

You can then build that local virtual operation using

```
model.component(<ctag>).geom(<tag>).run("<ftag>/ige1");
```

You can also use the selection property input:

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection("input");
```

If the RemoveDetails operation is in the automatic state, use the .problems() syntax to retrieve information on warnings (if any). The problem list is cleared if you switch to the manual state.

The following properties are available:

TABLE 3-146: VALID PROPERTY/VALUE PAIRS FOR REMOVEDETAILS.

| PROPERTY       | VALUES                        | DEFAULT   | DESCRIPTION                                                                                                       |
|----------------|-------------------------------|-----------|-------------------------------------------------------------------------------------------------------------------|
| automatic      | on   off                      | on        | Mode of operation.                                                                                                |
| contangletol   | double                        | 5 degrees | Maximum allowed angular tangent deviation across a<br>vertex or edge to be ignored.                               |
| contvertices   | boolean                       | true      | Specifies if vertices with continuous tangent are ignored.                                                        |
| detailsizetype | auto   relative  <br>absolute | auto      | Detail size type: automatic, relative, or absolute.                                                               |
| input          | Selection                     |           | Entities for which to remove small details.                                                                       |
| maxrelsize     | double                        | 0.001     | Maximum relative detail size, relative to size of geometry.                                                       |
| maxabssize     | double                        |           | Maximum absolute detail size.                                                                                     |
| selection      | geometry  <br>entities        | geometry  | Remove small details from the entire geometry or from<br>geometric entities specified using the input.            |
| shortedges     | boolean                       | true      | Specifies if short edges are removed.                                                                             |
| sliverfaces    | boolean                       | true      | Specifies if sliver faces are removed.                                                                            |
| smallfaces     | boolean                       | true      | Specifies if small faces are removed.                                                                             |
| thindomains    | boolean                       | true      | Specifies if thin domains (that is, domains with a<br>thickness less than the specified detail size) are removed. |

