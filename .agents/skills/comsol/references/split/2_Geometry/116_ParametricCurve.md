# *ParametricCurve*

Create a parametric curve defined by coordinate expressions in 2D or 3D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ParametricCurve");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ParametericCurve") to create a parametric curve. Self-intersecting curves are not supported, except the case of a closed curve (that is, when the starting point and endpoint coincide). The following properties are available:

TABLE 3-120: VALID PROPERTY/VALUE PAIRS.

| PROPERTY       | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|----------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis           | double[]                                                                                 | {0,0,1}                       | Direction of the z-axis of the local coordinate<br>system. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical.                                                                                      |
| axistype       | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                                   |
| color          | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| coord          | String[2]   String[3]                                                                    | empty                         | Coordinates of parametric curve as function of<br>parameter.                                                                                                                                                                               |
| customcolor    | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| maxknots       | int                                                                                      | 1000                          | Maximum number of knots.                                                                                                                                                                                                                   |
| parname        | String                                                                                   | s                             | Parameter name.                                                                                                                                                                                                                            |
| parmax         | double                                                                                   | 1                             | Maximum parameter value.                                                                                                                                                                                                                   |
| parmin         | double                                                                                   | 0                             | Minimum parameter value.                                                                                                                                                                                                                   |
| pos            | double[]                                                                                 | {0,0,0}                       | Position of the object.                                                                                                                                                                                                                    |
| reparameterize | true   false                                                                             | false                         | Reparameterize the curve using the arc length.                                                                                                                                                                                             |
| rot            | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                               |
| rtol           | double                                                                                   | 1e-6                          | Relative tolerance.                                                                                                                                                                                                                        |
| selresult      | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow  | all   obj   dom   bnd  <br>edg   pnt   off                                               | bnd in 2D; edg<br>in 3D       | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| contributeto   | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| workplanesrc   | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from (in 3D only).                                                                                                                                                                         |
| workplane      | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system (in 3D only). The default, xyplane, is<br>the global Cartesian coordinate system.                                                                                                 |

The expressions in coord can contain functions defined in the model. If the definition of such a function is changed, the parametric curve is not automatically rebuilt. Use model.component(*<ctag>*).geom(*<tag>*). feature(*<ftag>*).importData() to rebuild the parametric curve after such a change.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-121: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **EXAMPLE**

The following commands create a parametric curve in 3D with the shape of a helix:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("pc1","ParametricCurve");
  g.feature("pc1").set("parmax","2*pi");
  g.feature("pc1").set("coord",new String[]{"cos(s)","sin(s)","s*0.2"});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('pc1','ParametricCurve');
  g.feature('pc1').set('parmax','2*pi');
  g.feature('pc1').set('coord',{'cos(s)','sin(s)','s*0.2'});
  g.run;
```

#### **SEE ALSO**

BezierPolygon, ParametricSurface

