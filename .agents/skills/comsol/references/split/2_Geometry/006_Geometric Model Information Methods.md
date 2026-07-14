# *Geometric Model Information Methods*

Every geometry object in a geometry sequence, as well as the finalized geometry, have an associated GeomInfo object for which you can get information about the geometric model.

To get the GeomInfo object for a geometry object *<objtag>*, use:

```
GeomInfo info = model.component(<ctag>).geom(<tag>).obj(<objtag>);
```

To get the GeomInfo object for the finalized geometry or for the geometric model of a component that is defined by a mesh, use:

```
GeomInfo info = model.component(<ctag>).geom(<tag>).info();
```

For more information about getting information for meshes, see Information on the Geometric Model.

![](_page_4_Picture_11.jpeg)

For a GeomSequence whose component's geometric model is defined by a MeshSequence, the GeomInfo methods return information about that geometric model, not about the GeomSequence. The behavior in this case might change in a future version.

### **GENERAL INFORMATION**

TABLE 3-13: GENERAL GEOMETRY INFORMATION METHODS.

| METHOD         | DESCRIPTION                                                                                                                                                 |
|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|
| check          | Throw an exception if the geometry or mesh is invalid.                                                                                                      |
| getBoundingBox | Return bounding box as the bounding-box coordinates (xmin, xmax, ymin, ymax,).                                                                              |
| getSDim        | Get the space dimension.                                                                                                                                    |
| getType        | Get the geometry object type (solid, surface, curve, point, mixed, or empty).                                                                               |
| hasCadRep      | Check if this is a 3D geometry represented using the CAD kernel.                                                                                            |
| isAssembly     | Check if this is a geometry of assembly type (originating from a Form Assembly feature),<br>including virtual geometries based on a real assembly geometry. |
| isMesh         | Return true if this geometric model is represented by a mesh (rather than a geometry).                                                                      |
| isVirtual      | Return true if this is a virtual geometry.                                                                                                                  |

#### **GEOMETRIC ENTITY COUNTERS**

TABLE 3-14: GEOMETRIC ENTITY COUNTERS.

| METHOD           | DESCRIPTION                                                                     |
|------------------|---------------------------------------------------------------------------------|
| getNEntities     | Get number of entities of different dimensions                                  |
| getNVertices     | Get number of vertices                                                          |
| getNEdges        | Get number of edges                                                             |
| getNFaces        | Get number of faces                                                             |
| getNBoundaries   | Get number of boundaries                                                        |
| getNDomains      | Get number of domains                                                           |
| getNEntitiesMesh | Get number of entities of different dimensions in the geometry used for meshing |

#### **ADJACENCY**

TABLE 3-15: ADJACENCY BETWEEN GEOMETRIC ENTITIES.

| METHOD          | DESCRIPTION                             |
|-----------------|-----------------------------------------|
| getStartEnd     | Get start and end vertices of edges     |
| getUpDown       | Get up and down domain indices          |
| getUpDownExt    | Get up and down extended domain indices |
| getVertexDomain | Get domain index for isolated vertices  |
| getSD           | Get domain index for isolated vertices  |
| getAdj          | Get adjacency matrices                  |
| getAdjOrient    | Get adjacency orientation               |

