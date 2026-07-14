# **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Refine") to refine the mesh. Mesh refinement is available both for generated and imported meshes.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the domain selection. The default selection is the entire geometry, meaning that all elements in the mesh are refined.

The following properties are available:

TABLE 4-31: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE                | DEFAULT   | DESCRIPTION                                                                                                                  |
|-----------|----------------------|-----------|------------------------------------------------------------------------------------------------------------------------------|
| rmethod   | longest  <br>regular | see below | Refinement method.                                                                                                           |
| numrefine | int or int[]         | 1         | Number of refinements.                                                                                                       |
| facerep   | curved   linear      | curved    | Specify face representation when placing moved or<br>new mesh vertices for meshes that define their own<br>geometric models. |

TABLE 4-31: AVAILABLE PROPERTIES.

| PROPERTY                              | VALUE    | DEFAULT | DESCRIPTION                                                               |
|---------------------------------------|----------|---------|---------------------------------------------------------------------------|
| boxcoord                              | on   off | off     | Use coordinates of a bounding box to determine the<br>elements to refine. |
| xmax, xmin, ymax, ymin,<br>zmax, zmin | double   |         | Coordinates of bounding box.                                              |

The default refinement method in 2D is regular refinement, where all edges of the element are bisected. Longest edge refinement, where the longest edge of each specified element is bisected, can be selected by giving longest as rmethod. Using regular as rmethod results in regular refinement. Some elements outside of the specified set can also be refined due to propagation.

In 3D, the default refinement method is longest. If the mesh contains nonsimplex elements, consider using regular refinement instead because this method preserves the structure of the mesh.

In 1D, regular refinement, where each element is divided into two elements of the same shape, is always used.

By default, all elements are refined once. The numrefine property specifies how many times the elements is refined.

The facerep property is only used for meshes that define their own geometric model. For example, when having an imported mesh. Use curved to place new or moved mesh vertices on a curved surface approximation of the input mesh. Use linear to place new or moved mesh vertices on the input mesh.

Use the boxcoord property to refine elements inside a bounding box. To define the bounding box, set the properties xmin, xmax, ymin, ymax, zmax, and zmin on the feature, where (xmin,ymin,zmin) defines the lower-left corner, and (xmax,ymax,zmax) defines the upper-right corner of the bounding box. The elements that have all its corner points in the bounding box are refined once. boxcoord is automatically set to on if one of the coordinates are set.

### **EXAMPLE**

Mesh two squares with an unstructured mesh. Refine the mesh on sq2 once and refine the elements inside a box in sq1 twice.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("sq1", "Square");
  g.create("sq2", "Square");
  g.feature("sq2").setIndex("pos", "1", 0);
  g.run();
  m.create("ftri1", "FreeTri");
  m.create("ref1", "Refine");
  m.feature("ref1").selection().geom("geom1", 2).set(new int[]{2});
  m.create("ref2", "Refine");
  m.feature("ref2").set("xmin", "0.2");
  m.feature("ref2").set("xmax", "0.8");
  m.feature("ref2").set("ymin", "0.2");
  m.feature("ref2").set("ymax", "0.6");
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component().create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
```

```
g.create('sq1', 'Square');
g.create('sq2', 'Square');
g.feature('sq2').setIndex('pos', '1', 0);
g.run;
m.create('ftri1', 'FreeTri');
m.create('ref1', 'Refine');
m.feature('ref1').selection().geom('geom1', 2).set(2);
m.create('ref2', 'Refine');
m.feature('ref2').set('xmin', '0.2');
m.feature('ref2').set('xmax', '0.8');
m.feature('ref2').set('ymin', '0.2');
m.feature('ref2').set('ymax', '0.6');
m.run();
```

Adapt, Convert

## *RemeshDomains*

Remesh domain in 2D meshes that define their own geometric model, such as imported meshes.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"RemeshDomains");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,ftype);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"RemeshDomains") remesh a selection of domains in 2D meshes that define their own geometric model. For more information, see Geometric Model.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the faces to remesh. The default selection is empty.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add attribute features. Supported attributes are listed under the See Also section.

To remesh domains in a 3D mesh, use RemeshFaces to remesh the boundaries and then FreeTet to fill the domains with a tetrahedral mesh.

#### **SEE ALSO**

CornerRefinement, Distribution, FixedMesh, IdenticalMesh, Size, RemeshEdges

## *RemeshEdges*

Remesh edges in 2D and 3D meshes that define their own geometric model, such as imported meshes.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"RemeshEdges");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,ftype);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"RemeshEdges") remesh a selection of edges in 2D or 3D meshes that define their own geometric model. For more information, see Geometric Model.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the faces to remesh. The default selection is empty.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,*ftype*) to add attribute features. Supported attributes are listed under the See Also section.

The following properties are available:

TABLE 4-32: AVAILABLE PROPERTIES FOR REMESHFACES.

| PROPERTY          | VALUE    | DEFAULT | DESCRIPTION                                                                              |
|-------------------|----------|---------|------------------------------------------------------------------------------------------|
| preservefaceshape | on   off | on      | Specifies if to use the shape of the adjacent faces to<br>improve the shape of the edge. |

#### **SEE ALSO**

CornerRefinement, Distribution, IdenticalMesh, Size, RemeshFaces, Import

