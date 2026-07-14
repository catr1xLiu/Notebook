# *EdgeMap*

Specify an edge map for the copy operations and the IdenticalMesh feature to control the orientation of the source mesh on the destination.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag1>,"EdgeMap");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).
      set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"EdgeMap") to define an edge mapping for CopyFace or CopyDomain feature *<ftag>*.

The following properties are available:

TABLE 4-49: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE                  | DEFAULT | DESCRIPTION                                |
|-----------|------------------------|---------|--------------------------------------------|
| direction | auto   same   opposite | auto    | The direction of dstedge relative srcedge. |
| dstedge   | Selection              |         | Edge on destination face/domain.           |
| srcedge   | Selection              |         | Edge on source face/domain.                |

Use the EdgeMap feature if you need to control how the source and destination faces/domains are matched in a copy mesh operation and in an IdenticalMesh feature. When this feature is present, the source mesh is transformed so that srcedge is mapped onto dstedge. The relative orientation of the edges is specified by the direction property.

#### **EXAMPLE**

Create a block and then mesh Face 1 with a fine mesh on Edge 1. Copy this mesh to face 6 and ensure that the fine mesh of Edge 1 ends up on Edge 12.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  MeshSequence m= model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("blk1", "Block");
  g.run();
  m.create("ftri1", "FreeTri");
  m.feature("ftri1").selection().set(new int[]{1});
  m.feature("ftri1").create("size1", "Size");
  m.feature("ftri1").feature("size1").selection().geom("geom1", 1).set(new int[]{1});
  m.feature("ftri1").feature("size1").set("hmax", "0.01");
  m.create("cpf1", "CopyFace");
  m.feature("cpf1").selection("source").set(new int[]{1});
  m.feature("cpf1").selection("destination").set(new int[]{6});
  m.feature("cpf1").create("em1", "EdgeMap");
  m.feature("cpf1").feature("em1").selection("dstedge").set(new int[]{1});
  m.feature("cpf1").feature("em1").selection("dstedge").set(new int[]{12});
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('blk1', 'Block');
  g.run;
  m.create('ftri1', 'FreeTri');
  m.feature('ftri1').selection().set(1);
  m.feature('ftri1').create('size1', 'Size');
  m.feature('ftri1').feature('size1').selection().geom('geom1', 1).set(1);
  m.feature('ftri1').feature('size1').set('hmax', '0.01');
  m.create('cpf1', 'CopyFace');
  m.feature('cpf1').selection('source').set(1);
  m.feature('cpf1').selection('destination').set(6);
  m.feature('cpf1').create('em1', 'EdgeMap');
  m.feature('cpf1').feature('em1').selection('dstedge').set(1);
  m.feature('cpf1').feature('em1').selection('dstedge').set(12);
  m.run;
```

#### **SEE ALSO**

Copy, CopyFace, CopyDomain, OnePointMap, TwoPointMap, IdenticalMesh

## *ExplicitSelection*

To create a named selection for individual geometric entities on the geometric entity level chosen. Supported for meshes that define their own geometric model.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"ExplicitSelection");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Supported for meshes that define their own geometric model, such as imported meshes. For more information, see Geometric Model.

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"ExplicitSelection") to create a named selection for one or more entities.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the input entities for the selection.

The following properties are available:

TABLE 4-50: AVAILABLE PROPERTIES FOR EXPLICITSELECTION.

| PROPERTY     | VALUE                                                                                 | DEFAULT                       | DESCRIPTION                                                                                                                                              |
|--------------|---------------------------------------------------------------------------------------|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| angletol     | double                                                                                | 15                            | Angle tolerance for continuity evaluation.<br>Used when groupcontang is on.                                                                              |
| groupcontang | on   off                                                                              | off                           | Specify to group faces (in 3D) or edges by<br>continuous tangent.                                                                                        |
| color        | none   custom   integer<br>between 1 and the number of<br>colors in the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. |
| customcolor  | RGB-triplet                                                                           | Next available<br>theme color | The color to use. Active when color is set<br>to custom.                                                                                                 |
| selshow      | on   off                                                                              | on                            | Show selection in physics, materials, and so<br>on. For mesh parts, this option shows<br>selection outside the part.                                     |

For more information, see the section Selections.

## **SEE ALSO**

AdjacentSelection

