# *Building Geometry Features*

To generate the output objects of a feature, you must *build* the feature. Enter

```
model.component(<ctag>).geom(<tag>).run(<ftag>);
```

to build the feature *<ftag>* and all its preceding features (the features are built in the order from the first to the last). When the build has completed, the feature *<ftag>* becomes current.

To build all preceding features of the feature *<ftag>*, enter

```
model.component(<ctag>).geom(<tag>).runPre(<ftag>);
```

To build all features, including the Finalize feature and the virtual operations, enter

```
model.component(<ctag>).geom(<tag>).run();
```

![](_page_9_Picture_16.jpeg)

If the current feature was before the Finalize feature, this operation sets the current feature to be the feature preceding Finalize.

