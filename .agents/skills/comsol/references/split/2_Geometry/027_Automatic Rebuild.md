# *Automatic Rebuild*

The autoRebuild setting controls if the geometry sequence is automatically rebuilt when clicking a node in the model tree outside the geometry sequence. You can change it by entering:

```
model.component(<ctag>).geom(<tag>).autoRebuild(<newAutoRebuild>);
```

The default geometry representation is controlled by the preference setting **Geometry>Automatic rebuild when leaving geometry>Default in new geometries**.

The autoBuildNew setting controls if certain geometry operations will be built automatically when you add them, provided that you have preselected a sufficient number of entities or objects. You can change it by entering:

```
model.component(<ctag>).geom(<tag>).autoBuildNew(<AutoBuildNew>);
where <AutoBuildNew> is true or false.
```

The default for building geometry operations automatically is controlled by the preference setting **Geometry>Build new operations automatically>Default in new geometries**.

*Constraints and Dimensions.*

where *<newAutoRebuild>* is on or off.

![](_page_16_Picture_19.jpeg)

These settings are only available if the geometry is 2D and you have a license for the Design Module.

To enable or disable the constraints and dimensions functionality, enter

```
model.component(<ctag>).geom(<tag>).useConstrDim(enable);
```

To determine whether the constraints and dimensions functionality is enabled, enter

boolean enabled = model.component(*<ctag>*).geom(*<tag>*).useConstrDim();

model.component(*<ctag>*).geom(*<tag>*).constrDimBuild(value) determines what constraint and dimension features to use when building the geometry. Valid values are:

- **•** "all": All (enabled) constraint and dimension features are used. This is the default.
- **•** "none": No constraint and dimension features are used.
- **•** "uptotarget": All (enabled) constraint and dimension features up to the feature to build are used.

String value = model.component(*<ctag>*).geom(*<tag>*).constrDimBuild() returns the constraints and dimensions to use when building. The default is "all".

String status = model.component(*<ctag>*).geom(*<tag>*).constrDimStatus() gets a description of the overall status of the constraints and dimensions.

