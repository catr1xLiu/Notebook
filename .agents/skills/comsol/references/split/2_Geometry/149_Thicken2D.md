# *Thicken2D*

Thicken the edges of 2D curve or solid objects in the normal direction to convert them into solid objects.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Thicken2D");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Thicken2D") to create a thicken feature tagged *<ftag>* in the 2D geometry sequence with the tag *<tag>*.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the entities to thicken. To set the selection level for the selection object, and to select the input entities see Geometry Object Selection Methods. For example, use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*). selection("input").init(1) to set the selection to be a selection of boundaries (geometric entities of dimension 1) for the thicken feature with the tag *<ftag>* in the 2D geometry sequence with the tag *<tag>*.

The following properties are available:

TABLE 3-174: VALID PROPERTY/VALUE PAIRS FOR THICKEN2D.

| PROPERTY      | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |
|---------------|---------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| input         | Selection                                                                                   |                               | Objects or boundaries to thicken.                                                                                                                                                                             |
| keep          | on   off                                                                                    | off                           | Keep input objects.                                                                                                                                                                                           |
| offset        | symmetric  <br>asymmetric                                                                   | symmetric                     | Type of thicken.                                                                                                                                                                                              |
| totalthick    | double                                                                                      | 0                             | Total thickness. Used if offset is symmetric.                                                                                                                                                                 |
| downthick     | double                                                                                      | 0                             | Upside thickness. Used if offset is asymmetric.                                                                                                                                                               |
| upthick       | double                                                                                      | 0                             | Downside thickness. Used if offset is asymmetric.                                                                                                                                                             |
| ends          | straight  <br>circular                                                                      | straight                      | Determines if the edges at the ends of the thickened<br>object are straight or circular. Used if offset is symmetric.                                                                                         |
| convexcorner  | fillet   tangent<br>  extend  <br>noconnection                                              | fillet                        | Handling of offset edges in convex corners.                                                                                                                                                                   |
| propagatesel  | on   off                                                                                    | on                            | Propagate selections from input objects to resulting<br>objects.                                                                                                                                              |
| selresult     | on   off                                                                                    | off                           | Create selections of all resulting objects.                                                                                                                                                                   |
| selresultshow | all   obj   dom  <br>bnd   pnt   off                                                        | dom                           | Show selections, if selresult is on, in physics, materials,<br>and so on; or in 3D from a plane geometry. obj is not<br>available in a component's geometry                                                   |
| color         | none   custom  <br>integer between 1<br>and the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |
| customcolor   | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                         |
| contributeto  | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |

The following attributes are available:

TABLE 3-175: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **SEE ALSO**

Offset, Thicken

*Torus*

Create a solid or surface torus in 3D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Torus");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Torus") to create a torus. The following properties are available:

TABLE 3-176: VALID PROPERTY/VALUE PAIRS FOR TORUS.

| PROPERTY      | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                        |
|---------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle         | double                                                                                   | 360                           | Revolution angle.                                                                                                                                                                                                                  |
| axis          | double[]                                                                                 | {0,0,1}                       | Direction of the revolution axis. Vector has length<br>3 if axistype is cartesian, and length 2 if<br>axistype is spherical.                                                                                                       |
| axistype      | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                                                                                           |
| color         | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| contributeto  | String                                                                                   | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| customcolor   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| intfaces      | on   off                                                                                 | off                           | Create cross section faces inside the torus.                                                                                                                                                                                       |
| pos           | double[]                                                                                 | {0,0,0}                       | Center coordinates.                                                                                                                                                                                                                |
| rmaj          | double                                                                                   | 1                             | Directrix radius.                                                                                                                                                                                                                  |
| rmin          | double                                                                                   | 0.5                           | Generatrix radius.                                                                                                                                                                                                                 |
| rot           | double                                                                                   | 0                             | Rotational angle about axis.                                                                                                                                                                                                       |
| selresult     | on   off                                                                                 | off                           | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off                                               | dom                           | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in all<br>features. |
| type          | solid   surface                                                                          | solid                         | Object type.                                                                                                                                                                                                                       |
| workplanesrc  | this   part-instance<br>feature                                                          | this                          | Part-instance feature to take the work plane from.                                                                                                                                                                                 |
| workplane     | xyplane   work-plane<br>feature                                                          | xyplane                       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system.                                                                                                      |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-177: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"torus3") creates a solid torus.
```

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"torus2") creates a surface torus.

The following properties are also available:

TABLE 3-178: VALID PROPERTY/VALUE PAIRS FOR TORUS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                |
|----------|----------|---------|--------------------------------------------|
| ax2      | double[] | {0,0}   | Alias for axis when axistype is spherical. |
| ax3      | double[] | {0,0,1} | Alias for axis when axistype is cartesian. |
| x, y, z  | double   | 0       | Alias for pos.                             |

The property const is no longer available.

### **EXAMPLE**

The following sequence generates a surface torus and a solid torus:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("t2","Torus");
  g.feature("t2").set("type","surface");
  g.feature("t2").set("rmaj",2);
  g.feature("t2").set("rmin",1);
  g.create("t3","Torus");
  g.feature("t3").set("rmaj",10);
  g.feature("t3").set("rmin",2);
  g.feature("t3").set("pos","0,0,-100");
  g.feature("t3").set("axis","1,1,1");
  g.feature("t3").set("rot",60);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('t2','Torus');
  g.feature('t2').set('type','surface');
  g.feature('t2').set('rmaj',2);
  g.feature('t2').set('rmin',1);
  g.create('t3','Torus');
  g.feature('t3').set('rmaj',10);
  g.feature('t3').set('rmin',2);
  g.feature('t3').set('pos','0,0,-100');
  g.feature('t3').set('axis','1,1,1');
  g.feature('t3').set('rot',60);
  g.run;
```

