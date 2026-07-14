# **EXAMPLES**

Specifies an interpolation element that takes its data from a file named solution\_data.txt.

```
Code for Use with Java
  model.elem().create("fun1","elinterp");
  model.elem("fun1").set("name",new String[]{"sol"});
  model.elem("fun1").set("file","solution_data.txt");
  model.elem("fun1").set("fileindex",new String[]{"1"});
  model.elem("fun1").set("defvars",new String[]{"true"});
  model.elem("fun1").set("method",new String[]{"linear"});
  model.elem("fun1").set("extmethod",new String[]{"const"});
Code for Use with MATLAB
  model.elem.create('fun1','elinterp');
  model.elem('fun1').set('name',{'sol'});
  model.elem('fun1').set('file','solution_data.txt');
  model.elem('fun1').set('fileindex',{'1'});
  model.elem('fun1').set('defvars',{'true'});
  model.elem('fun1').set('method',{'linear'});
  model.elem('fun1').set('extmethod',{'const'});
```

The example below creates two integration couplings.

```
Code for Use with Java
  model.elem().create("elem1","elcplscalar");
  model.elem("elem1").set("var",new String[]{"aa","bb"});
  model.elem("elem1").set("global",new String[]{"1","2"});
  model.elem("elem1").src().create("feat1");
  model.elem("elem1").src("feat1").selection().geom("g",2).set(new int[]{1});
  model.elem("elem1").src("feat1").set("expr",new String[][]{{"1"},{"2"}}
  model.elem("elem1").src("feat1").set("ipoints",new String[][]{{"2"},{"2"}}
  model.elem("elem1").src("feat1").set("frame",new String[][]{{"spatial"},{"spatial"}};
Code for Use with MATLAB
  model.elem.create('elem1','elcplscalar');
  model.elem('elem1').set('var',{'aa','bb'});
  model.elem('elem1').set('global',{'1','2'});
  model.elem('elem1').src.create('feat1');
  model.elem('elem1').src('feat1').selection.geom('g',2).set(1);
  model.elem('elem1').src('feat1').set('expr',{{'1'},{'2'}}
  model.elem('elem1').src('feat1').set('ipoints',{{'2'},{'2'}}
  model.elem('elem1').src('feat1').set('frame',{{'spatial'},{'spatial'}};
This complicated example creates a constr element with two constraints (usually done with constraint features):
Code for Use with Java
  model.elem().create("elem1","elsconstr");
  feat = model.elem("elem1").geomdim().create("feat1");
  feat.selection().geom("g",2).set(new int[]{1});
  feat.set("constr",new String[][][]{{{"Ex","Ey","Ez"}}});
  feat.set("cshape",new String[]{"1"})
  feat.field().create("shelem","record");
  feat.field("shelem").set("case",new String[0]);
  feat.field("shelem").set("mind",new String[0]);
  feat.field("shelem").field().create("default","array");
  feat.field("shelem").field("default").pos().create("array");
  feat.field("shelem").field("default").pos(1).pos().create("array");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("string","edg");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("string","shcurl");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("record");
  feat.field("shelem").field("default").pos(1).pos(1).pos(3).set("order","2");
  feat.field("shelem").field("default").pos(1).pos(1).pos(3)
  .set("compnames",new String[]{"Ex","Ey","Ez"});
  feat.field("shelem").field("default").pos(1).pos(1).pos(3).set("frame","ref");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("string","edg2");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("string","shcurl");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("record");
  feat.field("shelem").field("default").pos(1).pos(1).pos(6).set("order","2");
  feat.field("shelem").field("default").pos(1).pos(1).pos(6)
  .set("compnames",new String[]{"Ex","Ey","Ez"});
  feat.field("shelem").field("default").pos(1).pos(1).pos(6).set("frame","ref");
Code for Use with MATLAB
  model.elem.create('elem1','elsconstr');
  feat = model.elem('elem1').geomdim().create('feat1');
  feat.selection().geom('g',2).set(1);
  feat.set('constr',{{{'Ex','Ey','Ez'}}});
  feat.set('cshape',{'1'})
  shelem = feat.field.create('shelem','record');
  shelem.set('case','');
  shelem.set('mind','');
  shelem.field().create('default','array');
  shelem.field('default').pos.create('array');
  shelem.field('default').pos(1).pos.create('array');
  shelem.field('default').pos(1).pos(1).pos.create('string','edg');
  shelem.field('default').pos(1).pos(1).pos.create('string','shcurl');
  shelem.field('default').pos(1).pos(1).pos.create('record');
```

```
shelem.field('default').pos(1).pos(1).pos(3).set('order','2');
  shelem.field('default').pos(1).pos(1).pos(3).set('compnames',{'Ex','Ey','Ez'});
  shelem.field('default').pos(1).pos(1).pos(3).set('frame','ref');
  shelem.field('default').pos(1).pos(1).pos.create('string','edg2');
  shelem.field('default').pos(1).pos(1).pos.create('string','shcurl');
  shelem.field('default').pos(1).pos(1).pos.create('record');
  shelem.field('default').pos(1).pos(1).pos(6).set('order','2');
  shelem.field('default').pos(1).pos(1).pos(6).set('compnames',{'Ex','Ey','Ez'});
  shelem.field('default').pos(1).pos(1).pos(6).set('frame','ref');
For all records, the statement
  model...set("frame","ref");
is the equivalent to
  model...field().create("frame","string","ref");
The statement
  model...set("expr",new String[][]{{"1"},{"2"}});
is equivalent to
  model...field().create("expr","array");
  model...field("expr").pos().create("array").
  model...field("expr").pos(1).create("string","1");
  model...field("expr").pos().create("array").
  model...field("expr").pos(2).create("string","1");
```

so the set method is often a much more convenient way to create simple fields.

