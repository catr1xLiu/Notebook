# *Deleting Geometry Objects*

You can use the following operation to delete objects from the geometry sequence.

```
model.component(<ctag>).geom(<tag>).delete(String[]);
```

In the input string array you specify the names of the objects to delete. The operation deletes objects that correspond to primitive geometry features by removing these features from the sequence. The operation then deletes the remaining objects by adding and building a Delete feature with the objects in its selection.

![](_page_11_Picture_25.jpeg)

When using the delete operation the status of the current feature and all its preceding features must be built.

You can use the following operation to delete some edges from a Polygon or CompositeCurve object in a 2D geometry:

```
String[] remaining = model.component(<ctag>).geom(<tag>).deleteEdges(<objname>, <edges>);
```

This operation deletes the given edges by using a combination of the following methods:

- **•** Removing the geometry feature.
- **•** Removing points from a Polygon feature.
- **•** Splitting a Polygon or Composite Curve feature into several features.

The return array contains the tags of the remaining (if any) and created (if any) features.

