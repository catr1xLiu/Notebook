# *Deleting and Disabling Geometry Features*

To delete a feature, enter

```
model.component(<ctag>).geom(<tag>).feature().remove(<ftag>);
```

To disable a feature, enter

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).active(false);
```

The disabled feature does not affect the finalized geometry — its output is empty. To enable a disabled feature, enter

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).active(true);
```

You can get the enabled/disabled status of a feature by entering

```
boolean isEnabled = model.component(<ctag>).geom(<tag>).feature(<ftag>).active();
```

