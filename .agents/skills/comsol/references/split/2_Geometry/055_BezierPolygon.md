# *BezierPolygon*

Create a curve or solid polygon consisting of Bézier segments in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"BezierPolygon");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"BezierPolygon") to create a Bézier polygon or a line segment. The following properties are available:

TABLE 3-29: VALID PROPERTY/VALUE PAIRS FOR BEZIERPOLYGON.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| degree        | int[]   int                                                                              | 1                             | Degree of Bézier segments.                                                                                                                                                                                                                 |
| p             | double[][]                                                                               |                               | Control points.                                                                                                                                                                                                                            |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom in 2D<br>edg in 3D.       | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| type          | solid   open   closed                                                                    | solid (2D)<br>open (3D)       | Object type. solid is not available in 3D.                                                                                                                                                                                                 |
| w             | double[]                                                                                 |                               | Weights.                                                                                                                                                                                                                                   |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from (in 3D only).                                                                                                                                                                         |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is<br>the global Cartesian coordinate system.                                                                                                 |

If type is open or closed, a curve consisting of line, quadratic, or cubic rational Bézier segments is constructed. If type is solid, the solid enclosed by such a closed polygon is constructed. If type is closed or solid, but the first and last control points are different, an extra linear segment is added to close the curve.

The degree of the nth segment is degree[n], and it must be 1 (linear), 2 (quadratic), or 3 (cubic). The nth segment has degree[n]+1 control points and weights. The weights are stored consecutively in the array w, which has length degree[0]+...+degree[N-1]+N, where N is the number of segments. The ith coordinates of the control points are stored consecutively in the array p[i]. Adjacent segments share the common control point, which means that p[i] has length degree[0]+...+degree[N-1]+1.

For a linear or cubic segment, the default weights are 1. For a quadratic segment, the default weights are 1, 1/ , 1. 2

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see BezierPolygon.

The following attributes are available:

TABLE 3-30: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

## **COMPATIBILITY**

From version 5.5, the BezierPolygon feature is deprecated. Instead of BezierPolygon, use the CircularArc, CompositeCurve, CubicBezier, InterpolationCurve, Polygon, or QuadraticBezier feature.

#### **EXAMPLE**

Construct a solid triangle b1 and an elliptic arc b2:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("b1","BezierPolygon");
  g.feature("b1").set("p", new double[][]{{0, 0, 2}, {1, 0 ,0}});
  g.create("b2","BezierPolygon");
  g.feature("b2").set("type","open");
  g.feature("b2").set("degree",2);
  g.feature("b2").set("p", new double[][]{{0, 1, 0}, {1, 2, 0}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('b1','BezierPolygon');
  g.feature('b1').set('p', [[0, 0, 2]; [1, 0 ,0]]);
  g.create('b2','BezierPolygon');
  g.feature('b2').set('type','open');
  g.feature('b2').set('degree',2);
  g.feature('b2').set('p', [[0, 1, 0]; [1, 2,0]]);
  g.run;
```

## **SEE ALSO**

CircularArc, CompositeDomains, CubicBezier, Polygon, QuadraticBezier

