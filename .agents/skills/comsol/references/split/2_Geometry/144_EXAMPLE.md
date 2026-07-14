# **EXAMPLE**

The following commands create a surface and solid sphere, where the position and radius are defined differently:

*Code for Use with Java*

```
Model model = ModelUtil.create("Model1");
model.component().create("comp1");
GeomSequence g = model.component("comp1").geom().create("geom1",3);
g.create("s2","Sphere");
g.feature("s2").set("type","surface");
g.feature("s2").set("pos","0 1 0");
g.create("s3","Sphere");
g.feature("s3").set("r",4);
```

```
g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('s2','Sphere');
  g.feature('s2').set('type','surface');
  g.feature('s2').set('pos','0 1 0');
  g.create('s3','Sphere');
  g.feature('s3').set('r',4);
  g.run;
SEE ALSO
Ellipsoid
Split
```

Split (explode) objects into domains, faces, edges, or vertices.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Split");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Split") to split geometry objects.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the objects to split. The default selection is empty.

TABLE 3-159: VALID PROPERTY/VALUE PAIRS FOR SPLIT.

| PROPERTY      | VALUE                                                                                                   | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                             |
|---------------|---------------------------------------------------------------------------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color         | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in<br>the current<br>theme | none                          | The color of the selection, either given as an integer indicating<br>a color in the color theme, or as a custom color in the<br>customcolor property. Coloring is only available when<br>selresult in active.                           |
| customcolor   | RGB-triplet                                                                                             | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| input         | Selection                                                                                               |                               | Objects to split.                                                                                                                                                                                                                       |
| keep          | on   off                                                                                                | off                           | Keep input objects.                                                                                                                                                                                                                     |
| propagatesel  | on   off                                                                                                | on                            | Propagate selections from input objects to resulting objects.                                                                                                                                                                           |
| selresult     | on   off                                                                                                | off                           | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow | all   obj  <br>dom   bnd  <br>edg   pnt  <br>off                                                        | dom                           | Show selections, if selresult is on, in physics, materials, and<br>so on; in part instances; or in 3D from a plane geometry. obj<br>is not available in a component's geometry. dom, bnd, and edg<br>are not available in all features. |
| contributeto  | String                                                                                                  | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                           |

- **•** A solid object is split into solids corresponding to its domains.
- **•** A surface object is split into surface objects corresponding to its faces.
- **•** A curve object is split into curve objects corresponding to its edges.
- **•** A point object is split into point objects corresponding to its vertices.
- **•** A general (mixed) object is split into solids (corresponding to the domains), surface objects (corresponding to faces not adjacent to a domain), curve objects (corresponding to edges not adjacent to a face or domain), and point objects (corresponding to vertices not adjacent to an edge, face, or domain).

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-160: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

Split union of a solid circle and a solid rectangle.

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("r1","Rectangle");
  g.create("c1","Circle");
```

g.create("u1","Union");

```
g.feature("u1").selection("input").set(new String[]{"r1","c1"});
  g.create("spl1","Split");
  g.feature("spl1").selection("input").set("u1");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.create('c1','Circle');
  g.create('u1','Union');
  g.feature('u1').selection('input').set({'r1','c1'});
  g.create('spl1','Split');
  g.feature('spl1').selection('input').set('u1');
  g.run;
```

## **SEE ALSO**

Compose, Union, Intersection, Difference, Delete

*Square*

Create a solid or curve square in 2D.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Square");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Square") to create a square. The following properties are available:

TABLE 3-161: VALID PROPERTY/VALUE PAIRS FOR SQUARE.

| PROPERTY    | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|-------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| base        | corner   center                                                                             | corner                        | Positions the object either centered about pos or with<br>the lower left corner in pos.                                                                                                                       |
| color       | none   custom  <br>integer between<br>1 and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active. |
| customcolor | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                         |
| layer       | double[]                                                                                    |                               | Thicknesses of layers.                                                                                                                                                                                        |
| layerleft   | on   off                                                                                    | off                           | Apply layers to the left.                                                                                                                                                                                     |
| layerright  | on   off                                                                                    | off                           | Apply layers to the right.                                                                                                                                                                                    |
| layertop    | on   off                                                                                    | off                           | Apply layers on top.                                                                                                                                                                                          |
| layerbottom | on   off                                                                                    | on                            | Apply layers on bottom.                                                                                                                                                                                       |
| pos         | double[]                                                                                    | {0,0}                         | Position of the object.                                                                                                                                                                                       |
| rot         | double                                                                                      | 0                             | Rotational angle about pos.                                                                                                                                                                                   |
| size        | double                                                                                      | 1                             | Side length.                                                                                                                                                                                                  |
| type        | solid   curve                                                                               | solid                         | Object type.                                                                                                                                                                                                  |

TABLE 3-161: VALID PROPERTY/VALUE PAIRS FOR SQUARE.

| PROPERTY      | VALUE                                | DEFAULT<br>DESCRIPTION |                                                                                                                                                                                                                                            |
|---------------|--------------------------------------|------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| sellayer      | on   off                             | off                    | Create layer selections.                                                                                                                                                                                                                   |
| sellayershow  | on   off                             | on                     | Show layer selections in physics/instances/3D (used if<br>sellayer is on)                                                                                                                                                                  |
| selresult     | on   off                             | off                    | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   dom  <br>bnd   pnt   off | dom                    | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from a<br>plane geometry. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| contributeto  | String                               | none                   | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see Square.

The following attributes are available:

TABLE 3-162: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"square2") creates a solid square. model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"square1") creates a curve square.

The following properties are also available:

TABLE 3-163: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION     |
|----------|--------|---------|-----------------|
| l        | double | 1       | Alias for size. |
| x, y     | double | 0       | Alias for pos.  |

The property const is no longer available.

