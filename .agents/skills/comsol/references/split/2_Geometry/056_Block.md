# *Block*

Create a right-angled solid or surface block in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Block");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Block") to create a block. The following properties are available:

TABLE 3-31: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                       | DEFAULT                             | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis          | double[]                                                                                    | {0,0,1}                             | Direction of the edge on the local z-axis. Vector has<br>length 3 if axistype is cartesian, and length 2 if<br>axistype is spherical.                                                                                              |
| axistype      | x   y   z  <br>cartesian  <br>spherical                                                     | z                                   | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| base          | corner   center                                                                             | corner                              | Positions the object either centered about pos or with<br>one corner in pos.                                                                                                                                                       |
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none                                | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                      |
| customcolor   | RGB-triplet                                                                                 | Next<br>available<br>theme<br>color | The color to use. Active when color is set to custom.                                                                                                                                                                              |
| layer         | double[]                                                                                    |                                     | Thicknesses of layers.                                                                                                                                                                                                             |
| layertop      | on   off                                                                                    | off                                 | Apply layers on top.                                                                                                                                                                                                               |
| layerbottom   | on   off                                                                                    | on                                  | Apply layers on bottom.                                                                                                                                                                                                            |
| layerleft     | on   off                                                                                    | off                                 | Apply layers to the left.                                                                                                                                                                                                          |
| layerright    | on   off                                                                                    | off                                 | Apply layers to the right.                                                                                                                                                                                                         |
| layerfront    | on   off                                                                                    | off                                 | Apply layers on front.                                                                                                                                                                                                             |
| layerback     | on   off                                                                                    | off                                 | Apply layers on back.                                                                                                                                                                                                              |
| size          | double[]                                                                                    | {1,1,1}                             | Edge lengths.                                                                                                                                                                                                                      |
| pos           | double[]                                                                                    | {0,0,0}                             | Position of the object.                                                                                                                                                                                                            |
| rot           | double                                                                                      | 0                                   | Rotational angle about axis.                                                                                                                                                                                                       |
| type          | solid   surface                                                                             | solid                               | Object type.                                                                                                                                                                                                                       |
| sellayer      | on   off                                                                                    | off                                 | Create layer selections.                                                                                                                                                                                                           |
| sellayershow  | on   off                                                                                    | on                                  | Show layer selections in physics/instances (used if<br>sellayer is on)                                                                                                                                                             |
| selresult     | on   off                                                                                    | off                                 | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom  <br>bnd   edg   pnt  <br>off                                               | dom                                 | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                                                                                      | none                                | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |

TABLE 3-31: VALID PROPERTY/VALUE PAIRS.

| PROPERTY     | VALUE                           | DEFAULT | DESCRIPTION                                                                                                                   |
|--------------|---------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------|
| workplanesrc | this   part-instance<br>feature | this    | Part-instance feature to take the work plane from.                                                                            |
| workplane    | xyplane  <br>work-plane feature | xyplane | Work-plane feature that defines the coordinate system.<br>The default, xyplane, is the global Cartesian<br>coordinate system. |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-32: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"block2") constructs a solid block.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"block3") constructs a surface block.

The following properties are also available:

TABLE 3-33: VALID PROPERTY/VALUE PAIRS.

| PROPERTY   | VALUE    | DEFAULT | DESCRIPTION                                |
|------------|----------|---------|--------------------------------------------|
| ax2        | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3        | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| lx, ly, lz | double   | 1       | Alias for size.                            |
| x, y, z    | double   | 0       | Alias for pos.                             |

The property const is no longer available.

## **EXAMPLE**

The following commands create a solid and surface block, where the position is defined in the two alternative ways.

*Code for Use with Java*

```
Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("b1","Block");
  g.feature("b1").set("size","1 2.1 0.5");
  g.feature("b1").set("base","center");
  g.feature("b1").set("pos","1 0 1");
  g.feature("b1").set("axis","1 0 0");
  g.feature("b1").set("rot",30);
  double[] a = g.feature("b1").getDoubleArray("pos");
  g.create("b2","Block");
  g.feature("b2").set("type","surface");
  g.feature("b2").set("size","1 2.1 0.5");
  g.feature("b2").set("pos",a);
  String b = g.feature("b2").getString("pos");
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('b1','Block');
  g.feature('b1').set('size','1 2.1 0.5');
```

```
g.feature('b1').set('base','center');
g.feature('b1').set('pos','1 0 1');
g.feature('b1').set('axis','1 0 0');
g.feature('b1').set('rot',30);
a = g.feature('b1').getDoubleArray('pos');
g.create('b2','Block');
g.feature('b2').set('type','surface');
g.feature('b2').set('size','1 2.1 0.5');
g.feature('b2').set('pos',a);
b = g.feature('b2').getString('pos');
```

## **SEE ALSO**

Hexahedron

