# Creating and Using Geometry Parts

For a description of geometry parts, see Using Geometry Parts in the *COMSOL Multiphysics Reference Manual*.

```
To create a geometry part, enter
```

```
model.geom().create(<tag>, "Part", sDim);
where <tag> is the parts tag, and sDim is its space dimension (1, 2, or 3).
```

To add an input parameter to the part, enter

```
model.geom(<tag>).inputParam().set(<name>, <expr>, <descr>);
```

where the description *<descr>* can be omitted.

Similarly, add a local parameter by

```
model.geom(<tag>).localParam().set(<name>, <expr>, <descr>);
```

The containers model.component(*<ctag>*).geom(*<tag>*).inputParam() and model.component(*<ctag>*). geom(*<tag>*).localParam() also support the other methods listed in model.param() and model.result(). param().

To add a local function of the type *<type>*, enter

```
model.geom(<tag>).func().create(<ftag>,<type>);
```

See model.func() for more information. To return a list of all local functions, enter

```
model.geom(<tag>).func();
```

![](_page_34_Picture_14.jpeg)

The Finalize feature is optional for geometry parts but is necessary if you want to add virtual operations to the part sequence. It then needs to be created, as specified in Finalize.

To load one or more geometry parts, enter

```
model.geom().load(<tags>, <filename>, <partTagsInFile>);
```

where *<tags>* is a list of part tags, *<filename>* is the filename of the MPH-file where the parts are defined or a model location URI used to identify a model version in a Model Manager database, and *<partTagsInFile>* is a list of the parts' tags in that file. If model.geom(*<gtag>*) is a geometry part, model.geom(*<gtag>*).loaded() returns true if the part was created by loading it from a file.

To get the filename of a loaded part, enter

```
model.geom(<gtag>).filename();
```

To change the filename of a loaded part, enter

```
model.geom(<gtag>).filename(<filename>);
```

where *<filename>* is the new filename or a model location URI used to identify a model version in a Model Manager database.

For a loaded part, to return the comments from the MPH-file, enter

```
model.geom(<gtag>).commentsInFile();
```

For a loaded part, to return the last modification date from the MPH-file, enter

```
model.geom(<gtag>).dateModifiedInFile();
```

```
To get the tag that a loaded part has in the MPH-file, enter
  model.geom(<gtag>).tagInFile();
To get the label that a loaded part has in the MPH-file, enter
  model.geom(<gtag>).labelInFile();
For a loaded part, to return the version from the MPH-file, enter
  model.geom(<gtag>).versionInFile();
To reload (update) a loaded part after its definition has been changed, enter
  model.geom(<gtag>).reload();
To make keeping selections active by default in part instances, use
  model.geom(<gtag>).keepSelInInstances(true);
By default, this property is set to false. To see the current setting, use
  boolean keep = model.geom(<gtag>).keepSelInInstances();
To call a geometry part in a component geometry, add a PartInstance feature:
  model.component(<ctag>).geom(<gtag>).create(<ftag>, "PartInstance");
See PartInstance for details.
To debug a call to part, you can step into it using
  model.component(<ctag>).geom(<gtag>).stepInto(<ftag>);
You can then apply the usual geometry sequence methods on the local part instance, for example,
  model.component(<ctag>).geom(<gtag>).feature(<ftag>).geom().run(<ftag2>);
to build the feature <ftag2> in the local part instance.
To make the part a part variant, enter
  model.geom(<tag>).partVariant(true);
To check if the part is a part variant, enter
  model.geom(<tag>).partVariant();
```

