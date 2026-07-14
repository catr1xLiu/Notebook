# *About Virtual Operations*

In 2D and 3D it is possible to reduce the number of vertices, edges, faces, and domains of the geometry by using *virtual operation features*. To add the first virtual operation feature to a sequence you need to build the finalize feature by entering

```
model.component(<ctag>).geom(<tag>).run("fin");
```

You can then add the virtual operation feature by entering

```
model.component(<ctag>).geom(<tag>).create(<ftag>,ftype);
```

where *<ftag>* is the feature's tag (an identifier of your choice), and *ftype* is the feature's type. To build the feature, enter

```
model.component(<ctag>).geom(<tag>).run(<ftag>);
```

To build all features, including the finalize feature and all virtual operation features, and to create the finalized geometry, enter

```
model.component(<ctag>).geom(<tag>).run();
```

The finalized geometry of a sequence that contains virtual operation features is referred to as a *virtual geometry*. If you form a composite edge, face, or domain by using a CompositeEdges, CompositeFaces, or CompositeDomains feature, respectively (or the analogues IgnoreVertices, IgnoreEdges, or IgnoreFaces features) the resulting edge, face, or domain is referred to as a *virtual composite edge*, *virtual composite face*, or *virtual composite domain*, respectively, or more generally, a *virtual composite entity*.

