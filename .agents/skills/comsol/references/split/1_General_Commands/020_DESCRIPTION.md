# **DESCRIPTION**

model.coeff(*<tag>*)returns the coefficient form equations with tag *<tag>*.

model.coeff().create(*<tag>*,*<fields>*) creates coefficient form equations with tag *<tag>* using the fields *<fields>*. The field tags refer to the fields defined by model.field(). The shape functions referred to by the fields are internally also used to find the derivatives of the field variables if converting the coefficient features to the weak formulation. By default, all coefficients are designed to be noncontributing to the equation under consideration. For example, model.coeff().create("mytag",new String[]{"u","v"}).

model.coeff(*<tag>*).field(*<fields>*) sets the coefficient form field variables. *<fields>* is a string with a field tag or a vector of field tags — for example, new String[]{"u","v"}. Reassigning the fields has the side effect that the size of the coefficients change if the number of field variables changes.

model.coeff(*<tag>*).field(*<pos>*,*<fields>*) edits the field at position *<pos>* in the field vector *<fields>*.

model.coeff(*<tag>*).intRule(*<irlist>*) assigns integration rules to the coefficient form equations. The list must have the same length as the number of field variables defined by the fields or have length 1. In the latter case all equations use the same integration rule. The number of field variables is not necessarily the same as the number of strings specified in model.coeff(*<tag>*).field().

model.coeff(*<tag>*).intRule(*<pos>*,*<irule>*) edits the integration rule at position *<pos>* in the vector *<irule>*.

model.coeff(*<tag>*).feature(*<ftag>*) is a coefficient form feature with tag *<ftag>* in the coefficient form equations with tag *<tag>*.

model.coeff(*<tag>*).create(*<ftag>*) creates a new coefficient form feature with tag *<ftag>*.

model.coeff(*<tag>*).feature(*<ftag>*).set(*ctype*,*<cvalue>*) sets the value of the coefficient of type *ctype* to *<value>*. All string data types that are listed in Table 2-4 are supported; which argument types are applicable depends on the coefficient. *ctype* is one of c, al, ga, be, a, f, da, ea, q, and g. These coefficients are available at all dimensions. In addition at level edim==sdim-1, the coefficients q and g are allowed, corresponding to a and f, respectively. All coefficients have a default 0 contribution.

model.coeff(*<tag>*).feature(*<ftag>*).selection().named(*<seltag>*) assigns the coefficient form equations to the named selection *<seltag>*.

model.coeff(*<tag>*).feature(*<ftag>*).selection().set(...) defines a local selection that assigns the coefficient form equations to geometric entities. For a complete list of methods available under selection(), see model.selection(). Only selections at a single geometry level is allowed in the selection.

model.coeff(*<tag>*).field() returns the fields as a string array.

model.coeff(*<tag>*).intRule() returns the integration rule tags as a string array.

model.coeff(*<tag>*).feature(*<ftag>*).get*Type*(*ctype*) returns the coefficient value. See the section get\* and Selection Access Methods for available methods.

model.coeff(*<tag>*).feature(*<ftag>*).selection().named() returns the named selection tag, and model.coeff(*<tag>*).feature(*<ftag>*).selection().get*Type*() returns domain information. See model.selection() for available methods.

*Special Properties for the Wave Form PDE*

If you create a Wave Form PDE using, for example,

model.physics().create("wahw", "WaveFormPDE", "geom1", new String[][]{{"u"}});

then the following properties are available using the setIndex syntax:

TABLE 2-14: WAVE FORM PDE PROPERTIES.

| PROPERTY     | VALUE                   | DEFAULT | INDEX | DESCRIPTION                                                 |
|--------------|-------------------------|---------|-------|-------------------------------------------------------------|
| fluxmethod   | fluxLF  <br>fluxGeneral | fluxLF  | 0     | Flux method: Lax–Friedrichs or a general numerical<br>flux. |
| gstar        | double                  | 1       | 0     | General numerical flux.                                     |
| tau          | double                  | 1       | 0     | Lax–Friedrichs parameter.                                   |
| filteractive | 0   1                   | 0       | 0     | Activate filter parameters.                                 |
| filter       | double                  | 36      | 0     | Filter parameter α.                                         |

TABLE 2-14: WAVE FORM PDE PROPERTIES.

| PROPERTY | VALUE  | DEFAULT | INDEX | DESCRIPTION           |
|----------|--------|---------|-------|-----------------------|
| filter   | double | 0.6     | 1     | Filter parameters ηc. |
| filter   | double | 3       | 2     | Filter parameter s.   |

For example, to set the filter parameter *s* to 2.5, use

```
model.physics("wahw").feature("wafeq1").setIndex("filter", "2.5", 2);
```

#### **EXAMPLE**

Define two uncoupled Poisson-like equations on the domain dtag.

```
Code for Use with Java
  model.coeff().create("c1",new String[]{"u","v"});
  model.coeff("c1").intRule(new String[]{"gp1","gp1"});
  CoeffFeature f1 = model.coeff("c1").create("f1");
  f1.set("c",1,new String[]{"1","0.1","2"});
  f1.set("c",2,"3");
  f1.set("f",new String[]{"2","1"});
  f1.selection().geom("g1",2);
  f1.selection().set(1);
Code for Use with MATLAB
  model.coeff.create('c1',{'u','v'});
  model.coeff('c1').intRule({'gp1','gp1'});
  f1 = model.coeff('c1').create('f1');
  f1.set('c',1,{'1','0.1','2'});
  f1.set('c',2,'3');
  f1.set('f',{'2','1'});
  f1.selection.geom('g1',2);
  f1.selection.set(1);
```

