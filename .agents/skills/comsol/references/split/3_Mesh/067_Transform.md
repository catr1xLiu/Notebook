# *Transform*

Transform an imported mesh by specifying a displacement, rotation angle, or scaling factor by adding an attribute to Import.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"Transform");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>)
  .set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"Transform") to position, rotate, or scale an imported mesh.

The following properties are available:

TABLE 4-41: FEATURE PROPERTIES DEFINED.

| PROPERTY    | VALUE                                      | DEFAULT   | DESCRIPTION                                          |
|-------------|--------------------------------------------|-----------|------------------------------------------------------|
| displ       | double[sdim]                               | (0,0,0)   | Specify a displacement offset.                       |
| base        | origin   corner   center  <br>bottom   top | origin    | Base point position in source mesh.                  |
| anchor      | origin   vertex                            |           | Anchor point position to match.                      |
| vertex      | Selection                                  |           | Select anchor point, if anchor is<br>vertex          |
| axistype    | x   y   z   cartesian  <br>spherical       | z         | Axis type, 3D only.                                  |
| ax3         | double[3]                                  | (0,0,1)   | Specify cartesian axis. If axistype is<br>cartesian. |
| ax2         | double[2]                                  | (0,0)     | Specify theta and phi. If axistype is<br>spherical.  |
| rot         | double                                     | 0         | Rotation angle.                                      |
| scaletype   | isotropic   anisotropic                    | isotropic | Type of scaling.                                     |
| isotropic   | double                                     | 1         | Scaling factor                                       |
| anisotropic | double[sdim]                               | (1,1,1)   | Specify x, y, and z (if 3D) scaling<br>factors       |

Anchor is only valid for the import operations succeeding the first import operation in a meshing sequence.

The displacement offset is applied after the positions have been matched.

![](_page_95_Picture_1.jpeg)

The positioning of imported mesh objects is supported for static positioning only. To parameterize the geometry and move objects around in a parametric sweep, use the option of Creating Geometry from Mesh to apply the parameterization in the geometry sequence.

The mesh is translated so that the specified position in source is moved to the position to match. After that, any specified rotation or scaling is applied, and, lastly, if an offset is specified, it is added to the translation.

A scaling factor less than 1 gives reduces the size of the geometry; a scale greater than 1 increases the geometry. Enter a negative scale to mirror the mesh. The scale is applied prior to any translation or rotation; the center used is the point specified using the base property.

#### **SEE ALSO**

Import

## *TwoPointMap*

Specify a two-point map for the copy operations and the IdenticalMesh feature to control the orientation of the source mesh on the destination.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"TwoPointMap")
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection(property)
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"TwoPointMap") to define a two-point map for the CopyFace or CopyDomain feature *<ftag>*.

The following properties are available:

TABLE 4-42: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE     | DESCRIPTION                              |
|-----------|-----------|------------------------------------------|
| srcpoint1 | Selection | First point on source face/domain.       |
| srcpoint2 | Selection | Second point on source face/domain.      |
| dstpoint1 | Selection | First point on destination face/domain.  |
| dstpoint2 | Selection | Second point on destination face/domain. |

Use the TwoPointMap feature if you need to control how the source and destination faces/domains are matched in a copy mesh operation and in an IdenticalMesh feature. When this feature is present, the source mesh is transformed so that srcpoint1 is mapped to dstpoint1 and srcpoint2 is mapped to dstpoint2.

## **EXAMPLE**

Create a block and mesh face 2. Copy this mesh onto the opposite face 5 and ensure that point 6 is mapped to point 4 and point 5 is mapped to Point 8.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g= model.component("comp1").geom().create("geom1", 3);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("blk1", "Block");
  g.run();
```

```
m.create("ftri1", "FreeTri");
  m.feature("ftri1").selection().set(new int[]{2});
  m.feature("ftri1").create("size1", "Size");
  m.feature("ftri1").feature("size1").selection().geom("geom1", 1).set(new int[]{9});
  m.feature("ftri1").feature("size1").set("hmax", "0.01");
  m.create("cpf1", "CopyFace");
  m.feature("cpf1").selection("source").geom("geom1", 2).set(new int[]{2});
  m.feature("cpf1").selection("destination").geom("geom1", 2).set(new int[]{5});
  m.feature("cpf1").create("ppm1", "TwoPointMap");
  m.feature("cpf1").feature("ppm1").selection("srcpoint1").set(new int[]{6});
  m.feature("cpf1").feature("ppm1").selection("dstpoint1").set(new int[]{4});
  m.feature("cpf1").feature("ppm1").selection("srcpoint2").set(new int[]{5});
  m.feature("cpf1").feature("ppm1").selection("dstpoint2").set(new int[]{8});
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('blk1', 'Block');
  g.run;
  m.create('ftri1', 'FreeTri');
  m.feature('ftri1').selection().set(2);
  m.feature('ftri1').create('size1', 'Size');
  m.feature('ftri1').feature('size1').selection().geom('geom1', 1).set(9);
  m.feature('ftri1').feature('size1').set('hmax', '0.01');
  m.create('cpf1', 'CopyFace');
  m.feature('cpf1').selection('source').geom('geom1', 2).set(2);
  m.feature('cpf1').selection('destination').geom('geom1', 2).set(5);
  m.feature('cpf1').create('ppm1', 'TwoPointMap');
  m.feature('cpf1').feature('ppm1').selection('srcpoint1').set(6);
  m.feature('cpf1').feature('ppm1').selection('dstpoint1').set(4);
  m.feature('cpf1').feature('ppm1').selection('srcpoint2').set(5);
  m.feature('cpf1').feature('ppm1').selection('dstpoint2').set(8);
  m.run;
```

Copy, CopyFace, CopyDomain, EdgeMap, OnePointMap, IdenticalMesh

## *Union*

Unite imported 3D surface meshes with each other. The operation will partition geometric entities and intersect mesh elements where the meshes intersect.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Union");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Union") to unite meshed entities in 3D. Supported input: entire geometry, unmeshed domains, boundaries adjacent to unmeshed domains, isolated boundaries, isolated edges, and isolated points.

![](_page_97_Picture_2.jpeg)

Use feature.selection() when dimension is 1, 2, or 3. Use feature(*<ftag>*).selection(*property*) when dimension is mixed.

Use DeleteEntities to delete domain elements while keeping the unmeshed domains. If a subset of the faces are selected for the operation, it might not be possible to update any existing domain information. Use CreateDomains to recreate the domains, if needed, FreeTri to remesh faces, and then FreeTet to generate a tetrahedral mesh in the domains.

The following properties are available:

TABLE 4-43: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE                      | DEFAULT | DESCRIPTION                                                                                                                    |
|-----------|----------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------|
| abstol    | double                     |         | Absolute point snapping tolerance, if toltype is<br>absolute.                                                                  |
| cleanup   | on   off                   | on      | Cleanup of the mesh before and after uniting the<br>selected entities, for example by collapsing small and<br>sliver elements. |
| dimension | 1   2   3   all   mixed    | all     | Specifies the entity dimension to be united. Default is<br>entire geometry.                                                    |
| domain    |                            |         | Specifies the domain selection if dimension is mixed.                                                                          |
| edge      |                            |         | Specifies the edge selection if dimension is mixed.                                                                            |
| face      |                            |         | Specifies the face selection if dimension is mixed.                                                                            |
| placement | linear   curved            | curved  | Specifies the placement of mesh vertices in the<br>intersection between united entities.                                       |
| reltol    | double                     | 0.001   | Relative point snapping tolerance, if toltype is<br>relative.                                                                  |
| toltype   | auto   relative   absolute | auto    | How the snapping tolerance is specified.                                                                                       |
| vertex    |                            |         | Specifies the vertex selection if dimension is mixed.                                                                          |

#### **SEE ALSO**

CreateDomains, DeleteEntities, FreeTri, FreeTet, IntersectLine, IntersectPlane, Import

## *Vertex*

Create a vertex mesh.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Vertex");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
```

