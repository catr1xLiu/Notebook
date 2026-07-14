# **DESCRIPTION**

*View Settings*

model.component(*<ctag>*).view() returns a list of view that can be used when viewing geometry/mesh and plot groups. Each view has an axis and some properties on the top level. In 3D, a view also has a camera and a list of lights. All views also have a list of hide features.

model.component(*<ctag>*).view().create(*<vtag>*,*<gtag>*) creates a view tied to the geometry with the given tag. The dimension of the view is the same as the dimension for the geometry.

model.component(*<ctag>*).view().create(*<vtag>*,*<viewdim>*) creates a view with the given tag for the given dimension (1, 2, or 3). These views are not tied to any geometry and show up under the Views node under Results in the COMSOL Desktop.

model.component(*<ctag>*).view().create(*<vtag>*,*<gtag>*,*<workplane>*) creates a view tied to the work plane with the given tag in the geometry sequence with the given tag. The dimension of the view is 2.

model.component(*<ctag>*).view(*<vtag>*).set(*<pname>*,*<pvalue>*) sets the given property to the given value.

model.component(*<ctag>*).view(*<vtag>*).geom() returns the geometry sequence (or null for the views not associated with a geometry).

model.component(*<ctag>*).view(*<vtag>*).getSDim() returns the view's space dimension.

model.component(*<ctag>*).view(*<vtag>*).get*Type*(*<pname>*) returns the property with the given name of type *Type*.

TABLE 2-139: VIEW PROPERTIES.

| NAME                 | VALUE        | DIMENSIONS | DESCRIPTION                                                                                       |
|----------------------|--------------|------------|---------------------------------------------------------------------------------------------------|
| default              | true   false | 1, 2, 3    | If this is the default view to use when viewing the<br>geometry and mesh.                         |
| headlight            | true   false | 3          | If the light in the camera should be turned on.                                                   |
| locked               | true   false | 1, 2, 3    | If the settings should be updated from interactive<br>changes or not.                             |
| rendermesh           | true   false | 2, 3       | If mesh rendering should be used (default: true).                                                 |
| scenelight           | true   false | 3          | If the background lights as specified by the added<br>lights should be turned on (default: true). |
| showmaterial         | true   false | 2, 3       | If the material color and texture should appear or<br>not (default: false).                       |
| showselection        | true   false | 2, 3       | If the selection colors should appear or not (default:<br>true).                                  |
| showunits            | true   false | 1, 2, 3    | If the axis units should appear or not.                                                           |
| transparency         | true   false | 3          | If the plot show be transparent (default: false).                                                 |
| transparencylevel    | 0 to 1       | 3          | The transparency level, where 0 is fully opaque and 1<br>is fully transparent (default: 0.5).     |
| uniformblending      | true   false | 3          | If the transparent plot should use Fresnel<br>transmittance (default: false).                     |
| uniformblendinglevel | 0 to 1       | 3          | The Fresnel transmittance (default: 0.5).                                                         |
| wireframe            | true   false | 3          | If wireframe rendering should be used.                                                            |
| xscale               | double       | 2, 3       | Scaling factor for x-axis when using a manual view<br>scale.                                      |
| yscale               | double       | 2, 3       | Scaling factor for y-axis when using a manual view<br>scale.                                      |
| zscale               | double       | 3          | Scaling factor for z-axis when using a manual view<br>scale.                                      |

*Axis Settings*

The axis settings apply to 2D views with an *x*- and a *y*-axis.

model.component(*<ctag>*).view(*<vtag>*).axis().set(*<pname>*,*<pvalue>*) sets the given axis property to the given value. Which axis properties that are available in the different dimensions are given in the table below.

model.component(*<ctag>*).view(*<vtag>*).axis().get*Type*(*<pname>*) returns the axis property with the given name.

TABLE 2-140: AXIS PROPERTIES.

| NAME          | VALUE                                   | DIMENSIONS | DESCRIPTION                                                                                                                  |  |
|---------------|-----------------------------------------|------------|------------------------------------------------------------------------------------------------------------------------------|--|
| auto          | on   off                                | 1, 2, 3    | Set if axis settings should be automatically stored and updated<br>from interactive changes using mouse and toolbar buttons. |  |
| autocontext   | autofit  <br>isotropic  <br>anisotropic | 2          | The automatic view scaling when viewscaletype is set to<br>automatic: autofit (the default), isotropic, or anisotropic.      |  |
| equal         | on   off                                | 2, 3       | Should the same scaling be used for all directions.                                                                          |  |
| logx          | on   off                                | 1          | Should log scale be used for the x-axis.                                                                                     |  |
| logy          | on   off                                | 1          | Should log scale be used for the y-axis.                                                                                     |  |
| manualspacing | on   off                                | 2          | Should manual spacing be used for x and y grid lines.                                                                        |  |
| manuallimits  | on   off                                | 1, 2, 3    | Should manual axis limits be used. If not a zoom extents is<br>performed each time something is plotted into the axis.       |  |
| viewscaletype | none   manual  <br>automatic            | 2          | The view scale specification: none (the default), manual, or<br>automatic.                                                   |  |
| xextra        | double array                            | 2          | An array with extra x grid lines.                                                                                            |  |
| xmax          | double                                  | 1, 2, 3    | The maximum x-coordinate.                                                                                                    |  |
| xscale        | double                                  | 2          | A positive scalar value for the x scale when viewscaletype<br>is set to manual.                                              |  |
| xspacing      | double                                  | 2          | Manual spacing for x grid lines.                                                                                             |  |
| xweight       | double                                  | 2          | A positive scalar value for the x weight when autocontext is<br>set to anisotropic.                                          |  |
| yextra        | double array                            | 2          | An array with extra y grid lines.                                                                                            |  |
| ymin          | double                                  | 2, 3       | The minimum y-coordinate.                                                                                                    |  |
| ymax          | double                                  | 2, 3       | The maximum y-coordinate.                                                                                                    |  |
| yscale        | double                                  | 2          | A positive scalar value for the yscale when viewscaletype is<br>set to manual.                                               |  |
| yspacing      | double                                  | 2          | Manual spacing for y grid lines.                                                                                             |  |
| yweight       | double                                  | 2          | A positive scalar value for the yweight when autocontext is<br>set to anisotropic.                                           |  |
| zmin          | double                                  | 3          | The minimum z-coordinate.                                                                                                    |  |
| zmax          | double                                  | 3          | The maximum z-coordinate.                                                                                                    |  |

#### *Camera Settings*

These settings apply to the camera for 3D views.

![](_page_196_Picture_6.jpeg)

Some camera settings are affected by the preference settings for default 3D views.

model.component(*<ctag>*).view*(<vtag>)*.camera().set(*<pname>*,*<pvalue>*) sets the given camera property to the given value.

model.component(*<ctag>*).view*(<vtag>)*.camera().get*Type*(*<pname>*) returns the camera property with the given name.

TABLE 2-141: CAMERA PROPERTIES.

| NAME          | VALUE                        | DESCRIPTION                                                                                                                      |  |
|---------------|------------------------------|----------------------------------------------------------------------------------------------------------------------------------|--|
| autocontext   | isotropic  <br>anisotropic   | Use an isotropic automatic cube scaling or an anisotropic automatic block<br>scaling with x, y, and z direction relative scales. |  |
| autoupdate    | true   false                 | Use automatic update of the view when viewscaletype is automatic.                                                                |  |
| projection    | perspective <br>orthographic | Use perspective or orthographic projection.                                                                                      |  |
| manualspacing | on   off                     | Should manual spacing be used for grid lines.                                                                                    |  |
| position      | double array                 | The position of the camera.                                                                                                      |  |
| target        | double array                 | The point the camera looks at.                                                                                                   |  |
| up            | double array                 | The up direction.                                                                                                                |  |
| rotationpoint | double array                 | The center of rotation.                                                                                                          |  |
| viewscaletype | none   automatic  <br>manual | Control the view scale to achieve a suitable axis scaling (default: None).                                                       |  |
| xextra        | double array                 | An array with extra x grid lines.                                                                                                |  |
| xspacing      | double                       | Manual spacing for x grid lines.                                                                                                 |  |
| xweight       | double                       | Relative weight in the x direction for anisotropic automatic view scale.                                                         |  |
| yextra        | double array                 | An array with extra y grid lines.                                                                                                |  |
| yspacing      | double                       | Manual spacing for y grid lines.                                                                                                 |  |
| yweight       | double                       | Relative weight in the y direction for anisotropic automatic view scale.                                                         |  |
| zextra        | double array                 | An array with extra z grid lines.                                                                                                |  |
| zspacing      | double                       | Manual spacing for z grid lines.                                                                                                 |  |
| zoomanglefull | double                       | The full field of view angle in degrees.                                                                                         |  |
| zweight       | double                       | Relative weight in the z direction for anisotropic automatic view scale.                                                         |  |

#### *Lighting Settings*

These settings control the different types of lighting — direction light, spotlight, headlight, and point light — that you can add to a 3D view.

model.component(*<ctag>*).view*(<vtag>)*.light().create(*<ltag>,<ltype>*) creates a light with the given tag and type. *<ltype>* can be any of 'DirectionalLight', 'PointLight', 'SpotLight', and 'HeadLight'.

model.component(*<ctag>*).view*(<vtag>)*.light(*<ltag>*).set(*<pname>*,*<pvalue>*) sets the given light property to the given value. Different properties are available for the different types of lights according to the table below.

model.component(*<ctag>*).view*(<vtag>)*.light(*<ltag>*).get*Type*(*<pname>*) returns the light property with the given name.

TABLE 2-142: LIGHT PROPERTIES.

| NAME                  | VALUE           | LIGHT TYPES | DESCRIPTION                                       |
|-----------------------|-----------------|-------------|---------------------------------------------------|
| angleattenuationscale | positive scalar | SpotLight   | Angle attenuation scale factor for<br>spotlights. |
| castlight             | boolean         | all         | Cast light.                                       |
| castshadows           | boolean         | all         | Cast shadows, if castlight is set<br>to true.     |
| castshadowsonfloor    | boolean         | all         | Cast shadows on floor.                            |

TABLE 2-142: LIGHT PROPERTIES.

| NAME                     | VALUE                 | LIGHT TYPES                    | DESCRIPTION                                                                                          |
|--------------------------|-----------------------|--------------------------------|------------------------------------------------------------------------------------------------------|
| color                    | string or RGB triplet | all                            | The color of the light.                                                                              |
| cameracoord              | on   off              | all                            | If the light should be defined in the<br>camera coordinate system or the<br>world coordinate system. |
| direction                | double array          | DirectionalLight,<br>SpotLight | The direction from which the light<br>shines or is directed at.                                      |
| distanceattenuationscale | positive scalar       | PointLight,<br>SpotLight       | Distance attenuation scale factor<br>for spotlights and point lights.                                |
| position                 | double array          | PointLight,<br>SpotLight       | The position from which the light<br>shines.                                                         |
| spreadangle              | double                | SpotLight                      | The spread angle for the light.                                                                      |

The following table lists the light properties for 3D views:

TABLE 2-143: LIGHT PROPERTIES IN 3D VIEWS.

| NAME              | VALUE                                                                                           | DEFAULT | DESCRIPTION                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------|
| ambientcolor      | custom   black  <br>blue   cyan   gray<br>  green   magenta  <br>red   white  <br>yellow   none | white   | The coloring of the intersection highlight, if<br>globalambient is set to true. |
| castshadows       | true   false                                                                                    | true    | Cast shadows from lights when direct shadows<br>are active.                     |
| globalambient     | true   false                                                                                    | true    | Include ambient light.                                                          |
| scenelight        | true   false                                                                                    | true    | Include scene light. Must be true for the other<br>properties to be active.     |
| showmarker        | true   false                                                                                    | true    | Show light marker.                                                              |
| totambient        | double (0–1)                                                                                    | 0.3     | The ambient intensity.                                                          |
| totlightintensity | double (0–1)                                                                                    | 1       | The light intensity.                                                            |
| usediffuse        | true   false                                                                                    | true    | Include diffuse light.                                                          |
| usespecular       | true   false                                                                                    | true    | Include specular light.                                                         |

*Visual Effects Settings: Ambient Occlusion, Shadows, and Gamma Correction*

The following table lists the properties for 3D views that control visual effects such as ambient occlusion, direct and floor shadows, and gamma correction:

TABLE 2-144: VISUAL EFFECTS PROPERTIES IN 3D VIEWS.

| NAME                        | VALUE        | DEFAULT | DESCRIPTION                                                        |
|-----------------------------|--------------|---------|--------------------------------------------------------------------|
| displayoutput               | boolean      | false   | Use gamma correction.                                              |
| displayoutput<br>brightness | double (0–1) | 0       | The brightness, if<br>displayoutputpreset is set to<br>custom.     |
| displayoutputcontrast       | double (0–4) | 1       | The contrast, if<br>displayoutputpreset is set to<br>custom.       |
| displayoutputexposure       | double (0–2) | 0.0     | The exposure value, if<br>displayoutputpreset is set to<br>custom. |

TABLE 2-144: VISUAL EFFECTS PROPERTIES IN 3D VIEWS.

| NAME                            | VALUE                                                                       | DEFAULT        | DESCRIPTION                                                                                                                                                                   |
|---------------------------------|-----------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| displayoutputgamma              | double (1–4)                                                                | 2.2            | The gamma value, if<br>displayoutputpreset is set to<br>custom.                                                                                                               |
| displayoutputhue                | double (0–1)                                                                | 0              | The hue, if displayoutputpreset is<br>set to custom.                                                                                                                          |
| displayoutputpreset             | default   custom                                                            | default        | Use a preset gamma correction or<br>specify a custom gamma correction.                                                                                                        |
| displayoutput<br>saturation     | double (0–4)                                                                | 1              | The saturation, if<br>displayoutputpreset is set to<br>custom.                                                                                                                |
| displayoutputtonemap            | Integer string ("0" to<br>"4"                                               | "1" (Clamp)    | The tone map to use if<br>displayoutputpreset is set to<br>custom. The "0" to "4" correspond to<br>Filmic, None (the default), Extreme,<br>Bright, and Natural, respectively. |
| displayoutputvibrance           | double (0–1)                                                                | 0              | The                                                                                                                                                                           |
| flooreffect                     | boolean                                                                     | false          | Add floor shadows.                                                                                                                                                            |
| flooreffectambient<br>occlusion | boolean                                                                     | true           | Use ambient occlusion.                                                                                                                                                        |
| flooreffectangle                | double                                                                      | 5              | Pitch angle for the floor shadows (in<br>degrees), if<br>flooreffectnormalsettings is set<br>to angle.                                                                        |
| flooreffectnormal               | double array                                                                | {0, 0, 1}      | The floor effect normal vector, if<br>flooreffectnormalpreset is set to<br>custom.                                                                                            |
| flooreffectnormal<br>preset     | xyplane   yzplane  <br>zxplane   yzplane  <br>zyplane   xzplane  <br>custom | xyplane        | The floor shadow normal preset, if<br>flooreffectnormalsettings is set<br>to explicit.                                                                                        |
| flooreffectnormal<br>settings   | angle   explicit                                                            | angle          | The floor effect normal setting: derive<br>from pitch angle or specify explicitly.                                                                                            |
| flooreffectoffset               | double                                                                      | 0              | Additional floor shadow effect offset; a<br>positive number moved the floor<br>farther away.                                                                                  |
| flooreffectorigin               | double array                                                                | {0, 0, 0}      | The floor effect origin, if<br>flooreffectoriginsettings is set<br>to explicit.                                                                                               |
| flooreffectorigin<br>settings   | farthestvertex  <br>boundingsphere  <br>boundingbox  <br>explicit           | farthestvertex | Floor origin settings: offset by farthest<br>vertex, bounding sphere, bounding box,<br>or explicit.                                                                           |
| flooreffectshadow               | boolean                                                                     | true           | Use direct floor shadows                                                                                                                                                      |
| flooreffectshadowblur           | double (0–1)                                                                | 0              | Additional blur, if<br>flooreffectshadowblur is set to<br>true.                                                                                                               |
| flooreffect<br>transparency     | double (0–1)                                                                | 0              | The transparency of the floor shadows.                                                                                                                                        |
| shadowmapping                   | boolean                                                                     | false          | Add direct shadows.                                                                                                                                                           |

TABLE 2-144: VISUAL EFFECTS PROPERTIES IN 3D VIEWS.

| NAME                                     | VALUE                           | DEFAULT | DESCRIPTION                                                                                    |
|------------------------------------------|---------------------------------|---------|------------------------------------------------------------------------------------------------|
| shadowmappingaccurate<br>depthcomparison | boolean                         | false   | Use accurate depth comparison, when<br>shadowmappingpreset is set to<br>preset.                |
| shadowmappingbias<br>settings            | default   custom                | default | Use the default bias settings for direct<br>shadows, or use custom settings.                   |
| shadowmapping<br>constantdepthbias       | double (0–1)                    | 0.001   | Constant depth bias, if<br>shadowmappingbiassettings is set<br>to custom.                      |
| shadowmappinglimit<br>lightviewfrustums  | boolean                         | false   | Limit light view frustums, when<br>shadowmappingpreset is set to<br>preset.                    |
| shadowmappingmulti<br>samplingeverywhere | boolean                         | true    | Use multisampling everywhere, when<br>shadowmappingpreset is set to<br>preset.                 |
| shadowmappingnumber<br>ofoccludersamples | integer (1–200)                 | 8       | Number of occluder samples, when<br>shadowmappingpreset is set to<br>preset.                   |
| shadowmappingnormal<br>awaresmoothing    | boolean                         | false   | Use normal-aware smoothing, if<br>shadowmappingaccuratedepthcomp<br>arison is set to true.     |
| shadowmappingnormal<br>offsetbias        | double (0–1)                    | 0.003   | Normal offset bias, if<br>shadowmappingbiassettings is set<br>to custom.                       |
| shadowmappingnumber<br>ofsamples         | integer (1–200)                 | 16      | Number of samples, when<br>shadowmappingpreset is set to<br>preset.                            |
| shadowmappingpreset                      | low   medium   high<br>  custom | low     | Quality preset for direct shadows: low,<br>medium, or high quality, or use custom<br>settings. |
| shadowmapping<br>resolution              | double (0–1)                    | 0.5     | Resolution, when<br>shadowmappingpreset is set to<br>preset.                                   |
| shadowmappingslope<br>depthbias          | double (0–1)                    | 0.001   | Slope depth bias, if<br>shadowmappingbiassettings is set<br>to custom.                         |
| shadowmapping<br>softness                | double (0–3)                    | 0.5     | Strength of the direct shadows.                                                                |
| shadowmapping<br>strength                | double (0–1)                    | 0.5     | Softness of the direct shadows.                                                                |
| ssao                                     | boolean                         | false   | Add ambient occlusion.                                                                         |
| ssaokernelrotations<br>texturewidth      | double (0–8)                    | 4       | Kernel rotations texture width, when<br>ssaopreset is set to custom.                           |
| ssaomagnitude                            | double (0–10)                   | 1       | Shadow strength for ambient occlusion.                                                         |
| ssaonormalaware<br>smoothing             | boolean                         | false   | Add normal-aware smoothing for<br>ambient occlusion, when ssaopreset<br>is set to custom.      |
| ssaonsamples                             | integer (1–300)                 | 64      | Number of samples, when ssaopreset<br>is set to custom.                                        |

TABLE 2-144: VISUAL EFFECTS PROPERTIES IN 3D VIEWS.

| NAME               | VALUE                           | DEFAULT  | DESCRIPTION                                                                                       |
|--------------------|---------------------------------|----------|---------------------------------------------------------------------------------------------------|
| ssaopreset         | low   medium   high<br>  custom | medium   | Quality preset for ambient occlusion:<br>low, medium, or high quality, or use<br>custom settings. |
| ssaoradiusexplicit | double (>0)                     | 0.4      | Maximum distance to occluder, when<br>ssaoradiustype is set to explicit.                          |
| ssaoradiusrelative | double (>0)                     | 0.4      | Fraction of scene bounding box, when<br>ssaoradiustype is set to relative.                        |
| ssaoradiustype     | relative  <br>explicit          | relative | Radius type, for ambient occlusion<br>when ssao is set to true.                                   |
| ssaoresolution     | double (0–1)                    | 1        | Resolution, when ssaopreset is set to<br>custom.                                                  |
| ssaoroughness      | double (0–1)                    | 1        | Roughness, when ssaopreset is set to<br>custom.                                                   |
| ssaosmooth         | double (0–8)                    | 2        | Smooth, when ssaopreset is set to<br>custom.                                                      |
| ssaosqueeze        | double (0–10)                   | 1        | Shadow tightness for ambient occlusion.                                                           |

*Hiding Geometry Objects, Geometric Entities, and Imported Meshes*

model.component(*<ctag>*).view(*<vtag>*).hideObjects().create(*<htag>*) creates a hide feature of geometric objects in the geometry sequence. The API for controlling it is similar to the API for selection in the geometry sequence; see Geometry Object Selection Methods under model.geom().

model.component(*<ctag>*).view(*<vtag>*).hideEntities().create(*<htag>*) creates a hide feature of geometric entities in the analyzed geometry used, for example, for the physics. The API for controlling it is similar to the API for selections on the finalized geometry; see model.selection().

model.component(*<ctag>*).view(*<vtag>*).hideMesh().create(*<htag>*) creates a hide feature of geometric entities in the analyzed geometry from an imported mesh used, for example, for the physics. The API for controlling it is similar to the API for selections on the finalized geometry; see model.selection(). For example, the following code hides boundary 4 in the geometry based on the mesh in mesh1:

```
// Create mesh hide object in view 1
model.component("comp1").view("view1").hideMesh().create("hide1");
// Select mesh1
model.component("comp1").view("view1").hideMesh("hide1").mesh("mesh1");
// Hide boundary 4 (3D is assumed)
model.component("comp1").view("view1").hideMesh("hide1").geom(2).set(4);
```

model.component(*<ctag>*).view(*<vtag>*).getHiddenEntities() returns an integer array of hidden entities in each dimension. The entity numbers refer to the entities of the finalized geometry.

model.component(*<ctag>*).view(*<vtag>*).getHiddenEntities(*<mesh>*) returns an integer array of hidden entities in each dimension. The entity numbers refer to the entities of specified meshing sequence with the tag *<mesh>* in its current state.

For plotting or exporting images of views with hidden objects, use the model.component(<ctag>).view(<vtag>).hideEntities(<htag>).image() and model.component(<ctag>).view(<vtag>).hideMesh(<htag>).image() methods. See Plotting and Exporting Images.

