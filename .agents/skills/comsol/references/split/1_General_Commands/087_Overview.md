# *Overview*

For a number of model entities, two methods for plotting and exporting images are available:

- **•** image().plot() plots the model entity in a window. The plotting is available when running a graphics server. The plot() method does nothing when run from a model method.
- **•** image().export() exports an image of the model entity to file.

To set properties related to the plotting or export of images, use the standard set method on the image() object.

The following examples show the basic usage of these methods.

This example plots a geometry sequence in a window:

```
model.geom("geom1").image().plot();
```

This example exports a physics interface to a PNG file.

```
model.physics("es").image().set("pngfilename", "C:\physics.png");
model.physics("es").image().export();
```

```
The image() method is available for many objects in, for example, the lists model.common(), model.cpl(), 
model.coordSys(), model.func(), model.geom() (including individual geometry features), 
model.material(), model.mesh(), model.multiphysics(), model.pair(), model.physics(), 
model.physics(<tag>).feature(), model.probe(), and model.selection().
```

For mesh features, you can use the set property to specify the selection for the image() object:

```
model.mesh(<mtag>).feature(<ftag>).image().set("selection", "main")
```

It specifies that the feature's main selection, model.mesh(*<mtag>*).feature(*<ftag>*).selection(), will appear in the plot. This is the default. Use

```
model.mesh(<mtag>).feature(<ftag>).image().set("selection",<propname>)
```

to specify that a property selection, model.mesh(*<mtag>*).feature(*<ftag>*).selection(*<propname>)*, will appear in the plot.

For mesh features that do not have any selection, the selection property is ignored when plotting.

