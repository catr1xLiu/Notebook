# **EXAMPLE**

The following sequence edits a circle, setting the degree of one edge to one to create a straight edge:

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1", 2);
g.create("c1", "Circle");
g.run("c1");
g.create("edo1", "EditObject");
```

```
g.feature("edo1").selection("input").set(new String[]{"c1"});
  g.feature("edo1").set("edge", "1");
  g.feature("edo1").set("degree", "1");
  g.run("edo1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  g.create('c1', 'Circle');
  g.run('c1');
  g.create('edo1', 'EditObject');
  g.feature('edo1').selection('input').set({'c1'});
  g.feature('edo1').set('edge', '1');
  g.feature('edo1').set('degree', '1');
  g.run('edo1');
```

## **SEE ALSO**

BezierPolygon

*Ellipse*

Create a solid or curved ellipse in 2D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Ellipse");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Ellipse") to create an ellipse. The following properties are available:

TABLE 3-71: VALID PROPERTIES FOR ELLIPSE.

| PROPERTY     | VALUE                                                                                          | DEFAULT                             | DESCRIPTION                                                                                                                                                                                                   |
|--------------|------------------------------------------------------------------------------------------------|-------------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| base         | corner  <br>center                                                                             | center                              | Positions the object either centered about pos or with the<br>lower left corner of surrounding box in pos.                                                                                                    |
| color        | none   custom  <br>integer between<br>1 and the<br>number of colors<br>in the current<br>theme | none                                | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |
| contributeto | String                                                                                         | none                                | Tag of cumulative selection to contribute to.                                                                                                                                                                 |
| customcolor  | RGB-triplet                                                                                    | Next<br>available<br>theme<br>color | The color to use. Active when color is set to custom.                                                                                                                                                         |
| layer        | double[]                                                                                       |                                     | Thicknesses of layers.                                                                                                                                                                                        |
| pos          | double[]                                                                                       | {0,0}                               | Position of the object.                                                                                                                                                                                       |
| rot          | double                                                                                         | 0                                   | Rotational angle about pos.                                                                                                                                                                                   |
| sellayer     | on   off                                                                                       | off                                 | Create layer selections.                                                                                                                                                                                      |
| sellayershow | on   off                                                                                       | on                                  | Show layer selections in physics/instances/3D (used if<br>sellayer is on)                                                                                                                                     |

TABLE 3-71: VALID PROPERTIES FOR ELLIPSE.

| PROPERTY      | VALUE                                | DEFAULT | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|--------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selresult     | on   off                             | off     | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow | all   obj   dom  <br>bnd   pnt   off | dom     | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| semiaxes      | double[]                             | {1,1}   | Semiaxes.                                                                                                                                                                                                                               |
| type          | solid   curve                        | solid   | Object type.                                                                                                                                                                                                                            |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Ellipse.

The following attributes are available:

TABLE 3-72: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ellip2") is a solid ellipse.

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"ellip1") is an ellipse curve.

The following properties are also available:

TABLE 3-73: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION         |
|----------|--------|---------|---------------------|
| a, b     | double | 1       | Alias for semiaxes. |
| x, y     | double | 0       | Alias for pos.      |

The property const is no longer available.

## **EXAMPLE**

The following sequence creates a solid ellipse:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("e1","Ellipse");
  g.feature("e1").set("semiaxes","1 0.3");
  g.feature("e1").set("rot",45);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('e1','Ellipse');
  g.feature('e1').set('semiaxes','1 0.3');
  g.feature('e1').set('rot',45);
  g.run;
```

