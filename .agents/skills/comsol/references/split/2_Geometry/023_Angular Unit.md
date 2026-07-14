# *Angular Unit*

The default angular unit is degrees. To change the angular unit, enter

```
model.component(<ctag>).geom(<tag>).angularUnit(newAngularUnit);
```

where *newAngularUnit* is deg or rad.

To get the current angular unit, enter

```
String currentUnit = model.component(<ctag>).geom(<tag>).angularUnit();
```

The angular is used in fields for angles. You can override the unit, for example by entering 0.3[rad]. Numeric inputs and outputs of trigonometric functions are always assumed to be in radians, though.

