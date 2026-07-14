# *Information on the Geometric Model*

Use the info() method to get information on the geometric model (number of entities, adjacency, and more). For a mesh that defines its own geometric model, use infoCurrent() to obtain topological information about the current (last built) mesh feature. Use info() to obtain the same information about the finalized mesh. See Geometric Model for more information about meshes that define their own geometric models.

```
int nDomains = model.component(<ctag>).mesh(<tag>).infoCurrent().getNDomains();
int nFaces = model.component(<ctag>).mesh(<tag>).infoCurrent().getNFaces();
int nEdges = model.component(<ctag>).mesh(<tag>).infoCurrent().getNEdges();
int nVertices = model.component(<ctag>).mesh(<tag>).infoCurrent().getNVertices();
```

See Geometric Model Information Methods for a complete list of available methods.

For a mesh that is conforming with a geometry sequence, info() returns information about the currently meshed entities only. This means that, for example, the adjacency relations can be a subset of the adjacency relations in the full geometric model. Since the numbering of entities is the same as in the complete geometric model, there might be gaps or unused entries in the returned data arrays.

For a mesh that defines its own geometric model, infoCurrent() returns geometric information on the output of the last built mesh operation, while info() returns geometric information for the finalized mesh. The geometric model of the finalized mesh is the geometric model used by physics and it is updated only when the finalize feature is built.

