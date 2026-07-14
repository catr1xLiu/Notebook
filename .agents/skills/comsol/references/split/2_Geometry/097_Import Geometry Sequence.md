# *Import Geometry Sequence*

Import geometry objects from another geometry sequence.

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

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Import") to create a geometry import feature. Set the property mesh to the tag of a meshing sequence of another model component in the model.

| PROPERTY          | VALUE                                                                                          | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                                                |
|-------------------|------------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color             | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. Coloring is only<br>available when selresult in active.                              |
| contributeto      | String                                                                                         | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| customcolor       | RGB-triplet                                                                                    | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                                                                                                   |
| sequence          | String                                                                                         |                               | Tag of other geometry sequence.                                                                                                                                                                                                            |
| selresult         | on   off                                                                                       | off                           | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow     | all   obj   dom<br>  bnd   edg  <br>pnt   off                                                  | dom                           | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D from<br>a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| selindividual     | on   off                                                                                       | off                           | Create selections of individual objects.                                                                                                                                                                                                   |
| selindividualshow | all   dom   bnd<br>  edg   pnt  <br>off                                                        | dom                           | Show selections, when selindividual is on, of<br>individual objects in physics, materials, and so on; in<br>part instances; or in 3D from a plane geometry.                                                                                |
| type              | sequence                                                                                       |                               | Type of import.                                                                                                                                                                                                                            |

When building, the import feature takes all the existing objects in the specified sequence and imports them into the feature's sequence.

The method

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData()
```

imports the sequence again. The imported objects are represented using the COMSOL Multiphysics geometry modeler or the CAD Import Module's geometry modeler (Parasolid).

If selresult is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point), for use in the geometry sequence. To access the object selection, use model.geom(*<tag>*). selection(*<ftag>*), where *<tag>* is the geometry tag and *<ftag>* is the feature tag. To access the other selections, use model.geom(*<tag>*).selection(*<ftag>.<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D). If, in addition, selresultshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>\_<ftag>\_<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt (edg is not available for DXF import in 2D).

If selindividual is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point) of each individual object, for use in the geometry sequence. To access the object selections, use model.geom(*<tag>*).selection(*<otag>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*. To access the other selections, use model.geom(*<tag>*).selection(*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. If, in addition, selindividualshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>*\_*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*.

The following attributes are available:

TABLE 3-97: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                     |
|--------------|----------|---------|-------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction |
|              |          |         | geometry.                                       |

## **SEE ALSO**

Import 3D CAD, Import DXF, Import of ECAD Files, Import Mesh Part or Meshing Sequence, Import mphbin/mphtxt

*Import Mesh Part or Meshing Sequence*

Create a geometry object from an imported mesh.

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Import");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Import") to create a geometry import feature. Set the property sequence to the tag of another geometry sequence in the model.

| PROPERTY          | VALUE                                                                                          | DEFAULT                          | DESCRIPTION                                                                                                                                                                                                                             |
|-------------------|------------------------------------------------------------------------------------------------|----------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color             | none   custom<br>  integer<br>between 1 and<br>the number of<br>colors in the<br>current theme | none                             | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active.                           |
| customcolor       | RGB-triplet                                                                                    | Next<br>available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                                                   |
| mesh              | String                                                                                         | none                             | Tag of meshing sequence or mesh part to import, or none<br>to create a new mesh part from a mesh file.                                                                                                                                  |
| meshfilename      | String                                                                                         |                                  | Path to mesh file to import when mesh is set to none.                                                                                                                                                                                   |
| type              | Mesh                                                                                           |                                  | Type of import.                                                                                                                                                                                                                         |
| selresult         | on   off                                                                                       | off                              | Create selections of all resulting objects.                                                                                                                                                                                             |
| selresultshow     | all   obj   dom<br>  bnd   edg  <br>pnt   off                                                  | dom                              | Show selections, if selresult is on, in physics, materials,<br>and so on; in part instances; or in 3D from a plane<br>geometry. obj is not available in a component's geometry.<br>dom, bnd, and edg are not available in all features. |
| selindividual     | on   off                                                                                       | off                              | Create selections of individual objects.                                                                                                                                                                                                |
| selindividualshow | all   dom   bnd<br>  edg   pnt  <br>off                                                        | dom                              | Show selections of individual objects in physics, materials,<br>and so on, or in part instances, when selindividual is<br>on.                                                                                                           |
| contributeto      | String                                                                                         | none                             | Tag of cumulative selection to contribute to.                                                                                                                                                                                           |
| defectremoval     | double                                                                                         | 1.0                              | Relative size factor for identification local defects (3D<br>only).                                                                                                                                                                     |
| simplifymesh      | on   off                                                                                       | on                               | Boolean specifying if the original mesh should be simplified<br>(3D only).                                                                                                                                                              |
| simplifytol       | double                                                                                         | 0.01                             | Relative simplification tolerance (3D only).                                                                                                                                                                                            |

When building, the import feature takes the finalized mesh (if the sequence imports a mesh) or the current mesh (if it is not an imported mesh) of the specified sequence and constructs a corresponding geometry object.

## The method

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData()
```

imports the sequence again. The imported objects are represented using the COMSOL Multiphysics geometry modeler. The CAD Import Module's geometry modeler (Parasolid) does not support these types of geometries.

If selresult is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point), for use in the geometry sequence. To access the object selection, use model.geom(*<tag>*). selection(*<ftag>*), where *<tag>* is the geometry tag and *<ftag>* is the feature tag. To access the other selections, use model.geom(*<tag>*).selection(*<ftag>.<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt. If, in addition, selresultshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>\_<ftag>\_<lvl>*), where *<tag>* is the geometry tag, *<ftag>* is the feature tag, and *<lvl>* is one of dom, bnd, edg, or pnt.

If selindividual is set to on, a selection is created for all resulting entities of each type (object, domain, boundary, edge, and point) of each individual object, for use in the geometry sequence. To access the object selections, use model.geom(*<tag>*).selection(*<otag>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*. To access the other selections, use model.geom(*<tag>*).selection(*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. If, in addition, selindividualshow is set to a value other than off, all or some of these selections appear for use outside the geometry sequence. To access these selections, use model.selection(*<tag>*\_*<otag>\_<lvl>*), where *<otag>* is a tag derived from the name of the imported object. For standard object names of the form *<ftag>*(*<n>*), where *<n>* is an object number, the corresponding *<otag>* is *<ftag>*\_*<n>*.

The following attributes are available:

TABLE 3-98: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

