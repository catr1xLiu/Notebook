# *Automatic Rebuild*

The autoRebuild setting is a GUI setting which controls if the mesh sequence is automatically rebuilt when clicking a node in the model tree outside the mesh sequence where the mesh is used. You can change it by entering:

```
model.component(<ctag>).mesh(<tag>).autoRebuild(<newAutoRebuild>);
```

where *<newAutoRebuild>* is on or off. The setting will only be available in the GUI and have effect if the mesh *<tag>* defines its own geometric model and the physics is defined on this geometric model. To control on which geometric model to define the physics, use:

```
model.component(<ctag>).definedByMesh(<tag>);
```

where *<tag>* corresponds to the same mesh as for autoRebuild.

## *Length and Angular Units*

The length and angular units are determined by the corresponding geometry properties. See the sections Length Unit and Angular Unit for more information.

