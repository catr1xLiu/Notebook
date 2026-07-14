# Inserting Geometry Sequences from File

To insert a geometry sequence from an MPH-file, enter

```
model.component(<ctag>).geom(<tag>).insertFile(<filename>, <sequencename>);
```

where *<filename>* and *<sequencename>* are strings. The *<filename>* can also be a model location URI used to identify a model version in a Model Manager database.

To insert a geometry sequence from a different model component, enter

```
model.component(<ctag>).geom(<tag>).insertSequence(<ctag2>, <sequencename>);
where <ctag2> and <sequencename> are strings.
```

*Example of Importing Geometry Sequences*

The following sequence imports three different geometry sequences from two different files:

```
Code for Use with Java
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("g", 2);
  g.insertFile("filename", "geom1");
  ModelUtil.load("Model2", "filename2");
  g.insertSequence("Model2", "geom1/wp1");
  g.insertSequence("Model2", "geom1/wp2");
Code for Use with MATLAB
  model.component.create('comp1');
  g = model.geom.create('g', 2);
  g.insertFile('filename', 'geom1');
  ModelUtil.load('Model2', 'filename2');
  g.insertSequence('Model2', 'geom1/wp1');
  g.insertSequence('Model2', 'geom1/wp2');
```

