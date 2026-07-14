# *Growth Rate in Mesh*

The growth rate value is a local measure greater than or equal to 1 indicating the maximum element size growth rate between two neighboring elements.

To retrieve the maximal growth rate value for a selection, use

```
double model.component(<ctag>).mesh(<tag>).stat().getMaxGrowthRate();
```

To retrieve the average growth rate for a selection, use

```
double model.component(<ctag>).mesh(<tag>).stat().getMeanGrowthRate();
```

The following methods are available directly on the sequence and provide statistics for the entire geometry:

```
double model.component(<ctag>).mesh(<tag>).getMaxGrowthRate();
double model.component(<ctag>).mesh(<tag>).getMeanGrowthRate();
```

## *Mesh Status*

You can check if the entire selected geometry has a mesh by calling the isComplete method.

```
boolean model.component(<ctag>).mesh(<tag>).stat().isComplete();
```

To check if the entire geometry is meshed, use

```
boolean model.component(<ctag>).mesh(<tag>).isComplete();
```

You can also check if the selected geometry has an empty mesh by calling the isEmpty method.

```
boolean model.component(<ctag>).mesh(<tag>).stat().isEmpty();
```

To check if the entire geometry has an empty mesh, use

```
boolean model.component(<ctag>).mesh(<tag>).isEmpty();
```

