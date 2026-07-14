# *Import DXF*

Import geometry objects from a DXF file to a 2D geometry.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Import");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Import") to create a geometry import feature. When the property filename is set to a file recognized as a DXF CAD drawing, the property type is set to dxf and the following properties are available:

TABLE 3-94: VALID PROPERTY/VALUE PAIRS.

| PROPERTY     | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                      |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| alllayers    | String[]                                                                                    |                               | Read-only property that returns all layers in the<br>DXF file. Access it using model.<br>component( <ctag>).geom(<tag>).<br/>feature(<ftag>).<br/>getStringArray('alllayers');</ftag></tag></ctag>               |
| color        | none   custom  <br>integer between 1<br>and the number of<br>colors in the current<br>theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. Coloring is only available when<br>selresult in active. |
| contributeto | String                                                                                      | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                    |
| convert      | solid   curve   off                                                                         | solid                         | Options to unite all objects in each layer and<br>make all void regions solid.                                                                                                                                   |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                         |
| filename     | String                                                                                      |                               | Filename.                                                                                                                                                                                                        |

TABLE 3-94: VALID PROPERTY/VALUE PAIRS.

| PROPERTY          | VALUE                                | DEFAULT    | DESCRIPTION                                                                                                                                                                                                                                |
|-------------------|--------------------------------------|------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| layers            | String[]                             | all layers | Layers to import.                                                                                                                                                                                                                          |
| repairgeom        | on   off                             | on         | Repair geometry.                                                                                                                                                                                                                           |
| repairtol         | double                               | 1e-5       | Repair tolerance, relative to size of union of<br>imported objects.                                                                                                                                                                        |
| selresult         | on   off                             | off        | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow     | all   obj   dom  <br>bnd   pnt   off | dom        | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are<br>not available in all features. |
| selindividual     | on   off                             | off        | Create selections of individual objects.                                                                                                                                                                                                   |
| selindividualshow | all   dom   bnd  <br>pnt   off       | dom        | Show selections of individual objects in physics,<br>materials, and so on; in part instances; or in 3D if<br>in a Work Plane's Plane Geometry, when<br>selindividual is on.                                                                |
| type              | dxf                                  |            | Type of import.                                                                                                                                                                                                                            |

The file specified by filename can be of any of the following formats:

TABLE 3-95: SUPPORTED FILE FORMATS.

| FILE FORMAT | FILE EXTENSIONS |
|-------------|-----------------|
| DXF         | .dxf            |

The imported objects are represented using the COMSOL geometry modeler.

The method

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData() imports the file again.

If selresult is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point), for use in the geometry sequence. To access the object selection, use model.geom(*<tag>*). selection(*<ftag>*), where *<tag>* is the geometry tag and *<ftag>* is the feature tag. To access the other selections, use model.geom(*<tag>*).selection(*<ftag>.<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D). If, in addition, selresultshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>\_<ftag>\_<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D).

If selindividual is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point) of each individual object, for use in the geometry sequence. To access the object selections, use model.geom(*<tag>*).selection(*<otag>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*. To access the other selections, use model.geom(*<tag>*).selection(*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. If, in addition, selindividualshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>*\_*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*.

The following attributes are available:

TABLE 3-96: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

## **COMPATIBILITY**

The following property is also supported:

| PROPERTY | VALUE                      | DEFAULT | DESCRIPTION                                                  |
|----------|----------------------------|---------|--------------------------------------------------------------|
| coercion | solid   face   curve   off | solid   | Alias for convert. The value face is equivalent<br>to solid. |

