# *Array*

Create a block-shaped (3D), rectangular (2D, 3D), or linear array of geometry objects.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Array");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Array") to create an array of geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to array. The default selection is empty.

The following properties are available:

TABLE 3-27: VALID PROPERTIES FOR ARRAY.

| NAME          | VALUE                                                                                                | DEFAULT                                                              | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|------------------------------------------------------------------------------------------------------|----------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current theme | none                                                                 | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property.                                                                                   |
| customcolor   | RGB-triplet                                                                                          | Next available<br>theme color                                        | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| input         | Selection                                                                                            |                                                                      | Objects to array.                                                                                                                                                                                                                       |
| displ         | double[sdim]                                                                                         | 1                                                                    | Displacements in axis directions.                                                                                                                                                                                                       |
| propagatesel  | on   off                                                                                             | on                                                                   | Propagate selections from input objects to moved objects.                                                                                                                                                                               |
| size          | int   int[sdim]                                                                                      | 1                                                                    | Array size.                                                                                                                                                                                                                             |
| selresult     | on   off                                                                                             | off                                                                  | Create selections of all resulting objects of this feature.                                                                                                                                                                             |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off                                                     | The highest<br>available entity<br>level except<br>obj; usually dom. | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |

If size is a scalar, a linear (oblique) array with size copies of the input objects is constructed. The displacement between two consecutive copies is given by the vector displ. The names of the output objects are ftag(i), where ftag is the tag of the feature, and i is a 1-based index. If there are more than one input object, the output objects are named ftag(i,in), where in is a 1-based index corresponding to the input objects.

2D: If size is an array of length 2, a rectangular array with size[0]-by-size[1] copies of the input object is constructed. The *x*- and *y*-displacements are displ[0] and displ[1], respectively. The names of the output objects are ftag(i1,i2), where ftag is the name of the feature, and i1 and i2 are 1-based indices. If there are more than one input object, the output objects are named ftag(i1,i2,in), where in is a 1-based index corresponding to the input objects.

3D: If size is an array of length 3, a three-dimensional (block shaped) array with size[0]-by-size[1]-by-size[2] copies of the input object is constructed. The *x*-, *y*-, and *z*-displacements are displ[0], displ[1], and displ[2], respectively. The names of the output objects are ftag(i1,i2,i3), where ftag is the name of the feature, and i1, i2, and i3 are 1-based indices. If there are more than one input object, the output objects are named ftag(i1,i2,i3,in), where in is a 1-based index corresponding to the input objects.

The input object is deleted and an identical object is constructed as a part of the array.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Array.

The following attributes are available:

TABLE 3-28: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

In COMSOL Multiphysics 5.2, the selresult property replaced the createselection property. createselection is still supported for backward compatibility.

model.geom(*<tag>*).create(*<ftag>*,"arrayr") constructs an Array feature

## **EXAMPLE**

The following sequence creates a block with four equally-sized holes:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("cyl1","Cylinder");
  g.create("arr1","Array");
  g.feature("arr1").selection("input").set("cyl1");
  g.feature("arr1").set("displ", "4 4 0");
  g.feature("arr1").set("size", "2 2 1");
  g.create("blk1","Block");
  g.feature("blk1").set("size", "10 14 5");
  g.feature("blk1").set("pos", "-3 -5 -4");
  g.create("dif1","Difference");
  g.feature("dif1").selection("input").set("blk1");
  g.feature("dif1").selection("input2").set("arr1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('cyl1','Cylinder');
```

```
g.create('arr1','Array');
g.feature('arr1').selection('input').set('cyl1');
g.feature('arr1').set('displ', '4 4 0');
g.feature('arr1').set('size', '2 2 1');
g.create('blk1','Block');
g.feature('blk1').set('size', '10 14 5');
g.feature('blk1').set('pos', '-3 -5 -4');
g.create('dif1','Difference');
g.feature('dif1').selection('input').set('blk1');
g.feature('dif1').selection('input2').set('arr1');
g.run;
```

## **SEE ALSO**

Move, Copy

*BallSelection, BoxSelection, CylinderSelection, Disk Selection*

Create selections of geometric entities or objects that (partly) lie inside a ball, box, cylinder, or disk.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"BallSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"BoxSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"CylinderSelection");
model.component(<ctag>).geom(<tag>).create(<ftag>,"DiskSelection");
model.component(<ctag>).geom(<tag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).getType(property);
```

## **DESCRIPTION**

The following general properties are available:

| PROPERTY     | VALUE                                                                                 | DEFAULT                       | DESCRIPTION                                                                                                                                              |
|--------------|---------------------------------------------------------------------------------------|-------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| angletol     | double                                                                                | 5                             | Angle tolerance for continuity evaluation.                                                                                                               |
| color        | none   custom   integer<br>between 1 and the number of<br>colors in the current theme | none                          | The color of the selection, either given as<br>an integer indicating a color in the color<br>theme, or as a custom color in the<br>customcolor property. |
| condition    | intersects   inside  <br>somevertex   allvertices                                     | intersects                    | Condition for inclusion of an entity.                                                                                                                    |
| customcolor  | RGB-triplet                                                                           | Next available<br>theme color | The color to use. Active when color is set<br>to custom.                                                                                                 |
| entitydim    | -1   0   1   2   3                                                                    | space dimension               | Dimension of entities to select1 means<br>Object.                                                                                                        |
| groupcontang | on   off                                                                              | off                           | Continuous tangent mode.                                                                                                                                 |
| input        | String[]                                                                              | {}                            | Tags of input selections, only used when<br>inputent is selections.                                                                                      |
| inputent     | all   selections                                                                      | all                           | Select among all entities or entities defined<br>by the input property.                                                                                  |
| selkeep      | on   off                                                                              | on                            | Keep the selection within the geometry<br>sequence.                                                                                                      |
| selshow      | on   off                                                                              | on                            | Show selection in physics, materials, and so<br>on; in part instances; or in 3D from a plane<br>geometry.                                                |
| contributeto | String                                                                                | none                          | Tag of cumulative selection to contribute to.                                                                                                            |

For BallSelection, you define the ball using the following properties (using the geometry sequence's length unit):

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION                        |
|----------|--------|---------|------------------------------------|
| posx     | double | 0       | Center of ball, first coordinate.  |
| posy     | double | 0       | Center of ball, second coordinate. |
| posz     | double | 0       | Center of ball, third coordinate.  |
| r        | double | 0       | Radius of ball.                    |

For BoxSelection, you define the box using the following properties (using the geometry sequence's length unit):

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION                  |
|----------|--------|---------|------------------------------|
| xmax     | double | inf     | Maximum x-coordinate of box. |
| xmin     | double | -inf    | Minimum x-coordinate of box. |
| ymax     | double | inf     | Maximum y-coordinate of box. |
| ymin     | double | -inf    | Minimum y-coordinate of box. |
| zmax     | double | inf     | Maximum z-coordinate of box. |
| zmin     | double | -inf    | Minimum z-coordinate of box. |

For CylinderSelection, you define the cylinder using the following properties (using the geometry sequence's length unit):

| PROPERTY | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                                               |
|----------|-----------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1   | double                                  | 0       | Start angle.                                                                                                                                              |
| angle2   | double                                  | 360     | End angle (default: 360 degrees; that is, a full cylinder).                                                                                               |
| axis     | double[]                                | {0,0,0} | Direction of cylinder axis. Vector has length 3 if axistype is<br>cartesian and length 2 is axistype is spherical. Not used<br>if axistype is x, y, or z. |
| axistype | x   y   z  <br>cartesian  <br>spherical | z       | Type of axis or coordinate system used for axis. The value is<br>synchronized with axis.                                                                  |
| bottom   | double                                  | -inf    | Coordinate of bottom face in local coordinate system.                                                                                                     |
| pos      | double[]                                | {0,0,0} | Base point.                                                                                                                                               |
| r        | double<br>(nonnegative)                 | 0       | Outer radius.                                                                                                                                             |
| rin      | double<br>(nonnegative)                 | 0       | Inner radius.                                                                                                                                             |
| top      | double                                  | inf     | Coordinate of top face in local coordinate system.                                                                                                        |

For DiskSelection, you define the disk using the following properties (using the geometry sequence's length unit):

| PROPERTY | VALUE                   | DEFAULT | DESCRIPTION                                             |
|----------|-------------------------|---------|---------------------------------------------------------|
| angle1   | double                  | 0       | Start angle.                                            |
| angle2   | double                  | 360     | End angle (default: 360 degrees; that is, a full disk). |
| posx     | double                  | 0       | Center of disk, first coordinate.                       |
| posy     | double                  | 0       | Center of disk, second coordinate.                      |
| r        | double<br>(nonnegative) | 0       | Outer radius.                                           |
| rin      | double<br>(nonnegative) | 0       | Inner radius.                                           |

You select the input entities or objects to select among using the properties entitydim, inputent, and input. For a boundary or edge selection in 2D or 3D, you can force the selection to select whole groups of entities by setting the property groupcontang to on. Each group consists of adjacent entities that meet at an angle less than angletol.

The output entities/objects are determined by the property condition:

- **•** intersects: All entities/objects that intersect the ball/box/cylinder are included.
- **•** inside: All entities/objects that are completely inside the ball/box/cylinder are included.
- **•** somevertex: All entities/objects that have at least one adjacent vertex inside the ball/box/cylinder are included.
- **•** allvertices: All entities/objects that have all adjacent vertices inside the ball/box/cylinder are included.

For intersects and inside, the rendering mesh is used for the calculation. You can set the resolution of the rendering mesh using

```
ModelUtil.setPreference("graphics.rendering.detail",<detail>);
where <detail> is coarse, normal, fine, or wireframe.
```

See Selections of Geometric Entities for general information about selections.

#### **EXAMPLE**

In a 10-by-10 array of squares, delete the squares that lie in the box *x*>9.5, *y*>9.5.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  g.create("sq1", "Square");
  g.create("arr1", "Array");
  g.feature("arr1").selection("input").set("sq1");
  g.feature("arr1").set("fullsize", new int[]{10,10});
  g.feature("arr1").set("displ", new double[]{2,2});
  g.run("arr1");
  g.create("boxsel1","BoxSelection");
  g.feature("boxsel1").set("entitydim", -1);
  g.feature("boxsel1").set("xmin", 9.5);
  g.feature("boxsel1").set("ymin", 9.5);
  g.create("del1", "Delete");
  g.feature("del1").selection("input").init();
  g.feature("del1").selection("input").named("boxsel1");
  g.run("del1");
  // g.objectNames().length = 75
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  g.create('sq1', 'Square');
  g.create('arr1', 'Array');
  g.feature('arr1').selection('input').set('sq1');
  g.feature('arr1').set('fullsize', [10,10]);
  g.feature('arr1').set('displ', [2,2]);
  g.run('arr1');
  g.create('boxsel1','BoxSelection');
  g.feature('boxsel1').set('entitydim', -1);
  g.feature('boxsel1').set('xmin', 9.5);
  g.feature('boxsel1').set('ymin', 9.5);
  g.create('del1', 'Delete');
  g.feature('del1').selection('input').init;
  g.feature('del1').selection('input').named('boxsel1');
```

```
g.run('del1');
% length(g.objectNames)= 75
```

#### **SEE ALSO**

AdjacentSelection, ExplicitSelection, UnionSelection, IntersectionSelection, DifferenceSelection, ComplementSelection

