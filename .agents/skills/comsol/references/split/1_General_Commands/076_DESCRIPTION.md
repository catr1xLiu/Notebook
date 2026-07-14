# **DESCRIPTION**

```
model.component(<ctag>).pair().create(<tag>,type,<gtag>) creates a pair with tag <tag> in the 
geometry with tag <gtag> in the component with tag <ctag>. The type type is Contact, Identity, or 
SectorSymmetry. model.component(<ctag>).pair(<tag>).type() returns the pair type as a string. 
model.component(<ctag>).pair(<tag>).type(type) changes the pair type.
model.component(<ctag>).pair(<tag>).pairName(<pname>) sets the pair name, which is used as a suffix in 
operator names and variable names. By default, the pair name is the same as the tag. 
model.component(<ctag>).pair(<tag>).pairName() returns the pair name.
model.component(<ctag>).pair(<tag>).source().named(<seltag>) assigns the source boundaries to the 
named selection <seltag>. 
model.component(<ctag>).pair(<tag>).source().set(...) defines a local selection that assigns the source 
boundaries to geometric entities. For a complete list of methods available under 
model.component(<ctag>).pair(<tag>).source(), see model.selection().
model.component(<ctag>).pair(<tag>).destination().named(<seltag>) assigns the destination 
boundaries to the named selection <seltag>.
```

model.component(*<ctag>*).pair(*<tag>*).destination().set(...) defines a local selection that assigns the destination boundaries to geometric entities. For a complete list of methods available under model.component(*<ctag>*).pair(*<tag>*).destination(), see model.selection().

model.component(*<ctag>*).pair(*<tag>*).swap() swaps the source and destination selections.

model.component(*<ctag>*).pair(*<tag>*).srcFrame(*<frame>*) and

model.pair(*<tag>*).dstFrame(*<frame>*) sets the source and destination frames for the identity mapping; the srcFrame property is also available for the frame setting for sector symmetry pairs. Manual control of frames is automatically activated when these methods are used. The argument *<frame>* can have the values geometry, material, mesh or spatial. The default is spatial. These frames are only used for identity pairs.

model.component(*<ctag>*).pair(*<tag>*).srcFrame() and

model.component(*<ctag>*).pair(*<tag>*).dstFrame() returns the frame tags.

model.component(*<ctag>*).pair(*<tag>*).hasAutoSelection() returns true if the contact pair was created automatically, using the create pairs checkbox in the finalize geometry node.

model.component(*<ctag>*).pair(*<tag>*).manualFrame(*manual*) enables or disables manual control of the frames for source and destination of an identity pair. The argument *manual* is a boolean.

model.component(*<ctag>*).pair(*<tag>*).manualFrame() returns true if manual control of frames is enabled, and false otherwise. Note that model.component(*<ctag>*).pair(*<tag>*).srcFrame(*<frame>*) and model.component(*<ctag>*).pair(*<tag>*).dstFrame(*<frame>*) enables manual control of frames.

model.component(*<ctag>*).pair(*<tag>*).manualSelection(*manual*) enables or disables manual control of the selections for a pair that was created automatically.

model.component(*<ctag>*).pair(*<tag>*).manualSelection() returns true if manual control of selections is enabled, and false otherwise.

model.component(*<ctag>*).pair(*<tag>*).searchMethod(*method*) sets the search method for a contact pair. The argument *method* can be hierarchical, fast, or direct. The default is hierarchical in 2D and 3D and fast in 1D, where hierarchical is not available.

model.component(*<ctag>*).pair(*<tag>*).searchMethod() returns the search method.

model.component(*<ctag>*).pair(*<tag>*).manualDist(*manual*) enables or disables manual control of the search distance for a pair. The argument *manual* is a boolean. The default value false means that the search distance is determined automatically. model.component(*<ctag>*).pair(*<tag>*).manualDist() returns true if manual control of search distance is enabled and false otherwise.

model.component(*<ctag>*).pair(*<tag>*).searchDist(*<dist>*) sets the search distance for a contact or identity pair when manual control of the search distance is enabled. The argument *<dist>* is a string whose default unit is the geometry's length unit. The default is 1e-2.

model.component(*<ctag>*).pair(*<tag>*).searchDist() returns the search distance as a string.

model.component(*<ctag>*).pair(*<tag>*).opName(*src2dst*) returns the name of the operator transferring an expression from source to destination (if *src2dst*=true) or from destination to source (if *src2dst*=false).

model.component(*<ctag>*).pair(*<tag>*).mphOpName(*src2dst*) returns the name of the multiphysics operator transferring an expression from source to destination (if *src2dst*=true) or from destination to source (if *src2dst*=false). When the test operator is applied on this operator, it does not give any contribution (reaction force) for the structural mechanics interfaces' degrees of freedom due to the variable point mapping. These operators are available only for contact pairs.

model.component(*<ctag>*).pair(*<tag>*).gapName(*src2dst*) returns the name of the geometric gap variable seen from the destination (if *src2dst*=true) or seen from the source (if *src2dst*=false). These variables are available only for contact pairs.

model.component(*<ctag>*).pair(*<tag>*).elementwise(*mapping*) controls the element mapping for compatible meshes. *mapping* can be on, off, or require, where you use the last option to require compatible meshes.

model.component(*<ctag>*).pair(*<tag>*)).compatibleMeshesTol(*tol*) provides the ability to specify a userdefined relative tolerance *tol* for compatible meshes, if the elementwise property is set to on or require. The default tolerance is 0.001.

model.component(*<ctag>*).pair(*<tag>*)).manualSectorSymmetry(*boolean*) specifies if the sector symmetry settings are set automatically (if false) or manually (if true) for sector symmetry pairs. If set to true, the following three properties are available:

model.component(*<ctag>*).pair(*<tag>*)).nSector(*integer*) specifies the number of sector for sector symmetry pairs.

model.component(*<ctag>*).pair(*<tag>*)).basePoint(*string[]*) species the axis base point for the rotation for sector symmetry pairs. Give an *x*-coordinate in 1D, *x*- and *y*-coordinates in 2D, and *x*-, *y*-, and *z*-coordinates in 3D.

model.component(*<ctag>*).pair(*<tag>*)).axis(*string[]*) species the axis of rotation for sector symmetry pairs in 3D. Give the *x*-, *y*-, and *z*-coordinates.

model.component(*<ctag>*).pair(*<tag>*)).extTol(*tol*) species the extrapolation tolerance for sector symmetry pairs.

model.component(*<ctag>*).pair(*<tag>*).active(*boolean*) enables or disables the pair.

boolean enabled = model.component(*<ctag>*).pair(*<tag>*).isActive() returns true if the pair is enabled, and false otherwise.

model.component(*<ctag>*).pair().remove(*<tag>*) deletes the pair.

#### **EXAMPLE**

Create a contact pair in the geometry geom1 with source boundaries 4 and 6 and destination boundaries 10 and 12.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.create("blk2", "Block");
  g.feature("blk2").set("pos", new String[]{"0.5", "0.5", "1"});
  g.feature("fin").name("Form Assembly");
  g.feature("fin").set("action", "assembly");
  g.feature("fin").set("imprint", true);
  g.feature("fin").set("createpairs", false);
  g.run();
  model.component("comp1").pair().create("p1", "Contact", "geom1");
  model.component("comp1").pair("p1").source().set(new int[]{4, 6});
  model.component("comp1").pair("p1").destination().set(new int[]{10, 12});
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.create('blk2', 'Block');
  g.feature('blk2').set('pos', {'0.5', '0.5', '1'});
  g.feature('fin').name('Form Assembly');
  g.feature('fin').set('action', 'assembly');
```

```
g.feature('fin').set('imprint', true);
  g.feature('fin').set('createpairs', false);
  g.run;
  model.component('comp1').pair.create('p1', 'Contact', 'geom1');
  model.component('comp1').pair('p1').source().set([4, 6]);
  model.component('comp1').pair('p1').destination.set([10, 12]);
model.param() and model.result().param()
```

Add, define, and remove global parameters. For parameters in results and postprocessing, model.result().param() works in the same way as model.param().

#### **SYNTAX**

```
model.param().set(<param>,<expr>);
model.param().set(<param>,<expr>,<descr>);
model.param().descr(<param>,<descr>);
model.param().remove(<param>);
model.param().clear();
model.param().varnames();
model.param().get(<param>);
model.param().descr(<param>);
model.param().evaluate(<param>);
model.param().evaluateComplex(<param>);
model.param().evaluateUnit(<param>);
model.param().loadFile(tempFile, ...);
model.param().saveFile(tempFile, ...);
model.param(<ptag>).setShowInParamSel(true|false);
model.param(<ptag>).paramCase().create(<pctag>);
model.param(<ptag>).paramCase(<pctag>).set(<param>,<expr>);
model.param(<ptag>).setFromCase(<param>,<pctag>);
```

The last four syntaxes above are only applicable for global parameters and not for parameters in the results.

## **DESCRIPTION**

model.param() is a collection of global model parameters. Likewise, model.result().param() is a collection of model parameters for results and postprocessing.

```
model.param().set(<param>,<expr>) defines the parameter <param> as <expr>.
```

model.param().set(*<param>*,*<expr>*,*<descr>*) defines the parameter *<param>* as *<expr>* and assigns it the description *<descr>*.

model.param().descr(*<param>*,*<descr>*) sets the description for the parameter *<param>*.

model.param().remove(*<param>*) removes the parameter *<param>*. model.param().clear() removes all parameters.

model.param().varnames() returns the names of all parameters as a string array.

model.param().get(*<param>*) returns the parameter value as a string.

model.param().descr(*<param>*) returns the parameter description as a string.

model.param().evaluate(*<param>*) evaluates the value of the parameter *<param>* as a double real-valued floating-point value. For complex-valued parameters, use the evaluateComplex method instead.

model.param().evaluateComplex(*<param>*) evaluates the value of the parameter *<param>* as a double floatingpoint array with the real and imaginary part of a complex-valued parameter.

model.param().evaluateUnit(*<param>*) returns the unit of the parameter *<param>* if defined. It returns null if the parameter has no unit defined, or if the model does not use any unit system.

For model.param().loadFile() and model.param().saveFile(), see The loadFile and saveFile Methods.

Use model.param(*<ptag>*).setShowInParamSel(false); to exclude the parameters in the global parameter set in *<ptag>* in parameter selections. The default is that setShowInParamSel is true; that is, all the parameters are included in parameter selections.

model.param(*<ptag>*).paramCase().create(*<pctag>*) creates a parameter case for a set of global parameters *<ptag>*. You can create several parameter cases, where you can use the .set(*<param>*,*<expr>*); syntax to specify another expression for any existing parameter <param>. Then use

model.param(*<ptag>*).setFromCase(*<param>*,*<pctag>*); to specify the parameter case *<pctag>* as the source for the value of the parameter *<param>*.

#### **EXAMPLE**

Define the parameter c in terms of another parameter a and then remove c.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.param().set("c","1+a");
  model.param().remove("c");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.param.set('c','1+a');
  model.param.remove('c');
SEE ALSO
model.variable()
model.physics()
```

Create and define properties for a physics interface.

#### **SYNTAX**

```
model.component(<ctag>).physics().create(<tag>,physint);
model.component(<ctag>).physics().create(<tag>,physint,<geomtag>);
model.component(<ctag>).physics().create(<tag>,physint,<geomtag>,<varnames>);
model.component(<ctag>).physics(<tag>).model(<mtag>);
model.component(<ctag>).physics(<tag>).field(fieldname).fieldname(<namelist>);
model.component(<ctag>).physics(<tag>).field(fieldname).fieldname(<pos>,<name>);
model.component(<ctag>).physics(<tag>).prop(propname).set(property,<value>);
model.component(<ctag>).physics(<tag>).create(<ftag>,feature);
model.component(<ctag>).physics(<tag>).create(<ftag>,feature,<dim>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).create(<ftag2>,feature);
model.component(<ctag>).physics(<tag>).feature(<ftag>).create(<ftag2>,feature,<dim>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).physics(<tag>).feature().move(<ftag>,<position>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).feature();
model.component(<ctag>).physics(<tag>).feature(<ftag>).feature(<ftag2>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).featureInfo();
model.component(<ctag>).physics(<tag>).feature(<ftag>).featureInfo("info");
feature = model.component(<ctag>).physics(<tag>).feature(<ftag>);
feature.featureInfo("info").set(variable,<value>);
feature.featureInfo("info").getInfoTable(id);
model.component(<ctag>).physics(<tag>).model();
model.component(<ctag>).physics(<tag>).field(fieldname).fieldname();
model.component(<ctag>).physics(<tag>).scope();
model.component(<ctag>).physics(<tag>).geom();
model.component(<ctag>).physics(<tag>).image();
model.component(<ctag>).physics(<tag>).prop(propname).getType(<pname>);
model.component(<ctag>).physics(<tag>).prop(propname).param();
model.component(<ctag>).physics(<tag>).feature(<ftag>).getType(<pname>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).param();
model.component(<ctag>).physics(<tag>).feature(<tag>).set(String pname, int value);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      set(String pname, int pos, int value);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      set(String pname, int pos, int[] value);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      set(String pname, int pos1, int pos2, int value);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String[] value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, double value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, double value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, double[] value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).setIndex(String name, int value, int 
  index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, int value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, int[] value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).importData();
model.component(<ctag>).physics(<tag>).feature(<tag>).discardData();
```

```
model.component(<ctag>).physics(<tag>).feature(<tag>).image();
model.component(<ctag>).physics(<tag>).prop(<tag>).set(String pname, int value);
model.component(<ctag>).physics(<tag>).prop(<tag>).set(String pname, int pos, int value);
model.component(<ctag>).physics(<tag>).prop(<tag>).set(String pname, int pos, int[] value);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      set(String pname, int pos1, int pos2, int value);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, String value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, String[] value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, double value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, double value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, double[] value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, int value, int index);
model.physics(<tag>).prop(<tag>).setIndex(String name, String value, int index);
model.physics(<tag>).prop(<tag>).setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, int value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, int[] value, int index);
```

The set() methods index/position arguments are 1-based. The setIndex() methods index/position arguments are 0-based. See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

## **DESCRIPTION**

model.component(*<ctag>*).physics().create(*<tag>*,*physint*) creates and returns a physics interface.

```
model.component(<ctag>).physics().create(<tag>,physint) or
```

model.component(*<ctag>*).physics().create(*<tag>*,*physint*,*<geomtag>*) adds a physics interface to the model and initializes it with defaults. The *physint* argument specifies which physics interface to create. There can be several different values of *physint* which create the same internal physics interface class, but which set different defaults. The constructor without the *<geomtag>* argument can only be used (and should be used) by 0D (spaceindependent) interfaces.

model.component(*<ctag>*).physics().create(*<tag>*,*physint*,*<geomtag>*,*<varnames>*) adds an interface with the field variable names *<varnames>*. Only interfaces supporting a varying number of field variables considers this argument. Providing the variable names in the create method rather than changes them afterward using model.component(*<ctag>*).physics(*<tag>*).field(*fieldname*).fieldname(*<namelist>*) ensures that the default features are correct.

model.component(*<ctag>*).physics(*<tag>*).field(*fieldname*).fieldname(*<namelist>*) sets a name of a dependent variable. The entity *fieldname* (which could be, for example, temperature, x-velocity, electric field) specifies which dependent variable to set the name for. The available fields are provided by the physics interface. The argument *<namelist>* can be a list of names for physics interfaces supporting an arbitrary number of dependent variables. The physics interfaces provide default names for the dependent variables.

model.component(*<ctag>*).physics(*<tag>*).field(*fieldname*).fieldname(*<pos>*,*<name>*) changes the name at position *<pos>* in the list of field names.

model.component(*<ctag>*).physics(*<tag>*).selection().named(*<seltag>*) specifies that the physics interface is active on the named selection *<seltag>*.

model.component(*<ctag>*).physics(*<tag>*).selection().set(...) defines a local selection that makes the physics interface active on the selection's geometric entities. For a complete list of methods available under selection(), see Selections.The selection must apply to the physics interface's maximum geometry level. The create() method makes the physics interface active in all domains. 0D interfaces are always active globally and do not support these methods.

model.component(*<ctag>*).physics(*<tag>*).prop(*propname*).set(*pname*,*<value>*) sets the value of some property parameter. All string types listed in Table 2-4 are supported.

model.component(*<ctag>*).physics(*<tag>*).create(*<ftag>*,*feature*) adds a new feature instance to the physics interface and initializes the feature with defaults. The available features are given by the physics interface.

model.component(*<ctag>*).physics(*<tag>*).create(*<ftag>*,*feature*,*<dim>*) adds a new feature instance to the physics interface and initializes the feature with defaults. The feature is assigned to the domain level *<dim>*. Use this constructor for features which can be applied to more than one domain level. The constructor without the *<dim>* argument assigns the feature to the highest domain level, which the feature supports.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).set(*pname*,*<value>*) sets a parameter value. All string types listed in the section Table 2-4 are supported.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).selection().named(*<seltag>*) assigns the physics feature to the named selection *<seltag>*.

model.component(*<ctag>*).physics(*<tag>*).selection().set(...) defines a local selection that assigns the physics feature to geometric entities. For a complete list of methods available under selection(), see Selections. 0D features need no domain selection.

model.component(*<ctag>*).physics(*<tag>*).feature().move(*<ftag>,<position>*) moves the feature *<ftag>* to the zero indexed position *<position>* in the list. A feature cannot be moved before a default feature and the default features cannot be moved.

model.component(*<ctag>*).physics(*<tag>*).create(*<itag>,*"init") creates an initial value feature, using the reserved feature ID init.

model.component(*<ctag>*).physics(*<tag>*).feature(*<itag>*).set(*varname*,*<value>*) specifies an initial value. The variable names are the field variables. For wave problems, the time derivatives of the field variables are also included in the list of variables.

model.component(*<ctag>*).physics(*<tag>*).model() returns the model component node tag of the interface.

model.component(*<ctag>*).physics(*<tag>*).field(*fieldname*).fieldname() returns the field names as a string array.

model.component(*<ctag>*).physics(*<tag>*).scope() returns the fully qualified scope name.

model.component(*<ctag>*).physics(*<tag>*).geom() returns the geometry tag as a string.

model.component(*<ctag>*).physics(*<tag>*).selection().named() returns the selection tag as a string.

model.component(*<ctag>*).physics(*<tag>*).selection().get*Type*() returns domain information. See Selections for available methods.

model.component(*<ctag>*).physics(*<tag>*).prop(*propname*).get*Type*(*pname*) returns the parameter value. See get\* and Selection Access Methods for available methods.

model.component(*<ctag>*).physics(*<tag>*).prop(*propname*).param() returns the parameter names as a string array.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).get*Type*(*<pname>*) returns the parameter value. See get\* and Selection Access Methods for available methods.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).param() returns the parameter names as a string array.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).selection().named() returns the selection tag as a string array.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).feature() returns the list of feature attributes. This list supports the same methods as model.component(*<ctag>*).physics(*<tag>*).feature().

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).feature(*<ftag2>*) returns the feature attribute *<ftag2>*. The feature attributes support the same methods as model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).

model.component(*<ctag>*).physics(<tag>).feature(<ftag>).featureInfo() returns a list of info objects.

model.component(*<ctag>*).feature(<ftag>).featureInfo("info") returns the info object that contains information about the variables, weak expressions, and constraints that a feature generates. The model.component(*<ctag>*).physics(*<tag>*) and model.coordSystem(*<tag>*) objects also have this list that you access with model.component(*<ctag>*).physics(*<tag>*).featureInfo("info"). These objects do not support the set method, which only works for the object

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).

feature.featureInfo("info").set(*variable*,*<value>*) locks the named variable to the given expression. The expression must be given as a string array.

feature.featureInfo("info").getInfoTable(*id*) returns a table that lists all information about a certain table id. The supported IDs are Expression, Shape, Weak, and Constraint.

model.component(*<ctag>*).physics(*<tag>*).feature(<ftag>).importData() imports the file that the physics feature references into the model. This is only allowed for specific physics features that allow external files to be used, such as the Release from Data File feature for the particle tracing interfaces.

model.component(*<ctag>*).physics(*<tag>*).feature(<ftag>).discardData() Discards the external file imported by the importData() command. This only has an effect if importData() has been called previously for the physics feature. This is only allowed for specific physics features that allow external files to be used, such as the Release from Data File feature for the particle tracing interfaces.

#### **EXAMPLE**

This example creates an Electrostatics interface. It sets boundaries 3 and 8 to the ground potential and assigns the electric potential of 1 V at boundary 4.

When the physics interface is created a couple of default features are automatically added. One of them is the Charge Conservation feature, which has the tag ccn1. The relative permittivity is this feature is set to 1.

```
Code for Use with Java
```

```
model.component("comp1").physics().create("es","Electrostatics","geom1");
  model.component("comp1").physics("es").create("gnd1", "Ground", 2);
  model.component("comp1").physics("es").feature("gnd1").selection().set(new int[]{3, 8});
  model.component("comp1").physics("es").create("pot1", "ElectricPotential", 2);
  model.component("comp1").physics("es").feature("pot1").selection().set(new int[]{4});
  model.component("comp1").physics("es").feature("pot1").set("V0", "1");
  model.component("comp1").physics("es").feature("ccn1").set("epsilonr_mat", "userdef");
  model.component("comp1").physics("es").feature("ccn1").set("epsilonr", "1");
Code for Use with MATLAB
  model.component('comp1').physics.create('es','Electrostatics','geom1');
  model.component('comp1').physics('es').create('gnd1', 'Ground', 2);
  model.component('comp1').physics('es').feature('gnd1').selection().set([3, 8]);
  model.component('comp1').physics('es').create('pot1', 'ElectricPotential', 2);
```

```
model.component('comp1').physics('es').feature('pot1').selection.set(4);
  model.component('comp1').physics('es').feature('pot1').set('V0', '1');
  model.component('comp1').physics('es').feature('ccn1').set('epsilonr_mat', 'userdef');
  model.component('comp1').physics('es').feature('ccn1').set('epsilonr', '1');
COMPATIBILITY
From version 4.3 the methods
  model.physics(<tag>).feature(<ftag>).params();
  model.physics(<tag>).prop(propname).params();
are deprecated and replaced by the methods
  model.physics(<tag>).feature(<ftag>).param();
  model.physics(<tag>).prop(propname).param();
SEE ALSO
model.material(), model.study()
model.probe()
```

Create and defined properties for probes, which you can add to a model to monitor some quantity (real or complexvalued number) during a time-dependent, frequency-domain, or parametric simulation.

#### **SYNTAX**

```
model.probe().create(<tag>, type);
model.probe(<tag>).model(<mtag>);
model.probe(<tag>).set(property,<value>);
model.probe(<tag>).create(<etag>, etype);
model.probe(<tag>).feature(<etag>).set(eproperty,<evalue>);
model.probe(<tag>).genResult(String sol)
model.probe(<tag>).image()
DESCRIPTION
model.probe().create(<tag>,type) creates a probe of type type with tag <tag>.
model.probe(<tag>).model(<mtag>) sets the model component node to <mtag>.
model.probe(<tag>).set(property,<value>) set property to <value>.
```

model.probe(*<tag>*).selection(...) sets the selection for the probe. This is possible for the probes of the types Domain, Boundary, and Edge.

model.probe(*<tag>*).create(*<etag>*,*etype*) creates a point probe expression of type *etype* and tag *<tag>*.

model.probe(*<tag>*).feature(*<etag>*).set(*eproperty*,*<evalue>*) sets the property *eproperty* on the point probe expression *<etag>*.

model.probe(*<tag>*).genResult(String *sol*) where *sol* is a solver sequence tag. This function prepares for using a probe while solving or during postprocessing. The command is invoked automatically when a solver or study is run from the COMSOL Desktop for all active probes but needs to be invoked explicitly when run through the API. The function genResult(String *sol*) sets up result features for evaluating the corresponding probe using the solver sequence *sol*. If null is used, the default solver sequence for a solution dataset is used. When *sol* is none then the corresponding probe solution dataset does not refer to any solver sequence. This means, for example, that the current model is used for selections used for this probe. When a solver sequence is run, then solution to use for the probes is always reset to use the current solver.

Use the model.probe(<tag>).image() methods for plotting and exporting probe plot images. See Plotting and Exporting Images.

*Boundary Probes, Domain Probes, Edge Probes, Point Probes, Global Variable Probes, and Probe Point Expressions*

Probes can be of the following types:

TABLE 2-109: PROBE TYPES.

| TYPE           | DESCRIPTION                                                                                                                                                   |
|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Boundary       | Probe that defines a value as an integral, maximum, minimum, or average over boundaries.                                                                      |
| Domain         | Probe that defines a value as an integral, maximum, minimum, or average over domains.                                                                         |
| Edge           | Probe that defines a value as an integral, maximum, minimum, or average over edges (in 3D).                                                                   |
| Point          | Probe that defines a value as an integral, maximum, minimum, or average at points.                                                                            |
| GlobalVariable | Probe that defines a value using a global variable.                                                                                                           |
| PointExpr      | Probe that defines a value by interpolation of an expression in a probe point. The probe point is<br>defined by the parent, a DomainPoint or a BoundaryPoint. |

*Boundary Point Probes and Domain Point Probes*

Probe points can be of the following types:

TABLE 2-110: PROBE POINT TYPES.

| TYPE          | DESCRIPTION                                     |
|---------------|-------------------------------------------------|
| BoundaryPoint | Defines a probe coordinate on a boundary in 3D. |
| DomainPoint   | Defines a probe coordinate in a domain.         |

Probes take the following properties:

TABLE 2-111: PROBE PROPERTIES.

| NAME        | VALUE                                     | DEFAULT       | DESCRIPTION                                                                                                                          |
|-------------|-------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------|
| descr       | String                                    |               | Description of the probe. Used for<br>model.result().                                                                                |
| descractive | on   off                                  | off           | Manual control of description.                                                                                                       |
| expr        | String                                    |               | The expression defining the probe.                                                                                                   |
| frame       | String                                    | spatial frame | Frame used for defining the probe.                                                                                                   |
| intorder    | Integer                                   | 4             | Integration order, when method is set to<br>integration.                                                                             |
| intsurface  | boolean                                   | false         | Compute surface integral for1D axisymmetric<br>DomainProbe and 2D axisymmetric<br>BoundaryProbe average and integral probe<br>types. |
| intvolume   | boolean                                   | false         | Compute volume integral for 2D axisymmetric<br>DomainProbe average and integral probe types.                                         |
| lagrange    | String                                    | 2             | Lagrange order when points is set to<br>lagrange.                                                                                    |
| method      | integration  <br>summation                | integration   | Method used when type is set to average or<br>integral.                                                                              |
| pintorder   | String                                    | 4             | Integration rule when points is set to<br>integration.                                                                               |
| points      | node   integration<br>  lagrange          | node          | Type of point when type is set to maximum or<br>minimum.                                                                             |
| probename   | String                                    | probe tag     | Probe variable name.                                                                                                                 |
| table       | String                                    | default       | Table to use for probe evaluation.                                                                                                   |
| type        | average   maximum  <br>minimum   integral | average       | Type of probe (Domain, Boundary, Edge and<br>Point probes).                                                                          |

TABLE 2-111: PROBE PROPERTIES.

| NAME   | VALUE  | DEFAULT      | DESCRIPTION                                  |
|--------|--------|--------------|----------------------------------------------|
| unit   | String | unit of expr | Unit for the probe. Used for model.result(). |
| window | String | default      | The plot window to use for the probe.        |

A probe point of the type DomainPoint takes the following properties:

TABLE 2-112: PROBE PROPERTIES.

| NAME                | VALUE                                                 | DEFAULT     | DESCRIPTION                                                   |
|---------------------|-------------------------------------------------------|-------------|---------------------------------------------------------------|
| bndsnap1            | on   off                                              | off         | Snap to nearest point (1D).                                   |
| bndsnap2            | on   off                                              | off         | Snap to nearest boundary point (2D).                          |
| bndsnap3            | on   off                                              | off         | Snap to nearest boundary point (3D).                          |
| coords              | Matrix of doubles                                     |             | Probe coordinates.                                            |
| depthpointnormal    | double                                                | 0           | Depth along line defined by the<br>pointnormal method.        |
| depthpointdirection | double                                                | 0           | Depth along line defined by the<br>pointdirection method.     |
| depthtwopoints      | double                                                | 0           | Depth along line defined by the<br>twopoints method.          |
| dimension           | 1   2   3                                             | 3           | The spatial dimension in which the<br>point resides.          |
| first               | double array                                          |             | The coordinates of the first point on<br>the probe line.      |
| method              | pointnormal  <br>pointdirection  <br>twopoints   none | pointnormal | Line entry method.                                            |
| second              | double array                                          |             | The coordinates of the second point<br>(for method=twopoints) |
| twopointscurrent    | first   second                                        | first       | Point selector (for method=twopoints)                         |

A probe point of BoundaryPoint types take the following properties:

TABLE 2-113: PROBE PROPERTIES.

| NAME       | VALUE        | DEFAULT | DESCRIPTION                       |
|------------|--------------|---------|-----------------------------------|
| coords     | double array | 0,0,0   | Probe coordinates.                |
| rawcoords  | double array | 0,0,0   | Full precision probe coordinates. |
| snapcoords | double array | 0,0,0   | The boundary-snapped coordinates. |

