# *Named Selections*

You can create named selections of entities in geometry objects or of whole geometry objects in two ways:

- **•** By setting the selresult property to on in an arbitrary geometry feature. This creates a selection containing the feature's output objects, and derived selections of entities for each entity type (domain, boundary, edge, and point). For the Import feature, there is an additional selindividual property, which creates selections corresponding to individual geometry objects.
- **•** By adding a selection feature, see Using Selection Features. If this defines a selection of whole objects, derived selections of entities are also created for each entity type (domain, boundary, edge, and point).

You get the tags of the created named selections by

```
String[] selTags = model.component(<ctag>).geom(<tag>).feature(<ftag>).
outputSelection();
```

You can access a named selection by model.geom(*<gtag>*).selection(*<seltag>*), where *<seltag>* is the selection's tag. Usually, *<seltag>* is the same as the tag of the feature that created the selection, but derived selections of entities have a suffix .dom, .bnd, .edg, or .pnt.

You can use a named selection as an input selection in a geometry feature that comes after the feature that created the selection in the geometry sequence, as follows:

```
model.component(<ctag>).geom(<gtag>).feature(<ftag2>).selection(<propname>).
named(<trimmedseltag>);
```

Here, *<trimmedseltag>* is the selection's tag without the suffix.

Each named selection of entities in the geometry sequence can also be used as a named selection on the finalized geometry. You can access this named selection by model.component(*<ctag>*).selection(*<gtag>*\_*<seltag>*). However, if the selection was derived from a selection of whole objects, you access the corresponding selection on the finalized geometry by model.component(*<ctag>*).selection(*<gtag>*\_*<trimmedseltag>*\_*<lvl>*), where *<lvl>* is one of dom, bnd, edg, or pnt. Named selections on the finalized geometry are described in model. selection().

To get the selected objects for a named selection, use

```
String[] so = model.component(<ctag>).geom(<gtag>).selection(<seltag>).objects();
```

