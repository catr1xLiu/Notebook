# *Selections*

Most mesh features have entity selections, to specify where they operate. To access a feature's entity selection, use the syntax

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
To specify the entire geometry, write
  model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().allGeom();
To specify all geometric entities in dimension <dim>, write
  model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().geom(<dim>).all();
To specify the geometric entities that remains to be meshed when the feature is about to be built, use
  model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().remaining();
```

It is not possible to retrieve the geometric entities of this selection, unless the feature is built.

If entities is an integer array of geometric entities in dimension dim, use the following syntax to select these entities

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().geom(dim).set(entities);
For example, to selection domain 1 and 2 in a 3D geometry, write
```

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().geom(3).
      set(new int[]{1,2});
```

To add the geometric entities specified in the integer array *<entities>* in dimension *<dim>* to the selection, write

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().geom(<dim>).
      add(<entities>);
```

To remove the geometric entities specified in the integer array *<entities>* in dimension *<dim>* from the selection, write

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().geom(<dim>).
      remove(<entities>);
```

To clear the selection in dimension *<dim>*, write

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().geom(<dim>).clear();
```

Some features have more than one selection, for example sweep, where it is possible to specify source and destination faces. Use the following syntax to access these selections.

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(<property>);
```

Thus, to specify boundary 5 as source face on the sweep feature swe1, write

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection("sourceface").
      geom(2).set(5);
```

#### **NAMED SELECTIONS**

To specify a named selection, *<stag>*, for the selection of the feature *<ftag>*, use

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().named(<stag>);
```

For meshes that are coupled to a geometry, you can use selections defined under definitions and selections defined by the geometry. See model.selection() and Named Selections for more information about selections defined under definitions and by the geometry, respectively.

For meshes that define their own geometric model, use the following methods to get hold of the tags *<stag>* for named selections. For more information, see Geometric Model. Both methods return empty string arrays if there are no named selections. Selections defined under Definitions cannot be used.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).outputSelection() returns the tags of named selections (selection output objects) that are defined.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).componentSelection() returns tags of the selection in model.selection() that are derived from the selections in the feature. If the sequence does not define the geometrical model of the component, componentSelection() returns an empty result. For more information about using named selections in the component, see the section Selections.

