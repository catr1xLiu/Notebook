# *The loadFile and saveFile Methods*

The methods loadFile() and saveFile() are available to load and save files for the following features:

- **•** model.param() and model.result().param()
- **•** model.variable() and model.component(*<ctag>*).variable()
- **•** model.result().table()

You can use the following syntax for loadFile:

loadFile(String path) where the path is the path to any file type that COMSOL Multiphysics supports.

loadFile(String path, char delim) where delim is the delimiter used in the file.

loadFile(String path, String sheet, String range), where the string sheet is the name of the sheet to read from (null or empty means the first in the file), and range is range of cells to read. The range can be a single cell, which then indicates the upper-left cell to read. If range is empty, it starts in the upper-left corner.

For the saveFile method, the following syntax is available:

```
saveFile(String path)
saveFile(String path, char delim)
```

saveFile(String path, String sheet, String range, boolean includeHeaders, boolean overwrite), where includeHeaders determines whether to include headers or not, and overwrite determines if nonempty existing cells in a spreadsheet can be overwritten in the file. For example, a call like

```
model.param().saveFile(tempFile, "sheet", "C7", false, true);
```

starts saving at cell C7, does not include headers, an allows overwriting of nonempty cells.

saveFile(String path, boolean fullPrecision, String sheet, String range, boolean includeHeaders, boolean overwrite) additionally includes a boolean input argument, fullPrecision, for controlling if full precision should be used for numerical values in the exported file.

For model.result().table, there are no delimiter functions.

