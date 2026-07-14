# *model.material()*

Materials and material property groups.

![](_page_116_Picture_10.jpeg)

For materials defined on the global level, omit component(*<ctag>*). from the syntax such as model.component(*<ctag>*).material().create(*<tag>*) in the syntax examples below.

#### **SYNTAX**

```
model.component(<ctag>).material().create(<tag>);
model.component(<ctag>).material().create(<tag>,<type>);
model.component(<ctag>).material(<tag>).info(<itag>);
model.component(<ctag>).material(<tag>).info();
model.component(<ctag>).material(<tag>).insert()
model.component(<ctag>).material(<tag>).label(<label>);
model.component(<ctag>).material(<tag>).materialType(<mattype>)
model.component(<ctag>).material(<tag>).propertyGroup(<mtag>);
model.component(<ctag>).material(<tag>).propertyGroup();
model.component(<ctag>).material(<tag>).prefix(<prefix>);
model.component(<ctag>).material(<tag>).prefix();
model.component(<ctag>).material(<tag>).selection();
model.component(<ctag>).material(<tag>).image();
model.component(<ctag>).material(<tag>).set(<pname>,<expr>);
model.component(<ctag>).material().move(<tag>,<position>);
MaterialModel mm = model.component(<ctag>).material(<tag>).propertyGroup().
                   create(<mtag>,<descr>);
mm.addInput(<quantity>);
mm.descr(<pname>,<descr>);
mm.func();
mm.func(<ftag>);
mm.setMixingRule(<pname>,<mixRule>);
mm.getPropertyInfo(<pname>);
mm.getString(<pname>);
mm.getStringArray(<pname>);
mm.getValueType(<pname>);
mm.hasParam(<pname>);
mm.info(<itag>);
mm.info();
mm.input();
mm.isOutput(<pname>);
mm.param();
mm.removeInput(<quantity>);
mm.set(<pname>,<expr>);
mm.setMixingRule(<pname>,<mixRule>);
mm.setPropertyInfo(<pname>,<info>);
mm.size(<pname>);
mm.suffix(<suffix>);
mm.suffix();
mm.info().create(<itag>,<descr>);
mm.info(<itag>).title(<title>);
mm.info(<itag>).title();
mm.info(<itag>).body(<body>);
mm.info(<itag>).body();
```

