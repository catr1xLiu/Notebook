# *Moving and Scaling Geometry Objects*

You can use the following operations to move or scale objects from the geometry sequence.

```
model.component(<ctag>).geom(<tag>).move(String[] obj, double[] dist);
model.component(<ctag>).geom(<tag>).
   scale(String[] obj, double[] factor, double[] center);
model.component(<ctag>).geom(<tag>).scale(String[] obj, double factor, double[] center);
```

The input array obj specifies the objects to move or scale. The dist array specifies the move distance in each axis direction. The factor array specifies an anisotropic scaling and the factor scalar specifies an isotropic scaling. The center array specifies the scaling centerpoint. When possible, the move and scale operations modify the corresponding geometry features in the sequence. Not all features can be moved or scaled by modifying their properties, in which case move or scale features are added to the geometry sequence instead.

![](_page_12_Picture_11.jpeg)

When using the move or scale operations the status of the current feature and all its preceding features must be built.

