# *model.geom()*

Creating and specifying general properties for 1D, 2D, and 3D geometries.

![](_page_105_Picture_2.jpeg)

For more information about the different methods, see Geometry.

#### **SYNTAX**

```
model.component(<ctag>).geom().create(<tag>,<sdim>);
model.component(<ctag>).geom().create(<tag>,<meshtag>,<filename>);
model.component(<ctag>).geom(<tag>).model(<mtag>);
model.component(<ctag>).geom(<tag>).model();
model.component(<ctag>).geom(<tag>).axisymmetric(boolean);
model.component(<ctag>).geom(<tag>).isAxisymmetric();
model.component(<ctag>).geom(<tag>).lengthUnit(<unit>);
model.component(<ctag>).geom(<tag>).lengthUnit();
model.component(<ctag>).geom(<tag>).angularUnit(<unit>);
model.component(<ctag>).geom(<tag>).angularUnit();
model.component(<ctag>).geom(<tag>).scaleUnitValue(boolean);
model.component(<ctag>).geom(<tag>).scaleUnitValue();
model.component(<ctag>).geom(<tag>).repairTol(<relTol>);
model.component(<ctag>).geom(<tag>).repairTol();
model.component(<ctag>).geom(<tag>).geomRep(geomrep);
model.component(<ctag>).geom(<tag>).geomRep();
model.component(<ctag>).geom().remove(<tag>);
model.component(<ctag>).geom(<tag>).create(<ftag>,type);
model.component(<ctag>).geom(<tag>).createAfter(<ftag>,<type>,<postag>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).create(<ftag2>,type);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property).selMethod;
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom().geomMethod;
model.component(<ctag>).geom(<tag>).feature(<ftag>).active(boolean);
model.component(<ctag>).geom(<tag>).feature(<ftag>).isActive();
model.component(<ctag>).geom(<tag>).feature().move(<ftag>,<position>);
model.component(<ctag>).geom(<tag>).feature().remove(<ftag>);
model.component(<ctag>).geom(<tag>).run(<ftag>);
model.component(<ctag>).geom(<tag>).runPre(<ftag>);
model.component(<ctag>).geom(<tag>).runCurrent();
model.component(<ctag>).geom(<tag>).run();
model.component(<ctag>).geom().run();
model.component(<ctag>).geom(<tag>).current();
model.component(<ctag>).geom(<tag>).feature(<ftag>).status();
model.component(<ctag>).geom(<tag>).feature(<ftag>).message();
model.component(<ctag>).geom(<tag>).objectNames();
model.component(<ctag>).geom(<tag>).feature(<ftag>).objectNames();
model.component(<ctag>).geom(<tag>).obj(<objname>).geomInfoMethod
model.component(<ctag>).geom(<tag>).geomInfoMethod
model.component(<ctag>).geom(<tag>).selection(<seltag>).selMethod;
model.component(<ctag>).geom(<tag>).measure().measurementMethod;
model.component(<ctag>).geom(<tag>).cleanup().cleanupMethod;
model.component(<ctag>).geom(<tag>).export(<filename>);
model.component(<ctag>).geom(<tag>).exportFinal(<filename>);
model.component(<ctag>).geom(<tag>).defeaturing(<tooltag>).defeaturingMethod;
model.component(<ctag>).geom(<tag>).feature(<ftag>).find();
model.component(<ctag>).geom(<tag>).feature(<ftag>).detail().selMethod;
model.component(<ctag>).geom(<tag>).insertFile(<filename>,<gtag>);
model.component(<ctag>).geom(<tag>).insertSequence(<mtag>,<gtag>);
model.component(<ctag>).geom().create(<tag>, "Subsequence", sDim);
model.component(<ctag>).geom(<tag>).inputParam().set(<name>, <expr>, <descr>);
```

```
model.component(<ctag>).geom(<tag>).localParam().set(<name>, <expr>, <descr>);
model.geom(<gtag>).create(<ftag>, "PartInstance");
model.geom(<gtag>).stepInto(<ftag>);
model.geom(<gtag>).feature(<ftag>).geom().run(<ftag2>);
```

The last group of syntaxes are only applicable for geometry subsequences (see Creating and Using Geometry Parts), but model.geom(*<gtag>*).feature(*<ftag>*).geom() also exists if *<ftag>* is a work plane feature.

```
model.geom().load(<tags>, <filename>, <subsequenceTagsInFile>);
model.geom(<gtag>).loaded();
model.geom(<gtag>).filename();
model.geom(<gtag>).filename(<filename>);
model.geom(<gtag>).tagInFile();
model.geom(<gtag>).dateModifiedInFile();
model.geom(<gtag>).commentsInFile();
model.geom(<gtag>).labelInFile();
model.geom(<gtag>).versionInFile();
model.geom(<gtag>).reload();
```

The last group of syntaxes are only applicable for geometry subsequences (see Creating and Using Geometry Parts).

#### **DESCRIPTION**

*Geometry Sequences and Geometry Objects*

model.component(*<ctag>*).geom(*<tag>*) returns a geometry sequence consisting of geometry features. The geometry sequence also contains geometry objects resulting from building the geometry sequence.

*Creating and Deleting a Geometry*

model.component(*<ctag>*).geom().create(*<tag>*,*<sdim>*) creates a geometry sequence of space dimension *<sdim>* and assigns it the tag *<tag>*.

model.component(*<ctag>*).geom().create(*<tag>*,*<meshtag>*,*<filename>*) creates a geometry sequence tagged *<tag>* and a corresponding meshing sequence tagged *<meshtag>*. The parameter *<filename>* specifies a file that contains a geometry or a mesh, and an import feature is inserted into the geometry or meshing sequence.

model.component(*<ctag>*).geom().remove(*<tag>*) deletes the geometry tagged *<tag>*.

*General Geometry Settings*

model.geom(*<tag>*).model(*<mtag>*) sets the model component node of the geometry *<tag>* to *<mtag>*.

String mtag = model.geom(*<tag>*).model() returns the model component node tag of the geometry.

model.component(*<ctag>*).geom(*<tag>*).axisymmetric(*boolean*) indicates if the geometry is axisymmetric. This is only applicable for 1D and 2D geometries.

model.component(*<ctag>*).geom(*<tag>*).isAxisymmetric() returns true if the geometry is axisymmetric and false otherwise.

model.component(*<ctag>*).geom(*<tag>*).lengthUnit(*<unit>*) sets the length unit.

String unit = model.component(*<ctag>*).geom(*<tag>*).lengthUnit() returns the length unit.

model.component(*<ctag>*).geom(*<tag>*).angularUnit(*<unit>*) sets the angular unit.

String unit = model.component(*<ctag>*).geom(*<tag>*).angularUnit() returns the angular unit.

model.component(*<ctag>*).geom(*<tag>*).scaleUnitValue(*boolean*) sets the geometry to scale property values when units are changed.

model.component(*<ctag>*).geom(*<tag>*).scaleUnitValue() returns true if the geometry is set to scale property values when units are changed.

model.component(*<ctag>*).geom(*<tag>*).repairTol(*<relTol>*) sets the default relative repair tolerance to use when creating new features.

double relTol = model.component(*<ctag>*).geom(*<tag>*).repairTol() returns the default relative repair tolerance.

model.component(*<ctag>*).geom(*<tag>*).geomRep(*geomrep*) sets the geometry representation to use in a 3D geometry. The *geomrep* string can be comsol, meaning the COMSOL kernel or cadps (requires the CAD Import Module), meaning the CAD kernel (Parasolid).

String geomrep = model.component(*<ctag>*).geom(*<tag>*).geomRep() returns the geometry representation.

model.component(*<ctag>*).geom(*<tag>*).useConstrDim(enable) enables or disables the constraints and dimensions functionality in a 2D geometry (requires the Design Module).

boolean enabled = model.component(*<ctag>*).geom(*<tag>*).useConstrDim() returns true if the constraints and dimensions functionality is enabled.

model.component(*<ctag>*).geom(*<tag>*).constrDimBuild(value) determines what constraint and dimension features to use when building a 2D geometry (requires the Design Module). Valid values are:

- **•** "all": All (enabled) constraint and dimension features are used. This is the default.
- **•** "none": No constraint and dimension features are used.
- **•** "uptotarget": All (enabled) constraint and dimension features up to the feature to build are used.

String value = model.component(*<ctag>*).geom(*<tag>*).constrDimBuild() returns the constraints and dimensions to use when building. The default is "all".

String status = model.component(*<ctag>*).geom(*<tag>*).constrDimStatus() gets a description of the overall status of the constraints and dimensions in a 2D geometry (requires the Design Module).

*Creating, Editing, Disabling, and Deleting Features*

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,*type*) adds a geometry feature *<ftag>* of type *type* to the geometry *<tag>*, after the current feature.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).set(*property*,*<value>*) sets a property in the geometry feature *<ftag>*. All data types listed in Table 2-4 are supported; the applicable data types differ between the properties. String expressions can use parameters from model.param().

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).get*Type*(*property*) returns the value of a property in the geometry feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection(*property*).*selMethod* manages the geometry object selection property *property*. The available selection methods are described in Geometry Object Selection Methods.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).geom().geomMethod manipulates the 2D geometry sequence corresponding to the work plane feature *<ftag>*. The available methods are the same as for a 2D geometry model.geom(*<gtag>*).

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).active(false) disables the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).active(true) enables the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).isActive() returns true if the feature *<ftag>* is enabled, and false otherwise.

model.component(*<ctag>*).geom(*<tag>*).feature().remove(*<ftag>*) removes the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature().move(*<ftag>,<position>*) moves the feature *<ftag>* to the zero indexed position *<position>* in the sequence.

String[] remaining = model.component(*<ctag>*).geom(*<tag>*).deleteEdges(*<objname>*, *<edges>*) deletes the given edges from the given object in a 2D geometry by using a combination of the following methods:

- **•** Removing the corresponding geometry feature.
- **•** Removing points from a Polygon feature.
- **•** Splitting a Polygon or Composite Curve feature into several features.
- **•** Adding a Delete Entities feature.

The return array contains the tags of the remaining (if any) and created (if any) features.

## *Getting Tags of Named Selections*

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).componentSelection() returns tags of selection output objects for use in selections in the component *<ctag>*. It returns an empty string array if there are no defined selections.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).outputSelection() returns tags of selection output objects for use in selections in the geometry sequence *<tag>*. It returns an empty string array if there are no defined selections.

#### *Building Features*

After each build operation, the current feature is set as the last of the active features that were built. The current state contains all objects that are generated by these features.

model.component(*<ctag>*).geom(*<tag>*).run(*<ftag>*) builds all features up to (and including) the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).runPre(*<ftag>*) builds all features preceding the feature *<ftag>*; for example, with *<ftag>* being a work plane feature in a 3D geometry, model.geom(*<tag>*).runPre(*<ftag>*) builds all 3D geometry features preceding the work plane.

model.component(*<ctag>*).geom(*<tag>*).runCurrent() builds all features up to (and including) the current feature.

model.component(*<ctag>*).geom(*<tag>*).run() builds all features. The finalized geometry and all selections are also updated.

model.component(*<ctag>*).geom().run() builds the finalized geometry in all geometries.

## *Getting Build Status*

String fTag = model.component(*<ctag>*).geom(*<tag>*).current() returns the tag of the current feature. If the current state is before the first feature, the empty string "" is returned.

String status = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).status() returns the status of the feature *<ftag>*. The status is built, warning, needs\_rebuild, edited, or error.

String msg = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).message() returns the warning/error message of the feature *<ftag>*.

*Getting Information About Geometry Objects*

String[] n = model.component(*<ctag>*).geom(*<tag>*).objectNames() returns the names of all objects that exist in the current state.

String[] n = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).objectNames() returns the names of the output object generated by the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).obj(*<objname>*).*geomInfoMethod* returns information about the object *<objname>*. The available methods are described in Geometry Object Information.

model.component(*<ctag>*).geom(*<tag>*).*geomInfoMethod* returns information about the finalized geometry of geometry *<tag>*.

*Getting Information About Named Selections*

model.component(*<ctag>*).geom(*<tag>*).selection(*<seltag>*).*selMethod* returns information about the named selection *<seltag>*. See Selections of Geometric Entities and Geometry Object Selection Methods for more information.

## *Geometric Measurements*

Use model.component(*<ctag>*).geom(*<tag>*).measure().selection().*selMethod* to specify the domains, boundaries, or edges in geometry objects that you want to measure. You can also specify one, two, or several vertices to get the coordinates of the vertex, the distance between the two vertices, or the average coordinates of the vertices, respectively. The available selection methods are described in Geometry Object Selection Methods.

model.component(*<ctag>*).geom(*<tag>*).measure().*measurementMethod* returns the volume, area, length, vertex coordinates, or distance between two vertices according to the selection. The available measurement methods are described in Measurement Methods.

Use model.component(*<ctag>*).geom(*<tag>*).measure().*getBoundingBox* to return the bounding box of the selected geometry objects or entities. They are returned as a double array of [xmin, xmax, ymin, ymax, …] depending on the space dimension.

## *Exporting Geometry Objects*

model.component(*<ctag>*).geom(*<tag>*).export().selection().*selMethod* can be used to select a number of geometry objects to export to file. The available selection methods are described in Geometry Object Selection Methods.

model.component(*<ctag>*).geom(*<tag>*).export(<*filename>*) exports the selected objects to a file.

model.component(*<ctag>*).geom(*<tag>*).exportFinal(<*filename>*) exports the finalized geometry to a file.

