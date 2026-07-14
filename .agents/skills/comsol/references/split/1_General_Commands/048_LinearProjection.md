# *LinearProjection*

A *nonlocal linear projection coupling* operator defines a mapping between destination and source that is given by a linear map defined by vertices. Let *v* be the vector from the first source vertex to the last source vertex. The value of oper(e) at a point *pd* is equal to the integral of e over the line through the point *ps=ms* -1(*md*(*pd*)) with direction vector *v*.

TABLE 2-81: LINEAR PROJECTION COUPLING PROPERTIES.

| PROPERTY   | VALUE                     | DEFAULT            | DESCRIPTION                                                |
|------------|---------------------------|--------------------|------------------------------------------------------------|
| srcvertexN | Selection                 |                    | Source vertex number N.                                    |
| dstgeom    | String                    | source<br>geometry | Destination geometry.                                      |
| dstvertexN | Selection                 |                    | Destination vertex number N.                               |
| srcframe   | mesh   material   spatial | spatial            | Frame for evaluation of source vertex coordinates.         |
| dstframe   | mesh   material   spatial | spatial            | Frame for evaluation of destination vertex<br>coordinates. |

The number of selections srcvertexN is 4. These are used only for 1<=N<=srcedim+1. The remaining selections should be empty. The number of source vertices is srcedim+1. The source map is a linear (affine) map that maps the source vertices onto the points 0, *e*1, *e*2, …, *e*srcedim in the intermediate space, where *ei* is the *i*th unit vector.

The number of selections dstvertexN is 4. These are used only for 1<=N<=srcedim. The remaining selections should be empty. The number of destination vertices is srcedim. The destination map is the following linear (affine) map from the destination geometry to the intermediate space:

- **1** First, if srcedim-1<dstsdim, an orthogonal projection onto the affine space spanned by the destination vertices. Thus, srcedim=3 gives a plane, and srcedim=2 gives a line.
- **2** Then, a linear (affine) map mapping the destination vertices onto the points 0, *e*1, *e*2, …, *e*srcedim-1 in the intermediate space, where *ei* is the *i*th unit vector.

