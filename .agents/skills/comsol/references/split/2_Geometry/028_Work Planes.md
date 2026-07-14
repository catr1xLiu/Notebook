# Work Planes

In 3D, you can create 3D objects by defining 2D objects in *work planes* and then *extruding* and *revolving* these into 3D objects. You can also get a *cross section* 2D object by intersecting a 3D object with the work plane.

To add a WorkPlane feature, use

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"WorkPlane");
```

You access a work planes 2D geometry sequence by the geom() method. To add a 2D feature to a work plane, use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).geom().create(*<ftag1>*,*ftype*); where *<ftag>* refers to a WorkPlane feature and *ftype* refers to a 2D feature type.

![](_page_18_Picture_5.jpeg)

The Finalize feature is optional for work planes but is necessary if you want to add virtual operations to the work plane sequence. It then needs to be created, as specified in Finalize.

A work plane's geometry sequence inherits its settings from its 3D sequence.

![](_page_18_Picture_8.jpeg)

For more information on the settings for a geometry sequence see Geometry Settings.

When you build a work-plane feature, its corresponding 2D sequence builds automatically and the geometry objects defined by the 2D sequence *embed* into 3D geometry objects in the 3D sequence. You can then extrude or revolve these embedded point, curve, or surface objects into curve, surface, or solid objects, respectively, using Extrude or Revolve features, respectively.

![](_page_18_Picture_11.jpeg)

Methods on model.component(*<ctag>*).geom(*<tag>*) can also be used on model. component(*<ctag>*).geom(*<tag>*).feature(*<wptag>*).geom().

