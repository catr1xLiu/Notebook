# *Length Unit*

The default length unit is meter. To change the length unit, enter

```
model.component(<ctag>).geom(<tag>).lengthUnit(newLengthUnit);
where newLengthUnit is a string like "mm", "in", or "ft".
```

To get the current length unit, enter

```
String currentUnit = model.geom(<tag>).lengthUnit();
```

The length unit is used in fields for lengths and for visualization of the geometry. In fields you can override the unit (for example, by entering 13[mm]). When solving the model, all lengths are converted to meters.

