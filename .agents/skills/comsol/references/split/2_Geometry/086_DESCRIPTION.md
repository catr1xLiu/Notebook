# **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Extrude") to extrude objects from a work plane or planar faces in the 3D geometry.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the work plane objects to extrude. The default selection is all available objects from the last preceding work plane.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("inputface") to select the faces to extrude. Faces are extruded when the workplane property is none; otherwise work plane objects are extruded.

The following properties are available:

TABLE 3-79: VALID PROPERTY/VALUE PAIRS FOR EXTRUDE.

| PROPERTY       | VALUES                                                                                   | DEFAULT                                        | DESCRIPTION                                                                                                                                                                                                                        |
|----------------|------------------------------------------------------------------------------------------|------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                                           | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor property.<br>Coloring is only available when selresult in<br>active.                   |
| contributeto   | String                                                                                   | none                                           | Tag of cumulative selection to contribute to.                                                                                                                                                                                      |
| crossfaces     | on   off                                                                                 | on                                             | Keep cross-sectional faces.                                                                                                                                                                                                        |
| customcolor    | RGB-triplet                                                                              | Next available<br>theme color                  | The color to use. Active when color is set to<br>custom.                                                                                                                                                                           |
| displ          | double[nd][2]                                                                            | {{0,0}}                                        | Displacement (parallel to work plane) of<br>extrusion top (of each layer) in local coordinate<br>system.                                                                                                                           |
| distance       | double   double[nd]                                                                      | 1                                              | Extrusion distance(s), that is, local z-coordinate<br>for the top (of each layer). Used if specify is set<br>to distances.                                                                                                         |
| extrudefrom    | workplane   faces  <br>edges   vertices                                                  | workplane, if<br>available,<br>otherwise faces | Extrude work plane objects, planar faces, edges,<br>or vertices in 3D.                                                                                                                                                             |
| includeinput   | boolean                                                                                  | true                                           | Include (planar) input faces when forming the<br>extruded object.                                                                                                                                                                  |
| input          | Selection                                                                                | all objects                                    | Objects to extrude.                                                                                                                                                                                                                |
| inputedge      | Selection                                                                                |                                                | Edges to extrude. Used if extrudefrom is<br>edges.                                                                                                                                                                                 |
| intputface     | Selection                                                                                |                                                | Faces to extrude. Used if extrudefrom is<br>faces.                                                                                                                                                                                 |
| inputvertex    | Selection                                                                                |                                                | Vertices to extrude. Used if extrudefrom is<br>vertices.                                                                                                                                                                           |
| propagatesel   | on   off                                                                                 | on                                             | Propagate selections from input objects to<br>resulting objects.                                                                                                                                                                   |
| reverse        | on   off                                                                                 | off                                            | Reverse the extrude direction.                                                                                                                                                                                                     |
| scale          | double[nd][2]                                                                            | {{1,1}}                                        | Scale of extrusion top (of each layer).                                                                                                                                                                                            |
| selextrude     | on   off                                                                                 | off                                            | Extrude selections from work plane (used if<br>extrudefrom is workplane)                                                                                                                                                           |
| selextrudeshow | on   off                                                                                 | on                                             | Show extruded selections in physics/instances<br>(only used when selextrude is on)                                                                                                                                                 |
| selresult      | on   off                                                                                 | off                                            | Create selections of all resulting objects.                                                                                                                                                                                        |
| selresultshow  | all   obj   dom   bnd<br>  edg   pnt   off                                               | dom                                            | Show selections, if selresult is on, of resulting<br>objects in physics, materials, and so on, or in part<br>instances. obj is not available in a component's<br>geometry. dom, bnd, and edg are not available in<br>all features. |
| specify        | distances  <br>vertices                                                                  | distances                                      | Specification of extrusion distances: as distances<br>using the distance property or by specifying<br>vertices in the 3D geometry using the vertex<br>property.                                                                    |
| twist          | double   double[nd]                                                                      | 0                                              | Twist angle (of each layer).                                                                                                                                                                                                       |

TABLE 3-79: VALID PROPERTY/VALUE PAIRS FOR EXTRUDE.

| PROPERTY  | VALUES    | DEFAULT | DESCRIPTION                                                    |
|-----------|-----------|---------|----------------------------------------------------------------|
| vertex    | Selection |         | Vertices to extrude to. Used if specify is set to<br>vertices. |
| workplane | String    |         | Work plane to extrude.                                         |

Each planar input is extruded in *n*d layers defined by a local coordinate system. By default, *n*d=1. The property distance is the extrusion distance (of each layer) in the *z*-axis direction of the local system. The properties displ, scale, and twist define the translation displacements, scale factors and rotation of the top (of each layer) with respect to the bottom of the extruded object. The last array dimension in the properties displ, scale, and twist can be omitted if the same value is desired for all layers.

When extruding work plane objects, the local system is defined as the local system of the work plane. When extruding faces, the local system is defined by the face with the smallest face number in the object that comes first in the geometry sequence. The local *z*-axis is parallel to the face normal and located at the center of the face. The local *x*-axis is defined by the tangent direction corresponding to the first parameter in the surface representation for the face.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-80: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **COMPATIBILITY**

The cubic interpolated extrusion is no longer supported.

The following property is also supported:

TABLE 3-81: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUES     | DEFAULT | DESCRIPTION                                            |
|----------|------------|---------|--------------------------------------------------------|
| face     | all   none | all     | Cross-sectional faces to delete, alias for crossfaces. |
| keep     | on   off   | off     | Alias for unite property with opposite value.          |

## **EXAMPLE**

Creation of a cylinder of height 1.3:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",3);
  g.create("wp1","WorkPlane");
  g.feature("wp1").geom().create("c1","Circle");
  g.run("wp1");
  g.create("e1","Extrude");
  g.feature("e1").set("distance",1.3);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',3);
  g.create('wp1','WorkPlane');
```

```
g.feature('wp1').geom.create('c1','Circle');
g.run('wp1');
g.create('e1','Extrude');
g.feature('e1').set('distance',1.3);
g.run;
```

## **SEE ALSO**

Revolve, WorkPlane

