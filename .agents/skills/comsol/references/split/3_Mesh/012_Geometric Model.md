# *Geometric Model*

A meshing sequence that defines its own geometric model defines its own set of entities and is not connected to a geometry sequence. The most common example is a meshing sequence including an Import feature. The meshing features listed in the See Also section can only be added to meshing sequences that define their own geometric model.

![](_page_8_Picture_15.jpeg)

To get information, such as number of entities, adjacency, and more on the geometric model, see Information on the Geometric Model.

To get the geometric model used in the meshing sequence *<tag>*, use

```
String geomModel = model.component(<ctag>).mesh(<tag>).geometricModel();
```

The method returns a string with the tag of the geometry or meshing sequence with the prefix geom/ or mesh/ to indicate if it is a geometry or mesh. It returns an empty string if the sequence defines its own geometric model.

Enter

```
model.component(<ctag>).mesh(<tag>).geometricModel(String);
```

to specify if the meshing sequence *<tag>* defines its own geometric model, is operating on a geometry, or is operating on a mesh. For example, use

```
model.component("comp1").mesh("mesh1").geometricModel("geom/geom1");
to specify that mesh1 is operating on the geometric model defined by geom1. Use
  model.component("comp1").mesh("mesh2").geometricModel("");
to specify that mesh2 is defining its own geometric model. Use
  model.component("comp1").mesh("mesh3").geometricModel("mesh/mesh1");
to specify that mesh3 is operating on the geometric model of mesh1. See also Using Mesh-Based Geometries.
The physics is defined on the component's geometric model. For more information, see model.component().
```

#### **SEE ALSO**

Import, Ball, Box, CreateDomains, CreateEdges, CreateFaces, CreateVertices, Cylinder, DeleteEntities, DetectFaces, FillHoles, IntersectLine, IntersectPlane, JoinEntities, LogicalExpression, Union

