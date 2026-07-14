# *Feature Status*

The *status* of a feature can be one of the following:

- **•** *Built* or *warning.* This means that the none of the feature's properties have changed since the feature was last built, and the features of the input objects are all built. If the status is *warning*, the feature contains warning messages.
- **•** *Edited*. This means that some of the feature's properties have changed since the feature was last built.
- **•** *Needs rebuild*. This means that the feature generating some input object is not built.
- **•** *Error*. This means that the feature contains an error message.

You can examine the status of a feature by entering

```
String status = model.geom(<tag>).feature(<ftag>).status();
```

