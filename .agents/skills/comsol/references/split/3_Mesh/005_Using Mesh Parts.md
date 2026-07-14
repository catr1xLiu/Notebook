# *Using Mesh Parts*

For a description of mesh parts, see Mesh Parts in the *COMSOL Multiphysics Reference Manual*.

A mesh part is defined by a model component of MeshComponent type (a *mesh component*). A mesh component contains a single meshing sequence and a geometry that defines the dimension, selections, and geometrical properties such as the length and angular unit. When you work with a Mesh Part node in the user interface, you can modify the meshing sequence of the mesh component. When working with the API it is important to be aware of the corresponding mesh component and its geometry.

To create a mesh part, enter

```
model.modelNode().create(<mcomptag>, "MeshComponent");
model.geom().create(<mgeomtag>, sDim);
model.mesh().create(<tag>, <mgeomtag>);
```

where *<mcomptag>* is the tag of the mesh component, *<mgeomtag>* is the tag of the geometry, sDim is its space dimension (1, 2, or 3), and *<tag>* is the mesh part's tag.

Use model.component(*<ctag>*).geom(*<mgeomtag>*) to access the geometry properties, such as length units (see model.geom(*<tag>*)).

To work with the mesh part, use model.mesh(*<tag>*), see the sections above in Working with a Meshing Sequence and Table 4-1, the column with header Mesh Defining its Own Geometric Model, for details.

For using a mesh part in a model component, see Import Mesh Part or Meshing Sequence under Geometry Commands to create a geometry from the part, or Import under Mesh Commands to use the resulting mesh as an imported mesh.

To remove a mesh part, use model.modelNode().remove(*<mcomptag>*);

## *Using Mesh-Based Geometries*

A mesh-based geometry is sometimes used by the automatic cleanup. For more information, see Geometry Cleanup. See also Geometric Model.

To create a meshing sequence or a mesh-based geometry sequence, use

```
model.mesh().create(<mtag>,<type>,<gtag>);
```

where *<mtag>* is the mesh's tag (an identifier of your choice) and *<gtag>* is the tag of the associated geometry. Set *<type>* to Sequence to create an ordinary meshing sequence and set it to Geometry to create a mesh-based geometry sequence.

Use

```
model.mesh(<mtag>).isGeometry();
```

to check if the meshing sequence *<mtag>* is a mesh-based geometry.

