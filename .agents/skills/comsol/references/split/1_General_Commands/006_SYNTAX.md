# **SYNTAX**

The following syntax is used for all of these access methods (exemplified there with the getStringArray method for returning the value of the a string array with the name <*name*> for the *something* object (feature).

```
something.getStringArray(<name>);
```

Note that throughout this manual, the access methods are collectively referred to as get\*(*<name>*), where \* can be any of the basic data types used below. Use these methods to read property values. The names of the access methods indicate the data type for the data that they return.

```
something.getString(<name>)
returns the value as a string.
  something.getStringArray(<name>)
returns the value as a string array.
  something.getStringMatrix(<name>)
```

```
returns the value as a string matrix.
  something.getInt(<name>)
returns the value as an integer.
  something.getIntArray(<name>)
returns the value as an integer array.
  something.getIntMatrix(<name>)
returns the value as an integer matrix.
  something.getDouble(<name>)
returns the value as a double.
  something.getDoubleArray(<name>)
returns the value as a double array.
  something.getDoubleMatrix(<name>)
returns the value as a double matrix.
  something.getBooleanArray(<name>)
returns the value as a boolean array.
  something.getBooleanMatrix(<name>)
returns the value as a boolean matrix.
  something.selection(<name>)
returns the value as a selection object, which can be edited. This is not simply an access function. It is used to obtain 
a selection object both for editing and for accessing data from.
In addition,
  something.getEntryKeyIndex(<name>,<key>)
returns the index of a given key in a property, and
  something.getEntryKeys(<name>)
returns the possible entry keys for a given property.
To return the parent entity (container) that a model entity is contained in, use
  something.getContainer()
```

The parent entity of a feature (*something*) is in general the list in which it is contained. The parent of the list is in turn the feature that appears as parent in the Model Builder tree. Therefore, to access the parent feature of a subfeature, call *something*.getContainer().getContainer(). If no container can be found, getContainer() returns null.

## **NOTES**

All arrays that are returned contain copies of the data; writing to the array does not change the data in the model object. This observation applies to all access methods of the model object that return arrays of basic data types.

```
SEE ALSO
```

set()

Use this method to assign values to objects of the basic data types.

#### **SYNTAX**

Use these methods to assign property values. All assignment methods return the object itself, which means that assignment methods can be appended to each other.

The basic method for assignments is

```
something.set(name,<value>);
```

The *name* argument is a string with the name of the property. The *<value>* argument can be of different types as indicated in Table 2-4, where the two different syntaxes for assignment in the COMSOL API and the LiveLink*™ for* MATLAB® are listed.

TABLE 2-4: SYNTAXES FOR ASSIGNMENT METHODS.

| TYPE                   | JAVA® SYNTAX                                                  | MATLAB® SYNTAX                           |
|------------------------|---------------------------------------------------------------|------------------------------------------|
| String                 | set("name","value")                                           | set('name','value')                      |
| String array           | set("name",<br>new String[]{"val1","val2"})                   | set('name',{'val1','val2'})              |
| double string<br>array | set("name",new String[][]{{"1","2"},<br>{"3","4"}})           | set('name',{'1','2';'3','4'})            |
| integer                | set("name",17)                                                | set('name',17)                           |
| integer array          | set("name",new int[]{1,2})                                    | set('name',[1 2])                        |
| integer matrix         | set("name",new int[][]{{1,2},<br>{3,4}})                      | set('name',[1 2; 3 4])                   |
| double                 | set("name",1.3)                                               | set('name',1.3)                          |
| double array           | set("name",new double[]{1.3,2.3})                             | set('name',[1.3 2.3])                    |
| double matrix          | set("name",new double[][]{{1.3,2.3},<br>{3.3,4.3}})           | set('name',[1.3 2.3; 3.3 4.3])           |
| boolean                | set("name",true)                                              | set('name',true)                         |
| boolean array          | set("name",new boolean[]{true,false})                         | set('name',[true,false])                 |
| boolean matrix         | set("name",new boolean[][]<br>{{true, false},{false, false}}) | set('name',<br>[true,false;false,false]) |

For matrix-type properties, set(*name*,<*string*>) splits the string at spaces and commas.

The following example shows how two set methods can be appended:

```
model.result("pg1").set("edgecolor", "black").set("edges", "on");
```

This is equivalent to:

```
model.result("pg1").set("edgecolor", "black");
model.result("pg1").set("edges", "on");
```

That is, in this case, the set method returns the plot group "pg1".

The following methods using set are deprecated in version 5.1 (use setIndex() instead):

```
set(name,pos,<value>)
set(name,pos1,pos2,<value>)
```

The following methods using set are deprecated in version 5.0:

```
com.comsol.model.ParameterEntity.set(String, int, double)
com.comsol.model.ParameterEntity.set(String, int, double[])
```

```
com.comsol.model.ParameterEntity.set(String, int, int)
com.comsol.model.ParameterEntity.set(String, int, int[])
com.comsol.model.ParameterEntity.set(String, int, int, double)
com.comsol.model.ParameterEntity.set(String, int, int, int)
com.comsol.model.ParameterEntity.set(String, int, int, String)
com.comsol.model.ParameterEntity.set(String, int, String)
com.comsol.model.ParameterEntity.set(String, int, String[])
```

#### **SEE ALSO**

get\* and Selection Access Methods, setIndex()

```
setEntry()
```

Use the setEntry method to set property values at specified entries using a key instead of an index to locate the row to change.

#### **SYNTAX**

Use this method to assign property values of different types at specified entries:

```
setEntry(name, key, value);
```

where all input arguments are strings:

- **•** *name*, representing the property name.
- **•** *key*, representing the index key.
- **•** *value*, representing the property value.

The *value* can also be a double, an integer, or (with limited applicability; primarily for part links) a boolean.

For example, if pi1 is a part instance feature with input parameters a and b in a geometry, the following lines

```
GeomFeature f = model.component("comp1").geom("geom1").feature("pi1");
f.setEntry("inputexpr", "a", "2");
f.setEntry("inputexpr", "b", "3");
```

set the value of the input expression for parameter a to the string 2 and for parameter b to the string 3. You can also set the values of the input expressions to numerical values (doubles):

```
f.setEntry("inputexpr", "a", 4);
f.setEntry("inputexpr", "b", 5.0);
```

setEntry lets you use a key to access rows in the table, defined by the content in one of the columns (in this case, the column that contains parameter names.

```
setIndex()
```

Use this method to assign values at indices in array properties of the different parts of the model object. When there are no indices, you can use set() instead.

