# *Selecting Objects and Entities to Measure*

To select entities you want to measure, enter

```
model.component(<ctag>).geom(<tag>).measure().selection().init(entDim);
model.component(<ctag>).geom(<tag>).measure().selection().set(<objname>,entities);
```

where *entDim* is the dimension of the entities, *<objname>* is the object name, and *entities* is an integer array containing the entity numbers.

For more information about selecting geometry objects, see Geometry Object Selection Methods.

