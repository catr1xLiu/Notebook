# *Mesh Plot*

Create a mesh plot by calling the createPlot method.

```
model.component(<ctag>).mesh(<tag>).createPlot(<dtag>, <ptag>);
```

where dtag is the tag of the mesh dataset that the plot will refer to. If such a dataset already exists, and it refers to a mesh sequence, it is used. Otherwise, a new mesh dataset with tag dtag is created. The method creates and returns a plot group with the tag ptag. The mesh plot is generated from one or more mesh plot features in this plot group.

## *Measurements*

To measure geometric entities in a mesh, use

```
model.component(<ctag>).mesh(<tag>).measure().measurementMethod;
where <ctag> is the component and <tag> is the mesh.
```

The methods return the volume, area, length, vertex coordinates, average coordinates, or distance between two vertices according to the entity selection. Measurements are performed on the output mesh from the last built mesh feature. For a list of the available measurement methods to use, see Measurement Methods. For information about methods to select entities, see the section Selections.

