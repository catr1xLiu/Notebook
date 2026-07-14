# *MergeEdges*

Merge edges adjacent to faces.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MergeEdges");
model.component(<ctag>).geom(<tag>).feature().selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
```

Use model.component(*<ctag>*).geom(<tag>).create(*<ftag>*,"MergeEdges") to merge edges adjacent to face.

Use model.component(*<ctag>*).geom(<tag>).feature(*<ftag>*).selection("keepedg") to select the edges to keep. The default selection is empty.

Use model.component(*<ctag>*).geom(<tag>).feature(*<ftag>*).selection("removeedg") to select the edges to remove. The default selection is empty.

The feature merges the edges by collapsing the face between the edges and reconnecting the faces adjacent to the removed edges to the resulting merged edges.

The output object is a virtual geometry.

The following properties are available:

| PROPERTY  | VALUE     | DEFAULT | DESCRIPTION      |
|-----------|-----------|---------|------------------|
| keepedg   | Selection |         | Edges to keep.   |
| removeedg | Selection |         | Edges to remove. |

## **SEE ALSO**

CollapseFaces, CollapseFaceRegions

