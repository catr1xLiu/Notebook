# **SYNTAX**

This section describes the general syntax for selections on the finalized geometry. For selections in the geometry sequence, see Geometry Object Selection Methods under model.geom()and Selections under Editing a Geometry Feature. Many objects use selections, but most of them only support a subset of the assignment methods described here. The methods supported by the named selections in model.selection() are listed in model.selection(). Other objects that use a selection support the methods relevant for the type of feature they represent. For example, a physics boundary condition feature requires a boundary selection. Therefore is does not

support *selection*.global(), which makes the selection global, or *selection*.allGeom(), which makes the selection apply to the whole geometry at all levels. Using an unsupported assignment method results in an error.

![](_page_9_Picture_1.jpeg)

The *selection* part here represents any valid selection syntax that ends with ...selection(), such as model.component(*<ctag>*).physics(*<ptag>*).feature(*<ftag>*).selection().

There can also be a filtering of the entities assigned to a selection. Again, take a physics boundary condition as an example. Some boundary conditions only apply to the boundaries exterior to the domains where the physics interface is active, other boundary conditions only to boundaries interior to where the physics interface is active, and so on. Therefore *selection*.entities(*dim*) can sometimes return less entities than have been assigned using *selection*.set(*<entlist>*). On the other hand, *selection*.inputEntities() always returns all entities used in the assignment *selection*.set(*<entlist>*). *selection*.inputEntities() returns the domains used as input to the selection. If the selection is of the type *interior*, *exterior*, or *meshinterior*, this method returns the unfiltered list of domains at the higher dimension that are used as the input. If the selection is not a selection of domains at a certain level, or the selection is not of the types Explicit or FromGeom (derived from a geometry feature), this method returns null.

Some selections only allow a single geometric entity, a single domain, a single boundary, edge, or point. Such selections are called *single selections*. Single selections cannot be defined by another selection and therefore do not support *selection*.named(*<stag>*).

*selection*.global() sets the selection to be the global selection.

*selection*.geom(*<gtag>*) sets the selection to be all entities in the geometry *<gtag>*.

*selection*.geom(*<gtag>*,*dim*) specifies that subsequent calls to all, set, add, and remove refer to entities at the dimension *dim* on the geometry *<gtag>*. If there is only one possible geometry, using *selection*.geom(*dim*) is equivalent. Also, if there is only one allowed dimension *dim*, then all, set, and remove can be used directly as it is then unambiguous to which geometry and dimension their arguments apply to.

*selection*.geom(*<gtag>*,*highdim*,*lowdim*,*typelist*) specifies that subsequent calls to all, set, add, and remove refer to entities of dimension *highdim* on the geometry *<gtag>*. The entities that are obtained are those that are both of dimension *lowdim* and of any of the types listed in *<typelist>*. It is required that highdim > lowdim. The available types are:

- **•** exterior: All entities of dimension *lowdim* that lie on the exterior of the entities at dimension *highdim*.
- **•** interior: All entities of dimension *lowdim* that lie in the interior of the entities at dimension *highdim*.
- **•** meshinterior: All interior mesh entities of dimension *lowdim* that lie in the interior of the entities at dimension *highdim*.

*selection*.allGeom() sets the selection to a whole geometry. Can be used instead of *selection*.geom(*<gtag>*) when the geometry tag is unambiguous.

*selection*.geom(*dim*) specifies that subsequent calls to all, set, add, and remove refer to entities of dimension *dim*. Can be used instead of *selection*.geom(*<gtag>*,*dim*) when the geometry tag is unambiguous.

*selection*.all() sets the selection to use all geometric entities in the geometry at the dimension where the selection applies. Note that you must precede this call with, for example, a *selection*.geom(*dim*) call to specify the dimension if there is more than one allowed dimension for the feature, which is the case for geometry features. The following example code show how to select all boundaries for a circle (disk) geometry:

```
Model model = ModelUtil.create("Model");
GeomSequence g = model.geom().create("geom1", 2);
g.create("c1", "Circle");
```

```
g.run();
g.measureFinal().selection().geom(1);
g.measureFinal().selection().all();
```

*selection*.allVoids() sets the selection to use all voids (finite voids and an infinite void, if present) in the geometry at the dimension where the selection applies. Voids can be present in models that use the boundary element method, for example. In a geometry with voids, *selection*.all() selects all domains, not the voids.

*selection*.set(*<entlist>*) sets the selection to use the geometric entities in *<entlist>*. Note that the list of entity numbers is always sorted in ascending order and that duplicates are removed before storing the numbers in the selection object.

*selection*.add(*<entlist>*) adds the geometric entities in *<entlist>* in the geometry to the set of geometric entities that the selection uses to obtain the selection.

*selection*.remove(*<entlist>*) removes the geometric entities in *<entlist>* in the geometry from the set of geometric entities that the selection uses.

*selection*.clear() removes all entities from the selection.

*selection*.inherit(*boolean*) indicates whether the selection should include all geometric entities that are specified by any of the other methods and all geometric entities at lower dimensions that are adjacent to the ones already specified.

*selection*.named(*<stag>*) specifies that the selection is defined by the selection model.selection(*<stag>*).

*selection*.isGlobal() returns true if the selection is global.

*selection*.isGeom() returns true if the selection is a whole geometry.

*selection*.geom() returns the geometry tag of the selection as a string. If the selection is global, null is returned.

*selection*.dimension() returns the dimensions on a geometry where the selection applies as an integer array.

*selection*.dim() returns the largest entity dimension on which the selection applies.

*selection*.entities(*dim*) returns the geometric entities of the selection on the given geometry at the given dimension as an integer array. The entities are represented using unique positive integers, except (if the model geometry contains voids) for finite voids, which get unique negative integer numbers, and for an infinite void, which is represented with the entity number 0.

*selection*.entities() returns the geometric entities of the selection on the given geometry at the largest entity dimension as an integer array.

*selection*.interiorEntities(*dim*) returns the interior mesh domains as an integer array.

*selection*.isInheriting() returns true if the selection is inherited to lower dimension levels.

*selection*.inputDimension() returns the dimension of the entities used as input to the selection.

*selection*.inputEntities() returns the entities used as input to the selection.

If the selection is defined by another selection, *selection*.named() returns the tag of that selection. Otherwise *selection*.named() returns an empty string.

Selections of the class XDLocalSelection have the following additional methods:

*selection*.extraDim() returns the tag of a feature of type AttachDimension in model.extraDim(), or an empty string if no extra dimension attachment is used.

*selection*.extraDim(<*attachdimtag*>) sets the extra dimension attachment feature. <*attachdimtag*> must be the tag of a feature of type AttachDimension in model.extraDim() or an empty string to indicate no extra dimension attachment.

*selection*.extraDimSel(<*xdgeomtag*>) returns the selection in extra dimension geometry <xdgeomtag>. <xdgeomtag> should be the tag of the geometry in one of the extra dimensions attached by the extra dimension attachment feature defined by *selection*.extraDim().

extraDimSel() returns all extra dimension geometry tags that are valid arguments of extraDimSel(<*xdgeomtag*>) as a string array.

#### **NOTES**

The methods global(), geom(*<gtag>*), geom(*<gtag>*,*dim*), geom(*<gtag>*,*highdim*,*lowdim*,*typelist*), and geom(*dim*) clear the dataset by other methods.

Not all assignment methods are supported by all model entities. The list of supported methods also serves as a guide for the restriction to those named selections that can be used by that entity. All access methods are always supported.

#### **SEE ALSO**

model.geom()

