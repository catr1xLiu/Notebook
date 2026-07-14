# **COMPATIBILITY**

The constrStateMap property has been removed in version 6.3.

The parameters property is deprecated in version 6.1 and has been replaced by the freq or time property. It may be removed in future versions, but until then, for backward compatibility, changing the parameters property automatically triggers a corresponding change of freq or time (but not the other way around).

The following methods are deprecated in version 5.5 and may be removed in future versions:

```
getOutputs()
getControls()
getParameters()
getValues(String[])
getVectors()
getMatrices()
getDescription(String[])
getString(String)
setControl(String, String)
```

The following methods are not supported:

```
create(<tag>)
create(<tag>, filepath)
setParameter(String, String)
renameControl(String, String)
renameOutput(String, String)
```

*model.result()*

Postprocessing and results interface.

```
SYNTAX
```

```
model.result();
model.result().create(<pgtag>,dim);
model.result().create(<pgtag>,ftype);
model.result(<pgtag>).set(property,<value>);
model.result(<pgtag>).run();
model.result(<pgtag>).create(<ftag>,ftype);
model.result(<pgtag>).feature(<ftag>).getPlotGroup();
model.result(<pgtag>).feature(<ftag>).getType();
model.result(<pgtag>).feature(<ftag>).getSDim();
model.result(<pgtag>).feature(<ftag>).isPlotGroup();
model.result(<pgtag>).feature(<ftag>).prepareView(<value>);
model.result(<pgtag>).feature(<ftag>).selection(...);
model.result(<pgtag>).feature(<ftag>).set(property,<value>);
model.result(<pgtag>).feature(<ftag>).run();
model.result(<pgtag>).feature(<ftag>).create(<attrtag>, attrtype);
model.result(<pgtag>).feature(<ftag>).feature(<attrtag>).set(property,<value>);
model.result().dataset().create(<dtag>,dtype);
model.result().dataset(<dtag>).create(<dtag2>,dtype);
model.result().dataset(<dtag>).selection(...);
model.result().dataset(<dtag>).set(property,<value>);
model.result().export().create(<etag>,<pgtag>,ctype);
model.result().export(<etag>).create(<e2tag>,ctype);
model.result().export(<etag>).set(property,<value>);
model.result().export(<etag>).run();
model.result().numerical().create(<ntag>,ntype);
model.result().numerical(<ntag>).selection(...);
model.result().numerical(<ntag>).set(property,<value>);
model.result().numerical(<ntag>).run();
model.result().table().create(<ftag>,ntype);
model.result().table(<ftag>).setColumnHeaders(<headers>);
model.result().table(<ftag>).setTableData(<realData>,<imagData>);
model.result().table(<ftag>).getColumnHeaders();
model.result().table(<ftag>).getReal();
model.result().table(<ftag>).getImag();
model.result().table(<ftag>).isComplex();
model.result().table(<ftag>).clearTableData();
model.result().table(<ftag>).save(<filename>);
model.result().report().create(<rtag>);
model.result().report(<rtag>).set(rprop,<value>);
model.result().report(<rtag>).set("template", <value>);
model.result().report(<rtag>).generate();
model.result().report(<rtag>).create(<r2tag>,frtype);
model.result().report(<rtag>).feature(<r2tag>).set(rprop,<value>);
model.result().report(<rtag>).feature(<r2tag>).create(<r3tag>,frtype);
model.result().report(<rtag>).feature(<r2tag>).feature(<r3tag>).set(rprop,<value>);
model.result().report(<rtag>).run();
```

#### **DESCRIPTION**

model.result(*<pgtag>*)returns a plot group with tag *<pgtag>*.

model.result().create(*<pgtag>*,*dim*) creates a plot group with the tag *<pgtag>*, of dimension *dim*, where *dim* can be 1, 2, or 3.

model.result().create(*<pgtag>*,*ftype*) creates a plot group of type *ftype*. The valid types are "PlotGroup1D", "PlotGroup2D", "PlotGroup3D", "PolarGroup", and "SmithGroup".

model.result(*<pgtag>*).create(*<ftag>*,*ftype*) creates a plot feature of type *ftype* tagged *<ftag>* belonging to the plot group *<pgtag>*.

model.result(*<pgtag>*).feature(*<ftag>*).getType() returns the type of the feature *<ftag>*. This is the same string *ftype* that was used to create the feature.

model.result(*<pgtag>*).feature(*<ftag>*).getSDim() returns the spatial dimension of the plot group.

model.result(*<pgtag>*).feature(*<ftag>*).isPlotGroup() return true if the feature is a plot group. This method is also available on the child features.

model.result(*<pgtag>*).feature(*<ftag>*).getPlotGroup() returns the plot group the feature belongs to. This method is also available on the child features.

model.result(*<pgtag>*).feature(*<ftag>*).create(*<attrtag>*,*attrtype*) creates an attribute feature with the tag *<attrtag>* of type *attrtype*, belonging to the feature *<ftag>*.

model.result(*<pgtag>*).run() plots the plot group.

model.result(*<pgtag>*).feature(*<ftag>*).prepareView(*<value>*) returns the view to use when plotting the plot group to which the feature belongs. The argument is a boolean, and if true, the view is created if needed.

model.result().dataset().create(*<dtag>*,*dtype*) creates a dataset feature with the tag *<dtag>* and the type *dtype*.

model.result().export().create(*<etag>*,*<pgtag>*,*etype*) creates an export feature with the tag *<etag>*, belonging to plot group *<pgtag>* and of export type *etype*.

model.result().numerical().create(*<ntag>*,*ntype*) creates a numerical results feature with the tag *<ntag>* of the numerical feature type *ntype*.

model.result().numerical(*<ntag>*).run() evaluates the numerical results feature.

model.result().dataset(*<dtag>*).refresh() updates Grid dataset using data from functions that read files (Elevation, Image, and Interpolation).

model.result().table().create(*<ftag>*,*ntype*) creates a table feature with the tag *<ftag>*. The set and get methods used to manipulate tables are described in Table.

The data extraction methods used to retrieve plot or numerical data are described in Results.

model.result().report().create(*<rtag>*,"Report") creates a report with tag *<rtag>*.

model.result().report().create(*<ptag>*,"Presentation") creates a presentation with tag *<ptag>*.

model.result().report().create(*<ttag>*,"Template") creates a report template with tag *<ttag>*. Such report templates are customized alternatives to the built-in templates: brief, intermediate, and complete. A complete report template contains a single instance of each of the regular model-contents report features. When a model-contents report feature occurs in a template, the available properties match those of the corresponding regular report feature. However, some regular report-feature properties, such as the noderef property for referencing the model feature to report on, are not applicable and therefore not available.

To set up a template template, you can build it feature by feature or use one of the built-in templates as the starting point and then generate it before customizing the settings:

```
template.set("level",lvalue);
template.set("absentnodes",state);
template.generate();
```

The allowed values for the level property are "brief", "intermediate" (default), and "complete". The value of this property is also used to define the initial settings when building the template manually. The absentnodes property can take two values:

- **•** "exclude" (default) template nodes that are absent from or disabled in the template are *excluded* when generating a report using the template;
- **•** "include" conversely, template nodes that are absent from or disabled in the template are *included* when generating a report using the template.

Having created the report report, specify which template to use and then generate contents:

```
report.set("template",value);
report.generate();
```

The allowed values for the template property depends on the availability of custom templates in the model, the installation, and the user's report templates directory:

- **•** The built-in templates, "brief", "intermediate" (default), and "complete", are always available.
- **•** If the model contains report templates with tags tmpl1, …, tmpl*n*, these can be chosen as templates for report by setting the template property to any of the values "model.tmpl1", …, "model.tmpl*n"*, with model being a fixed namespace prefix.
- **•** If the directory data/reporttemplates under the COMSOL Multiphysics installation root directory contains MPH-files with report templates, these can be chosen by setting template to "installation.*<TemplateFilename>*.*<ttag>*". Here installation is a fixed namespace prefix, *<TemplateFilename>*.mph is the name of the MPH-file, and *<ttag>* is a report template tag.
- **•** Finally, if the reporttemplates directory under the user settings directory .comsol/v63 under your local home directory contains MPH-files with report templates, these are chosen using the same pattern as for installation templates with the difference that the namespace prefix is user.

Note that if report already has child nodes when report.generate() is called, these nodes will be removed before the generation of new contents.

model.result().report().create(*<ttag>,*"PresentationTemplate") creates a presentation template with tag *<ttag>*. Such presentation templates are customized alternatives to the built-in templates: default and detailed. A complete presentation template contains a single instance of each of the regular model-contents presentation features. When a model-contents presentation feature occurs in a template, the available properties match those of the corresponding regular presentation feature. However, some regular presentation-feature properties, such as the noderef property for referencing the model feature to include, are not applicable and therefore not available.

report.create(*<tptag>,*"TitlePage") adds a title page to the report report. Only one title-page feature can be added.

report.create(*<tptag>,*"TitleSlide") adds a title slide to the presentation presentation. Only one titleslide feature can be added.

report.feature(*<tptag>*).set(*prop,value*) sets the title-page property *prop* to the value *value*.

report().create(*<toctag>,*"TableOfContents") adds a table of contents to the report report. Only one table-of-contents feature can be added.

report.create(*<stag>*,"Section") adds an additional section level to the report.

report.create(*<stag>*,"SectionSlide") adds a section slide to the presentation.

report.feature(*<stag>).*set*(prop*,*value)*

report.feature(*<stag>*).create(*<ftag>*),*feature*)

report.feature(*<stag>*).feature(*<ftag>*).*set(prop*,*value)*

To add a report or presentation contents feature — that is, a feature corresponding to content in the report or presentation — to a section feature section, type, section.create(*<frtag>*,*frtype*,…). Depending on the feature type *frtype*, the create operation includes zero, one, or two tags that refer to the model feature to include. The tags must refer to an existing feature of the correct type. The feature types that are available for reporting on the model contents are listed in Table 2-120. For details on their usage, see the section Model Contents — Report Components in the *COMSOL Multiphysics User's Guide*.

TABLE 2-120: MODEL-CONTENTS REPORT FEATURES.

| REPORT FEATURE       | DESCRIPTION                                                                                                                                                 |  |  |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------|--|--|
| Model                | Prints information about the model root, such as model file.                                                                                                |  |  |
| ModelNode            | Prints information about a model component.                                                                                                                 |  |  |
| Parameter            | Reports on a global parameters feature.                                                                                                                     |  |  |
| Variables            | Reports on a variables feature.                                                                                                                             |  |  |
| Functions            | Reports on a function feature.                                                                                                                              |  |  |
| ThermoPackage        | Reports on a thermodynamics property-package feature (requires a Chemical Reaction<br>Engineering Module license).                                          |  |  |
| MethodCall           | Report on a method-call feature.                                                                                                                            |  |  |
| Group                | Report on a constraint- or load-group feature.                                                                                                              |  |  |
| ReducedModel         | Report on a reduced-model feature.                                                                                                                          |  |  |
| GeometryPart         | Report on a geometry part.                                                                                                                                  |  |  |
| MeshPart             | Report on a mesh part.                                                                                                                                      |  |  |
| ExtraDim             | Prints information about an extra-dimension model component.                                                                                                |  |  |
| ExpressionOperator   | Report on an expression-operator feature.                                                                                                                   |  |  |
| MatrixVariable       | Report on a matrix-variable feature (Matrix, Matrix Inverse, Matrix Diagonalization,<br>Matrix Decomposition (SVD), Vector Transform, or Matrix Transform). |  |  |
| EquationContribution | Report on an equation-contribution feature (State Variables, Dependent Variable Field,<br>Weak Contribution, or Constraint).                                |  |  |
| ParticipationFactors | Report on a participation-factors feature.                                                                                                                  |  |  |
| BucklingImperfection | Report on a buckling-imperfection feature.                                                                                                                  |  |  |
| ResponseSpectrum     | Report on a response-spectrum feature.                                                                                                                      |  |  |
| MassProperties       | Reports on a mass-properties feature.                                                                                                                       |  |  |
| Probe                | Reports on a probe feature.                                                                                                                                 |  |  |
| ComponentCoupling    | Reports on a component-coupling feature.                                                                                                                    |  |  |
| Selection            | Reports on a selection feature.                                                                                                                             |  |  |
| Pair                 | Reports on a pair feature.                                                                                                                                  |  |  |
| CoordinateSystem     | Reports on a coordinate system feature.                                                                                                                     |  |  |
| MovingMesh           | Report on a moving-mesh feature.                                                                                                                            |  |  |
| DeformedGeometry     | Report on a deformed-geometry feature.                                                                                                                      |  |  |
| Optimization         | Report on an optimization feature.                                                                                                                          |  |  |
| ParameterEstimation  | Report on a parameter-estimation feature.                                                                                                                   |  |  |

TABLE 2-120: MODEL-CONTENTS REPORT FEATURES.

| REPORT FEATURE   | DESCRIPTION                                          |
|------------------|------------------------------------------------------|
| AbsorbingLayer   | Reports on an absorbing-layer feature.               |
| PML              | Reports on a perfectly-matched-layer feature.        |
| InfiniteElements | Reports on an infinite-element-domain feature.       |
| MultiphysicsProp | Reports on a Multiphysics-properties feature.        |
| Geometry         | Reports on a geometry.                               |
| Material         | Reports on a material feature.                       |
| Physics          | Reports on a physics interface and its features.     |
| Multiphysics     | Reports on a multiphysics coupling and its features. |
| Mesh             | Reports on a mesh.                                   |
| Study            | Reports on a study.                                  |
| Solver           | Reports on a solver.                                 |
| ResultParameter  | Reports on a result-parameters feature.              |
| Configuration    | Reports on a configuration feature.                  |
| DataSet          | Reports on a dataset feature.                        |
| DerivedValues    | Reports on a derived-values feature.                 |
| Table            | Includes a results table in the report.              |
| ColorTable       | Includes a custom color table in the report.         |
| PlotGroup        | Includes a plot group in the report.                 |
| EvaluationGroup  | Reports on an evaluation-group feature.              |
| Export           | Includes an export feature in the report.            |

In addition, the custom feature types listed in Table 2-121 are also available for building reports and presentations. Their usage is described in the section Custom Report, Documentation, and Presentation Components in the *COMSOL Multiphysics User's Guide*.

TABLE 2-121: CUSTOM-CONTENTS REPORT FEATURES.

| REPORT FEATURE | DESCRIPTION                                 |
|----------------|---------------------------------------------|
| Equation       | Adds an equation to the report.             |
| Heading        | Adds a heading to the report.               |
| Image          | Adds an image to the report.                |
| List           | Adds a list to the report.                  |
| ListItem       | Adds an item to a list.                     |
| Tbl            | Adds a custom table to the report.          |
| TblHRow        | Adds a heading row to a custom table.       |
| TblRow         | Adds a body row to a custom table.          |
| Text           | Adds a text paragraph to the report.        |
| Code           | Adds a text paragraph with code formatting. |

Finally, a number of report feature types are provided for creating reports and presentations for apps created in the Application Builder. These are listed in Table 2-122. For further details, see the sections Arrays and Scalars and Declaration Components in the *COMSOL Multiphysics User's Guide* and references therein.

TABLE 2-122: ARRAYS, SCALARS, AND DECLARATION-CONTENTS REPORT FEATURES.

| REPORT FEATURE                                                                                        | DESCRIPTION                                                                                                                              |
|-------------------------------------------------------------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------|
| Arrays                                                                                                | Adds a customized table for Array 1D and Array 2D declaration nodes defined<br>under the Declarations branch in the Application Builder. |
| Scalars                                                                                               | Adds a table where the columns to include and the table data rows can be<br>customized.                                                  |
| ChoiceList                                                                                            | Reports on a choice list.                                                                                                                |
| UnitSet                                                                                               | Reports on a unit set.                                                                                                                   |
| StringDataField,<br>BooleanDataField,<br>IntegerDataField,<br>DoubleDataField                         | Reports on scalar data declarations.                                                                                                     |
| StringArrayDataField,<br>BooleanArrayDataField,<br>IntegerArrayDataField,<br>DoubleArrayDataField     | Reports on 1D array data declarations.                                                                                                   |
| StringMatrixDataField,<br>BooleanMatrixDataField,<br>IntegerMatrixDataField,<br>DoubleMatrixDataField | Reports on 2D array data declarations.                                                                                                   |

To point a report feature rFeature to another feature with tag *<ftag>* in the tree, use the method rFeature.set("noderef",*<ftag>*) method. A report contents feature must point to a feature of the type it is designed to report on; see the table above. Instead of a feature tag, set "noderef" to "none" to clear a reference.

```
model.result().report(<rtag>).feature(<stag>).feature(<frtag>).set(frprop,<value>)
to set a property in a report feature.
```

