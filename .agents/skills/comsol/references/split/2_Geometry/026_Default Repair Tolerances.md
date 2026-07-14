# *Default Repair Tolerances*

The repair tolerance for the applicable geometry operations can be of three types: automatic (the default), relative, or absolute. The automatic repair tolerance provides suitable settings when using the CAD kernel; when using the COMSOL kernel, it sets a relative repair tolerance of 1e-6. You specify the default repair tolerance type by entering:

```
model.component(<ctag>).geom(<tag>).repairTolType(<newRepairTolType>)
```

where *<newRepairTolType>* is any of auto, relative, or absolute.

The *default relative repair tolerance* is 1e-6 (it can be any positive scalar value smaller than 0.1). You can change it by entering

```
model.component(<ctag>).geom(<tag>).repairTol(<newRelativeRepairtol>);
```

When doing so, the software also sets the repairTolType to relative. To get the current default relative repair tolerance, enter

```
double reptol = model.component(<ctag>).geom(<tag>).repairTol();
```

The *default absolute repair tolerance* is 1e-6 (it can be any positive scalar value). You can change it by entering

```
model.component(<ctag>).geom(<tag>).absRepairTol(<newAbsoluteRepairtol>);
```

When doing so, the software also sets the repairTolType to absolute. To get the current default absolute repair tolerance, enter

```
double reptol = model.component(<ctag>).geom(<tag>).absRepairTol();
```

The default repair tolerance is the default value that is used when you add a new feature that has the repair tolerance properties — for example, Boolean operations and conversions. Changing the default repair tolerance does not affect the tolerances in existing features. Adjust the repair tolerance if you experience problems with a Boolean operation.

