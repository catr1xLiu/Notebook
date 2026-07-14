# *Import mphbin/mphtxt*

Import geometry objects from a file using COMSOL Multiphysics geometry formats: binary or text.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Import");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Import") to create a geometry import feature. When the property filename is set to a file recognized as an MPHBIN- or MPHTXT-file, the property type is set to native and the following properties are available:

TABLE 3-99: VALID PROPERTY/VALUE PAIRS.

| PROPERTY       | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|----------------|------------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| contributeto   | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor    | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                      |
| filename       | String                                                                                         |                               | Filename.                                                                                                                                                                                                     |
| includevirtual | boolean                                                                                        | true                          | Include virtual operations when importing the<br>geometry. Not available in 1D and in work planes,<br>where virtual operations are always excluded.                                                           |
| selresult      | on   off                                                                                       | off                           | Create selections of all resulting objects.                                                                                                                                                                   |

TABLE 3-99: VALID PROPERTY/VALUE PAIRS.

| PROPERTY          | VALUE                                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                |
|-------------------|-----------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresultshow     | all   obj   dom<br>  bnd   edg  <br>pnt   off | dom     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| selindividual     | on   off                                      | off     | Create selections of individual objects.                                                                                                                                                                                                   |
| selindividualshow | all   dom  <br>bnd   edg   pnt<br>  off       | dom     | Show selections, when selindividual is on, of<br>individual objects in physics, materials, and so on; in<br>part instances; or in 3D from a plane geometry.                                                                                |
| type              | native                                        |         | Type of import.                                                                                                                                                                                                                            |

The file specified by filename can be of any of the following formats:

TABLE 3-100: SUPPORTED FILE FORMATS.

| FILE FORMAT                | FILE EXTENSIONS |  |
|----------------------------|-----------------|--|
| COMSOL Multiphysics Binary | .mphbin         |  |
| COMSOL Multiphysics Text   | .mphtxt         |  |

The imported objects are represented using COMSOL's geometry kernel or the CAD Import Module's geometry kernel (Parasolid).

The method

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData()

imports the file again.

If selresult is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point), for use in the geometry sequence. To access the object selection, use model.geom(*<tag>*). selection(*<ftag>*), where *<tag>* is the geometry tag and *<ftag>* is the feature tag. To access the other selections, use model.geom(*<tag>*).selection(*<ftag>.<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D). If, in addition, selresultshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>\_<ftag>\_<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D).

If selindividual is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point) of each individual object, for use in the geometry sequence. To access the object selections, use model.geom(*<tag>*).selection(*<otag>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*. To access the other selections, use model.geom(*<tag>*).selection(*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. If, in addition, selindividualshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>*\_*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*.

The following attributes are available:

TABLE 3-101: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

Create a curve interpolating or approximating a sequence of points in 2D or 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"InterpolationCurve");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property)
model.component(<ctag>).geom(<tag>).feature(<ftag>).importToTable();
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

To create an interpolation curve use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,

"InterpolationCurve") The following properties are available:

TABLE 3-102: VALID PROPERTY/VALUE PAIRS FOR INTERPOLATIONCURVE.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active.                           |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| endcond       | none   zerocurv  <br>tangent                                                             | none                          | Condition at endpoint: none, a tangent<br>condition, or zero curvature                                                                                                                                                                     |
| endtang       | double[sdim]                                                                             | {1,0} or {1,0,<br>0}          | Tangent direction at endpoint (if endcond is<br>tangent).                                                                                                                                                                                  |
| filename      | String                                                                                   |                               | If source is file, the file that contains the data.                                                                                                                                                                                        |
| rtol          | double                                                                                   | 0                             | Maximum relative error. 0 implies<br>interpolation.                                                                                                                                                                                        |
| source        | table   file   vectors                                                                   | table                         | Whether data is specified as vectors, a table,<br>or read from a file.                                                                                                                                                                     |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom in 2D; edg in<br>3D       | Show selections, if selresult is on, in<br>physics, materials, and so on; in part instances;<br>or in 3D from a plane geometry. obj is not<br>available in a component's geometry. dom, bnd,<br>and edg are not available in all features. |
| startcond     | none   zerocurv  <br>tangent                                                             | none                          | Condition at starting point: none, a tangent<br>condition, or zero curvature.                                                                                                                                                              |
| starttang     | double[sdim]                                                                             | {1,0} or {1,0,<br>0}          | Tangent direction at starting point (if<br>startcond is tangent).                                                                                                                                                                          |
| struct        | sectionwise  <br>spreadsheet                                                             | spreadsheet                   | The data format if source is file.                                                                                                                                                                                                         |
| table         | double[][]                                                                               |                               | Data points, size N*sdim.                                                                                                                                                                                                                  |
| type          | open   closed   solid                                                                    | open                          | Type of curve.                                                                                                                                                                                                                             |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane<br>from (in 3D only).                                                                                                                                                                         |

TABLE 3-102: VALID PROPERTY/VALUE PAIRS FOR INTERPOLATIONCURVE.

| PROPERTY  | VALUE                           | DEFAULT | DESCRIPTION                                                                                                                                   |
|-----------|---------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------|
| workplane | xyplane   work-plane<br>feature | xyplane | Work-plane feature that defines the<br>coordinate system (in 3D only). The default,<br>xyplane, is the global Cartesian coordinate<br>system. |
| x         | double[]                        | {}      | x-coordinates for data points.                                                                                                                |
| y         | double[]                        | {}      | y-coordinates for data points.                                                                                                                |
| z         | double[]                        | {}      | z-coordinates for data points.                                                                                                                |

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importToTable() to read data from the file defined by the filename property and store the data in the table property. The source property is also changed to table.

When building the feature, if the start condition or end condition is zero curvature, the corresponding (currently inactive) tangent direction property should be set to the tangent vector of the resulting curve.

If source is file, the interpolation curve is not automatically rebuilt when the data in the file changes. Use model. component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData() to rebuild the interpolation curve after such a change.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see InterpolationCurve.

The following attributes are available:

TABLE 3-103: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT                                                | DESCRIPTION |
|--------------|----------|--------------------------------------------------------|-------------|
| construction | on   off | off<br>Designate the resulting objects as construction |             |
|              |          |                                                        | geometry.   |

#### **EXAMPLE**

The following commands create a curve interpolating four points in 2D:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  g.create("ic1","InterpolationCurve");
  g.feature("ic1").set("table",new double[][]{{0,0}, {1,0}, {1,1}, {0,1}});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  g.create('ic1','InterpolationCurve');
  g.feature('ic1').set('table',[[0,0]; [1,0]; [1,1]; [0,1]]);
  g.run;
```

## **SEE ALSO**

CubicBezier, QuadraticBezier

