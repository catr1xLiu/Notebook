# Measurements

Geometric measurements is a tool to measure geometric entities and objects. You access it by entering

```
model.component(<ctag>).geom(<tag>).measure();
```

using the GeomSequence.measure() method.

This command measures objects that exist in the current build state (corresponding to what you would see in the COMSOL Desktop). You cannot measure objects not yet built or object that are built but has been consumed as input in another operation.

The geometric measurements tool supports the applicable measurement options (for computing a volume, for example) used with the measure method in the section below.

See also CentroidMeasurement and DistanceMeasurement that creates parameters to be used in geometry features and when setting up the physics.

