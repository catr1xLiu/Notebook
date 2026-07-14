# *Inserting Features from Other Models*

These methods are related to inserting features from other models.

#### **SCANNING MODELS**

The ModelUtil.scanModel method is an advanced tool that scans the raw data (XML) of the model file for a certain node type and collects the tag and label of all nodes that it finds. In most cases, the node type argument is the same as the corresponding API class name of the node. The reason for using this tool is to quickly scan several MPH files for simple information, such as a list of available materials or functions. If you need more sophisticated access to the model, it is easier to open the model file and process the content. Although you need extra time to open the model, scanning with this tool is very limited. It cannot handle backward compatibility, for example, so scanning of older files may not work.

As an option it is possible to include values of other attributes to the result, but the name of such attributes can be difficult to extract. It will be helpful to unzip the MPH file and look at the content of the dmodel.xml file. The example below uses "op", which corresponds to the string return by the "getType()" method that some node types support (for example, PropFeature.getType()).

Other examples of extra attributes are "entityComments" and "entityAuthor", returning the comment and author of each node, respectively.

The scanModel method does not support returning values of settings from, for example, "getString(name)" methods.

The returned result is a double string array with all found nodes in the outer level and the sequence of found attributes in the inner level, starting with tag and label. Any optional attributes follow after the tag and label.

#### Examples:

```
String[][] materials = scanModel("mymodel.mph", "Material", "op");
  String[][] functions = scanModel("mymodel.mph", "FunctionFeature", "op");
produces an output like:
  materials = [["mat1", "Material 1", "Common"],["mat2", "Material 2", "Common"]]
  functions = [["an1", "Analytic 1", "Analytic"],["int1", "Interpolation 1", 
  "Interpolation"]]
```

The following parameters are supported:

- **•** filename: The file path to the model.
- **•** type: The type of the node to search for.
- **•** extraAttributes: A list of attributes in addition to the tag and label to include in the result.

The method returns a double string array with the result.

#### **INSERTING MATERIALS**

The insert method can be used to insert materials with the following syntax:

```
String[][] com.comsol.model.MaterialList.insert(String filename, String[] materials, 
String... password)
String[][] com.comsol.model.ComponentMaterialList.insert(String filename, String[] 
materials, String... password)
```

Using this method, you can insert materials from an MPH-file into the material list of this model and return the result of the operation as a double string array of length 3.

The first array contains the messages from insert, the second array contains paths to the inserted objects, and the third array contains paths to the inserted references. A pasted reference is an object that an inserted object refers to, and it is not necessarily contained by any of the inserted objects. The following example inserts the materials tagged mat5 and mat10 into the model's global materials:

```
model.material().insert("mymodel.mph", new String[]{"mat5", "mat10"});
```

The next example inserts the materials tagged mat5 and mat10 into the materials of component comp1:

```
String[][] ret = model.component("comp1").material().insert("mymodel.mph", new 
String[]{"mat5", "mat10"});
```

It will produce the following output:

```
{{}, {"/MaterialList/mat5", "/MaterialList/mat10"}, {}}
```

The following input arguments are available:

- **•** filename: The filename or model location URI used to identify a model version in a Model Manager database.
- **•** materials: The tags of the materials to insert.
- **•** password: Optional password required to open the file.

.The insert method returns results from the insert operation.

