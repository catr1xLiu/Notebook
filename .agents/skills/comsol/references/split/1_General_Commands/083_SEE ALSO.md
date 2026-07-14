# **SEE ALSO**

model.func()

*model.unitSystem()*

Unit systems.

#### **SYNTAX**

```
UnitSystem us = model.unitSystem().create(<tag>);
us.baseUnit().create(<tag>,<symbol>,<quantity>)
us.derivedUnit().create(<tag>,<units>,<powers>);
us.additionalUnit().create(<tag>,<dim>);
model.unitSystem().builtInTags();
us.baseUnit(<tag>);
us.derivedUnit(<tag>);
us.additionalUnit(<tag>)
us.derivedUnit(<tag>).aliases();
us.baseUnit(<tag>).dimension();
us.derivedUnit(<tag>).quantity();
us.derivedUnit(<tag>).offset();
us.derivedUnit(<tag>).scale();
us.derivedUnit(<tag>).symbol();
us.derivedUnit(<tag>).definition(<units>,<powers>);
us.additionalUnit(<tag>).aliases(<aliases>);
us.additionalUnit(<tag>).quantity(<quantity>);
us.additionalUnit(<tag>).offset(<offset>);
us.additionalUnit(<tag>).scale(<scale>);
us.additionalUnit(<tag>).offset(<offset>);
us.additionalUnit(<tag>).symbol(<symbol>);
```

#### **DESCRIPTION**

model.unitSystem().create(*<uname>*) creates a unit system *<uname>*.

us.baseUnit().create(*<tag>*,*<symbol>*,*<quantity>*) creates a base unit for the quantity *<quantity>*, tagged *<tag>* with the symbol *<symbol>*. The quantity is any of the seven base dimensions (length, mass, time, current, temperature, substance, and intensity).

us.derivedUnit().create(*<tag>*,*<units>*,*<powers>*) creates a new derived unit tagged *<tag>* and derived from the units in *<units>* each to the power of the powers in *<powers>*.

us.derivedUnit(*<tag>*).definition(*<units>*,*<powers>*) sets the definition of a derived unit in powers of other units. The resulting dimension must agree with any previously specified dimension for this unit. Use the create method to define a dimension from the derived units.

us.additionalUnit().create(*<tag>*,*<dim>*) creates a new additional unit.

All methods below are valid for all units, no matter what unit list they belong to. Furthermore, only the set methods are described here, but there is also a corresponding get method.

model.unitSystem().builtInTags() returns the tags of the built-in unit systems. The method model.unitSystem().tags() returns the tags of the user-defined unit systems. Both sets of tags can be used to retrieve the unit system using model.unitSystem(*<tag>*).

us.additionalUnit(*<tag>*).aliases(*<aliases>*) sets alternative names for the unit that can be used in unit expressions.

us.additionalUnit(*<tag>*).quantity(*<quantity>*) assigns a physical quantity to the given unit.

us.additionalUnit(*<tag>*).scale(*<scale>*) sets the scale of the additional unit.

us.derivedUnit(*<tag>*).symbol(*<symbol>*) sets the symbol of the derived unit.

us.derivedUnit(*<tag>*).offset(*<offset>*) sets the offset of the derived unit.

#### **NOTES**

You can set the base unit system for the entire model using model.baseSystem(*<utag>*) or separately for each component node using model.component(*<tag>*).baseSystem(*<utag>*).

The SI system is read only and always created by default.

#### **EXAMPLE**

Create a cgs2 unit system with the base unit for length set to centimeter (cm). Also add meter/second (m/s) as a derived unit for speed and degrees Celsius as an additional unit for temperature:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  UnitSystem us = model.unitSystem().create("cgs2");
  model.baseSystem("cgs2");
  us.baseUnit().create("centimeter","cm","length");
  us.derivedUnit().create("meter_per_second",new int[]{1,0,-1,0,0,0,0,0});
  Unit du = us.derivedUnit("meter_per_second");
  du.definition(new String[]{"meter","second"},new int[]{1,-1,0,0,0,0,0,0});
  Unit au = us.additionalUnit().create("celsius",new int[]{0,0,0,0,1,0,0,0});
  au.offset(273.15);
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  us = model.unitSystem.create('cgs2');
  model.baseSystem('cgs2');
  us.baseUnit.create('centimeter','cm','length');
  us.derivedUnit.create('meter_per_second',[1,0,-1,0,0,0,0,0]);
  du = us.derivedUnit('meter_per_second');
  du.definition({'meter','second'},[1,-1,0,0,0,0,0,0]);
  au = us.additionalUnit.create('celsius',[0,0,0,0,1,0,0,0]);
  au.offset(273.15);
SEE ALSO
model.physics()
model.variable()
```

Create, define, and remove variables.

## **SYNTAX**

```
model.variable().create(<tag>);
model.variable(<tag>).set(<var>,<expr>);
model.variable(<tag>).set(<var>,<expr>,<descr>);
model.variable(<tag>).descr(<var>,<descr>);
model.variable(<tag>).remove(<var>);
model.variable(<tag>).clear();
model.variable(<tag>).model(<mtag>);
model.variable(<tag>).varnames();
model.variable(<tag>).get(<var>);
model.variable(<tag>).descr(<var>);
model.variable(<tag>).model();
model.variable(<tag>).scope();
model.variable(<tag>).loadFile(tempFile, ...);
model.variable(<tag>).saveFile(tempFile, ...);
```

For variables on the component level, use

model.component(*<ctag>*).variable().create(*<tag>*), and so on, instead of the syntax above for global variables.

#### **DESCRIPTION**

model.variable(*<tag>*) returns a variable collection. Each variable collection can contain several variables, but only one selection.

```
model.variable().create(<tag>) creates a variables node with tag <tag>.
model.variable(<tag>).set(<var>,<expr>) defines the variable <var> by the expression <expr>.
model.variable(<tag>).set(<var>,<expr>,<descr>) defines a variable and gives it a description.
model.variable(<tag>).descr(<var>,<descr>) defines a description for the variable <var>.
model.variable(<tag>).model(<mtag>) sets the model component node.
model.variable(<tag>).selection().named(<seltag>) assigns the variable node to the named selection 
<seltag>. 
model.shape(<tag>).selection().set(...) defines a local selection that assigns the variable collection to 
geometric entities. Before assigning a selection, the variable's model must be set using 
model.variable(<tag>).model(<mtag>). Only the global selection and selections on a geometry in the model 
can be used. For a complete list of methods available under selection(), see Selections.
model.variable(<tag>).remove(<var>) removes a variable from the variable collection. 
model.variable(<tag>).clear() removes all variables from the variable collection.
model.variable(<tag>).varnames() returns the names of all expressions as a string array.
model.variable(<tag>).get(<var>) returns the variable value as a string.
model.variable(<tag>).descr(<var>) returns the variable description as a string.
model.variable(<tag>).model() returns the model component node tag.
model.variable(<tag>).scope() returns the fully qualified scope name.
model.variable(<tag>).selection().named() returns the selection tag as a string.
model.variable(<tag>).selection().getType() returns domain information. For available methods, see 
model.selection().
```

For model.param().loadFile() and model.param().saveFile(), see The loadFile and saveFile Methods.

#### **EXAMPLES**

Define the expression e as x+1 in Domains 1 and 2 and as x-1 in Domain 3.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1",3);
  model.component("comp1").geom("geom1").create("blk1", "Block");
  model.component("comp1").geom("geom1").run();
  model.component("comp1").variable().create("e1").set("e","x+1");
  model.component("comp1").variable("e1").selection().geom("geom1",2);
  model.component("comp1").variable("e1").selection().set(new int[]{1,2});
  model.component("comp1").variable().create("e2").set("e","x-1");
  model.component("comp1").variable("e2").selection().geom("geom1",2);
  model.component("comp1").variable("e2").selection().set(3);
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component.geom.create('geom1',3);
  model.component.geom('geom1').create('blk1', 'Block');
```

```
model.component.geom('geom1').run;
model.component.variable.create('e1').set('e','x+1');
model.component.variable('e1').selection.geom('geom1',2);
model.component.variable('e1').selection.set([1,2]);
model.component.variable.create('e2').set('e','x-1');
model.component.variable('e2').model('mod1');
model.component.variable('e2').selection().geom('geom1',2);
model.component.variable('e2').selection().set(3);
```

#### **SEE ALSO**

model.selection()

*model.view()*

Create and manage views.

![](_page_194_Picture_5.jpeg)

For views defined on the global level, under Results, omit component(*<ctag>*). from the syntax such as model.component(*<ctag>*).view().create(*<vtag>*,*<gtag>*) in the syntax examples below.

#### **SYNTAX**

```
model.component(<ctag>).view().create(<vtag>,<gtag>)
model.component(<ctag>).view().create(<vtag>,<viewdim>)
model.component(<ctag>).view().create(<vtag>,<gtag>,<workplane>)
model.component(<ctag>).view(<vtag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).axis().set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).axis().getType(<pname>)
model.component(<ctag>).view(<vtag>).camera().set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).camera().getType(<pname>)
model.component(<ctag>).view(<vtag>).copyToGeometry()
model.component(<ctag>).view(<vtag>).copyToWorkPlane()
model.component(<ctag>).view(<vtag>).geom()
model.component(<ctag>).view(<vtag>).getHiddenEntities()
model.component(<ctag>).view(<vtag>).getHiddenEntities(<mesh>)
model.component(<ctag>).view(<vtag>).getSDim()
model.component(<ctag>).view(<vtag>).isCurrent()
model.component(<ctag>).view(<vtag>).light().create(<ltag>,<ltype>)
model.component(<ctag>).view(<vtag>).light(<ltag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).light(<ltag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).hideObjects().create(<htag>)
model.component(<ctag>).view(<vtag>).hideObjects(<htag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).hideObjects(<htag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).hideEntities().create(<htag>)
model.component(<ctag>).view(<vtag>).hideEntities(<htag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).hideEntities(<htag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).hideEntities(<htag>).image()
model.component(<ctag>).view(<vtag>).hideMesh().create(<htag>)
model.component(<ctag>).view(<vtag>).hideMesh(<htag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).hideMesh(<htag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).hideMesh(<htag>).image()
```

