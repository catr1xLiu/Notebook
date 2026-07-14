# **SYNTAX**

```
model.bem().create(<tag>, "CoefficientPDE");
model.bem(<tag>).set(<prop>, <value>);
model.bem(<tag>).selection();
```

model.bem(*<tag>*).selection(); defines the selection for single-sided BEM boundaries. In addition, the following variants are available for double-sided boundaries:

**•** Use model.bem(*<tag>*).selection("cont"); for a selection of double-sided boundaries where the field is continuous.

- **•** Use model.bem(*<tag>*).selection("discont"); for a selection of double-sided boundaries where the field is allowed to be discontinuous.
- **•** Use model.bem(*<tag>*).selection("edge"); for a selection of BEM edges in 3D.

For a complete list of methods available under selection(), see Selections.

The following general properties are available for model.bem:

TABLE 2-9: GENERAL PROPERTIES FOR BEM.

| PROPERTY     | VALUE      | DEFAULT | DESCRIPTION                                                     |
|--------------|------------|---------|-----------------------------------------------------------------|
| background   | Expression | 0       | Background field.                                               |
| edgefluxname | String     |         | Name of edge flux variable.                                     |
| edgegradname | String[]   |         | Names of edge gradient variables.                               |
| edgeradius   | Expression |         | Radius of cylinders represented as edges.                       |
| fluxname     | String     |         | Name of boundary flux variable.                                 |
| infval       | Expression | 0       | Value at infinity (for Laplace's equation).                     |
| normal       | String[]   |         | Boundary normals pointing out of BEM domain.                    |
| opname       | String     |         | Name of postprocessing operator.                                |
| varname      | String     |         | Name of field variable.                                         |
| varnameback  | String     |         | Name of field variable on backside of double-sided boundaries.  |
| varnamefront | String     |         | Name of field variable on frontside of double-sided boundaries. |

In addition, the following properties for the coefficient of the equation are available:

TABLE 2-10: EQUATION COEFFICIENT PROPERTIES FOR BEM.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                              |
|----------|----------|---------|----------------------------------------------------------|
| a        | String   | 0       | Absorption coefficient.                                  |
| al       | String[] | {0,0,0} | Conservative flux convection coefficient.                |
| be       | String[] | {0,0,0} | Convection coefficient.                                  |
| c        | String   | 1       | Diffusion coefficient.                                   |
| cedge    | String   | 1       | Diffusion coefficient in cylinders represented as edges. |
| m        | String   | 0       | Condition at infinity for Helmholtz equation.            |

The following integration order properties are available:

TABLE 2-11: INTEGRATION ORDER PROPERTIES FOR BEM.

| PROPERTY       | VALUE  | DEFAULT | DESCRIPTION                                                                  |
|----------------|--------|---------|------------------------------------------------------------------------------|
| intorderclose  | String |         | Integration rule for close nonadjacent pairs of mesh elements.               |
| intorderedge   | String |         | Integration rule for pairs of mesh elements with a common edge<br>(3D only). |
| intorderfar    | String |         | Integration rule for distant pairs of mesh elements.                         |
| intordersame   | String |         | Integration rule for pairs of mesh elements that coincide.                   |
| intordervertex | String |         | Integration rule for pairs of mesh elements with a common vertex.            |
| intorderweak   | String |         | Integration for weak equations.                                              |

The following symmetry properties are available:

TABLE 2-12: SYMMETRY PROPERTIES FOR BEM.

| PROPERTY  | VALUE            | DEFAULT | DESCRIPTION                                      |
|-----------|------------------|---------|--------------------------------------------------|
| sym1      | off   scp   user | off     | Use of symmetry plane orthogonal to x-axis.      |
| sym1plane | Expression       | 0       | Position of symmetry plane orthogonal to x-axis. |

TABLE 2-12: SYMMETRY PROPERTIES FOR BEM.

| PROPERTY  | VALUE            | DEFAULT | DESCRIPTION                                      |
|-----------|------------------|---------|--------------------------------------------------|
| sym2      | off   scp   user | off     | Use of symmetry plane orthogonal to y-axis.      |
| sym2plane | Expression       | 0       | Position of symmetry plane orthogonal to y-axis. |
| sym3      | off   scp   user | off     | Use of symmetry plane orthogonal to z-axis.      |
| sym3plane | Expression       | 0       | Position of symmetry plane orthogonal to z-axis. |

Finally, the following far-field approximation properties are available:

TABLE 2-13: FAR-FIELD APPROXIMATION PROPERTIES FOR BEM.

| PROPERTY              | VALUE             | DEFAULT | DESCRIPTION                                                          |
|-----------------------|-------------------|---------|----------------------------------------------------------------------|
| dampingparameter      | Double            | 1       | Damping parameter.                                                   |
| farfieldapprox        | none   ACA   ACA+ | none    | Far-field approximation method.                                      |
| farfieldboxsplitlimit | Integer           | 20      | Number of mesh elements at which box splitting<br>stops.             |
| farfieldmindist       | Double            | 0.5     | Minimum relative distance of boxes using far-field<br>approximation. |
| farfieldsvd           | on   off          | on      | Use SVD compression in far-field approximation.                      |
| farfieldtol           | Double            | 1e-3    | Tolerance used in far-field approximation.                           |
| usedamping            | on   off          | off     | Use damping parameter with iterative solver.                         |

## **EXAMPLE**

The following example shows how to solve for a Helmholtz equation with outgoing waves at infinity in the exterior of a geometry. The example requires that the dependent variables u and bemflux already exist on the exterior boundaries.

```
Code for Use with Java
```

```
model.intRule().create("ir1", "material1");
  model.intRule("ir1").create("o1").order(4);
  model.bem().create("bem1", "CoefficientPDE");
  model.bem("bem1").selection().geom("geom1", 2).set(<list of exterior boundary numbers>);
  model.bem("bem1").set("varname", "u");
  model.bem("bem1").set("fluxname", "bemflux");
  model.bem("bem1").set("normal", new String[]{"-nx", "-ny", "-nz"});
  model.bem("bem1").set("a", "-1");
  model.bem("bem1").set("m", "-1");
  model.bem("bem1").set("opname", "bemop");
  model.bem("bem1").set("intorderfar", "ir1");
  model.bem("bem1").set("intorderclose", "ir1");
  model.bem("bem1").set("intordersame", "ir1");
  model.bem("bem1").set("intorderedge", "ir1");
  model.bem("bem1").set("intordervertex", "ir1");
  model.bem("bem1").set("intorderweak", "ir1");
Code for Use with MATLAB
  model.intRule().create('ir1', 'material1');
  model.intRule('ir1').create('o1').order(4);
  model.bem.create('bem1', 'CoefficientPDE');
  model.bem('bem1').selection.geom('geom1', 2).set(<list of exterior boundary numbers>);
  model.bem('bem1').set('varname', 'u');
  model.bem('bem1').set('fluxname', 'bemflux');
  model.bem('bem1').set('normal', {'-nx', '-ny', '-nz'});
  model.bem('bem1').set('a', '-1');
  model.bem('bem1').set('m', '-1');
  model.bem('bem1').set('opname', 'bemop');
```

```
model.bem('bem1').set('intorderfar', 'ir1');
  model.bem('bem1').set('intorderclose', 'ir1');
  model.bem('bem1').set('intordersame', 'ir1');
  model.bem('bem1').set('intorderedge', 'ir1');
  model.bem('bem1').set('intordervertex', 'ir1');
  model.bem('bem1').set('intorderweak", 'ir1');
SEE ALSO
model.coeff()
model.coeff()
```

Creating equations in the coefficient form. See also model.shape(), model.weak().

#### **SYNTAX**

```
model.coeff().create(<tag>,<fields>);
model.coeff(<tag>).field(<fields>);
model.coeff(<tag>).field(<pos>,<fields>);
model.coeff(<tag>).intRule(<irlist>);
model.coeff(<tag>).intRule(<pos>,<irule>);
model.coeff(<tag>).create(<ftag>);
model.coeff(<tag>).feature(<ftag>).set(ctype,<cvalue>);
model.coeff(<tag>).field();
model.coeff(<tag>).intRule();
model.coeff(<tag>).feature(<ftag>).getType(ctype);
model.coeff(<tag>).feature(<ftag>).set(String pname, int value);
model.coeff(<tag>).feature(<ftag>).set(String pname, int pos, int value);
model.coeff(<tag>).feature(<ftag>).set(String pname, int pos, int[] value);
model.coeff(<tag>).feature(<ftag>).set(String pname, int pos1, int pos2, int value);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String value, int firstIndex,
                   int secondIndex);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String[] value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, double value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, double value, int firstIndex,
                   int secondIndex);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, double[] value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, int value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, int value, int firstIndex,
                   int secondIndex);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, int[] value, int index);
```

The set() methods index/position arguments are 1-based. The setIndex() methods index/position arguments are 0-based. See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

