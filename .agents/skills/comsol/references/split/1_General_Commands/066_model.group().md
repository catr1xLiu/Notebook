# *model.group()*

Add load groups and constraint groups.

#### **SYNTAX**

```
model.group().create(<tag>,type);
model.group(<tag>).identifier(<id>);
model.group(<tag>).type();
model.group(<tag>).identifier();
```

#### **DESCRIPTION**

model.group().create(*<tag>,type*) creates a new group of the specified type, which can be either LoadGroup or ConstraintGroup.

model.group(*<tag>*).identifier(*<id>*) sets the group identifier, which is used for defining a corresponding parameter, group.<id>.

model.group(*<tag>*).type() returns the group type as a string.

model.group(*<tag>*).identifier() returns the group identifier.

*model.init()*

Creating and defining initial values.

#### **SYNTAX**

```
model.init().create(<tag>);
model.init(<tag>).set(<fieldname>,<expr>);
model.init(<tag>).remove(<fieldname>);
model.init(<tag>).varnames();
model.init(<tag>).get(<fieldname>);
```

## **DESCRIPTION**

model.init().create(*<tag>*) creates a new initial value with tag *<tag>*.

model.init(*<tag>*).set(*<fieldname>*,*<expr>*) defines the expression *<expr>* as the initial value for the dependent variable (field variable) *<fieldname>*.

model.init(*<tag>*).remove(*<fieldname>*) removes the field variable *<fieldname>* from the initial value with tag *<tag>*.

model.init(*<tag>*).selection().named(*<seltag>*) assigns the initial value to the named selection *<seltag>*. model.init(*<tag>*).selection().set(...) defines a local selection that assigns the initial value to geometric entities. For a complete list of methods available under selection(), see Selections. Only selections at a single geometry level is allowed except for ODE states which require the global selection.

model.init(*<tag>*).varnames() returns the names of the variables for the initial value with tag *<tag>* as a string array.

model.init(*<tag>*).get(*<fieldname>*) returns the initial value for the field variable *<fieldname>* as a string. model.init(*<tag>*).selection().named() returns the named selection tag.

model.init(*<tag>*).selection().get*Type*() returns domain information for the initial value with tag *<tag>*; see Selections for available methods.

```
model.intRule()
```

Integration rules.

## **SYNTAX**

```
model.intRule().create(<tag>,<ftag>);
model.intRule(<tag>).frame(<ftag>);
model.intRule(<tag>).create(<ftag>);
model.intRule(<tag>).feature(<ftag>).order(gporder);
model.intRule(<tag>).frame();
```

### **DESCRIPTION**

model.intRule().create(*<tag>*,*<ftag>*) creates an integration rule for the frame *<ftag>*.

model.intRule(*<tag>*).frame(*<ftag>*) sets the frame for the integration rule.

model.intRule(*<tag>*).create(*<ftag>*) creates an integration rule feature.

model.intRule(*<tag>*).feature(*<ftag>*).order(*gporder*) specifies the integration order of the integration rule.

model.intRule(*<tag>*).frame() returns the frame as a string.

#### **EXAMPLE**

Specify two integration rules, one with the integration order 2 and one with the integration order 4.

```
Code for Use with Java
  model.intRule().create("ir1","f");
  model.intRule("ir1").create("ir1").order(2);
  model.intRule("ir1").create("ir2").order(4);
Code for Use with MATLAB
  model.intRule.create('ir1','f');
  model.intRule('ir1').create('ir1').order(2);
  model.intRule('ir1').create('ir2').order(4);
```

## **SEE ALSO**

model.shape()

*model.massProp()*

Compute mass properties and add mass contributions.

