# *Scale Values When Changing Unit*

When you change the length unit or angular unit there are two possibilities to interpret pure numeric values in the geometry and meshing sequences. The first possibility is to reinterpret the numeric value in the new unit; a circle of radius 1.0 (meter) becomes a circle of radius 1.0 (millimeter), assuming the length unit changes from meter to millimeter.

The other possibility is to scale the numbers; a circle of radius 1.0 (meter) becomes a circle of radius 1000.0 (millimeter). To control the behavior, use

```
model.component(<ctag>).geom(<tag>).scaleUnitValue(newScaleValue);
```

where *newScaleValue* is true if you want values to be scaled, and false otherwise. The default value is false.

To get the currently used method, enter

```
boolean currentScaleValue = model.component(<ctag>).geom(<tag>).scaleUnitValue();
```

