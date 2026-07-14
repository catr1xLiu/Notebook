# *Adding a Mesh Feature*

To add a feature to a mesh with tag *<tag>*, enter

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,ftype);
```

where *<ftag>* is the feature's tag (an identifier of your choice), and *ftype* is the feature's type. Feature types are capitalized and case-sensitive (for example, FreeTet).

When you add a feature, it is inserted after the *current feature*. You can get the tag of the current feature type by entering

```
String ftag = model.component(<ctag>).mesh(<tag>).current();
```

If ftag is the empty string, the current feature is the beginning of the meshing sequence, that is, the empty state before all features. Adding a meshing feature, it automatically becomes current, but it is not built automatically.

For some operation features it is possible to add attribute features. To add an attribute feature to an operation feature, enter

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,ftype);
```

where *<ftag1>* is the attribute feature's tag (an identifier of your choice), and *ftype* is the attribute feature's type.

All properties in a new feature get a default value.

## *Editing a Mesh Feature*

To change a property value in a feature, enter

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
```

where *property* is a property name and *<value>* is a property value.

All numeric properties can be given either as a numeric value or as a string expression that can contain parameters defined in model.param(). When building the feature, the string expressions are evaluated using the current values of the parameters.

To get the value of a property, enter one of the following, depending on the property type:

```
double d = model.component(<ctag>).mesh(<tag>).feature(<ftag>).getDouble(property);
String s = model.component(<ctag>).mesh(<tag>).feature(<ftag>).getString(property);
double[] da = model.component(<ctag>).mesh(<mtag>).feature(<ftag>).
              getDoubleArray(property);
String[] sa = model.component(<ctag>).mesh(<tag>).feature(<ftag>).
              getStringArray(property);
```

If you request a numerical value for a string property, it is evaluated using the current values of the parameters in model.param().

To modify the mesh, you must *build* an operation feature. Enter

```
model.component(<ctag>).mesh(<tag>).run(<ftag>);
```

to build the feature *<ftag>* and all its preceding features (the features are built in the order from the first to the last). When the build has completed, the feature *<ftag>* becomes the current feature.

To build all features, enter

```
model.component(<ctag>).mesh(<tag>).run();
```

