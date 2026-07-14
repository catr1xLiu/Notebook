# *Fillet*

Create circular rounded corners (fillets) in 2D geometry objects. The Design Module supports 3D fillets.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Fillet");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Fillet") to round corners in 2D.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("point") to select which corners to round. The default selection is empty.

TABLE 3-82: VALID PROPERTY/VALUE PAIRS.

| PROPERTY       | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                             |
|----------------|------------------------------------------------------------------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color          | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active.                           |
| customcolor    | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| point          | Selection                                                                                      |                               | Vertices to fillet.                                                                                                                                                                                                                     |
| pointinsketch  | Selection                                                                                      |                               | Vertices to fillet in sketch geometry.                                                                                                                                                                                                  |
| radius         | double                                                                                         | 0                             | Radius of fillet.                                                                                                                                                                                                                       |
| selectinsketch | on   off                                                                                       | on                            | Determines whether you can use the pointinsketch<br>property. It can be off in models made in version 6.0 or<br>earlier.                                                                                                                |
| selresult      | on   off                                                                                       | off                           | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow  | all   obj   dom<br>  bnd   pnt  <br>off                                                        | dom                           | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| contributeto   | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                           |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The point property contains the vertices to fillet in the usual geometry visualization. The pointinsketch property contains the vertices to fillet in the sketch visualization. These properties are automatically kept synchronized.

Additional properties are available with the Design Module, see Fillet.

The following attributes are available:

TABLE 3-83: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

## **EXAMPLE**

Fillet a rectangle object:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("r1","Rectangle");
  g.create("fil1","Fillet");
  g.feature("fil1").selection("point").set("r1(1)",new int[]{1,2,3,4});
  g.feature("fil1").set("radius",0.1);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.create('fil1','Fillet');
  g.feature('fil1').selection('point').set('r1(1)',1:4);
  g.feature('fil1').set('radius',0.1);
  g.run;
```

#### **DIAGNOSTICS**

If Fillet does not succeed in creating a rounded corner according to the specified radius, the vertex is skipped. When a fillet intersects another edge, the function generates an error message.

## **SEE ALSO**

Chamfer

