# *Polygon*

Create curve or solid polygon consisting of line segments in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Polygon");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Polygon") to create a polygon or a line segment. The following properties are available

TABLE 3-136: VALID PROPERTY/VALUE PAIRS FOR POLYGON.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| filename      | String                                                                                   |                               | If source is file, the file that contains the<br>vertex coordinates.                                                                                                                                                                       |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom in 2D; edg in<br>3D       | Show selections, if selresult is on, in<br>physics, materials, and so on; in part instances;<br>or in 3D from a plane geometry. obj is not<br>available in a component's geometry. dom, bnd,<br>and edg are not available in all features. |
| source        | table   file   vectors                                                                   | vectors                       | Whether vertex coordinates are specified as<br>vectors, a table, or read from a file.                                                                                                                                                      |
| table         | double[][]                                                                               |                               | The vertex coordinates when source is<br>table, size N*sdim.                                                                                                                                                                               |
| type          | solid   open   closed                                                                    | solid (2D)<br>open (3D)       | Object type. solid is not available in 3D.                                                                                                                                                                                                 |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from (in 3D only).                                                                                                                                                                         |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is<br>the global Cartesian coordinate system.                                                                                                 |
| x             | double[]                                                                                 | {}                            | x-coordinates for vertices.                                                                                                                                                                                                                |
| y             | double[]                                                                                 | {}                            | y-coordinates for vertices.                                                                                                                                                                                                                |
| z             | double[]                                                                                 | {}                            | z-coordinates for vertices.                                                                                                                                                                                                                |

If type is open or closed, a curve consisting of line segments is constructed. If type is solid, the solid enclosed by such a closed polygon is constructed. If type is closed or solid, but the first and last control points are different, an extra segment is added to close the curve.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importToTable() to read data from the file defined by the filename property and store the data in the table property. The source property is also changed to table.

If source is file, the polygon is not automatically rebuilt when the data in the file changes. Use model. component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData() to rebuild the polygon after such a change.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Polygon.

The following attributes are available:

TABLE 3-137: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **COMPATIBILITY**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"line1") constructs an open polygon.
model.component(<ctag>).geom(<tag>).create(<ftag>,"poly1") constructs a closed polygon.
model.component(<ctag>).geom(<tag>).create(<ftag>,"line2") or model.component(<ctag>).
geom(<tag>).create(<ftag>,"poly2") constructs a solid polygon.
```

## **EXAMPLE**

Construct a solid triangle pol1:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("pol1","Polygon");
  g.feature("pol1").set("x","0,0,2").set("y","1,0,0");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('pol1','Polygon');
  g.feature('pol1').set('x','0,0,2').set('y','1,0,0');
  g.run;
```

## **SEE ALSO**

CubicBezier, QuadraticBezier

