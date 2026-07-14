# *Adding a Model Component (Geometry)*

To add a new geometry to the model object model, enter

```
model.component(<ctag>).geom().create(<tag>,sDim);
```

where *<tag>* is the geometry's tag (an identifier of your choice), and sDim is its space dimension (1, 2, or 3).

The geometry is added to the last created model component. If no model component exists in the model, a model component node tagged comp1 is automatically created for you. A physics interface using the geometry must belong to the same model component as the geometry.

You can change the model component of a geometry by entering

```
model.component(<ctag>).geom(<tag>);
```

where *<ctag>* is the tag of a component node.

