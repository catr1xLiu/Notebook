# **SYNTAX**

```
model.elem().create(<tag>,eltype);
model.elem(<tag>).set(<ftag>,value);
model.elem(<tag>).field().create(<ftag>,"record");
model.elem(<tag>).field(<ftag>).set(<ftag>,value);
model.elem(<tag>).field().create(<atag>,"array");
model.elem(<tag>).field(<atag>).pos().create("string",value);
model.elem(<tag>).field(<atag>).pos().create("array");
model.elem(<tag>).field(<atag>).pos(pos).create("string",value);
model.elem(<tag>).src().create(<fttag>);
model.elem(<tag>).src(<fttag>).set(<ftag>,value);
model.elem(<tag>).src(<fttag>).field().create(<ftag>,"array");
model.elem(<tag>).geomdim().create(<fttag>);
```

#### **DESCRIPTION**

model.elem().create(*<tag>*,eltype) creates a new element of type eltype, for example elinterp, elpric, elvar, elode, and so on.

model.elem(*<tag>*).set(*<ftag>*,value) sets the field tagged *<ftag>* to value. Examples of fields and values are file and solution\_interp.txt, global and 1, and so on.

model.elem(*<tag>*).field().create(*<ftag>*,"record") creates a new field tagged *<ftag>* of type record under the element tagged *<tag>*.

model.elem(*<tag>*).field(*<ftag>*).set(sname,value) sets the field tagged sname to value. The field is located under the record field tagged *<ftag>*.

model.elem(*<tag>*).field(*<ftag>*).field().create(<rtag>,"record") creates a new record field tagged <rtag> that is a field under the record field *<ftag>*.

model.elem(*<tag>*).field().create(*<atag>*,"array") creates a new array field tagged *<atag>*.

model.elem(*<tag>*).field(*<atag>*).pos().create("array") adds a new element of type array to the array tagged *<atag>*.

model...field(*<atag>*).pos(1).pos().create("string","1") adds a new array element of type string with value 1 to the first array element of the array stored in the field *<atag>*.

In the text below, all occurrences of src can be replaced with geomdim.

model.elem(*<tag>*).src().create(*<fttag>*) creates a src feature tagged *<fttag>* under the element. A feature must have a domain selection.

model.elem(*<tag>*).src(*<fttag>*).selection().dim(2).set(gname) assigns all domains of dimension 2 from geometry gname to the selection of feature *<fttag>*.

model.elem(*<tag>*).src(*<fttag>*).set(*<ftag>*,value) sets the field *<ftag>* to value under the feature *<fttag>*.

model.elem(*<tag>*).src(*<fttag>*).field().create(rname,"record") adds a new record field rname under the feature *<fttag>*.

