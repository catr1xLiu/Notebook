# **DESCRIPTION**

model.elementSet(*<tag>*) returns an element set. It contains one or several definitions of sets of mesh elements. Each element set is identified with an *element set variable* name — the variable evaluates to 1 on mesh elements that belong to the element set, and it evaluates to 0 on other mesh elements. The variable has a defining expression that is evaluated at the midpoint of each mesh element to determine whether the mesh element belongs to the element set. This evaluation is done once at the beginning of the solution process, so the expression must not depend on variables that change during the solution process. All element sets in model.elementSet(*<tag>*) are subsets of the selection model.elementSet(*<tag>*).selection().

```
model.elementSet().create(<tag>) creates a new element set with tag <tag>.
```

model.elementSet(*<tag>*).set(*<var>*,*<expr>*) sets the defining expression for the element set variable *<var>* to *<expr>*.

```
model.elementSet(<tag>).remove(<var>) removes the element set variable <var>.
```

```
model.elementSet(<tag>).model(<mtag>) sets the model component node.
model.elementSet(<tag>).selection().selMethod manipulates the geometric entity selection; see 
Selections for a description of the available methods.
model.elementSet(<tag>).varnames() returns all element set variables as a string array.
model.elementSet(<tag>).get(<var>) returns the defining expression of element set variable <var>.
model.elementSet(<tag>).model() returns the model component node tag.
model.elementSet(<tag>).scope() returns the fully qualified scope name.
```

## **EXAMPLE**

Let A be an element set consisting of all mesh triangles that are not adjacent to boundaries 3 or 4 in square, plus all mesh triangles that are adjacent to boundaries 1 or 2. Let the dependent variable u be defined on A. Solve Poisson's equation with Dirichlet conditions on boundaries 1 and 2:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1", 2);
  model.component("comp1").geom("geom1").create("sq1", "Square");
  model.component("comp1").mesh().create("mesh1", "geom1");
  model.component("comp1").mesh("mesh1").run();
  model.elementSet().create("es1");
  model.elementSet("es1").set("A", "!bndadj(3,4) || bndadj(1,2)");
  model.elementSet("es1").selection().geom(2).all();
  model.shape().create("sh1", "material1");
  model.shape("sh1").create("f1", "shlag");
  model.shape("sh1").feature("f1").set("basename", "u").set("order", 1);
  model.shape("sh1").selection().geom(2).all();
  model.shape("sh1").elementSet("A");
  model.field().create("field1", "u");
  model.field("field1").shape(new String[]{"sh1"});
  model.intRule().create("ir1", "material1");
  model.intRule("ir1").create("o2").order(2);
  model.weak().create("weak1");
  model.weak("weak1").weak("if(A,ux*test(ux)+uy*test(uy)-test(u),0)");
  model.weak("weak1").intRule("ir1");
  model.weak("weak1").selection().geom(2).all();
  model.constr().create("constr1", new String[]{"sh1"});
  model.constr("constr1").create("f1");
  model.constr("constr1").feature("f1").set("constr",1,new String[]{"u"});
  model.constr("constr1").feature("f1").set("constrf",1,new String[]{"test(u)"});
  model.constr("constr1").feature("f1").selection().geom(1).set(1,2);
  model.study().create("std1");
  model.study("std1").create("stat", "Stationary");
  model.study("std1").run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 2);
  model.component('comp1').geom('geom1').create('sq1', 'Square');
  model.component('comp1').mesh.create('mesh1', 'geom1');
  model.component('comp1').mesh('mesh1').run;
  model.elementSet.create('es1');
  model.elementSet('es1').set('A', '!bndadj(3,4) || bndadj(1,2)');
  model.elementSet('es1').selection().geom(2).all;
  model.shape.create('sh1', 'material1');
  model.shape('sh1').create('f1', 'shlag');
  model.shape('sh1').feature('f1').set('basename', 'u').set('order', 1);
```

```
model.shape('sh1').selection.geom(2).all;
model.shape('sh1').elementSet('A');
model.field.create('field1', 'u');
model.field('field1').shape({'sh1'});
model.intRule.create('ir1', 'material1');
model.intRule('ir1').create('o2').order(2);
model.weak.create('weak1');
model.weak('weak1').weak('if(A,ux*test(ux)+uy*test(uy)-test(u),0)');
model.weak('weak1').intRule('ir1');
model.weak('weak1').selection().geom(2).all;
model.constr.create('constr1', {'sh1'});
model.constr('constr1').create('f1');
model.constr('constr1').feature('f1').set('constr',1,{'u'});
model.constr('constr1').feature('f1').set('constrf',1,{'test(u)'});
model.constr('constr1').feature('f1').selection().geom(1).set([1,2]);
model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study('std1').run;
```

#### **SEE ALSO**

model.shape()

