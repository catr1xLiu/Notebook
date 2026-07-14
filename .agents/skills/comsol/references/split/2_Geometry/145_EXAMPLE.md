# **EXAMPLE**

The sequence below creates a unit solid square:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("sq1","Square");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom',2);
  g.create('sq1','Square');
  g.run;
```

#### **SEE ALSO**

Rectangle

Sweep one or several faces, edges, or points along a spine curve into solids, surfaces, or curves in 3D.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Sweep");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Sweep") to sweep faces, edges, or points along a spine curve.

Use to the following methods to set the dimension of the entities to sweep and to select the entities:

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).
                         selection("enttosweep").init(entDim);
model.component(<ctag>).geom(<tag>).feature(<ftag>).
                         selection("enttosweep").set(<objname>,entities);
```

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("edge") to select the edges to sweep along.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("diredge") to select the edge whose direction defines the positive sweep direction. If this selection is empty, it is automatically set when the edge selection is set. The diredge selection can be empty if the edge selection contains a single edge.

The following properties are available:

TABLE 3-164: VALID PROPERTY/VALUE PAIRS FOR SWEEP.

| PROPERTY     | VALUES                                                                                   | DEFAULT                          | DESCRIPTION                                                                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|----------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| adjustlen    | double                                                                                   | 0.1                              | Adjustment parameter length at start of spine.<br>Only used if spineperpstart is on.                                                                                                                             |
| adjustlenend | double                                                                                   | 0.1                              | Adjustment parameter length at end. Only<br>used if spineperpend is on.                                                                                                                                          |
| color        | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                             | The color of the selection, either given as an<br>integer indicating a color in the color theme,<br>or as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active. |
| contributeto | String                                                                                   | none                             | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| customcolor  | RGB-triplet                                                                              | Next<br>available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| crossfaces   | on   off                                                                                 | off                              | Create cross-sectional faces. Only used if<br>enttosweep has geometric entity level 2.                                                                                                                           |
| diredge      | Selection                                                                                |                                  | Direction-defining edge.                                                                                                                                                                                         |
| edge         | Selection                                                                                |                                  | Edges that form spine curve of the sweep.                                                                                                                                                                        |
| enttomatch   | Selection                                                                                |                                  | Entities to match (with level 2, 1, or 0). Only<br>used if spineperpend is on.                                                                                                                                   |
| enttosweep   | Selection                                                                                |                                  | Entities to sweep (supported levels 2, 1, or 0).                                                                                                                                                                 |
| grep         | bezier   spline                                                                          | spline                           | Geometry representation.                                                                                                                                                                                         |

TABLE 3-164: VALID PROPERTY/VALUE PAIRS FOR SWEEP.

| PROPERTY           | VALUES                                           | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                        |
|--------------------|--------------------------------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| includefinal       | on   off                                         | off       | Include all used input objects in Finalize<br>operation.                                                                                                                                                                           |
| keep               | on   off                                         | on        | Keep input objects.                                                                                                                                                                                                                |
| manualdir          | on   off                                         | on        | Manual control of sweep direction.                                                                                                                                                                                                 |
| matchvertices      | on   off                                         | off       | Add twisting and scaling to match vertices.                                                                                                                                                                                        |
| maxknots           | int                                              | 1000      | Maximum number of knots.                                                                                                                                                                                                           |
| movetospine        | on   off                                         | off       | Move entities to sweep to spine start and<br>match work plane coordinate system with<br>spine.                                                                                                                                     |
| parameterization   | arclength  <br>normalizedarclength<br>  internal | arclength | Parameterization of the spine curve: arc length,<br>normalized arc length, or the internal<br>parameterization in the geometry's data<br>structures.                                                                               |
| parname            | String                                           | s         | Parameter name.                                                                                                                                                                                                                    |
| projvector         | String[]                                         | {0,0,1}   | The vector to follow when controlling the<br>twisting of the cross section. Only used if<br>twisting is projvector.                                                                                                                |
| propagatesel       | on   off                                         | on        | Propagate selections from input objects to<br>resulting objects.                                                                                                                                                                   |
| reversedir         | on   off                                         | off       | Reverse sweep direction. Only used if<br>manualdir is on.                                                                                                                                                                          |
| rtol               | double                                           | 1e-4      | Relative tolerance.                                                                                                                                                                                                                |
| scale              | String                                           | 1         | Scale factor for cross section.                                                                                                                                                                                                    |
| selresult          | on   off                                         | off       | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow      | all   obj   dom   bnd  <br>edg   pnt   off       | dom       | Show selections, if selresult is on, of<br>resulting objects in physics, materials, and so<br>on, or in part instances. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| smooth             | on   off                                         | on        | Smooth edge connections.                                                                                                                                                                                                           |
| spineperpend       | on   off                                         | off       | Make spine perpendicular to entities to match<br>at end of spine curve.                                                                                                                                                            |
| spineperpstart     | on   off                                         | off       | Make spine perpendicular to entities to sweep<br>at start of spine curve.                                                                                                                                                          |
| twist              | String                                           | 0         | Twist angle for cross section.                                                                                                                                                                                                     |
| twisting           | none   projvector  <br>curvature                 | none      | Select how the twisting of cross section is<br>done.                                                                                                                                                                               |
| vertexinenttosweep | Selection                                        |           | Vertex in entity to sweep. Only used if<br>matchvertices is on.                                                                                                                                                                    |
| vertextomatch      | Selection                                        |           | Vertex to match at end. Only used if<br>matchvertices is on.                                                                                                                                                                       |

If includefinal is off, input objects are automatically removed in the Finalize (Form Union/Assembly) operation if they are completely used by this feature. Objects used in enttosweep are considered completely used if all of their entities of the selected dimension (2, 1, or 0) are included in enttosweep. Objects used in edge are considered completely used if all their edges are included in edge. If an object is considered completely used by one property but not completely used by another property, the object is not removed in the Finalize operation. If includefinal is on, input objects are not removed in the Finalize operation.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-165: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

#### **COMPATIBILITY**

In COMSOL Multiphysics 4.2a and earlier versions, the positive sweep direction was defined as the curve direction instead of the edge direction.

#### **EXAMPLE**

Create a half torus about the *y*-axis using a sweep operation:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("wp1","WorkPlane");
  g.feature("wp1").geom().create("c1","Circle");
  g.create("pc1","ParametricCurve");
  g.create("swe1","Sweep");
  g.feature("pc1").set("parmax","pi");
  g.feature("pc1").set("coord",new String[]{"(cos(s)-1)*3","0","sin(s)*3"});
  g.feature("swe1").selection("enttosweep").set("wp1.c1", new int[]{1});
  g.feature("swe1").selection("edge").set("pc1(1)",new int[]{1});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('wp1','WorkPlane');
  g.feature('wp1').geom.create('c1','Circle');
  g.create('pc1','ParametricCurve');
  g.create('swe1','Sweep');
  g.feature('pc1').set('parmax','pi');
  g.feature('pc1').set('coord',{'(cos(s)-1)*3','0','sin(s)*3'});
  g.feature('swe1').selection('enttosweep').set('wp1.c1', 1);
  g.feature('swe1').selection('edge').set('pc1(1)', 1);
  g.run;
```

