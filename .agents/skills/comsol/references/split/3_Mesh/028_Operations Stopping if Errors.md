# *Operations Stopping if Errors*

When you build a feature other than any of the BndLayer, FreeTri, FreeQuad, FreeTet, Map, or Sweep features, the operation always stops if an error is encountered. This means that no changes are made to the mesh. The feature gets an error status and if it is part of a sequence build the build stops and the preceding feature becomes the current feature. Information on the error is stored in the feature. Refer to the section Retrieving Mesh Problem Information for more information on accessing this information.

## *Retrieving Mesh Problem Information*

There are three categories of problems that can appear in a meshing sequence: MeshInformation, MeshWarning, and MeshError features. They all contain a message describing the problem and can be equipped with a selection defining the geometric entities or coordinate values specifying a position related to the error. All of these features can have a subfeature of the same type that contains low-level problem information. This means that a problem can be represented by a stack of features that reflects the stack trace of the problem.

For more information about the severity of the problems and possible ways to fix them, see the section Information, Warning, and Error Nodes for Meshing Operations.

Use

```
boolean problem = model.component(<ctag>).mesh(<tag>).feature(<ftag>).hasProblems();
to find out if the feature <ftag> has any reported problems. There are similar methods, hasWarnings() and 
hasErrors(), for warnings and errors, respectively. The following method returns the tags of the problems as well 
as tags that refer to information:
```

```
String[] problemTags = model.component(<ctag>).mesh(<tag>).feature(<ftag>).problems();
Similarly, use the methods warnings() and errors() to get access to only warning and error tags, respectively.
```

The following two methods return the message and any entity selection of the problem *<ptag>*.

```
String problemMessage = model.component(<ctag>).mesh(<tag>).feature(<ftag>).
                         problem(<ptag>).message();
MeshSelection sel = model.component(<ctag>).mesh(<tag>).feature(<ftag>).
                         problem(<ptag>).selection();
```

To retrieve the full stack trace, repeat the above methods until all levels of reported problems have been accessed. See the section Retrieving Problem Information for an example of how to retrieve mesh warnings recursively.

## *Retrieving Information About the Latest Build*

The following methods are available to retrieve the information specific to the build of a mesh feature.

To see the COMSOL version number (and architecture) used for the latest build of the feature, use

```
String version = model.component(<ctag>).mesh(<tag>).feature(<ftag>).
                         buildComsolVersion();
```

To get access to the date and time of the last time a feature was built, enter

```
String date = model.component(<ctag>).mesh(<tag>).feature(<ftag>).buildDate();
```

For information specific to a particular feature, use

```
String info[] = model.component(<ctag>).mesh(<tag>).feature(<ftag>).buildInfo();
```

All above methods return empty strings if the feature has not yet been built. Use

```
int time = model.component(<ctag>).mesh(<tag>).feature(<ftag>).buildTime();
```

to get the time (in seconds) it took to build the feature the last time it was built. In case the feature has not been built, it will return -1. Enter

```
String output[][] = model.component(<ctag>).mesh(<tag>).feature(<ftag>).buildOutput();
```

to get an N-by-2 matrix with output information from the build. The matrix will be empty if the feature does not save output information or if the feature has not yet been built.

