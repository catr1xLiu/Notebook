# **EXTRUSION COUPLINGS**

A *nonlocal extrusion coupling* operator oper maps an expression e defined on (a part of) the source selection to an expression oper(e) that can be evaluated on (a part of) the destination geometries. For each point *ps* in the

source selection, there can be zero, one, or several corresponding points *pd* in the destination. The inverse mapping *ps* = *m*(*pd*) is always one-to-one. The value of oper(e) at the point *pd* is defined as the value of e at the point *ps*.

The inverse mapping *m* is specified as the composition of a *destination map md* and the inverse of a *source map ms*: *ps* = *m*(*pd*) = *ms* <sup>−</sup>1(*md*(*pd*)). In other words, *ms*(*ps*) <sup>=</sup> *md*(*pd*) — both the destination map and the source map into the same *intermediate space*. For all operator types except GeneralExtrusion, the intermediate space coincides with the source geometry. The source map is always one-to-one. By default, the source map is the identity.

The operator type determines the type of destination map:

TABLE 2-67: EXTRUSION COUPLING TYPES.

| COUPLING TYPE      | DESTINATION MAP                                                                       |
|--------------------|---------------------------------------------------------------------------------------|
| GeneralExtrusion   | Nonlinear map described by expressions.                                               |
| LinearExtrusion    | Linear map described by vertex mapping.                                               |
| BoundarySimilarity | Similarity transformation described by mapping of boundaries. Also used by copy mesh. |
| IdentityMapping    | Identity map.                                                                         |

For most of these coupling types, a source map described by (possibly nonlinear) expressions can be used.

TABLE 2-68: EXTRUSION COUPLING PROPERTIES.

| PROPERTY         | VALUE                      | DEFAULT | DESCRIPTION                                                                          |
|------------------|----------------------------|---------|--------------------------------------------------------------------------------------|
| exttol           | double                     | 0.3     | Extrapolation tolerance in mesh search.                                              |
| manualsearchdist | on   off                   | off     | Use manual control of search distance.                                               |
| method           | usetol   closest<br>  walk | usetol  | Mesh search method: A tolerance, closest point, or<br>walk in a connected component. |
| searchdist       | positive distance          | 0.01    | Search distance in mesh search if manualsearchdist<br>is set to on.                  |
| usenan           | on   off                   | off     | Use NaN instead of error message when source point<br>is outside selection.          |

If method=usetol, oper(e) is defined when the source point *p*s is within the source selection, or if it is slightly outside. The tolerance is given in the property exttol, which is a distance in mesh element local coordinates; that is, it is a measure relative to the mesh element size. If oper(e) is not defined, an error message is given (if usenan=off), or the value NaN is returned (if usenan=on).

If method=closest, a brute force search method is used, which makes oper(e) defined everywhere (the nearest point to *ps* in the source selection is used).

If method=walk, a walk through the source mesh is made. This method should not be used if the component is not connected.

If manualsearchdist=on and the source selection is a boundary, edge, or point selection, searchdist gives the search distance in directions orthogonal to the source selection. The default unit is the component's length unit. If manualsearchdist=off, the search distance is equal to exttol times the mesh element size. If method=closest, exttol and searchdist are not used.

Depending on the coupling type, additional properties are available (see below).

## *GeneralExtrusion*

A *nonlocal general extrusion coupling* operator maps an expression defined on a source to an expression that can be evaluated on any destination geometry where the destination map expressions are valid.

TABLE 2-69: GENERAL EXTRUSION MAP PROPERTIES.

| PROPERTY  | VALUE                        | DEFAULT             | DESCRIPTION                             |
|-----------|------------------------------|---------------------|-----------------------------------------|
| dstmap    | String array                 | spatial coordinates | Expressions for destination map md(pd). |
| srcframe  | mesh   material  <br>spatial | spatial             | Frame for source mesh.                  |
| srcmap    | String array                 | spatial coordinates | Expressions for source map ms(ps).      |
| usesrcmap | on   off                     | off                 | Use source map.                         |

Trailing empty expressions in the properties dstmap and srcmap are ignored. The remaining expressions must be equal in number, and this determines the dimension idim of the intermediate space. Requirement: srcedim <= idim <= srcsdim. Changing the source selection has the side effect of changing dstmap and srcmap so that this requirement is satisfied. By default, idim=srcsdim.

The source mesh is viewed in the frame srcframe. The source mapping is taken to be linear within each source mesh element.

If usesrcmap=off, the srcmap property is not used. In this case, dstmap is a mapping from the destination to the source (viewed in the frame srcframe), and idim=srcsdim.

