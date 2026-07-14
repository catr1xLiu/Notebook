# *Introduction*

For errors and warnings in the mesh and solver sequences, the following methods are available to retrieve an error message or warning message:

```
String warning = model.sol(<stag>).getWarningMessage();
returns the warning message as a string, and
  String error = model.sol(<stag>).getErrorMessage();
returns the error message as a string. Here, <stag> is a solver sequence tag.
```

In addition, which the following section shows examples of, the following methods are available in the meshing sequences and solver sequences:

- **•** hasProblems(), a boolean method that is true if problems exist.
- **•** problems(), a String[] array with names of features with problems (that is, the union of warnings and errors)
- **•** errors() and warnings(), String[] arrays with information about error and warning, respectively.

