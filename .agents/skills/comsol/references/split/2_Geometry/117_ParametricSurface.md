# *ParametricSurface*

Create a parametric surface defined by coordinate expressions in 3D.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ParametricSurface");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ParametericSurface") to create a parametric surface. Self-intersecting surfaces are not supported. The following properties are available:

TABLE 3-122: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the z-axis of the local coordinate<br>system. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is<br>spherical.                                                                              |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors in<br>the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| coord         | String[3]                                                                                | empty                         | Coordinates of parametric surface as function of<br>parameters.                                                                                                                                                                    |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| maxknots      | int                                                                                      | 10                            | Maximum number of knots in each parameter<br>coordinate.                                                                                                                                                                           |
| parname1      | String                                                                                   | s1                            | First parameter name.                                                                                                                                                                                                              |
| parname2      | String                                                                                   | s2                            | Second parameter name.                                                                                                                                                                                                             |
| parmax1       | double                                                                                   | 1                             | Maximum value of first parameter.                                                                                                                                                                                                  |
| parmax2       | double                                                                                   | 1                             | Maximum value of second parameter.                                                                                                                                                                                                 |
| parmin1       | double                                                                                   | 0                             | Minimum value of first parameter.                                                                                                                                                                                                  |
| parmin2       | double                                                                                   | 0                             | Minimum value of second parameter.                                                                                                                                                                                                 |
| pos           | double[]                                                                                 | {0,0,0}                       | Position of the object.                                                                                                                                                                                                            |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| rtol          | double                                                                                   | 1e-6                          | Relative tolerance.                                                                                                                                                                                                                |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | bnd                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in<br>all features. |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from.                                                                                                                                                                              |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

The expressions in coord can contain functions defined in the model. If the definition of such a function is changed, the parametric surface is not automatically rebuilt. Use model.component(*<ctag>*).geom(*<tag>*). feature(*<ftag>*).importData() to rebuild the parametric surface after such a change.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-123: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **EXAMPLE**

The following commands create a parametric surface in 3D with the shape of a twisted rectangle:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("ps1","ParametricSurface");
  g.feature("ps1").set("parmin1","-1");
  g.feature("ps1").set("parmax2","pi");
  g.feature("ps1").set("coord",new String[]{"s1*cos(s2)","s1*sin(s2)","s2"});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('ps1','ParametricSurface');
  g.feature('ps1').set('parmin1','-1');
  g.feature('ps1').set('parmax2','pi');
  g.feature('ps1').set('coord',{'s1*cos(s2)','s1*sin(s2)','s2'});
  g.run;
```

## **SEE ALSO**

ParametricCurve

