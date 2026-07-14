# Shape Functions and Element Types

This section describes the available shape functions (element types) with their properties and syntax examples.

*Shape Function Types (Elements)*

#### **THE LAGRANGE ELEMENT (SHLAG)**

Specify Lagrange elements in the model.shape field of the model object. The constructor of the Lagrange shape function is shlag. The following properties are allowed:

TABLE 5-1: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHLAG SHAPE FUNCTION.

| PROPERTY | VALUE            | DEFAULT             | DESCRIPTION                   |
|----------|------------------|---------------------|-------------------------------|
| basename | Variable name    |                     | Base variable name            |
| order    | Positive integer |                     | Basis function order          |
| sorder   | Positive integer | Determined by frame | Geometry shape function order |

It is not possible to abbreviate the property names, and you must write them in lowercase letters enclosed in quotation marks. For example:

```
model.shape().create("shu","f");
model.shape("shu").create("f1","shlag");
model.shape("shu").feature("f1").set("order",2);
model.shape("shu").feature("f1").set("basename","u");
```

The Lagrange element defines the following variables. Denote basename with *u*, and let *x* and *y* denote (not necessarily distinct) spatial coordinates. The variables are (sdim = space dimension and edim = mesh element dimension):

- **•** *u*
- **•** *ux*, meaning the derivative of *u* with respect to *x*, defined on edim = sdim
- **•** *uxy*, meaning a second derivative, defined on edim = sdim
- **•** *uTx*, the tangential derivative variable, meaning the *x*-component of the tangential projection of the gradient, defined on edim < sdim
- **•** *uTxy*, meaning *xy*-component of the tangential projection of the second derivative, defined when edim < sdim

When calculating the derivatives, the global spatial coordinates are expressed as polynomials of degree (at most) sorder in the local coordinates.

### **THE NODAL SERENDIPITY ELEMENT (SHNSERP)**

Specify serendipity shape functions in the model.shape field of the model object. The constructor of the serendipity shape function is shnserp. The following properties are allowed:

TABLE 5-2: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHNSERP SHAPE FUNCTION.

| PROPERTY | VALUE            | DEFAULT             | DESCRIPTION                   |
|----------|------------------|---------------------|-------------------------------|
| basename | Variable name    |                     | Base variable name            |
| order    | Integer, 2–4     |                     | Basis function order          |
| sorder   | Positive integer | Determined by frame | Geometry shape function order |

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks.

```
model.shape().create("shu","f");
model.shape("shu").create("f1","shnserp");
```

```
model.shape("shu").feature("f1").set("order",3);
model.shape("shu").feature("f1").set("basename","u");
```

The nodal serendipity element defines the following field variables. Denote basename with *u*, and let *x* and *y* denote (not necessarily distinct) spatial coordinates. The variables are (sdim = space dimension and edim = mesh element dimension):

- **•** *u*
- **•** *ux*, meaning the derivative of *u* with respect to *x*, defined when edim *=* sdim or edim*=*0
- **•** *uxy*, meaning a second derivative, defined when edim = sdim
- **•** *uTx*, the tangential derivative variable, meaning the *x*-component of the tangential projection of the gradient, defined when 0 < edim < sdim
- **•** *uTxy*, meaning *xy*-component of the tangential projection of the second derivative, defined when edim < sdim

When calculating the derivatives, the global spatial coordinates are expressed as polynomials of degree (at most) sorder in the local coordinates.

## **THE ARGYRIS ELEMENT (SHARG\_2\_5)**

Specify Argyris shape functions in the model.shape field of the model object. The constructor of the Argyris shape function is sharg\_2\_5. The following properties are allowed:

TABLE 5-3: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHARG SHAPE FUNCTION.

| PROPERTY | VALUE         | DEFAULT | DESCRIPTION        |
|----------|---------------|---------|--------------------|
| basename | Variable name |         | Base variable name |

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks.

```
model.shape().create("shu","f");
model.shape("shu").create("f1","sharg_2_5");
model.shape("shu").feature("f1").set("basename","u");
```

The Argyris element defines the following degrees of freedom (where *u* is the base name and *x* and *y* are the spatial coordinate names):

- **•** *u* at corners
- **•** *ux* and *uy* at corners, meaning derivatives of *u*
- **•** *uxx*, *uxy*, and *uyy* at corners, meaning second derivatives
- **•** *u*n at side midpoints, meaning a normal derivative. The direction of the normal is to the right if moving along an edge from a corner with lower mesh vertex number to a corner with higher number

The Argyris element defines the following field variables (where sdim = space dimension = 2 and edim = mesh element dimension):

- **•** *u*
- **•** *ux*, meaning the derivative of *u* with respect to *x*
- **•** *uxy*, meaning a second derivative, defined for edim = sdim and edim = 0
- **•** *uxTy*, the tangential derivative variable, meaning the *y*-component of the tangential projection of the gradient of *ux*, defined for 0 < edim < sdim

When calculating the derivatives, the global spatial coordinates are always expressed with shape order 1 in the Argyris element.

#### **THE HERMITE ELEMENT (SHHERM)**

Specify Hermite shape functions in the model.shape field of the model object. The constructor of the Hermite shape function is shherm. The following properties are allowed:

TABLE 5-4: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHHERM SHAPE FUNCTION.

| PROPERTY | VALUE            | DEFAULT             | DESCRIPTION                   |
|----------|------------------|---------------------|-------------------------------|
| basename | Variable name    |                     | Base variable name            |
| order    | Integer >= 3     |                     | Basis function order          |
| sorder   | Positive integer | Determined by frame | Geometry shape function order |

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks.

```
model.shape().create("shu","f");
model.shape("shu").create("f1","shherm");
model.shape("shu").feature("f1").set("order",3);
model.shape("shu").feature("f1").set("basename","u");
```

The Hermite element defines the following degrees of freedom:

- **•** The value of the variable basename at each Lagrange node point that is not adjacent to a corner of the mesh element.
- **•** The values of the first derivatives of basename with respect to the global spatial coordinates at each corner of the mesh element. The names of these derivatives are formed by appending the spatial coordinate names to basename.

The Hermite element defines the following field variables. Denote basename with *u*, and let *x* and *y* denote (not necessarily distinct) spatial coordinates. The variables are (sdim = space dimension and edim = mesh element dimension):

- **•** *u*
- **•** *ux*, meaning the derivative of *u* with respect to *x*, defined when edim *=* sdim or edim*=*0
- **•** *uxy*, meaning a second derivative, defined when edim = sdim
- **•** *uTx*, the tangential derivative variable, meaning the *x*-component of the tangential projection of the gradient, defined when 0 < edim < sdim
- **•** *uTxy*, meaning *xy*-component of the tangential projection of the second derivative, defined when edim < sdim

When calculating the derivatives, the global spatial coordinates are expressed as polynomials of degree (at most) sorder in the local coordinates.

## **BUBBLE ELEMENTS (SHBUB)**

Specify bubble shape functions in the model.shape field of the model object. The constructor of a bubble shape function is shbub. The following properties are allowed:

TABLE 5-5: VALID PROPERTY NAME/VALUE PAIRS FOR THE SHBUB SHAPE FUNCTION.

| PROPERTY | VALUE                  | DEFAULT             | DESCRIPTION                                                 |
|----------|------------------------|---------------------|-------------------------------------------------------------|
| basename | variable name          |                     | Base variable name                                          |
| mdim     | nonnegative<br>integer | sdim                | Dimension of the mesh elements on which the bubble<br>exist |
| sorder   | positive integer       | Determined by frame | Geometry shape function order                               |

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks.

```
model.shape().create("shu","f");
model.shape("shu").create("f1","shbub");
model.shape("shu").feature("f1").set("mdim",2);
```

```
model.shape("shu").feature("f1").set("basename","u");
```

The bubble element has a single degree of freedom, basename, at the midpoint of the mesh element.

The bubble element defines the following field variables. Denote basename with u, and let x and y denote (not necessarily distinct) spatial coordinates. The variables are (sdim = space dimension and edim = mesh element dimension):

- u, defined when edim  $\leq$  mdim, u = 0 if edim < mdim.
- ux, meaning the derivative of u with respect to x, defined when edim = mdim = sdim.
- uTx, the tangential derivative variable, meaning the x-component of the tangential projection of the gradient, defined when mdim < sdim and edim  $\leq$  mdim. uTx = 0 if edim < mdim.
- uTxy, meaning the xy-component of the tangential projection of the second derivative, defined when mdim < sdim and edim  $\leq$  mdim. uTxy = 0 if edim < mdim.

## THE CURL ELEMENT (SHCURL)

Specify curl shape functions in the model.shape field of the model object. The constructor of the curl shape function is shour1. The following properties are allowed:

| TABLE 5-6: VALID | PROPERTY NAME/VALUE PA | RS FOR THE SHOURI | SHAPE FUNCTION |
|------------------|------------------------|-------------------|----------------|

| PROPERTY    | VALUE            | DEFAULT                | DESCRIPTION                                                                  |
|-------------|------------------|------------------------|------------------------------------------------------------------------------|
| fieldname   | string           |                        | Field name                                                                   |
| compnames   | string array     | derived from fieldname | Names of vector field components                                             |
| dofbasename | string           | See below              | Base name of degrees of freedom                                              |
| dcompnames  | string array     | See below              | Names of the anti-symmetrized components of the gradient of the vector field |
| order       | integer          |                        | Basis function order                                                         |
| sorder      | positive integer | Determined by frame    | Geometry shape function order                                                |

The property names cannot be abbreviated and must be written in lowercase letters enclosed in quotation marks.

```
model.shape().create("shu","f");
model.shape(|"shu").create("f1", "shcurl");
model.shape("shu").feature("f1").set("fieldname", "E");
model.shape("shu").feature("f1").set("order",2);
model.shape("shu").feature("f1").set("compnames",new String[]{"Ex","Ey"});
model.shape("shu").feature("f1").set("dofbasename","tE");
```

The default for compnames is fieldname concatenated with the spatial coordinate names. The default for dofbasename is tallcomponents, where allcomponents is the concatenation of the names in compnames.

The property dcompnames lists the names of the component of the antisymmetric matrix

$$dA_{ij} = \frac{\partial A_j}{\partial x_i} - \frac{\partial A_i}{\partial x_j},$$

where  $A_i$  are the vector field components and  $x_i$  are the spatial coordinates. The components are listed in row order. If a name is the empty string, the field variable corresponding to that component is not defined. If you have provided compnames, the default for the entries in dcompnames is compnames(j) sdimnames(i) compnames(i) sdimnames (j) for off-diagonal elements. If only fieldname has been given, the default for the entries are dfieldname sdimnames(i)sdimnames(j). Diagonal elements are not defined per defaults. For example, shcurl('order',3,'fieldname','A','dcompnames', {'','','curlAy','curlAz','','','','curlAx',''}).

The curl element defines the following degrees of freedom: dofbasename *d c*, where *d* = 1 for DOFs in the interior of an edge, *d* = 2 for DOFs in the interior of a surface, and so forth, and *c* is a number between 0 and *d* − 1.

The curl element defines the following field variables (where comp is a component name from compnames, and dcomp is a component from dcompnames, sdim = space dimension and edim = mesh element dimension):

- **•** comp, meaning a component of the vector, defined when edim = sdim.
- **•** tcomp, meaning one component of the tangential projection of the vector onto the mesh element, defined when edim < sdim.
- **•** comp*x*, meaning the derivative of a component of the vector with respect to global spatial coordinate *x*, defined when edim = sdim.
- **•** tcompT*x*, the tangential derivative variable, meaning the *x* component of the projection of the gradient of tcomp onto the mesh element, defined when edim < sdim. Here, *x* is the name of a spatial coordinate.
- **•** dcomp, meaning a component of the anti-symmetrized gradient, defined when edim = sdim.
- **•** tdcomp, meaning one component of the tangential projection of the anti-symmetrized gradient onto the mesh element, defined when edim < sdim.

For performance reasons, use dcomp in expressions involving the curl rather than writing it as the difference of two gradient components.

For the computation of components, the global spatial coordinates are expressed as polynomials of degree (at most) sorder in the local coordinates.

## **THE CURL TYPE 2 ELEMENT (SHCURL2)**

Specify curl type 2 shape functions in the model.shape field of the model object. The constructor of the curl type 2 shape function is shcurl2. The usage of the curl type 2 element is the same as the curl element (shcurl) described above, apart from the difference in the naming of the constructor.

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

# Solvers and Study Steps

This chapter contains reference information about the solver command and utility commands for producing and handling solutions. Information about study steps is also included.

# In this chapter:

- **•** About Solver Commands
- **•** Solution Object Data
- **•** Studies and Study Steps