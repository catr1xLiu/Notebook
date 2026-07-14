# *Getting Tags of Selections*

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).componentSelection() returns tags of selection output objects for use in selections in the component *<ctag>*. It returns an empty string array if there are no defined selections.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).outputSelection() returns the tags of selections output objects for use in selections within the meshing sequence. It returns an empty string array if there are no defined selections.

#### *Getting and Setting Mesh Data*

model.component(*<ctag>*).mesh(*<tag>*).*meshGetMethod* gets mesh data from the mesh *<tag>*. The available methods are described in Accessing Mesh Data.

model.component(*<ctag>*).mesh(*<tag>*).data().*meshModificationMethods* are used to modify mesh data on a low level. You can access and modify individual elements. The available methods are described in Accessing Mesh Data.

model.component(*<ctag>*).mesh(*<tag>*).data().createMesh() transfers the modified data into to the mesh *<tag>*. See also Setting or Modifying Mesh Data.

*Mesh Statistics*

model.component(*<ctag>*).mesh(*<tag>*).stat().selection().*selMethod* can be used to select a number of geometric entities for which statistics is wanted. The available selection methods are described in Selection Methods.

model.component(*<ctag>*).geom(*<tag>*).stat().*meshStatisticsMethod* returns mesh statistics about the selected geometric entities. The available methods are described in Information and Statistics.

*Exporting a Mesh to File*

model.component(*<ctag>*).mesh(*<tag>*).export(*<filename>*) exports the mesh *<tag>* to an MPHBIN- or MPHTXT-file.

*Plotting a Mesh*

Use the model.component(<ctag>).mesh(<tag>).image() and

model.component(<ctag>).mesh(<tag>).feature().image() methods to plotting and exporting mesh images. See Plotting and Exporting Images.

*Selection Methods*

selection.allGeom() sets the selection to be the entire geometry (that is, all geometric entities).

selection.remaining() sets the selection to be the geometric entities that remains to be meshed when the feature is about to be built.

selection.geom(*<dim>*).all() sets all geometric entities in dimension *<dim>*.

selection.geom(*<dim>*).set(*<entities>*) sets the selection to be the geometric entities specified in the integer array *<entities>* in dimension *<dim>*.

selection.geom(*<dim>*).add(*<entities>*) adds the geometric entities specified in the integer array *<entities>* in dimension *<dim>* to the selection.

selection.geom(*<dim>*).remove(*<entities>*) removes the geometric entities specified in the integer array *<entities>* in dimension *<dim>* from the selection.

selection.geom(*<dim>*).clear() clears the selection.

To access the selections use:

int[] dims = selection.dimension() returns the geometric entity level in dims[0] for the entities in the selection. If dims is empty the selection defines the entire geometry.

selection.isRemaining() returns true if the selection specifies the remaining entities, otherwise false.

selection.dom(*<dim>*) returns the geometric entities in dimension *<dim>* for the selection.

*Getting the Geometry Tag*

model.mesh(*<tag>*).geom() returns the geometry tag. This can be useful when working with several geometries in the same model.

*Measuring the Geometric Entities*

model.component(<tag>).measure().*measurementMethod* returns the volume, area, length, vertex coordinates, average coordinates, or distance between two vertices according to the entity selection. For a list of the available measurement methods to use, see Measurement Methods. For information about how to select entities, see Selections.

#### **EXAMPLE**

Create a 2D geometry by the union of a circle and square. Build a triangle mesh with hmax = 0.1 in domains 1 and 3, and hmax = 0.01 in domain 2.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("c1", "Circle");
  g.create("sq1", "Square");
  g.create("uni1", "Union");
  g.feature("uni1").selection("input").set(new String[]{"c1", "sq1"});
  m.create("size1", "Size");
  m.feature("size1").selection().geom(2).set(new int[]{1, 3});
  m.feature("size1").set("hmax", "0.1");
  m.create("size2", "Size");
  m.feature("size2").selection().geom(2).set(new int[]{2});
  m.feature("size2").set("hmax", "0.025");
  m.create("ftri1", "FreeTri");
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('c1', 'Circle');
  g.create('sq1', 'Square');
  g.create('uni1', 'Union');
  g.feature('uni1').selection('input').set({'c1', 'sq1'});
  m.create('size1', 'Size');
  m.feature('size1').selection.geom(2).set([1, 3]);
  m.feature('size1').set('hmax', '0.1');
  m.create('size2', 'Size');
  m.feature('size2').selection.geom(2).set(2);
  m.feature('size2').set('hmax', '0.025');
  m.create('ftri1', 'FreeTri');
  m.run;
SEE ALSO
model.geom()
```

*model.methodCall()*

Calling model methods. You can create and run model methods to extend the functionality of a COMSOL Multiphysics simulation using custom methods. See the *Application Programming Guide* for more information about creating and using methods.

![](_page_131_Picture_6.jpeg)

The Model Java-file history for running a method call in the COMSOL Desktop contains the history produced while running the method call and not the method itself.

#### **SYNTAX**

```
model.methodCall().create(<tag>,<methodname>);
model.methodCall(<tag>).run();
model.methodCall(<tag>).inputNames();
model.methodCall(<tag>).methodName();
model.methodCall(<tag>).methods();
model.methodCall(<tag>).set(<param>,<expr>);
```

#### **DESCRIPTION**

model.methodCall(*<tag>*) represents a method call for a model method.

model.methodCall().create(*<tag>*,*<methodname>*) creates a method call for the model method *<methodname>* with the given tag.

model.methodCall(*<tag>*).inputNames(); returns the names of input parameters of a method reference by a given method call.

model.methodCall(*<tag>*).methodName returns the name of the method that the method call runs.

model.methodCall(*<tag>*).methods(); returns the names of all methods in the model.

model.methodCall(*<tag>*).run() runs the method call with the tag *<tag>*.

The following examples show how you can specify the names of an input parameter, the value of a 1D double array parameter, and the value of a boolean parameter:

```
model.methodCall(<tag>).set("paramname","p1");
model.methodCall(<tag>).set("paramvalues",new double[]{2.3 3.7 5.6 7.1 11.3 17.5});
model.methodCall(<tag>).set("sendmail",true);
```

Parameter names are created automatically with the appropriate types according to the inputs that have been specified in the method. This means that you can then use a natural set syntax as shown in the examples above.

## **ARGUMENTS TO METHOD CALLS**

The following table describes the names of arguments that you can use to change the value of inputs to a method call before running it:

TABLE 2-105: ARGUMENT NAMES FOR METHOD CALLS.

| ARGUMENT NAME      | SAMPLE VALUES     | DESCRIPTION                                                                                                                                                                                                   |
|--------------------|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| -methodinputnames  | size,times        | Comma-separated list of names of inputs (as strings) to change<br>for the method call to run.                                                                                                                 |
| -methodinputvalues | 0.8,{0.1,0.3,0.8} | Comma-separated list of the corresponding values. Arrays and<br>2D arrays are entered using curly braces.                                                                                                     |
| -methodinputfile   | Path to file      | A file to read the inputs to the method call from. This file has the<br>same format as the one used together with -appargsfile (see<br>the Application Builder documentation about application<br>arguments), |

Specifying method call inputs both from a file and individually on the command line can be combined. If an input is given both in a file and on the command line, the value given on the command line overrides the value given in the file. If a value is given several times in the file or on the command line, the last given value overrides any previous given value.

![](_page_132_Picture_17.jpeg)

To use units in values passed as arguments to -methodinputvalues, enclose them in single quotation marks. For example, "'500[m]','45[s]'"

#### **USING METHOD CALLS FROM A MODEL JAVA-FILE**

You can use the model method in a method call from a Model Java-file if the file starts by loading an MPH-file (including its model method) and then calls a run of a method call. However, in this context, model methods do not support user interface commands or file schema. The table below table lists user interface commands that are not supported:

TABLE 2-106: UNSUPPORTED USER INTERFACE COMMANDS IN MODEL JAVA-FILES.

| COMMAND             | RESULT                      |
|---------------------|-----------------------------|
| Alert               | Command is ignored          |
| Confirm             | Command causes an exception |
| DebugLog            | Command is ignored          |
| FileOpen            | Command causes an exception |
| FileSaveAs          | Command causes an exception |
| ImportFile          | Command causes an exception |
| Message             | Command is ignored          |
| OpenURL             | Command is ignored          |
| Request             | Command causes an exception |
| SelectNode          | Command is ignored          |
| SetProgress         | Command is ignored          |
| SetProgressInterval | Command is ignored          |
| ZoomExtents         | Command is ignored          |

#### **SEE ALSO**

model.form()

