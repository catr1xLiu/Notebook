# Geometry Cleanup

In 3D it is possible to remove small details in the geometry by running a *geometry cleanup*. Gaps, narrow domain regions, narrow face regions, sliver faces, small faces, and short edges that are smaller than the estimated, or manually set, detail size are considered to be small details and are therefore considered unwanted. This will typically reduce the number of elements in the mesh and therefore reduce computation time and memory consumption. If the geometry is a single vertex, cleanup is not available.

To access the cleanup tool for the geometry *<gtag>*, enter

```
model.geom(<gtag>).cleanup();
```

To estimate the detail size that is used for the geometry analysis and automatic cleanup, use the method below. Details smaller than the returned value are considered unwanted by default.

```
model.geom(<gtag>).cleanup().estimateDetailSize();
```

It is possible to manually set a different detail size using the detailsize property.

```
model.geom(<gtag>).cleanup().set("detailsize",<value>);
```

The default value is 0 or an estimated detail size. The detail size *<value>* must be larger than 1e-6 times the size of the geometry and less then 0.1 times the size of the geometry. If *<value>* is set to 0 when you run the analysis or automatic cleanup, it will be set to the estimated detail size.

To run the geometry analysis to detect small details with the current detail size, use the method below.

```
model.geom(<gtag>).cleanup().analyze();
```

Use the method below to get the time it took to analyze or clean up the geometry. It returns -1 if the analysis has not been built.

```
model.geom(<gtag>).cleanup().buildTime();
```

Get a list of all detail types that were found in the last analysis by entering

```
model.geom(<gtag>).cleanup().details();
```

and get the estimated max and min size for each detail of the specified type *<type>* that were found in the last analysis by entering

```
model.geom(<gtag>).cleanup().detailSizes(<type>);
```

To run automatic cleanup with the current detail size, enter

```
model.geom(<gtag>).cleanup().run();
```

To revert changes to the model done by cleanup, enter

```
model.geom(<gtag>).cleanup().revert();
```

The automatic cleanup can add Mesh-Based Geometries for some of the cleaning. See Using Mesh-Based Geometries for more information.

