# **DISCONTINUOUS LAGRANGE (SHDISC) AND NODAL DISCONTINUOUS LAGRANGE ELEMENTS (SHHWDISC)**

Specify discontinuous Lagrange shape functions in the model.shape field of the model object. The constructor of the discontinuous Lagrange shape functions is either shdisc, for discontinuous Lagrange shape functions, or shhwdisc, for nodal discontinuous Lagrange shape functions. The difference between these two is that the latter has optimal placement of degrees of freedom on triangular and tetrahedral meshes with respect to certain interpolation error estimates, whereas the former is available on all types of mesh elements with arbitrary polynomial order *k*. However, the available numerical integration formulas usually limits the usefulness to *k* ≤ 5 (*k* ≤ 4 for tetrahedral meshes). The following properties are allowed:

|  | TABLE 5-7: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHDISC SHAPE FUNCTION. |
|--|---------------------------------------------------------------------------|
|  |                                                                           |

| PROPERTY | VALUE               | DEFAULT             | DESCRIPTION                                                              |
|----------|---------------------|---------------------|--------------------------------------------------------------------------|
| basename | variable name       |                     | Base variable name                                                       |
| order    | integer             |                     | Basis function order                                                     |
| mdim     | nonnegative integer | sdim                | Dimension of the mesh elements where the<br>discontinuous element exists |
| sorder   | positive integer    | Determined by frame | Geometry shape function order                                            |

The shhwdisc (nodal discontinuous Lagrange) shape function has the same properties as the shdisc (nodal discontinuous Lagrange) shape function, except that the mesh element dimension mdim cannot be set; it is instead assumed equal to sdim. That is, shhwdisc shape functions are only usable on the top dimension of the geometry.

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks.

```
model.shape().create("sh1","frame1");
```

```
model.shape("sh1").create("f1","shdisc");
model.shape("sh1").feature("f1").set("order",2);
model.shape("sh1").feature("f1").set("basename","u");
```

The discontinuous element defines the following field variables. Denote basename with *u*, and let *x* denote the spatial coordinates. The variables are (edim is the mesh element dimension):

- **•** *u*, defined when edim *=* mdim.
- **•** *ux*, meaning the derivative of *u* with respect to *x*, defined when edim *=* mdim *=* sdim.
- **•** *uTx*, the tangential derivative variable, meaning the derivative of *u* with respect to *x*, defined when edim *=* mdim < sdim.

## **DENSITY ELEMENTS (SHDENS)**

Specify density shape functions in the model.shape field of the model object. The constructor of the density shape function is shdens. The following properties are allowed:

TABLE 5-8: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHDENS SHAPE FUNCTION.

| PROPERTY | VALUE            | DEFAULT             | DESCRIPTION                   |
|----------|------------------|---------------------|-------------------------------|
| basename | variable name    |                     | Base variable name            |
| order    | integer          |                     | Basis function order          |
| sorder   | positive integer | Determined by frame | Geometry shape function order |

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks.

```
model.shape().create("shu","f");
model.shape("shu").create("f1","shdens");
model.shape("shu").feature("f1").set("order",2);
model.shape("shu").feature("f1").set("basename","u");
```

The density element defines the following field variables. Denote basename with *u*, and let *x* denote the spatial coordinates. The variables are (edim is the mesh element dimension):

- **•** *u*, defined when edim = sdim.
- **•** *ux*, meaning the derivative of *u* with respect to *x*, defined when edim = sdim.

## **GAUSS POINT DATA ELEMENTS (SHGP)**

Specify Gauss point data shape functions in the model.shape field of the model object. The constructor of the density shape function is shgp. The following properties are allowed:

TABLE 5-9: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHGP SHAPE FUNCTION.

| PROPERTY  | VALUE         | DEFAULT | DESCRIPTION                                                            |
|-----------|---------------|---------|------------------------------------------------------------------------|
| basename  | variable name |         | Base variable name                                                     |
| order     | integer       |         | Basis function order                                                   |
| mdim      | integer       |         | Element dimension                                                      |
| valuetype | real complex  | complex | Value type in case of using split representation of complex variablesa |

a. The value type is ignored when split representation of complex variables is not used.

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks. The following code creates a Gauss point data shape function declaring the degree of freedom *u* at integration points of order 4 in three-dimensional mesh elements.

```
model.shape().create("shu","f");
model.shape("shu").create("f1","shgp");
model.shape("shu").feature("f1").set("order",4);
model.shape("shu").feature("f1").set("basename","u");
model.shape("shu").feature("f1").set("mdim","3");
```

The Gauss point data element defines the following field variables. Denote basename with *u* and let edim be the evaluation dimension:

**•** *u*, defined when edim <= mdim.

## **DIVERGENCE ELEMENTS (SHDIV)**

*Syntax for Divergence Elements (shdiv)*

Specify divergence shape functions in the model.shape field of the model object. The constructor of the divergence shape function is shdiv. The following properties are allowed:

TABLE 5-10: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHDIV SHAPE FUNCTION.

| PROPERTY    | VALUE            | DEFAULT                | DESCRIPTION                      |
|-------------|------------------|------------------------|----------------------------------|
| fieldname   | variable name    |                        | Name of vector field             |
| compnames   | string array     | Derived from fieldname | Names of vector field components |
| dofbasename | string           | see below              | Base name of degrees of freedom  |
| divname     | string           | see below              | Name of divergence field         |
| order       | integer          | 1                      | Basis function order             |
| sorder      | positive integer | Determined by frame    | Geometry shape function order    |

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks.

```
model.shape().create("shu","f");
model.shape("shu").create("f1","shdiv");
model.shape("shu").feature("f1").set("order",2);
model.shape("shu").feature("f1").set("compnames",new String[]{"Bx","By"});
model.shape("shu").feature("f1").set("dofbasename","nB");
```

The default for compnames is fieldname concatenated with the spatial coordinate names. The default for dofbasename is n*allcomponents*, where *allcomponents* is the concatenation of the names in compnames.

The vector element defines the following degrees of freedom: dofbasename on element boundaries, and dofbasename sdim *c*, *c* = 0, …, sdim − 1 for DOFs in the interior.

The divergence element defines the following field variables (where comp is a component name from compnames, divname is the divname, sdim = space dimension and edim = mesh element dimension):

- **•** comp, meaning a component of the vector, defined when edim = sdim.
- **•** ncomp, meaning one component of the projection of the vector onto the normal of mesh element, defined when edim = sdim *–* 1.
- **•** comp*x*, meaning the derivative of a component of the vector with respect to global spatial coordinate *x*, defined when edim = sdim.
- **•** ncompT*x*, the tangential derivative variable, meaning the *x* component of the projection of the gradient of ncomp onto the mesh element, defined when edim < sdim. Here, *x* is the name of a spatial coordinate. ncompT*x* = 0.
- **•** divname, means the divergence of the vector field.

For performance reasons, prefer using divname in expressions involving the divergence rather than writing it as the sum of sdim gradient components.

For the computation of components, the global spatial coordinates are expressed as polynomials of degree (at most) sorder in the local coordinates.

## **DIVERGENCE TYPE 2 ELEMENTS (SHDIV2)**

Specify divergence type 2 shape functions in the model.shape field of the model object. The constructor of the divergence type 2 shape function is shdiv2. The usage of the divergence type 2 element is the same as the divergence element (shdiv) described above, apart from the difference in the naming of the constructor.

