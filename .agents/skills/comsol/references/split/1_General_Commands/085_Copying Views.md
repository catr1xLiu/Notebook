# *Copying Views*

To copy a view to a geometry or work plane, you can use the copyToGeometry and copyToWorkPlane methods. For example,

```
model.component("comp1").view("view1").copyToWorkPlane();
```

copies the view view1 to a work plane.

## *Clipping Tool Settings*

These settings control the different types of clipping tools — clip plane, clip box, clip sphere, and clip cylinder that you can add to a 3D view.

model.component(*<ctag>*).view*(<vtag>)*.clip().create(*<ctag>,<ctype>*) creates clipping tool with the given tag and type. *<ctype>* can be any of 'ClipPlane', 'ClipBox', 'ClipSphere', and 'ClipCylinder'.

model.component(*<ctag>*).view*(<vtag>)*.clip(*<ctag>*).set(*<pname>*,*<pvalue>*) sets the given clipping tool property to the given value. Different properties are available for the different types of clipping tools according to the table below.

model.component(*<ctag>*).view*(<vtag>)*.clip(*<ctag>*).get*Type*(*<pname>*) returns the clipping tool property with the given name.

TABLE 2-145: CLIPPING PROPERTIES FOR THE VIEW FEATURES.

| NAME                                                | VALUE                                                                                                             | DEFAULT   | DESCRIPTION                                                                                                                        |
|-----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------|
| clipapplyclipping                                   | true   false                                                                                                      | true      | Set to false to disable the clipping<br>action for the clipping tools.                                                             |
| clippingactive                                      | true   false                                                                                                      | true      | If the clipping tools are active. The<br>other properties in this table are<br>not available if clippingactive is<br>set to false. |
| clipedges                                           | true   false                                                                                                      | true      | Clip edges in the geometry.                                                                                                        |
| clipfaces                                           | true   false                                                                                                      | true      | Clip faces in the geometry.                                                                                                        |
| cliphighlightintersection                           | true   false                                                                                                      | true      | Highlight the intersection when<br>clipping.                                                                                       |
| clipintersectionhighlightcolor                      | custom  <br>fromtheme  <br>black   blue  <br>cyan   gray  <br>green   magenta<br>  red   white  <br>yellow   none | fromtheme | The coloring of the intersection<br>highlight, if<br>cliphighlightintersection is<br>set to true.                                  |
| clippoints                                          | true   false                                                                                                      | true      | Clip points in the geometry.                                                                                                       |
| clipprimaryhovereffect                              | true   false                                                                                                      | true      | Use clip primary hover effect.                                                                                                     |
| clipsecondaryhovereffect                            | true   false                                                                                                      | false     | Use clip contextual hover effect.                                                                                                  |
| clipshowcappedfaces                                 | true   false                                                                                                      | false     | Show cross sections.                                                                                                               |
| clipshowcappedfacescolorize                         | true   false                                                                                                      | true      | Colorize cross sections, if<br>clipshowcappedfaces is true.                                                                        |
| clipshowcappedfacescolorizeper                      | domain   object                                                                                                   | domain    | Colorize per domain or per<br>geometry object.                                                                                     |
| clipcappedfaceshighlight<br>overlappingdomains      | true   false                                                                                                      | true      | Highlight overlapping domains, if<br>clipshowcappedfaces is true.                                                                  |
| clipcappedfaceshighlight<br>overlappingdomainscolor | custom  <br>fromtheme  <br>black   blue  <br>cyan   gray  <br>green   magenta<br>  red   white  <br>yellow   none | fromtheme | The coloring of the overlapping<br>domains, if<br>clipcappedfaceshighlight<br>overlappingdomains is true.                          |
| clipcappedfacestransparency                         | double (0–1)                                                                                                      | 0.2       | The amount of transparency for the<br>cross sections.                                                                              |

TABLE 2-145: CLIPPING PROPERTIES FOR THE VIEW FEATURES.

| NAME                                   | VALUE        | DEFAULT | DESCRIPTION                                 |
|----------------------------------------|--------------|---------|---------------------------------------------|
| clipcappedfacestransparency<br>enabled | true   false | false   | Use transparency for the cross<br>sections. |
| clipshowframes                         | true   false | true    | Show the frames of the clipping<br>tools.   |
| clipshowgizmos                         | true   false | true    | Show gizmos for the clipping tools.         |

The following table lists the properties available for the clipping tools. Properties that are not available for all clipping tools have a note about availability in the **Description** column.

TABLE 2-146: CLIPPING PROPERTIES FOR THE CLIPPING TOOLS.

| NAME                          | VALUE         | DEFAULT | DESCRIPTION                                                               |
|-------------------------------|---------------|---------|---------------------------------------------------------------------------|
| applyclipping                 | true   false  | true    | Set to false to disable the clipping<br>action for the clipping tools.    |
| disableclipping               | true   false  | false   | Disable the clipping.                                                     |
| drawasintersectionwithgridbox | true   false  | true    | Draw as intersection with grid box.                                       |
| invertclipping                | true   false  | false   | Invert the clipping.                                                      |
| length                        | double        |         | The length of the clipping tool. For<br>ClipCylinder only.                |
| position                      | 1-by-3 double |         | The position of the clipping tool.                                        |
| radius                        | double        |         | The radius of the clipping tool. For<br>ClipSphere and ClipCylinder only. |
| showframe                     | true   false  | true    | Show a frame.                                                             |
| showgizmo                     | true   false  | true    | Show a gizmo.                                                             |

## *Environment Mapping Settings*

These settings control the environment mapping that can provide reflections on the model geometry and as a skybox to provide a background in the view. You add environment mapping by specifying one of the built- in environment maps (images), such as envmap\_park2:

model.component(*<ctag>*).view*(<vtag>)*.set("environmentmap","envmap\_park2") adds an environment map that shows a city park. To see its reflection on a model geometry you need to clear any selections and also activate the setting for showing material color and texture:

model.component(*<ctag>*).view(*<vtag>)*.set("showmaterial",true);.

TABLE 2-147: ENVIRONMENT MAPPING PROPERTIES.

| NAME                   | VALUE                          | DEFAULT | DESCRIPTION                                                                            |
|------------------------|--------------------------------|---------|----------------------------------------------------------------------------------------|
| environmentmap         | environment map or<br>none     | none    | The environment map to use. Use<br>none to turn off environment<br>mapping.            |
| environmentquality     | low   medium   high  <br>ultra | high    | The quality of the environment map.                                                    |
| environmentreflections | true   false                   | true    | Add environment reflections.                                                           |
| rotateenvironment      | true   false                   | false   | Rotate the environment map.                                                            |
| skybox                 | true   false                   | false   | Activate a skybox to make the<br>environment mapping for a<br>background for the view. |
| skyboxblend            | double (0–1)                   | 1       | The blending of the skybox, if skybox<br>is set to true. 1 means no blending.          |

TABLE 2-147: ENVIRONMENT MAPPING PROPERTIES.

| NAME             | VALUE                                                                                                             | DEFAULT         | DESCRIPTION                                                                                              |
|------------------|-------------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------|
| skyboxblurriness | double (0–1)                                                                                                      | 0               | The blurriness of the skybox, if<br>skybox is set to true. 0 means no<br>blurriness.                     |
| skyboxfov        | double (1–180)                                                                                                    | 110             | Skybox field of view, in degrees, if<br>skyboxprojection is set to<br>special.                           |
| skyboxprojection | special  <br>fromcamera                                                                                           | special         | The skybox projection, if skybox is<br>set to true. With fromcamera. the<br>camera's projection is used. |
| skydirection     | positivex  <br>negativex  <br>positivey  <br>negativey  <br>positivez  <br>negativez                              | positivey       | The sky direction.                                                                                       |
| skyrotation      | skyrotationzero  <br>skyrotationninety<br> <br>skyrotationhundre<br>deighty  <br>skyrotationtwohun<br>dredseventy | skyrotationzero | Rotate the environment map by 0, 90,<br>180, or 270 degrees.                                             |

## **SEE ALSO**

model.result()

*model.weak()*

Weak form equations.

#### **SYNTAX**

```
model.weak().create(<tag>);
model.weak(<tag>).weak(<wlist>);
model.weak(<tag>).weak(<pos>,<wepxr>);
model.weak(<tag>).intRule(<irlist>);
model.weak(<tag>).intRule(<pos>,<irule>);
model.weak(<tag>).condition(<condition>);
model.weak(<tag>).weak();
model.weak(<tag>).intRule();
model.weak(<tag>).condition();
```

## **DESCRIPTION**

model.weak(*<tag>*) returns the weak form equations with tag *<tag>*.

model.weak().create(*<tag>*) creates weak form equations with tag *<tag>*.

model.weak(*<tag>*).weak(*<wlist>*) sets the equations. You can supply a single weak expression or a list of weak expressions. *<wlist>* is a string or a string array.

model.weak(*<tag>*).weak(*<pos>*,*<wexpr>*) sets the equations at position *<pos>* in the list.

model.weak(*<tag>*).intRule(*<irlist>*) assigns the integration rules to the weak form equations. The list of integration rules must have the same length as the list of equations, or be of length 1. In the latter case all weak expressions use the same integration rule.

model.weak(*<tag>*).intRule(*<pos>*,*<irule>*) sets the integration rule at position *<pos>* in the integration rule list.

model.weak(*<tag>*).condition(*<condition>*) introduces conditional assembly. The feature is assembled if *<condition>* is true.

model.weak(*<tag>*).selection().named(*<seltag>*) assigns the weak equations to the named selection *<seltag>*.

model.weak(*<tag>*).selection().named(*<seltag>*) defines a local selection that assigns the weak equations to geometric entities. Before assigning a selection, the variable's model must be set using model.variable(*<tag>*).model(*<mtag>*). Only the global selection and selections on a geometry in the model can be used. For a complete list of methods available under selection(), see Selections.

#### **EXAMPLE**

Define the weak expressions u\*test(u) and v\*test(v) on the selection dom1, using the integration rule gp1 and the frame ref.

```
Code for Use with Java
  model.weak().create("w1").selection().named("dom1");
  model.weak("w1").intRule("gp1");
  model.weak("w1").weak(new String[]{"u*test(u)","v*test(v)"});
Code for Use with MATLAB
  model.weak.create('w1').selection.named('dom1');
  model.weak('w1').intRule('gp1');
  model.weak('w1').weak({'u*test(u)','v*test(v)'});
SEE ALSO
model.coeff(), model.shape()
```

