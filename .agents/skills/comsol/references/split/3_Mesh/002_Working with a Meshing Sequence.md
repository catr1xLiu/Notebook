# Working with a Meshing Sequence

This section describes how to build meshes using Java® methods. A *mesh* is defined by a *meshing sequence* consisting of *mesh features*. A meshing feature is either an *attribute feature* or an *operation feature*. Each operation feature modifies the mesh when you *build* the feature using properties defined by attribute features.

An attribute feature is defined on a geometric entity selection and has a set of properties. Running an attribute feature does not change the mesh, but affects the subsequent operation features in the sequence. For example, the FreeTet operation feature, that creates a tetrahedral mesh, uses properties from the Distribution, Scale, and Size attribute features, that define the size and distribution of the mesh elements. You can add an attribute feature directly to the meshing sequence, this is referred to as a *global attribute feature*, or add it to an operation feature, this is referred to as a *local attribute feature*. Properties defined in local attribute features of an operation feature overrides corresponding properties defined in preceding global feature properties (on the same selection).

An operation features makes operations on the mesh as defined by the meshing sequence. Some operation features, like FreeTet and Sweep *generate* new mesh. Other operation features, like Refine and Convert *modify* existing mesh.

## In this section:

- **•** Adding a Meshing Sequence
- **•** Adding a Mesh Feature
- **•** Editing a Mesh Feature
- **•** Building Mesh Features
- **•** Using Mesh Parts
- **•** Using Mesh-Based Geometries
- **•** Feature Status
- **•** Deleting Mesh Features
- **•** Disabling Mesh Features
- **•** Clearing Meshes
- **•** Locking Meshes
- **•** Units
- **•** Selections

| model.mesh() — Information about the main model.mesh command. |  |
|---------------------------------------------------------------|--|

