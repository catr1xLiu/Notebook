# *Measurement Methods*

All the measurement methods assume that you have selected one or several entities that you want to measure.

To get the volume, area, or length of a selection of entities, enter

```
double vol = model.component(<ctag>).geom(<tag>).measure().getVolume();
```

To get the surface area surrounding selected 3D domains or the perimeter of selected 3D boundaries or 2D domains, enter

```
double bndVol = model.component(<ctag>).geom(<tag>).measure().getBoundaryVolume();
```

To get the area of a selection of faces (3D) or domains (2D), enter

```
double area = model.component(<ctag>).geom(<tag>).measure().getArea();
```

To get the surrounding boundary area of a selection of 3D domains, enter

```
double surrBndArea = model.component(<ctag>).geom(<tag>).measure().getBoundaryArea();
```

To get the perimeter of a selection of faces in 3D or 2D domains, enter

```
double perimeter = model.component(<ctag>).geom(<tag>).measure().getPerimeter();
```

To get the length of a selection of edges or 1D domains, enter

```
double length = model.component(<ctag>).geom(<tag>).measure().getLength();
```

The volumes, areas, and lengths are approximate because they are based on approximating the geometry with a triangular or polygonal mesh (corresponding to a rendering mesh with the rendering detail set to fine).

If you have selected two vertices, you can get their distance by entering

```
double[] d = model.component(<ctag>).geom(<tag>).measure().getVtxDistance();
```

d[0] is the distance, and d[i] is the distance in the ith coordinate (i = 1, 2, 3).

If you have selected one vertex, you can get its coordinates by entering

```
double[] coord = model.component(<ctag>).geom(<tag>).measure().getVtxCoord();
```

To get the total number of entities in the selected objects, enter

```
int[] entitiesPerDimension = model.component(<ctag>).geom(<tag>).measure().
getNEntities();
```

To get the total number of finite voids in the selected objects or finalized geometry, enter

```
int finiteVoids = model.component(<ctag>).geom(<tag>).measure().getNFiniteVoids();
```

