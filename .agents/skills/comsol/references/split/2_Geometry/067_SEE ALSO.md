# **SEE ALSO**

CompositeEdges, CompositeFaces, IgnoreEdges, IgnoreFaces

Form composite edges.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CompositeEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CompositeEdges") to form composite edges.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the edges to concatenate. The default selection is empty.

The feature forms a composite edge for each connected edge component (of manifold type) of the selected edges by ignoring the vertices between the edges. The output object is a virtual geometry.

The following properties are available:

TABLE 3-49: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT | DESCRIPTION                        |
|-------------|-----------|---------|------------------------------------|
| input       | Selection |         | Edges to composite.                |
| keepformesh | on   off  | off     | Keep input edges for mesh control. |

Use keepformesh to keep the input edges while meshing, to help you in constructing the mesh.

Note that the operation never forms composite edges that are closed loops or periodic, that is, every resulting edge has distinct start and end vertices.

#### **EXAMPLE**

Compose edges 2 and 4 of a circle into one edge.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  g.create("c1", "Circle");
  g.run("fin");
  g.create("cme1", "CompositeEdges");
  g.feature("cme1").selection("input").set("fin", 2, 4);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  g.create('c1', 'Circle');
  g.run('fin');
  g.create('cme1', 'CompositeEdges');
  g.feature('cme1').selection('input').set('fin', 2, 4);
  g.run;
```

#### **SEE ALSO**

CompositeDomains, CompositeFaces, IgnoreVertices

Form composite faces.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CompositeFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CompositeFaces") to form composite faces.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the faces to concatenate. The default selection is empty.

The feature forms a composite face for each connected face component (of manifold type) of the selected faces by ignoring the edges between the faces. The output object is a virtual geometry.

The following properties are available:

TABLE 3-50: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT                                   | DESCRIPTION         |  |
|-------------|-----------|-------------------------------------------|---------------------|--|
| input       | Selection |                                           | Faces to composite. |  |
| ignorevtx   | on   off  | on<br>Ignore vertices on boundary.        |                     |  |
| keepformesh | on   off  | off<br>Keep input faces for mesh control. |                     |  |

Use ignorevtx to specify if the feature also removes the ignorable vertices on the boundary of each resulting composite face.

Use keepformesh to keep the input faces while meshing, to help you in constructing the mesh.

## **EXAMPLE**

A COMSOL Multiphysics standard cone has six faces. Using the following composite face operation, the result is a cone with three faces: top, bottom, and side.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("cone1", "Cone");
  g.run("fin");
  g.create("cmf1", "CompositeFaces");
  g.feature("cmf1").selection("input").set("fin", 1, 2, 5, 6);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('cone1', 'Cone');
  g.run('fin');
  g.create('cmf1', 'CompositeFaces');
  g.feature('cmf1').selection('input').set('fin', [1, 2, 5, 6]);
  g.run;
```

## **SEE ALSO**

CompositeDomains, CompositeEdges, IgnoreEdges

Create a right circular cone or cone frustum (conical frustum, truncated cone) in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Cone");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Cone") to create a cone. The following properties are available:

TABLE 3-51: VALID PROPERTY/VALUE PAIRS.

| PROPERTY     | VALUE                                                                                    | DEFAULT                                  | DESCRIPTION                                                                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ang          | double                                                                                   | arctan(1/2)<br>(about 26.565<br>degrees) | The cone's semiangle; that is, the angle between the<br>axis and a generator of the conical surface.                                                                                                             |
| axis         | double[]                                                                                 | {0,0,1}                                  | Direction of the axis. Vector has length 3 if<br>axistype is cartesian, and length 2 if axistype<br>is spherical.                                                                                                |
| axistype     | x   y   z   cartesian  <br>spherical                                                     | z                                        | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                         |
| color        | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                                     | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active. |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color            | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| h            | double                                                                                   | 1                                        | Height.                                                                                                                                                                                                          |
| layer        | double[]                                                                                 |                                          | Thicknesses of layers.                                                                                                                                                                                           |
| layertop     | on   off                                                                                 | off                                      | Apply layers on top.                                                                                                                                                                                             |
| layerbottom  | on   off                                                                                 | off                                      | Apply layers on bottom.                                                                                                                                                                                          |
| layerside    | on   off                                                                                 | on                                       | Apply layers on side.                                                                                                                                                                                            |
| pos          | double[]                                                                                 | {0,0,0}                                  | Center of the bottom circle.                                                                                                                                                                                     |
| r            | double                                                                                   | 1                                        | Radius of bottom circle.                                                                                                                                                                                         |
| rot          | double                                                                                   | 0                                        | Rotational angle about axis.                                                                                                                                                                                     |
| rtop         | double                                                                                   | 0.5                                      | Radius of top circle.                                                                                                                                                                                            |
| specifytop   | angle   radius                                                                           | angle                                    | If axistype is angle, the radius of the top circle is<br>given by the ang property. If axistype is radius,<br>the radius of the top circle is given by the rtop<br>property.                                     |
| type         | solid   surface                                                                          | solid                                    | Object type.                                                                                                                                                                                                     |
| sellayer     | on   off                                                                                 | off                                      | Create layer selections.                                                                                                                                                                                         |
| sellayershow | on   off                                                                                 | on                                       | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                           |
| selresult    | on   off                                                                                 | off                                      | Create selections of all resulting objects.                                                                                                                                                                      |

TABLE 3-51: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                      | DEFAULT | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|--------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off | dom     | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                     | none    | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-instance<br>feature            | this    | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature            | xyplane | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-52: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"cone3") creates a solid cone.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"cone2") creates a surface cone.

The following properties are also available:

TABLE 3-53: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |  |
|----------|----------|---------|--------------------------------------------|--|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |  |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |  |
| x, y, z  | double   | 0       | Alias for pos.                             |  |

The property const is no longer available.

