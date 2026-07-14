# **DESCRIPTION**

```
model.component(<ctag>).cpl().create(<tag>,type) creates a nonlocal coupling of type type. 
model.component(<ctag>).cpl().create(<tag>,type,<gtag>) creates a nonlocal coupling on the geometry
```

*<gtag>*. The supported types are GeneralExtrusion, LinearExtrusion, BoundarySimilarity, IdentityMapping, GeneralProjection, LinearProjection, Integration, Average, Maximum, and Minimum. The nonlocal coupling operators provide coupling of values, typically from a source to a destination between or within model components.

model.component(*<ctag>*).cpl(*<tag>*).selection().named(*<seltag>*) assigns the nonlocal coupling's source to the named selection *<seltag>*. model.cpl(*<tag>*).selection().set(...) defines a local selection that assigns the nonlocal coupling's source to geometric entities. For a complete list of methods available under selection(), see Selections.

model.component(*<ctag>*).cpl(*<tag>*).set(*property*,*<value>*) specifies properties relevant for the selected nonlocal coupling type; see below.

model.component(*<ctag>*).cpl(<tag>).set("opname",*<opname>*) sets the operator name of the nonlocal coupling. The default nonlocal coupling operator name is *<tag>*.

model.component(*<ctag>*).cpl(*<tag>*).selection(*property*).named(*<seltag>*) assigns the nonlocal coupling's selection property to the named selection *<seltag>*.

model.component(*<ctag>*).cpl(*<tag>*).selection(*property*).set(...) defines a local selection that assigns the nonlocal coupling's selection property to geometric entities. For a complete list of methods available under selection(), see model.selection().

model.component(*<ctag>*).cpl(*<tag>*).create(*<subtag>*,*subtype*) creates a subfeature of type *subtype*. This can only be done when the nonlocal coupling *type* is BoundarySimilarity. The supported values of subtype are OnePointMap, TwoPointMap, and EdgeMap.

model.component(*<ctag>*).cpl(*<tag>*).selection().named() returns the named source selection of the coupling.

model.component(*<ctag>*).cpl(*<tag>*).selection().get*Type*(...) queries the source selection.

model.component(*<ctag>*).cpl(*<tag>*).get*Type*(*property*) returns the value of a specified property.

model.component(*<ctag>*).cpl(*<tag>*).selection(*property*).named() returns the named selection tag of the selection property.

model.component(*<ctag>*).cpl(*<tag>*).selection(*property*).get*Type*(...) queries a selection property.

Use model.component(*<ctag>*).cpl(*<tag>*).image() method to create a plot or export images. See Plotting and Exporting Images.

Notation: srcedim = dimension of source selection; srcsdim = space dimension of source geometry.

## **INTEGRATION COUPLINGS**

#### *Integration*

By default, a *nonlocal integration coupling* operator *oper* integrates an expression e over the source selection. The resulting value *oper*(e) can be used anywhere. If method=summation, the expression is instead summed over the nodes in the source selection.

TABLE 2-63: INTEGRATION COUPLING PROPERTIES.

| PROPERTY | VALUE                                   | DEFAULT | DESCRIPTION                                        |
|----------|-----------------------------------------|---------|----------------------------------------------------|
| axisym   | on   off                                | on      | Multiply by 2*pi*r in axisymmetric geometries.     |
| frame    | mesh   material  <br>spatial   geometry | spatial | Frame to integrate in (determines volume element). |

TABLE 2-63: INTEGRATION COUPLING PROPERTIES.

| PROPERTY | VALUE                      | DEFAULT     | DESCRIPTION            |
|----------|----------------------------|-------------|------------------------|
| intorder | String                     | 4           | Integration order.     |
| method   | integration  <br>summation | integration | Method of computation. |

