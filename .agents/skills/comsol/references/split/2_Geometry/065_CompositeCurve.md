# *CompositeCurve*

Form composite curves in 2D that has a sequence of child features of the following types: Polygon, CircularArc, InterpolationCurve, QuadraticBezier, and CubicBezier.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).feature().compositeCurves(<ftags>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).feature().
  removeCurveComponents(<childtags>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

String remaining = model.component(*<ctag>*).geom(*<tag>*).feature().compositeCurves(*<ftags>*) creates or extends a CompositeCurve or Polygon feature by joining the curve features tagged *<ftags>*. These input features must be of one of the following types: Polygon, CircularArc, InterpolationCurve, QuadraticBezier, CubicBezier, or CompositeCurve. The returned string is the tag of the created or remaining feature.

String[] remaining = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).feature(). removeCurveComponents(*<childtags>*) removes the children with the given tags from the geometry feature list of the CompositeCurve feature tagged *<ftag>*. This can result in the CompositeCurve feature being split into several features. The remaining children can be reordered. The return array contains the tags of the remaining or created features.

The following properties are available:

TABLE 3-46: VALID PROPERTIES FOR COMPOSITECURVE.

| PROPERTY     | VALUE                                                                                                   | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|--------------|---------------------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| contributeto | String                                                                                                  | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor  | RGB-triplet                                                                                             | Next available theme<br>color | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| selresult    | on   off                                                                                                | off                           | Create selections of all resulting objects.                                                                                                                                                                   |

TABLE 3-46: VALID PROPERTIES FOR COMPOSITECURVE.

| PROPERTY      | VALUE                                            | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|--------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off | dom     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from<br>a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| type          | solid  <br>curve                                 | curve   | Object type (in the case when the curve is closed).                                                                                                                                                                                        |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-47: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

#### **EXAMPLE**

Create a composite curve that includes two previously created circular arcs, "ca1" and "ca2".

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom", 2);
  g.create("ca1", "CircularArc");
  g.feature("ca1").set("angle1", 225);
  g.feature("ca1").set("angle2", 45);
  g.create("ca2", "CircularArc");
  g.feature("ca2").set("angle1", 225);
  g.feature("ca2").set("angle2", 180);
  g.feature().compositeCurves("ca1", "ca2");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom', 2);
  g.create('ca1', 'CircularArc');
  g.feature('ca1').set('angle1', 225);
  g.feature('ca1').set('angle2', 45);
  g.create('ca2', 'CircularArc');
  g.feature('ca2').set('angle1', 225);
  g.feature('ca2').set('angle2', 180);
  g.feature().compositeCurves(['ca1';'ca2']);
  g.run;
```

#### **SEE ALSO**

CircularArc, CubicBezier, InterpolationCurve, Polygon, QuadraticBezier

