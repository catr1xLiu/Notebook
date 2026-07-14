# *LinearExtrusion*

A *nonlocal linear extrusion coupling* operator linearly maps an expression defined on a source to an expression that can be evaluated in the destination.

TABLE 2-70: LINEAR EXTRUSION MAP PROPERTIES.

| PROPERTY   | VALUE                        | DEFAULT             | DESCRIPTION                                               |
|------------|------------------------------|---------------------|-----------------------------------------------------------|
| srcvertexN | Selection                    |                     | Source vertex number N                                    |
| dstgeom    | String                       | source geometry     | Destination geometry                                      |
| dstvertexN | Selection                    |                     | Destination vertex number N                               |
| srcframe   | mesh   material  <br>spatial | spatial             | Frame for evaluation of source vertex<br>coordinates      |
| dstframe   | mesh   material  <br>spatial | spatial             | Frame for evaluation of destination vertex<br>coordinates |
| usesrcmap  | on   off                     | off                 | Use source map                                            |
| srcmap     | string[srcsdim]              | spatial coordinates | Expressions for source map ms(ps)                         |

The number of selections srcvertexN and dstvertexN is 4. These are used only for 1<=N<=dim+1, where dim is a number less than or equal to min(srcsdim,dstsdim). The remaining 4-dim selections should be empty.

The destination map is the following linear (affine) map from the destination geometry to the source geometry:

- **1** First, if dim<dstsdim, an orthogonal projection onto the affine space spanned by the destination vertices. The number of destination vertices is dim+1. Thus, dim=2 gives a plane, and dim=1 gives a line.
- **2** Then, a linear (affine) map mapping the destination vertices onto the source vertices.

## *BoundarySimilarity (3D)*

A *nonlocal boundary similarity coupling* operator maps an expression defined on a part of a boundary to another part of a boundary with the same shape.

TABLE 2-71: BOUNDARY SIMILARITY PROPERTIES IN 3D.

| PROPERTY    | VALUE           | DEFAULT             | DESCRIPTION                        |
|-------------|-----------------|---------------------|------------------------------------|
| destination | Selection       |                     | Destination face.                  |
| usesrcmap   | on   off        | off                 | Use source map.                    |
| srcmap      | string[srcsdim] | spatial coordinates | Expressions for source map ms(ps). |

The destination transformation is a similarity transformation that maps a destination face (destination) onto a set of source faces (the source selection). The mesh is always viewed in the mesh frame.

By default, the algorithm automatically chooses a transformation when symmetries make several transformations possible. To control this choice, one of the following subfeatures can be added in 3D.

TABLE 2-72: SUBFEATURE TYPES.

| SUBFEATURE  | REMARKS                                     |  |
|-------------|---------------------------------------------|--|
| EdgeMap     | Specify how one source edge is mapped.      |  |
| OnePointMap | Specify how one source vertex is mapped.    |  |
| TwoPointMap | Specify how two source vertices are mapped. |  |

#### *EdgeMap*

An *edge map* specifies that a certain destination edge should be mapped onto a certain source edge. Their relative direction is given by the property direction. The edges must be adjacent to the given faces.

TABLE 2-73: PROPERTIES FOR EDGEMAP SUBFEATURE.

| PROPERTY  | VALUE                  | DEFAULT | DESCRIPTION       |
|-----------|------------------------|---------|-------------------|
| srcedge   | Selection              |         | Source edge.      |
| dstedge   | Selection              |         | Destination edge. |
| direction | auto   same   opposite | auto    | Edge direction.   |

## *OnePointMap*

A *one-point map* specifies that a certain destination vertex should be mapped onto a certain source vertex.

TABLE 2-74: PROPERTIES FOR ONEPOINTMAP SUBFEATURE.

| PROPERTY  | VALUE     | DEFAULT | DESCRIPTION                 |  |
|-----------|-----------|---------|-----------------------------|--|
| srcpoint1 | Selection |         | Vertex on source face.      |  |
| dstpoint1 | Selection |         | Vertex on destination face. |  |

