# *Feature Status*

The *status* of a feature can be one of the following:

- **•** *Built*. This means that the none of the feature's properties have changed since the feature was last built, and the features of the input objects are all built. The feature can contain warning messages.
- **•** *Edited*. This means that some of the feature's properties have changed since the feature was last built.
- **•** *Needs rebuild*. This means that any of the preceding features is edited.
- **•** *Error*. This means that the feature contains an error message.
- **•** *Warning*. This means that the feature contains a warning message.

You can examine the status of a feature by entering

```
boolean built = model.component(<ctag>).mesh(<tag>).feature(<ftag>).isBuilt();
boolean edited = model.component(<ctag>).mesh(<tag>).feature(<ftag>).isEdited();
boolean hasError = model.component(<ctag>).mesh(<tag>).feature(<ftag>).hasError();
boolean hasWarning = model.component(<ctag>).mesh(<tag>).feature(<ftag>).hasWarning();
boolean needsRebuild = !(built || edited || hasError || hasWarning);
```

