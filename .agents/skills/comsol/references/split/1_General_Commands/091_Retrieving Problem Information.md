# *Retrieving Problem Information*

Problems here means the union of warnings and errors.

#### **EXAMPLE OF RETRIEVING PROBLEM INFORMATION IN A MESH**

The following example shows how to retrieve information about a problem in the mesh (the same syntax also works for problems in the geometry):

**1** Build a geometry:

```
Model mdl = ModelUtil.create("Model");
  mdl.component().create("comp1");
  mdl.component("comp1").geom().create("g",3);
  mdl.component("comp1").geom("g").create("cyl1","Cylinder").set("h",3.0);
  mdl.component("comp1").geom("g").create("cyl2","Cylinder").set("h",3.0).set("r",0.95);
  mdl.component("comp1").geom("g").create("co1","Difference");
  mdl.component("comp1").geom("g").feature("co1").selection("input").set("cyl1");
  mdl.component("comp1").geom("g").feature("co1").selection("input2").set("cyl2");
2 Build a mesh:
  MeshSequence ms = mdl.component("comp1").mesh().create("m", "g");
  ms.feature("size").set("hauto", 9);
  ms.create("ftri1","FreeTri");
  ms.feature("ftri1").selection().geom(2).set(1, 2, 7, 10);
  ms.create("ftet1","FreeTet");
  ms.feature("ftet1").create("ms1","Size");
  ms.run();
3 Check if the mesh was built with problems:
  boolean problem = ms.hasProblems();
4 Get the names of the features with problems. In this case, the feature ftet1:
```

**5** Get error information:

```
String[] errors = problematicFeature.errors();
```

MeshFeature problematicFeature = ms.feature(problemFeatures[0]);

String[] problemFeatures = ms.problems();

```
for (String tag : errors) {
    analyzeProblems(problematicFeature.problem(tag));
  }
  Where analyzeProblems is the following method to recursively retrieve error information:
  private static void analyzeProblems(MeshProblemFeature problem) {
    String errorMessage = problem.message();
    System.out.println(errorMessage);
    if (problem.hasSelection()) {
      MeshSelection sel = problem.selection();
      System.out.println("Selection: " + sel);
    }
    String[] problemDetails = problem.problems();
    for (String tag : problemDetails) {
      MeshProblemFeature detail = problem.problem(tag);
      // Recursively analyze subproblems
      analyzeProblems(detail);
    }
  }
6 Get warning information:
  String[] warnings = problematicFeature.warnings();
    for (String tag : warnings) {
      analyzeProblems(problematicFeature.problem(tag));
  }
  where analyzeProblems is the same method as described in the previous step.
```

## **EXAMPLE OF RETRIEVING PROBLEM AND WARNING INFORMATION IN A SOLVER**

The same technique is also available for retrieving information about problems and warnings in a solvers sequence:

**1** For a solver sequence ss1, check if there are any problems:

```
SolverSequence ss1
boolean problem = ss1.hasProblems();
```

**2** Get the names of the features with problems:

```
String[] problemNames = ss1.feature().problemNames();
```

**3** Get error information:

```
String[] errorNames = ss1.feature(problemNames[0]).problem().errorNames();
SolverFeature errorFeature = ss1.feature(problemNames[0]).problem(errorNames[0]);
String errorMessage = errorFeature.getString("message");
```

**4** Get warning information:

```
String[] warningNames = ss1.feature(problemNames[0]).problem().warningNames();
SolverFeature warningFeature = ss1.feature(problemNames[0]).problem(warningNames[0]);
String warningMessage = warningFeature.getString("message");
```

