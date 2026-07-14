# About General Commands

# *Overview of General-Purpose Commands*

The following table contains the available general-purpose commands and methods:

TABLE 2-1: GENERAL COMMANDS GROUPED BY FUNCTION.

| FUNCTION                                       | PURPOSE                                                              |  |  |
|------------------------------------------------|----------------------------------------------------------------------|--|--|
| get* and Selection Access Methods              | Access objects of the basic data types                               |  |  |
| set()                                          | Assign objects of the basic data types                               |  |  |
| setEntry()                                     | Set vector property value at specified entry                         |  |  |
| setIndex()                                     | Assign objects at indices of the basic data types                    |  |  |
| hasTag()                                       | Check if a feature has a certain tag.                                |  |  |
| Selections                                     | Selections                                                           |  |  |
| ModelUtil                                      | Model object utility methods                                         |  |  |
| model                                          | Model object                                                         |  |  |
| model.attr()                                   | Model entity list methods                                            |  |  |
| model.attr( <tag>)</tag>                       | Model entity methods                                                 |  |  |
| model.batch()                                  | Batch jobs                                                           |  |  |
| model.bem()                                    | Boundary elements (BEM)                                              |  |  |
| model.coeff()                                  | Coefficient form equations                                           |  |  |
| model.colorTheme(),<br>model.imageColorTheme() | Color themes, See Color Themes.                                      |  |  |
| model.common()                                 | Common definition nodes in components                                |  |  |
| model.component()                              | Model component nodes                                                |  |  |
| model.constr()                                 | Constraints                                                          |  |  |
| model.coordSystem()                            | Coordinate systems, PMLs, infinite elements, and absorbing<br>layers |  |  |
| model.cpl()                                    | Nonlocal couplings                                                   |  |  |
| model.elem()                                   | Elements                                                             |  |  |
| model.elementSet()                             | Mesh element sets                                                    |  |  |
| model.extraDim()                               | Extra dimensions                                                     |  |  |
| model.field()                                  | Fields                                                               |  |  |
| model.form()                                   | Settings forms                                                       |  |  |
| model.frame()                                  | Frames                                                               |  |  |
| model.func()                                   | Functions                                                            |  |  |
| model.geom()                                   | Geometry sequences                                                   |  |  |
| model.group()                                  | Load groups and constraint groups                                    |  |  |
| model.init()                                   | Initial values                                                       |  |  |
| model.intRule()                                | Integration orders                                                   |  |  |
| model.massProp()                               | Mass properties                                                      |  |  |
| model.material()                               | Materials                                                            |  |  |
| model.mesh()                                   | Meshing sequences                                                    |  |  |
| model.methodCall()                             | Model methods                                                        |  |  |

TABLE 2-1: GENERAL COMMANDS GROUPED BY FUNCTION.

| FUNCTION                                 | PURPOSE                                                     |  |
|------------------------------------------|-------------------------------------------------------------|--|
| model.modelNode()                        | Model nodes (component nodes; see<br>model.component())     |  |
| model.multiphysics()                     | Multiphysics features container                             |  |
| model.nodeGroup()                        | Group nodes in the model                                    |  |
| model.ode()                              | Global equations                                            |  |
| model.opt()                              | Optimization interface                                      |  |
| model.pair()                             | Pairs                                                       |  |
| model.param() and model.result().param() | Parameters                                                  |  |
| model.physics()                          | Physics                                                     |  |
| model.probe()                            | Probes                                                      |  |
| model.reduced()                          | Reduced-order modeling                                      |  |
| model.result()                           | Postprocessing interface                                    |  |
| model.savePoint()                        | Manage selections and hide features used by result features |  |
| model.selection()                        | Named selections                                            |  |
| model.shape()                            | Shape functions                                             |  |
| model.sol()                              | Solver sequences                                            |  |
| model.solverEvent()                      | Events                                                      |  |
| model.study()                            | Studies                                                     |  |
| model.thermodynamics()                   | Thermodynamics interface                                    |  |
| model.unitSystem()                       | Unit systems                                                |  |
| model.variable()                         | Variables                                                   |  |
| model.view()                             | Views                                                       |  |
| model.weak()                             | Weak form equations                                         |  |

#### **ABOUT VALID TAGS**

A *tag* is a string that you use to refer to a model feature. When specifying a tag, it must fulfill the following format requirements: Begin with a character a–z or A–Z followed by any number of \_ (underscores), numerals 0–9, or characters a–z or A–Z.

# **ABOUT ASSIGNING VALUES TO PROPERTIES**

Even if a property is numeric, it is also possible to use a string or string array. The strings can contain expressions defined in terms of parameters defined in **Global Definitions** > **Parameters**. See Table 2-4 under set() below for examples of syntaxes for assignment methods.

#### **ABOUT FILE PATHS**

In general, the file paths in methods for saving and opening files, for example, are client paths (on the client computer's file system). They can also be item version location URIs used to identify a model or file version in a Model Manager database. The exceptions are methods that explicitly performs an operation on the server, such as ModelUtil.loadOnServer(), which takes a server path as its argument.

The syntax that includes the component level, such as

![](_page_2_Picture_2.jpeg)

model.component(*<ctag>*).geom(*<tag>*)... is the default and is used throughout this chapter for parts of the model object that are stored inside a model component. To use the earlier model.geom(*<tag>*)... syntax, clear the **Generate code using component syntax** checkbox on the **Application Builder** > **Methods** page in the **Preferences** window. You can also run existing scripts without this syntax.

# *About Name, Identifier, and Tag Properties*

The following tables contain information about the name, identifier, and tag properties for various features in a COMSOL model (see Labels and Names in the Settings Window in the *COMSOL Multiphysics Reference Manual* for more information). Especially, the table provides information about the relationship between names and tags, whether you can change the name in the user interface or the tag using the API, and the access methods and use of names. This information is useful for understanding how these concepts are related, especially when working with both the COMSOL Desktop and programming using the COMSOL API. In the tables below, *user interface* refers to the Settings windows in the COMSOL Desktop. The term *scope* in the **Use of Name** column in the second table means that the name is used as part of an expression access it in the model object hierarchy; for example, comp1.ht.Cp, where comp1 is the name of the component, and ht is the name of the physics interface (see Variable Naming Convention and Namespace in the *COMSOL Multiphysics Reference Manual* for more information). The name of a user-defined tag is case sensitive, and it must begin with a lowercase or uppercase letter (a–z or A– Z). All other characters in the name must be a lowercase or uppercase letter, a number 0–9, or an underscore (\_). See also Naming Conventions, Reserved Names, and Errors in the *COMSOL Multiphysics Reference Manual*.

TABLE 2-2: THE NAME AND TAG RELATIONS, AND WHETHER YOU CAN CHANGE THEM.

| THE NAME/IDENTIFIER CONCEPT      | NAME SAME AS TAG | CAN CHANGE NAME IN<br>THE USER INTERFACE | CAN CHANGE TAG<br>IN THE API |
|----------------------------------|------------------|------------------------------------------|------------------------------|
| Component                        |                  | Tag changes as well                      | √                            |
| Physics interface                |                  | Tag changes as well                      | √                            |
| Physics feature                  | √                | No                                       | √                            |
| Multiphysics coupling            |                  | Tag changes as well                      | √                            |
| Material                         | √                | No                                       | √                            |
| Property group                   |                  | No                                       | √                            |
| Definitions > Functions          |                  | Yes                                      | √                            |
| Definitions > Coordinate systems |                  | Yes                                      | √                            |
| Definitions > Probes             |                  | Yes                                      | √                            |
| Definitions > Nonlocal couplings |                  | Yes                                      |                              |
| Definitions > Variable utilities |                  | Yes                                      | √                            |
| Definitions > Pairs              |                  | Yes                                      | √                            |
| Definitions > Density model      |                  | Yes                                      | √                            |
| Definitions > Ambient properties |                  | Yes                                      | √                            |

TABLE 2-3: ACCESS METHODS, NAME IN USER INTERFACE AND USE OF THE NAMES.

| THE NAME/IDENTIFIER CONCEPT         | ACCESS METHOD FOR NAME                               | METHOD FOR<br>NAME<br>DEPRECATED | NAME IN USER<br>INTERFACE | USE OF NAME                            |
|-------------------------------------|------------------------------------------------------|----------------------------------|---------------------------|----------------------------------------|
| Component                           | identifier<br>identifier(string)                     | √                                | Name                      | Scope                                  |
| Physics interface                   | identifier<br>identifier(string)                     | √                                | Name                      | Scope                                  |
| Physics feature                     | tag<br>tag(string)                                   | √                                |                           | Scope                                  |
| Multiphysics coupling               | identifier<br>identifier(string)                     | √                                | Name                      | Scope                                  |
| Material                            | tag<br>tag(string)                                   |                                  | Name                      | Scope                                  |
| Property group                      | identifier<br>identifier(string)                     | √                                | Name                      | Scope                                  |
| Definitions > Functions             | get or set function name<br>properties like funcname |                                  | Function name             | Function name                          |
| Definitions > Coordinate<br>systems | get or set name property                             |                                  | Name                      | Scope                                  |
| Definitions > Probes                | get or set probename<br>property                     |                                  | Variable name             | Variable name                          |
| Definitions > Nonlocal<br>couplings | get or set opname<br>property                        |                                  | Operator name             | Operator name                          |
| Definitions > Variable utilities    | get or set name property                             |                                  | Name                      | Variable or<br>operator name           |
| Definitions > Pairs                 | pairName()<br>pairName(string)                       |                                  | Pair name                 | Variable suffix<br>( <name>_p1)</name> |
| Definitions > Density model         | get or set name property                             |                                  | Name                      | Scope                                  |
| Definitions > Ambient<br>properties | get or set name property                             |                                  | Name                      | Scope                                  |

# *get\* and Selection Access Methods*

Use these methods to access properties of the different parts of the model object.

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

# **SYNTAX**

To use the setIndex method, use one of these syntaxes:

```
something.setIndex(name,<value>,<index>);
for array properties, or
  something.setIndex(name,<value>,<firstIndex>,<secondIndex>);
for matrix properties.
```

Use these methods to assign values to an element in array or matrix properties, defined by specific indices (0-based). All assignment methods return the parameter object, which means that assignment methods can be appended to each other.

If *<index>* points beyond the current size of the array, then the array is extended as needed before element *<index>* is set. The values of any newly created intermediate elements are undefined.

The *name* argument is a string with the name of the property. *<value>* is a string representation of the value to set. A double array element, for example, can still be set from a string representation of the double, typically used when the property value depends on a model parameter. The values can also be a boolean or a boolean array. For example:

```
something.setIndex(name,<value>,2)
```

This code assigns the value for the element with the third index in the array (because the indices are 0-based) of an array property *name* to be the value *value*. If the parameter later changes, this property changes accordingly. You can also use an additional input argument for a second index value, for a 2-dimensional array (matrix), for example,

```
something.setIndex(name,<value>,1,4)
```

This code assigns the value *<value>* to the (1, 4) element in a matrix.

For double arrays the modifying method is also of use when assigning the value in MATLAB®, if not all arrays have the same length. When using a cell matrix, all rows must have the same length. The method

```
something.setIndex(name,<value>,<index>)
```

can be used to get around that limitation. It inserts an array in the indexed position in the double array. The MATLAB code

```
something.setIndex('name',{'1','2','3'},0)
  something.setIndex('name',{'4','5'},1)
is equivalent to the Java® code
  something.set("name",new String[][]{{"1","2","3"},{"4","5"}})
SEE ALSO
set()
hasTag()
```

Use this method to check whether a feature with a given tag exists in a list. The hasTag method returns true if the list contains a model entity with the given tag.

```
boolean hasTag(String tag);
```

As an example, this code checks if a block has the tag blk1, and if it does not exists, creates such a block:

```
boolean isBlockExists = model.geom("geom1").feature().hasTag("blk1");
if (!isBlockExists) {
model.geom("geom1").feature().create("blk1", "Block");
}
```

*Methods Associated to Set, SetIndex, and the Various Get Methods*

The following methods are available where the set, setIndex, and get*<Type>* methods are available:

```
String[] properties();
```

which returns the names of all available properties.

```
boolean hasProperty(String name);
```

which returns true if the feature has the named property.

String[] getAllowedPropertyValues(String name);

which returns the allowed values for a named properties, if it is a finite set.

# *Special Property Types*

In addition to the basic data types, the set() and get\*() methods let you manipulate certain properties with special behavior.

#### **REFERENCE PROPERTY**

A reference property is property that stores a reference to an entity in the model object. Each reference property allows references to entities of a particular type, normally identified by the entity's tag. The property is set by passing the identifying tag to the standard set(<name>,String) method and read using getString(<name>). But since it is the reference rather than the tag that is stored, the returned value will change if the entity's tag is changed. If the referenced entity is removed or modified in a way which no longer makes it an allowed target for the property, the return value will be null or the string "none".

#### **REFERENCE ARRAY**

A reference array is an array of references where each position behaves like a reference property. Entity tags are set using set(<name>, String[]) or setIndex(<name>, String), and read using getStringArray(<name>). Some reference arrays store a specific number of references, while others represent sets of entities. When a referenced entity is removed from the model, it will also be removed from any referring property of the latter type.

#### **STRING MAP**

A string map property is a special type of string array property which is used to specify a value for each key in a given set of allowed keys. The key-value pairs are stored interleaved {key, value, key, value, ...} in the array. The order of the pairs is arbitrary when setting the array using set(<name>, String[]). The value for a specific key can also be set using setEntry(name, <key>, <value>). The keys are many cases references to a model entity specified using the entity's tag. But there are also properties using, for example, prefixed tags for entities of different types.

The complete map containing all possible keys and their current values is returned by getStringArray(name). The value for a specific key is returned by getString(name, <key>). If no values has been explicitly set for a given key, a default value is returned. The default may be different for each key. Values may also be references to a model entity.

# *Selections*

This section contains information about the selection methods that are available for handling selections on the finalized geometry.

# **SYNTAX**

This section describes the general syntax for selections on the finalized geometry. For selections in the geometry sequence, see Geometry Object Selection Methods under model.geom()and Selections under Editing a Geometry Feature. Many objects use selections, but most of them only support a subset of the assignment methods described here. The methods supported by the named selections in model.selection() are listed in model.selection(). Other objects that use a selection support the methods relevant for the type of feature they represent. For example, a physics boundary condition feature requires a boundary selection. Therefore is does not

support *selection*.global(), which makes the selection global, or *selection*.allGeom(), which makes the selection apply to the whole geometry at all levels. Using an unsupported assignment method results in an error.

![](_page_9_Picture_1.jpeg)

The *selection* part here represents any valid selection syntax that ends with ...selection(), such as model.component(*<ctag>*).physics(*<ptag>*).feature(*<ftag>*).selection().

There can also be a filtering of the entities assigned to a selection. Again, take a physics boundary condition as an example. Some boundary conditions only apply to the boundaries exterior to the domains where the physics interface is active, other boundary conditions only to boundaries interior to where the physics interface is active, and so on. Therefore *selection*.entities(*dim*) can sometimes return less entities than have been assigned using *selection*.set(*<entlist>*). On the other hand, *selection*.inputEntities() always returns all entities used in the assignment *selection*.set(*<entlist>*). *selection*.inputEntities() returns the domains used as input to the selection. If the selection is of the type *interior*, *exterior*, or *meshinterior*, this method returns the unfiltered list of domains at the higher dimension that are used as the input. If the selection is not a selection of domains at a certain level, or the selection is not of the types Explicit or FromGeom (derived from a geometry feature), this method returns null.

Some selections only allow a single geometric entity, a single domain, a single boundary, edge, or point. Such selections are called *single selections*. Single selections cannot be defined by another selection and therefore do not support *selection*.named(*<stag>*).

*selection*.global() sets the selection to be the global selection.

*selection*.geom(*<gtag>*) sets the selection to be all entities in the geometry *<gtag>*.

*selection*.geom(*<gtag>*,*dim*) specifies that subsequent calls to all, set, add, and remove refer to entities at the dimension *dim* on the geometry *<gtag>*. If there is only one possible geometry, using *selection*.geom(*dim*) is equivalent. Also, if there is only one allowed dimension *dim*, then all, set, and remove can be used directly as it is then unambiguous to which geometry and dimension their arguments apply to.

*selection*.geom(*<gtag>*,*highdim*,*lowdim*,*typelist*) specifies that subsequent calls to all, set, add, and remove refer to entities of dimension *highdim* on the geometry *<gtag>*. The entities that are obtained are those that are both of dimension *lowdim* and of any of the types listed in *<typelist>*. It is required that highdim > lowdim. The available types are:

- **•** exterior: All entities of dimension *lowdim* that lie on the exterior of the entities at dimension *highdim*.
- **•** interior: All entities of dimension *lowdim* that lie in the interior of the entities at dimension *highdim*.
- **•** meshinterior: All interior mesh entities of dimension *lowdim* that lie in the interior of the entities at dimension *highdim*.

*selection*.allGeom() sets the selection to a whole geometry. Can be used instead of *selection*.geom(*<gtag>*) when the geometry tag is unambiguous.

*selection*.geom(*dim*) specifies that subsequent calls to all, set, add, and remove refer to entities of dimension *dim*. Can be used instead of *selection*.geom(*<gtag>*,*dim*) when the geometry tag is unambiguous.

*selection*.all() sets the selection to use all geometric entities in the geometry at the dimension where the selection applies. Note that you must precede this call with, for example, a *selection*.geom(*dim*) call to specify the dimension if there is more than one allowed dimension for the feature, which is the case for geometry features. The following example code show how to select all boundaries for a circle (disk) geometry:

```
Model model = ModelUtil.create("Model");
GeomSequence g = model.geom().create("geom1", 2);
g.create("c1", "Circle");
```

```
g.run();
g.measureFinal().selection().geom(1);
g.measureFinal().selection().all();
```

*selection*.allVoids() sets the selection to use all voids (finite voids and an infinite void, if present) in the geometry at the dimension where the selection applies. Voids can be present in models that use the boundary element method, for example. In a geometry with voids, *selection*.all() selects all domains, not the voids.

*selection*.set(*<entlist>*) sets the selection to use the geometric entities in *<entlist>*. Note that the list of entity numbers is always sorted in ascending order and that duplicates are removed before storing the numbers in the selection object.

*selection*.add(*<entlist>*) adds the geometric entities in *<entlist>* in the geometry to the set of geometric entities that the selection uses to obtain the selection.

*selection*.remove(*<entlist>*) removes the geometric entities in *<entlist>* in the geometry from the set of geometric entities that the selection uses.

*selection*.clear() removes all entities from the selection.

*selection*.inherit(*boolean*) indicates whether the selection should include all geometric entities that are specified by any of the other methods and all geometric entities at lower dimensions that are adjacent to the ones already specified.

*selection*.named(*<stag>*) specifies that the selection is defined by the selection model.selection(*<stag>*).

*selection*.isGlobal() returns true if the selection is global.

*selection*.isGeom() returns true if the selection is a whole geometry.

*selection*.geom() returns the geometry tag of the selection as a string. If the selection is global, null is returned.

*selection*.dimension() returns the dimensions on a geometry where the selection applies as an integer array.

*selection*.dim() returns the largest entity dimension on which the selection applies.

*selection*.entities(*dim*) returns the geometric entities of the selection on the given geometry at the given dimension as an integer array. The entities are represented using unique positive integers, except (if the model geometry contains voids) for finite voids, which get unique negative integer numbers, and for an infinite void, which is represented with the entity number 0.

*selection*.entities() returns the geometric entities of the selection on the given geometry at the largest entity dimension as an integer array.

*selection*.interiorEntities(*dim*) returns the interior mesh domains as an integer array.

*selection*.isInheriting() returns true if the selection is inherited to lower dimension levels.

*selection*.inputDimension() returns the dimension of the entities used as input to the selection.

*selection*.inputEntities() returns the entities used as input to the selection.

If the selection is defined by another selection, *selection*.named() returns the tag of that selection. Otherwise *selection*.named() returns an empty string.

Selections of the class XDLocalSelection have the following additional methods:

*selection*.extraDim() returns the tag of a feature of type AttachDimension in model.extraDim(), or an empty string if no extra dimension attachment is used.

*selection*.extraDim(<*attachdimtag*>) sets the extra dimension attachment feature. <*attachdimtag*> must be the tag of a feature of type AttachDimension in model.extraDim() or an empty string to indicate no extra dimension attachment.

*selection*.extraDimSel(<*xdgeomtag*>) returns the selection in extra dimension geometry <xdgeomtag>. <xdgeomtag> should be the tag of the geometry in one of the extra dimensions attached by the extra dimension attachment feature defined by *selection*.extraDim().

extraDimSel() returns all extra dimension geometry tags that are valid arguments of extraDimSel(<*xdgeomtag*>) as a string array.

#### **NOTES**

The methods global(), geom(*<gtag>*), geom(*<gtag>*,*dim*), geom(*<gtag>*,*highdim*,*lowdim*,*typelist*), and geom(*dim*) clear the dataset by other methods.

Not all assignment methods are supported by all model entities. The list of supported methods also serves as a guide for the restriction to those named selections that can be used by that entity. All access methods are always supported.

#### **SEE ALSO**

model.geom()

# *Color Themes*

Use model.colorTheme to specify a color theme for selection colors.

Use model.colorTheme(*<theme>*) to set the color theme to be used in the graphics. Using automatic indicates that the theme specified in the preferences will be used. The other possible theme values are the names of the themes in the data/color folder in the COMSOL installation folder.

Use model.colorTheme() to return the current color theme. The value automatic indicates that the color theme specified in the preferences is used.

Use model.imageColorTheme(*<theme>*) to set the color theme for image export. Likewise, model.imageColorTheme() returns the current image export color theme.

See also the color and customcolor properties for selections and geometry features.

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

# *ModelUtil*

Model object utility methods such as methods to create and remove model objects, showing progress information, and listing and saving preferences. See also model.

# **SYNTAX**

This section describes general methods that handle the environment for the model object. It also describes methods for the client/server machinery.

```
import com.comsol.model.*;
import com.comsol.model.util.*;
```

The import statements above make all model and model utility methods available.

ModelUtil.create(*<tag>*): The create method creates a model with tag *<tag>*. Returns a reference to the model. If there is already a model with this tag the previous model is removed.

ModelUtil.remove(*<tag>*): The remove method removes the model tagged *<tag>*.

ModelUtil.clear(): The clear method removes all models.

ModelUtil.tags(): The tags method obtains the current list of model tags.

ModelUtil.model(*<tag>*): The model method returns a reference to the model tagged *<tag>*.

ModelUtil.closeWindow(*<windowtag>*): The closeWindow method closes the window tagged *<windowtag>*.

ModelUtil.closeWindows(): The closeWindows method closes all windows on the server.

ModelUtil.createUnique(<*prefix>*): The createUnique method creates a model with a unique tag that begins with the prefix <*prefix>*.

ModelUtil.getComsolVersion(): The getComsolVersion method returns the current COMSOL Multiphysics version as a string.

ModelUtil.getOpenGeometryKernel(): The getOpenGeometryKernel method returns the geometry kernel to use when opening models. Valid values are model for the geometry kernel used by the model file, and comsol to convert the geometry to the COMSOL kernel.

ModelUtil.getDefaultGeometryKernel(): The getDefaultGeometryKernel method returns the default geometry kernel in new models. Valid values are comsol for the COMSOL kernel and cadps for the CAD kernel (Parasolid kernel). The CAD kernel requires the CAD Import Module.

ModelUtil.setOpenGeometryKernel(*<openkernel>*): The setOpenGeometryKernel method specifies the geometry kernel to use when opening models. Valid values are model for the geometry kernel used by the model file, and comsol to convert the geometry to the COMSOL kernel.

ModelUtil.setDefaultGeometryKernel(*<defaultkernel>*): The setDefaultGeometryKernel method specifies the default geometry kernel to use in new models with the string *<defaultkernel>*. Valid values are comsol for the COMSOL kernel and cadps for the CAD kernel (Parasolid kernel). The CAD kernel requires the CAD Import Module.

ModelUtil.getEntityPath(*<entity>*,*<divider>*): The getEntityPath method creates the path from the root of the model object for the given entity *<entity>*. *<divider>* specifies a divider to use between entities in path.

ModelUtil.load(*<tag>*,*<modelLocation>*): The load method loads a model from a model location *<modelLocation>*, which can be the absolute path of a file on the file system or a model location URI identifying a model version in a Model Manager database and names it *<tag>*. Loading a model file from a directory on the file system sets the model directory. The model directory is used for saving files on the file system if you do not provide an absolute path to the file. The model directory is the directory where the model is saved. If the model has not been saved there is no model directory, you can get the model directory from a saved model using model.getFilePath.

ModelUtil.loadCopy(*<tag>*,*<filename>*): The loadCopy method loads a copy of a model from a file *<filename>* in the client's file system and names it *<tag>*. The loadCopy method is the same as load except that the loaded model is not associated with the file, so model.save() does not work. You have to specify the filename the first time you save it again.

ModelUtil.loadOnServer(*<tag>*,*<filename>*): The loadOnServer method works like ModelUtil.load except that the filename is a path on the server computer. The client does not have to have access to the file.

ModelUtil.loadProtected(*<tag>*,*<filename>*,*<password>*): The loadProtected method works like ModelUtil.load but with password protection.

ModelUtil.loadProtectedOnServer(*<tag>*,*<filename>*,*<password>*): The loadProtectedOnServer method works like ModelUtil.loadOnServer but with password protection.

ModelUtil.loadRecovery(*<tag>*,*<foldername>*): The loadRecovery method loads a model from a recovery directory or folder structure in the client's file system and names it *<tag>*.

ModelUtil.showPlots(bool): The showPlots method applies when connected to a graphics server, and ModelUtil.showPlots(false) will disable plotting. It will not close any existing plot windows. Use ModelUtil.closeWindow(*<tag>*) or ModelUtil.closeWindows() to do that.

ModelUtil.showProgress(bool): The showProgress method with a boolean input turns on or off showing of progress in a window or on a file when running lengthy tasks when connected to a server. The return value is a boolean value that is true if showing progress is possible.

ModelUtil.showProgress(*<filename>*): The showProgress method with a filename input turns on logging of progress to the file *<filename>* in the client's file system. If *<filename>* is *null* progress is logged to the standard output.

ModelUtil.initStandalone(bool): The initStandalone method initializes the environment for using the COMSOL API in model files for Java®. You should *not* use this command from the LiveLink™ *for* MATLAB®. Set the argument to true if support for plotting in a GUI using Java Swing widgets should be available.

ModelUtil.initStandalone(bool,*<guiToolkit>*) allows to specify that support for using a given Java GUI toolkit should be available. The optional *<guiToolkit>* parameter can have the values "swing" or "swt" telling that Swing widgets or widgets from the Standard Widget Toolkit (SWT) can be used.

ModelUtil.getPreference(*<prefsName>*): The getPreference method returns the value of a preference.

ModelUtil.setPreference(*<prefsName>*, *<value>*): The setPreference method sets the value of a preference.

ModelUtil.listPreferences(): The listPreferences method returns a string with a listing of the preferences names and their descriptions.

ModelUtil.loadPreferences(): The loadPreferences method loads the preferences from file. Use this in model files for Java, which do not load the preferences at launch time.

ModelUtil.savePreferences(): The savePreferences method saves the preferences to file.

![](_page_15_Picture_9.jpeg)

The preferences are also saved when you close the **Preferences** window and when you exit COMSOL Desktop. When you run a thin client, preferences are saved when you call ModelUtil.disconnect() (see Client-Server Commands below).

ModelUtil.uniquetag(String prefix): The uniquetag method returns a unique model tag with a prefix that the tag should begin as an input argument.

ModelUtil.modelsUsedByOtherClients(): The modelsUsedByOtherClients method returns the tags of models used by other clients.

ModelUtil.blockOtherClients(boolean blockOtherClients), which blocks other clients from a server. This command is only meaningful when there are multiple clients connected to the server. Calling ModelUtil.blockOtherClients(true) will block other clients. The blocking is lifted when clients requesting the block call ModelUtil.blockOtherClients(false) or when it disconnects from the server.

# *License Commands*

ModelUtil provides functionality to check availability for and control the checkout of COMSOL product licenses.

ModelUtil.hasProduct(String... *product*): The hasProduct method checks if the current license allows to run the specified COMSOL products given as the input (as an array of strings).

ModelUtil.hasProductForFile(String *file*): The hasProductForFile method checks if the current license allows the specified COMSOL products needed to use that COMSOL MPH file.

ModelUtil.hasProductForFileonServer(String *file*): The hasProductForFileonServer method is similar to hasProductForFile but checks if the license allows the specified COMSOL products needed for a file on the server.

ModelUtil.checkoutLicense(String... *product*): The checkoutLicense method checks out licenses for the COMSOL products given as the input (as an array of strings).

ModelUtil.checkoutLicenseForFile(String *file*): The checkoutLicenseForFile method checks out the licenses needed to use that COMSOL MPH file.

ModelUtil.checkoutLicenseForFileonServer(String *file*): The checkoutLicenseForFileonServer method is similar to checkoutLicenseForFile but checks out the licenses needed to use that COMSOL MPH file on the server.

The following table lists the available products for which licenses can be checked for availability and checked out using the names in the **Name** column:

| PRODUCT                              | NAME                    |  |  |
|--------------------------------------|-------------------------|--|--|
| AC/DC Module                         | ACDC                    |  |  |
| Acoustics Module                     | ACOUSTICS               |  |  |
| Battery Design Module                | BATTERYDESIGN           |  |  |
| CAD Import Module                    | CADIMPORT, CADREADER    |  |  |
| CFD Module                           | CFD                     |  |  |
| Chemical Reaction Engineering Module | CHEM                    |  |  |
| Cluster computing functionality      | CLUSTERNODE             |  |  |
| Composite Materials Module           | COMPOSITEMATERIALS      |  |  |
| Corrosion Module                     | CORROSION               |  |  |
| Design Module                        | DESIGN                  |  |  |
| ECAD Import Module                   | ECADIMPORT              |  |  |
| Electric Discharge Module            | ELECTRICDISCHARGE       |  |  |
| Electrochemistry Module              | ELECTROCHEMISTRY        |  |  |
| Electrodeposition Module             | ELECTRODEPOSITION       |  |  |
| Fatigue Module                       | FATIGUE                 |  |  |
| File Import for CATIA V5             | CATIA5                  |  |  |
| Fuel Cell & Electrolyzer Module      | FUELCELLANDELECTROLYZER |  |  |
| Geomechanics Module                  | GEOMECHANICS            |  |  |
| Heat Transfer Module                 | HEATTRANSFER            |  |  |
| Liquid & Gas Properties Module       | LIQUIDANDGASPROPERTIES  |  |  |
| LiveLink™ for AutoCAD®               | LLAUTOCAD               |  |  |
| LiveLink™ for PTC® Creo® Parametric™ | LLCREOPARAMETRIC        |  |  |
| LiveLink™ for Excel®                 | LLEXCEL                 |  |  |
| LiveLink™ for Inventor®              | LLINVENTOR              |  |  |
| LiveLink™ for MATLAB®                | LLMATLAB                |  |  |
| LiveLink™ for Revit®                 | LLREVIT                 |  |  |
| LiveLink™ for Solid Edge®            | LLSOLIDEDGE             |  |  |
| LiveLink™ for SOLIDWORKS®            | LLSOLIDWORKS            |  |  |
| MEMS Module                          | MEMS                    |  |  |
| Microfluidics Module                 | MICROFLUIDICS           |  |  |
| Mixer Module                         | MIXER                   |  |  |
| Molecular Flow Module                | MOLECULARFLOW           |  |  |

| PRODUCT                               | NAME                     |
|---------------------------------------|--------------------------|
| Multibody Dynamics Module             | MULTIBODYDYNAMICS        |
| Nonlinear Structural Materials Module | NONLINEARSTRUCTMATERIALS |
| Optimization Module                   | OPTIMIZATION             |
| Particle Tracing Module               | PARTICLETRACING          |
| Pipe Flow Module                      | PIPEFLOW                 |
| Plasma Module                         | PLASMA                   |
| Polymer Flow Module                   | POLYMERFLOW              |
| Ray Optics Module                     | RAYOPTICS                |
| RF Module                             | RF                       |
| Rotordynamics Module                  | ROTORDYNAMICS            |
| Semiconductor Module                  | SEMICONDUCTOR            |
| Structural Mechanics Module           | STRUCTURALMECHANICS      |
| Subsurface Flow Module                | SUBSURFACEFLOW           |
| Uncertainty Quantification Module.    | UQ                       |
| Wave Optics Module                    | WAVEOPTICS               |

#### *Client-Server Commands*

ModelUtil provides functionality to control COMSOL client-server options. You can connect/disconnect and control connections from multiple clients to a server using, for example, the connect and disconnect methods.

ModelUtil.connect() connects to a COMSOL server (COMSOL Multiphysics server or COMSOL Server™). The COMSOL command arguments -Dcs.host=*<host>* and -Dcs.port=<*port>* can provide the hostname and port number. In case those are not provided, and the both client and server access the same file system, the host and port can be automatically transferred.

ModelUtil.connect(*<host>*,*<port>*) connects to a COMSOL server. The arguments *<host>* and *<port>* provide the hostname (a string) and port number (an integer) for the COMSOL server.

ModelUtil.connect(*<host>*,*<port>*,*<user>*,*<password>*) connects to a COMSOL server. The arguments *<host>*, *<port>*, *<user>* and *<password>* provide the hostname (a string), port number (an integer), user (a string), and password (a string) for the COMSOL server.

ModelUtil.connect(*<host>*,*<port>*,*<encryption>*) and

ModelUtil.connect(*<host>*,*<port>*,*<encryption>*,*<user>*,*<password>*) connects to a COMSOL server using encryption. With the boolean *<encryption>* set to false, it uses the ws WebSocket URI scheme; when set to true, it uses the secure wss (SSL) WebSocket URI scheme.

ModelUtil.disconnect() disconnects from a COMSOL server.

ModelUtil.setServerBusyHandler(*<ServerBusyHandler>*): Use the setServerBusyHandler method to register a ServerBusyHandler. Several clients can be connected to the same server, but only one client at a time can ask the server to perform an operation. The default behavior when attempting to call the server when it is busy is to issue an exception. By registering a ServerBusyHandler it is possible to make the client wait until the server is free again, and to set a time-out for how long to wait.

ServerBusyHandler is a class which controls how long a client waits for a busy server to become free again. It also has hooks to perform any action on the client side before starting to wait and just after stopping to wait. Implement a subclass in Java to ServerBusyHandler to change the default behavior.

ServerBusyHandler() creates a server-busy handler that waits for the server to be free without any time-out.

ServerBusyHandler(*<timeOut>*) creates a server-busy handler that waits for the server to be free. The time to wait, *<timeOut>*, is given in milliseconds.

postWaitForServer(*<boolean>*) is a hook to perform any action right after waiting for the server to become free.

preWaitForServer(*<host>*, *<username>*) is a hook to perform any action before beginning to wait for the server to become free. The inputs are the hostname and username as strings.

ModelUtil.setModelChangedHandler(<ModelChangedHandler>): The setModelChangedHandler method registers a handler of changes to models made by other clients. If any other client changes any model in use by this client, the model change handler is notified.

ModelChangedHandler is an interface for handling updates of the client when another client has modified any models in use by this client. Implement the interface in Java to change the default behavior.

handleModelChangeOnServer(*<modelChangeInfo>*) is called when another client has changed any models in use by this client. The ModelChangedHandler interface includes the boolean method

triggeredByChangesFromThisClient(). It has a default implementation returning false. In this case, the method handleModelChangeOnServer(*<modelChangeInfo>*) is only called when another client changes the model. If triggeredByChangesFromThisClient() returns true then

handleModelChangeOnServer(*<modelChangeInfo>*) is also called when the client registering the ModelChangedHandler changes the model.

ModelChangeInfo is a class with information about changes to models by other clients.

getModelTags() returns the tags of the models that have changed.

*The scanModel Method*

The scanModel method is an advanced tool that scans the raw data of a model file for a certain node type and collects the tag and label of all nodes that it finds. See Scanning Models for more information.

# *model*

Model object methods that set up basic parts of a model object such as the model history and saving model files.

# **SYNTAX**

model is a model object that you can create, for example, using ModelUtil.create(*<tag>*).

model.baseSystem(*<system>*): The baseSystem methods sets the unit system for the entire model to the given system. The default is the SI system, which has the tag SI. Other supported unit systems are bft (British engineering units), cgs, mpa, emu, esu, fps, ips, and psi.

model.clearThumbnail(): The clearThumbnail method clears the model thumbnail image.

model.dateModified(): The dateModified method returns the modification date of the model.

Use model.description(*description*) and description = model.description() to set and retrieve the model's description.

model.disableUpdates(): The disableUpdates method returns the current status of the disable state for the model object.

model.disableUpdates(boolean) Temporarily disables and reenables the update of variables in entities that automatically generates other entities (for example, physics or coordSystem). Disable updates to speed up the evaluation of long execution sequences. Leaving this flag disabled can cause strange side effects during modeling. For example, some parameter values in a feature of a physics interface might not be valid until an update has been made. The model inputs are such parameters, which end with the suffix \_src. Trying to set a value to any of these parameters with updates disabled might give an error message. Other effects are that the generated variables are

unknown to the unit evaluator and equation view readings can be incomplete. When the disabled state goes from true to false, the program performs a full update of the variables, so the model is in a fully functional state.

Use model.excludeComputedDataInMph(boolean exclude) to control whether to exclude the built, computed, and plotted data when saving model files. Use model.excludeComputedDataInMph() to return the current value.

Use model.excludeComputedDataInDrafts(boolean exclude) to control whether to exclude built, computed, and plotted data when saving the model as a draft version to a database. Use model.excludeComputedDataInDrafts() to return whether to exclude such data when saving the model as a draft version to a database.

Use model.excludeComputedDataInRegular(boolean exclude) to control whether to exclude built, computed, and plotted data when saving the model as a regular version to a database. Use model.excludeComputedDataInRegular() to return whether to exclude such data when saving the model as a regular version to a database.

model.fontFamily(*<family>*): The fontFamily method sets the font family to be used in plots. The font default is always available. If using Windows, most system fonts can also be used.

model.fontSize(*<size>*): The fontSize method sets the font size to be used in plots.

model.getComsolVersion(): The getComsolVersion method returns the COMSOL Multiphysics version used to save the model or the current version if the model has never been saved. There is also a ModelUtil.getComsolVersion() method, which returns the current version as a string.

model.getFilePath() returns the absolute path of the model or an empty string if the model has not been saved or if the model is loaded from a database.

model.getLastComputationTime(String *time\_format*): The getLastComputationTime method returns the last computation time for the model or application as a string. Use model.getLastComputationTime() to get the time measured in ms, which you can then use as an input to model.setLastComputationTime. Other supported time formats are "hr:min:sec", "h:min:s", and "detailed", which returns the time in seconds and also includes more readable units for longer times.

model.getUsedProducts(): The getUsedProducts method returns the products that this model uses.

model.isReadOnly(): The isReadOnly method returns whether the file where the model is saved is read-only and cannot be overwritten or not. The file can be read-only for two reasons:

- **•** The COMSOL process does not have permission to write to the file.
- **•** On Windows, the file can be locked by another COMSOL instance.

If the model has not been saved, this method returns false.

model.lastModifiedBy(): The lastModifiedBy method returns the last user to modify the model.

model.location(): The location method returns a string that contains the location of the saved model. For a model saved on the file system, the value is the absolute path of the model file. For a model saved in a Model Manager database, the return value is the model's database location URI. If the model has never been saved, the location method returns null. The return value of the location method is what can be provided as-is to, for example, ModelUtil.load(String *tag*, String *modelLocation*) to load a model from either the file system or a database.

model.locationUri(): The locationUri method returns a database location URI for the save location of the model. If the model has never been saved, the location method returns null.

model.modelPath(*<path>*): The modelPath method sets the model path. The model path is used for reading files required by the model, if no path is provided to the file. *<path>* is a list of directories separated by semicolon. When reading an external file, COMSOL Multiphysics attempts to find a file in the following locations:

- **1** The absolute path as given in the filename. If the path given in the filename is relative, it is resolved relative to the following directories.
- **2** The model directory, if provided.
- **3** If searching for a geometry part, the user part libraries. These are given by the preference property geometry.library.userpartlibraries.
- **4** If searching for a geometry part, the COMSOL Multiphysics installation's parts directory.
- **5** The directories defined by model.modelPath (ordered and semicolon separated).
- **6** The directories in the cs.path setting (ordered and semicolon separated).
- **7** The current directory, which is given by the Java system property user.dir and is the directory where you launch COMSOL Multiphysics, unless you have changed the value of user.dir.

The model directory is used for saving and exporting files if you do not provide an absolute path to the file.

model.modelPath() returns the path *<path>* set in a call to model.modelPath(*<path>*).

model.resetLabelsToDefault() resets all node labels to their default values.

model.save(*<filename>*). The save method saves the model as a multiphysics model file in *<filename>*. If you do not provide a path, the model is saved in the directory from where you have launched COMSOL Multiphysics or is automatically saved, if loaded from a database, as a draft version to that database.

model.save(*<filename>*,*<type>*) saves the multiphysics model in *<filename>*. If the type is java, a model file for use with Java® is saved. If the type is m, this command saves a model file as an M-file for use with the LiveLink™ *for* MATLAB®. If the type is vba, this command saves a model file as a VBA-file for use with VBA (Visual Basic for Applications) in Microsoft Excel®.

model.save(*<path>*,*<saveCopy>*) saves a copy of the model, if the boolean argument *<saveCopy>* is true. If it is set to false, this call results in a normal save operation. When saving as a copy, the location of that copy is not remembered, so the previous location for saving models is retained.

model.setLastComputationTime(long *time*): The setLastComputationTime method sets the last computation time for the model or application as the measured computation time (in ms) that you provide as the input.

model.setThumbnail(*<image\_filename>*): The setThumbnail method imports the image file at the given path and sets it as the model's thumbnail image.

Use model.title(*title*) and title = model.title() to set and retrieve the model's title.

*Methods for Compact History*

model.hist().complete(bool) enables or disables history logging for methods where the arguments typically are very large objects. This setting affects some methods of model.sol("sol"). All methods with a name beginning with setU are affected by the model.hist().complete(bool) setting. The default for the completeness is false. The compact history operation is not affected by the completeness setting.

model.hist().isComplete() returns true if history logging is enabled for methods where the arguments typically are very large objects.

model.hist().disable() Disables logging of top-level API calls to the history. Use this method sparingly; the default is that the history is logged.

model.hist().enable() Removes the most recent disabling of top-level API calls to the history. Calling enable() can be viewed as removing an entry from a stack of disabled records; logging only occurs if the stack is empty. If you call disable() twice, you then have to call enable() twice to enable history generation.

model.resetHist(): Compact History. The resetHist() method reconstructs the model history from scratch to generate a compacted model's Java- or M-file history (that is, creating a compact history). If the model has errors or invalid property values, the method fails and the old history is kept.

## **SEE ALSO**

```
model.modelNode(), model.unitSystem()
```

*model.attr()*

Model entity list methods such as copying, duplicating, clearing, and removing model entities.

#### **SYNTAX**

model.*attr*() returns a *model entity list*. The string *attr* denotes a method name for accessing the model entity list.

model.*attr*().clear() removes all tagged model entities.

model.*attr*().copy(*<tag>*,*<copytag>*) creates a new model entity with the tag *<tag>*, which is a copy of the model entity with the tag *<copytag>*. The *<copytag>* should be combination of tags separated by slashes to uniquely identify the entity. For example, pg1/surf1/htgh1 identifies

model.result("pg1").feature("surf1").feature("htgh1"). How to interpret the combined tag depends on the context. The difference between duplicate and copy is that copy can use a source anywhere in the model, whereas duplicate requires that the source is in the same list. Not all model entities support the copy operation. The difference between copy and copyTo is that copyTo copies the entity to a specific position in the list, whereas copy copies to a default position in the list. Not all model entities support the copyTo operation.

model.*attr*().copy(*<tag>*,*<copytag>*,*<modeltag>*) creates a copy and assigns it to the model *<modeltag>*.

model.*attr*().copyTo(*<tag>*,*<copytag>*,*<insertafter>*) creates a copy and inserts it in the list after the entity with tag *<insertafter>*. If *<insertafter>* is an empty string, the entity is inserted first in the list. Not all model entities support the copyTo operation.

model.*attr*().duplicate(*<tag>*,*<copytag>*) creates a new model entity with the tag *<tag>* which is a duplicate of the model entity with tag *<copytag>*. Not all model entities support the duplicate operation.

model.*attr*().duplicateTo(*<tag>*,*<copytag>*, *<insertafter>*) creates a new model entity and inserts it in the list after the entity with tag *<insertafter>*. If *<insertafter>* is an empty string, the entity is inserted first in the list. Not all model entities support the duplicateTo operation.

model.*attr*().get(*<tag>*). The get method returns the entity with tag *<tag>* from the entity list model.*attr*().

model.*attr*().remove(*<tag>*). The remove method removes the model entity with tag *<tag>*.

model.*attr*().size(). The size method returns the number of model entities.

model.*attr*().tags(). The tags method returns a string array with the tags of all model entities.

model.*attr*().uniquetag(*<tag>*). The uniquetag method returns a unique tag in the list context.

#### **SEE ALSO**

model

Model entity methods for adding and accessing name, tag, version, comments, date created, and the author information for a model entity.

#### **SYNTAX**

model.*attr*(*<tag>*) returns a *model entity* with tag *<tag>*. The string *attr* denotes a method name for accessing a model entity with tag *<tag>*.

model.*attr*(*<tag>*).active(*bool*) makes the entity with tag *<tag>* active or inactive.

model.*attr*(*<tag>*).author() returns the author of the entity.

model.*attr*(*<tag>*).author(*<author>*) sets the author of the entity.

model.*attr*(*<tag>*).comments() returns the comments of the entity.

model.*attr*(*<tag>*).comments(*<comments>*) sets the comments of the entity.

model.*attr*(*<tag>*).dateCreated() returns the creation date of the entity.

model.*attr*(*<tag>*).isActive() returns true if the entity with tag *<tag>* is active.

model.*attr*(*<tag>*).label() returns the label of the entity.

model.*attr*(*<tag>*).label(*<label>*) sets the label of the model entity. The label is an arbitrary nonempty string.

model.*attr*(*<tag>*).resetAuthor(*<author>*) sets the author of the entity and all its children. In particular, when used on the model itself, the method sets the author on all model entities of the model.

model.*attr*(*<tag>*).tag() returns the tag of the entity.

model.*attr*(*<tag>*).tag(*<newtag>*) assigns the new tag *<newtag>* to the entity *<tag>*.

model.*attr*(*<tag>*).timeCreated() and model.*attr*(*<tag>*).timeModified() return the creation time of the entity and the time when the entity was last modified, respectively. The times are reported in milliseconds since January 1, 1970, 00:00:00 GMT.

model.*attr*(*<tag>*).version(*<version>*) sets the version of the entity. The version is a user-defined string.

model.*attr*(*<tag>*).version() returns the version of the entity.

model.*attr*(*<tag>*).help() and model.*attr*(*<tag>*).help(*string*), where *string* is the name of a type within the model object, return a query URL string for looking up HTML documentation help text for the model entity of the given type using a COMSOL Documentation server running either locally or online at doc.comsol.com.

model.*attr*(*<tag>*).docMarker() and model.*attr*(*<tag>*).docMarker(*string*), where *string* is the name of a type within the model object, return the topic key for the model entity of the given type to use as the argument to the public static method com.comsol.doc.client.DocRemoteClient.*showHelp*(String) of the COMSOL Documentation application, which shows documentation with the help of a COMSOL Documentation server. If the COMSOL Documentation application is closed, it will automatically relaunch the next time you call the *showHelp*(String) method. If desired, it is possible to close a COMSOL Documentation application launched in this way programmatically by calling the method com.comsol.doc.client.DocRemoteClient.*shutdown*().

#### **SEE ALSO**

model

Create batch jobs.

#### **SYNTAX**

*Jobs*

model.batch().create(*<tag>*,*jobtype*); creates a batch job tagged *<tag>* of type *jobtype*, where *jobtype* is Parametric, Batch, or Cluster.

model.batch().remove(*<tag>*) removes a batch job.

model.batch().size() returns number of batch jobs.

model.batch().tags() returns the tags of the batch jobs.

model.batch(*<tag>*).attach(*<stag>*) attaches a batch job with tag *<tag>* to a study with tag *<stag>*, which makes it visible under that study.

model.batch(*<tag>*).create(*<jtag>*,*<oper>*) creates a batch job sequence.

model.batch(*<tag>*).detach(*<stag>*) detaches a batch job from a study with tag <stag>.

model.batch(*<tag>*).remove(*<ttag>*) removes the task.

model.batch(*<tag>*).run() runs the batch job. The run method can take an additional boolean input argument createPlots, which, when set to true, generates the corresponding default plots when computing a solution.

model.batch(*<tag>*).set(*jprop*,*<jvalue>*) sets the property *jprop* to the value *<jvalue>*.

model.batch(*<tag>*).study(*<stag>*) assigns a batch job to a study tag *<stag>*.

model.batch(*<tag>*).study() returns the study tag of batch job with tag *<tag>*.

*Batch Job Properties*

The Parametric job type has the following properties:

| PROPERTY      | VALUE        | DEFAULT | DESCRIPTION                                                     |  |
|---------------|--------------|---------|-----------------------------------------------------------------|--|
| accumtable    | String       | new     | Accumulated probe table.                                        |  |
| accumtableall | on   off     | off     | Use all probes for the accumulated probe table.                 |  |
| control       | String       | user    | Controlling study.                                              |  |
| param         | String array |         | Name of parameter and its value (output).                       |  |
| pdistrib      | on   off     | off     | Distributed (in parallel) the parameter values.                 |  |
| pname         | String array |         | Parameter name(s) to vary.                                      |  |
| plist         | String array |         | Parameter values.                                               |  |
| plot          | on   off     | off     | Update a plot group while solving.                              |  |
| plotgroup     | String       | default | Update this plot group while solving.                           |  |
| pwork         | int          | 1       | Limit for the number of work groups.                            |  |
| pworkactive   | on   off     | off     | Use a limit for the number of work groups.                      |  |
| stopcond      | String       |         | A stop condition expression.                                    |  |
| err           | on   off     | off     | Stop sweep if error.                                            |  |
| error         | String array |         | The logged error.                                               |  |
| errignore     | true   false | false   | Allow the sequence to continue even if an error is encountered. |  |
| useaccumtable | on   off     | off     | Produce an accumulated probe table while solving.               |  |

The Optimization job type sets its property through the Optimization study node, which has the following properties:

| PROPERTY          | VALUE                                                   | DEFAULT      | DESCRIPTION                                                                                                                                         |
|-------------------|---------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| optobj            | String                                                  |              | Objective function to be optimized.                                                                                                                 |
| descr             | String                                                  |              | Description of optimization objective function.                                                                                                     |
| objectivetype     | minimization  <br>maximization                          | minimization | Sets whether the objective should be minimized or<br>maximized.                                                                                     |
| objectivesolution | auto   first  <br>last   sum   min<br>  max             | auto         | Determines how the objective should be evaluated<br>for studies with more than one available PDE<br>solution, for example, time-dependent problems. |
| pname             | String array                                            |              | Names of control parameters.                                                                                                                        |
| initval           | String array                                            |              | Initial values for control parameters.                                                                                                              |
| lbound            | String array                                            |              | Lower bounds on control parameters.                                                                                                                 |
| ubound            | String array                                            |              | Upper bounds on control parameters.                                                                                                                 |
| optsolver         | coordsearch  <br>montecarlo  <br>neldermead  <br>bobyqa | neldermead   | Optimization solver.                                                                                                                                |
| useseed           | on   off                                                | off          | Use random seed for Monte Carlo solver.                                                                                                             |
| randseed          | int                                                     | 0            | Random seed for Monte Carlo solver.                                                                                                                 |
| nsolvemax         | int                                                     | 1000         | Maximum number of objective evaluations.                                                                                                            |
| opttol            | double                                                  | 1e-2         | Optimization tolerance.                                                                                                                             |
| useobjtable       | on   off                                                | off          | Produce a table with all objective evaluations.                                                                                                     |
| objtable          | String                                                  | new          | Reference to table with objective evaluations.                                                                                                      |
| convinfo          | off   on  <br>detailed                                  | on           | Detail of log messages from optimization solver.                                                                                                    |

The Batch job type has the following properties:

| PROPERTY   | VALUE                                                                                                                                  | DEFAULT           | DESCRIPTION                                                                   |
|------------|----------------------------------------------------------------------------------------------------------------------------------------|-------------------|-------------------------------------------------------------------------------|
| control    | String                                                                                                                                 | user              | Name of controlling study.                                                    |
| np         | integer                                                                                                                                | auto              | Number of cores to use.                                                       |
| graphics   | on   off                                                                                                                               | off               | Enable graphics.                                                              |
| maxallow   | integer                                                                                                                                | 1                 | Maximum allowed number of batch jobs to start<br>simultaneously.              |
| maxrestart | integer                                                                                                                                | 0                 | Maximum number of restarts before a batch job is<br>failed.                   |
| maxalive   | integer                                                                                                                                | 300               | Maximum number of seconds before the batch job<br>must say it is running.     |
| starttime  | now   0   1   2<br>  3   4   5   6  <br>7   8   9   10  <br>11   12   13  <br>14   15   16  <br>17   18   19  <br>20   21   22  <br>23 | now               | The time, as an hour for a 24-hour clock, when the<br>batch job should start. |
| batchdir   | String                                                                                                                                 | Home<br>directory | The directory to store files used by the batch job.                           |
| client     | on   off                                                                                                                               | off               | Run the batch job as client.                                                  |

| PROPERTY             | VALUE                  | DEFAULT                             | DESCRIPTION                                                                                  |
|----------------------|------------------------|-------------------------------------|----------------------------------------------------------------------------------------------|
| port                 | integer                | 2036                                | The host port number.                                                                        |
| host                 | String                 | localhost                           | Name of host.                                                                                |
| batchfile            | String                 | batchmodel<br>.mph                  | Name of batch model file.                                                                    |
| clear                | on   off               | on                                  | Clear the previous model file.                                                               |
| clearmesh            | on   off               | off                                 | Clear meshes before saving model.                                                            |
| clearsolution        | on   off               | off                                 | Clear solutions before saving model.                                                         |
| savefile             | on   off               | on                                  | Save model after run.                                                                        |
| specbatchdir         | on   off               | off                                 | Specify different directory for batch process than used<br>by the current process.           |
| rundir               | String                 | Home<br>directory                   | The directory used by the batch job when specbatchdir<br>is on.                              |
| speccomsoldir        | on   off               | off                                 | Specify different directory for the COMSOL<br>installation than used by the current process. |
| comsoldir            | String                 | COMSOL<br>installation<br>directory | The COMSOL installation directory used by the batch<br>job when speccomsoldir is on.         |
| synchsolutions       | on   off               | off                                 | Synchronize solutions after batch job finishes.                                              |
| synchaccumprobetable | on   off               | off                                 | Synchronize accumulated probe tables after batch job<br>finishes.                            |
| probesel             | all   none  <br>manual | all                                 | The probes to compute.                                                                       |
| probes               | String array           |                                     | Probes to compute.                                                                           |
| useaccumtable        | on   off               | off                                 | Use the accumulated probe table.                                                             |
| accumtable           | String                 | new                                 | Name of table to use.                                                                        |
| accumtableall        | on   off               | on                                  | Use all probes.                                                                              |
| client               | on   off               | off                                 | Run as client.                                                                               |
| host                 | String                 | localhost                           | Name of server.                                                                              |
| port                 | integer                |                                     | Server port number.                                                                          |

The Cluster job type has the following properties:

| PROPERTY                | VALUE                                                    | DEFAULT | DESCRIPTION                                               |
|-------------------------|----------------------------------------------------------|---------|-----------------------------------------------------------|
| batch                   | String                                                   |         | Tag of batch job to run.                                  |
| clustertype             | general   whpc2008  <br>wccs2003   sge  <br>slurm   none | general | The type of cluster job.                                  |
| control                 | String                                                   | user    | Name of controlling study.                                |
| corespernode            | integer                                                  | 0       | Minimum number of cores per node on<br>whpc2008.          |
| exclusive               | on   off                                                 | on      | Demand exclusive right to nodes on<br>whpc2008 and SLURM. |
| filetransfercmd         | none   scp   user                                        | none    | Command to transfer files.                                |
| filetransferfromusercmd | String                                                   |         | Command to transfer files from remote<br>location.        |
| filetransfertousercmd   | String                                                   |         | Command to transfer files to remote<br>location.          |
| hostfile                | String                                                   |         | Path to hostfile.                                         |

| PROPERTY      | VALUE                                                          | DEFAULT   | DESCRIPTION                                                              |
|---------------|----------------------------------------------------------------|-----------|--------------------------------------------------------------------------|
| memorypernode | integer                                                        | 0         | Minimum amount of memory per node on<br>whpc2008 and SLURM.              |
| mpd           | on   off                                                       | off       | If an mpd is running on the computer or<br>not.                          |
| mpiargs       | String                                                         |           | Additional MPI arguments.                                                |
| mpibootstrap  | String                                                         |           | Name of bootstrap server.                                                |
| mpirsh        | String                                                         |           | Path to rsh or ssh.                                                      |
| nn            | integer                                                        | 1         | Number of processes to start.                                            |
| nodegran      | node   socket  core                                            | node      | Node granularity on whpc2008.                                            |
| nodegroup     | String                                                         |           | Name of Named selection of Compute<br>nodes in whpc2008.                 |
| perhost       | integer                                                        | 1         | Number of processes / host.                                              |
| postcmd       | String                                                         |           | DOS/Linux command to execute after the<br>batch job finished.            |
| precmd        | String                                                         |           | DOS/Linux command to execute prior to<br>the batch job.                  |
| priority      | Highest  <br>AboveNormal   Normal<br>  BelowNormal  <br>Lowest | Normal    | Priority of job on wccs2003 and<br>whpc2008.                             |
| remote        | on   off                                                       | off       | Run on remote server.                                                    |
| remotecmd     | none   ssh   user                                              | none      | Command to use when invoking a<br>command on a remote server.            |
| remotehosts   | String                                                         |           | List of remote hostnames.                                                |
| remoteos      | native   windows  <br>linux                                    | native    | OS used on remote hosts.                                                 |
| remoteusercmd | String                                                         |           | Command to run on remote server.                                         |
| reqnodes      | String array                                                   |           | Requested nodes on wccs2003,<br>whpc2008, and SLURM.                     |
| runtime       | DD:HH:MM   Infinite                                            | Infinite  | Maximum time to run before stopping on<br>wccs2003, whpc2008, and SLURM. |
| schedargs     | String                                                         |           | Additional scheduler arguments.                                          |
| scheduler     | String                                                         | localhost | Name of the scheduler on wccs2003,<br>whpc2008, and SLURM.               |
| scpargs       | String                                                         |           | Additional SCP arguments.                                                |
| scpcmd        | scp   putty   user                                             | scp       | SCP command.                                                             |
| scpkey        | String                                                         |           | SCP key file.                                                            |
| scppath       | String                                                         |           | Directory where SCP resides.                                             |
| scpuser       | String                                                         |           | Username used by SCP.                                                    |
| scpusercmd    | String                                                         |           | Command for copying files to remote<br>location.                         |
| sgegran       | host   slot   manual                                           | host      | Node granularity on SGE.                                                 |
| sgenn         | integer                                                        | 1         | Number of slots in SGE.                                                  |
| sgepriority   | integer                                                        | 0         | Priority of job on SGE and SLURM.                                        |
| sgequeue      | String                                                         |           | Name of SGE and SLURM queue.                                             |
| sshargs       | String                                                         |           | Additional SSH arguments.                                                |

| PROPERTY    | VALUE              | DEFAULT | DESCRIPTION                                   |
|-------------|--------------------|---------|-----------------------------------------------|
| sshcmd      | ssh   putty   user | ssh     | SSH command.                                  |
| sshkey      | String             |         | SSH key file.                                 |
| sshpath     | String             |         | Directory where SSH resides.                  |
| sshporthost | String             |         | Port host.                                    |
| sshports    | String             |         | Ports that should be forwarded by SSH.        |
| sshuser     | String             |         | Username used by SSH.                         |
| sshusercmd  | String             |         | User-defined SSH command.                     |
| user        | String             |         | Username on wccs2003, whpc2008, and<br>SLURM. |

#### *Tasks*

model.batch(*<tag>*).create(*<ttag>*,*tasktype*); creates a task of type *tasktype* tagged *<ttag>*. Find options for *tasktype* in Table 2-5 below.

TABLE 2-5: BATCH TASK TYPE OPTIONS.

| TASK TYPE        | DESCRIPTION                                                                                                                            |  |  |  |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|
| Geomseq          | A geometry sequence to build.                                                                                                          |  |  |  |
| Meshseq          | A meshing sequence to build.                                                                                                           |  |  |  |
| Solutionseq      | A solver sequence to compute.                                                                                                          |  |  |  |
| Jobseq           | A job sequence to run.                                                                                                                 |  |  |  |
| Postseq          | A post sequence to run.                                                                                                                |  |  |  |
| Evalnumericalseq | A numerical results seq (derived value) to run (replaced Numericalseq).                                                                |  |  |  |
| Numericalseq     | A numerical results seq to run (deprecated).                                                                                           |  |  |  |
| Exportseq        | An export sequence to run.                                                                                                             |  |  |  |
| Save             | Saves the state of the model at this point in the job sequence.                                                                        |  |  |  |
| Class            | Runs the main function of a compiled class with the system property cs.currentmodel set to<br>the name of the model calling the class. |  |  |  |
| Data             | Created by batch jobs to store external process information.                                                                           |  |  |  |

## *Task Type Properties*

model.batch(*<tag>*).feature(*<ttag>*).set(*ttprop*,*<tpvalue>*) sets the task type property *ttprop* to the value *<tpvalue>*.

Task type properties can have the values listed in Table 2-6.

TABLE 2-6: TASK TYPE PROPERTY VALUES.

| PROPERTY   | VALUE        | DEFAULT | DESCRIPTION                                            |  |
|------------|--------------|---------|--------------------------------------------------------|--|
| clear      | on   off     | on      | Clear the currently stored data.                       |  |
| filename   | String       |         | Name of file to store or open.                         |  |
| openfile   | String array | none    | Name of file that was saved.                           |  |
| param      | String array |         | Name of parameter and its value.                       |  |
| files      | String array |         | Name of files for each parameter.                      |  |
| input      | String array |         | Input to class file.                                   |  |
| seq        | String       | all     | Name of sequence to run.                               |  |
| num        | String array |         | Name of numerical result feature that generated value. |  |
| paramvalue | String array |         | Computed numerical result.                             |  |

TABLE 2-6: TASK TYPE PROPERTY VALUES.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                        |  |
|----------|----------|---------|----------------------------------------------------|--|
| store    | on   off | off     | Copy solution.                                     |  |
| psol     | String   | none    | Tag of solver sequence where solutions are stored. |  |

*The Data Task Type*

The Data task type contains child nodes with process information of type Process; see Table 2-7.

TABLE 2-7: DATA CHILD NODES.

| TASKTYPE | DESCRIPTION                                   |
|----------|-----------------------------------------------|
| Process  | Contains information about running processes. |

model.batch(*<tag>*).feature(*<ttag>*).feature(*<ptag>*).set(*ptype*,*<pvalue>*) sets the property *ptype* to the value *<pvalue>*. *ptype* can have the values listed in Table 2-8

TABLE 2-8: PTYPE PROPERTY VALUES.

| PROPERTY  | VALUE                                                | DEFAULT | DESCRIPTION                                    |
|-----------|------------------------------------------------------|---------|------------------------------------------------|
| cmd       | String                                               |         | The command that started the external process. |
| filename  | String                                               |         | Name of file where model is stored.            |
| operation | update   progress   cancel   stop<br>  clear   rerun | update  | Name of operation to perform on the process.   |
| status    | String                                               |         | Current status of the process.                 |

#### **EXAMPLE**

Create a parametric sweep over a geometry sequence that creates a batch job that runs a parametric sweep that runs a solver.

*Code for Use with Java*

```
model.batch().create("sweep1","Parametric");
model.batch("sweep1").set("pname","a");
model.batch("sweep1").set("plist",new double[]{1,2});
model.batch("sweep1").create("sol","Solutionseq");
model.batch("sweep1").feature("sol").set("seq","sol3");
model.batch().create("batch1","Batch");
model.batch("batch1").create("task","Jobseq");
model.batch("batch1").feature("task").set("seq","sweep1");
model.batch().create("sweep2","Parametric");
model.batch("sweep2").set("pname","b");
model.batch("sweep2").set("plist",new double[]{1,2,3});
model.batch("sweep2").create("gtask","Geomseq");
model.batch("sweep2").feature("gtask").set("seq","geom1");
model.batch("sweep2").create("task","Jobseq");
model.batch("sweep2").feature("task").set("seq","batch1");
model.batch("sweep2").run();
```

Determine the parameter names and values from a parametric sweep that has already been run.

```
model.batch(pname).feature(fname).getString("psol")
```

where pname is the name of the parametric sweep feature that ran and fname is the name of the solution feature that stored the solutions. Use

```
model.sol(sname).feature().tags()
to find out the tags of the stored solutions. Use
  model.sol(sname).feature(fname).getString("sol")
to find the solver sequence for a parameter. Use
  model.sol(sname).getParamNames()
```

```
and
```

```
model.sol(sname).getParamVals()
Code for Use with MATLAB
  model.batch.create('sweep1','Parametric');
  model.batch('sweep1').set('pname','a');
  model.batch('sweep1').set('plist',[1,2]);
  model.batch('sweep1').create('sol','Solutionseq');
  model.batch('sweep1').feature('sol').set('seq','sol3');
  model.batch.create('batch1','Batch');
  model.batch('batch1').create('task','Jobseq');
  model.batch('batch1').feature('task').set('seq','sweep1');
  model.batch.create('sweep2','Parametric');
  model.batch('sweep2').set('pname','b');
  model.batch('sweep2').set('plist',[1,2,3]);
  model.batch('sweep2').create('gtask','Geomseq');
  model.batch('sweep2').feature('gtask').set('seq','geom1');
  model.batch('sweep2').create('task','Jobseq');
  model.batch('sweep2').feature('task').set('seq','batch1');
  model.batch('sweep2').run;
Determine the parameter names and values from a parametric sweep that has already been run.
  model.batch(pname).feature(fname).getString('psol')
where pname is the name of the parametric sweep feature that ran and fname is the name of the solution feature 
that stored the solutions. Use
  model.sol(sname).feature().tags
to find out the tags of the stored solutions. Use
  model.sol(sname).feature(fname).getString('sol')
to find the solver sequence for a parameter. Use
  model.sol(sname).getParamNames
and
  model.sol(sname).getParamVals
SEE ALSO
model.sol(), model.study()
model.bem()
```

Create a boundary element (BEM) model.

# **SYNTAX**

```
model.bem().create(<tag>, "CoefficientPDE");
model.bem(<tag>).set(<prop>, <value>);
model.bem(<tag>).selection();
```

model.bem(*<tag>*).selection(); defines the selection for single-sided BEM boundaries. In addition, the following variants are available for double-sided boundaries:

**•** Use model.bem(*<tag>*).selection("cont"); for a selection of double-sided boundaries where the field is continuous.

- **•** Use model.bem(*<tag>*).selection("discont"); for a selection of double-sided boundaries where the field is allowed to be discontinuous.
- **•** Use model.bem(*<tag>*).selection("edge"); for a selection of BEM edges in 3D.

For a complete list of methods available under selection(), see Selections.

The following general properties are available for model.bem:

TABLE 2-9: GENERAL PROPERTIES FOR BEM.

| PROPERTY     | VALUE      | DEFAULT | DESCRIPTION                                                     |
|--------------|------------|---------|-----------------------------------------------------------------|
| background   | Expression | 0       | Background field.                                               |
| edgefluxname | String     |         | Name of edge flux variable.                                     |
| edgegradname | String[]   |         | Names of edge gradient variables.                               |
| edgeradius   | Expression |         | Radius of cylinders represented as edges.                       |
| fluxname     | String     |         | Name of boundary flux variable.                                 |
| infval       | Expression | 0       | Value at infinity (for Laplace's equation).                     |
| normal       | String[]   |         | Boundary normals pointing out of BEM domain.                    |
| opname       | String     |         | Name of postprocessing operator.                                |
| varname      | String     |         | Name of field variable.                                         |
| varnameback  | String     |         | Name of field variable on backside of double-sided boundaries.  |
| varnamefront | String     |         | Name of field variable on frontside of double-sided boundaries. |

In addition, the following properties for the coefficient of the equation are available:

TABLE 2-10: EQUATION COEFFICIENT PROPERTIES FOR BEM.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                              |
|----------|----------|---------|----------------------------------------------------------|
| a        | String   | 0       | Absorption coefficient.                                  |
| al       | String[] | {0,0,0} | Conservative flux convection coefficient.                |
| be       | String[] | {0,0,0} | Convection coefficient.                                  |
| c        | String   | 1       | Diffusion coefficient.                                   |
| cedge    | String   | 1       | Diffusion coefficient in cylinders represented as edges. |
| m        | String   | 0       | Condition at infinity for Helmholtz equation.            |

The following integration order properties are available:

TABLE 2-11: INTEGRATION ORDER PROPERTIES FOR BEM.

| PROPERTY       | VALUE  | DEFAULT | DESCRIPTION                                                                  |
|----------------|--------|---------|------------------------------------------------------------------------------|
| intorderclose  | String |         | Integration rule for close nonadjacent pairs of mesh elements.               |
| intorderedge   | String |         | Integration rule for pairs of mesh elements with a common edge<br>(3D only). |
| intorderfar    | String |         | Integration rule for distant pairs of mesh elements.                         |
| intordersame   | String |         | Integration rule for pairs of mesh elements that coincide.                   |
| intordervertex | String |         | Integration rule for pairs of mesh elements with a common vertex.            |
| intorderweak   | String |         | Integration for weak equations.                                              |

The following symmetry properties are available:

TABLE 2-12: SYMMETRY PROPERTIES FOR BEM.

| PROPERTY  | VALUE            | DEFAULT | DESCRIPTION                                      |
|-----------|------------------|---------|--------------------------------------------------|
| sym1      | off   scp   user | off     | Use of symmetry plane orthogonal to x-axis.      |
| sym1plane | Expression       | 0       | Position of symmetry plane orthogonal to x-axis. |

TABLE 2-12: SYMMETRY PROPERTIES FOR BEM.

| PROPERTY  | VALUE            | DEFAULT | DESCRIPTION                                      |
|-----------|------------------|---------|--------------------------------------------------|
| sym2      | off   scp   user | off     | Use of symmetry plane orthogonal to y-axis.      |
| sym2plane | Expression       | 0       | Position of symmetry plane orthogonal to y-axis. |
| sym3      | off   scp   user | off     | Use of symmetry plane orthogonal to z-axis.      |
| sym3plane | Expression       | 0       | Position of symmetry plane orthogonal to z-axis. |

Finally, the following far-field approximation properties are available:

TABLE 2-13: FAR-FIELD APPROXIMATION PROPERTIES FOR BEM.

| PROPERTY              | VALUE             | DEFAULT | DESCRIPTION                                                          |
|-----------------------|-------------------|---------|----------------------------------------------------------------------|
| dampingparameter      | Double            | 1       | Damping parameter.                                                   |
| farfieldapprox        | none   ACA   ACA+ | none    | Far-field approximation method.                                      |
| farfieldboxsplitlimit | Integer           | 20      | Number of mesh elements at which box splitting<br>stops.             |
| farfieldmindist       | Double            | 0.5     | Minimum relative distance of boxes using far-field<br>approximation. |
| farfieldsvd           | on   off          | on      | Use SVD compression in far-field approximation.                      |
| farfieldtol           | Double            | 1e-3    | Tolerance used in far-field approximation.                           |
| usedamping            | on   off          | off     | Use damping parameter with iterative solver.                         |

## **EXAMPLE**

The following example shows how to solve for a Helmholtz equation with outgoing waves at infinity in the exterior of a geometry. The example requires that the dependent variables u and bemflux already exist on the exterior boundaries.

```
Code for Use with Java
```

```
model.intRule().create("ir1", "material1");
  model.intRule("ir1").create("o1").order(4);
  model.bem().create("bem1", "CoefficientPDE");
  model.bem("bem1").selection().geom("geom1", 2).set(<list of exterior boundary numbers>);
  model.bem("bem1").set("varname", "u");
  model.bem("bem1").set("fluxname", "bemflux");
  model.bem("bem1").set("normal", new String[]{"-nx", "-ny", "-nz"});
  model.bem("bem1").set("a", "-1");
  model.bem("bem1").set("m", "-1");
  model.bem("bem1").set("opname", "bemop");
  model.bem("bem1").set("intorderfar", "ir1");
  model.bem("bem1").set("intorderclose", "ir1");
  model.bem("bem1").set("intordersame", "ir1");
  model.bem("bem1").set("intorderedge", "ir1");
  model.bem("bem1").set("intordervertex", "ir1");
  model.bem("bem1").set("intorderweak", "ir1");
Code for Use with MATLAB
  model.intRule().create('ir1', 'material1');
  model.intRule('ir1').create('o1').order(4);
  model.bem.create('bem1', 'CoefficientPDE');
  model.bem('bem1').selection.geom('geom1', 2).set(<list of exterior boundary numbers>);
  model.bem('bem1').set('varname', 'u');
  model.bem('bem1').set('fluxname', 'bemflux');
  model.bem('bem1').set('normal', {'-nx', '-ny', '-nz'});
  model.bem('bem1').set('a', '-1');
  model.bem('bem1').set('m', '-1');
  model.bem('bem1').set('opname', 'bemop');
```

```
model.bem('bem1').set('intorderfar', 'ir1');
  model.bem('bem1').set('intorderclose', 'ir1');
  model.bem('bem1').set('intordersame', 'ir1');
  model.bem('bem1').set('intorderedge', 'ir1');
  model.bem('bem1').set('intordervertex', 'ir1');
  model.bem('bem1').set('intorderweak", 'ir1');
SEE ALSO
model.coeff()
model.coeff()
```

Creating equations in the coefficient form. See also model.shape(), model.weak().

#### **SYNTAX**

```
model.coeff().create(<tag>,<fields>);
model.coeff(<tag>).field(<fields>);
model.coeff(<tag>).field(<pos>,<fields>);
model.coeff(<tag>).intRule(<irlist>);
model.coeff(<tag>).intRule(<pos>,<irule>);
model.coeff(<tag>).create(<ftag>);
model.coeff(<tag>).feature(<ftag>).set(ctype,<cvalue>);
model.coeff(<tag>).field();
model.coeff(<tag>).intRule();
model.coeff(<tag>).feature(<ftag>).getType(ctype);
model.coeff(<tag>).feature(<ftag>).set(String pname, int value);
model.coeff(<tag>).feature(<ftag>).set(String pname, int pos, int value);
model.coeff(<tag>).feature(<ftag>).set(String pname, int pos, int[] value);
model.coeff(<tag>).feature(<ftag>).set(String pname, int pos1, int pos2, int value);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String value, int firstIndex,
                   int secondIndex);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String[] value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, double value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, double value, int firstIndex,
                   int secondIndex);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, double[] value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, int value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, int value, int firstIndex,
                   int secondIndex);
model.coeff(<tag>).feature(<ftag>).setIndex(String name, int[] value, int index);
```

The set() methods index/position arguments are 1-based. The setIndex() methods index/position arguments are 0-based. See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

# **DESCRIPTION**

model.coeff(*<tag>*)returns the coefficient form equations with tag *<tag>*.

model.coeff().create(*<tag>*,*<fields>*) creates coefficient form equations with tag *<tag>* using the fields *<fields>*. The field tags refer to the fields defined by model.field(). The shape functions referred to by the fields are internally also used to find the derivatives of the field variables if converting the coefficient features to the weak formulation. By default, all coefficients are designed to be noncontributing to the equation under consideration. For example, model.coeff().create("mytag",new String[]{"u","v"}).

model.coeff(*<tag>*).field(*<fields>*) sets the coefficient form field variables. *<fields>* is a string with a field tag or a vector of field tags — for example, new String[]{"u","v"}. Reassigning the fields has the side effect that the size of the coefficients change if the number of field variables changes.

model.coeff(*<tag>*).field(*<pos>*,*<fields>*) edits the field at position *<pos>* in the field vector *<fields>*.

model.coeff(*<tag>*).intRule(*<irlist>*) assigns integration rules to the coefficient form equations. The list must have the same length as the number of field variables defined by the fields or have length 1. In the latter case all equations use the same integration rule. The number of field variables is not necessarily the same as the number of strings specified in model.coeff(*<tag>*).field().

model.coeff(*<tag>*).intRule(*<pos>*,*<irule>*) edits the integration rule at position *<pos>* in the vector *<irule>*.

model.coeff(*<tag>*).feature(*<ftag>*) is a coefficient form feature with tag *<ftag>* in the coefficient form equations with tag *<tag>*.

model.coeff(*<tag>*).create(*<ftag>*) creates a new coefficient form feature with tag *<ftag>*.

model.coeff(*<tag>*).feature(*<ftag>*).set(*ctype*,*<cvalue>*) sets the value of the coefficient of type *ctype* to *<value>*. All string data types that are listed in Table 2-4 are supported; which argument types are applicable depends on the coefficient. *ctype* is one of c, al, ga, be, a, f, da, ea, q, and g. These coefficients are available at all dimensions. In addition at level edim==sdim-1, the coefficients q and g are allowed, corresponding to a and f, respectively. All coefficients have a default 0 contribution.

model.coeff(*<tag>*).feature(*<ftag>*).selection().named(*<seltag>*) assigns the coefficient form equations to the named selection *<seltag>*.

model.coeff(*<tag>*).feature(*<ftag>*).selection().set(...) defines a local selection that assigns the coefficient form equations to geometric entities. For a complete list of methods available under selection(), see model.selection(). Only selections at a single geometry level is allowed in the selection.

model.coeff(*<tag>*).field() returns the fields as a string array.

model.coeff(*<tag>*).intRule() returns the integration rule tags as a string array.

model.coeff(*<tag>*).feature(*<ftag>*).get*Type*(*ctype*) returns the coefficient value. See the section get\* and Selection Access Methods for available methods.

model.coeff(*<tag>*).feature(*<ftag>*).selection().named() returns the named selection tag, and model.coeff(*<tag>*).feature(*<ftag>*).selection().get*Type*() returns domain information. See model.selection() for available methods.

*Special Properties for the Wave Form PDE*

If you create a Wave Form PDE using, for example,

model.physics().create("wahw", "WaveFormPDE", "geom1", new String[][]{{"u"}});

then the following properties are available using the setIndex syntax:

TABLE 2-14: WAVE FORM PDE PROPERTIES.

| PROPERTY     | VALUE                   | DEFAULT | INDEX | DESCRIPTION                                                 |
|--------------|-------------------------|---------|-------|-------------------------------------------------------------|
| fluxmethod   | fluxLF  <br>fluxGeneral | fluxLF  | 0     | Flux method: Lax–Friedrichs or a general numerical<br>flux. |
| gstar        | double                  | 1       | 0     | General numerical flux.                                     |
| tau          | double                  | 1       | 0     | Lax–Friedrichs parameter.                                   |
| filteractive | 0   1                   | 0       | 0     | Activate filter parameters.                                 |
| filter       | double                  | 36      | 0     | Filter parameter α.                                         |

TABLE 2-14: WAVE FORM PDE PROPERTIES.

| PROPERTY | VALUE  | DEFAULT | INDEX | DESCRIPTION           |
|----------|--------|---------|-------|-----------------------|
| filter   | double | 0.6     | 1     | Filter parameters ηc. |
| filter   | double | 3       | 2     | Filter parameter s.   |

For example, to set the filter parameter *s* to 2.5, use

```
model.physics("wahw").feature("wafeq1").setIndex("filter", "2.5", 2);
```

#### **EXAMPLE**

Define two uncoupled Poisson-like equations on the domain dtag.

```
Code for Use with Java
  model.coeff().create("c1",new String[]{"u","v"});
  model.coeff("c1").intRule(new String[]{"gp1","gp1"});
  CoeffFeature f1 = model.coeff("c1").create("f1");
  f1.set("c",1,new String[]{"1","0.1","2"});
  f1.set("c",2,"3");
  f1.set("f",new String[]{"2","1"});
  f1.selection().geom("g1",2);
  f1.selection().set(1);
Code for Use with MATLAB
  model.coeff.create('c1',{'u','v'});
  model.coeff('c1').intRule({'gp1','gp1'});
  f1 = model.coeff('c1').create('f1');
  f1.set('c',1,{'1','0.1','2'});
  f1.set('c',2,'3');
  f1.set('f',{'2','1'});
  f1.selection.geom('g1',2);
  f1.selection.set(1);
```

# *model.common()*

The common list contains nodes that have different purposes depending on the node type. The type is assigned when the node is created. All other properties are set and accessed using generic set and get methods as described under set() and get\* and Selection Access Methods. The different types may or may not use a selection. The following node types are currently defined:

TABLE 2-15: COMMON FEATURE TYPES.

| TYPE                  | PURPOSE          | DESCRIPTION                                                                                              |
|-----------------------|------------------|----------------------------------------------------------------------------------------------------------|
| ExpressionOperator    | Variable utility | Define an operator evaluating different<br>parameterized expressions on different<br>geometric entities. |
| OperatorContribution  | Variable utility | Override the definition of an expression<br>operator.                                                    |
| Matrix                | Variable utility | Define a matrix of variables. Uses a selection.                                                          |
| MatrixInverse         | Variable utility | Compute the inverse of a matrix. Uses a<br>selection.                                                    |
| MatrixDiagonalization | Variable utility | Diagonalize a symmetric 3-by-3 matrix. Uses a<br>selection.                                              |
| MatrixDecomposition   | Variable utility | Use SVD to decompose a matrix. Uses a<br>selection.                                                      |
| VectorTransform       | Variable utility | Transform a vector from one coordinate<br>system to another.                                             |

TABLE 2-15: COMMON FEATURE TYPES.

| TYPE                        | PURPOSE               | DESCRIPTION                                                                                |
|-----------------------------|-----------------------|--------------------------------------------------------------------------------------------|
| MatrixTransform             | Variable utility      | Transform matrix indices between coordinate<br>systems.                                    |
| StateVariables              | Variable utility      | Define state variables and reinitialization rules.                                         |
| ControlVariableField        | Variable utility      | Define control variables on geometric entities.                                            |
| Global Dependent Variables  | Equation contribution | Declare global scalar degrees of freedom.                                                  |
| Global Weak Contribution    | Equation contribution | Add a global scalar weak contribution.                                                     |
| Global Constraint           | Equation contribution | Add a global scalar constraint.                                                            |
| Dependent Variable Field    | Equation contribution | Declare a dependent variable field on a<br>selection.                                      |
| Weak Contribution           | Equation contribution | Add a weak contribution on a selection.                                                    |
| Constraint                  | Equation contribution | Add a constraint on a selection.                                                           |
| ParticipationFactors        | Physics variables     | Set up participation factor evaluation.                                                    |
| ResponseSpectrum            | Physics variables     | Set up response spectrum evaluation.                                                       |
| AmbientProperties           | Physics variables     | Set up ambient thermal conditions using<br>meteorological data.                            |
| GlobalReducedModelInputs    | Control variables     | Define global control variables for use as inputs<br>to model reduction.                   |
| Control Function            | Optimization          | Define a control variable field and a filtered<br>density field for topology optimization. |
| FixedTopologyDomain         | Optimization          | Define a fixed topology domain for topology<br>optimization.                               |
| FixedTopologyBoundary       | Optimization          | Define a fixed topology boundary for topology<br>optimization.                             |
| FreeShapeDomain             | Optimization          | Define a free shape domain for shape<br>optimization.                                      |
| FreeShapeBoundary           | Optimization          | Define a free shape boundary for shape<br>optimization.                                    |
| FreeShapeShell              | Optimization          | Define a free shape shell for shape optimization.                                          |
| PolynomialShell             | Optimization          | Define a polynomial shell for shape<br>optimization.                                       |
| FreeShapeSymmetry           | Optimization          | Define a symmetry or roller condition for<br>shape optimization.                           |
| FixedShapePoint             | Optimization          | Define a fixed shape point in 2D for shape<br>optimization.                                |
| FixedShapeEdge              | Optimization          | Define a fixed shape edge in 3D for shape<br>optimization.                                 |
| FixedShapeBoundary          | Optimization          | Define a fixed shape boundary for shape<br>optimization.                                   |
| FixedShapeBoundary          | Optimization          | Define a mirror symmetry domain or boundary<br>for shape optimization.                     |
| FixedShapeBoundary          | Optimization          | Define a sector symmetry domain or boundary<br>for shape optimization.                     |
| GlobalLeastSquaresObjective | Optimization          | Define a global least-squares objective.                                                   |
| LeastSquaresObjective       | Optimization          | Define a least-squares objective.                                                          |
| MaterialTopologyDomain      | Optimization          | Define a material topology domain for topology<br>optimization.                            |

TABLE 2-15: COMMON FEATURE TYPES.

| TYPE                             | PURPOSE                              | DESCRIPTION                                                                          |
|----------------------------------|--------------------------------------|--------------------------------------------------------------------------------------|
| MaterialTopologyBoundary         | Optimization                         | Define a material topology boundary for<br>topology optimization.                    |
| PolynomialBoundary               | Optimization                         | Defined a polynomial boundary in 2D for shape<br>optimization,.                      |
| VoidTopologyDomain               | Optimization                         | Define a void topology domain for topology<br>optimization.                          |
| VoidTopologyBoundary             | Optimization                         | Define a void topology boundary for topology<br>optimization.                        |
| MirrorTopology                   | Optimization                         | Define a mirror symmetry domain or boundary<br>for topology optimization.            |
| SectorTopology                   | Optimization                         | Define a sector symmetry domain or boundary<br>for topology optimization.            |
| CommonInputDefault               | Default model inputs                 | Set default values of input quantities required<br>by materials.                     |
| CommonInputDef                   | Default model inputs                 | Override values of input quantities on selected<br>entities.                         |
| PrescribedDeformation            | Moving mesh and<br>deformed geometry | Prescribe a mesh deformation on domains.<br>Uses a selection.                        |
| PrescribedMeshVelocity           | Moving mesh and<br>deformed geometry | Prescribe a mesh velocity of a deforming<br>domain boundary. Uses a selection.       |
| RotatingDomain                   | Moving mesh and<br>deformed geometry | Prescribe rotation of a domain. Uses a<br>selection.                                 |
| DeformingDomain                  | Moving mesh and<br>deformed geometry | Specify free deformation of domains. Uses a<br>selection.                            |
| FixedBoundary                    | Moving mesh and<br>deformed geometry | Prescribe zero displacement of a deforming<br>domain boundary. Uses a selection.     |
| PrescribedMeshDisplacement       | Moving mesh and<br>deformed geometry | Prescribe displacement of a deforming domain<br>boundary. Uses a selection.          |
| PrescribedNormalMeshVelocity     | Moving mesh and<br>deformed geometry | Prescribe velocity of a deforming domain<br>boundary. Uses a selection.              |
| PrescribedNormalMeshDisplacement | Moving mesh and<br>deformed geometry | Prescribe a normal displacement of a deforming<br>domain boundary. Uses a selection. |
| RotatingBoundary                 | Moving mesh and<br>deformed geometry | Prescribe rotation of a boundary. Uses a<br>selection.                               |
| Slip                             | Moving mesh and<br>deformed geometry | Prescribe mesh slip behavior of a deforming<br>domain boundary. Uses a selection.    |
| Symmetry                         | Moving mesh and<br>deformed geometry | Prescribe symmetry on a deforming domain<br>boundary. Uses a selection.              |
| SurrogateModelGeometrySampling   | Surrogate modeling                   | Geometry sampling for surrogate modeling.                                            |

![](_page_36_Picture_2.jpeg)

All types with an optimization purpose require the Optimization Module.

![](_page_36_Picture_4.jpeg)

Moving mesh and deformed geometry features exist in two versions which differ in type ID and in which frame they control, but are otherwise identical. The deformed geometry version controlling the material frame uses a type ID with DeformedGeometry appended.

#### **SYNTAX**

```
model.component(<ctag>).common().create(<tag>,type);
model.component(<ctag>).common(<tag>).set(property, <value>);
model.component(<ctag>).common(<tag>).image()
```

#### **DESCRIPTION**

model.component(*<ctag>*).common().create(*<tag>*,*type*) creates a common feature node with the given tag and type.

model.component(*<ctag>*).common(*<tag>*).set(*property, <value>*) sets a named property in the common feature with tag *<tag>* in component *<ctag>*.

#### *ExpressionOperator*

model.component(*<ctag>*).common().create(*<tag>*,"ExpressionOperator") creates an expression operator feature. The following properties are available.

TABLE 2-16: PROPERTIES FOR EXPRESSIONOPERATOR.

| PROPERTY   | VALUE                        | DEFAULT                                       | DESCRIPTION                                                                            |
|------------|------------------------------|-----------------------------------------------|----------------------------------------------------------------------------------------|
| argument   | String array                 | {}                                            | List of argument formal variable names.                                                |
| dimensions | String array                 | {}                                            | List of unit expressions for each argument.                                            |
| expression | String                       | Empty                                         | An expression in terms of formal<br>arguments and other variables.                     |
| passbyval  | String array of on or<br>off | String array with all elements<br>set to off. | Pass the arguments by reference (when set<br>to "off") or by value (when set to "on"). |

#### *OperatorContribution*

model.component(*<ctag>*).common(*<exop>*).create(*<tag>*,"OperatorContribution") creates an Operator Contribution feature as a subfeature to the Expression Operator feature with tag *<exop>*. The following properties are available.

TABLE 2-17: PROPERTY FOR OPERATORCONTRIBUTION.

| PROPERTY   | VALUE  | DEFAULT | DESCRIPTION                                                        |
|------------|--------|---------|--------------------------------------------------------------------|
| expression | String | Empty   | An expression in terms of formal<br>arguments and other variables. |

# *Matrix*

model.component(*<ctag>*).common().create(*<tag>*,"Matrix") creates a matrix variable feature. For a Matrix definition, the following properties are available.

TABLE 2-18: PROPERTIES FOR MATRIX.

| PROPERTY | VALUE                           | DEFAULT                                                   | DESCRIPTION                                                                |
|----------|---------------------------------|-----------------------------------------------------------|----------------------------------------------------------------------------|
| format   | full   symmetric  <br>hermitian | full                                                      | Matrix format.                                                             |
| matrix   | String matrix                   | {{"1", "0", "0"},<br>{"0", "1", "0"},<br>{"0", "0", "1"}} | The matrix elements of a square matrix.                                    |
| size     | Integer                         | 3                                                         | Matrix size. Valid values: 1–9,<br>representing 1-by-1 to 9-by-9 matrices. |

## *MatrixInverse*

model.component(*<ctag>*).common().create(*<tag>*,"MatrixInverse") creates a matrix inverse feature. For a MatrixInverse definition, the following properties are available.

TABLE 2-19: PROPERTIES FOR MATRIXINVERSE.

| PROPERTY | VALUE                           | DEFAULT                                                   | DESCRIPTION                                                                |
|----------|---------------------------------|-----------------------------------------------------------|----------------------------------------------------------------------------|
| format   | full   symmetric  <br>hermitian | full                                                      | Matrix format.                                                             |
| matrix   | String matrix                   | {{"1", "0", "0"},<br>{"0", "1", "0"},<br>{"0", "0", "1"}} | The matrix elements of the square matrix<br>to invert.                     |
| size     | Integer                         | 3                                                         | Matrix size. Valid values: 1–9,<br>representing 1-by-1 to 9-by-9 matrices. |

# *MatrixDiagonalization*

model.component(*<ctag>*).common().create(*<tag>*,"MatrixDiagonalization") creates a matrix diagonalization feature. For a MatrixDiagonalization definition, the following properties are available.

TABLE 2-20: PROPERTIES FOR MATRIXDIAGONALIZATION.

| PROPERTY                    | VALUE         | DEFAULT                                                   | DESCRIPTION                                                 |
|-----------------------------|---------------|-----------------------------------------------------------|-------------------------------------------------------------|
| computeExponential          | true   false  | false                                                     | Compute matrix exponential.                                 |
| ignoreJacobianContributions | true   false  | true                                                      | Ignore solution dependencies.                               |
| matrix                      | String matrix | {{"1", "0", "0"},<br>{"0", "1", "0"},<br>{"0", "0", "1"}} | The matrix elements of the<br>square matrix to diagonalize. |

## *MatrixDecomposition*

model.component(*<ctag>*).common().create(*<tag>*,"MatrixDecomposition") creates a matrix decomposition (SVD) feature. For a MatrixDecomposition definition, the following properties are available.

TABLE 2-21: PROPERTIES FOR MATRIXDECOMPOSITION.

| PROPERTY                    | VALUE                           | DEFAULT                                                   | DESCRIPTION                                                                   |
|-----------------------------|---------------------------------|-----------------------------------------------------------|-------------------------------------------------------------------------------|
| computeLeftSingularVectors  | true   false                    | true                                                      | Compute left singular<br>vectors.                                             |
| computeRightSingularVectors | true   false                    | true                                                      | Compute right singular<br>vectors.                                            |
| computeRotationMatrix       | true   false                    | true                                                      | Compute rotation matrix.                                                      |
| computeStretchMatrix        | true   false                    | true                                                      | Compute stretch matrix.                                                       |
| format                      | full   symmetric<br>  hermitian | full                                                      | Matrix format.                                                                |
| matrix                      | String matrix                   | {{"1", "0", "0"},<br>{"0", "1", "0"},<br>{"0", "0", "1"}} | The matrix elements of the<br>square matrix to decompose.                     |
| size                        | Integer                         | 3                                                         | Matrix size. Valid values: 1–9,<br>representing 1-by-1 to 9-by-9<br>matrices. |

## *VectorTransform*

model.component(*<ctag>*).common().create(*<tag>*,"VectorTransform"*, <component>*) creates a vector transformation feature that transforms vectors from one coordinate system to another. For a VectorTransform definition, the following properties are available.

TABLE 2-22: PROPERTIES FOR VECTORTRANSFORM.

| PROPERTY                        | VALUE                                                                  | DEFAULT        | DESCRIPTION                                                |
|---------------------------------|------------------------------------------------------------------------|----------------|------------------------------------------------------------|
| componentChange                 | none   raiseIndex  <br>lowerIndex                                      | none           | Raise or lower index of output<br>vector.                  |
| inputComponents                 | contravariant  <br>covariant                                           | contravariant  | Input component type.                                      |
| inputReferenceFrame             | mesh   geometry  <br>material   spatial                                | spatial        | Reference frame for relative input<br>coordinate system.   |
| inputSystem                     | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Coordinate system to which input<br>components refer.      |
| inputVolumeReference<br>System  | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Input volume reference for density<br>transforms.          |
| metric                          | material   spatial                                                     | spatial        | Metric for raising or lowering<br>indices.                 |
| outputReferenceFrame            | mesh   geometry  <br>material   spatial                                | spatial        | Reference frame for relative output<br>coordinate system.  |
| outputSystem                    | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Coordinate system to user for<br>output vector components. |
| outputVolumeReference<br>System | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Output volume reference for<br>density transforms.         |
| transform                       | vector  <br>vectorDensity  <br>scalarFlux  <br>directedAreaElement     | vector         | Transform rule to apply.                                   |
| vector                          | String array                                                           | {"0","0","0"}  | Input vector components.                                   |

## *MatrixTransform*

model.component(*<ctag>*).common().create(*<tag>*,"MatrixTransform"*, <component>*) creates a matrix transformation feature that transforms matrix indices from one coordinate system to another. For a MatrixTransform definition, the following properties are available.

TABLE 2-23: PROPERTIES FOR MATRIXTRANSFORM.

| PROPERTY                      | VALUE                                                                  | DEFAULT        | DESCRIPTION                                                  |
|-------------------------------|------------------------------------------------------------------------|----------------|--------------------------------------------------------------|
| componentChange               | none   raiseIndex  <br>lowerIndex                                      | none           | Raise or lower index of output<br>vector.                    |
| format                        | full   symmetric                                                       | full           | Form of input matrix.                                        |
| inputColumnComponents         | contravariant  <br>covariant                                           | contravariant  | Input column index component<br>type.                        |
| inputColumnReference<br>Frame | mesh   geometry  <br>material   spatial                                | spatial        | Reference frame for relative<br>column input system.         |
| inputColumnSystem             | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial | Coordinate system to which<br>input column components refer. |
| inputComponents               | contravariant  <br>covariant                                           | contravariant  | Input component type for<br>symmetric matrix.                |

TABLE 2-23: PROPERTIES FOR MATRIXTRANSFORM.

| PROPERTY                        | VALUE                                                                  | DEFAULT                                                   | DESCRIPTION                                                           |
|---------------------------------|------------------------------------------------------------------------|-----------------------------------------------------------|-----------------------------------------------------------------------|
| inputReferenceFrame             | mesh   geometry  <br>material   spatial                                | spatial                                                   | Reference frame for relative<br>symmetric input coordinate<br>system. |
| inputRowComponents              | contravariant  <br>covariant                                           | contravariant                                             | Input row index component<br>type.                                    |
| inputRowReference<br>Frame      | mesh   geometry  <br>material   spatial                                | spatial                                                   | Reference frame for relative row<br>input coordinate system.          |
| inputRowSystem                  | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Coordinate system to which<br>input row components refer.             |
| inputSystem                     | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Coordinate system to which<br>symmetric input components<br>refer.    |
| inputVolumeReference<br>System  | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Input volume reference for<br>density transforms.                     |
| matrix                          | String matrix                                                          | {{"0", "0", "0"},<br>{"0", "0", "0"},<br>{"0", "0", "0"}} | Input matrix components.                                              |
| columnMetric                    | material   spatial                                                     | spatial                                                   | Metric for raising or lowering<br>column indices.                     |
| rowMetric                       | material   spatial                                                     | spatial                                                   | Metric for raising or lowering<br>row indices.                        |
| outputColumnReference<br>Frame  | mesh   geometry  <br>material   spatial                                | spatial                                                   | Reference frame for relative<br>output column coordinate<br>system.   |
| outputColumnSystem              | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Coordinate system to user for<br>output matrix column indices.        |
| outputRowReferenceFra<br>me     | mesh   geometry  <br>material   spatial                                | spatial                                                   | Reference frame for relative<br>output row coordinate system.         |
| outputRowSystem                 | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Coordinate system to user for<br>output matrix row indices.           |
| outputVolumeReference<br>System | global:spatial  <br>global:material  <br><coordsys_tag></coordsys_tag> | global:spatial                                            | Output volume reference for<br>density transforms.                    |
| transform                       | vector  <br>tensorDensity  <br>vectorFlux                              | tensor                                                    | Transform rule to apply.                                              |

#### *StateVariables*

model.component(*<ctag>*).common().create(*<tag>*,"StateVariables") creates a state variable definition feature that declares state variables and specifies initialization and update expressions. For a State Variables definition, the following properties are available.

TABLE 2-24: PROPERTIES FOR STATEVARIABLES.

| PROPERTY     | VALUE                              | DEFAULT | DESCRIPTION                |
|--------------|------------------------------------|---------|----------------------------|
| description  | String array                       | {}      | State descriptions.        |
| initialValue | String array                       | {}      | Initial value expressions. |
| order        | 0 2 4 6 8 10 12 14 <br>userDefined | 4       | Integration point order.   |

TABLE 2-24: PROPERTIES FOR STATEVARIABLES.

| PROPERTY         | VALUE                                          | DEFAULT       | DESCRIPTION                                             |
|------------------|------------------------------------------------|---------------|---------------------------------------------------------|
| orderExpression  | String                                         | 4             | User-defined order                                      |
| quantity         | none   <quantity_id></quantity_id>             | dimensionless | State physical quantity                                 |
| state            | String array                                   | {}            | State names.                                            |
| unit             | <unit></unit>                                  | 1             | State unit                                              |
| update           | beforeStep   afterStep  <br>onlyInitialization | beforeStep    | When to apply the update<br>expressions.                |
| updateExpression | String array                                   | {}            | Update expressions.                                     |
| valueType        | real   complex                                 | complex       | Value type when using splitting of<br>complex variables |

## *Global Dependent Variables*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalDependentVariables") creates a global dependent variables definition feature that declares global degrees of freedom. For a Global Dependent Variables feature, the following properties are available.

TABLE 2-25: PROPERTIES FOR GLOBALDEPENDENTVARIABLES.

| PROPERTY              | VALUE                              | DEFAULT       | DESCRIPTION                                              |
|-----------------------|------------------------------------|---------------|----------------------------------------------------------|
| description           | String array                       | {}            | DOF descriptions.                                        |
| initialTimeDerivative | String array                       | {}            | Initial time derivative<br>expressions.                  |
| initialValue          | String array                       | {}            | Initial value expressions.                               |
| quantity              | none   <quantity_id></quantity_id> | dimensionless | State physical quantity.                                 |
| timeDerivatives       | off   solver   frequency           | solver        | Definition of time derivatives.                          |
| unit                  | <unit></unit>                      | 1             | State unit.                                              |
| valueType             | real   complex                     | complex       | Value type when using splitting of<br>complex variables. |

# *Global Weak Contribution*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalWeakContribution") creates a global weak contribution feature that adds one or more global scalar weak expression to the overall system of equations. For a Global Weak Contribution feature, the following properties are available.

TABLE 2-26: PROPERTIES FOR GLOBALWEAKCONTRIBUTION.

| PROPERTY       | VALUE        | DEFAULT | DESCRIPTION       |
|----------------|--------------|---------|-------------------|
| weakExpression | String array | {}      | Weak expressions. |

## *Global Constraint*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalConstraint") creates a global constraint feature that adds a single scalar constraint to the overall system of equations. For a Global Constraint feature, the following properties are available.

TABLE 2-27: PROPERTIES FOR GLOBALCONSTRAINT.

| PROPERTY        | VALUE                   | DEFAULT   | DESCRIPTION                     |
|-----------------|-------------------------|-----------|---------------------------------|
| constraint      | String                  | 0         | Constraint expression.          |
| constraintForce | String                  | 0         | Constraint force expression.    |
| reactionTerms   | symmetric   userDefined | symmetric | Application of reaction forces. |

#### *Dependent Variable Field*

model.component(*<ctag>*).common().create(*<tag>*,"DependentVariableField") creates a dependent variable field definition feature that declares a scalar or vector field on a selection. For a Dependent Variable field definition, the following properties are available.

TABLE 2-28: PROPERTIES FOR DEPENDENTVARIABLEFIELD.

| PROPERTY                    | VALUE                                                                           | DEFAULT                                                                     | DESCRIPTION                                                                 |
|-----------------------------|---------------------------------------------------------------------------------|-----------------------------------------------------------------------------|-----------------------------------------------------------------------------|
| boundaryFlux                | on   off                                                                        | on                                                                          | Define accurate boundary<br>flux variables for<br>postprocessing.           |
| boundaryFluxSmoothing       | on   off                                                                        | on                                                                          | Smooth boundary flux<br>variables.                                          |
| componentFrame              | mesh   geometry  <br>material   spatial  <br>allCovariant  <br>allContravariant | spatial                                                                     | Frame of vector variable<br>components.                                     |
| components                  | String array                                                                    | { <field><x>,<br/><field<y>,<br/><field<z>}</field<z></field<y></x></field> | Component names when<br>declared on a single frame.                         |
| condition                   | String                                                                          | 0                                                                           | Boolean condition true in<br>elements where shape<br>functions are defined. |
| conditionActive             | on   off                                                                        | off                                                                         | Use element set condition.                                                  |
| derivativeFrame             | all   mesh   geometry  <br>material   spatial                                   | all                                                                         | Frames where gradient<br>component variables will be<br>defined.            |
| fieldType                   | scalar   inPlaneVector  <br>outOfPlaneVector  <br>threeComponentVector          | scalar                                                                      | Number of field<br>components and<br>interpretation.                        |
| initialTimeDerivative       | String                                                                          | 0                                                                           | Initial time derivative of<br>scalar field.                                 |
| initialValue                | String                                                                          | 0                                                                           | Initial value of scalar field.                                              |
| initialVector               | String array                                                                    | {0,0,0}                                                                     | Initial value of vector field.                                              |
| initialVectorTimeDerivative | String array                                                                    | {0,0,0}                                                                     | Initial value of vector field.                                              |
| interiorFluxEstimate        | String array                                                                    | {0,0,0}                                                                     | Domain expression<br>estimating the flux in the<br>domain.                  |
| elementOrder                | 0 1 2 3 4 5 6 7 <br>userDefined                                                 | 2                                                                           | Element order. Available<br>values depend on the shape<br>function type.    |
| elementOrderExpression      | String                                                                          | 2                                                                           | User-defined element<br>order                                               |
| quantity                    | none   <quantity_id></quantity_id>                                              | dimensionless                                                               | State physical quantity                                                     |
| referenceFrame              | mesh   geometry  <br>material   spatial                                         | spatial                                                                     | Frame in which the<br>interiorFluxEstimate<br>components are entered.       |
| shapeFunctionType           | <shape_function_id></shape_function_id>                                         | shlag                                                                       | Shape function type ID.                                                     |
| slits                       | Selection                                                                       | empty                                                                       | Selection where a<br>discontinuity is introduced.                           |
| timeDerivatives             | off   solver   frequency                                                        | solver                                                                      | Definition of time<br>derivatives.                                          |

TABLE 2-28: PROPERTIES FOR DEPENDENTVARIABLEFIELD.

| PROPERTY  | VALUE          | DEFAULT | DESCRIPTION                                                |
|-----------|----------------|---------|------------------------------------------------------------|
| unit      | <unit></unit>  | 1       | State unit                                                 |
| valueType | real   complex | complex | Value type when using<br>splitting of complex<br>variables |

## *Weak Contribution*

model.component(*<ctag>*).common().create(*<tag>*,"WeakContribution") creates a weak contribution feature that adds a weak expression on a selection to the overall system of equations. For a Weak Contribution feature, the following properties are available.

TABLE 2-29: PROPERTIES FOR WEAKCONTRIBUTION.

| PROPERTY                   | VALUE                                   | DEFAULT | DESCRIPTION                                     |
|----------------------------|-----------------------------------------|---------|-------------------------------------------------|
| weakExpression             | String                                  | 0       | Weak expression                                 |
| integrationOrder           | 0 2 4 6 8 <br>userDefined               | 4       | Integration order.                              |
| integrationOrderExpression | String                                  | 4       | User-defined integration order.                 |
| quadratureFrame            | mesh   geometry  <br>material   spatial | spatial | Frame in which the integration is<br>performed. |

#### *Constraint*

model.component(*<ctag>*).common().create(*<tag>*,"Constraint") creates a constraint feature that adds a scalar or vector constraint on a selection. The constraint can be added to the overall system of equations as a pointwise constraint, a weak constraint, or be enforced by a penalty term. For a Constraint feature, the following properties are available.

TABLE 2-30: PROPERTIES FOR CONSTRAINT.

| PROPERTY                   | VALUE                              | DEFAULT   | DESCRIPTION                                                                |
|----------------------------|------------------------------------|-----------|----------------------------------------------------------------------------|
| constraint                 | String                             | 0         | Constraint expression.                                                     |
| constraintForce            | String                             | 0         | Constraint force<br>expression.                                            |
| constraintMethod           | elemental   nodal                  | elemental | Pointwise constraint<br>method.                                            |
| constraintType             | pointwise   weak  <br>Nitsche      | pointwise | Constraint implementation.                                                 |
| excludedBoundaries         | Selection                          | empty     | Boundaries excluded from<br>a domain constraint.                           |
| excludedEdges              | Selection                          | empty     | Edges excluded from a<br>domain or boundary<br>constraint.                 |
| excludedPoints             | Selection                          | empty     | Points excluded from a<br>constraint.                                      |
| formulation                | symmetric   skew  <br>nonsymmetric | skew      | Nitsche method<br>formulation.                                             |
| integrationOrder           | 0 2 4 6 8 <br>userDefined          | 4         | Integration order for weak<br>and Nitsche<br>implementations.              |
| integrationOrderExpression | String                             | 4         | User-defined integration<br>order for weak and Nitsche<br>implementations. |

TABLE 2-30: PROPERTIES FOR CONSTRAINT.

| PROPERTY               | VALUE                                           | DEFAULT                                | DESCRIPTION                                                                      |
|------------------------|-------------------------------------------------|----------------------------------------|----------------------------------------------------------------------------------|
| interiorFlux           | String array                                    | {0,0,0}                                | Interior flux in equation<br>being constrained by the<br>Nitsche method.         |
| elementOrder           | 0 1 2 3 4 5 6 7 <br>userDefined                 | 2                                      | Element order for<br>pointwise and weak<br>constraints.                          |
| elementOrderExpression | String                                          | 2                                      | User-defined element<br>order for pointwise and<br>weak constraints.             |
| lmName                 | String                                          | lm_ <tag></tag>                        | Lagrange multiplier variable<br>name for weak constraint.                        |
| penaltyFactor          | String                                          | 24*dvol_spatial/<br>mean(dvol_spatial) | User-defined penalty factor<br>for the Nitsche method.                           |
| penaltyFactorControl   | auto  <br>userDefined                           | auto                                   | Nitsche method penalty<br>factor selection strategy.                             |
| quadratureFrame        | mesh   geometry  <br>material  <br>spatial      | spatial                                | Frame in which integration<br>of weak and Nitsche<br>contributions is performed. |
| reactionTerms          | symmetric  <br>userDefined                      | symmetric                              | Application of reaction<br>forces.                                               |
| referenceFrame         | mesh   geometry  <br>material  <br>spatial      | spatial                                | Frame in which the Nitsche<br>interior flux is interpreted.                      |
| shapeFunctionType      | <shape_function_<br>id&gt;</shape_function_<br> | shlag                                  | Shape function type ID.                                                          |
| vectorConstraint       | String array                                    | {0,0,0}                                | Vector constraint<br>expression.                                                 |
| vectorConstraintForce  | String array                                    | {0,0,0}                                | Vector constraint force<br>expression.                                           |

### *ControlVariableField*

model.component(*<ctag>*).common().create(*<tag>*,"ControlVariableField") creates a control variable field feature that adds a control variable to some geometric entity for use in a sensitivity analysis. For a control variable field definition, the following properties are available, in addition to the Selections.

TABLE 2-31: PROPERTIES FOR CONTROLVARIABLEFIELD.

| PROPERTY          | VALUE          | DEFAULT | DESCRIPTION                                                     |
|-------------------|----------------|---------|-----------------------------------------------------------------|
| initialValue      | String array   | {}      | Initial value expressions.                                      |
| lbound            | double         | 0       | Lower bound.                                                    |
| order             | 1 2 3 4        | 1       | Element order.                                                  |
| scale             | double         | 1       | Scaling of the control variable.                                |
| shapeFunctionType | shlag   shdisc | shlag   | The shape function type: Lagrange or<br>discontinuous Lagrange. |
| ubound            | double         | 0       | Upper bound.                                                    |
| useBounds         | true   false   | true    | Use bounds for the control variable.                            |

## *ParticipationFactors*

model.component(*<ctag>*).common().create(*<tag>*,"ParticipationFactors") creates a participation factors feature setting up variables for participation factor evaluation. For a ParticipationFactors definition, the following properties are available.

TABLE 2-32: PROPERTIES FOR PARTICIPATIONFACTORS.

| PROPERTY | VALUE        | DEFAULT         | DESCRIPTION                                                       |
|----------|--------------|-----------------|-------------------------------------------------------------------|
| cor      | com   user   | com             | Center of rotation definition: Center of<br>mass or user defined. |
| point    | String array | {"0", "0", "0"} | The point for the center of rotation, if<br>cor is set to user.   |

## *ResponseSpectrum*

model.component(*<ctag>*).common().create(*<tag>*,"ResponseSpectrum") creates a response spectrum feature preparing a structural model for response spectrum evaluation. For a Response Spectrum feature, the following properties are available.

TABLE 2-33: PROPERTIES FOR RESPONSESPECTRUM.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION                                                                   |
|----------|--------|---------|-------------------------------------------------------------------------------|
| eigStudy | String | none    | Tag of a Study containing at least one<br>Eigenfrequency study step, or none. |

## *BucklingImperfection*

model.component(*<ctag>*).common().create(*<tag>*,"BucklingImperfection") creates a buckling imperfection feature preparing a structural model for performing a buckling analysis with an initial imperfection based on a preceding linear buckling analysis. For a Buckling Imperfection feature, the following properties are available:

TABLE 2-34: PROPERTIES FOR BUCKLINGIMPERFECTION.

| PROPERTY               | VALUE  | DEFAULT                   | DESCRIPTION                                                                            |
|------------------------|--------|---------------------------|----------------------------------------------------------------------------------------|
| LoadParameter          | String | Any existing<br>parameter | The load parameter for the nonlinear buckling study.                                   |
| NonlinearBucklingStudy | String | new                       | Tag of the study to use as the linear buckling study, or<br>new to create a new study. |
| Study                  | String | none                      | Tag of the study to use as the linear buckling study, or<br>none.                      |

This feature requires a license for the Structural Mechanics Module.

### *AmbientProperties*

model.component(*<ctag>*).common().create(*<tag>*,"AmbientProperties") creates an ambient properties feature. Ambient properties can be set manually, or imported from meteorological data. For an Ambient Properties feature, Table 2-35 lists the properties that are available for the default setting of the AmbientData property.

TABLE 2-35: PROPERTIES FOR AMBIENTPROPERTIES.

| PROPERTY    | VALUE                                                       | DEFAULT   | DESCRIPTION                |
|-------------|-------------------------------------------------------------|-----------|----------------------------|
| AmbientData | UserDef  <br>MeteorologicalData  <br>MeteorologicalData2017 | UserDef   | Source of ambient data.    |
| T_amb       | double                                                      | 293.15[K] | Ambient temperature.       |
| p_amb       | double                                                      | 1[atm]    | Ambient absolute pressure. |
| phi_amb     | double                                                      | 0         | Ambient relative humidity. |
| v_amb       | double                                                      | 0[m/s]    | Wind velocity.             |

TABLE 2-35: PROPERTIES FOR AMBIENTPROPERTIES.

| PROPERTY | VALUE  | DEFAULT     | DESCRIPTION                                      |
|----------|--------|-------------|--------------------------------------------------|
| Isn_amb  | double | 1000[W/m^2] | Clear sky noon beam normal<br>irradiance.        |
| Ish_amb  | double | 0[W/m^2]    | Clear sky noon diffuse<br>horizontal irradiance. |

#### *GlobalReducedModelInputs*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalReducedModelInputs") creates a reduced model inputs feature defining control variables for use as inputs when training a reduced model. For a Global Reduced Model Inputs definition, the following properties are available.

TABLE 2-36: PROPERTIES FOR GLOBALREDUCEDMODELINPUTS.

| PROPERTY   | VALUE        | DEFAULT | DESCRIPTION                                                                       |
|------------|--------------|---------|-----------------------------------------------------------------------------------|
| name       | String array | {}      | Names of global scalar variables to be<br>made available as reduced model inputs. |
| expression | String array | {}      | Online value expressions, one for each<br>variable in name.                       |

# *CommonInputDefault*

The Common Model Inputs feature is a default singleton feature (with tag cminpt) that cannot be removed. It controls the default values of model input quantities required as input values to materials and physics features. For the Common Model Inputs definition, the following properties are available.

TABLE 2-37: PROPERTIES FOR COMMONINPUTDEFAULT.

| PROPERTY | VALUE         | DEFAULT | DESCRIPTION                                       |
|----------|---------------|---------|---------------------------------------------------|
| modified | String matrix | {{}}    | Pairs of quantity name and defining<br>expression |

## *CommonInputDef*

model.component(*<ctag>*).common().create(*<tag>*,"CommonInputDef") creates a common model input definition feature overriding the value of a model input quantity on a selection. For a Model Input definition, the following properties are available.

TABLE 2-38: PROPERTIES FOR COMMONINPUTDEF.

| PROPERTY    | VALUE        | DEFAULT       | DESCRIPTION                            |
|-------------|--------------|---------------|----------------------------------------|
| minpDefName | String       | dimensionless | Name of quantity to be defined.        |
| minpScalar  | String       | Empty         | Scalar definition of current quantity. |
| minpVector  | String array | {"1","2","3"} | Vector definition of current quantity. |

Note that changing the minpDefName property resets the corresponding value property to a default value specific to the particular quantity.

#### *PrescribedDeformation*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedDeformation") or model.component(*<ctag>*).common().create(*<tag>*,"PrescribedDeformationDeformedGeometry") creates a prescribed deformation feature acting on the spatial or material frame mesh, respectively. For a PrescribedDeformation definition, the following property is available.

TABLE 2-39: PROPERTY FOR PRESCRIBEDDEFORMATION.

| PROPERTY              | VALUE        | DEFAULT         | DESCRIPTION                        |
|-----------------------|--------------|-----------------|------------------------------------|
| prescribedDeformation | String array | {"0", "0", "0"} | The prescribed deformation vector. |

## *PrescribedMeshVelocity*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedMeshVelocity") or model.component(*<ctag>*).common().create(*<tag>*,"PrescribedMeshVelocityDeformedGeometry") creates a prescribed mesh velocity feature acting on the spatial or material frame mesh, respectively. For a PrescribedMeshVelocity definition, the following property is available.

TABLE 2-40: PROPERTY FOR PRESCRIBEDDEFORMATION.

| PROPERTY               | VALUE        | DEFAULT         | DESCRIPTION                          |
|------------------------|--------------|-----------------|--------------------------------------|
| prescribedMeshVelocity | String array | {"0", "0", "0"} | The prescribed mesh velocity vector. |

#### *RotatingDomain*

model.component(*<ctag>*).common().create(*<tag>*,"RotatingDomain") or model.component(*<ctag>*).common().create(*<tag>*,"RotatingDomainDeformedGeometry") creates a rotating domain feature acting on the spatial or material frame mesh, respectively. For a RotatingDomain definition, the following properties are available.

TABLE 2-41: PROPERTY FOR ROTATINGDOMAIN.

| PROPERTY               | VALUE        | DEFAULT                                     | DESCRIPTION                                                                             |
|------------------------|--------------|---------------------------------------------|-----------------------------------------------------------------------------------------|
| angularVelocity        | String       | 0                                           | The angular velocity<br>when rotationType is<br>set to<br>rotationalVelocity.           |
| appliedMoment          | String       | 0                                           | The applied moment<br>when rotationType is<br>set to rigidBody.                         |
| initialAngle           | String       | 0                                           | The initial angle when<br>rotationType is set to<br>rotationalVelocity<br>or rigidBody. |
| initialAngularVelocity | String       | 0                                           | The initial angular<br>velocity when<br>rotationType is set to<br>rigidBody.            |
| momentOfInertia        | String       | 0                                           | The moment of inertia<br>when rotationType is<br>set to rigidBody.                      |
| revolutionsPerTime     | String       | 0                                           | The revolutions per time<br>when rotationType is<br>set to<br>rotationalVelocity.       |
| rotationAngle          | String       | 0                                           | The rotational angle<br>when rotationType is<br>set to userDefined.                     |
| rotationAxis           | String array | {"0", "0", "0"}                             | The rotation axis (3D<br>only).                                                         |
| rotationAxisBasePoint  | String array | {"0", "0", "0"}<br>(3D); {"0", "0"}<br>(2D) | The rotation axis base<br>point.                                                        |

TABLE 2-41: PROPERTY FOR ROTATINGDOMAIN.

| PROPERTY                         | VALUE                                                                                                              | DEFAULT                     | DESCRIPTION                                                                                        |
|----------------------------------|--------------------------------------------------------------------------------------------------------------------|-----------------------------|----------------------------------------------------------------------------------------------------|
| rotationType                     | userDefined  <br>rotationalVelocity  <br>rigidBody                                                                 |                             |                                                                                                    |
| rotationalVelocity<br>Expression | generalAngularVelocity  <br>constantAngularVelocity  <br>constantRevolutionsPerTime<br>  generalRevolutionsPerTime | constantAngular<br>Velocity | The rotational velocity<br>expression to use when<br>rotationType is set to<br>rotationalVelocity. |

# *DeformingDomain*

model.component(*<ctag>*).common().create(*<tag>*,"DeformingDomain") or

model.component(*<ctag>*).common().create(*<tag>*,"DeformingDomainDeformedGeometry") creates a deforming domain feature acting on the spatial or material frame mesh, respectively. For a DeformingDomain definition, the following properties are available.

TABLE 2-42: PROPERTY FOR DEFORMINGDOMAIN.

| PROPERTY           | VALUE                                      | DEFAULT         | DESCRIPTION                                                          |
|--------------------|--------------------------------------------|-----------------|----------------------------------------------------------------------|
| initialDeformation | String array                               | {"0", "0", "0"} | The initial deformation of the<br>domain.                            |
| smoothingType      | laplace   winslow  <br>hyperelastic   yeoh | laplace         | The mesh smoothing type: Laplace,<br>Winslow, hyperelastic, or Yeoh. |

## *FixedBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"FixedBoundary") or

model.component(*<ctag>*).common().create(*<tag>*,"FixedBoundaryDeformedGeometry") creates a fixed boundary feature acting on the spatial or material frame mesh, respectively. This feature has a boundary selection only.

#### *PrescribedMeshDisplacement*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedMeshDisplacement") or model.component(*<ctag>*).common()

.create(*<tag>*,"PrescribedMeshDisplacementDeformedGeometry") creates a prescribed mesh displacement feature acting on the spatial or material frame mesh, respectively. For a PrescribedMeshDisplacement definition, the following property is available.

TABLE 2-43: PROPERTY FOR PRESCRIBEDMESHDISPLACEMENT.

| PROPERTY                   | VALUE        | DEFAULT         | DESCRIPTION                       |
|----------------------------|--------------|-----------------|-----------------------------------|
| prescribedMeshDisplacement | String array | {"0", "0", "0"} | The prescribed mesh displacement. |

# *PrescribedNormalMeshDisplacement*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedNormalMeshDisplacement") or model.component(*<ctag>*).common()

.create(*<tag>*,"PrescribedNormalMeshDisplacementDeformedGeometry") creates a prescribed normal mesh displacement feature acting on the spatial or material frame mesh, respectively. For a PrescribedNormalMeshDisplacement definition, the following property is available.

TABLE 2-44: PROPERTY FOR PRESCRIBEDNORMALMESHDISPLACEMENT.

| PROPERTY                     | VALUE  | DEFAULT | DESCRIPTION                              |
|------------------------------|--------|---------|------------------------------------------|
| prescribedNormalDisplacement | String | 0       | The prescribed normal mesh displacement. |

# *PrescribedNormalMeshVelocity*

model.component(*<ctag>*).common().create(*<tag>*,"PrescribedNormalMeshVelocity") or model.component(*<ctag>*).common()

.create(*<tag>*,"PrescribedNormalMeshVelocityDeformedGeometry") creates a prescribed normal mesh velocity feature acting on the spatial or material frame mesh, respectively. For a PrescribedNormalMeshVelocity definition, the following property is available.

TABLE 2-45: PROPERTY FOR PRESCRIBEDNORMALMESHVELOCITY.

| PROPERTY                 | VALUE  | DEFAULT | DESCRIPTION                          |
|--------------------------|--------|---------|--------------------------------------|
| prescribedNormalVelocity | String | 0       | The prescribed normal mesh velocity. |

## *RotatingBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"RotatingBoundary") or model.component(*<ctag>*).common().create(*<tag>*,"RotatingBoundaryDeformedGeometry") creates a rotating boundary feature acting on the spatial or material frame mesh, respectively. For a RotatingBoundary definition, the following properties are available.

TABLE 2-46: PROPERTY FOR ROTATINGBOUNDARY.

| PROPERTY                         | VALUE                                                                                                              | DEFAULT                                     | DESCRIPTION                                                                                        |
|----------------------------------|--------------------------------------------------------------------------------------------------------------------|---------------------------------------------|----------------------------------------------------------------------------------------------------|
| angularVelocity                  | String                                                                                                             | 0                                           | The angular velocity<br>when rotationType is<br>set to<br>rotationalVelocity.                      |
| appliedMoment                    | String                                                                                                             | 0                                           | The applied moment<br>when rotationType is<br>set to rigidBody.                                    |
| initialAngle                     | String                                                                                                             | 0                                           | The initial angle when<br>rotationType is set to<br>rotationalVelocity<br>or rigidBody.            |
| initialAngularVelocity           | String                                                                                                             | 0                                           | The initial angular<br>velocity when<br>rotationType is set to<br>rigidBody.                       |
| momentOfInertia                  | String                                                                                                             | 0                                           | The moment of inertia<br>when rotationType is<br>set to rigidBody.                                 |
| revolutionsPerTime               | String                                                                                                             | 0                                           | The revolutions per time<br>when rotationType is<br>set to<br>rotationalVelocity.                  |
| rotationAngle                    | String                                                                                                             | 0                                           | The rotational angle<br>when rotationType is<br>set to userDefined.                                |
| rotationAxis                     | String array                                                                                                       | {"0", "0", "0"}                             | The rotation axis (3D<br>only).                                                                    |
| rotationAxisBasePoint            | String array                                                                                                       | {"0", "0", "0"}<br>(3D); {"0", "0"}<br>(2D) | The rotation axis base<br>point.                                                                   |
| rotationType                     | userDefined  <br>rotationalVelocity  <br>rigidBody                                                                 |                                             |                                                                                                    |
| rotationalVelocity<br>Expression | generalAngularVelocity  <br>constantAngularVelocity  <br>constantRevolutionsPerTime<br>  generalRevolutionsPerTime | constantAngular<br>Velocity                 | The rotational velocity<br>expression to use when<br>rotationType is set to<br>rotationalVelocity. |

#### *Slip*

model.component(*<ctag>*).common().create(*<tag>*,"Slip") or

model.component(*<ctag>*).common().create(*<tag>*,"SlipDeformedGeometry") creates a mesh slip feature acting on the spatial or material frame mesh, respectively. This feature has a boundary selection only.

#### *Symmetry*

model.component(*<ctag>*).common().create(*<tag>*,"Symmetry") or

model.component(*<ctag>*).common().create(*<tag>*,"SymmetryDeformedGeometry") creates a symmetry feature acting on the spatial or material frame mesh, respectively. This feature has a boundary selection only.

> The ControlFunction, DensityTopology, FixedTopologyDomain, FixedTopologyBoundary, FreeShapeDomain, FreeShapeBoundary, FreeShapeShell, FreeShapeSymmetry, FixedShapeBoundary, FixedShapeEdge, FixedShapePoint,

![](_page_50_Picture_7.jpeg)

GlobalLeastSquaresObjective, LeastSquaresObjective, MaterialTopologyDomain, MaterialTopologyBoundary, PolynomialBoundary, PolynomialShell,

VoidTopologyDomain, and VoidTopologyBoundary features below require the Optimization Module.

# *Control Function*

model.component(*<ctag>*).common().create(*<tag>*,"ControlFunction") creates a control function feature for general optimization.

#### *DensityTopology*

model.component(*<ctag>*).common().create(*<tag>*,"DensityTopology") creates a density model feature for topology optimization.

#### *FixedTopologyDomain*

model.component(*<ctag>*).common().create(*<tag>*,"FixedTopologyDomain") creates a fixed topology domain feature for topology optimization.

# *FixedTopologyBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"FixedTopologyBoundary") creates a fixed topology boundary feature for topology optimization.

# *FreeShapeDomain*

model.component(*<ctag>*).common().create(*<tag>*,"FreeShapeDomain") creates a free shape domain feature for shape optimization.

# *Transformation*

model.component(*<ctag>*).common().create(*<tag>*,"Transformation") creates a transformation feature for shape optimization.

## *FreeShapeBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"FreeShapeBoundary") creates a fixed shape boundary feature for shape optimization.

## *FreeShapeShell*

model.component(*<ctag>*).common().create(*<tag>*,"FreeShapeShell") creates a free shape shell feature for shape optimization.

## *PolynomialShell*

model.component(*<ctag>*).common().create(*<tag>*,"PolynomialShell") creates a polynomial shell feature for shape optimization.

## *FreeShapeSymmetry*

model.component(*<ctag>*).common().create(*<tag>*,"FreeShapeSymmetry") creates a free shape symmetry feature for shape optimization.

## *FixedShapePoint*

model.component(*<ctag>*).common().create(*<tag>*,"FixedShapePoint") creates a fixed shape point feature for shape optimization in 2D only.

## *FixedShapeEdge*

model.component(*<ctag>*).common().create(*<tag>*,"FixedShapeEdge") creates a fixed shape edge feature for shape optimization in 3D only.

## *FixedShapeBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"FixedShapeBoundary") creates a fixed shape boundary feature for shape optimization.

# *MirrorShape*

model.component(*<ctag>*).common().create(*<tag>*,"MirrorShape") creates a mirror shape feature for shape optimization.

#### *SectorShape*

model.component(*<ctag>*).common().create(*<tag>*,"SectorShape") creates a sector shape boundary feature for shape optimization.

## *GlobalLeastSquaresObjective*

model.component(*<ctag>*).common().create(*<tag>*,"GlobalLeastSquaresObjective") creates a global least-squares objective.

# *LeastSquaresObjective*

model.component(*<ctag>*).common().create(*<tag>*,"LeastSquaresObjective") creates a least-squares objective.

# *MaterialTopologyDomain*

model.component(*<ctag>*).common().create(*<tag>*,"MaterialTopologyDomain") creates a material topology domain feature for topology optimization.

## *MaterialTopologyBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"MaterialTopologyBoundary") creates a material topology boundary feature for topology optimization.

## *PolynomialBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"PolynomialBoundary") creates a polynomial boundary feature for shape optimization in 2D only.

## *Transformation*

model.component(*<ctag>*).common().create(*<tag>*,"Transformation") creates a linear shape domain feature for shape optimization.

#### *VoidTopologyDomain*

model.component(*<ctag>*).common().create(*<tag>*,"VoidTopologyDomain") creates a void topology domain feature for topology optimization.

#### *VoidTopologyBoundary*

model.component(*<ctag>*).common().create(*<tag>*,"VoidTopologyBoundary") creates a void topology boundary feature for topology optimization.

## *MirrorTopology*

model.component(*<ctag>*).common().create(*<tag>*,"MirrorTopology") creates a mirror symmetry feature for topology optimization.

## *SectorTopology*

model.component(*<ctag>*).common().create(*<tag>*,"SectorTopology") creates a sector symmetry feature for topology optimization.

The following properties are available for the common optimization features.

TABLE 2-47: PROPERTIES FOR COMMON OPTIMIZATION FEATURES.

| PROPERTY            | VALUE                                              | DEFAULT                        | DESCRIPTION                                                                                                                                            |
|---------------------|----------------------------------------------------|--------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| beta                | double                                             | 8                              | The projection slope when<br>projectionType is set to<br>TanhProjection.                                                                               |
| d0                  | String array                                       | {0,0,0}                        | Initial control displacement.                                                                                                                          |
| discretization      | linear   constant                                  |                                | The discretization: linear or constant.                                                                                                                |
| filterType          | Helmholtz  <br>No_filter                           | Helmholtz                      | The filter type for filtering of the<br>density: Helmholtz filtering or no<br>filtering.                                                               |
| filterLengthType    | Mesh   Custom                                      | Mesh                           | L_min is taken as h when<br>filterLengthType is set to Mesh.                                                                                           |
| filterRadiusType    | Small   Medium  <br>Large   Custom                 | Large                          | L_min is taken as 1, 1.5, and 2 times<br>the maximumDisplacement, when<br>the filterRadiusType is set to<br>Small, Medium, and Large,<br>respectively. |
| fixedDensityType    | Custom   Material<br>  Void                        | Material                       | theta_fix is taken as 0 when<br>fixedDensityType is set to Void,<br>and it is taken as 0 when<br>fixedDensityType is set to<br>Material.               |
| interpolationType   | SIMP   Darcy  <br>Linear_interp  <br>RAMP   Custom | SIMP                           | The interpolation type: SIMP, Darcy,<br>linear, RAMP, or user defined.                                                                                 |
| L_min               | String                                             | h                              | Filter radius when filterType is<br>set to Helmholtz.                                                                                                  |
| maximumDisplacement | double                                             | 5% of geometry<br>bounding box | Maximum displacement (in each<br>coordinate direction).                                                                                                |
| normal              | double array                                       | {0,0,1}                        | Prescribed normal vector.                                                                                                                              |
| order               | positive integer                                   | 2                              | Polynomial order.                                                                                                                                      |
| p_SIMP              | double                                             | 3                              | SIMP exponent, when<br>interpolationType is set to SIMP.                                                                                               |
| projectionType      | No_projection  <br>TanhProjection                  | No_projection                  | The projection type: No projection<br>or hyperbolic tangent projection.                                                                                |
| q_Darcy             | double                                             | 0.01                           | Darcy interpolation, when<br>interpolationType is set to<br>Darcy.                                                                                     |
| q_RAMP              | double                                             | 3                              | RAMP parameter, when<br>interpolationType is set to RAMP.                                                                                              |
| simpExponentType    | Auto   Custom                                      | Auto                           | p_SIMP is taken as 3, when<br>setsimpExponentType is set to<br>Auto.                                                                                   |

TABLE 2-47: PROPERTIES FOR COMMON OPTIMIZATION FEATURES.

| PROPERTY     | VALUE                   | DEFAULT        | DESCRIPTION                                                                     |
|--------------|-------------------------|----------------|---------------------------------------------------------------------------------|
| theta0       | double                  | 0.5            | Initial value for the discretization.                                           |
| thetaMinType | Auto   Custom           | Auto           | theta_min is taken as 0.001 when<br>thetaMinType is set to Auto.                |
| theta_beta   | double                  | 0.5            | The projection point when<br>projectionType is set to<br>TanhProjection.        |
| theta_fix    | double                  | 1              | Material volume factor constraint.                                              |
| theta_min    | double                  | 0.001          | Minimum penalized volume fraction,<br>when interpolationType is set to<br>SIMP. |
| theta_u      | String                  | 1-dtopo#.theta | User-defined interpolation                                                      |
| type         | bernstein  <br>lagrange | bernstein      | Polynomial type.                                                                |

*SurrogateModelGeometrySampling*

model.component(*<ctag>*).common().create(*<tag>*,"SurrogateModelGeometrySampling") creates a geometry sampling feature for surrogate model training.

The following properties are available for a SurrogateModelGeometrySampling definition:

TABLE 2-48: PROPERTIES FOR THE SURROGATEMODELGEOMETRYSAMPLING FEATURE.

| VALUE          | VALUE                                      | DEFAULT                         | DESCRIPTION                                                                                                                                                                                            |
|----------------|--------------------------------------------|---------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| samplemethod   | selection  <br>grid   mesh                 | selection                       | Use selection to sample on all mesh vertices in the<br>selection of the computational mesh, use grid to<br>uniformly sample on a grid and use mesh to<br>interpolate the solution on a different mesh. |
| frame          | mesh   geometry<br>  material  <br>spatial | material                        | The coordinate frame to sample in.                                                                                                                                                                     |
| dim1min        | double                                     | 0                               | The lower bound of the grid in the first dimension<br>when samplemethod is set to grid.                                                                                                                |
| dim1max        | double                                     | 1                               | The upper bound of the grid in the first dimension<br>when samplemethod is set to grid.                                                                                                                |
| dim1resolution | positive integer                           | 1000 (1D), 100<br>(2D), 30 (3D) | The number of points the grid is uniformly<br>discretized with in the first dimension when<br>samplemethod is set to grid.                                                                             |
| dim2min        | double                                     | 0                               | The lower bound of the grid in the second<br>dimension when samplemethod is set to grid.                                                                                                               |
| dim2max        | double                                     | 1                               | The upper bound of the grid in the second<br>dimension when samplemethod is set to grid.                                                                                                               |
| dim2resolution | positive integer                           | 1000 (1D), 100<br>(2D), 30 (3D) | The number of points the grid is uniformly<br>discretized with in the second dimension when<br>samplemethod is set to grid.                                                                            |
| dim3min        | double                                     | 0                               | The lower bound of the grid in the third<br>dimension when samplemethod is set to grid.                                                                                                                |
| dim3max        | double                                     | 1                               | The upper bound of the grid in the third<br>dimension when samplemethod is set to grid.                                                                                                                |
| dim3resolution | positive integer                           | 1000 (1D), 100<br>(2D), 30 (3D) | The number of points the grid is uniformly<br>discretized with in the third dimension when<br>samplemethod is set to grid.                                                                             |

TABLE 2-48: PROPERTIES FOR THE SURROGATEMODELGEOMETRYSAMPLING FEATURE.

| VALUE             | VALUE             | DEFAULT | DESCRIPTION                                                     |
|-------------------|-------------------|---------|-----------------------------------------------------------------|
| geometryselection | selection         | all()   | The selection to use when samplemethod is set<br>to selection.  |
| mesh              | reference to mesh |         | The mesh to interpolate on when samplemethod<br>is set to mesh. |

# *model.component()*

Model component nodes.

A component node has one of three types:

- **•** Component: Component nodes in the model builder tree have this type.
- **•** ExtraDim: Extra dimension nodes under global definitions have this type.
- **•** MeshComponent: Mesh parts nodes under global definitions have this type.

All three types are included, if present, in the list returned by model.component().

![](_page_54_Picture_9.jpeg)

The model.component syntax replaces the earlier model.modelNode syntax, which is still available for backward compatibility.

The list object returned by model.component() still has type ModelNodeList and individual components returned from model.component(*<tag>*) are of type ModelNode.

![](_page_54_Picture_12.jpeg)

Component nodes control which frames are created as individual Frame objects in the model.frame() list once a geometry is added to the component. If the defineAllFrames flag is set, all four logical frames (spatial, material, geometry, and mesh frame) are created. Otherwise a single frame object is created, representing all four logical frames.

When a model is created in the GUI, defineAllFrames is always set to true. This is required by some Moving Mesh and Deformed Geometry functionality, which otherwise becomes inaccessible. Working with a single frame object is still allowed from the API, for compatibility reasons.

#### **SYNTAX**

```
model.component().create(<tag>);
model.component().create(<tag>, <basetag>);
model.component().create(<tag>, <type>);
model.component().create(<tag>, boolean);
model.component(<tag>).defineAllFrames();
model.component(<tag>).defineAllFrames(boolean);
model.component(<tag>).getType();
model.component(<tag>).scope();
model.component(<tag>).baseSystem();
model.component(<tag>).baseSystem(<system>);
model.component(<tag>).sorder();
model.component(<tag>).sorder(<stype>);
model.component(<tag>).defineLocalCoord();
model.component(<tag>).defineLocalCoord(boolean);
model.component(<tag>).curvedInterior()
model.component(<tag>).curvedInterior(boolean)
model.component(<tag>).geometricModel();
model.component(<tag>).geometricModel(<sequencetag>);
model.component(<tag>).measure().measurementMethod;
```

#### **DESCRIPTION**

model.component(*<tag>*) represents a component node in the model tree.

model.component().create(*<tag>*) creates a component node of type Component with the given tag and defineAllFrames set to false.

model.component().create(*<tag>*,*<type>*) creates a component node with the tag *<tag>* of one of the following types, set as the string *<type>*: Component, for a normal geometry component; ExtraDim, for an extra dimension; or MeshComponent, for a mesh component. For example, to create a mesh component:

```
model.component().create("mcomp1", "MeshComponent");
model.component("mcomp1").geom().create("mgeom1", 3);
model.component("mcomp1").mesh().create("mpart1", "mgeom1");
```

The defineAllFrames flag is set to false.

model.component().create(*<tag>*, boolean) creates a model component node of type Component with the specified value of the defineAllFrames flag.

model.component(*<tag>*).defineAllFrames() returns the current value of the defineAllFrames flag.

model.component(*<tag>*).defineAllFrames(boolean) sets the defineAllFrames flag controlling whether all four logical frames (spatial, material, geometry, and mesh frame) should be created as separate Frame objects in model.frame() when a geometry is added to the component.

model.component(*<tag>*).getType() returns the type of component that the component with the tag *<tag>* is an instance of: Component, for a normal model component; ExtraDim for an extra dimension component; and MeshComponent for a mesh component.

model.component(*<tag>*).scope() returns the fully qualified scope name.

model.component(*<tag>*).baseSystem(*<system>*) use the given base system as unit system for the component node. This overrides the global unit system specified for the entire model object. To use global system again, set the base system of the component node to null.

model.component(*<tag>*).sorder() returns the geometry shape function used for the component node and its descendants.

model.component(*<tag>*).sorder(*<stype>*) sets the geometry shape function. Allowed values are automatic (the default), linear, quadratic, cubic, quartic, quintic, sextic, septic, linear\_serp, quadratic\_serp, cubic\_serp, and quartic\_serp (the latter four values represent serendipity elements). With an automatic shape function, the physics interfaces under the component node decide the most optimum shape function. The shape function set here is also used for the discretization of the mesh displacement when using ALE functionality.

model.component(*<tag>*).defineLocalCoord() returns true if element local coordinate variables exist. By default, this is the case.

model.component(*<tag>*)).defineLocalCoord(boolean) sets a flag that determines whether element local coordinate variables exist.

model.component(*<tag>*).curvedInterior() returns true if curved interior mesh is activated in the component.

model.component(*<tag>*).curvedInterior(boolean) sets the curved interior mesh setting in the component. If true, the interior domain mesh elements can be curved to avoid inverted elements.

model.component(*<tag>*).geometricModel() returns the component's geometric model on which the physics is defined. The returned tag is prefixed with geom/ or mesh/ to indicate if it is a geometry or mesh.

model.component(*<tag>*).geometricModel(*<sequencetag>*) specifies the geometric model used in the component. Enter the tag for the geometry or meshing sequence *<sequencetag>* to be specified as the component's geometric model. Use the prefix /geom or /mesh if the tag only is ambiguous. Only meshing sequences that define their own geometric models can be specified as the component's geometric model. For more information, see Geometric Model.

model.component(<tag>).measure().*measurementMethod* returns the volume, area, length, vertex coordinates, average coordinates, or distance between two vertices according to the entity selection. For a list of the available measurement methods to use, see Measurement Methods. The measurements are done on the finalized geometry or mesh that defines the component's geometric model. See Geometric Model for more information. For information about how to select entities, see Selections.

# **EXAMPLE**

Create a component node and assign it to a geometry and an analytic function.

```
Code for Use with Java
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1", 3);
  model.component("comp1").func().create("an1", "Analytic");
Code for Use with MATLAB
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 3);
  model.component('comp1').func.create('an1', 'Analytic');
model.constr()
```

Creating and modifying constraints in a model.

#### **SYNTAX**

```
model.constr().create(<tag>,<shtags>);
model.constr().create(<tag>,<nglobal>);
model.constr(<tag>).shape(<shtags>);
model.constr(<tag>).shape(<pos>,<shtags>);
model.constr(<tag>).global(<nglobal>);
model.constr(<tag>).create(<ftag>);
model.constr(<tag>).feature(<ftag>).set(ctype,<value>);
model.constr(<tag>).shape();
model.constr(<tag>).global();
model.constr(<tag>).feature(<ftag>).getType(ctype);
model.constr(<tag>).feature(<ftag>).set(String pname, int value);
model.constr(<tag>).feature(<ftag>).set(String pname, int pos, int value);
model.constr(<tag>).feature(<ftag>).set(String pname, int pos, int[] value);
model.constr(<tag>).feature(<ftag>).set(String pname, int pos1, int pos2, int value);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String value, int firstIndex,
                    int secondIndex);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String[] value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, double value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, double value, int firstIndex,
                    int secondIndex);
model.constr(<tag>).feature(<ftag>).setIndex(String name, double[] value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, int value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, int value, int firstIndex,
                    int secondIndex);
model.constr(<tag>).feature(<ftag>).setIndex(String name, int[] value, int index);
```

The set() methods index/position arguments are 1-based. The setIndex() methods index/position arguments are 0-based. See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

#### **DESCRIPTION**

model.constr(*<tag>*) returns the constraint with tag *<tag>*.

model.constr().create(*<tag>*,*<shtags>*) creates a constraint with tag *<tag>* using the shape functions *<shtags>*.

model.constr().create(*<tag>*,*<nglobal>*) creates a global constraint with tag *<tag>* expecting *<nglobal>* components.

model.constr(*<tag>*).shape(*<shtags>*) points to the shape functions associated with the constraint. Reassigning the shape functions can have the side effect of modifying the constraints since the number of constraints can change as the size of each constraint vector can change.

model.constr(*<tag>*).global(*<nglobal>*) specifies that the constraint is global and sets the expected number of components.

```
model.constr(<tag>).feature(<ftag>) is a feature in the constraint with tag <tag>.
```

model.constr(*<tag>*).create(*<ftag>*) creates a constraint feature.

model.constr(*<tag>*).feature(*<ftag>*).set(*ctype*,*<value>*) sets the parameter *ctype* to *<value>*, where *ctype* is either constr or constrf, and *<value>* is a single constraint expression or a list of constraint expressions. The number of elements in the constraint expression depends on the number of global constraint components or shape functions specified, and on the shape function type. A Lagrange shape function or global constraint

component requires a single item, whereas a vector shape function requires one item for each space dimension. The supported set methods are the ones for double string arrays defined in Table 2-4.

model.constr(*<tag>*).feature(*<ftag>*).selection().named(*<seltag>*) assigns the constraint to the named selection *<seltag>*.

model.constr(*<tag>*).feature(*<ftag>*).selection().set(...) defines a local selection that assigns the constraint to geometric entities. For a complete list of methods available under selection(), see model.selection(). Only selections at a single geometry level is allowed in the selection.

model.constr(*<tag>*).shape() returns the shape function tags as a string array.

model.constr(*<tag>*).global() returns the number of components if the constraint is global, otherwise −1.

```
model.constr(<tag>).feature(<ftag>)).
```

getAllowedPropertyValues(property) returns the set of allowed values for a property if the set is a finite set of strings; otherwise, it returns null.

model.constr(*<tag>*).feature(*<ftag>*).get*Type*(*ctype*) returns the constraint or constraint force value. For available methods, see get\* and Selection Access Methods.

model.constr(*<tag>*).feature(*<ftag>*).selection().named() returns the named selection tag, and model.constr(*<tag>*).feature(*<ftag>*).selection().get*Type*() returns domain information. For available methods, see Selections.

model.constr(*<tag>*).feature(*<ftag>*).selection(*<estype>*).set(...) defines a subselection of a given lower-dimensional excluded selection type that should be excluded from the constraint selection. Excluded selection type can be exclude0 for points, exclude1 for edges, and exclude2 for excluded face subselections. The constraint is not enforced on the specified excluded subselections. Excluded subselections have to have lower dimension than the constraint selection. For a complete list of methods available under selection(*<estype>*), see model.selection().

## **EXAMPLES**

*Code for Use with Java*

Set several constraint by using multiple constraints:

```
ConstrFeature f = model.constr("c1").create("f1");
  f.set("constr",new String[]{"u-1","v"});
  f.selection().geom("geom1",1);
  f.selection().all();
Vector elements need a set of constraints:
  model.constr().create("c2",new String[]{"shE"});
  ConstrFeature f = model.constr("c2").create("f1");
  f.set("constr",new String[]{"Ex-1","Ey-0","Ez-0"});
  f.selection().geom("geom1",1);
  f.selection().all();
Code for Use with MATLAB
  model.constr.create('c1',{'shu','shv'});
  f = model.constr('c1').create('f1');
  f.set('constr',{'u-1','v'});
  f.selection.geom('geom1',1);
  f.selection.all;
Vector elements need a set of constraints:
  model.constr.create('c2',{'shE'});
  f = model.constr('c2').create('f1');
```

model.constr().create("c1",new String[]{"shu","shv"});

```
f.set('constr',{'Ex-1','Ey-0','Ez-0'});
  f.selection.geom('geom1',1);
  f.selection.all;
SEE ALSO
model.shape()
model.coordSystem()
```

Add coordinate systems, perfectly matched layers, infinite elements, and absorbing layers. Perfectly matched layers, infinite elements, and absorbing layers are all available with a set of add-on products only.

![](_page_59_Picture_2.jpeg)

The syntax that includes the component level, such as model.component(*<ctag>*).coordSys()... is the default and is used throughout this chapter. To use the earlier model.coordSys()... syntax, clear the **Generate code using component syntax** checkbox on the **Application Builder>Methods** page in the **Preferences** window.

#### **SYNTAX**

```
model.component(<ctag>).coordSystem().create(<tag>,<gtag>,type);
model.component(<ctag>).coordSystem(<tag>).set(property, <value>);
model.component(<ctag>).component(<ctag>).coordSystem(<tag>).
      setIndex(property,<value>,row);
model.component(<ctag>).coordSystem(<tag>).setIndex(property, <value>,row,col);
model.component(<ctag>).coordSystem(<tag>).selection();
model.component(<ctag>).coordSystem(<tag>).coord()
model.component(<ctag>).coordSystem(<tag>).isOrthonormal()
model.component(<ctag>).coordSystem(<tag>).isLinear()
model.component(<ctag>).coordSystem(<tag>).image()
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

## **DESCRIPTION**

model.component(*<ctag>*).coordSystem().create(*<tag>*,*<gtag>*,*type*) creates a coordinate system with tag *<tag>* on geometry *<gtag>* of type *type*. There are the following types of coordinate systems: mapped system (Mapping), base-vector system (VectorBase), rotated system (Rotated), boundary system (Boundary), scaling system (Scaling), cylindrical system (Cylindrical), and system from geometry (SystemFromGeometry). The boundary system only applies to boundaries. In addition, the perfectly matched layers (PMLs), infinite elements, and absorbing layers are also implemented as types of coordinate systems: PML, InfiniteElement, and AbsorbingLayer, respectively.

model.component(*<ctag>*).coordSystem(*<tag>*).selection().named(*<seltag>*) assigns the coordinate system to the named selection *<seltag>*.

model.component(*<ctag>*).coordSystem(*<tag>*).selection().set(...) defines a local selection that assigns the coordinate system to geometric entities. For a complete list of methods available under selection(), see Selections. The selection method is only available for coordinate systems of the following types: Scaling, PML, InfiniteElement, and AbsorbingLayer.

model.component(*<ctag>*).coordSystem(*<tag>*).set("orthonormal","on") specifies that this is an orthonormal system. This affects the internal calculation of systems, so some simplifications on expressions can be made. It is recommended to use this option when possible. Boundary systems, rotated systems, and cylindrical system are always orthonormal.

TABLE 2-49: COMMON PROPERTIES FOR COORDINATE SYSTEMS.

| PROPERTY | VALUE  | DESCRIPTION             |
|----------|--------|-------------------------|
| name     | String | Coordinate system name. |

#### *Mapping*

model.component(*<ctag>*).coordSystem().create(*<tag1>*,*<gtag>*,"Mapping") creates a mapped system. In a mapped system you specify the coordinate mapping given in some of the available frame coordinates (usually x, y, z).

TABLE 2-50: PROPERTIES FOR MAPPING SYSTEM.

| PROPERTY    | VALUE                                   | DEFAULT      | DESCRIPTION                   |
|-------------|-----------------------------------------|--------------|-------------------------------|
| coord       | String matrix                           | [(x1,x2,x3)] | Coordinate names.             |
| map         | String array                            | (x,y,z)      | The map.                      |
| orthonormal | boolean                                 | false        | If the system is orthonormal. |
| frametype   | mesh   material  <br>spatial   geometry | spatial      | The frame type.               |

model.component(*<ctag>*).coordSystem(*<tag1>*).setIndex("map", "x+1", 0) sets the mapping of the first coordinate system coordinate to be a function of the first frame coordinate, x.

model.component(*<ctag>*).coordSystem(*<tag1>*).setIndex("map", "y+1", 2) sets the mapping of the third coordinate system coordinate to be a function of the second frame coordinate y.

#### *VectorBase*

model.component(*<ctag>*).coordSystem().create(*<tag2>*,"VectorBase") creates a base-vector system. In a base-vector system you specify the base vectors given as components of a frame system. If the components are independent of frame coordinates this is a linear system and can be applied for any frame.

TABLE 2-51: PROPERTIES FOR BASE VECTOR SYSTEM.

| PROPERTY        | VALUE                                         | DEFAULT                 | DESCRIPTION                                                                                                                   |
|-----------------|-----------------------------------------------|-------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| coord           | String matrix                                 | [(x1,x2,x3)]            | Coordinate names, set using setIndex<br>syntax.                                                                               |
| base            | String matrix                                 | [(1,0,0)(0,1,0)(0,0,1)] | Base vectors.                                                                                                                 |
| frametype       | mesh  <br>material  <br>spatial  <br>geometry | spatial                 | Frame type for the specification of the<br>origin.                                                                            |
| makeorthonormal | boolean                                       | false                   | Make the system orthonormal.                                                                                                  |
| origin          | String array                                  | (0,0,0)                 | Origin of system; set using setIndex<br>syntax.                                                                               |
| orthonormal     | boolean                                       | false                   | If the system is orthonormal or not.                                                                                          |
| outofplane      | String                                        | 2 in 2D, 1,2 in 1D      | Out-of-plane index.                                                                                                           |
| workplanesrc    | this   part<br>Instance feature               | this                    | Part-instance feature to take the work<br>plane from.                                                                         |
| workplane       | xyplane   work<br>plane feature               | xyplane                 | Work-plane feature that defines the<br>coordinate system. The default, xyplane,<br>is the global Cartesian coordinate system. |

model.component(*<ctag>*).coordSystem(*<tag2>*).setIndex("base", "1", 0, 1) sets the first base vector's second component to one. As an alternative, it is possible to specify the full base-vector matrix using the following syntax:

model.component(*<ctag>*).coordSystem(*<tag2>*).set("base",

new String[][]{{"0","1","0"},{"0","0","1"},{"1","0","0"}}) sets the base vector matrix so the first base vector is equal to the *y*-axis of the frame system, the second is the *z*-axis, and so on. In 2D, you only use a two rows and two columns from the full base vector matrix for the in-plane base vectors. As an option, it is therefore possible to specify which of the coordinate system base vectors that corresponds to the out-of-plane axis in the frame system. Internally, this base vector always gets the components {"0","0","1"}. The third column is also set using these components. To make a general 3D system in 2D, you must use the mapped system.

model.component(*<ctag>*).coordSystem(*<tag2>*).set("outofplane", "2") sets the third base vector to represent the out-of-plane vector (*z*-axis in 2D). The value is zero based. In 1D the out-of-plane index is set using the syntax "1,2" to set second and third base vectors to represent the out-of-plane vector.

#### *Rotated*

model.component(*<ctag>*).coordSystem().create(*<tag3>*,"Rotated") creates a rotated system. In 3D you specify the Euler angles, which correspond to sequential rotation first about, by default, the *z*-axis, then the *x*-axis, and finally the *z*-axis again. In 2D you can either specify a full 3D rotation or a rotation only about a selected outof-plane axis.

TABLE 2-52: PROPERTIES FOR ROTATED SYSTEM.

| PROPERTY         | VALUE                                                                          | DEFAULT            | DESCRIPTION                                                                                                                   |
|------------------|--------------------------------------------------------------------------------|--------------------|-------------------------------------------------------------------------------------------------------------------------------|
| angle            | String array                                                                   | (0,0,0)            | Rotation angles.                                                                                                              |
| coord            | String matrix                                                                  | [(x1,x2,x3)]       | Coordinate names.                                                                                                             |
| method           | String                                                                         | inPlane            | Input method in 2D.                                                                                                           |
| frametype        | mesh   material<br>  spatial  <br>geometry                                     | spatial            | Frame type for the specification of the<br>origin.                                                                            |
| inPlaneAngle     | String                                                                         | 0                  | Rotation angle when method is inPlane.                                                                                        |
| origin           | String array                                                                   | (0,0,0)            | Origin of system; set using setIndex<br>syntax.                                                                               |
| outofplane       | String                                                                         | 2 in 2D, 1,2 in 1D | Out-of-plane index.                                                                                                           |
| rotationSequence | XYX   XYZ   XZX  <br>XZY   YXY   YXZ  <br>YZX   YZY   ZXY  <br>ZXZ   ZYX   ZYZ | ZXZ                | The rotation sequence for the Euler angles.                                                                                   |
| workplanesrc     | this   part<br>Instance feature                                                | this               | Part-instance feature to take the work plane<br>from.                                                                         |
| workplane        | xyplane   work<br>plane feature                                                | xyplane            | Work-plane feature that defines the<br>coordinate system. The default, xyplane, is<br>the global Cartesian coordinate system. |

model.component(*<ctag>*).coordSystem(*<tag3>*).setIndex("angle","12[deg]",0) sets the first rotation about the *z*-axis to 12 degrees. The default unit for angles are radians.

#### *Boundary*

model.component(*<ctag>*).coordSystem().create(*<tag4>*,*<gtag>*,"Boundary") creates a new boundary system, which is a local base vector system on 2D boundaries (**t**, **n**) and on 3D boundaries (**t**1, **t**2, **n**). There is always one boundary system added by default for each geometry.

TABLE 2-53: PROPERTIES FOR BOUNDARY SYSTEM.

| PROPERTY  | VALUE                                   | DEFAULT      | DESCRIPTION       |
|-----------|-----------------------------------------|--------------|-------------------|
| coord     | String matrix                           | [(x1,x2,x3)] | Coordinate names, |
| frametype | mesh   material  <br>spatial   geometry | spatial      | Frame type,       |

TABLE 2-53: PROPERTIES FOR BOUNDARY SYSTEM.

| PROPERTY           | VALUE                                         | DEFAULT                              | DESCRIPTION                                                |
|--------------------|-----------------------------------------------|--------------------------------------|------------------------------------------------------------|
| reversenormal      | boolean                                       | false                                | Reverse normal direction.                                  |
| tangent            | String array                                  |                                      | Tangent direction.                                         |
| mastersystem       | manual  <br>globalCartesian  <br><tag>)</tag> | globalCartesian                      | Which system to create first<br>tangential direction from. |
| mastercoordsyscomp | String                                        | "2" in axisymmetry,<br>"3" otherwise | Which axis to create first<br>tangential direction from.   |

model.component(*<ctag>*).coordSystem(*<tag4>*).set("reversenormal","on") flips the normal direction for this system, so that it is opposite to the normal direction given by the geometry.

model.component(*<ctag>*).coordSystem(*<tag4>*).set("mastersystcomp","2") sets the first tangential direction from the second axis of the specified master system.

model.component(*<ctag>*).coordSystem(*<tag4>*).set("mastersystem","manual") specifies that no master system is used and that the tangential direction must be entered by the user.

model.component(*<ctag>*).coordSystem(*<tag4>*).setIndex("tangent","1") sets the first component of the first tangential direction.

In addition, you can add ReverseNormal and DomainNormal subfeatures to reverse the normal for some boundaries and switch the normal direction on the exterior of some domains, respectively.

model.component(*<ctag>*).coordSystem(*<tag4>*).create(*<rntag>*, "ReverseNormal") creates a ReverseNormal subfeature. To it, you then assign a boundary selection. For boundary 3, for example, use model.component(*<ctag>*).coordSystem(*<tag4>*).feature(*<rntag>*).selection().set(3);

model.component(*<ctag>*).coordSystem(*<tag4>*).create(*<dntag>*, DomainNormal") creates a DomainNormal subfeature. To it, you then assign a domain selection. For domain 2, for example, use model.component(*<ctag>*).coordSystem(*<tag4>*).feature(*<dntag>*).selection().set(3);. There is one property for the DomainNormal subfeature: normalDirection, which can be a string outward (the default) or inward.

# *Cylindrical*

model.component(*<ctag>*).coordSystem().create(*<tag5>*,*<gtag>*,"Cylindrical") creates a cylindrical coordinate system, which you can use in 2D and 3D where rotational symmetry about the axis is required. You can specify the origin, axis direction and radial base vector.

TABLE 2-54: PROPERTIES FOR CYLINDRICAL SYSTEM.

| PROPERTY         | VALUE                           | DEFAULT       | DESCRIPTION                                                                                                                   |
|------------------|---------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------|
| coord            | String matrix                   | [(r, phi, a)] | Coordinate names.                                                                                                             |
| origin           | String array                    | (0,0,0)       | Origin of system.                                                                                                             |
| axis             | String array                    | (0,0,1)       | Axis direction.                                                                                                               |
| radialbasevector | String array                    | (1,0,0)       | Radial base vector direction a j = 0.                                                                                         |
| workplanesrc     | this   part<br>Instance feature | this          | Part-instance feature to take the work plane<br>from.                                                                         |
| workplane        | xyplane   work<br>plane feature | xyplane       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system. |

model.component(*<ctag>*).coordSystem(*<tag5>*).set("origin", new String[]{"1","0","0"}) sets the origin to (1,0,0).

## *Spherical*

model.component(*<ctag>*).coordSystem().create(*<tag6>*,*<gtag>*,"Spherical") creates a spherical coordinate system, which you can use in 3D to define a field or property using spherical coordinates. You can specify the origin, zenith axis (θ = 0), and azimuth axis (θ = π/2, ϕ = 0).

TABLE 2-55: PROPERTIES FOR SPHERICAL SYSTEM.

| PROPERTY         | VALUE                           | DEFAULT       | DESCRIPTION                                                                                                                   |
|------------------|---------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------|
| coord            | String matrix                   | [(r, phi, a)] | Coordinate names.                                                                                                             |
| origin           | String array                    | (0,0,0)       | Origin of system.                                                                                                             |
| axis             | String array                    | (0, 0, 1)     | Zenith axis direction.                                                                                                        |
| radialbasevector | String array                    | (1, 0, 0)     | Azimuth axis direction.                                                                                                       |
| workplanesrc     | this   part<br>Instance feature | this          | Part-instance feature to take the work plane<br>from.                                                                         |
| workplane        | xyplane   work<br>plane feature | xyplane       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global<br>Cartesian coordinate system. |

model.component(*<ctag>*).coordSystem(*<tag6>*).set("origin", new String[]{"1","0","0"}) sets the origin to (1,0,0).

# *FromGeometry*

model.component(*<ctag>*).coordSystem().create(*<tag7>*,*<gtag>*,"FromGeometry") creates a coordinate system taken from a work plane in a 3D geometry or defined in a 3D geometry part that is included in the geometry as a part instance. You can specify which work plane to use:

TABLE 2-56: PROPERTIES FOR SYSTEM FROM GEOMETRY.

| PROPERTY     | VALUE                                                  | DEFAULT       | DESCRIPTION                                                                                                                   |
|--------------|--------------------------------------------------------|---------------|-------------------------------------------------------------------------------------------------------------------------------|
| coord        | String matrix                                          | [(r, phi, a)] | Coordinate names.                                                                                                             |
| frametype    | string (mesh  <br>material  <br>spatial  <br>geometry) | material      | The frame type.                                                                                                               |
| workplane    | String                                                 | xyplane       | Name of work plane to use. The default value<br>represents a global Cartesian coordinate system.                              |
| workplanesrc | this   part<br>instance feature                        | this          | Part-instance feature to take the work plane from.                                                                            |
| workplane    | xyplane   work<br>plane feature                        | xyplane       | Work-plane feature that defines the coordinate<br>system. The default, xyplane, is the global Cartesian<br>coordinate system. |

# *Scaling*

model.component(*<ctag>*).coordSystem().create(*<tag8>*,*<gtag>*,"Scaling") creates a scaling coordinate system that maps the geometry, as represented by the independent coordinates of an underlying frame, onto a virtual geometry represented by virtual scaling system coordinates. Physics interfaces that support infinite elements or perfectly matched layers accept the scaling system coordinates as being the physical domain, in which the underlying frame coordinates are seen as a parameterization. Therefore, using a scaling coordinate system you can arbitrarily deform the domain.

TABLE 2-57: PROPERTY FOR SCALING SYSTEM.

| PROPERTY | VALUE        | DEFAULT | DESCRIPTION         |
|----------|--------------|---------|---------------------|
| map      | String array | (x,y,z) | Coordinate mapping. |

model.component(*<ctag>*).coordSystem(*<tag8>*).setIndex("map", "y+1", 1) sets the second coordinate mapping to *y*+1.

#### *Combined*

model.component(*<ctag>*).coordSystem().create(*<tag9>*,*<gtag>*,"Combined") creates a combined coordinate system that makes it possible to use different coordinate systems in different domains, for example. To add a coordinate system to the combined system and define it on domain 2, use

```
model.component(<ctag>").coordSystem(<tag9>).create(<tag91>, "VectorBase");
model.component("comp3").coordSystem(<tag9>).feature(<tag91>).selection().
      set(new int[]{2});
```

You can specify the frame and the coordinate names for the combined system:

TABLE 2-58: PROPERTIES FOR A COMBINED SYSTEM.

| PROPERTY  | VALUE                                                  | DEFAULT       | DESCRIPTION       |
|-----------|--------------------------------------------------------|---------------|-------------------|
| coord     | String matrix                                          | [(r, phi, a)] | Coordinate names. |
| frametype | string (mesh  <br>material  <br>spatial  <br>geometry) | material      | The frame type.   |

#### *Composite*

model.component(*<ctag>*).coordSystem().create(*<tag9>*,*<gtag>*,"Composite") creates a composite coordinate system that defines a new coordinate system by multiplying the transformation matrices of two other coordinate systems.

TABLE 2-59: PROPERTIES FOR A COMBINED SYSTEM.

| PROPERTY       | VALUE                                   | DEFAULT | DESCRIPTION                                                                  |
|----------------|-----------------------------------------|---------|------------------------------------------------------------------------------|
| baseSystem     | none  <br><coordsys_tag></coordsys_tag> | none    | Reference to a base system.                                                  |
| relativeSystem | none  <br><coordsys_tag></coordsys_tag> | none    | Reference to a system defining its axes<br>relative to the base system axes. |

## *PML*

model.component(*<ctag>*).coordSystem().create(*<tag10>*,*<gtag>*,"PML") creates a PML (perfectly matched layer), which acts as an artificial absorbing layer in a domain for a wave simulation. You can specify the type and scaling of the PML using the following properties:

TABLE 2-60: PROPERTIES FOR PML.

| PROPERTY     | VALUE                            | DEFAULT | DESCRIPTION                                                                                                                          |
|--------------|----------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------|
| d            | String                           | "x"     | The distance function for each stretching<br>direction, if ScalingType is set to<br>userDefined. Set using the setIndex<br>function. |
| directions   | 1, 2, or 3                       | 1       | Number of directions, if ScalingType is set<br>to userDefined.                                                                       |
| dmax         | String                           | "1[m]"  | The thickness for each stretching direction, if<br>ScalingType is set to userDefined. Set<br>using the setIndex function.            |
| imagFunction | none, or any<br>defined function | none    | Imaginary part of stretching function when<br>stretchingType is set to userDefined.                                                  |
| PMLfactor    | double                           | 1       | PML scaling factor.                                                                                                                  |
| PMLgamma     | double                           | 1       | PML scaling curvature factor.                                                                                                        |

TABLE 2-60: PROPERTIES FOR PML.

| PROPERTY             | VALUE                                                      | DEFAULT     | DESCRIPTION                                                                    |
|----------------------|------------------------------------------------------------|-------------|--------------------------------------------------------------------------------|
| realFunction         | none, or any<br>defined function                           | none        | Real part of stretching function when<br>stretchingType is set to userDefined. |
| ScalingType          | Cartesian  <br>Cylindrical  <br>Spherical  <br>userDefined | Cartesian   | The PML scaling type. Spherical is only<br>available in 3D.                    |
| stretchingType       | polynomial  <br>rational  <br>userDefined                  | polynomial  | The coordinate stretching type for the PML<br>scaling.                         |
| typicalWavelength    | double                                                     | 1           | Typical wavelength for the waves.                                              |
| wavelengthSourceType | fromPhysics  <br>userDefined                               | fromPhysics | Take the wavelength from the physics or a<br>user-defined wavelength.          |

# *InfiniteElement*

model.component(*<ctag>*).coordSystem().create(*<tag11>*,*<gtag>*,"InfiniteElement") creates an infinite element, which acts as an unbounded domain for a simulation. You can specify the type and scaling of the infinite element using the following properties:

TABLE 2-61: PROPERTIES FOR INFINITE ELEMENT.

| PROPERTY    | VALUE                                                      | DEFAULT                   | DESCRIPTION                                                                      |
|-------------|------------------------------------------------------------|---------------------------|----------------------------------------------------------------------------------|
| r0          | double array                                               | 0; 0 (2D)<br>0; 0; 0 (3D) | Center coordinates for cylindrical infinite<br>elements.                         |
| raxis       | double array                                               | 0; 0; 0                   | Center axis direction for cylindrical infinite<br>elements in 3D,                |
| pole        | double                                                     | dGeomChar                 | Pole distance                                                                    |
| ScalingType | Cartesian  <br>Cylindrical  <br>Spherical  <br>userDefined | Cartesian                 | The scaling type for the infinite element.<br>Spherical is only available in 3D. |
| width       | double                                                     | 1e3*dGeomChar             | Physical width.                                                                  |
| directions  | integer                                                    | 1                         | Number of stretching directions (for<br>userDefined scaling).                    |
| d           | String array                                               | x; y, z                   | Distance function for stretching directions (1–<br>3).                           |
| dmax        | double array                                               | 1; 1, 1                   | Thickness function for stretching directions<br>(1–3).                           |

#### *AbsorbingLayer*

model.component(*<ctag>*).coordSystem().create(*<tag12>*,*<gtag>*,"AbsorbingLayer") creates an absorbing layer, which acts as an effective nonreflecting-like boundary condition in transient simulations using a time-explicit solver. You can specify the type and scaling of the absorbing layer using the following properties:

TABLE 2-62: PROPERTIES FOR ABSORBING LAYER.

| PROPERTY | VALUE        | DEFAULT                   | DESCRIPTION                                                      |
|----------|--------------|---------------------------|------------------------------------------------------------------|
| r0       | double array | 0; 0 (2D)<br>0; 0; 0 (3D) | Center coordinates for cylindrical absorbing<br>layers.          |
| raxis    | double array | 0; 0; 0                   | Center axis direction for cylindrical absorbing<br>layers in 3D, |
| pole     | double       | dGeomChar                 | Pole distance                                                    |

TABLE 2-62: PROPERTIES FOR ABSORBING LAYER.

| PROPERTY    | VALUE                                                      | DEFAULT       | DESCRIPTION                                                                     |
|-------------|------------------------------------------------------------|---------------|---------------------------------------------------------------------------------|
| ScalingType | Cartesian  <br>Cylindrical  <br>Spherical  <br>userDefined | Cartesian     | The scaling type for the absorbing layer.<br>Spherical is only available in 3D. |
| width       | double                                                     | 1e3*dGeomChar | Physical width.                                                                 |
| directions  | integer                                                    | 1             | Number of stretching directions (for<br>userDefined scaling).                   |
| d           | String array                                               | x; y, z       | Distance function for stretching directions (1–<br>3).                          |
| dmax        | double array                                               | 1; 1, 1       | Thickness function for stretching directions<br>(1–3).                          |

#### **EXAMPLE**

Create a cylindrical coordinate system with a radial base vector direction that is (0, 1, 0); that is, a coordinate that points in the global *y* direction:

```
Code for Use with Java
  model.component("comp1").coordSystem().create("sys2", "geom1", "Cylindrical");
  model.component("comp1").coordSystem("sys2").setIndex("radialbasevector", "1", 1);
  model.component("comp1").coordSystem("sys2").setIndex("radialbasevector", "0", 0);
Code for Use with MATLAB
  model.component('comp1').coordSystem.create('sys2', 'geom1', 'Cylindrical');
  model.component('comp1').coordSystem('sys2').setIndex('radialbasevector', '1', 1);
  model.component('comp1').coordSystem('sys2').setIndex('radialbasevector', '0', 0);
model.cpl()
```

Add nonlocal couplings.

## **SYNTAX**

```
model.component(<ctag>).cpl().create(<tag>,type);
model.component(<ctag>).cpl().create(<tag>,type,<gtag>);
model.component(<ctag>).cpl(<tag>).set(property,<value>);
model.component(<ctag>).cpl(<tag>).set("opname",<opname>)
model.component(<ctag>).cpl(<tag>).selection(property).named(<seltag>);
model.component(<ctag>).cpl(<tag>).selection(property).set(...);
model.component(<ctag>).cpl(<tag>).create(<subtag>,subtype);
model.component(<ctag>).cpl(<tag>).feature(<subtag>).set(property,<value>);
model.component(<ctag>).cpl(<tag>).getType(property,<value>);
model.component(<ctag>).cpl(<tag>).feature(<subtag>).getType(property,<value>);
model.component(<ctag>).cpl(<tag>).image();
model.component(<ctag>).cpl(<tag>).set(property,<value>);
model.component(<ctag>).cpl(<tag>).setIndex(property,<value>,<index1>);
model.component(<ctag>).cpl(<tag>).setIndex(property,<value>,<index1>,<index2>);
```

The set() methods index/position arguments are 1-based. The setIndex() methods index/position arguments are 0-based. See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

# **DESCRIPTION**

```
model.component(<ctag>).cpl().create(<tag>,type) creates a nonlocal coupling of type type. 
model.component(<ctag>).cpl().create(<tag>,type,<gtag>) creates a nonlocal coupling on the geometry
```

*<gtag>*. The supported types are GeneralExtrusion, LinearExtrusion, BoundarySimilarity, IdentityMapping, GeneralProjection, LinearProjection, Integration, Average, Maximum, and Minimum. The nonlocal coupling operators provide coupling of values, typically from a source to a destination between or within model components.

model.component(*<ctag>*).cpl(*<tag>*).selection().named(*<seltag>*) assigns the nonlocal coupling's source to the named selection *<seltag>*. model.cpl(*<tag>*).selection().set(...) defines a local selection that assigns the nonlocal coupling's source to geometric entities. For a complete list of methods available under selection(), see Selections.

model.component(*<ctag>*).cpl(*<tag>*).set(*property*,*<value>*) specifies properties relevant for the selected nonlocal coupling type; see below.

model.component(*<ctag>*).cpl(<tag>).set("opname",*<opname>*) sets the operator name of the nonlocal coupling. The default nonlocal coupling operator name is *<tag>*.

model.component(*<ctag>*).cpl(*<tag>*).selection(*property*).named(*<seltag>*) assigns the nonlocal coupling's selection property to the named selection *<seltag>*.

model.component(*<ctag>*).cpl(*<tag>*).selection(*property*).set(...) defines a local selection that assigns the nonlocal coupling's selection property to geometric entities. For a complete list of methods available under selection(), see model.selection().

model.component(*<ctag>*).cpl(*<tag>*).create(*<subtag>*,*subtype*) creates a subfeature of type *subtype*. This can only be done when the nonlocal coupling *type* is BoundarySimilarity. The supported values of subtype are OnePointMap, TwoPointMap, and EdgeMap.

model.component(*<ctag>*).cpl(*<tag>*).selection().named() returns the named source selection of the coupling.

model.component(*<ctag>*).cpl(*<tag>*).selection().get*Type*(...) queries the source selection.

model.component(*<ctag>*).cpl(*<tag>*).get*Type*(*property*) returns the value of a specified property.

model.component(*<ctag>*).cpl(*<tag>*).selection(*property*).named() returns the named selection tag of the selection property.

model.component(*<ctag>*).cpl(*<tag>*).selection(*property*).get*Type*(...) queries a selection property.

Use model.component(*<ctag>*).cpl(*<tag>*).image() method to create a plot or export images. See Plotting and Exporting Images.

Notation: srcedim = dimension of source selection; srcsdim = space dimension of source geometry.

## **INTEGRATION COUPLINGS**

#### *Integration*

By default, a *nonlocal integration coupling* operator *oper* integrates an expression e over the source selection. The resulting value *oper*(e) can be used anywhere. If method=summation, the expression is instead summed over the nodes in the source selection.

TABLE 2-63: INTEGRATION COUPLING PROPERTIES.

| PROPERTY | VALUE                                   | DEFAULT | DESCRIPTION                                        |
|----------|-----------------------------------------|---------|----------------------------------------------------|
| axisym   | on   off                                | on      | Multiply by 2*pi*r in axisymmetric geometries.     |
| frame    | mesh   material  <br>spatial   geometry | spatial | Frame to integrate in (determines volume element). |

TABLE 2-63: INTEGRATION COUPLING PROPERTIES.

| PROPERTY | VALUE                      | DEFAULT     | DESCRIPTION            |
|----------|----------------------------|-------------|------------------------|
| intorder | String                     | 4           | Integration order.     |
| method   | integration  <br>summation | integration | Method of computation. |

# *Average*

A *nonlocal average coupling* operator oper integrates an expression e over the source selection and divides with the measure of the source selection. The resulting value oper(e) can be used anywhere.

TABLE 2-64: AVERAGE COUPLING PROPERTIES.

| PROPERTY | VALUE                                   | DEFAULT | DESCRIPTION                                        |
|----------|-----------------------------------------|---------|----------------------------------------------------|
| axisym   | on   off                                | on      | Multiply by 2*pi*r in axisymmetric geometries.     |
| frame    | mesh   material  <br>spatial   geometry | spatial | Frame to integrate in (determines volume element). |
| intorder | String                                  | 4       | Integration order.                                 |

# *Maximum/Minimum*

A *nonlocal maximum* or *minimum coupling* operator oper finds the maximum or minimum of an expression e over the source selection. The resulting value oper(e) can be used anywhere. An optional second argument is evaluated at the point where the first argument has its maximum or minimum. Use x, y, or z, for example, to get the coordinate location of the maximum or minimum.

TABLE 2-65: MAXIMUM/MINIMUM COUPLING PROPERTIES.

| PROPERTY | VALUE                         | DEFAULT | DESCRIPTION       |
|----------|-------------------------------|---------|-------------------|
| intorder | String                        | 4       | Integration rule. |
| lagrange | String                        | 2       | Lagrange order.   |
| points   | node   integration   lagrange | node    | Type of point.    |

The maximum or minimum is approximated by evaluating the expression in the specified points.

## *Line Integration*

By default, a *line integration coupling* operator *oper* evaluates the integral of a general operator argument expression, the integrand, on a line through a meshed source domain selection in 2D or 3D. The resulting value *oper*(e) can be used anywhere.

TABLE 2-66: LINE INTEGRATION COUPLING PROPERTIES.

| PROPERTY | VALUE                                   | DEFAULT                  | DESCRIPTION                                                             |
|----------|-----------------------------------------|--------------------------|-------------------------------------------------------------------------|
| axisym   | on   off                                | on                       | Multiply by 2*pi*r in axisymmetric geometries.                          |
| direxprs | sdim-by-1 string array                  | {"1","0","0"}<br>(in 3D) | Direction expressions, when dirinput is set to<br>direxprs.             |
| dirinput | direxprs   opargs                       | direxpr                  | Use fixed expressions or operation arguments for<br>the line direction. |
| frame    | mesh   material  <br>spatial   geometry | spatial                  | Frame to integrate in (determines volume element).                      |
| intorder | String                                  | 4                        | Integration order.                                                      |
| linetype | unidirectional  <br>bidirectional       | unidirectional           | Method of computation.                                                  |

# **EXTRUSION COUPLINGS**

A *nonlocal extrusion coupling* operator oper maps an expression e defined on (a part of) the source selection to an expression oper(e) that can be evaluated on (a part of) the destination geometries. For each point *ps* in the

source selection, there can be zero, one, or several corresponding points *pd* in the destination. The inverse mapping *ps* = *m*(*pd*) is always one-to-one. The value of oper(e) at the point *pd* is defined as the value of e at the point *ps*.

The inverse mapping *m* is specified as the composition of a *destination map md* and the inverse of a *source map ms*: *ps* = *m*(*pd*) = *ms* <sup>−</sup>1(*md*(*pd*)). In other words, *ms*(*ps*) <sup>=</sup> *md*(*pd*) — both the destination map and the source map into the same *intermediate space*. For all operator types except GeneralExtrusion, the intermediate space coincides with the source geometry. The source map is always one-to-one. By default, the source map is the identity.

The operator type determines the type of destination map:

TABLE 2-67: EXTRUSION COUPLING TYPES.

| COUPLING TYPE      | DESTINATION MAP                                                                       |
|--------------------|---------------------------------------------------------------------------------------|
| GeneralExtrusion   | Nonlinear map described by expressions.                                               |
| LinearExtrusion    | Linear map described by vertex mapping.                                               |
| BoundarySimilarity | Similarity transformation described by mapping of boundaries. Also used by copy mesh. |
| IdentityMapping    | Identity map.                                                                         |

For most of these coupling types, a source map described by (possibly nonlinear) expressions can be used.

TABLE 2-68: EXTRUSION COUPLING PROPERTIES.

| PROPERTY         | VALUE                      | DEFAULT | DESCRIPTION                                                                          |
|------------------|----------------------------|---------|--------------------------------------------------------------------------------------|
| exttol           | double                     | 0.3     | Extrapolation tolerance in mesh search.                                              |
| manualsearchdist | on   off                   | off     | Use manual control of search distance.                                               |
| method           | usetol   closest<br>  walk | usetol  | Mesh search method: A tolerance, closest point, or<br>walk in a connected component. |
| searchdist       | positive distance          | 0.01    | Search distance in mesh search if manualsearchdist<br>is set to on.                  |
| usenan           | on   off                   | off     | Use NaN instead of error message when source point<br>is outside selection.          |

If method=usetol, oper(e) is defined when the source point *p*s is within the source selection, or if it is slightly outside. The tolerance is given in the property exttol, which is a distance in mesh element local coordinates; that is, it is a measure relative to the mesh element size. If oper(e) is not defined, an error message is given (if usenan=off), or the value NaN is returned (if usenan=on).

If method=closest, a brute force search method is used, which makes oper(e) defined everywhere (the nearest point to *ps* in the source selection is used).

If method=walk, a walk through the source mesh is made. This method should not be used if the component is not connected.

If manualsearchdist=on and the source selection is a boundary, edge, or point selection, searchdist gives the search distance in directions orthogonal to the source selection. The default unit is the component's length unit. If manualsearchdist=off, the search distance is equal to exttol times the mesh element size. If method=closest, exttol and searchdist are not used.

Depending on the coupling type, additional properties are available (see below).

## *GeneralExtrusion*

A *nonlocal general extrusion coupling* operator maps an expression defined on a source to an expression that can be evaluated on any destination geometry where the destination map expressions are valid.

TABLE 2-69: GENERAL EXTRUSION MAP PROPERTIES.

| PROPERTY  | VALUE                        | DEFAULT             | DESCRIPTION                             |
|-----------|------------------------------|---------------------|-----------------------------------------|
| dstmap    | String array                 | spatial coordinates | Expressions for destination map md(pd). |
| srcframe  | mesh   material  <br>spatial | spatial             | Frame for source mesh.                  |
| srcmap    | String array                 | spatial coordinates | Expressions for source map ms(ps).      |
| usesrcmap | on   off                     | off                 | Use source map.                         |

Trailing empty expressions in the properties dstmap and srcmap are ignored. The remaining expressions must be equal in number, and this determines the dimension idim of the intermediate space. Requirement: srcedim <= idim <= srcsdim. Changing the source selection has the side effect of changing dstmap and srcmap so that this requirement is satisfied. By default, idim=srcsdim.

The source mesh is viewed in the frame srcframe. The source mapping is taken to be linear within each source mesh element.

If usesrcmap=off, the srcmap property is not used. In this case, dstmap is a mapping from the destination to the source (viewed in the frame srcframe), and idim=srcsdim.

# *LinearExtrusion*

A *nonlocal linear extrusion coupling* operator linearly maps an expression defined on a source to an expression that can be evaluated in the destination.

TABLE 2-70: LINEAR EXTRUSION MAP PROPERTIES.

| PROPERTY   | VALUE                        | DEFAULT             | DESCRIPTION                                               |
|------------|------------------------------|---------------------|-----------------------------------------------------------|
| srcvertexN | Selection                    |                     | Source vertex number N                                    |
| dstgeom    | String                       | source geometry     | Destination geometry                                      |
| dstvertexN | Selection                    |                     | Destination vertex number N                               |
| srcframe   | mesh   material  <br>spatial | spatial             | Frame for evaluation of source vertex<br>coordinates      |
| dstframe   | mesh   material  <br>spatial | spatial             | Frame for evaluation of destination vertex<br>coordinates |
| usesrcmap  | on   off                     | off                 | Use source map                                            |
| srcmap     | string[srcsdim]              | spatial coordinates | Expressions for source map ms(ps)                         |

The number of selections srcvertexN and dstvertexN is 4. These are used only for 1<=N<=dim+1, where dim is a number less than or equal to min(srcsdim,dstsdim). The remaining 4-dim selections should be empty.

The destination map is the following linear (affine) map from the destination geometry to the source geometry:

- **1** First, if dim<dstsdim, an orthogonal projection onto the affine space spanned by the destination vertices. The number of destination vertices is dim+1. Thus, dim=2 gives a plane, and dim=1 gives a line.
- **2** Then, a linear (affine) map mapping the destination vertices onto the source vertices.

## *BoundarySimilarity (3D)*

A *nonlocal boundary similarity coupling* operator maps an expression defined on a part of a boundary to another part of a boundary with the same shape.

TABLE 2-71: BOUNDARY SIMILARITY PROPERTIES IN 3D.

| PROPERTY    | VALUE           | DEFAULT             | DESCRIPTION                        |
|-------------|-----------------|---------------------|------------------------------------|
| destination | Selection       |                     | Destination face.                  |
| usesrcmap   | on   off        | off                 | Use source map.                    |
| srcmap      | string[srcsdim] | spatial coordinates | Expressions for source map ms(ps). |

The destination transformation is a similarity transformation that maps a destination face (destination) onto a set of source faces (the source selection). The mesh is always viewed in the mesh frame.

By default, the algorithm automatically chooses a transformation when symmetries make several transformations possible. To control this choice, one of the following subfeatures can be added in 3D.

TABLE 2-72: SUBFEATURE TYPES.

| SUBFEATURE  | REMARKS                                     |  |
|-------------|---------------------------------------------|--|
| EdgeMap     | Specify how one source edge is mapped.      |  |
| OnePointMap | Specify how one source vertex is mapped.    |  |
| TwoPointMap | Specify how two source vertices are mapped. |  |

#### *EdgeMap*

An *edge map* specifies that a certain destination edge should be mapped onto a certain source edge. Their relative direction is given by the property direction. The edges must be adjacent to the given faces.

TABLE 2-73: PROPERTIES FOR EDGEMAP SUBFEATURE.

| PROPERTY  | VALUE                  | DEFAULT | DESCRIPTION       |
|-----------|------------------------|---------|-------------------|
| srcedge   | Selection              |         | Source edge.      |
| dstedge   | Selection              |         | Destination edge. |
| direction | auto   same   opposite | auto    | Edge direction.   |

## *OnePointMap*

A *one-point map* specifies that a certain destination vertex should be mapped onto a certain source vertex.

TABLE 2-74: PROPERTIES FOR ONEPOINTMAP SUBFEATURE.

| PROPERTY  | VALUE     | DEFAULT | DESCRIPTION                 |  |
|-----------|-----------|---------|-----------------------------|--|
| srcpoint1 | Selection |         | Vertex on source face.      |  |
| dstpoint1 | Selection |         | Vertex on destination face. |  |

# *TwoPointMap*

A *two-point map* specifies that two destination vertices should be mapped onto two source vertices.

TABLE 2-75: PROPERTIES FOR ONEPOINTMAP SUBFEATURE.

| PROPERTY  | VALUE     | DEFAULT | DESCRIPTION                   |
|-----------|-----------|---------|-------------------------------|
| srcpoint1 | Selection |         | Vertex 1 on source face.      |
| srcpoint2 | Selection |         | Vertex 2 on source face.      |
| dstpoint1 | Selection |         | Vertex 1 on destination face. |
| dstpoint2 | Selection |         | Vertex 2 on destination face. |

TABLE 2-76: BOUNDARY SIMILARITY PROPERTIES IN 2D

| PROPERTY    | VALUE              | DEFAULT             | DESCRIPTION                                         |
|-------------|--------------------|---------------------|-----------------------------------------------------|
| destination | Selection          |                     | Destination edge.                                   |
| direction   | auto same opposite | auto                | Edge direction.                                     |
| usesrcmap   | on   off           | off                 | Use source map.                                     |
| srcmap      | string[srcsdim]    | spatial coordinates | Expressions for source map $m_{\it s}(p_{\it s})$ . |

The destination transformation is a similarity transformation that maps a destination edge (destination) onto a set of source edges (the source selection). Their relative direction is given by the property direction. The mesh is always viewed in the mesh frame.

## **Identity**Mapping

A nonlocal identity mapping coupling operator maps between geometric entities that overlap, possibly when viewed in different frames. The destination transformation is an identity mapping between the given frames.

TABLE 2-77: IDENTITY MAPPING PROPERTIES.

| PROPERTY | VALUE                     | DEFAULT | DESCRIPTION                                      |
|----------|---------------------------|---------|--------------------------------------------------|
| dstframe | mesh material spatial     | spatial | Frame for evaluation of destination coordinates. |
| srcframe | mesh   material   spatial | spatial | Frame for evaluation of source coordinates.      |

## PROJECTION COUPLINGS

A projection coupling operator oper maps an expression e defined on (a part of) the source selection to an expression oper(e) that can be evaluated on (a part of) the destination geometries. It does so by performing integration along curves in the source selection. These curves correspond to lines in an intermediate space, whose dimension is equal to sreedim. There is a source map  $m_s$  mapping the source selection into the intermediate space, and a destination map  $m_d$  mapping the destination geometries into the subspace of intermediate space where the last coordinate is zero. The source map is always one-to-one. The value of oper(e) at a destination point  $p_d$  is defined as follows:

- I In the intermediate space, consider the line that is parallel to the last coordinate axis and goes through the point  $m_d(p_d)$ .
- 2 Map this line to a curve in the source selection using the inverse of the source map.
- **3** Integrate the expression e over this curve.

This implies that the value of oper(e) at the destination point  $p_d$  is the integral of e along a curve through the source point  $p_s = m_s^{-1}(m_d(p_d))$ .

The coupling type determines the type of the maps:

TABLE 2-78: PROJECTION OPERATOR TYPES.

| COUPLING TYPE     | MAP TYPES                               |
|-------------------|-----------------------------------------|
| GeneralProjection | Nonlinear map described by expressions. |
| LinearProjection  | Linear map described by vertex mapping. |

TABLE 2-79: PROJECTION COUPLING PROPERTIES.

| PROPERTY | VALUE | DEFAULT | DESCRIPTION                   |  |
|----------|-------|---------|-------------------------------|--|
| intorder | int   | 4       | Order of integration formula. |  |

Additional properties are available depending on the coupling type; see below.

## *GeneralProjection*

Use a *nonlocal general projection coupling* to define integration along curves.

TABLE 2-80: GENERAL PROJECTION COUPLING PROPERTIES.

| PROPERTY | VALUE                     | DEFAULT             | DESCRIPTION                             |
|----------|---------------------------|---------------------|-----------------------------------------|
| dstmap   | string[srcedim-1]         | spatial coordinates | Expressions for destination map md(pd). |
| srcframe | mesh   material   spatial | spatial             | Frame for source mesh.                  |
| srcmap   | string[srcedim]           | spatial coordinates | Expressions for source map ms(ps).      |

# *LinearProjection*

A *nonlocal linear projection coupling* operator defines a mapping between destination and source that is given by a linear map defined by vertices. Let *v* be the vector from the first source vertex to the last source vertex. The value of oper(e) at a point *pd* is equal to the integral of e over the line through the point *ps=ms* -1(*md*(*pd*)) with direction vector *v*.

TABLE 2-81: LINEAR PROJECTION COUPLING PROPERTIES.

| PROPERTY   | VALUE                     | DEFAULT            | DESCRIPTION                                                |
|------------|---------------------------|--------------------|------------------------------------------------------------|
| srcvertexN | Selection                 |                    | Source vertex number N.                                    |
| dstgeom    | String                    | source<br>geometry | Destination geometry.                                      |
| dstvertexN | Selection                 |                    | Destination vertex number N.                               |
| srcframe   | mesh   material   spatial | spatial            | Frame for evaluation of source vertex coordinates.         |
| dstframe   | mesh   material   spatial | spatial            | Frame for evaluation of destination vertex<br>coordinates. |

The number of selections srcvertexN is 4. These are used only for 1<=N<=srcedim+1. The remaining selections should be empty. The number of source vertices is srcedim+1. The source map is a linear (affine) map that maps the source vertices onto the points 0, *e*1, *e*2, …, *e*srcedim in the intermediate space, where *ei* is the *i*th unit vector.

The number of selections dstvertexN is 4. These are used only for 1<=N<=srcedim. The remaining selections should be empty. The number of destination vertices is srcedim. The destination map is the following linear (affine) map from the destination geometry to the intermediate space:

- **1** First, if srcedim-1<dstsdim, an orthogonal projection onto the affine space spanned by the destination vertices. Thus, srcedim=3 gives a plane, and srcedim=2 gives a line.
- **2** Then, a linear (affine) map mapping the destination vertices onto the points 0, *e*1, *e*2, …, *e*srcedim-1 in the intermediate space, where *ei* is the *i*th unit vector.

# *model.elem()*

Creating and modifying different types of elements.

# **SYNTAX**

```
model.elem().create(<tag>,eltype);
model.elem(<tag>).set(<ftag>,value);
model.elem(<tag>).field().create(<ftag>,"record");
model.elem(<tag>).field(<ftag>).set(<ftag>,value);
model.elem(<tag>).field().create(<atag>,"array");
model.elem(<tag>).field(<atag>).pos().create("string",value);
model.elem(<tag>).field(<atag>).pos().create("array");
model.elem(<tag>).field(<atag>).pos(pos).create("string",value);
model.elem(<tag>).src().create(<fttag>);
model.elem(<tag>).src(<fttag>).set(<ftag>,value);
model.elem(<tag>).src(<fttag>).field().create(<ftag>,"array");
model.elem(<tag>).geomdim().create(<fttag>);
```

#### **DESCRIPTION**

model.elem().create(*<tag>*,eltype) creates a new element of type eltype, for example elinterp, elpric, elvar, elode, and so on.

model.elem(*<tag>*).set(*<ftag>*,value) sets the field tagged *<ftag>* to value. Examples of fields and values are file and solution\_interp.txt, global and 1, and so on.

model.elem(*<tag>*).field().create(*<ftag>*,"record") creates a new field tagged *<ftag>* of type record under the element tagged *<tag>*.

model.elem(*<tag>*).field(*<ftag>*).set(sname,value) sets the field tagged sname to value. The field is located under the record field tagged *<ftag>*.

model.elem(*<tag>*).field(*<ftag>*).field().create(<rtag>,"record") creates a new record field tagged <rtag> that is a field under the record field *<ftag>*.

model.elem(*<tag>*).field().create(*<atag>*,"array") creates a new array field tagged *<atag>*.

model.elem(*<tag>*).field(*<atag>*).pos().create("array") adds a new element of type array to the array tagged *<atag>*.

model...field(*<atag>*).pos(1).pos().create("string","1") adds a new array element of type string with value 1 to the first array element of the array stored in the field *<atag>*.

In the text below, all occurrences of src can be replaced with geomdim.

model.elem(*<tag>*).src().create(*<fttag>*) creates a src feature tagged *<fttag>* under the element. A feature must have a domain selection.

model.elem(*<tag>*).src(*<fttag>*).selection().dim(2).set(gname) assigns all domains of dimension 2 from geometry gname to the selection of feature *<fttag>*.

model.elem(*<tag>*).src(*<fttag>*).set(*<ftag>*,value) sets the field *<ftag>* to value under the feature *<fttag>*.

model.elem(*<tag>*).src(*<fttag>*).field().create(rname,"record") adds a new record field rname under the feature *<fttag>*.

# **EXAMPLES**

Specifies an interpolation element that takes its data from a file named solution\_data.txt.

```
Code for Use with Java
  model.elem().create("fun1","elinterp");
  model.elem("fun1").set("name",new String[]{"sol"});
  model.elem("fun1").set("file","solution_data.txt");
  model.elem("fun1").set("fileindex",new String[]{"1"});
  model.elem("fun1").set("defvars",new String[]{"true"});
  model.elem("fun1").set("method",new String[]{"linear"});
  model.elem("fun1").set("extmethod",new String[]{"const"});
Code for Use with MATLAB
  model.elem.create('fun1','elinterp');
  model.elem('fun1').set('name',{'sol'});
  model.elem('fun1').set('file','solution_data.txt');
  model.elem('fun1').set('fileindex',{'1'});
  model.elem('fun1').set('defvars',{'true'});
  model.elem('fun1').set('method',{'linear'});
  model.elem('fun1').set('extmethod',{'const'});
```

The example below creates two integration couplings.

```
Code for Use with Java
  model.elem().create("elem1","elcplscalar");
  model.elem("elem1").set("var",new String[]{"aa","bb"});
  model.elem("elem1").set("global",new String[]{"1","2"});
  model.elem("elem1").src().create("feat1");
  model.elem("elem1").src("feat1").selection().geom("g",2).set(new int[]{1});
  model.elem("elem1").src("feat1").set("expr",new String[][]{{"1"},{"2"}}
  model.elem("elem1").src("feat1").set("ipoints",new String[][]{{"2"},{"2"}}
  model.elem("elem1").src("feat1").set("frame",new String[][]{{"spatial"},{"spatial"}};
Code for Use with MATLAB
  model.elem.create('elem1','elcplscalar');
  model.elem('elem1').set('var',{'aa','bb'});
  model.elem('elem1').set('global',{'1','2'});
  model.elem('elem1').src.create('feat1');
  model.elem('elem1').src('feat1').selection.geom('g',2).set(1);
  model.elem('elem1').src('feat1').set('expr',{{'1'},{'2'}}
  model.elem('elem1').src('feat1').set('ipoints',{{'2'},{'2'}}
  model.elem('elem1').src('feat1').set('frame',{{'spatial'},{'spatial'}};
This complicated example creates a constr element with two constraints (usually done with constraint features):
Code for Use with Java
  model.elem().create("elem1","elsconstr");
  feat = model.elem("elem1").geomdim().create("feat1");
  feat.selection().geom("g",2).set(new int[]{1});
  feat.set("constr",new String[][][]{{{"Ex","Ey","Ez"}}});
  feat.set("cshape",new String[]{"1"})
  feat.field().create("shelem","record");
  feat.field("shelem").set("case",new String[0]);
  feat.field("shelem").set("mind",new String[0]);
  feat.field("shelem").field().create("default","array");
  feat.field("shelem").field("default").pos().create("array");
  feat.field("shelem").field("default").pos(1).pos().create("array");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("string","edg");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("string","shcurl");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("record");
  feat.field("shelem").field("default").pos(1).pos(1).pos(3).set("order","2");
  feat.field("shelem").field("default").pos(1).pos(1).pos(3)
  .set("compnames",new String[]{"Ex","Ey","Ez"});
  feat.field("shelem").field("default").pos(1).pos(1).pos(3).set("frame","ref");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("string","edg2");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("string","shcurl");
  feat.field("shelem").field("default").pos(1).pos(1).pos().create("record");
  feat.field("shelem").field("default").pos(1).pos(1).pos(6).set("order","2");
  feat.field("shelem").field("default").pos(1).pos(1).pos(6)
  .set("compnames",new String[]{"Ex","Ey","Ez"});
  feat.field("shelem").field("default").pos(1).pos(1).pos(6).set("frame","ref");
Code for Use with MATLAB
  model.elem.create('elem1','elsconstr');
  feat = model.elem('elem1').geomdim().create('feat1');
  feat.selection().geom('g',2).set(1);
  feat.set('constr',{{{'Ex','Ey','Ez'}}});
  feat.set('cshape',{'1'})
  shelem = feat.field.create('shelem','record');
  shelem.set('case','');
  shelem.set('mind','');
  shelem.field().create('default','array');
  shelem.field('default').pos.create('array');
  shelem.field('default').pos(1).pos.create('array');
  shelem.field('default').pos(1).pos(1).pos.create('string','edg');
  shelem.field('default').pos(1).pos(1).pos.create('string','shcurl');
  shelem.field('default').pos(1).pos(1).pos.create('record');
```

```
shelem.field('default').pos(1).pos(1).pos(3).set('order','2');
  shelem.field('default').pos(1).pos(1).pos(3).set('compnames',{'Ex','Ey','Ez'});
  shelem.field('default').pos(1).pos(1).pos(3).set('frame','ref');
  shelem.field('default').pos(1).pos(1).pos.create('string','edg2');
  shelem.field('default').pos(1).pos(1).pos.create('string','shcurl');
  shelem.field('default').pos(1).pos(1).pos.create('record');
  shelem.field('default').pos(1).pos(1).pos(6).set('order','2');
  shelem.field('default').pos(1).pos(1).pos(6).set('compnames',{'Ex','Ey','Ez'});
  shelem.field('default').pos(1).pos(1).pos(6).set('frame','ref');
For all records, the statement
  model...set("frame","ref");
is the equivalent to
  model...field().create("frame","string","ref");
The statement
  model...set("expr",new String[][]{{"1"},{"2"}});
is equivalent to
  model...field().create("expr","array");
  model...field("expr").pos().create("array").
  model...field("expr").pos(1).create("string","1");
  model...field("expr").pos().create("array").
  model...field("expr").pos(2).create("string","1");
```

so the set method is often a much more convenient way to create simple fields.

# *model.elementSet()*

Mesh element sets.

# **SYNTAX**

```
model.elementSet().create(<tag>);
model.elementSet(<tag>).set(<var>,<expr>);
model.elementSet(<tag>).remove(<var>);
model.elementSet(<tag>).model(<mtag>);
model.elementSet(<tag>).varnames();
model.elementSet(<tag>).get(<var>);
model.elementSet(<tag>).model();
model.elementSet(<tag>).scope();
```

# **DESCRIPTION**

model.elementSet(*<tag>*) returns an element set. It contains one or several definitions of sets of mesh elements. Each element set is identified with an *element set variable* name — the variable evaluates to 1 on mesh elements that belong to the element set, and it evaluates to 0 on other mesh elements. The variable has a defining expression that is evaluated at the midpoint of each mesh element to determine whether the mesh element belongs to the element set. This evaluation is done once at the beginning of the solution process, so the expression must not depend on variables that change during the solution process. All element sets in model.elementSet(*<tag>*) are subsets of the selection model.elementSet(*<tag>*).selection().

```
model.elementSet().create(<tag>) creates a new element set with tag <tag>.
```

model.elementSet(*<tag>*).set(*<var>*,*<expr>*) sets the defining expression for the element set variable *<var>* to *<expr>*.

```
model.elementSet(<tag>).remove(<var>) removes the element set variable <var>.
```

```
model.elementSet(<tag>).model(<mtag>) sets the model component node.
model.elementSet(<tag>).selection().selMethod manipulates the geometric entity selection; see 
Selections for a description of the available methods.
model.elementSet(<tag>).varnames() returns all element set variables as a string array.
model.elementSet(<tag>).get(<var>) returns the defining expression of element set variable <var>.
model.elementSet(<tag>).model() returns the model component node tag.
model.elementSet(<tag>).scope() returns the fully qualified scope name.
```

## **EXAMPLE**

Let A be an element set consisting of all mesh triangles that are not adjacent to boundaries 3 or 4 in square, plus all mesh triangles that are adjacent to boundaries 1 or 2. Let the dependent variable u be defined on A. Solve Poisson's equation with Dirichlet conditions on boundaries 1 and 2:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1", 2);
  model.component("comp1").geom("geom1").create("sq1", "Square");
  model.component("comp1").mesh().create("mesh1", "geom1");
  model.component("comp1").mesh("mesh1").run();
  model.elementSet().create("es1");
  model.elementSet("es1").set("A", "!bndadj(3,4) || bndadj(1,2)");
  model.elementSet("es1").selection().geom(2).all();
  model.shape().create("sh1", "material1");
  model.shape("sh1").create("f1", "shlag");
  model.shape("sh1").feature("f1").set("basename", "u").set("order", 1);
  model.shape("sh1").selection().geom(2).all();
  model.shape("sh1").elementSet("A");
  model.field().create("field1", "u");
  model.field("field1").shape(new String[]{"sh1"});
  model.intRule().create("ir1", "material1");
  model.intRule("ir1").create("o2").order(2);
  model.weak().create("weak1");
  model.weak("weak1").weak("if(A,ux*test(ux)+uy*test(uy)-test(u),0)");
  model.weak("weak1").intRule("ir1");
  model.weak("weak1").selection().geom(2).all();
  model.constr().create("constr1", new String[]{"sh1"});
  model.constr("constr1").create("f1");
  model.constr("constr1").feature("f1").set("constr",1,new String[]{"u"});
  model.constr("constr1").feature("f1").set("constrf",1,new String[]{"test(u)"});
  model.constr("constr1").feature("f1").selection().geom(1).set(1,2);
  model.study().create("std1");
  model.study("std1").create("stat", "Stationary");
  model.study("std1").run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 2);
  model.component('comp1').geom('geom1').create('sq1', 'Square');
  model.component('comp1').mesh.create('mesh1', 'geom1');
  model.component('comp1').mesh('mesh1').run;
  model.elementSet.create('es1');
  model.elementSet('es1').set('A', '!bndadj(3,4) || bndadj(1,2)');
  model.elementSet('es1').selection().geom(2).all;
  model.shape.create('sh1', 'material1');
  model.shape('sh1').create('f1', 'shlag');
  model.shape('sh1').feature('f1').set('basename', 'u').set('order', 1);
```

```
model.shape('sh1').selection.geom(2).all;
model.shape('sh1').elementSet('A');
model.field.create('field1', 'u');
model.field('field1').shape({'sh1'});
model.intRule.create('ir1', 'material1');
model.intRule('ir1').create('o2').order(2);
model.weak.create('weak1');
model.weak('weak1').weak('if(A,ux*test(ux)+uy*test(uy)-test(u),0)');
model.weak('weak1').intRule('ir1');
model.weak('weak1').selection().geom(2).all;
model.constr.create('constr1', {'sh1'});
model.constr('constr1').create('f1');
model.constr('constr1').feature('f1').set('constr',1,{'u'});
model.constr('constr1').feature('f1').set('constrf',1,{'test(u)'});
model.constr('constr1').feature('f1').selection().geom(1).set([1,2]);
model.study.create('std1');
model.study('std1').create('stat', 'Stationary');
model.study('std1').run;
```

#### **SEE ALSO**

model.shape()

# *model.externalInterface*

Create an external interface for cosimulation with Simulink, for example.

#### **SYNTAX**

```
model.externalInterface().create(<tag>,<type>);
model.externalInterface(<tag>).set(<property>,<value>);
model.externalInterface(<tag>).run();
```

## **DESCRIPTION**

model.externalInterface().create(<tag>,<*type>*) creates an extra dimension feature of the given type. The supported type is SimulinkCosimulation for a cosimulation with Simulink.

model.externalInterface(*<tag>*).set(*<property>*,*<value>*) specifies properties relevant for the selected external interface type.

model.externalInterface(*<tag>*).run() exports a file from the external interface.

# *model.extraDim()*

Create attachments of extra dimensions.

# **SYNTAX**

```
model.extraDim().create(<tag>,<type>);
model.extraDim(<tag>).set(<property>,<value>);
model.extraDim(<tag>).model(<mtag>);
model.extraDim(<tag>).selection();
model.extraDim(<tag>).selection("point");
model.extraDim(<tag>).getType(<property>);
model.extraDim(<tag>).model();
```

#### **DESCRIPTION**

model.extraDim().create(*<tag>*,*<type>*) creates an extra dimension feature of the given type. The supported types are AttachDimension, PointsToAttach, and Integration.

model.extraDim(*<tag>*).set(*<property>*,*<value>*) specifies properties relevant for the selected extra dimension feature type.

- **•** Properties for AttachDimension: extradim
- **•** PointsToAttach has no properties.
- **•** Properties for Integration: opname, intrule, intorder, frame, axisym

model.extraDim(*<tag>*).model(*<mtag>*) sets the model component node. For features of type AttachDimension, this defines the base model component node. For features of type PointsToAttach and Integration, this defines the extra dimension component node.

```
model.extraDim(<tag>).selection();
```

Returns the selection of the feature (for features of type AttachDimension and Integration).

model.extraDim(<tag>).selection("point") returns the selection of points to attach (for features of type PointsToAttach).

```
model.extraDim(<tag>).getType(<property>) returns the value of the specified property.
```

model.extraDim(*<tag>*).model() returns the model component node tag.

```
model.field()
```

Create and define properties for fields with shape functions that defined field variables.

## **SYNTAX**

```
model.field().create(<tag>,<fname>);
model.field(<tag>).field(<fname>);
model.field(<tag>).shape(<shlist>);
model.field(<tag>).field();
model.field(<tag>).shape();
model.field(<tag>).geom();
```

#### **DESCRIPTION**

model.field().create(*<tag>*,*<fname>*) creates a field with tag *<tag>* with the field name *<fname>*.

```
model.field(<tag>).field(<fname>) sets the field name.
```

model.field(*<tag>*).shape(*<shlist>*) sets the shape functions defining the field variables. *<shlist>* is a list of shape function tags. Each shape function defines one or more field variables. Together the shape functions specify which field variables there are in the field.

```
model.field(<tag>).field() returns the field name as a string.
```

```
model.field(<tag>).shape() returns the shape function tags as a string array.
```

model.field(*<tag>*).geom() returns the geometry associated with the field.

## **SEE ALSO**

```
model.shape(), model.coeff()
```

# *model.form()*

Create settings forms for use in the Model Builder.

#### **SYNTAX**

```
model.form().create(<tag>,<fname>);
model.form(<tag>).update();
```

#### **DESCRIPTION**

model.form().create(*<tag>*,*<fname>*) creates a new form instance using the Application Builder Form Feature with the tag *<fname>*.

model.form(*<tag>*).update() updates the Settings Form instance *<tag>* with the current definition of the Application Builder Form Feature it references.

To change the value of an input field in a settings form you can change the value of the source data tied to the input field and let the data binding update the value of the input field.

#### **SEE ALSO**

```
model.methodCall()
```

```
model.frame()
```

Create and define properties for different types of frames: spatial frames, material frames, mesh frames, and geometry frames.

#### **SYNTAX**

```
model.frame().create(<tag>,<gtag>);
model.frame(<tag>).coord(<coordlist>);
model.frame(<tag>).coord(<pos>,<coord>);
model.frame(<tag>).meshFrame();
model.frame(<tag>).materialFrame();
model.frame(<tag>).geometryFrame();
model.frame(<tag>).spatialFrame();
model.frame(<tag>).sshape.create(<stag>,type);
model.frame(<tag>).sshape(<stag>).type(type);
model.frame(<tag>).sshape(<stag>).sorder(order);
model.frame(<tag>).sshape(<stag>).coorddof(<dofs>);
model.frame(<tag>).sshape(<stag>).coorddof(<pos>,<dof>);
model.frame(<tag>).sshape(<stag>).refframe(<ftag>);
model.frame(<tag>).sshape(<stag>).coordexpr(<exprs>);
model.frame(<tag>).sshape(<stag>).coordexpr(<pos>,<expr>);
model.frame(<tag>).coord();
model.frame(<tag>).identifier();
model.frame(<tag>).varNameSuffix();
model.frame(<tag>).geom();
model.frame(<tag>).isMeshFrame();
model.frame(<tag>).isGeometryFrame();
model.frame(<tag>).isMaterialFrame();
model.frame(<tag>).isSpatialFrame();
model.frame(<tag>).sshape(<stag>).type();
model.frame(<tag>).sshape(<stag>).sorder();
model.frame(<tag>).sshape(<stag>).coorddof();
model.frame(<tag>).sshape(<stag>).refframe();
model.frame(<tag>).sshape(<stag>).coordexpr();
```

# **DESCRIPTION**

```
model.frame().create(<tag>,<gtag>) creates a new frame and assigns it to geometry <gtag>.
```

model.frame(*<tag>*).coord(*<coordlist>*) defines *<coordlist>* as a list of independent variables. (Formerly sdim.)

model.frame(*<tag>*).coord(*<pos>*,*<coord>*) edits the coordinate at position *<pos>* in the coordinate list.

model.frame(*<tag>*).meshFrame() sets this frame to be the mesh frame. Each geometry requires exactly one mesh frame. The first one added becomes the mesh frame. When assigning one frame to be the mesh frame, this flag is cleared in the previous frame being the mesh frame.

model.frame(*<tag>*).geometryFrame() sets this frame to be the geometry frame. Each geometry requires exactly one geometry frame. The first one added becomes the geometry frame. When assigning one frame to be the geometry frame, this flag is cleared in the previous frame being the geometry frame.

model.frame(*<tag>*).materialFrame() sets this frame to be the material frame. Each geometry requires exactly one material frame. The first one added becomes the material frame. When assigning one frame to be the material frame, this flag is cleared in the previous frame being the material frame.

model.frame(*<tag>*).spatialFrame() sets this frame to be the spatial frame. Each geometry requires exactly one spatial frame. The first one added becomes the spatial frame. When assigning one frame to be the spatial frame, this flag is cleared in the previous frame being the spatial frame.

model.frame(*<tag>*).sshape().create(*<stag>*,*type*) creates a frame feature of the given type. Possible types are fixed (default), moving\_abs, moving\_rel, and moving\_expr.

model.frame(*<tag>*).sshape(*<stag>*).type(*type*) sets the type of the frame feature.

model.frame(*<tag>*).sshape(*<stag>*).sorder(*order*) sets the geometry shape function for *<stag>* to *order*.

model.frame(*<tag>*).sshape(*<stag>*).coorddof(*<dofs>*) sets the spatial coordinates for *<stag>* when the moving\_rel type is used.

model.frame(*<tag>*).sshape(*<stag>*).coorddof(*<pos>*,*<dof>*) edits the coordinate name at position *<pos>* in the degree of freedom list.

model.frame(*<tag>*).sshape(*<stag>*).refframe(*<ftag>*) sets the reference frame for *<stag>* when the moving\_rel type is used.

model.frame(*<tag>*).sshape(*<stag>*).coordexpr(*<exprs>*) sets the expressions for the mesh displacement for *<stag>*.

model.frame(*<tag>*).sshape(*<stag>*).coordexpr(*<pos>*,*<expr>*) edits the expression at position *<pos>* in the expression list.

model.frame(*<tag>*).sshape(*<stag>*).selection().named(*<seltag>*) assigns the frame feature to the named selection *<seltag>*.

model.frame(*<tag>*).sshape(*<stag>*).selection().set(...) defines a local selection that assigns the frame feature to geometric entities. For a complete list of methods available under selection(), see

model.selection(). All types of selections are supported except the global one and selections containing interior mesh boundaries.

model.frame(*<tag>*).coord() returns the coordinate names as a string array.

model.frame(*<tag>*).identifier() returns the frame's identifier as a string.

model.frame(*<tag>*).varNameSuffix() returns the variable name suffix as a string.

model.frame(*<tag>*).geom() returns the geometry name as a string.

model.frame(*<tag>*).isMeshFrame() returns true if this frame is the mesh frame.

model.frame(*<tag>*).isGeometryFrame() returns true if this frame is the geometry frame.

model.frame(*<tag>*).isMaterialFrame() returns true if this frame is the material frame.

```
model.frame(<tag>).isSpatialFrame() returns true if this frame is the spatial frame.
model.frame(<tag>).sshape(<stag>).type() returns the type as a string.
model.frame(<tag>).sshape(<stag>).sorder() returns the spatial approximation order as an integer.
model.frame(<tag>).sshape(<stag>).coorddof() returns the spatial coordinates as a string array.
model.frame(<tag>).sshape(<stag>).refframe() returns the reference frame as a string.
model.frame(<tag>).sshape(<stag>).coordexpr() returns the spatial coordinate expressions as a string 
array.
model.frame(<tag>).sshape(<stag>).selection().named() returns the named selection tag.
model.frame(<tag>).sshape(<stag>).selection().getType() returns domain information. For available 
methods, see model.selection().
SEE ALSO
model.shape()
model.func()
```

Add different types of functions.

#### **SYNTAX**

```
model.func().create(<tag>,<type>);
model.func(<tag>).create(<tag>,<type>);
model.func(<tag>).createPlot(<pgtag>)
model.func(<tag>).label(<label>)
model.func(<tag>).model(<mtag>)
model.func(<tag>).set(property,<value>);
model.func(<tag>).set("funcname",<funcname>)
model.func(<tag>).discardData()
model.func(<tag>).importData()
model.func(<tag>).refresh()
model.func(<tag>).image()
model.func(<tag>).run()
model.func(<tag>).model()
model.func(<tag>).getType(property);
model.func(<tag>).functionNames()
```

#### **DESCRIPTION**

model.func().create(*<tag>*,*<type>*) creates a new function of type *<type>* with the tag *<tag>*. The types can be one of the following strings: Analytic, Interpolation, Piecewise, GaussianPulse, Ramp, Rectangle, Step, Triangle, Wave, NormalDistribution, Random, External, MATLAB (requires LiveLink™ *for* MATLAB®), Elevation, Image, LeastSquares, GaussianProcess (requires the Uncertainty Quantification Module to create and train but not to use a created and trained function), PolynomialChaosExpansion (requires the Uncertainty Quantification Module to create and train but not to use a created and trained function), DNN, and PartialFractionFit. In addition, model.create(*<tag>*,"FunctionSwitch") creates a function switch. You can add other functions to a function switch:

```
model.func().create("sw1", "FunctionSwitch");
model.func("sw1").create("int1", "Interpolation");
model.func("sw1").create("an1", "Analytic");
model.func("sw1").create("rn1", "Random");
```

Use model.func("sw1").set("definecases", true); to instantiate all functions for all cases in a function sweep. By default, not all of them are instantiated.

model.func(*<tag>*).createPlot(*<pgtag>*) creates a plot group with the tag *pgtag* with a plot of the function. The method returns the plot group.

model.func(*<tag>*).label(*<label>*) sets a label for the function.

model.func(*<tag>*).model(*<mtag>*) sets the model component node of the function.

model.func(*<tag>*).set(*property*,*<value>*) sets the value of a property of the function. See the available properties for each type of function below.

model.func(*<tag>*).set("funcname",*<funcname>*) sets the operator name of the function. The default operator name is *<tag>*.

model.func(*<tag>*).model() returns the model component node tag.

model.func(*<tag>*).get*Type*(*property*) retrieves a value of a function property.

model.func(*<tag>*).importData() imports the file that the function references into the model. This is possible for interpolation, elevation, and image functions. The importData() method also works for some physics features.

model.func(*<tag>*).discardData() discards the data imported with importData(). This is possible for interpolation, elevation, and image functions. The discardData() method also works for some physics features.

model.func(*<tag>*).refresh() reevaluates the file for functions that read files (Elevation, Image, and Interpolation).

Use the model.func(<tag>).image() methods for plotting and exporting images showing plots of the functions. See Plotting and Exporting Images.

model.func(<tag).run() performs optimization or training for functions that need to process their input data before they can be evaluated (Least-Squares Fit, Gaussian Process, Polynomial Chaos Expansion, and DNN).

model.func(*<tag>*).functionNames() returns an array containing the function names that the function feature defines. Most functions always return an array of length one, but interpolation function features, for example, can define an arbitrary number of function names.

Function features can have associated problem features. To access the list of problem features for a function feature, use:

```
model.func(<tag>).problem();
```

To access a specific problem feature, use:

```
model.func(<tag>).problem(<problem_tag>);
```

![](_page_83_Picture_17.jpeg)

For functions on the component level, use the same syntax but add the component level, such as model.component(*<ctag>*).func().create(*<tag>*,*<type>*)

![](_page_83_Picture_19.jpeg)

When using a local table the interpolation function uses the funcname property to set the function name. When the data comes from a file or a result table, the name is specified in the funcs string matrix property. This is necessary because there can be more than one function.

What properties that are available depends on the type of function. The following function types are available:

# *Analytic*

Create an *analytic* function using a symbolic expression.

TABLE 2-82: ANALYTIC PROPERTIES.

| NAME          | VALUE                 | DEFAULT      | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                 |
|---------------|-----------------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| argders       | Nx2 String array      | {}           | (argument, partial derivative) pairs if dermethod is<br>manual.                                                                                                                                                                                                                                                                                                                                             |
| args          | String array          | {}           | The arguments to the function.                                                                                                                                                                                                                                                                                                                                                                              |
| complex       | boolean               | false        | True if the function can produce complex results<br>for real inputs.                                                                                                                                                                                                                                                                                                                                        |
| dermethod     | automatic  <br>manual | Automatic    | Automatic differentiation or manual control over<br>the derivatives.                                                                                                                                                                                                                                                                                                                                        |
| expr          | String                | None         | The expression defining the function.                                                                                                                                                                                                                                                                                                                                                                       |
| funcname      | String                | The tag name | The name of the function.                                                                                                                                                                                                                                                                                                                                                                                   |
| periodic      | boolean               | false        | True if the function should be extended to a<br>periodic function.                                                                                                                                                                                                                                                                                                                                          |
| periodiclower | String                | 0            | The lower limit of the interval that is extended<br>periodically.                                                                                                                                                                                                                                                                                                                                           |
| periodicupper | String                | 1            | The upper limit of the interval that is extended<br>periodically.                                                                                                                                                                                                                                                                                                                                           |
| plotargs      | N-by-3 array          |              | Contains one row for each function argument. Each<br>row contains the argument name, the lower limit<br>for plotting, and the upper limit for plotting.                                                                                                                                                                                                                                                     |
| plotaxis      | boolean array         | {}           | Contains one value for each function argument. A<br>false value means that the corresponding function<br>argument will be constant when plotting. The<br>constant value is taken from the lower limit value in<br>the plotargs property. Constant arguments do no<br>use an axis in the plot. Up to 3 axes are supported<br>when plotting. Specify using<br>setIndex("plotaxis", false, 2), for<br>example. |
| pname         | String array          | {}           | Local parameter names, using setIndex.                                                                                                                                                                                                                                                                                                                                                                      |
| plist         | String array          | {}           | Local parameter expressions, using setIndex.                                                                                                                                                                                                                                                                                                                                                                |
| argunit       | String                |              | A comma-separated list of required units for each<br>argument.                                                                                                                                                                                                                                                                                                                                              |
| fununit       | String                |              | The unit of the function's result.                                                                                                                                                                                                                                                                                                                                                                          |

# *Interpolation*

Generate an *interpolation* function. You can use several interpolation and extrapolation methods.

TABLE 2-83: INTERPOLATION PROPERTIES.

| NAME         | VALUE         | DEFAULT | DESCRIPTION                                                                                                                                                                         |
|--------------|---------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| defineinv    | on   off      | off     | If source is set to table: Whether to<br>define the inverse function.                                                                                                               |
| definerandom | on   off      | off     | Whether to define a random function.                                                                                                                                                |
| defvars      | boolean       | false   | If source is file and defvars is set to<br>true, the spatial coordinate variables are<br>used as default arguments to the function if<br>no arguments are supplied in a call to it. |
| dseparator   | point   comma | point   | Decimal separator in interpolation data file,<br>when source is set to file.                                                                                                        |

TABLE 2-83: INTERPOLATION PROPERTIES.

| NAME            | VALUE                                                  | DEFAULT      | DESCRIPTION                                                                                                                                                                        |
|-----------------|--------------------------------------------------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| extrap          | none   const   interior<br>  linear   value            | const        | The extrapolation method.                                                                                                                                                          |
| extrapvalue     | double                                                 | 0            | The extrapolation value if extrap is set to<br>value.                                                                                                                              |
| filename        | String                                                 |              | The file that contains the data if source is<br>set to file.                                                                                                                       |
| frame           | String                                                 | spatial      | Frame used for defining the spatial<br>coordinates if defvars is set to true.                                                                                                      |
| funcinvname     | String                                                 |              | If source is table and defineinv is on: The<br>name of the inverse function.                                                                                                       |
| funcname        | String                                                 | The tag name | The name of the function if source is<br>table or function.                                                                                                                        |
| funcnametable   | String matrix                                          |              | Used if source is file: the first column<br>contains function names and the second<br>column contains the positions in the file<br>where the corresponding function is<br>defined. |
| interp          | neighbor   linear  <br>piecewisecubic  <br>cubicspline | linear       | The interpolation method.                                                                                                                                                          |
| leftend         | double                                                 | 0            | The left end of the range for the random<br>function, if randomrange = manual.                                                                                                     |
| modelres        | String                                                 |              | If sourcetype is model, specifies the model<br>resource that contains the interpolation<br>data                                                                                    |
| nargs           | integer (1-3)                                          | 1            | The number of function arguments if struct<br>is spreadsheet or source is resultTable.                                                                                             |
| plotleftextrap  | boolean                                                | true         | Include left extrapolation in plots.                                                                                                                                               |
| plotrightextrap | boolean                                                | true         | Include right extrapolation in plots.                                                                                                                                              |
| points          | positive integer                                       | 1000         | The number of uniform sampling points, if<br>sampling is set to uniform.                                                                                                           |
| primfunname     | String                                                 |              | Define a primitive function with the name<br>give as primfunname.                                                                                                                  |
| randomname      | String                                                 |              | Define a primitive function with the name<br>give as primfunname.                                                                                                                  |
| randomnargs     | integer                                                | 1            | The number of arguments for the random<br>function.                                                                                                                                |
| randomrange     | automatic manual                                       | automatic    | Whether to define a range for the random<br>function.                                                                                                                              |
| reinterp        | boolean                                                | false        | If true, reinterpolate interpolation data on<br>computational mesh. Available if defvars is<br>true and frame is set to mesh.                                                      |
| reinterporder   | positive integer                                       | 1            | Lagrange shape function order for<br>reinterpolation, if reinterp is set to true.                                                                                                  |
| resultTable     | String                                                 |              | The tag of the result table to use (tbl1, for<br>example).                                                                                                                         |
| rightend        | double                                                 | 1            | The right end of the range for the random<br>function, if randomrange = manual.                                                                                                    |

TABLE 2-83: INTERPOLATION PROPERTIES.

| NAME       | VALUE                                    | DEFAULT     | DESCRIPTION                                                                                                                                                                        |
|------------|------------------------------------------|-------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| sampling   | automatic   uniform                      |             | Sampling type: automatic (uniform with<br>1000 sampling points) or uniform.                                                                                                        |
| scaledata  | auto   on   off                          | auto        | Apply scaling of data if the bounding box of<br>the interpolation points has a bad aspect<br>ratio (auto), always apply the scaling (on),<br>or turn off scaling altogether (off). |
| source     | table   file  <br>resultTable   function | table       | If sourcetype is user, specifies whether<br>the data is entered in a local table, read<br>from a file, taken from a results table, or is<br>based on another function.             |
| sourcetype | model   user                             | user        | Specifies if the data for the function is<br>stored in the model or provided by the<br>user.                                                                                       |
| scrfun     | String                                   |             | Name (tag) of the function used as source<br>when source is set to function.                                                                                                       |
| scrfunname | String                                   |             | Function name of the function used as<br>source when source is set to function.                                                                                                    |
| struct     | grid   sectionwise  <br>spreadsheet      | spreadsheet | The data format if source is set to file.                                                                                                                                          |
| table      | Nx2 String array                         | Empty       | Contains the point/value pairs if source is<br>set to table.                                                                                                                       |
| argunit    | String                                   |             | A comma-separated list of required units<br>for each argument.                                                                                                                     |
| fununit    | String                                   |             | The unit of the function's result.                                                                                                                                                 |
| argtrans   | none   logarithmic                       | none        | No or logarithmic transformation of the<br>argument.                                                                                                                               |
| valtrans   | none   logarithmic                       | none        | No or logarithmic transformation of the<br>function.                                                                                                                               |

# *Piecewise*

Generate a *piecewise* interpolation function, which is created by splicing together several functions, each defined on one interval.

TABLE 2-84: PIECEWISE PROPERTIES.

| NAME        | VALUE                                            | DEFAULT      | DESCRIPTION                                                         |
|-------------|--------------------------------------------------|--------------|---------------------------------------------------------------------|
| arg         | String                                           | x            | The argument to the function.                                       |
| extrap      | const   interior  <br>none   periodic  <br>value | const        | The extrapolation method.                                           |
| extrapvalue | double                                           | 0            | The extrapolation value if extrap is value.                         |
| funcname    | String                                           | The tag name | The name of the function.                                           |
| pieces      | N-by-3 String array                              | Empty        | (left, right, expression) for each interval.                        |
| pname       | String array                                     | {}           | Local parameter names, using setIndex.                              |
| plist       | String array                                     | {}           | Local parameter expressions, using setIndex.                        |
| smooth      | none   cont   contd1  <br>contd2                 | none         | The type of smoothing.                                              |
| smoothzone  | double                                           | 0.1          | The relative size of the smoothing zone if smoothing is<br>enabled. |

TABLE 2-84: PIECEWISE PROPERTIES.

| NAME    | VALUE  | DEFAULT | DESCRIPTION                                                    |
|---------|--------|---------|----------------------------------------------------------------|
| argunit | String |         | A comma-separated list of required units for each<br>argument. |
| fununit | String |         | The unit of the function's result.                             |

#### *GaussianPulse*

Generate a *Gaussian pulse* function. This function is the common bell-shaped curve (Gaussian function).

TABLE 2-85: GAUSSIAN PULSE PROPERTIES.

| NAME          | VALUE              | DEFAULT      | DESCRIPTION                                                   |
|---------------|--------------------|--------------|---------------------------------------------------------------|
| baseline      | double             | 0            | The baseline for the function.                                |
| funcname      | String             | The tag name | The name of the function.                                     |
| integralvalue | double             | 1            | The integral value, when normalization is set to integral.    |
| location      | String             | 0            | Where the pulse peaks.                                        |
| peakvalue     | double             | 1            | The peak value, when normalization is set to peak.            |
| sigma         | String             | 1            | The standard deviation of the underlying normal distribution. |
| normalization | integral  <br>peak | integral     | The normalization method to use.                              |

#### *Ramp*

Generate a *ramp* function.

TABLE 2-86: RAMP PROPERTIES.

| NAME                   | VALUE   | DEFAULT      | DESCRIPTION                                                                                |
|------------------------|---------|--------------|--------------------------------------------------------------------------------------------|
| baseline               | double  | 0            | The baseline for the function.                                                             |
| cutoffactive           | boolean | false        | If true, then the ramp ends when it reaches the cutoff<br>value.                           |
| cutoff                 | double  | 1            | If cutoffactive is true, the level where the ramp ends.                                    |
| funcname               | String  | The tag name | The name of the function.                                                                  |
| location               | String  | 0            | Where the ramp starts.                                                                     |
| slope                  | String  | 1            | The slope of the ramp.                                                                     |
| ncontder               | 1 or 2  | 2            | The number of continuous derivatives if smoothing is<br>enabled.                           |
| smoothzonecutoffactive | boolean | false        | Smooth the transition where the ramp ends at the<br>cutoff.                                |
| smoothzonelocactive    | boolean | false        | Smooth the transition where the ramp starts.                                               |
| smoothzonecutoff       | double  | 0.1          | The relative size of the smoothing zone for the cutoff,<br>if smoothing is enabled.        |
| smoothzoneloc          | double  | 0.1          | The relative size of the smoothing zone where the<br>ramp starts, if smoothing is enabled. |

## *Rectangle*

Generate a *rectangle*-shaped function.

TABLE 2-87: RECTANGLE PROPERTIES.

| NAME      | VALUE  | DEFAULT      | DESCRIPTION                     |
|-----------|--------|--------------|---------------------------------|
| amplitude | double | 1            | The amplitude for the function. |
| baseline  | double | 0            | The baseline for the function.  |
| funcname  | String | The tag name | The name of the function.       |
| lower     | String | -0.5         | Where the high zone begins.     |

TABLE 2-87: RECTANGLE PROPERTIES.

| NAME       | VALUE   | DEFAULT | DESCRIPTION                                                         |
|------------|---------|---------|---------------------------------------------------------------------|
| ncontder   | 1 or 2  | 2       | The number of continuous derivatives if smoothing is enabled.       |
| smooth     | boolean | true    | Smooth the transitions?                                             |
| smoothzone | String  | 0.1     | The size of the smoothing zone on both sides of the<br>transitions. |
| upper      | String  | 0.5     | Where the high zone ends.                                           |

#### *Step*

Generate a *step* function.

TABLE 2-88: STEP PROPERTIES.

| NAME        | VALUE                       | DEFAULT      | DESCRIPTION                                                                       |
|-------------|-----------------------------|--------------|-----------------------------------------------------------------------------------|
| baseline    | double                      | 0            | The baseline for the function.                                                    |
| from        | String                      | 0            | The value to the left of the location.                                            |
| funcname    | String                      | The tag name | The name of the function.                                                         |
| location    | String                      | 0            | Where the step is located.                                                        |
| locationdef | beginning  <br>middle   end | middle       | Location for the smoothing: beginning of step, middle of step,<br>or end of step. |
| ncontder    | 1 or 2                      | 2            | The number of continuous derivatives if smoothing is enabled.                     |
| smooth      | boolean                     | true         | Smooth the transition?                                                            |
| smoothzone  | String                      | 0.1          | The size of the smoothing zone on both sides of location.                         |
| to          | String                      | 1            | The value to the right of the location.                                           |

#### *Triangle*

Generate a *triangle*-shaped function.

TABLE 2-89: TRIANGLE PROPERTIES.

| NAME       | VALUE   | DEFAULT      | DESCRIPTION                                                   |
|------------|---------|--------------|---------------------------------------------------------------|
| amplitude  | double  | 1            | The amplitude for the function.                               |
| baseline   | double  | 0            | The baseline for the function.                                |
| funcname   | String  | The tag name | The name of the function.                                     |
| lower      | String  | -0.5         | Where the high zone begins.                                   |
| ncontder   | 1 or 2  | 2            | The number of continuous derivatives if smoothing is enabled. |
| smooth     | boolean | true         | Smooth the transitions.                                       |
| smoothzone | String  | 0.1          | Size of smoothing zone on both sides of the transitions.      |
| upper      | String  | 0.5          | Where the high zone ends.                                     |

# *Wave*

Use a *wave* function to generate a wave-shaped function (waveform). The wave shape can be a sawtooth, sine wave, square wave, or triangle wave.

TABLE 2-90: WAVE PROPERTIES.

| NAME      | VALUE  | DEFAULT | DESCRIPTION                                                  |
|-----------|--------|---------|--------------------------------------------------------------|
| amplitude | String | 1       | The amplitude for the function.                              |
| baseline  | String | 0       | The baseline for the function.                               |
| delay     | String | 2*2*pi  | The delay in the modulation, if modul is set to<br>gaussian. |

TABLE 2-90: WAVE PROPERTIES.

| NAME       | VALUE                                  | DEFAULT      | DESCRIPTION                                                                                                                                                                                                                                                   |
|------------|----------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| dutycycle  | String                                 | 0.5          | The duty cycle of the function (a value between 0 and<br>1). Available for Square functions (as the fraction of a<br>period that the function has the high value) and for<br>Triangle functions (as the fraction of a period that the<br>function is rising). |
| funcname   | String                                 | The tag name | The name of the function.                                                                                                                                                                                                                                     |
| modul      | none   gaussian                        | none         | No modulation or Gaussian modulation, if type is<br>set to sine.                                                                                                                                                                                              |
| ncontder   | 1 or 2                                 | 2            | The number of continuous derivatives if smoothing is<br>enabled.                                                                                                                                                                                              |
| period     | String                                 | 2*pi         | The period.                                                                                                                                                                                                                                                   |
| phase      | String                                 | 0            | The phase.                                                                                                                                                                                                                                                    |
| sigma      | String                                 | 0.5/(2*pi)   | The standard deviation for the modulation, if modul<br>is set to gaussian.                                                                                                                                                                                    |
| smooth     | boolean                                | true         | Smooth the transitions. (Only used for wave forms<br>with discontinuous function values or derivatives.)                                                                                                                                                      |
| smoothzone | String                                 | 0.1          | The size of smoothing zone on both sides of the<br>transitions.                                                                                                                                                                                               |
| type       | sawtooth   sine  <br>square   triangle | sine         | The type of waveform.                                                                                                                                                                                                                                         |

*NormalDistribution*

Generate a *normal distribution* function.

TABLE 2-91: NORMAL DISTRIBUTION PROPERTIES.

| NAME           | VALUE               | DEFAULT                    | DESCRIPTION                                     |
|----------------|---------------------|----------------------------|-------------------------------------------------|
| cumfuncname    | String              | The tag name +<br>_cum     | The name of the cumulative function.            |
| funcname       | String              | The tag name               | The name of the function.                       |
| invcumfuncname | String              | The tag name +<br>_cum_inv | The name of the quantile function.              |
| mean           | double              | 0                          | The mean of the function.                       |
| nargs          | positive<br>integer | 1                          | The number of arguments to the random function. |
| randomname     | String              | rn_ + the tag<br>name      | The name of the random function.                |
| seed           | positive<br>integer |                            | A seed for the random function.                 |
| seedactive     | boolean             | false                      | Use a custom random seed?                       |
| sigma          | double              | 1                          | The standard deviation of the function.         |

#### *Random*

Generate a *random* function. The random function can have a uniform or normal distribution.

TABLE 2-92: RANDOM PROPERTIES.

| NAME     | VALUE   | DEFAULT      | DESCRIPTION               |
|----------|---------|--------------|---------------------------|
| funcname | String  | The tag name | The name of the function. |
| mean     | String  | 0            | The average value.        |
| nargs    | integer | 1            | The number of arguments.  |

TABLE 2-92: RANDOM PROPERTIES.

| NAME         | VALUE                   | DEFAULT                            | DESCRIPTION                                  |
|--------------|-------------------------|------------------------------------|----------------------------------------------|
| normalsigma  | String                  | 1                                  | The standard deviation if type is Normal.    |
| seed         | String                  | Unique for each<br>random function | Random seed, if seedtype is set to manual.   |
| seedactive   | boolean                 | false                              | If true, the random seed will be used.       |
| seedtype     | manual  <br>currenttime | manual                             | The random seed type, if seedactive is true. |
| type         | uniform  <br>normal     | uniform                            | The distribution type.                       |
| uniformrange | String                  | 1                                  | The range if type is Uniform.                |

## *External*

Generate an *external* function that interfaces to other external functions written in the C language.

TABLE 2-93: EXTERNAL PROPERTIES.

| NAME  | VALUE            | DEFAULT | DESCRIPTION                                                                      |
|-------|------------------|---------|----------------------------------------------------------------------------------|
| ders  | Nx3 string array |         | (function name, argument, partial derivative) triplets.                          |
| funcs | String array     |         | The functions defined by the library.                                            |
| init  | String           |         | The string that is sent to the library when the function feature is initialized. |
| path  | String           |         | The path to the shared library that defines the functions.                       |

An external function is a function defined in a shared library written by the user. The shared library must define the following three functions with C linkage:

- **•** int init(const char \*str) is called when the function is initialized with the string from the **Initialization data** field. It returns a nonzero value in case of success and zero in case of failure. This function might be called several times; it is always called before solving a model that uses the function.
- **•** int eval(const char \*func, int nArgs, const double \*\*inReal, const double \*\*inImag, int blockSize, double \*outReal, double \*outImag) is called for elementwise evaluation of the function func called with nArgs arguments of length blockSize. The array inReal contains the real parts of the arguments; it has length nArgs, and each element has length blockSize.
  - If the arguments are all-real, then inImag is null; otherwise, it contains the imaginary parts of the arguments. If the function evaluation is successful, 1 is returned if it resulted in an all-real array and 2 is returned if it resulted in a complex array. The function should return 0 in case of error. In case of a real result, the function values should be written to the array outReal. In case of a complex result, the real parts of the function should be written to outReal and the imaginary parts to outImag. The outReal and outImag arrays both have length blockSize. All matrices are allocated and deallocated by COMSOL.
- **•** const char \*getLastError() returns the last error that has occurred. A null or empty string is returned if no error has occurred. Calling init() or eval() must set the last error string to "" or null. All memory allocation of this string is handled by the shared library. There is no localization of the error messages.

If you are using Microsoft Visual Studio to compile your library, you can declare the functions as \_\_declspec(dllexport) to export them from the DLL.

An example of a library that defines a function called extsinc that computes the sinc function (sin(*x*)/*x*):

```
#include <math.h>
#include <stdlib.h>
#include <string.h>
#ifdef _MSC_VER
#define EXPORT __declspec(dllexport)
#else
```

```
#define EXPORT
#endif
static const char *error = NULL;
EXPORT int init(const char *str) {
  return 1;
}
EXPORT const char * getLastError() {
  return error;
}
EXPORT int eval(const char *func,
                               int nArgs,
                               const double **inReal,
                               const double **inImag,
                               int blockSize,
                               double *outReal,
                               double *outImag) {
  if (strcmp("extsinc", func) == 0) {
    if (nArgs != 1) {
      error = "One argument expected";
      return 0;
    }
    for (int i = 0; i < blockSize; i++) {
      double x = inReal[0][i];
      outReal[i] = (x == 0) ? 1 : sin(x) / x;
    }
    return 1;
  }
  else {
    error = "Unknown function";
    return 0;
  }
}
```

To compile this function into a library, place it in ext.c and proceed as follows depending on platform:

![](_page_91_Picture_2.jpeg)

See <https://www.comsol.com/system-requirements>for information about supported compiler versions.

- **•** 64-bit Windows with Microsoft Visual Studio:
  - **-** Start Microsoft Visual Studio > Visual Studio Tools > Visual Studio x64 Win64 Command Prompt (2010) from the Windows Start Menu.
  - **-** cd to the directory that contains ext.c.
  - **-** cl /MT /c ext.c
  - **-** link /OUT:ext.dll /DLL ext.obj
- **•** 64-bit Linux with Intel Compiler:
  - **-** cd to the directory that contains ext.c.
  - **-** icc -fPIC -c ext.c
  - **-** icc -shared -fPIC -Wl,-z -Wl,defs -o ext.so ext.o -ldl

- **•** 64-bit Mac with Intel Compiler:
  - **-** cd to the directory that contains ext.c.
  - **-** icc -fPIC -c ext.c
  - **-** icc -dynamiclib -fPIC -o ext.dylib ext.o

For other compilers, refer to the compiler's documentation for instructions how to compile and create a shared library.

## *MATLAB*

Declare use of function in *MATLAB*. This requires the LiveLink™ *for* MATLAB®.

TABLE 2-94: MATLAB PROPERTIES.

| NAME  | VALUE            | DEFAULT | DESCRIPTION                                             |
|-------|------------------|---------|---------------------------------------------------------|
| ders  | Nx3 string array |         | (function name, argument, partial derivative) triplets. |
| funcs | String array     |         | The functions defined by MATLAB.                        |

#### *Elevation*

Generate an *elevation* function by importing geospatial elevation data from digital elevation models (DEM files).

TABLE 2-95: ELEVATION PROPERTIES.

| NAME        | VALUE                                | DEFAULT      | DESCRIPTION                                 |
|-------------|--------------------------------------|--------------|---------------------------------------------|
| extrap      | const   interior  <br>linear   value | const        | The extrapolation method.                   |
| extrapvalue | double                               | 0            | The extrapolation value if extrap is value. |
| filename    | String                               |              | The name of the DEM file.                   |
| funcname    | String                               | The tag name | The name of the function.                   |
| interp      | neighbor   linear                    | linear       | The interpolation method.                   |

#### *Image*

Generate an *image* function from a BMP, GIF, JPEG, PNG, or TIFF file.

TABLE 2-96: IMAGE PROPERTIES.

| NAME        | VALUE                                | DEFAULT | DESCRIPTION                                                                                     |
|-------------|--------------------------------------|---------|-------------------------------------------------------------------------------------------------|
| argunit     | String                               |         | The unit of the function arguments.                                                             |
| clipmaxx    | double                               | 1000    | If clipping is manual: The maximum pixel x-coordinate<br>that is kept.                          |
| clipminx    | double                               | 0       | If clipping is manual: The minimum pixel x-coordinate<br>that is kept.                          |
| clipmaxy    | double                               | 1000    | If clipping is manual: The maximum pixel y-coordinate<br>that is kept.                          |
| clipminy    | double                               | 0       | If clipping is manual: The minimum pixel y-coordinate<br>that is kept.                          |
| clipping    | none   manual                        | none    | The clipping method.                                                                            |
| extrap      | const   interior  <br>linear   value | const   | The extrapolation method.                                                                       |
| extrapvalue | double                               | 0       | The extrapolation value if extrap is value.                                                     |
| fununit     | String                               |         | The unit of the function value.                                                                 |
| filename    | String                               |         | The name of the DEM file.                                                                       |
| flipx       | boolean                              | false   | If inplace is false: Whether to flip the image horizontally<br>when mapping it to the xy-plane. |

TABLE 2-96: IMAGE PROPERTIES.

| NAME       | VALUE              | DEFAULT      | DESCRIPTION                                                                                                                    |
|------------|--------------------|--------------|--------------------------------------------------------------------------------------------------------------------------------|
| flipy      | boolean            | false        | If inplace is false: Whether to flip the image vertically<br>when mapping it to the xy-plane.                                  |
| funcname   | String             | The tag name | The name of the function.                                                                                                      |
| inplace    | boolean            | false        | If true, the image is mapped to the xy-plane without<br>scaling; 1 length unit corresponds to 1 pixel.                         |
| interp     | neighbor   linear  | linear       | The interpolation method.                                                                                                      |
| manualexpr | String             | (r+g+b)/3    | If scaling is manual: The scaling function expressed in<br>terms of the red (r), green (g), and blue (b) pixel<br>intensities. |
| scaling    | automatic   manual | automatic    | The method used for computing function values from<br>pixel colors.                                                            |
| xmax       | double             | 1            | If inplace is false: The maximum x-coordinate of the<br>region to which the image is mapped.                                   |
| xmin       | double             | 0            | If inplace is false: The minimum x-coordinate of the<br>region to which the image is mapped.                                   |
| ymax       | double             | 1            | If inplace is false: The maximum y-coordinate of the<br>region to which the image is mapped.                                   |
| ymin       | double             | 0            | If inplace is false: The minimum y-coordinate of the<br>region to which the image is mapped.                                   |

#### *LeastSquares*

Create a function based on a least-squares fit of the function's input data to a parameterized function.

TABLE 2-97: LEAST SQUARES PROPERTIES.

| NAME        | VALUE         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                           |
|-------------|---------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| args        | string array  | {}      | The argument names for the defined<br>function(s), as an array of alternating column<br>names from the input data and argument<br>names. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array. |
| columnType  | string array  | {}      | Defines the types of columns in the input<br>data, as an array of alternative column<br>names and column types. Valid column types<br>are none, arg, and value. See also the<br>description of the args property.                                     |
| dseparator  | point   comma | point   | Decimal separator in input data file, when<br>source is set to file.                                                                                                                                                                                  |
| exprs       | string array  | {}      | The expression for the defined function(s),<br>as an array of alternating column names<br>from the input data and expressions. Using<br>the setEntry, getEntryKeys,<br>getEntryKeyIndex methods makes it<br>easier to work with this array.           |
| filecolumns | integer       | 0       | Number of columns in the input data. This<br>property is updated automatically when<br>input data properties are changed.                                                                                                                             |

TABLE 2-97: LEAST SQUARES PROPERTIES.

| NAME        | VALUE                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                   |
|-------------|-------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| fileheaders | string array                  | {}      | Custom column names to be displayed in<br>the column settings table. This property is<br>updated automatically when file input data<br>properties are changed. Column header<br>names are taken from the last line in the file<br>that starts with a '%' character. The line is<br>split on "<br>" (double space), tab character,<br>and comma character, and each part is used<br>as one custom column name. |
| filename    | string                        |         | The file that contains the data if source is<br>file.                                                                                                                                                                                                                                                                                                                                                         |
| lbound      | double                        |         | The lower bound for parameters, if used.<br>Set using setIndex.                                                                                                                                                                                                                                                                                                                                               |
| ubound      | double                        |         | The upper bound for parameters, if used.<br>Set using setIndex.                                                                                                                                                                                                                                                                                                                                               |
| unit        | string array                  | {}      | The units for the arguments and function<br>values, as an array of alternating column<br>names from the input data and unit<br>expressions. See also the description of the<br>args property.                                                                                                                                                                                                                 |
| pname       | string                        |         | Parameter name, set using setIndex.                                                                                                                                                                                                                                                                                                                                                                           |
| plist       | double                        |         | Parameter value, set using setIndex.                                                                                                                                                                                                                                                                                                                                                                          |
| resultTable | string                        |         | The results table that contains the data if<br>source is resultTable.                                                                                                                                                                                                                                                                                                                                         |
| scale       | double                        | 1       | Scale for parameters, set using setIndex.                                                                                                                                                                                                                                                                                                                                                                     |
| source      | file   table  <br>resultTable | file    | Specifies whether the data is read from a<br>file, specified in a table, or taken from a<br>results table.                                                                                                                                                                                                                                                                                                    |
| table       | Nx2 String<br>array           | Empty   | Contains the argument/function value pairs<br>if the source is table.                                                                                                                                                                                                                                                                                                                                         |
| unit        | string array                  | {}      | The units for the arguments and function<br>values, as an array of alternating column<br>names from the input data and unit<br>expressions. See also the description of the<br>args property.                                                                                                                                                                                                                 |

## *GaussianProcess*

Generate a Gaussian process regression (Kriging) function. Creating or training a Gaussian process function requires the Uncertainty Quantification Module. Using an already created and trained Gaussian process function does not require the Uncertainty Quantification Module.

TABLE 2-98: GAUSSIAN PROCESS PROPERTIES.

| NAME         | VALUE                               | DEFAULT  | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                   |
|--------------|-------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| args         | string array                        | {}       | The argument names for the defined<br>function(s), as an array of alternating column<br>names from the input data and argument<br>names. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array.                                                                                                                                                         |
| columnType   | string array                        | {}       | Defines the types of columns in the input<br>data, as an array of alternative column<br>names and column types. Valid column types<br>are none, arg, and value. See also the<br>description of the args property.                                                                                                                                                                                             |
| covfunction  | se   matern32<br>  matern52  <br>nn | matern32 | Type of covariance function to use in the<br>Gaussian process regression. Use se for<br>Squared exponential, matern32 for Matérn<br>3/2, matern52 for Matérn 5/2 and nn for<br>Single-layer neural network.                                                                                                                                                                                                   |
| definestddev | boolean                             | false    | If true, the related error estimation<br>function(s) are made available.                                                                                                                                                                                                                                                                                                                                      |
| descr        | string array                        | {}       | The description for each function argument<br>and function value, as an array of alternating<br>function arguments or values and their<br>descriptions. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array.                                                                                                                                          |
| dseparator   | point   comma                       | point    | Decimal separator in input data file, when<br>source is set to file.                                                                                                                                                                                                                                                                                                                                          |
| filecolumns  | integer                             | 0        | Number of columns in the input data. This<br>property is updated automatically when<br>input data properties are changed.                                                                                                                                                                                                                                                                                     |
| fileheaders  | string array                        | {}       | Custom column names to be displayed in<br>the column settings table. This property is<br>updated automatically when file input data<br>properties are changed. Column header<br>names are taken from the last line in the file<br>that starts with a '%' character. The line is<br>split on "<br>" (double space), tab character,<br>and comma character, and each part is used<br>as one custom column name. |
| filename     | string                              |          | The file that contains the data if source is<br>file.                                                                                                                                                                                                                                                                                                                                                         |
| fraction     | double                              | 0.1      | The fraction of input data to set aside for<br>validation of the trained function(s). Used<br>when validation is one of random,<br>fraction, last.                                                                                                                                                                                                                                                            |

TABLE 2-98: GAUSSIAN PROCESS PROPERTIES.

| NAME                       | VALUE                            | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                    |
|----------------------------|----------------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| funcs                      | string array                     | {}        | The names of the defined function(s), as an<br>array of alternating column names from the<br>input data and function names. See also the<br>description of the args property.                                                                                                                                                                                                                                  |
| ignorenaninf               | boolean                          | false     | If true, causes lines in the training data that<br>contain any NaN or Inf values to be ignored.<br>If false, NaN and Inf values are treated as<br>an error.                                                                                                                                                                                                                                                    |
| lastinternalseed           | nonnegative<br>integer           | 1014      | Random number seed used for training the<br>function(s). Used when useseed is manual.                                                                                                                                                                                                                                                                                                                          |
| lastinternalseedtest       | nonnegative<br>integer           | 108714    | Random number seed used for validation of<br>the trained function(s). Used when<br>validation is random and useseedtest<br>is manual.                                                                                                                                                                                                                                                                          |
| manualrestarthypergpnumber | positive integer                 | 10        | Number of restart points for training. Use<br>more restart points to increase the chance<br>to find the global optimum during training.<br>Used when restarthypergp is manual.                                                                                                                                                                                                                                 |
| maxmatsize                 | positive integer                 | 2000      | Maximum number of allowed training data<br>points. More data points require more<br>memory and longer training time.                                                                                                                                                                                                                                                                                           |
| meanfunction               | const  <br>linear  <br>quadratic | const     | Defines the overall trend of the trained<br>function(s).                                                                                                                                                                                                                                                                                                                                                       |
| plotargs                   | N-by-3 array                     |           | Contains one row for each function<br>argument. Each row contains the argument<br>name, the lower limit for plotting, and the<br>upper limit for plotting.                                                                                                                                                                                                                                                     |
| plotaxis                   | boolean array                    | {}        | Contains one value for each function<br>argument. A false value means that the<br>corresponding function argument will be<br>constant when plotting. The constant value<br>is taken from the lower limit value in the<br>plotargs property. Constant arguments<br>do no use an axis in the plot. Up to 3 axes<br>are supported when plotting. Specify using<br>setIndex("plotaxis", false, 2), for<br>example. |
| plotfixedvalue             | double array                     | {}        | Contains one value for each function<br>argument. For arguments that do not have<br>an axis in the plot (see plotaxis), this<br>property specifies the fixed value to use in<br>the plot.                                                                                                                                                                                                                      |
| plotfuncname               | string                           |           | The name of the function whose value<br>should be plotted.                                                                                                                                                                                                                                                                                                                                                     |
| restarthypergp             | automatic  <br>manual            | automatic | Controls how the number of restart points<br>during training is determined. If automatic,<br>the number is calculated from the number<br>of function arguments. If manual, the<br>number is given by the<br>manualrestarthypergpnumber property.                                                                                                                                                               |

TABLE 2-98: GAUSSIAN PROCESS PROPERTIES.

| NAME           | VALUE                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                 |
|----------------|-------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| resultTable    | string                        |         | The results table that contains the data if<br>source is resultTable.                                                                                                                                                                                                       |
| source         | file  <br>resultTable         | file    | Specifies whether the data is read from a file<br>or taken from a results table.                                                                                                                                                                                            |
| stddevsuffix   | string                        | _stddev | Function name suffix to add to error<br>estimation functions. Used when<br>definestddev is true.                                                                                                                                                                            |
| testerrortable | none   new  <br>results table | none    | If validation is not none, specifies the<br>table where verification error summary is<br>stored. Use none to not generate the table<br>data. Use new to create a new table for the<br>data. Use a results table tag to store the<br>data in an existing table.              |
| testtable      | none   new  <br>results table | new     | If validation is not none, specifies the<br>table where detailed verification error<br>information is stored. Use none to not<br>generate the table data. Use new to create a<br>new table for the data. Use a results table<br>tag to store the data in an existing table. |
| unit           | string array                  | {}      | The units for the arguments and function<br>values, as an array of alternating column<br>names from the input data and unit<br>expressions. See also the description of the<br>args property.                                                                               |
| useseed        | manual  <br>currenttime       | manual  | Specifies how the random seed for training<br>is determined. If manual, the seed is given<br>by the lastinternalseed property. If<br>currenttime, the seed is computed from<br>the current time when training is started.                                                   |
| useseedtest    | manual  <br>currenttime       | manual  | Specifies how the random seed for<br>validation is determined. If manual, the<br>seed is given by the<br>lastinternalseedtest property. If<br>currenttime, the seed is computed from<br>the current time when training is started.                                          |

TABLE 2-98: GAUSSIAN PROCESS PROPERTIES.

| NAME            | VALUE                                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-----------------|-----------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| validation      | none   random<br>  fraction  <br>last   table | none    | Specifies what data to use for validation of<br>the trained function(s).<br>none: No validation is performed.<br>random: Use a random sample of the input<br>data and exclude the corresponding values<br>from the training data. The size of the<br>sample is fraction times the number of<br>input data points.<br>fraction: Use every 1/fraction values<br>from the input data and exclude the<br>corresponding values from the training data.<br>last: Use the last part of the input data and<br>exclude the corresponding values from the<br>training data. The size of the last part is<br>fraction times the number of input data<br>points. |
|                 |                                               |         | table: Use a results table as validation data.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| validationtable | string                                        |         | The results table to take validation data<br>from. Used when validation is table.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

Changes in the following properties take effect without retraining the function: definestddev, stddevsuffix, funcs, plotargs, and unit.

The *Uncertainty Quantification Module User's Guide* explains the theory behind Gaussian process regression. See Surrogate Models — Gaussian Process.

#### *PolynomialChaosExpansion*

Generate a *polynomial chaos expansion (PCE)* function. Creating or training a PCE function requires the Uncertainty Quantification Module. Using an already created and trained PCE function does not require the Uncertainty Quantification Module.

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME       | VALUE        | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                          |
|------------|--------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| args       | string array | {}      | The argument names for the defined<br>function(s), as an array of alternating column<br>names from the input data and argument<br>names. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array.                |
| columnType | string array | {}      | Defines the types of columns in the input<br>data, as an array of alternative column<br>names and column types. Valid column types<br>are none, arg, and value. See also the<br>description of the args property.                                                    |
| descr      | string array | {}      | The description for each function argument<br>and function value, as an array of alternating<br>function arguments or values and their<br>descriptions. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array. |

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME                  | VALUE                  | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                 |
|-----------------------|------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| distributionselection | string array           | {}      | Defines the probability distributions for the<br>function arguments, as an array of<br>alternative column names and distribution<br>types. Valid distribution types are uniform,<br>normal, lognormal, gamma, beta,<br>weibull, and gumbel. See also the<br>description of the args property.                                                                                                               |
| dseparator            | point   comma          | point   | Decimal separator in input data file, when<br>source is set to file.                                                                                                                                                                                                                                                                                                                                        |
| filecolumns           | integer                | 0       | Number of columns in the input data. This<br>property is updated automatically when<br>input data properties are changed.                                                                                                                                                                                                                                                                                   |
| fileheaders           | string array           | {}      | Custom column names to be displayed in<br>the column settings table. This property is<br>updated automatically when file input data<br>properties are changed. Column header<br>names are taken from the last line in the file<br>that starts with a '%' character. The line is<br>split on "<br>" (double space), tab character<br>and comma character and each part is used<br>as one custom column name. |
| filename              | string                 |         | The file that contains the data if source is<br>file.                                                                                                                                                                                                                                                                                                                                                       |
| fraction              | double                 | 0.1     | The fraction of input data to set aside for<br>validation of the trained function(s). Used<br>when validation is one of random,<br>fraction, last.                                                                                                                                                                                                                                                          |
| funcs                 | string array           | {}      | The names of the defined function(s), as an<br>array of alternating column names from the<br>input data and function names. See also the<br>description of the args property.                                                                                                                                                                                                                               |
| ignorenaninf          | boolean                | false   | If true, causes lines in the training data that<br>contain any NaN or Inf values to be ignored.<br>If false, NaN and Inf values are treated as<br>an error.                                                                                                                                                                                                                                                 |
| lastinternalseedtest  | nonnegative<br>integer | 108714  | Random number seed used for validation of<br>the trained function(s). Used when<br>validation is random and useseedtest<br>is manual.                                                                                                                                                                                                                                                                       |
| lboundselection       | string array           | {}      | Defines how the lower bounds of the valid<br>range for the function arguments are<br>determined, as an array of alternative<br>column names and CDF (cumulative<br>distribution function) values. Valid CDF<br>values are 0.3, 0.1, 0.01, 0.001, 1e-4,<br>1e-5, 1e-6, 1e-7, and manual. Not used if<br>distributionselection is uniform or<br>beta. See also the description of the args<br>property.       |
| maxmatsize            | positive integer       | 2000    | Maximum number of allowed training data<br>points. More data points require more<br>memory and longer training time.                                                                                                                                                                                                                                                                                        |

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME           | VALUE               | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                    |
|----------------|---------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| outofrange     | warning  <br>cancel | warning   | Decides how to handle out-of-range and<br>extrapolated training data. If outofrange is<br>cancel, the training is canceled. If<br>outofrange is warning, the training<br>continues, but a warning is added under the<br>function feature. In either case, details about<br>the problematic training data points are<br>logged in the log window.                                                               |
| pcesettings    | auto   manual       | automatic | If pcesettings is set to auto, the training<br>will automatically determine the required<br>polynomial degree needed to obtain suitable<br>accuracy. If pcesettings is set to manual,<br>the maximum polynomial degree is<br>determined by the polydegreespce and<br>qnorm settings.                                                                                                                           |
| plotargs       | N-by-3 array        |           | Contains one row for each function<br>argument. Each row contains the argument<br>name, the lower limit for plotting, and the<br>upper limit for plotting.                                                                                                                                                                                                                                                     |
| plotaxis       | boolean array       | {}        | Contains one value for each function<br>argument. A false value means that the<br>corresponding function argument will be<br>constant when plotting. The constant value<br>is taken from the lower limit value in the<br>plotargs property. Constant arguments<br>do no use an axis in the plot. Up to 3 axes<br>are supported when plotting. Specify using<br>setIndex("plotaxis", false, 2), for<br>example. |
| plotfixedvalue | double array        | {}        | Contains one value for each function<br>argument. For arguments that do not have<br>an axis in the plot (see plotaxis), this<br>property specifies the fixed value to use in<br>the plot.                                                                                                                                                                                                                      |
| plotfuncname   | string              |           | The name of the function whose value<br>should be plotted.                                                                                                                                                                                                                                                                                                                                                     |
| polydegreespce | positive integer    | 30        | The maximum polynomial degree to use<br>when pcesettings is set to manual. See<br>also the Uncertainty Quantification Module<br>User's Guide.                                                                                                                                                                                                                                                                  |
| qnorm          | double              | 0.5       | Controls the hyperbolic truncation of<br>polynomial terms used for functions having<br>more than one argument. Only used when<br>pcesettings is set to manual. See also<br>the Uncertainty Quantification Module<br>User's Guide.                                                                                                                                                                              |
| s1selection    | string array        | {}        | Defines the first probability distribution<br>parameter for the function arguments as an<br>array of alternative column names and<br>distribution parameters. Not used if<br>distributionselection is set to<br>uniform. See also the description of the<br>args property.                                                                                                                                     |

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME            | VALUE                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                         |
|-----------------|-------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| s2selection     | string array                  | {}      | Defines the second probability distribution<br>parameter for the function arguments as an<br>array of alternative column names and<br>distribution parameters. Not used if<br>distributionselection is set to<br>uniform. See also the description of the<br>args property.                                                                                                                                         |
| source          | file  <br>resultTable         | file    | Specifies whether the data is read from a file<br>or taken from a results table.                                                                                                                                                                                                                                                                                                                                    |
| surrogatetol    | double                        | 1e-3    | The tolerance used when deciding the<br>required polynomial degree of the trained<br>function. See also the Uncertainty<br>Quantification Module User's Guide.                                                                                                                                                                                                                                                      |
| testerrortable  | none   new  <br>results table | none    | If validation is not none, specifies the<br>table where verification error summary is<br>stored. Use none to not generate the table<br>data. Use new to create a new table for the<br>data. Use a results table tag to store the<br>data in an existing table.                                                                                                                                                      |
| testtable       | none   new  <br>results table | new     | If validation is not none, specifies the<br>table where detailed verification error<br>information is stored. Use none to not<br>generate the table data. Use new to create a<br>new table for the data. Use a results table<br>tag to store the data in an existing table.                                                                                                                                         |
| uboundselection | string array                  | {}      | Defines the upper bound of the valid input<br>range for the function arguments as an array<br>of alternative column names and upper<br>bounds. Only relevant if<br>distributionselection is set to<br>uniform or beta, or if ucdfselection is<br>set to manual. See also the description of<br>the args property.                                                                                                   |
| ucdfselection   | string array                  | {}      | Defines how the upper bounds of the valid<br>range for the function arguments are<br>determined as an array of alternative<br>column names and CDF (cumulative<br>distribution function) values. Valid CDF<br>values are 0.7, 0.9, 0.99, 0.999, 1-1e-4,<br>1-1e-5, 1-1e-6, 1-1e-7, and manual.<br>Not used if distributionselection is<br>set to uniform or beta. See also the<br>description of the args property. |
| unit            | string array                  | {}      | The units for the arguments and function<br>values, as an array of alternating column<br>names from the input data and unit<br>expressions. See also the description of the<br>args property.                                                                                                                                                                                                                       |

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME            | VALUE                       | DEFAULT | DESCRIPTION                                                                                                                                                                                                                        |
|-----------------|-----------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| useseedtest     | manual  <br>currenttime     | manual  | Specifies how the random seed for<br>validation is determined. If manual, the<br>seed is given by the<br>lastinternalseedtest property. If<br>currenttime, the seed is computed from<br>the current time when training is started. |
| validation      | none   random<br>  fraction | none    | Specifies what data to use for validation of<br>the trained function(s).                                                                                                                                                           |
|                 | last   table                |         | none: No validation is performed.                                                                                                                                                                                                  |
|                 |                             |         | random: Use a random sample of the input<br>data and exclude the corresponding values<br>from the training data. The size of the<br>sample is fraction times the number of<br>input data points.                                   |
|                 |                             |         | fraction: Use every 1/fraction values<br>from the input data and exclude the<br>corresponding values from the training data.                                                                                                       |
|                 |                             |         | last: Use the last part of the input data and<br>exclude the corresponding values from the<br>training data. The size of the last part is<br>fraction times the number of input data<br>points.                                    |
|                 |                             |         | table: Use a results table as validation data.                                                                                                                                                                                     |
| validationtable | string                      |         | The results table to take validation data<br>from. Used when validation is table.                                                                                                                                                  |

Changes in the following properties take effect without retraining the function: funcs, plotargs, unit.

The *Uncertainty Quantification Module User's Guide* explains the theory behind PCE. See Surrogate Models — Polynomial Chaos Expansion.

## *DNN*

Generate a *deep neural network* (DNN) function. A DNN function provides training and validation using a deep neural network (DNN) for use with surrogate model training, for example. Deep neural networks form a class of machine learning algorithms similar to the artificial neural network and aims to mimic the information processing of the brain.

TABLE 2-100: DEEP NEURAL NET PROPERTIES.

| NAME       | VALUE                                                                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                     |
|------------|-------------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| activation | array of the<br>following values:<br>tanh   none  <br>relu   elu  <br>sigmoid | {tanh}  | The activation function for the layers.                                                                                                                                                                                                         |
| args       | string array                                                                  | {}      | The argument names for the defined function(s),<br>as an array of alternating column names from the<br>input data and argument names. Using the<br>setEntry, getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this array. |
| batchsize  | positive integer                                                              | 512     | The batch size for the DNN training.                                                                                                                                                                                                            |

TABLE 2-100: DEEP NEURAL NET PROPERTIES.

| NAME              | VALUE                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                 |
|-------------------|-------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| descr             | string array                  | {}      | The description for each function argument and<br>function value, as an array of alternating function<br>arguments or values and their descriptions. Using<br>the setEntry, getEntryKeys,<br>getEntryKeyIndex methods makes it easier to<br>work with this array.                                                                                                                                           |
| epochs            | integer                       | 1000    | The number of epochs to train for. In each epoch<br>all input data is processed once.                                                                                                                                                                                                                                                                                                                       |
| filename          | string                        |         | The full filename of the data source, when source<br>is set to file.                                                                                                                                                                                                                                                                                                                                        |
| fraction          | scalar, 0–1                   | 0.1     | The validation data fraction.                                                                                                                                                                                                                                                                                                                                                                               |
| gputraining       | boolean                       | false   | Use a supported GPU for accelerated DNN<br>training.                                                                                                                                                                                                                                                                                                                                                        |
| ignorenaninf      | boolean                       | true    | Ignore data points that are NaN or Inf.                                                                                                                                                                                                                                                                                                                                                                     |
| layertype         | array of dense                | {dense} | The type of layer in the DNN.                                                                                                                                                                                                                                                                                                                                                                               |
| lr                | positive scalar               | 1e-3    | The learning rate for the training.                                                                                                                                                                                                                                                                                                                                                                         |
| loss              | mse   mae                     | mse     | The loss function; root-mean-square error or a<br>mean absolute error.                                                                                                                                                                                                                                                                                                                                      |
| momentum          | nonnegative scalar            | 0       | The momentum, if optmethod is set to sgd.                                                                                                                                                                                                                                                                                                                                                                   |
| optmethod         | adam   sgd                    | adam    | Training optimization method: Adam or a<br>stochastic gradient descent (SGD) method                                                                                                                                                                                                                                                                                                                         |
| outfeatures       | array of positive<br>integers | {1}     | The number of output features from a layer.                                                                                                                                                                                                                                                                                                                                                                 |
| plotargs          | N-by-3 array                  |         | Contains one row for each function argument.<br>Each row contains the argument name, the lower<br>limit for plotting, and the upper limit for plotting.                                                                                                                                                                                                                                                     |
| plotaxis          | boolean array                 | {}      | Contains one value for each function argument. A<br>false value means that the corresponding function<br>argument will be constant when plotting. The<br>constant value is taken from the lower limit value<br>in the plotargs property. Constant arguments<br>do no use an axis in the plot. Up to 3 axes are<br>supported when plotting. Specify using<br>setIndex("plotaxis", false, 2), for<br>example. |
| plotfixedvalue    | double array                  | {}      | Contains one value for each function argument.<br>For arguments that do not have an axis in the plot<br>(see plotaxis), this property specifies the fixed<br>value to use in the plot.                                                                                                                                                                                                                      |
| resultTable       | result table tag              |         | The result table to use as source, if source is set<br>to resultTable.                                                                                                                                                                                                                                                                                                                                      |
| rndseed           | double                        | 0       | The random seed for training, if useseed is set to<br>manual.                                                                                                                                                                                                                                                                                                                                               |
| rndseedvalidation | double                        | 0       | The random seed for validation, if<br>useseedvalidation is set to manual.                                                                                                                                                                                                                                                                                                                                   |
| source            | file  <br>resultTable         | file    | Specify whether the data source is read from a file<br>or taken from a results table.                                                                                                                                                                                                                                                                                                                       |

TABLE 2-100: DEEP NEURAL NET PROPERTIES.

| NAME              | VALUE                                  | DEFAULT | DESCRIPTION                                                                                                                                                                                                        |
|-------------------|----------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| useseed           | manual  <br>currenttime                | manual  | Specifies how the random seed for training is<br>determined. If manual, the seed is given by the<br>rndseed property. If currenttime, the seed is<br>computed from the current time when training is<br>started.   |
| useseedvalidation | manual  <br>currenttime                | manual  | Specifies how the random seed for validation is<br>determined. If manual, the seed is given by the<br>rndseed property. If currenttime, the seed is<br>computed from the current time when training is<br>started. |
| validation        | random  <br>fraction   last<br>  table | random  | The validation data: random sample of data values,<br>every N:th data value, last part of data values, or<br>taken from a separate table.                                                                          |
| validationtable   | table tag (string)                     |         | The tag of the table used as validation data, if<br>validation is set to table.                                                                                                                                    |
| weightdecay       | double                                 | 0       | Nonnegative number to penalize complexity by<br>adding the squares of all the parameters to the loss<br>function.                                                                                                  |

*PartialFractionFit*

Create an *partial fraction fit* function.

TABLE 2-101: PARTIAL FRACTION FIT PROPERTIES.

| NAME          | VALUE                   | DEFAULT      | DESCRIPTION                                                                                                      |
|---------------|-------------------------|--------------|------------------------------------------------------------------------------------------------------------------|
| asymterm      | double                  | 0            | Asymptotic term for the poles and residues.                                                                      |
| dseparator    | point   comma           | point        | Decimal separator in the data file, when source is set<br>to file.                                               |
| froissart     | boolean                 | false        | Automatically detect and remove Froissart doubles.                                                               |
| funcname      | String                  | The tag name | The name of the function.                                                                                        |
| iter          | positive integer        | 3            | The maximum number of iterations for the partial<br>fraction fit, if stopcondition is set to iter or<br>itertol. |
| source        | file  <br>resultTable   | file         | Specify whether the data source is read from a file or<br>taken from a results table.                            |
| stopcondition | tol   iter  <br>itertol | tol          | Stop condition: tolerance, iterations, or iterations or<br>tolerance.                                            |
| threshold     | double                  | 1e-3         | The threshold for the detection of Froissart doubles, if<br>froissart is set to true.                            |
| tol           | double                  | 1e-3         | The tolerance for the partial fraction fit, if<br>stopcondition is set to tol or itertol.                        |

#### **COMPATIBILITY**

For the Wave function, the freq property with a default value of 1 in previous versions of COMSOL Multiphysicshas been replaced by period with a default value of 2π in version 6.0.

## **SEE ALSO**

model.material()

# *model.geom()*

Creating and specifying general properties for 1D, 2D, and 3D geometries.

![](_page_105_Picture_2.jpeg)

For more information about the different methods, see Geometry.

#### **SYNTAX**

```
model.component(<ctag>).geom().create(<tag>,<sdim>);
model.component(<ctag>).geom().create(<tag>,<meshtag>,<filename>);
model.component(<ctag>).geom(<tag>).model(<mtag>);
model.component(<ctag>).geom(<tag>).model();
model.component(<ctag>).geom(<tag>).axisymmetric(boolean);
model.component(<ctag>).geom(<tag>).isAxisymmetric();
model.component(<ctag>).geom(<tag>).lengthUnit(<unit>);
model.component(<ctag>).geom(<tag>).lengthUnit();
model.component(<ctag>).geom(<tag>).angularUnit(<unit>);
model.component(<ctag>).geom(<tag>).angularUnit();
model.component(<ctag>).geom(<tag>).scaleUnitValue(boolean);
model.component(<ctag>).geom(<tag>).scaleUnitValue();
model.component(<ctag>).geom(<tag>).repairTol(<relTol>);
model.component(<ctag>).geom(<tag>).repairTol();
model.component(<ctag>).geom(<tag>).geomRep(geomrep);
model.component(<ctag>).geom(<tag>).geomRep();
model.component(<ctag>).geom().remove(<tag>);
model.component(<ctag>).geom(<tag>).create(<ftag>,type);
model.component(<ctag>).geom(<tag>).createAfter(<ftag>,<type>,<postag>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).create(<ftag2>,type);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property).selMethod;
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom().geomMethod;
model.component(<ctag>).geom(<tag>).feature(<ftag>).active(boolean);
model.component(<ctag>).geom(<tag>).feature(<ftag>).isActive();
model.component(<ctag>).geom(<tag>).feature().move(<ftag>,<position>);
model.component(<ctag>).geom(<tag>).feature().remove(<ftag>);
model.component(<ctag>).geom(<tag>).run(<ftag>);
model.component(<ctag>).geom(<tag>).runPre(<ftag>);
model.component(<ctag>).geom(<tag>).runCurrent();
model.component(<ctag>).geom(<tag>).run();
model.component(<ctag>).geom().run();
model.component(<ctag>).geom(<tag>).current();
model.component(<ctag>).geom(<tag>).feature(<ftag>).status();
model.component(<ctag>).geom(<tag>).feature(<ftag>).message();
model.component(<ctag>).geom(<tag>).objectNames();
model.component(<ctag>).geom(<tag>).feature(<ftag>).objectNames();
model.component(<ctag>).geom(<tag>).obj(<objname>).geomInfoMethod
model.component(<ctag>).geom(<tag>).geomInfoMethod
model.component(<ctag>).geom(<tag>).selection(<seltag>).selMethod;
model.component(<ctag>).geom(<tag>).measure().measurementMethod;
model.component(<ctag>).geom(<tag>).cleanup().cleanupMethod;
model.component(<ctag>).geom(<tag>).export(<filename>);
model.component(<ctag>).geom(<tag>).exportFinal(<filename>);
model.component(<ctag>).geom(<tag>).defeaturing(<tooltag>).defeaturingMethod;
model.component(<ctag>).geom(<tag>).feature(<ftag>).find();
model.component(<ctag>).geom(<tag>).feature(<ftag>).detail().selMethod;
model.component(<ctag>).geom(<tag>).insertFile(<filename>,<gtag>);
model.component(<ctag>).geom(<tag>).insertSequence(<mtag>,<gtag>);
model.component(<ctag>).geom().create(<tag>, "Subsequence", sDim);
model.component(<ctag>).geom(<tag>).inputParam().set(<name>, <expr>, <descr>);
```

```
model.component(<ctag>).geom(<tag>).localParam().set(<name>, <expr>, <descr>);
model.geom(<gtag>).create(<ftag>, "PartInstance");
model.geom(<gtag>).stepInto(<ftag>);
model.geom(<gtag>).feature(<ftag>).geom().run(<ftag2>);
```

The last group of syntaxes are only applicable for geometry subsequences (see Creating and Using Geometry Parts), but model.geom(*<gtag>*).feature(*<ftag>*).geom() also exists if *<ftag>* is a work plane feature.

```
model.geom().load(<tags>, <filename>, <subsequenceTagsInFile>);
model.geom(<gtag>).loaded();
model.geom(<gtag>).filename();
model.geom(<gtag>).filename(<filename>);
model.geom(<gtag>).tagInFile();
model.geom(<gtag>).dateModifiedInFile();
model.geom(<gtag>).commentsInFile();
model.geom(<gtag>).labelInFile();
model.geom(<gtag>).versionInFile();
model.geom(<gtag>).reload();
```

The last group of syntaxes are only applicable for geometry subsequences (see Creating and Using Geometry Parts).

#### **DESCRIPTION**

*Geometry Sequences and Geometry Objects*

model.component(*<ctag>*).geom(*<tag>*) returns a geometry sequence consisting of geometry features. The geometry sequence also contains geometry objects resulting from building the geometry sequence.

*Creating and Deleting a Geometry*

model.component(*<ctag>*).geom().create(*<tag>*,*<sdim>*) creates a geometry sequence of space dimension *<sdim>* and assigns it the tag *<tag>*.

model.component(*<ctag>*).geom().create(*<tag>*,*<meshtag>*,*<filename>*) creates a geometry sequence tagged *<tag>* and a corresponding meshing sequence tagged *<meshtag>*. The parameter *<filename>* specifies a file that contains a geometry or a mesh, and an import feature is inserted into the geometry or meshing sequence.

model.component(*<ctag>*).geom().remove(*<tag>*) deletes the geometry tagged *<tag>*.

*General Geometry Settings*

model.geom(*<tag>*).model(*<mtag>*) sets the model component node of the geometry *<tag>* to *<mtag>*.

String mtag = model.geom(*<tag>*).model() returns the model component node tag of the geometry.

model.component(*<ctag>*).geom(*<tag>*).axisymmetric(*boolean*) indicates if the geometry is axisymmetric. This is only applicable for 1D and 2D geometries.

model.component(*<ctag>*).geom(*<tag>*).isAxisymmetric() returns true if the geometry is axisymmetric and false otherwise.

model.component(*<ctag>*).geom(*<tag>*).lengthUnit(*<unit>*) sets the length unit.

String unit = model.component(*<ctag>*).geom(*<tag>*).lengthUnit() returns the length unit.

model.component(*<ctag>*).geom(*<tag>*).angularUnit(*<unit>*) sets the angular unit.

String unit = model.component(*<ctag>*).geom(*<tag>*).angularUnit() returns the angular unit.

model.component(*<ctag>*).geom(*<tag>*).scaleUnitValue(*boolean*) sets the geometry to scale property values when units are changed.

model.component(*<ctag>*).geom(*<tag>*).scaleUnitValue() returns true if the geometry is set to scale property values when units are changed.

model.component(*<ctag>*).geom(*<tag>*).repairTol(*<relTol>*) sets the default relative repair tolerance to use when creating new features.

double relTol = model.component(*<ctag>*).geom(*<tag>*).repairTol() returns the default relative repair tolerance.

model.component(*<ctag>*).geom(*<tag>*).geomRep(*geomrep*) sets the geometry representation to use in a 3D geometry. The *geomrep* string can be comsol, meaning the COMSOL kernel or cadps (requires the CAD Import Module), meaning the CAD kernel (Parasolid).

String geomrep = model.component(*<ctag>*).geom(*<tag>*).geomRep() returns the geometry representation.

model.component(*<ctag>*).geom(*<tag>*).useConstrDim(enable) enables or disables the constraints and dimensions functionality in a 2D geometry (requires the Design Module).

boolean enabled = model.component(*<ctag>*).geom(*<tag>*).useConstrDim() returns true if the constraints and dimensions functionality is enabled.

model.component(*<ctag>*).geom(*<tag>*).constrDimBuild(value) determines what constraint and dimension features to use when building a 2D geometry (requires the Design Module). Valid values are:

- **•** "all": All (enabled) constraint and dimension features are used. This is the default.
- **•** "none": No constraint and dimension features are used.
- **•** "uptotarget": All (enabled) constraint and dimension features up to the feature to build are used.

String value = model.component(*<ctag>*).geom(*<tag>*).constrDimBuild() returns the constraints and dimensions to use when building. The default is "all".

String status = model.component(*<ctag>*).geom(*<tag>*).constrDimStatus() gets a description of the overall status of the constraints and dimensions in a 2D geometry (requires the Design Module).

*Creating, Editing, Disabling, and Deleting Features*

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,*type*) adds a geometry feature *<ftag>* of type *type* to the geometry *<tag>*, after the current feature.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).set(*property*,*<value>*) sets a property in the geometry feature *<ftag>*. All data types listed in Table 2-4 are supported; the applicable data types differ between the properties. String expressions can use parameters from model.param().

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).get*Type*(*property*) returns the value of a property in the geometry feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection(*property*).*selMethod* manages the geometry object selection property *property*. The available selection methods are described in Geometry Object Selection Methods.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).geom().geomMethod manipulates the 2D geometry sequence corresponding to the work plane feature *<ftag>*. The available methods are the same as for a 2D geometry model.geom(*<gtag>*).

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).active(false) disables the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).active(true) enables the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).isActive() returns true if the feature *<ftag>* is enabled, and false otherwise.

model.component(*<ctag>*).geom(*<tag>*).feature().remove(*<ftag>*) removes the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature().move(*<ftag>,<position>*) moves the feature *<ftag>* to the zero indexed position *<position>* in the sequence.

String[] remaining = model.component(*<ctag>*).geom(*<tag>*).deleteEdges(*<objname>*, *<edges>*) deletes the given edges from the given object in a 2D geometry by using a combination of the following methods:

- **•** Removing the corresponding geometry feature.
- **•** Removing points from a Polygon feature.
- **•** Splitting a Polygon or Composite Curve feature into several features.
- **•** Adding a Delete Entities feature.

The return array contains the tags of the remaining (if any) and created (if any) features.

## *Getting Tags of Named Selections*

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).componentSelection() returns tags of selection output objects for use in selections in the component *<ctag>*. It returns an empty string array if there are no defined selections.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).outputSelection() returns tags of selection output objects for use in selections in the geometry sequence *<tag>*. It returns an empty string array if there are no defined selections.

#### *Building Features*

After each build operation, the current feature is set as the last of the active features that were built. The current state contains all objects that are generated by these features.

model.component(*<ctag>*).geom(*<tag>*).run(*<ftag>*) builds all features up to (and including) the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).runPre(*<ftag>*) builds all features preceding the feature *<ftag>*; for example, with *<ftag>* being a work plane feature in a 3D geometry, model.geom(*<tag>*).runPre(*<ftag>*) builds all 3D geometry features preceding the work plane.

model.component(*<ctag>*).geom(*<tag>*).runCurrent() builds all features up to (and including) the current feature.

model.component(*<ctag>*).geom(*<tag>*).run() builds all features. The finalized geometry and all selections are also updated.

model.component(*<ctag>*).geom().run() builds the finalized geometry in all geometries.

## *Getting Build Status*

String fTag = model.component(*<ctag>*).geom(*<tag>*).current() returns the tag of the current feature. If the current state is before the first feature, the empty string "" is returned.

String status = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).status() returns the status of the feature *<ftag>*. The status is built, warning, needs\_rebuild, edited, or error.

String msg = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).message() returns the warning/error message of the feature *<ftag>*.

*Getting Information About Geometry Objects*

String[] n = model.component(*<ctag>*).geom(*<tag>*).objectNames() returns the names of all objects that exist in the current state.

String[] n = model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).objectNames() returns the names of the output object generated by the feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).obj(*<objname>*).*geomInfoMethod* returns information about the object *<objname>*. The available methods are described in Geometry Object Information.

model.component(*<ctag>*).geom(*<tag>*).*geomInfoMethod* returns information about the finalized geometry of geometry *<tag>*.

*Getting Information About Named Selections*

model.component(*<ctag>*).geom(*<tag>*).selection(*<seltag>*).*selMethod* returns information about the named selection *<seltag>*. See Selections of Geometric Entities and Geometry Object Selection Methods for more information.

## *Geometric Measurements*

Use model.component(*<ctag>*).geom(*<tag>*).measure().selection().*selMethod* to specify the domains, boundaries, or edges in geometry objects that you want to measure. You can also specify one, two, or several vertices to get the coordinates of the vertex, the distance between the two vertices, or the average coordinates of the vertices, respectively. The available selection methods are described in Geometry Object Selection Methods.

model.component(*<ctag>*).geom(*<tag>*).measure().*measurementMethod* returns the volume, area, length, vertex coordinates, or distance between two vertices according to the selection. The available measurement methods are described in Measurement Methods.

Use model.component(*<ctag>*).geom(*<tag>*).measure().*getBoundingBox* to return the bounding box of the selected geometry objects or entities. They are returned as a double array of [xmin, xmax, ymin, ymax, …] depending on the space dimension.

## *Exporting Geometry Objects*

model.component(*<ctag>*).geom(*<tag>*).export().selection().*selMethod* can be used to select a number of geometry objects to export to file. The available selection methods are described in Geometry Object Selection Methods.

model.component(*<ctag>*).geom(*<tag>*).export(<*filename>*) exports the selected objects to a file.

model.component(*<ctag>*).geom(*<tag>*).exportFinal(<*filename>*) exports the finalized geometry to a file.

# *CAD Defeaturing*

If you have a license for the CAD Import Module, or a LiveLink™ product for CAD software, the following functionality is available. For details, see the *CAD Import Module User's Guide*.

model.component(*<ctag>*).geom(*<tag>*).defeaturing(*tooltag*).*defeaturingMethod* uses a defeaturing tool to create a feature that deletes small details. Available tools are listed in the *CAD Import Module User's Guide.*

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).find() searches for small details, for a defeaturing feature *<ftag>*.

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).detail().*selMethod* manipulates the selection of details to remove, for a defeaturing feature *<ftag>*.

*Geometry Object Selection Methods*

For a geometry object selection sel, the following methods are available:

sel.init() sets the selection to be a selection of whole geometry objects. Subsequent calls to set, add, and remove select objects.

sel.init(*dim*) sets the selection property to be a selection of geometric entities of dimension *dim*. Subsequent calls to all, set, add, remove, and clear select entities.

The following three methods are applicable when the selection consists of whole objects. The argument *<onames>* can be an array of strings, or several string arguments.

sel.set(*<onames>*) sets the selection to be the objects *<onames>*.

sel.add(*<onames>*) adds the objects *<onames>* to the selection.

sel.remove(*<onames>*) removes the objects *<onames>* from the selection.

The following seven methods are applicable when the selection consists of geometric entities. The argument *<entities>* can be an array of integers or several integer arguments.

sel.all(*<oname>*) sets the selection to be all the entities of object *<oname>*. The selections on other objects are not affected.

sel.all() sets the selection to be all entities (of the given dimension) of all available objects.

sel.set(*<oname>*,*<entities>*) sets the selection on object *<oname>* to be *<entities>*. The selections on other objects are not affected.

sel.add(*<oname>*,*<entities>*) adds the entities *<entities>* to the selection on object *<oname>*. The selections on other objects are not affected.

sel.remove(*<oname>*,*<entities>*) removes the entities *<entities>* from the selection on object *<oname>*. The selections on other objects are not affected.

sel.clear() removes all entities from the selection.

The set, add, and remove methods can all be vectorized. See Selections of Geometric Entities for more information.

sel.clear(*<oname>*) clears the selection on object *<oname>*. The selections on other objects are not affected.

To let the selection be defined by a named selection, use:

sel.named(*<seltag>*) where *<seltag>* is the trimmed tag of a named selection defined by a preceding feature in the geometry sequence. See Selections of Geometric Entities for more information.

To get information about the selection, use:

String[] onames = sel.objects() returns the names of the selected objects.

int dim = sel.dim() returns the dimension for the entities in the selection if the selection consists of geometric entities; otherwise, it returns −1.

int[] dims = sel.dimension() returns an array of length 1 containing the entity dimension if the selection consists of geometric entities; otherwise, it returns an empty array.

int[] ent = sel.entities(*<oname>*,*dim*) returns the entities in the selection on object *<oname>* at the given dimension, if the selection consists of geometric entities.

int[] ent = sel.entities(*<oname>*) returns the entities in the selection on object *<oname>*, if the selection consists of geometric entities.

String[] seltag = sel.named() returns the trimmed tag of the named selection that this selection refers to, or an empty string if the selection does not refer to a named selection.

## *If Statements*

Use model.geom(<tag>).create(*<ftag>*,*<type>*) to add an If, Else If, Else, or End If feature after the current feature.

Use model.geom(<tag>).createAfter(*<ftag>*,*<type>*,*<postag>*) to add an If, Else If, Else, or End If feature after the feature tagged *<postag>*.

*Insert Sequence*

model.geom(*<tag>*).insertFile(*<filename>*,*<gtag>*); inserts a geometry sequence, with tag *<gtag>*, from another model file, with the filename *<filename>*, into the geometry sequence with tag *<tag>*.

model.geom(*<tag>*).insertSequence(*<mtag>*,*<gtag>*); inserts a geometry sequence, with tag *<gtag>*, from another model, with tag *<mtag>*, into the current geometry sequence with tag *<tag>*.

#### **EXAMPLE**

Create a 2D geometry model as the union of a circle and rectangle.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g =model.component("comp1").geom().create("geom1",2);
  g.create("r1","Rectangle");
  g.feature("r1").set("size",new double[]{0.5,1});
  g.feature("r1").set("pos",new double[]{-1,0});
  g.create("c1","Circle");
  g.feature("c1").set("r",0.5);
  g.feature("c1").set("pos",new double[]{0.5,0});
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component().create('comp1');
  g =model.component('comp1').geom.create('geom1',2);
  g.create('r1','Rectangle');
  g.feature('r1').set('size',[0.5,1]);
  g.feature('r1').set('pos',[-1,0]);
  g.create('c1','Circle');
  g.feature('c1').set('r',0.5);
  g.feature('c1').set('pos',[0.5,0]);
  g.run;
```

#### **COMPATIBILITY**

From version 5.6, for a selection of entities, the method objects() returns feature tags for objects that are created by a feature that creates exactly one geometry object.

From version 5.1, the access method argument() is deprecated and replaced with inputParam(), and the access method param() is deprecated and replaced with localParam(). The methods link(…), linked(), and relink() are deprecated and replaced with load(…), loaded(), and reload(), respectively.

From version 4.4, the method

```
model.geom(<tag>).runAll();
is deprecated. Instead, use
  model.component(<ctag>).geom(<tag>).run(<ftag>);
to specify to which feature node in the geometry sequence you wan to run.
From version 4.3a, the methods
  model.geom(<tag>).object(<objname>)
  String[] onames = sel.object()
are deprecated and replaced by the following methods:
  model.component(<ctag>).geom(<tag>).obj(<objname>)
  String[] onames = sel.objects()
```

#### **SEE ALSO**

```
model.mesh()
```

# *model.group()*

Add load groups and constraint groups.

#### **SYNTAX**

```
model.group().create(<tag>,type);
model.group(<tag>).identifier(<id>);
model.group(<tag>).type();
model.group(<tag>).identifier();
```

#### **DESCRIPTION**

model.group().create(*<tag>,type*) creates a new group of the specified type, which can be either LoadGroup or ConstraintGroup.

model.group(*<tag>*).identifier(*<id>*) sets the group identifier, which is used for defining a corresponding parameter, group.<id>.

model.group(*<tag>*).type() returns the group type as a string.

model.group(*<tag>*).identifier() returns the group identifier.

*model.init()*

Creating and defining initial values.

#### **SYNTAX**

```
model.init().create(<tag>);
model.init(<tag>).set(<fieldname>,<expr>);
model.init(<tag>).remove(<fieldname>);
model.init(<tag>).varnames();
model.init(<tag>).get(<fieldname>);
```

## **DESCRIPTION**

model.init().create(*<tag>*) creates a new initial value with tag *<tag>*.

model.init(*<tag>*).set(*<fieldname>*,*<expr>*) defines the expression *<expr>* as the initial value for the dependent variable (field variable) *<fieldname>*.

model.init(*<tag>*).remove(*<fieldname>*) removes the field variable *<fieldname>* from the initial value with tag *<tag>*.

model.init(*<tag>*).selection().named(*<seltag>*) assigns the initial value to the named selection *<seltag>*. model.init(*<tag>*).selection().set(...) defines a local selection that assigns the initial value to geometric entities. For a complete list of methods available under selection(), see Selections. Only selections at a single geometry level is allowed except for ODE states which require the global selection.

model.init(*<tag>*).varnames() returns the names of the variables for the initial value with tag *<tag>* as a string array.

model.init(*<tag>*).get(*<fieldname>*) returns the initial value for the field variable *<fieldname>* as a string. model.init(*<tag>*).selection().named() returns the named selection tag.

model.init(*<tag>*).selection().get*Type*() returns domain information for the initial value with tag *<tag>*; see Selections for available methods.

```
model.intRule()
```

Integration rules.

## **SYNTAX**

```
model.intRule().create(<tag>,<ftag>);
model.intRule(<tag>).frame(<ftag>);
model.intRule(<tag>).create(<ftag>);
model.intRule(<tag>).feature(<ftag>).order(gporder);
model.intRule(<tag>).frame();
```

### **DESCRIPTION**

model.intRule().create(*<tag>*,*<ftag>*) creates an integration rule for the frame *<ftag>*.

model.intRule(*<tag>*).frame(*<ftag>*) sets the frame for the integration rule.

model.intRule(*<tag>*).create(*<ftag>*) creates an integration rule feature.

model.intRule(*<tag>*).feature(*<ftag>*).order(*gporder*) specifies the integration order of the integration rule.

model.intRule(*<tag>*).frame() returns the frame as a string.

#### **EXAMPLE**

Specify two integration rules, one with the integration order 2 and one with the integration order 4.

```
Code for Use with Java
  model.intRule().create("ir1","f");
  model.intRule("ir1").create("ir1").order(2);
  model.intRule("ir1").create("ir2").order(4);
Code for Use with MATLAB
  model.intRule.create('ir1','f');
  model.intRule('ir1').create('ir1').order(2);
  model.intRule('ir1').create('ir2').order(4);
```

## **SEE ALSO**

model.shape()

*model.massProp()*

Compute mass properties and add mass contributions.

# **SYNTAX**

```
model.component(<ctag>).massProp().create(<tag>,"MassProperties");
model.component(<ctag>).massProp(<tag>).selection();
model.component(<ctag>).massProp(<tag>).set(<pname>,<expr>);
model.component(<ctag>).massProp(<tag>).image();
model.component(<ctag>).massProp(<tag>).create(<mctag>, "MassContributions");
model.component(<ctag>).massProp(<tag>).feature(<mctag>).selection()
model.component(<ctag>).massProp(<tag>).feature(<mctag>).set(<pname>,<expr>);
```

#### **DESCRIPTION**

*Creating Mass Properties and Providing Geometry Source Selections*

model.component(*<ctag>*).massProp().create(*<tag>*,"MassProperties") creates a mass properties object that computes variables for mass properties such as total mass and the center of mass.

model.component(*<ctag>*).massProp(*<tag>*).selection().set(...) defines a local selection that assigns the mass properties to geometric entities that act as sources. For a complete list of methods available under selection(), see model.selection().

*Specifying Density and Mass Properties*

You can specify the density to be taken from a physics. For example,

```
model.component(<ctag>).massProp(<tag>).set("densitySource", "fromSpecifiedPhysics")
model.component(<ctag>).massProp(<tag>).feature("mc1").set("physics", "solid");
```

takes the density from the Solid Mechanics interface solid.

You can also specify a user-defined density. For example, to specify the density to be 1107 kg/m3, use

```
model.component(<ctag>).massProp(<tag>).set("densitySource", "userDefined");
model.component(<ctag>).massProp(<tag>).set("expr","1107[kg/m^3]");
```

To create variables for the center of mass and to not create variables for the moment of inertia:

```
model.component(<ctag>).massProp(<tag>).set("createCenterOfMass","on");
model.component(<ctag>).massProp(<tag>).set("createMomentOfInertia","off");
```

*Adding a Mass Contribution*

You can add mass contributions from other parts of the geometry (an adjacent boundary, for example) by creating a mass contribution:

```
model.component(<ctag>).massProp(<tag>).create("mc1","MassContributions");
model.component(<ctag>).massProp(<tag>).feature("mc1").set("expr", "3");
```

For the mass contributions, you can specify source selections and define the density in the same way as for the mass properties.

*Properties and Variables for massProp*

The massProp feature accepts the following properties:

TABLE 2-102: MASSPROP PROPERTIES.

| NAME                   | VALUE                                | DEFAULT     | DESCRIPTION                                                                               |
|------------------------|--------------------------------------|-------------|-------------------------------------------------------------------------------------------|
| createCenterOfMass     | on   off                             | on          | Create center of mass variables.                                                          |
| createMass             | on   off                             | on          | Create mass variable.                                                                     |
| createMassContribution | on   off                             | on          | Add a mass contribution.                                                                  |
| createMomentOfInertia  | on   off                             | on          | Create moment of inertia variables.                                                       |
| createPrincipalInertia | on   off                             | on          | Create principal moment of inertia<br>variables.                                          |
| createVolume           | on   off                             | on          | Create volume variable.                                                                   |
| densitySource          | fromSpecifiedPhysics <br>userDefined | userDefined | Source for the density values.                                                            |
| expr                   | String                               |             | User-defined density expression.                                                          |
| includeLowerPh         | on   off                             | on          | Include adjacent entities of lower<br>dimension for density values taken<br>from physics. |
| densityFrame           | frame                                | Material    | The frame to which the user-defined<br>density refers.                                    |

TABLE 2-102: MASSPROP PROPERTIES.

| NAME        | VALUE | DEFAULT          | DESCRIPTION                                |
|-------------|-------|------------------|--------------------------------------------|
| intorder    | 4     | Positive integer | Integration order.                         |
| outputFrame | frame | Material         | Integration frame for output<br>variables. |

The created variables for different mass properties have the following default names:

- **•** mass1.mass and mass1.volume for the mass and volume, respectively.
- **•** mass1.CM*X*, and so on, for the coordinates of the center of mass.
- **•** mass1.I*XY*, and so on, for the components of the moment of inertia.
- **•** mass1.Ip*1*, and so on, for the moment of inertia principal values.
- **•** mass1.Ip*1X*, and so on, for the moment of inertia principal directions.

# *model.material()*

Materials and material property groups.

![](_page_116_Picture_10.jpeg)

For materials defined on the global level, omit component(*<ctag>*). from the syntax such as model.component(*<ctag>*).material().create(*<tag>*) in the syntax examples below.

#### **SYNTAX**

```
model.component(<ctag>).material().create(<tag>);
model.component(<ctag>).material().create(<tag>,<type>);
model.component(<ctag>).material(<tag>).info(<itag>);
model.component(<ctag>).material(<tag>).info();
model.component(<ctag>).material(<tag>).insert()
model.component(<ctag>).material(<tag>).label(<label>);
model.component(<ctag>).material(<tag>).materialType(<mattype>)
model.component(<ctag>).material(<tag>).propertyGroup(<mtag>);
model.component(<ctag>).material(<tag>).propertyGroup();
model.component(<ctag>).material(<tag>).prefix(<prefix>);
model.component(<ctag>).material(<tag>).prefix();
model.component(<ctag>).material(<tag>).selection();
model.component(<ctag>).material(<tag>).image();
model.component(<ctag>).material(<tag>).set(<pname>,<expr>);
model.component(<ctag>).material().move(<tag>,<position>);
MaterialModel mm = model.component(<ctag>).material(<tag>).propertyGroup().
                   create(<mtag>,<descr>);
mm.addInput(<quantity>);
mm.descr(<pname>,<descr>);
mm.func();
mm.func(<ftag>);
mm.setMixingRule(<pname>,<mixRule>);
mm.getPropertyInfo(<pname>);
mm.getString(<pname>);
mm.getStringArray(<pname>);
mm.getValueType(<pname>);
mm.hasParam(<pname>);
mm.info(<itag>);
mm.info();
mm.input();
mm.isOutput(<pname>);
mm.param();
mm.removeInput(<quantity>);
mm.set(<pname>,<expr>);
mm.setMixingRule(<pname>,<mixRule>);
mm.setPropertyInfo(<pname>,<info>);
mm.size(<pname>);
mm.suffix(<suffix>);
mm.suffix();
mm.info().create(<itag>,<descr>);
mm.info(<itag>).title(<title>);
mm.info(<itag>).title();
mm.info(<itag>).body(<body>);
mm.info(<itag>).body();
```

# **DESCRIPTION**

A material is a collection of property groups, where each property group defines a set of material properties, material functions, and model inputs that can be used to define a temperature-dependent material property, for example. A property group usually defines properties used by a particular material model to compute a fundamental quantity. A material property can either be a visible output property or a local parameter. The output property is visible for physics interfaces; local properties are only visible inside the property group. If two property groups define the same output property, the last property group determines the value of the output property. The material function is used by the property group to calculate a property or parameter value as a function of other variables, usually model inputs. The model input is a quantity that the material model recognizes as an input variable (temperature, for example). The actual variable that represents the model input is not known until the model is solved, and it can also be different between physics interfaces.

There are two types of property groups, user-defined and specialized. When a material is created, there is always one default user-defined property group present. To this property group it is possible to add output properties from a predefined list of quantities. These quantities are recognized by all physics interfaces as material properties — for example, thermal conductivity, electric conductivity, and density. The full list is presented in the physics interface for the default property group. The specialized property groups are built in and usually define few output properties that only some physics interfaces can access. These output properties are not necessarily part of the allowed properties for the default property group. An example of such a specialized group is the refractive index material model, which defines the real and imaginary part of the refractive index as output properties. These properties can only be accessed by the Electromagnetic Waves interface.

model.component(*<ctag>*).material().create(*<tag>*) creates a new material for the model component with the tag *<ctag>*.

model.component(*<ctag>*).material().create(*<tag>*,"Common") also creates a new material for the model component with the tag *<ctag>*.

model.component(*<ctag>*).material().create(*<tag>*,"Switch") creates a material switch for the model component with the tag *<ctag>*. You can add materials to the material switch:

```
model.component(<ctag>).material().create("sw1", "Switch", "");
model.component(<ctag>).material("sw1").feature().create("mat1", "Common", "");
model.component(<ctag>).material("sw1").feature().create("mat2", "Common", "");
```

model.component(*<ctag>*).material().create(*<tag>*,"Link") creates a material link for the model component with the tag *<ctag>*.

model.component(*<ctag>*).material().create(*<ptag>*,"PorousMedia") also creates a new local porous material for the model component with the tag *<ctag>*. Use model.component(*<ctag>*).

material(*<ptag>*).feature().create(*<subtag>*,*<subfeaturename>*,*<ctag>*); where *<subfeaturename>* is one of "Fluid", "Pellet", "Solid", or "ImFluid" to add a subfeature to the porous material feature representing a fluid, pellet, solid, or immobile fluid, respectively.

model.component(*<ctag>*).material().create(*<tag>*,"External") creates an external material that sets up an interface between a physics feature and functions in an external shared library (a DLL, .so, or .dylib file.). For an external material,

model.component(*<ctag>*).material(*<tag>*).set("path",*<path to external material file>*) sets the path to the external shared library. Also, use model.material(*<tag>*).set("threadSafe", "off")if the DLL is not thread safe (default is, "on"; that is, the DLL is thread safe).

model.material().create(*<tag>*,*<type>*) creates a global material, material switch, or material link.

model.component(*<ctag>*).material(*<tag>*).info(*<itag>*) returns an information item for a material.

model.component(*<ctag>*).material(*<tag>*).input() returns the list of model inputs.

For model.component(*<ctag>*).material(*<tag>*).insert(), see Inserting Materials.

model.component(*<ctag>*).material(*<tag>*).materialType("solid") or

model.component(*<ctag>*).material(*<tag>*).materialType("nonSolid")sets the material type to a solid or a nonsolid (that is, fluid or liquid) material, respectively.

model.component(*<ctag>*).material(*<tag>*).propertyGroup(*<mtag>*) gets the property group named *<mtag>* for the material.

model.component(*<ctag>*).material(*<tag>*).selection() returns the selection of the material. The selection determines which geometry the material belongs to.

model.component(*<ctag>*).material(*<tag>*).set("family",*<appearance>*) sets the appearance to a family of materials (as strings; "water", for example): air, aluminum, brick, concrete, copper, defaultmaterial, defaultplot, gold, iron, lead, magnesium, plastic, steel, titanium, water, as a few of the available material types, or custom. You can set a "color" property for plastic, defaultplot, and some other material types. With custom you can set these additional parameters for the appearance:

TABLE 2-103: PROPERTIES FOR CUSTOM APPEARANCE OF MATERIALS.

| PROPERTY              | VALUE                               | DEFAULT | DESCRIPTION                                                                                                                                                     |
|-----------------------|-------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| alpha                 | double                              | 1       | Diffuse and ambient color opacity.                                                                                                                              |
| ambient               | string[] (a color<br>or custom)     | custom  | Ambient light color.                                                                                                                                            |
| anisotropy            | double (0–1)                        | 0       | Add anisotropic specular highlighting.                                                                                                                          |
| anisotropyaxis        | string array of<br>length 3.        | 0,0,1   | The axis for the anisotropy.                                                                                                                                    |
| clearcoat             | double (0–1)                        | 0.15    | Clear coat for Cook–Torrance lighting model.                                                                                                                    |
| colornoise            | true   false                        | false   | Add an additional color to the appearance using<br>noise.                                                                                                       |
| colornoisebrush       | 0 1 2 3 4 5 6 7                     | 0       | No brush lines (0); brush lines around x, y, and z<br>(1, 2, 3, respectively); brush lines along x, y, and z<br>(4, 5, 6, respectively), if colornoise is true. |
| colornoisefrequency   | double                              | 1       | Additional color noise frequency, if colornoise<br>is true.                                                                                                     |
| colornoisenormalscale | double                              | 0       | Normal vector noise scale for the added color, if<br>colornoise is true.                                                                                        |
| colornoisescale       | double                              | 0       | Additional color noise scale, if colornoise is<br>true.                                                                                                         |
| colornoisetype        | 0 or 1                              | 0       | White noise (0) or simplex noise (1), if<br>colornoise is true.                                                                                                 |
| customambient         | double[]                            |         | RGB values for a custom ambient color.                                                                                                                          |
| customdiffuse         | double[]                            |         | RGB values for a custom diffuse color.                                                                                                                          |
| customspecular        | double[]                            |         | RGB values for a custom specular color.                                                                                                                         |
| diffuse               | string[] (a color<br>or custom)     | custom  | Diffuse light color.                                                                                                                                            |
| diffusewrap           | double (0–1)                        | 0.27    | Diffuse wrap for Cook–Torrance lighting model.                                                                                                                  |
| flipanisotropy        | true   false                        | false   | Flip the anisotropy for anisotropic specular<br>highlighting.                                                                                                   |
| fresnel               | double (0–1)                        | 0       | Reflectance at normal incidence for Cook<br>Torrance.                                                                                                           |
| lighting              | phong  <br>cooktorrance  <br>simple | phong   | Lighting model.                                                                                                                                                 |
| metallic              | double (0–1)                        | 0.1     | Metallic surface for Cook–Torrance lighting<br>model.                                                                                                           |
| noise                 | true   false                        | false   | Add noise to the appearance.                                                                                                                                    |
| noisecolor            | string[] (a color<br>or custom)     | custom  | The color for an additional color, if colornoise<br>is true.                                                                                                    |
| noisecolorblend       | double (0–1)                        | 0       | The color blend, if colornoise is true.                                                                                                                         |
| noisefreq             | double                              | 1       | Normal vector noise frequency.                                                                                                                                  |
| noisescale            | double                              | 0       | Normal vector noise scale.                                                                                                                                      |

TABLE 2-103: PROPERTIES FOR CUSTOM APPEARANCE OF MATERIALS.

| PROPERTY         | VALUE                           | DEFAULT | DESCRIPTION                                                                                                                              |
|------------------|---------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------|
| normalnoisebrush | 0 1 2 3 4 5 6 7                 | 0       | No brush lines (0); brush lines around x, y, and z<br>(1, 2, 3, respectively); brush lines along x, y, and z<br>(4, 5, 6, respectively). |
| normalnoisetype  | 0 or 1                          | 0       | White noise (0) or simplex noise (1).                                                                                                    |
| pearl            | double (0–1)                    | 0.015   | Pearl surface for Cook-Torrance lighting model.                                                                                          |
| reflectance      | double (0–1)                    | 0       | Reflectance for Cook-Torrance lighting model.                                                                                            |
| roughness        | double (0–1)                    | 0.45    | Surface roughness for Cook-Torrance lighting<br>model.                                                                                   |
| shininess        | double                          | 64      | Specular exponent for Blinn-Phong lighting<br>model.                                                                                     |
| specular         | string[] (a color<br>or custom) | custom  | Specular light color.                                                                                                                    |

model.component(*<ctag>*).material().move(*<tag>*,*<position>*) moves the material *<tag>* to the zeroindexed position *<position>* in the list.

For a material link, model.component(*<ctag>*).material(*<tag>*).set("link",*<linktag>*); creates a material link from a component to the global material with the tag in *<linktag>*. For example,

```
model.component("comp1")).material().create("matlnk1", "Link");
model.material("matlnk1").set("link", "mat1");
```

creates a material link in the component comp1 and then links it to the global material mat1. The material link can also have a selection; for example, model.material("matlnk1").selection().all();.

## *Importing Materials*

You can import materials as global materials and as materials in a component.

To import global materials as mat1, mat2, and mat3 from myfile.xml, for example:

```
String[][] result = model.material().insert("myfile.xml",
           new String[]{"mat1", "mat2", "mat3"});
```

To import the same materials to the component comp1:

```
String[][] result = model.component("comp1").material().insert("myfile.xml",
           new String[]{"mat1", "mat2", "mat3"});
```

The insert method inserts materials from an MPH- or XML-file into the material list and returns the result of the operation as a double string array of length 3. The first array contains messages from the insert operation, the second array contains paths to the inserted objects, and the third array contains paths to the inserted references. An inserted reference is an object that an inserted object refers to and is not necessarily contained by any of the inserted objects. There can only be inserted references when importing from an MPH-file. The first parameter is the filename, and the second is the tags of the materials to insert. For protected MPH-files, you can supply a password as an optional third parameter.

See Materials in *The COMSOL File Formats* chapter for information about the XML-file format for materials that you can import and export.

## *Property Groups*

The following syntax examples describe the methods available for property groups added to a material (not available for material switches or material links).

mm = model.component(*<ctag>*).material(*<tag>*).propertyGroup().create(*<tag>*,*<descr>*) creates a new property group and stores it in the variable mm.

To define a method to set an output property of a material, use the following syntax (in this example you specify a density for the basic property group def):

```
model.component(<ctag>).material("mat1").propertyGroup("def").
set("density", String[] arg);
```

where arg is the string value to be defined. For a list of available physical property names (such as density), see Table 2-104.

mm.addInput(*<quantity>*) adds a new model input to the property group of the given quantity.

mm.descr(*<pname>*,*<descr>*) adds the description *<descr>* to the local material property with the name *<pname>*.

mm.func(*<ftag>*) returns the function object named *<ftag>*. For information about how to add and modify functions, see model.func().

mm.getMixingRule(*<pname>*) returns the mixing rule for the given material property.

mm.getPropertyInfo(*<pname>*) returns the property info (references, temperature conditions, and so on) for the given material property.

mm.getString(*<pname>*) returns the string value of the given property. If it is a vector or matrix quantity, the first value is returned.

mm.getStringArray(*<pname>*) returns the string array value of the given property. Matrix values are returned in a column-wise order.

mm.getValueType(*<pname>*)returns the main data type that a property can return. The data types are: String, StringArray, and StringMatrix.

mm.hasParam(*<pname>*) returns true if the property is defined by the property group.

mm.info(*<itag>*) returns the information object for the property group.

mm.isOutput(<*pname>*) returns true if the given local material parameter is an output property. For user-defined property groups the method returns true for all predefined material properties known to all physics interfaces. For the specialized property groups, it can also return true for other properties.

mm.param() returns a list of all parameters stored in the property group.

mm.removeInput(*<quantity>*) removes the given quantity from the list of model inputs.

mm.set(*<pname>*,*<expr>*) sets the expression for the given property. The expression can use local names for the properties, parameters, and model inputs. For vector and matrix properties, the expression can be string arrays of varying size. Isotropic matrices only require one element or a string, diagonal matrices require three elements, and so forth. Vectors always require three elements.

mm.setMixingRule(*<pname>*,*<mixRule>*) sets the mixing rule for the given material property.

mm.setPropertyInfo(*<pname>*,*<info>*) sets the property info (references, temperature conditions, and so on) for the given material property.

mm.size(*<pname>*) returns the size of the stored property, which usually is 1-by-1, 3-by-1, or 3-by-3, but other sizes are supported.

model.component(*<ctag>*).material(*<tag>*).propertyGroup() returns a list of all property groups in the material.

model.component(*<ctag>*).material(*<tag>*).propertyGroup(*<tag>*).info().create(*<tag>*,*<descr>*) creates a new information object that can contain detailed information about this property group. This could, for example, be used by the Material Library to define the Phase/Condition and Orientation/Condition fields.

mm.info(<itag>).title(*<title>*) sets the title of the information object.

mm.info(*<itag>*).title() returns the title.

mm.info(*<itag>*).body(*<body>*) sets the body text of the information object.

mm.info(*<itag>*).body() returns the body text.

![](_page_122_Picture_5.jpeg)

The term *material model* is sometimes used instead of *property group* in some contexts. The graphical user interface uses the term property group.

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| PHYSICAL QUANTITY                   | NAME                           |
|-------------------------------------|--------------------------------|
| Absorbed dose                       | absorbeddose                   |
| Absorption coefficient              | absorption                     |
| Acceleration                        | acceleration                   |
| Activation energy                   | activationenergy               |
| Angular acceleration                | angularacceleration            |
| Angular frequency                   | angularfrequency               |
| Area                                | area                           |
| Bulk viscosity                      | bulkviscosity                  |
| Capacitance                         | capacitance                    |
| Catalytic activity                  | catalyticactivity              |
| Characteristic acoustic impedance   | acousticimpedance              |
| Charge                              | charge                         |
| Coefficient of hygroscopic swelling | hygroscopicswellingcoefficient |
| Coefficient of thermal expansion    | thermalexpansioncoefficient    |
| Collisional power loss              | inelasticpowerloss             |
| Compliance                          | compliance                     |
| Compressibility of fluid            | compressibility                |
| Concentration                       | massconcentration              |
| Concentration                       | concentration                  |
| Conductance                         | conductance                    |
| Corrected pressure                  | correctedpressure              |
| Corrected velocity field            | correctedvelocity              |
| Current                             | current                        |
| Current density                     | currentdensity                 |
| Current source                      | currentsource                  |
| Damping constant per unit area      | dampingconstantperarea         |
| Damping constant per unit length    | dampingconstantperlength       |
| Damping constant per unit volume    | dampingconstantpervolume       |
| Density                             | density                        |
| Diffusion coefficient               | diffusion                      |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES. |                              |
|---------------------------------------------|------------------------------|
| PHYSICAL QUANTITY                           | NAME                         |
| Dimensionless                               | dimensionless                |
| Dipole moment                               | dipolemoment                 |
| Dispersed phase volume fraction             | dispersedphasevolumefraction |
| Displacement field                          | displacement                 |
| Displacement of shell normals               | dimensionless_displacement   |
| Dose equivalent                             | doseequivalent               |
| Dynamic viscosity                           | dynamicviscosity             |
| EEDF                                        | eedf                         |
| Edge load                                   | edgeload                     |
| Effective gas density                       | effectivegasdensity          |
| Effective plastic strain                    | effectiveplasticstrain       |
| Elasticity                                  | elasticity                   |
| Elastoresistive coupling                    | couplingelastoresistive      |
| Electric displacement field                 | displacementfield            |
| Electric field                              | electricfield                |
| Electric permittivity                       | permittivity                 |
| Electric potential                          | electricpotential            |
| Electric conductivity                       | electricconductivity         |
| Electrolyte conductivity                    | electrolyteconductivity      |
| Electrolyte potential                       | electricpotentialionicphase  |
| Electron density                            | electrondensity              |
| Electron energy density                     | electronenergydensity        |
| Electron mobility                           | electronmobility             |
| Energy                                      | energy                       |
| Energy density                              | energydensity                |
| Entropy                                     | entropydensity               |
| External free energy                        | externalfreeenergy           |
| Extinction coefficient                      | extinctioncoefficient        |
| Face load                                   | faceload                     |
| Flow rate out from source per unit length   | areapertime                  |
| Flow resistivity                            | pressuretimeperarea          |
| Fluid conductance                           | fluidconductance             |
| Force density                               | forcedensity                 |
| Force load                                  | force                        |
| Force potential                             | forcepotential               |
| Fowler-Nordheim coefficient                 | fowlernordheimcoefficient    |
| Frequency                                   | frequency                    |
| Frequency factor                            | frequencyfactor              |
| Head                                        | head                         |
| Heat capacity at constant pressure (molar)  | molarheatcapacity            |
| Heat capacity at constant pressure          | heatcapacity                 |
|                                             |                              |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| PHYSICAL QUANTITY<br>Heat source  | NAME<br>powerdensity          |
|-----------------------------------|-------------------------------|
| Heat transfer coefficient         | heattransfercoefficient       |
| Henry's constant                  | henrysconstant                |
| Hydraulic conductivity            | hydraulicconductivity         |
| Inductance                        | inductance                    |
|                                   |                               |
| Initial curvature                 | planeangleperlength           |
| Initial electron density          | initialelectrondensity        |
| Intensity (RMS)                   | intensity                     |
| Inward heat flux                  | heatflux                      |
| Isotropic structural loss factor  | lossfactor                    |
| Kinematic viscosity               | kinematicviscosity            |
| Length                            | length                        |
| Level set variable                | levelsetvariable              |
| Line charge                       | linecharge                    |
| Line current source               | linecurrentsource             |
| Log mass fraction                 | logmassfraction               |
| Log of electron density           | logelectrondensity            |
| Log of electron energy density    | logelectronenergydensity      |
| Logarithmic ratio                 | logarithmicratio              |
| Logarithmic ratio per unit length | logarithmicratioperunitlength |
| Luminous intensity                | luminousintensity             |
| Magnetic field                    | magneticfield                 |
| Magnetic flux                     | magneticflux                  |
| Magnetic flux density             | magneticfluxdensity           |
| Magnetic permeability             | permeability                  |
| Magnetic scalar potential         | magneticscalarpotential       |
| Magnetic vector potential         | magneticvectorpotential       |
| Mass                              | mass                          |
| Mass flow                         | massflow                      |
| Mass flux                         | massflux                      |
| Mass fraction                     | massfraction                  |
| Mass per unit area                | massperarea                   |
| Mass per unit length              | massperlength                 |
| Mass source                       | masssource                    |
| Mass transfer coefficient         | masstransfercoefficient       |
| Mean electron energy              | meanelectronenergy            |
| Mean flow velocity potential      | meanflowvelocitypotential     |
| Mean molar mass                   | molarmass                     |
| Molar enthalpy                    | energyperamount               |
| Molar flux                        | molarflux                     |
| Molar surface flux                | molarsurfaceflux              |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES. |                                      |
|---------------------------------------------|--------------------------------------|
| PHYSICAL QUANTITY                           | NAME                                 |
| Molar volume                                | molarvolume                          |
| Moment body load                            | torquepervol                         |
| Moment edge load                            | torqueperlength                      |
| Moment face load                            | torqueperarea                        |
| Natural logarithmic ratio                   | naturallogarithmicratio              |
| Natural logarithmic ratio per unit length   | naturallogarithmicratioperunitlength |
| Normal electron current density             | normalelectroncurrentdensity         |
| Normal ion current density                  | normalioncurrentdensity              |
| Number density                              | numberdensity                        |
| Particle momentum                           | momentum                             |
| Particle position                           | position                             |
| Permeability                                | hydraulicpermeability                |
| Phase field help variable                   | phasefieldhelpvariable               |
| Phase field variable                        | phasefieldvariable                   |
| Piezoelectric coupling d (strain-charge)    | couplingstraincharge                 |
| Piezoelectric coupling e (stress-charge)    | couplingstresscharge                 |
| Piezoresistive coupling                     | couplingpiezoresistive               |
| Plane angle                                 | planeangle                           |
| Point current source                        | pointcurrentsource                   |
| Poiseuille coefficient                      | poiseuillecoefficient                |
| Poisson's ratio                             | poissonsratio                        |
| Porosity                                    | porosity                             |
| Power                                       | power                                |
| Power flow                                  | powerflow                            |
| Power per unit charge                       | powerpercharge                       |
| Power per unit length                       | powerpermeter                        |
| Power per unit mass                         | powerpermass                         |
| Pressure                                    | pressure                             |
| Production rate                             | productionrate                       |
| Production/absorption coefficient           | heatproduction                       |
| Radiative intensity                         | radiativeintensity                   |
| Radioactivity                               | radioactivity                        |
| Ratio of specific heats                     | ratioofspecificheat                  |
| Reaction rate                               | reactionrate                         |
| Reciprocal area                             | reciprocalarea                       |
| Reciprocal initial interface distance       | reciprocallength_i                   |
| Reciprocal wall distance                    | reciprocallength                     |
| Recombination rate (domain)                 | recombinationratedomain              |
| Reduced electric field                      | reducedelectricfield                 |
| Reduced electron diffusivity                | reduceddiffusivity                   |
| Reduced electron mobility                   | reducedmobility                      |
|                                             |                                      |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES. |                               |
|---------------------------------------------|-------------------------------|
| PHYSICAL QUANTITY                           | NAME                          |
| Relative permeability                       | relpermeability               |
| Relative permittivity                       | relpermittivity               |
| Resistance                                  | resistance                    |
| Resistivity                                 | resistivity                   |
| Scattering coefficient                      | scattering                    |
| Secondary emission energy flux              | energyflux                    |
| Secondary emission flux                     | particleflux                  |
| Seebeck coefficient                         | seebeckcoefficient            |
| Solid angle                                 | solidangle                    |
| Space charge density                        | spacechargedensity            |
| Specific dissipation rate                   | specificdissipationrate       |
| Specific energy                             | specificenergy                |
| Speed of sound                              | soundspeed                    |
| Spring constant per unit area               | springconstantperarea         |
| Spring constant per unit length             | springconstantperlength       |
| Spring constant per unit volume             | springconstantpervolume       |
| Squared slip velocity                       | slipvelocity                  |
| Storage                                     | storage                       |
| Strain energy per unit area                 | energydensityperarea          |
| Strain energy per unit length               | energydensityperlength        |
| Strain reference temperature                | strainreferencetemperature    |
| Stress tensor                               | stress                        |
| Substance                                   | substance                     |
| Surface capacitance                         | surfacecapacitance            |
| Surface charge density                      | surfacechargedensity          |
| Surface current density                     | surfacecurrentdensity         |
| Surface electric conductivity               | surfaceconductivity           |
| Surface emissivity                          | emissivity                    |
| Surface energy density                      | surfaceenergydensity          |
| Surface magnetic current density            | surfacemagneticcurrentdensity |
| Surface resistance                          | surfaceresistance             |
| Surface site concentration                  | surfaceconcentration          |
| Surface tension coefficient                 | surfacetensioncoefficient     |
| Temperature                                 | temperature                   |
| Thermal conductivity                        | thermalconductivity           |
| Time                                        | time                          |
| Time change in pressure head                | timechangeinpressurehead      |
| Torque                                      | torque                        |
| Total damping constant                      | dampingconstant               |
| Total spring constant                       | springconstant                |
|                                             |                               |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| PHYSICAL QUANTITY                      | NAME                        |
|----------------------------------------|-----------------------------|
| Trap density distribution (domain)     | trapdensitydomain           |
| Turbulent dissipation rate             | turbulentdissipationrate    |
| Turbulent kinetic energy               | turbulentkineticenergy      |
| Undamped turbulent kinematic viscosity | turbulentkinematicviscosity |
| Velocity field                         | velocity                    |
| Velocity potential                     | velocitypotential           |
| Volume                                 | volume                      |
| Volume fraction                        | volumefraction              |
| Volume per time                        | volumepertime               |
| Volumetric heat capacity               | volumetricheatcapacity      |
| Wave number                            | wavenumber                  |
| Wavelength                             | wavelength                  |
| Young's modulus                        | youngsmodulus               |

#### **SEE ALSO**

model.func(), model.physics()

*model.mesh()*

Meshing sequences.

![](_page_127_Picture_6.jpeg)

See the Mesh section for more information.

#### **SYNTAX**

```
model.component(<ctag>).mesh().create(<tag>,<gtag>);
model.component(<ctag>).mesh().remove(<tag>);
model.component(<ctag>).mesh(<tag>).create(<ftag>,operation);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag2>,operation);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature().meshMethod
model.component(<ctag>).mesh(<tag>).current(<ftag>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).active(boolean);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).isActive();
model.component(<ctag>).mesh(<tag>).feature().move(<ftag>,<position>);
model.component(<ctag>).mesh(<tag>).feature().remove(<ftag>);
model.component(<ctag>).mesh(<tag>).feature().image();
model.component(<ctag>).mesh(<tag>).clearMesh();
model.component(<ctag>).mesh(<tag>).geom();
model.component(<ctag>).mesh(<tag>).image();
model.component(<ctag>).mesh(<tag>).run(<ftag>);
model.component(<ctag>).mesh(<tag>).run();
model.component(<ctag>).mesh().run();
model.component(<ctag>).mesh(<tag>).current();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).status();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).message();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).componentSelection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).outputSelection();
model.component(<ctag>).mesh(<tag>).meshGetMethod
model.component(<ctag>).mesh(<tag>).data().meshModificationMethod
model.component(<ctag>).mesh(<tag>).stat().meshStatisticsMethod
model.component(<ctag>).mesh(<tag>).measure().measurementMethod
model.component(<ctag>).mesh(<tag>).export(<filename>);
DESCRIPTION
Creating and Deleting a Meshing Sequence
model.component(<ctag>).mesh().create(<tag>,<gtag>) creates a meshing sequence (or just mesh) for the 
geometry sequence <gtag> and assigns it the tag <tag>.
model.component(<ctag>).mesh().remove(<tag>) removes the meshing sequence <tag>.
Creating, Editing, and Deleting Features
model.component(<ctag>).mesh(<tag>).create(<ftag>,operation) adds a feature <ftag> of type 
operation to the meshing sequence <tag>, after the current feature.
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>) sets the property 
property defined for the feature <ftag> to the value <value>. All data types listed in Table 2-4 are supported; 
the applicable data types differ between the properties. String expressions can use parameters from model.param().
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property) returns the value of a 
property in the feature <ftag>.
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().selMethod manages the 
selection of the feature <ftag>. The available selection methods are described in Selection Methods.
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property).selMethod
manipulates the selection of the property property. The available selection methods are described in Selection
```

Methods.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature()*.meshMethod* manages the entity list for the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).current(*<ftag>*) sets the current feature to be *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).active(false) disables the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).active(true) enables the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).isActive() returns true if the feature *<ftag>* is enabled, and false otherwise.

model.component(*<ctag>*).mesh(<*tag*>).feature(<*ftag*>)).

getAllowedPropertyValues(property) returns the set of allowed values for a property if the set is a finite set of strings; otherwise, it returns null.

model.component(*<ctag>*).mesh(*<tag>*).feature().move(*<ftag>,<position>*) moves the feature *<ftag>* to the zero indexed position *<position>* in the sequence.

model.component(*<ctag>*).mesh(*<tag>*).feature().remove(*<ftag>*) removes the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).clearMesh() removes all features from the sequence and clears the mesh.

## *Building Features*

After each build operation, the current feature is set as the last of features that were built. The mesh is updated to be the mesh generated by these features.

model.component(*<ctag>*).mesh(*<tag>*).run(*<ftag>*) builds all features up to (and including) the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).run() builds all features.

model.component(*<ctag>*).mesh().run() builds all meshing sequences.

#### *Getting Build Status*

String fTag = model.component(*<ctag>*).mesh(*<tag>*).current() returns the tag of the current feature. If the current state is before the first feature, the empty string "" is returned.

String status = model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).status() returns the status of the feature *<ftag>*. The status is built, warning, needs\_rebuild, edited, or error.

String msg = model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).message() returns the warning/error message of the feature *<ftag>*.

# *Getting Tags of Selections*

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).componentSelection() returns tags of selection output objects for use in selections in the component *<ctag>*. It returns an empty string array if there are no defined selections.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).outputSelection() returns the tags of selections output objects for use in selections within the meshing sequence. It returns an empty string array if there are no defined selections.

#### *Getting and Setting Mesh Data*

model.component(*<ctag>*).mesh(*<tag>*).*meshGetMethod* gets mesh data from the mesh *<tag>*. The available methods are described in Accessing Mesh Data.

model.component(*<ctag>*).mesh(*<tag>*).data().*meshModificationMethods* are used to modify mesh data on a low level. You can access and modify individual elements. The available methods are described in Accessing Mesh Data.

model.component(*<ctag>*).mesh(*<tag>*).data().createMesh() transfers the modified data into to the mesh *<tag>*. See also Setting or Modifying Mesh Data.

*Mesh Statistics*

model.component(*<ctag>*).mesh(*<tag>*).stat().selection().*selMethod* can be used to select a number of geometric entities for which statistics is wanted. The available selection methods are described in Selection Methods.

model.component(*<ctag>*).geom(*<tag>*).stat().*meshStatisticsMethod* returns mesh statistics about the selected geometric entities. The available methods are described in Information and Statistics.

*Exporting a Mesh to File*

model.component(*<ctag>*).mesh(*<tag>*).export(*<filename>*) exports the mesh *<tag>* to an MPHBIN- or MPHTXT-file.

*Plotting a Mesh*

Use the model.component(<ctag>).mesh(<tag>).image() and

model.component(<ctag>).mesh(<tag>).feature().image() methods to plotting and exporting mesh images. See Plotting and Exporting Images.

*Selection Methods*

selection.allGeom() sets the selection to be the entire geometry (that is, all geometric entities).

selection.remaining() sets the selection to be the geometric entities that remains to be meshed when the feature is about to be built.

selection.geom(*<dim>*).all() sets all geometric entities in dimension *<dim>*.

selection.geom(*<dim>*).set(*<entities>*) sets the selection to be the geometric entities specified in the integer array *<entities>* in dimension *<dim>*.

selection.geom(*<dim>*).add(*<entities>*) adds the geometric entities specified in the integer array *<entities>* in dimension *<dim>* to the selection.

selection.geom(*<dim>*).remove(*<entities>*) removes the geometric entities specified in the integer array *<entities>* in dimension *<dim>* from the selection.

selection.geom(*<dim>*).clear() clears the selection.

To access the selections use:

int[] dims = selection.dimension() returns the geometric entity level in dims[0] for the entities in the selection. If dims is empty the selection defines the entire geometry.

selection.isRemaining() returns true if the selection specifies the remaining entities, otherwise false.

selection.dom(*<dim>*) returns the geometric entities in dimension *<dim>* for the selection.

*Getting the Geometry Tag*

model.mesh(*<tag>*).geom() returns the geometry tag. This can be useful when working with several geometries in the same model.

*Measuring the Geometric Entities*

model.component(<tag>).measure().*measurementMethod* returns the volume, area, length, vertex coordinates, average coordinates, or distance between two vertices according to the entity selection. For a list of the available measurement methods to use, see Measurement Methods. For information about how to select entities, see Selections.

#### **EXAMPLE**

Create a 2D geometry by the union of a circle and square. Build a triangle mesh with hmax = 0.1 in domains 1 and 3, and hmax = 0.01 in domain 2.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 2);
  MeshSequence m = model.component("comp1").mesh().create("mesh1", "geom1");
  g.create("c1", "Circle");
  g.create("sq1", "Square");
  g.create("uni1", "Union");
  g.feature("uni1").selection("input").set(new String[]{"c1", "sq1"});
  m.create("size1", "Size");
  m.feature("size1").selection().geom(2).set(new int[]{1, 3});
  m.feature("size1").set("hmax", "0.1");
  m.create("size2", "Size");
  m.feature("size2").selection().geom(2).set(new int[]{2});
  m.feature("size2").set("hmax", "0.025");
  m.create("ftri1", "FreeTri");
  m.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 2);
  m = model.component('comp1').mesh.create('mesh1', 'geom1');
  g.create('c1', 'Circle');
  g.create('sq1', 'Square');
  g.create('uni1', 'Union');
  g.feature('uni1').selection('input').set({'c1', 'sq1'});
  m.create('size1', 'Size');
  m.feature('size1').selection.geom(2).set([1, 3]);
  m.feature('size1').set('hmax', '0.1');
  m.create('size2', 'Size');
  m.feature('size2').selection.geom(2).set(2);
  m.feature('size2').set('hmax', '0.025');
  m.create('ftri1', 'FreeTri');
  m.run;
SEE ALSO
model.geom()
```

*model.methodCall()*

Calling model methods. You can create and run model methods to extend the functionality of a COMSOL Multiphysics simulation using custom methods. See the *Application Programming Guide* for more information about creating and using methods.

![](_page_131_Picture_6.jpeg)

The Model Java-file history for running a method call in the COMSOL Desktop contains the history produced while running the method call and not the method itself.

#### **SYNTAX**

```
model.methodCall().create(<tag>,<methodname>);
model.methodCall(<tag>).run();
model.methodCall(<tag>).inputNames();
model.methodCall(<tag>).methodName();
model.methodCall(<tag>).methods();
model.methodCall(<tag>).set(<param>,<expr>);
```

#### **DESCRIPTION**

model.methodCall(*<tag>*) represents a method call for a model method.

model.methodCall().create(*<tag>*,*<methodname>*) creates a method call for the model method *<methodname>* with the given tag.

model.methodCall(*<tag>*).inputNames(); returns the names of input parameters of a method reference by a given method call.

model.methodCall(*<tag>*).methodName returns the name of the method that the method call runs.

model.methodCall(*<tag>*).methods(); returns the names of all methods in the model.

model.methodCall(*<tag>*).run() runs the method call with the tag *<tag>*.

The following examples show how you can specify the names of an input parameter, the value of a 1D double array parameter, and the value of a boolean parameter:

```
model.methodCall(<tag>).set("paramname","p1");
model.methodCall(<tag>).set("paramvalues",new double[]{2.3 3.7 5.6 7.1 11.3 17.5});
model.methodCall(<tag>).set("sendmail",true);
```

Parameter names are created automatically with the appropriate types according to the inputs that have been specified in the method. This means that you can then use a natural set syntax as shown in the examples above.

## **ARGUMENTS TO METHOD CALLS**

The following table describes the names of arguments that you can use to change the value of inputs to a method call before running it:

TABLE 2-105: ARGUMENT NAMES FOR METHOD CALLS.

| ARGUMENT NAME      | SAMPLE VALUES     | DESCRIPTION                                                                                                                                                                                                   |
|--------------------|-------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| -methodinputnames  | size,times        | Comma-separated list of names of inputs (as strings) to change<br>for the method call to run.                                                                                                                 |
| -methodinputvalues | 0.8,{0.1,0.3,0.8} | Comma-separated list of the corresponding values. Arrays and<br>2D arrays are entered using curly braces.                                                                                                     |
| -methodinputfile   | Path to file      | A file to read the inputs to the method call from. This file has the<br>same format as the one used together with -appargsfile (see<br>the Application Builder documentation about application<br>arguments), |

Specifying method call inputs both from a file and individually on the command line can be combined. If an input is given both in a file and on the command line, the value given on the command line overrides the value given in the file. If a value is given several times in the file or on the command line, the last given value overrides any previous given value.

![](_page_132_Picture_17.jpeg)

To use units in values passed as arguments to -methodinputvalues, enclose them in single quotation marks. For example, "'500[m]','45[s]'"

#### **USING METHOD CALLS FROM A MODEL JAVA-FILE**

You can use the model method in a method call from a Model Java-file if the file starts by loading an MPH-file (including its model method) and then calls a run of a method call. However, in this context, model methods do not support user interface commands or file schema. The table below table lists user interface commands that are not supported:

TABLE 2-106: UNSUPPORTED USER INTERFACE COMMANDS IN MODEL JAVA-FILES.

| COMMAND             | RESULT                      |
|---------------------|-----------------------------|
| Alert               | Command is ignored          |
| Confirm             | Command causes an exception |
| DebugLog            | Command is ignored          |
| FileOpen            | Command causes an exception |
| FileSaveAs          | Command causes an exception |
| ImportFile          | Command causes an exception |
| Message             | Command is ignored          |
| OpenURL             | Command is ignored          |
| Request             | Command causes an exception |
| SelectNode          | Command is ignored          |
| SetProgress         | Command is ignored          |
| SetProgressInterval | Command is ignored          |
| ZoomExtents         | Command is ignored          |

#### **SEE ALSO**

model.form()

# *model.modelNode()*

Deprecated alias for model.component() for accessing model component nodes.

![](_page_133_Picture_8.jpeg)

This syntax is still used when you turn off the component syntax (clear the **Generate code using component syntax** checkbox on the **Application Builder>Methods** page in the **Preferences** window). Otherwise, the code that COMSOL Multiphysics creates uses model.component().create(*<tag>*) instead of model.modelNode().create(*<tag>*), and so on. See model.component().

# *model.multiphysics()*

Add multiphysics features to this feature container.

#### **SYNTAX**

```
model.multiphysics().create(<tag>,...);
model.multiphysics().image()
```

## **DESCRIPTION**

model.multiphysics().create(*<tag>*,*<coupling>*,*<geom>*,*<sdim>*); adds a multiphysics coupling with the tag and the name to a geometry and a space dimension. Use -1 as the space dimension to indicate a coupling valid in the entire model.

#### **EXAMPLE**

In a model with a Solid Mechanics interface and a Heat Transfer in Solids interface, add a Thermal Expansion multiphysics coupling on the domain level and a Temperature Coupling on a model-wide level in a geometry geom1:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom.create("geom1", 3);
  model.multiphysics().create("te1","ThermalExpansion","geom1",3);
  model.multiphysics().create("tc1","TemperatureCoupling","geom1",-1);
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 3);
  model.multiphysics.create('te1','ThermalExpansion','geom1',3);
  model.multiphysics.create('tc1','TemperatureCoupling','geom1',-1);
model.nodeGroup()
```

Node groups.

You can create node groups to structure the nodes in the model tree. It can be useful in this context when editing a Model Java-file created in the COMSOL Desktop and then opens it in the COMSOL Desktop again. It can also be useful in model methods.

#### **SYNTAX**

```
model.nodeGroup().create(<tag>,<type>);
model.nodeGroup().create(<tag>,<type>,<context>);
model.nodeGroup(<tag>).add(<nodetag>);
model.nodeGroup(<tag>).add(<parenttag>,<nodetag>);
model.nodeGroup().ungroup(<tag>);
```

There is also a component list model.component("comp1").nodeGroup() with the groups belonging to a component.

## **DESCRIPTION**

```
model.nodeGroup(<tag>) represents a node group in the model tree.
model.nodeGroup().create(<tag>,<type>) creates a node group of the specified type. For example,
  model.nodeGroup().create("grp1", "GlobalDefinitions");
creates a node group with the tag "grp1" under the Global Definitions node in the model tree.
model.nodeGroup().create(<tag>,<type>,<context>) creates a group of the specified type in the specified 
context. For example,
  model.nodeGroup().create("g", "Geometry", "geom1")
creates a group in a geometry sequence.
```

Use model.nodeGroup().ungroup(*<tag>*) to ungroup (remove) a group. Removing the group does not remove its members from the model.

For a node group, the following methods are available:

- **•** Use nodeGroup.add(*<type>*,*<tag>*) to add a node with the tag *<tag>* of the type *<type>* to the group. For example group.add("func", "an1") adds model.func("an1") to the group.
- **•** Use nodeGroup.remove(*<type>*,*<tag>*) to remove a node with the tag *<tag>* of the type *<type>* from the group.

## **EXAMPLE**

The following example creates a node group under Definitions in a Component, adds two Model Input features to it, and then removes it by the ungroup method:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1", true);
  model.component("comp1").geom().create("geom1", 3);
  model.component("comp1").common().create("minpt1", "CommonInputDef");
  model.component("comp1").common().create("minpt2", "CommonInputDef");
  model.nodeGroup().create("grp1", "Definitions", "comp1");
  model.nodeGroup("grp1").set("type", "commondef");
  model.nodeGroup("grp1").add("common", "minpt1");
  model.nodeGroup("grp1").add("common", "minpt2");
  model.nodeGroup().ungroup("grp1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1',true);
  model.component('comp1').geom.create('geom1',3);
  model.component('comp1').common.create('minpt1','CommonInputDef');
  model.component('comp1').common().create('minpt2', 'CommonInputDef');
  model.nodeGroup.create('grp1','Definitions','comp1');
  model.nodeGroup('grp1').set('type','commondef');
  model.nodeGroup('grp1').add('common','minpt1');
  model.nodeGroup('grp1').add('common','minpt2');
  model.nodeGroup.ungroup('grp1');
```

Create global equations (ODEs and DAEs).

#### **SYNTAX**

*model.ode()*

```
model.ode().create(<tag>);
model.ode(<tag>).state(<statelist>);
model.ode(<tag>).state(<pos>,<state>);
model.ode(<tag>).ode(<state>,<equation>);
model.ode(<tag>).descr(<state>,<descr>);
model.ode(<tag>).weak(<wlist>);
model.ode(<tag>).weak(<pos>,<wexpr>);
model.ode(<tag>).discrete(<boolean>);
model.ode(<tag>).valueType(prop);
model.ode(<tag>).state();
model.ode(<tag>).ode(<state>);
model.ode(<tag>).descr(<state>);
model.ode(<tag>).weak();
model.ode(<tag>).discrete();
model.ode(<tag>).valueType();
```

# **DESCRIPTION**

model.ode(*<tag>*) returns a global equation (or an ODE or a DAE) with tag *<tag>*.

```
model.ode().create(<tag>) creates a global equation with tag <tag>.
model.ode(<tag>).create(<tag>,<fname>) creates an ODE field with tag <tag> with the field name <fname>.
model.ode(<tag>).state(<statelist>) sets the states of the global equation tagged <tag> according to the 
list <statelist>.
model.ode(<tag>).state(<pos>,<state>) edits the state at position <pos> in the state vector for the global 
equation <tag>.
model.ode(<tag>).ode(<state>,<equation>) sets the equation for the state <state>. If the state variable has 
not previously been added using model.ode(<tag>).state(<statelist>) then <state> is appended to the list 
of state variables.
model.ode(<tag>).descr(<state>,<descr>) sets the description for the state <state>.
model.ode(<tag>).weak(<wlist>) set weak equations. <wlist> is a list of weak expressions.
model.ode(<tag>).weak(<pos>,<wexpr>) sets the weak expression at position <pos> in the list of weak 
expressions.
model.ode(<tag>).field(<fname>) sets the ODE field name.
model.ode(<tag>).field() returns the ODE field name as a string.
model.ode(<tag>).state() returns the state variables as a string array.
model.ode(<tag>).ode(<state>) returns the global equation for the state variable <state> as a string.
model.ode(<tag>).descr(<state>) returns the description of the state variable <state> as a string.
model.ode(<tag>).weak() returns the weak equations as a string vector of weak expressions.
```

model.ode(*<tag>*).discrete(true) specifies that the global equation contains event states.

model.ode(*<tag>*).valueType(*prop*) specifies value type as real or complex when splitting of complex variables in real and imaginary parts has been turned on.

model.ode(*<tag>*).valueType() returns the value type.

# **EXAMPLE**

Define a global equations with the variables *u* and *w*, the ODEs *ut* + 1 = 0 and *vt* + 1 = 0, where the subscript *t* indicates the derivative with respect to time. Also define a weak expression test(*u*)·*v*.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.ode().create("ode1");
  model.ode("ode1").ode("u","ut+1");
  model.ode("ode1").ode("v","vt-1");
  model.ode("ode1").weak(new String[]{"test(u)*v"});
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.ode.create('ode1');
  model.ode('ode1').ode('u','ut+1');
  model.ode('ode1').ode('v','vt-1');
  model.ode('ode1').weak({'test(u)*v'});
SEE ALSO
model.init(), model.solverEvent()
```

Optimization interface.

#### **SYNTAX**

```
model.opt().objective().create(<tag>,type)
model.opt().objective(<tag>).set(property,<value>)
model.opt().constr().create(<tag>)
model.opt().constr(<tag>).etc
model.opt().gconstr().create(<tag>)
model.opt().gconstr(<tag>).constr(<constrExpr>)
model.opt().gconstr(<tag>).lbound(<lboundExpr>)
model.opt().gconstr(<tag>).ubound(<uboundExpr>)
```

## **DESCRIPTION**

The purpose of model.opt is to manage information relating to optimization and sensitivity analysis. Most of the fields under model.opt are read and interpreted directly by the optimization and sensitivity solvers. They never affect the result of other solvers.

model.opt().objective().create(*<tag>*,*type*) adds an objective function of the specified type. The supported types are Global and LeastSquares.

model.opt().objective(*<tag>*).set(property,*<value>*) sets an objective function property. Objective functions of type Global support the single property expr, which takes a globally defined expression as value. Allowed properties for objectives of type LeastSquares are described below.

model.opt().objective(*<tag>*).selection().named(*<seltag>*) assigns the objective function to the named selection *<seltag>*.

model.opt().objective(*<tag>*).selection().set(...) defines a local selection that assigns the objective function to geometric entities. For a complete list of methods available under selection(), see model.selection(). Only objective functions of type LeastSquares require a selection. See further below.

model.opt().constr().create(*<tag>*) adds a pointwise (mesh-based) constraint on the control variables. The syntax is shared with model.constr() with the exception that the ctype parameter expects values constr, lbound, and ubound for constraint, lower bound, and upper bound, respectively.

model.opt().gconstr().create(*<tag>*) registers a global constraint with the optimization solvers. Such constraints consist of a globally available expression, which can depend both on optimization variables and on the forward PDE solution, together with likewise global expressions for lower and upper bound.

```
model.opt().gconstr(<tag>).constr(<constrExpr>) specifies a global constraint expression.
```

```
model.opt().gconstr(<tag>).lbound(<lboundExpr>) sets lower bound for the constraint.
```

model.opt().gconstr(*<tag>*).ubound(*<lboundExpr>*) sets upper bound for the constraint.

Least-squares objective functions are specified in terms of measured values, stored on file, together with information about how corresponding expressions can be evaluated for the current control variable values. An overview of the allowed properties is given in the table below.

TABLE 2-107: PROPERTIES FOR OBJECTIVE FUNCTION TYPE LEASTSQUARES.

| PROPERTY           | VALUE        | DESCRIPTION                             |
|--------------------|--------------|-----------------------------------------|
| filename           | String       | Full path of the measurement data file. |
| paramnames         | String array | Parameters used in the experiment.      |
| paramexprs         | String array | Values of the given parameters.         |
| columntypes        | String array | List of column type indicators.         |
| columnexprsweights | String array | Column contribution weights.            |
| columnexprs        | String array | Measurement expressions.                |

In principle, you must specify the following for each measured value:

- **•** To which experiment the value belongs and parameters for that experiment
- **•** Which expression to evaluate
- **•** Where the expression must be evaluated
- **•** For which time or parameter value the evaluation must be performed

Each *experiment* corresponds to a solution of the forward problem with a given set of parameter values. In practice, measurements for each experiment must be stored in a separate file, and specified as a separate LeastSquares objective feature where you give the full path of the measurement data file in the filename property. Parameters specified in the paramnames property are given the values specified using paramexprs property during the forward solution. One forward solution is performed for each unique set of parameter names and values.

The required measurement data file format is row- and column-oriented. Entries on each row must be separated by commas or semicolons, while rows are separated by line feeds. Use the columntypes property to specify the content of each column, in the order that they appear in the data file, according to the following table:

TABLE 2-108: ALLOWED COLUMN TYPES.

| TYPE  | COLUMN CONTENTS                |
|-------|--------------------------------|
| time  | Actual measurement times       |
| param | Actual parameter values        |
| coord | Actual measurement coordinates |
| value | Measured values                |
| none  | Ignored column                 |

Columns of type time are only allowed for transient problems. The measurements on the same row are assumed to be made at the specified time. Forward model values are interpolated to the given times. There must only be one column of type time, and it requires no further parameters.

Columns of type param contain parameter values for which the measurements on the same row have been made, and for which the forward problem must be solved. A data file can contain multiple parameter columns. Corresponding parameter names must be given in the columnnames property.

Columns of type coord contain global coordinates where the measurements on the same row have been made. The coordinate columns must be coupled to a coordinate variable by specifying the coordinate variable name in the columnnames property for the given column and the frame tag spatial, material, mesh, or geometry in the

columnexprs property. For example, in a 3D model, you need three columns of type coord with columnnames entries x, y, and z, respectively.

A value column contains measured data. For each value column, a corresponding expression to be evaluated must be specified in the columnexprs property. Entries in value columns are interpreted as real numbers when possible. Anything else, including for example hash marks (#) and the literal strings nan, Nan, NaN, and NAN is interpreted as an illegal value which is excluded from the least squares objective function evaluation. A weight for the objective contribution from a column, multiplying the squared difference between the measured value and the expression, can be specified as a positive globally expression that can be evaluated using the columnexprsweights property. To exclude a measurement from a comma-separated file, you can also simply leave a value column empty.

Columns of type none can be used to exclude columns from the data file.

Coordinates are interpreted as global in the context of the objective feature's selection. This means that the value column expressions are evaluated at the points within the selection that best match the given coordinates. If the interpolation fails for some point because its coordinates lie too far outside the selection, the corresponding value is ignored.

# *model.pair()*

Create and define identity pairs, contact pairs, and sector symmetry pairs for assemble geometries.

#### **SYNTAX**

```
model.component(<ctag>).pair().create(<tag>,type,<gtag>);
model.component(<ctag>).pair(<tag>).type(type);
model.component(<ctag>).pair(<tag>).type();
model.component(<ctag>).pair(<tag>).pairName(<pname>);
model.component(<ctag>).pair(<tag>).pairName();
model.component(<ctag>).pair(<tag>).source().selMethod;
model.component(<ctag>).pair(<tag>).source().named(<seltag>);
model.component(<ctag>).pair(<tag>).source().named();
model.component(<ctag>).pair(<tag>).destination().selMethod;
model.component(<ctag>).pair(<tag>).destination().named(<seltag>);
model.component(<ctag>).pair(<tag>).destination().named();
model.component(<ctag>).pair(<tag>).swap();
model.component(<ctag>).pair(<tag>).manualFrame(manual);
model.component(<ctag>).pair(<tag>).manualFrame();
model.component(<ctag>).pair(<tag>).srcFrame(<frame>);
model.component(<ctag>).pair(<tag>).srcFrame();
model.component(<ctag>).pair(<tag>).dstFrame(<frame>);
model.component(<ctag>).pair(<tag>).dstFrame();
model.component(<ctag>).pair(<tag>).hasAutoSelection();
model.component(<ctag>).pair(<tag>).manualSelection(manual);
model.component(<ctag>).pair(<tag>).manualSelection();
model.component(<ctag>).pair(<tag>).searchMethod(method);
model.component(<ctag>).pair(<tag>).searchMethod();
model.component(<ctag>).pair(<tag>).manualDist(manual);
model.component(<ctag>).pair(<tag>).manualDist();
model.component(<ctag>).pair(<tag>).searchDist(<dist>);
model.component(<ctag>).pair(<tag>).searchDist();
model.component(<ctag>).pair(<tag>).opName(src2dst);
model.component(<ctag>).pair(<tag>).mphOpName(src2dst);
model.component(<ctag>).pair(<tag>).gapName(src2dst);
model.component(<ctag>).pair(<tag>).extTol(tol);
model.component(<ctag>).pair(<tag>).manualSectorSymmetry(boolean);
model.component(<ctag>).pair(<tag>).nSector(integer);
model.component(<ctag>).pair(<tag>).basePoint(string[]);
model.component(<ctag>).pair(<tag>).axis(string[]);
model.component(<ctag>).pair(<tag>).active(boolean);
model.component(<ctag>).pair(<tag>).isActive();
model.component(<ctag>).pair().remove(<tag>);
```

Not all of the syntaxes above are available for all pair types. See the following section for more information.

# **DESCRIPTION**

```
model.component(<ctag>).pair().create(<tag>,type,<gtag>) creates a pair with tag <tag> in the 
geometry with tag <gtag> in the component with tag <ctag>. The type type is Contact, Identity, or 
SectorSymmetry. model.component(<ctag>).pair(<tag>).type() returns the pair type as a string. 
model.component(<ctag>).pair(<tag>).type(type) changes the pair type.
model.component(<ctag>).pair(<tag>).pairName(<pname>) sets the pair name, which is used as a suffix in 
operator names and variable names. By default, the pair name is the same as the tag. 
model.component(<ctag>).pair(<tag>).pairName() returns the pair name.
model.component(<ctag>).pair(<tag>).source().named(<seltag>) assigns the source boundaries to the 
named selection <seltag>. 
model.component(<ctag>).pair(<tag>).source().set(...) defines a local selection that assigns the source 
boundaries to geometric entities. For a complete list of methods available under 
model.component(<ctag>).pair(<tag>).source(), see model.selection().
model.component(<ctag>).pair(<tag>).destination().named(<seltag>) assigns the destination 
boundaries to the named selection <seltag>.
```

model.component(*<ctag>*).pair(*<tag>*).destination().set(...) defines a local selection that assigns the destination boundaries to geometric entities. For a complete list of methods available under model.component(*<ctag>*).pair(*<tag>*).destination(), see model.selection().

model.component(*<ctag>*).pair(*<tag>*).swap() swaps the source and destination selections.

model.component(*<ctag>*).pair(*<tag>*).srcFrame(*<frame>*) and

model.pair(*<tag>*).dstFrame(*<frame>*) sets the source and destination frames for the identity mapping; the srcFrame property is also available for the frame setting for sector symmetry pairs. Manual control of frames is automatically activated when these methods are used. The argument *<frame>* can have the values geometry, material, mesh or spatial. The default is spatial. These frames are only used for identity pairs.

model.component(*<ctag>*).pair(*<tag>*).srcFrame() and

model.component(*<ctag>*).pair(*<tag>*).dstFrame() returns the frame tags.

model.component(*<ctag>*).pair(*<tag>*).hasAutoSelection() returns true if the contact pair was created automatically, using the create pairs checkbox in the finalize geometry node.

model.component(*<ctag>*).pair(*<tag>*).manualFrame(*manual*) enables or disables manual control of the frames for source and destination of an identity pair. The argument *manual* is a boolean.

model.component(*<ctag>*).pair(*<tag>*).manualFrame() returns true if manual control of frames is enabled, and false otherwise. Note that model.component(*<ctag>*).pair(*<tag>*).srcFrame(*<frame>*) and model.component(*<ctag>*).pair(*<tag>*).dstFrame(*<frame>*) enables manual control of frames.

model.component(*<ctag>*).pair(*<tag>*).manualSelection(*manual*) enables or disables manual control of the selections for a pair that was created automatically.

model.component(*<ctag>*).pair(*<tag>*).manualSelection() returns true if manual control of selections is enabled, and false otherwise.

model.component(*<ctag>*).pair(*<tag>*).searchMethod(*method*) sets the search method for a contact pair. The argument *method* can be hierarchical, fast, or direct. The default is hierarchical in 2D and 3D and fast in 1D, where hierarchical is not available.

model.component(*<ctag>*).pair(*<tag>*).searchMethod() returns the search method.

model.component(*<ctag>*).pair(*<tag>*).manualDist(*manual*) enables or disables manual control of the search distance for a pair. The argument *manual* is a boolean. The default value false means that the search distance is determined automatically. model.component(*<ctag>*).pair(*<tag>*).manualDist() returns true if manual control of search distance is enabled and false otherwise.

model.component(*<ctag>*).pair(*<tag>*).searchDist(*<dist>*) sets the search distance for a contact or identity pair when manual control of the search distance is enabled. The argument *<dist>* is a string whose default unit is the geometry's length unit. The default is 1e-2.

model.component(*<ctag>*).pair(*<tag>*).searchDist() returns the search distance as a string.

model.component(*<ctag>*).pair(*<tag>*).opName(*src2dst*) returns the name of the operator transferring an expression from source to destination (if *src2dst*=true) or from destination to source (if *src2dst*=false).

model.component(*<ctag>*).pair(*<tag>*).mphOpName(*src2dst*) returns the name of the multiphysics operator transferring an expression from source to destination (if *src2dst*=true) or from destination to source (if *src2dst*=false). When the test operator is applied on this operator, it does not give any contribution (reaction force) for the structural mechanics interfaces' degrees of freedom due to the variable point mapping. These operators are available only for contact pairs.

model.component(*<ctag>*).pair(*<tag>*).gapName(*src2dst*) returns the name of the geometric gap variable seen from the destination (if *src2dst*=true) or seen from the source (if *src2dst*=false). These variables are available only for contact pairs.

model.component(*<ctag>*).pair(*<tag>*).elementwise(*mapping*) controls the element mapping for compatible meshes. *mapping* can be on, off, or require, where you use the last option to require compatible meshes.

model.component(*<ctag>*).pair(*<tag>*)).compatibleMeshesTol(*tol*) provides the ability to specify a userdefined relative tolerance *tol* for compatible meshes, if the elementwise property is set to on or require. The default tolerance is 0.001.

model.component(*<ctag>*).pair(*<tag>*)).manualSectorSymmetry(*boolean*) specifies if the sector symmetry settings are set automatically (if false) or manually (if true) for sector symmetry pairs. If set to true, the following three properties are available:

model.component(*<ctag>*).pair(*<tag>*)).nSector(*integer*) specifies the number of sector for sector symmetry pairs.

model.component(*<ctag>*).pair(*<tag>*)).basePoint(*string[]*) species the axis base point for the rotation for sector symmetry pairs. Give an *x*-coordinate in 1D, *x*- and *y*-coordinates in 2D, and *x*-, *y*-, and *z*-coordinates in 3D.

model.component(*<ctag>*).pair(*<tag>*)).axis(*string[]*) species the axis of rotation for sector symmetry pairs in 3D. Give the *x*-, *y*-, and *z*-coordinates.

model.component(*<ctag>*).pair(*<tag>*)).extTol(*tol*) species the extrapolation tolerance for sector symmetry pairs.

model.component(*<ctag>*).pair(*<tag>*).active(*boolean*) enables or disables the pair.

boolean enabled = model.component(*<ctag>*).pair(*<tag>*).isActive() returns true if the pair is enabled, and false otherwise.

model.component(*<ctag>*).pair().remove(*<tag>*) deletes the pair.

#### **EXAMPLE**

Create a contact pair in the geometry geom1 with source boundaries 4 and 6 and destination boundaries 10 and 12.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("blk1", "Block");
  g.create("blk2", "Block");
  g.feature("blk2").set("pos", new String[]{"0.5", "0.5", "1"});
  g.feature("fin").name("Form Assembly");
  g.feature("fin").set("action", "assembly");
  g.feature("fin").set("imprint", true);
  g.feature("fin").set("createpairs", false);
  g.run();
  model.component("comp1").pair().create("p1", "Contact", "geom1");
  model.component("comp1").pair("p1").source().set(new int[]{4, 6});
  model.component("comp1").pair("p1").destination().set(new int[]{10, 12});
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('blk1', 'Block');
  g.create('blk2', 'Block');
  g.feature('blk2').set('pos', {'0.5', '0.5', '1'});
  g.feature('fin').name('Form Assembly');
  g.feature('fin').set('action', 'assembly');
```

```
g.feature('fin').set('imprint', true);
  g.feature('fin').set('createpairs', false);
  g.run;
  model.component('comp1').pair.create('p1', 'Contact', 'geom1');
  model.component('comp1').pair('p1').source().set([4, 6]);
  model.component('comp1').pair('p1').destination.set([10, 12]);
model.param() and model.result().param()
```

Add, define, and remove global parameters. For parameters in results and postprocessing, model.result().param() works in the same way as model.param().

#### **SYNTAX**

```
model.param().set(<param>,<expr>);
model.param().set(<param>,<expr>,<descr>);
model.param().descr(<param>,<descr>);
model.param().remove(<param>);
model.param().clear();
model.param().varnames();
model.param().get(<param>);
model.param().descr(<param>);
model.param().evaluate(<param>);
model.param().evaluateComplex(<param>);
model.param().evaluateUnit(<param>);
model.param().loadFile(tempFile, ...);
model.param().saveFile(tempFile, ...);
model.param(<ptag>).setShowInParamSel(true|false);
model.param(<ptag>).paramCase().create(<pctag>);
model.param(<ptag>).paramCase(<pctag>).set(<param>,<expr>);
model.param(<ptag>).setFromCase(<param>,<pctag>);
```

The last four syntaxes above are only applicable for global parameters and not for parameters in the results.

## **DESCRIPTION**

model.param() is a collection of global model parameters. Likewise, model.result().param() is a collection of model parameters for results and postprocessing.

```
model.param().set(<param>,<expr>) defines the parameter <param> as <expr>.
```

model.param().set(*<param>*,*<expr>*,*<descr>*) defines the parameter *<param>* as *<expr>* and assigns it the description *<descr>*.

model.param().descr(*<param>*,*<descr>*) sets the description for the parameter *<param>*.

model.param().remove(*<param>*) removes the parameter *<param>*. model.param().clear() removes all parameters.

model.param().varnames() returns the names of all parameters as a string array.

model.param().get(*<param>*) returns the parameter value as a string.

model.param().descr(*<param>*) returns the parameter description as a string.

model.param().evaluate(*<param>*) evaluates the value of the parameter *<param>* as a double real-valued floating-point value. For complex-valued parameters, use the evaluateComplex method instead.

model.param().evaluateComplex(*<param>*) evaluates the value of the parameter *<param>* as a double floatingpoint array with the real and imaginary part of a complex-valued parameter.

model.param().evaluateUnit(*<param>*) returns the unit of the parameter *<param>* if defined. It returns null if the parameter has no unit defined, or if the model does not use any unit system.

For model.param().loadFile() and model.param().saveFile(), see The loadFile and saveFile Methods.

Use model.param(*<ptag>*).setShowInParamSel(false); to exclude the parameters in the global parameter set in *<ptag>* in parameter selections. The default is that setShowInParamSel is true; that is, all the parameters are included in parameter selections.

model.param(*<ptag>*).paramCase().create(*<pctag>*) creates a parameter case for a set of global parameters *<ptag>*. You can create several parameter cases, where you can use the .set(*<param>*,*<expr>*); syntax to specify another expression for any existing parameter <param>. Then use

model.param(*<ptag>*).setFromCase(*<param>*,*<pctag>*); to specify the parameter case *<pctag>* as the source for the value of the parameter *<param>*.

#### **EXAMPLE**

Define the parameter c in terms of another parameter a and then remove c.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.param().set("c","1+a");
  model.param().remove("c");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.param.set('c','1+a');
  model.param.remove('c');
SEE ALSO
model.variable()
model.physics()
```

Create and define properties for a physics interface.

#### **SYNTAX**

```
model.component(<ctag>).physics().create(<tag>,physint);
model.component(<ctag>).physics().create(<tag>,physint,<geomtag>);
model.component(<ctag>).physics().create(<tag>,physint,<geomtag>,<varnames>);
model.component(<ctag>).physics(<tag>).model(<mtag>);
model.component(<ctag>).physics(<tag>).field(fieldname).fieldname(<namelist>);
model.component(<ctag>).physics(<tag>).field(fieldname).fieldname(<pos>,<name>);
model.component(<ctag>).physics(<tag>).prop(propname).set(property,<value>);
model.component(<ctag>).physics(<tag>).create(<ftag>,feature);
model.component(<ctag>).physics(<tag>).create(<ftag>,feature,<dim>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).create(<ftag2>,feature);
model.component(<ctag>).physics(<tag>).feature(<ftag>).create(<ftag2>,feature,<dim>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).physics(<tag>).feature().move(<ftag>,<position>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).feature();
model.component(<ctag>).physics(<tag>).feature(<ftag>).feature(<ftag2>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).featureInfo();
model.component(<ctag>).physics(<tag>).feature(<ftag>).featureInfo("info");
feature = model.component(<ctag>).physics(<tag>).feature(<ftag>);
feature.featureInfo("info").set(variable,<value>);
feature.featureInfo("info").getInfoTable(id);
model.component(<ctag>).physics(<tag>).model();
model.component(<ctag>).physics(<tag>).field(fieldname).fieldname();
model.component(<ctag>).physics(<tag>).scope();
model.component(<ctag>).physics(<tag>).geom();
model.component(<ctag>).physics(<tag>).image();
model.component(<ctag>).physics(<tag>).prop(propname).getType(<pname>);
model.component(<ctag>).physics(<tag>).prop(propname).param();
model.component(<ctag>).physics(<tag>).feature(<ftag>).getType(<pname>);
model.component(<ctag>).physics(<tag>).feature(<ftag>).param();
model.component(<ctag>).physics(<tag>).feature(<tag>).set(String pname, int value);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      set(String pname, int pos, int value);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      set(String pname, int pos, int[] value);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      set(String pname, int pos1, int pos2, int value);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String[] value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, double value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, double value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, double[] value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).setIndex(String name, int value, int 
  index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, int value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).feature(<tag>).
      setIndex(String name, int[] value, int index);
model.component(<ctag>).physics(<tag>).feature(<tag>).importData();
model.component(<ctag>).physics(<tag>).feature(<tag>).discardData();
```

```
model.component(<ctag>).physics(<tag>).feature(<tag>).image();
model.component(<ctag>).physics(<tag>).prop(<tag>).set(String pname, int value);
model.component(<ctag>).physics(<tag>).prop(<tag>).set(String pname, int pos, int value);
model.component(<ctag>).physics(<tag>).prop(<tag>).set(String pname, int pos, int[] value);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      set(String pname, int pos1, int pos2, int value);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, String value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, String[] value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, double value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, double value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, double[] value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, int value, int index);
model.physics(<tag>).prop(<tag>).setIndex(String name, String value, int index);
model.physics(<tag>).prop(<tag>).setIndex(String name, String value, int index);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, int value, int firstIndex, int secondIndex);
model.component(<ctag>).physics(<tag>).prop(<tag>).
      setIndex(String name, int[] value, int index);
```

The set() methods index/position arguments are 1-based. The setIndex() methods index/position arguments are 0-based. See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

## **DESCRIPTION**

model.component(*<ctag>*).physics().create(*<tag>*,*physint*) creates and returns a physics interface.

```
model.component(<ctag>).physics().create(<tag>,physint) or
```

model.component(*<ctag>*).physics().create(*<tag>*,*physint*,*<geomtag>*) adds a physics interface to the model and initializes it with defaults. The *physint* argument specifies which physics interface to create. There can be several different values of *physint* which create the same internal physics interface class, but which set different defaults. The constructor without the *<geomtag>* argument can only be used (and should be used) by 0D (spaceindependent) interfaces.

model.component(*<ctag>*).physics().create(*<tag>*,*physint*,*<geomtag>*,*<varnames>*) adds an interface with the field variable names *<varnames>*. Only interfaces supporting a varying number of field variables considers this argument. Providing the variable names in the create method rather than changes them afterward using model.component(*<ctag>*).physics(*<tag>*).field(*fieldname*).fieldname(*<namelist>*) ensures that the default features are correct.

model.component(*<ctag>*).physics(*<tag>*).field(*fieldname*).fieldname(*<namelist>*) sets a name of a dependent variable. The entity *fieldname* (which could be, for example, temperature, x-velocity, electric field) specifies which dependent variable to set the name for. The available fields are provided by the physics interface. The argument *<namelist>* can be a list of names for physics interfaces supporting an arbitrary number of dependent variables. The physics interfaces provide default names for the dependent variables.

model.component(*<ctag>*).physics(*<tag>*).field(*fieldname*).fieldname(*<pos>*,*<name>*) changes the name at position *<pos>* in the list of field names.

model.component(*<ctag>*).physics(*<tag>*).selection().named(*<seltag>*) specifies that the physics interface is active on the named selection *<seltag>*.

model.component(*<ctag>*).physics(*<tag>*).selection().set(...) defines a local selection that makes the physics interface active on the selection's geometric entities. For a complete list of methods available under selection(), see Selections.The selection must apply to the physics interface's maximum geometry level. The create() method makes the physics interface active in all domains. 0D interfaces are always active globally and do not support these methods.

model.component(*<ctag>*).physics(*<tag>*).prop(*propname*).set(*pname*,*<value>*) sets the value of some property parameter. All string types listed in Table 2-4 are supported.

model.component(*<ctag>*).physics(*<tag>*).create(*<ftag>*,*feature*) adds a new feature instance to the physics interface and initializes the feature with defaults. The available features are given by the physics interface.

model.component(*<ctag>*).physics(*<tag>*).create(*<ftag>*,*feature*,*<dim>*) adds a new feature instance to the physics interface and initializes the feature with defaults. The feature is assigned to the domain level *<dim>*. Use this constructor for features which can be applied to more than one domain level. The constructor without the *<dim>* argument assigns the feature to the highest domain level, which the feature supports.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).set(*pname*,*<value>*) sets a parameter value. All string types listed in the section Table 2-4 are supported.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).selection().named(*<seltag>*) assigns the physics feature to the named selection *<seltag>*.

model.component(*<ctag>*).physics(*<tag>*).selection().set(...) defines a local selection that assigns the physics feature to geometric entities. For a complete list of methods available under selection(), see Selections. 0D features need no domain selection.

model.component(*<ctag>*).physics(*<tag>*).feature().move(*<ftag>,<position>*) moves the feature *<ftag>* to the zero indexed position *<position>* in the list. A feature cannot be moved before a default feature and the default features cannot be moved.

model.component(*<ctag>*).physics(*<tag>*).create(*<itag>,*"init") creates an initial value feature, using the reserved feature ID init.

model.component(*<ctag>*).physics(*<tag>*).feature(*<itag>*).set(*varname*,*<value>*) specifies an initial value. The variable names are the field variables. For wave problems, the time derivatives of the field variables are also included in the list of variables.

model.component(*<ctag>*).physics(*<tag>*).model() returns the model component node tag of the interface.

model.component(*<ctag>*).physics(*<tag>*).field(*fieldname*).fieldname() returns the field names as a string array.

model.component(*<ctag>*).physics(*<tag>*).scope() returns the fully qualified scope name.

model.component(*<ctag>*).physics(*<tag>*).geom() returns the geometry tag as a string.

model.component(*<ctag>*).physics(*<tag>*).selection().named() returns the selection tag as a string.

model.component(*<ctag>*).physics(*<tag>*).selection().get*Type*() returns domain information. See Selections for available methods.

model.component(*<ctag>*).physics(*<tag>*).prop(*propname*).get*Type*(*pname*) returns the parameter value. See get\* and Selection Access Methods for available methods.

model.component(*<ctag>*).physics(*<tag>*).prop(*propname*).param() returns the parameter names as a string array.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).get*Type*(*<pname>*) returns the parameter value. See get\* and Selection Access Methods for available methods.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).param() returns the parameter names as a string array.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).selection().named() returns the selection tag as a string array.

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).feature() returns the list of feature attributes. This list supports the same methods as model.component(*<ctag>*).physics(*<tag>*).feature().

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).feature(*<ftag2>*) returns the feature attribute *<ftag2>*. The feature attributes support the same methods as model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).

model.component(*<ctag>*).physics(<tag>).feature(<ftag>).featureInfo() returns a list of info objects.

model.component(*<ctag>*).feature(<ftag>).featureInfo("info") returns the info object that contains information about the variables, weak expressions, and constraints that a feature generates. The model.component(*<ctag>*).physics(*<tag>*) and model.coordSystem(*<tag>*) objects also have this list that you access with model.component(*<ctag>*).physics(*<tag>*).featureInfo("info"). These objects do not support the set method, which only works for the object

model.component(*<ctag>*).physics(*<tag>*).feature(*<ftag>*).

feature.featureInfo("info").set(*variable*,*<value>*) locks the named variable to the given expression. The expression must be given as a string array.

feature.featureInfo("info").getInfoTable(*id*) returns a table that lists all information about a certain table id. The supported IDs are Expression, Shape, Weak, and Constraint.

model.component(*<ctag>*).physics(*<tag>*).feature(<ftag>).importData() imports the file that the physics feature references into the model. This is only allowed for specific physics features that allow external files to be used, such as the Release from Data File feature for the particle tracing interfaces.

model.component(*<ctag>*).physics(*<tag>*).feature(<ftag>).discardData() Discards the external file imported by the importData() command. This only has an effect if importData() has been called previously for the physics feature. This is only allowed for specific physics features that allow external files to be used, such as the Release from Data File feature for the particle tracing interfaces.

#### **EXAMPLE**

This example creates an Electrostatics interface. It sets boundaries 3 and 8 to the ground potential and assigns the electric potential of 1 V at boundary 4.

When the physics interface is created a couple of default features are automatically added. One of them is the Charge Conservation feature, which has the tag ccn1. The relative permittivity is this feature is set to 1.

```
Code for Use with Java
```

```
model.component("comp1").physics().create("es","Electrostatics","geom1");
  model.component("comp1").physics("es").create("gnd1", "Ground", 2);
  model.component("comp1").physics("es").feature("gnd1").selection().set(new int[]{3, 8});
  model.component("comp1").physics("es").create("pot1", "ElectricPotential", 2);
  model.component("comp1").physics("es").feature("pot1").selection().set(new int[]{4});
  model.component("comp1").physics("es").feature("pot1").set("V0", "1");
  model.component("comp1").physics("es").feature("ccn1").set("epsilonr_mat", "userdef");
  model.component("comp1").physics("es").feature("ccn1").set("epsilonr", "1");
Code for Use with MATLAB
  model.component('comp1').physics.create('es','Electrostatics','geom1');
  model.component('comp1').physics('es').create('gnd1', 'Ground', 2);
  model.component('comp1').physics('es').feature('gnd1').selection().set([3, 8]);
  model.component('comp1').physics('es').create('pot1', 'ElectricPotential', 2);
```

```
model.component('comp1').physics('es').feature('pot1').selection.set(4);
  model.component('comp1').physics('es').feature('pot1').set('V0', '1');
  model.component('comp1').physics('es').feature('ccn1').set('epsilonr_mat', 'userdef');
  model.component('comp1').physics('es').feature('ccn1').set('epsilonr', '1');
COMPATIBILITY
From version 4.3 the methods
  model.physics(<tag>).feature(<ftag>).params();
  model.physics(<tag>).prop(propname).params();
are deprecated and replaced by the methods
  model.physics(<tag>).feature(<ftag>).param();
  model.physics(<tag>).prop(propname).param();
SEE ALSO
model.material(), model.study()
model.probe()
```

Create and defined properties for probes, which you can add to a model to monitor some quantity (real or complexvalued number) during a time-dependent, frequency-domain, or parametric simulation.

#### **SYNTAX**

```
model.probe().create(<tag>, type);
model.probe(<tag>).model(<mtag>);
model.probe(<tag>).set(property,<value>);
model.probe(<tag>).create(<etag>, etype);
model.probe(<tag>).feature(<etag>).set(eproperty,<evalue>);
model.probe(<tag>).genResult(String sol)
model.probe(<tag>).image()
DESCRIPTION
model.probe().create(<tag>,type) creates a probe of type type with tag <tag>.
model.probe(<tag>).model(<mtag>) sets the model component node to <mtag>.
model.probe(<tag>).set(property,<value>) set property to <value>.
```

model.probe(*<tag>*).selection(...) sets the selection for the probe. This is possible for the probes of the types Domain, Boundary, and Edge.

model.probe(*<tag>*).create(*<etag>*,*etype*) creates a point probe expression of type *etype* and tag *<tag>*.

model.probe(*<tag>*).feature(*<etag>*).set(*eproperty*,*<evalue>*) sets the property *eproperty* on the point probe expression *<etag>*.

model.probe(*<tag>*).genResult(String *sol*) where *sol* is a solver sequence tag. This function prepares for using a probe while solving or during postprocessing. The command is invoked automatically when a solver or study is run from the COMSOL Desktop for all active probes but needs to be invoked explicitly when run through the API. The function genResult(String *sol*) sets up result features for evaluating the corresponding probe using the solver sequence *sol*. If null is used, the default solver sequence for a solution dataset is used. When *sol* is none then the corresponding probe solution dataset does not refer to any solver sequence. This means, for example, that the current model is used for selections used for this probe. When a solver sequence is run, then solution to use for the probes is always reset to use the current solver.

Use the model.probe(<tag>).image() methods for plotting and exporting probe plot images. See Plotting and Exporting Images.

*Boundary Probes, Domain Probes, Edge Probes, Point Probes, Global Variable Probes, and Probe Point Expressions*

Probes can be of the following types:

TABLE 2-109: PROBE TYPES.

| TYPE           | DESCRIPTION                                                                                                                                                   |
|----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------|
| Boundary       | Probe that defines a value as an integral, maximum, minimum, or average over boundaries.                                                                      |
| Domain         | Probe that defines a value as an integral, maximum, minimum, or average over domains.                                                                         |
| Edge           | Probe that defines a value as an integral, maximum, minimum, or average over edges (in 3D).                                                                   |
| Point          | Probe that defines a value as an integral, maximum, minimum, or average at points.                                                                            |
| GlobalVariable | Probe that defines a value using a global variable.                                                                                                           |
| PointExpr      | Probe that defines a value by interpolation of an expression in a probe point. The probe point is<br>defined by the parent, a DomainPoint or a BoundaryPoint. |

*Boundary Point Probes and Domain Point Probes*

Probe points can be of the following types:

TABLE 2-110: PROBE POINT TYPES.

| TYPE          | DESCRIPTION                                     |
|---------------|-------------------------------------------------|
| BoundaryPoint | Defines a probe coordinate on a boundary in 3D. |
| DomainPoint   | Defines a probe coordinate in a domain.         |

Probes take the following properties:

TABLE 2-111: PROBE PROPERTIES.

| NAME        | VALUE                                     | DEFAULT       | DESCRIPTION                                                                                                                          |
|-------------|-------------------------------------------|---------------|--------------------------------------------------------------------------------------------------------------------------------------|
| descr       | String                                    |               | Description of the probe. Used for<br>model.result().                                                                                |
| descractive | on   off                                  | off           | Manual control of description.                                                                                                       |
| expr        | String                                    |               | The expression defining the probe.                                                                                                   |
| frame       | String                                    | spatial frame | Frame used for defining the probe.                                                                                                   |
| intorder    | Integer                                   | 4             | Integration order, when method is set to<br>integration.                                                                             |
| intsurface  | boolean                                   | false         | Compute surface integral for1D axisymmetric<br>DomainProbe and 2D axisymmetric<br>BoundaryProbe average and integral probe<br>types. |
| intvolume   | boolean                                   | false         | Compute volume integral for 2D axisymmetric<br>DomainProbe average and integral probe types.                                         |
| lagrange    | String                                    | 2             | Lagrange order when points is set to<br>lagrange.                                                                                    |
| method      | integration  <br>summation                | integration   | Method used when type is set to average or<br>integral.                                                                              |
| pintorder   | String                                    | 4             | Integration rule when points is set to<br>integration.                                                                               |
| points      | node   integration<br>  lagrange          | node          | Type of point when type is set to maximum or<br>minimum.                                                                             |
| probename   | String                                    | probe tag     | Probe variable name.                                                                                                                 |
| table       | String                                    | default       | Table to use for probe evaluation.                                                                                                   |
| type        | average   maximum  <br>minimum   integral | average       | Type of probe (Domain, Boundary, Edge and<br>Point probes).                                                                          |

TABLE 2-111: PROBE PROPERTIES.

| NAME   | VALUE  | DEFAULT      | DESCRIPTION                                  |
|--------|--------|--------------|----------------------------------------------|
| unit   | String | unit of expr | Unit for the probe. Used for model.result(). |
| window | String | default      | The plot window to use for the probe.        |

A probe point of the type DomainPoint takes the following properties:

TABLE 2-112: PROBE PROPERTIES.

| NAME                | VALUE                                                 | DEFAULT     | DESCRIPTION                                                   |
|---------------------|-------------------------------------------------------|-------------|---------------------------------------------------------------|
| bndsnap1            | on   off                                              | off         | Snap to nearest point (1D).                                   |
| bndsnap2            | on   off                                              | off         | Snap to nearest boundary point (2D).                          |
| bndsnap3            | on   off                                              | off         | Snap to nearest boundary point (3D).                          |
| coords              | Matrix of doubles                                     |             | Probe coordinates.                                            |
| depthpointnormal    | double                                                | 0           | Depth along line defined by the<br>pointnormal method.        |
| depthpointdirection | double                                                | 0           | Depth along line defined by the<br>pointdirection method.     |
| depthtwopoints      | double                                                | 0           | Depth along line defined by the<br>twopoints method.          |
| dimension           | 1   2   3                                             | 3           | The spatial dimension in which the<br>point resides.          |
| first               | double array                                          |             | The coordinates of the first point on<br>the probe line.      |
| method              | pointnormal  <br>pointdirection  <br>twopoints   none | pointnormal | Line entry method.                                            |
| second              | double array                                          |             | The coordinates of the second point<br>(for method=twopoints) |
| twopointscurrent    | first   second                                        | first       | Point selector (for method=twopoints)                         |

A probe point of BoundaryPoint types take the following properties:

TABLE 2-113: PROBE PROPERTIES.

| NAME       | VALUE        | DEFAULT | DESCRIPTION                       |
|------------|--------------|---------|-----------------------------------|
| coords     | double array | 0,0,0   | Probe coordinates.                |
| rawcoords  | double array | 0,0,0   | Full precision probe coordinates. |
| snapcoords | double array | 0,0,0   | The boundary-snapped coordinates. |

# *model.reduced()*

#### Reduced-order modeling.

There are reduced-order models of different types. The properties listed below are set and accessed using generic set and get methods described in set() and get\* and Selection Access Methods. The following reduced-order model types are currently supported:

TABLE 2-114: REDUCED-ORDER MODEL TYPES.

| TYPE           | DESCRIPTION                                                                                         |
|----------------|-----------------------------------------------------------------------------------------------------|
| ModalFrequency | Created by the Model Reduction study step for a parametric problem using the modal solver.          |
| ModalTransient | Created by the Model Reduction study for a time-dependent problem using the modal solver.           |
| PODFrequency   | Created by the Model Reduction study step for a frequency-dependent problem using POD<br>reduction. |

TABLE 2-114: REDUCED-ORDER MODEL TYPES.

| TYPE            | DESCRIPTION                                                                                                                  |
|-----------------|------------------------------------------------------------------------------------------------------------------------------|
| PODTransient    | Created by the Model Reduction study for a time-dependent problem using POD reduction.                                       |
| AWE             | Created by the Model Reduction study step for a parametric problem using the asymptotic<br>waveform evaluation (AWE) solver. |
| RandomVibration | Uses a Frequency-Domain, Modal Reduced-Order Model to compute model response to<br>random excitations.                       |

#### **SYNTAX**

```
model.reduced()
model.reduced().create(<tag>, <type>);
model.reduced().getM(String)
model.reduced().getN(String)
model.reduced().getNnz(String)
model.reduced().getOutputs()
model.reduced().getParameters()
model.reduced().getSparseMatrixCol(String)
model.reduced().getSparseMatrixRow(String)
model.reduced().getSparseMatrixVal(String)
model.reduced().getSparseMatrixValImag(String)
model.reduced().getVector(String)
model.reduced().getVectorImag(String)
model.reduced().isReal(String)
```

#### **DESCRIPTION**

model.reduced().create(*<tag>*,*<type>*) creates a reduced-model container of the specified type.

Depending on the type of reduced-order model, the following properties are available:

TABLE 2-115: PROPERTIES FOR REDUCED-ORDER MODEL TYPES.

| NAME                 | VALUE         | DEFAULT | DESCRIPTION                                                                        | READ ONLY |
|----------------------|---------------|---------|------------------------------------------------------------------------------------|-----------|
| depvars              | boolean       | false   | Controls if models with output variables<br>should define degrees of freedom.      |           |
| depvarnames          | String array  | {}      | Names of dependent variables.                                                      |           |
| information          | String        | Empty   | Model information.                                                                 | √         |
| logMessage           | String        | Empty   | The Build log.                                                                     | √         |
| matrices             | String matrix | {{}}    | Names and descriptions of matrices.                                                | √         |
| metaCOMSOLVersion    | String        | Empty   | String description of the COMSOL version<br>when the model has been created.       | √         |
| metaCOMSOLVersionInt | String        | Empty   | Numerical representation of the COMSOL<br>version when the model has been created. | √         |
| outputDescr          | String array  | {}      | Descriptions of output variables.                                                  | √         |
| outputExprs          | String array  | {}      | Values or expressions of output variables.                                         | √         |
| outputNames          | String array  | {}      | Names of output variables.                                                         | √         |
| reconstructors       | String array  | {}      | Names of reconstruction variables.                                                 | √         |
| reconstructorDescr   | String array  | {}      | Descriptions of reconstruction variables.                                          | √         |
| vectors              | String matrix | {{}}    | Names and descriptions of vectors.                                                 | √         |

Note that only metaCOMSOLVersion and metaCOMSOLVersionInt are defined for the RandomVibration reducedorder model..

TABLE 2-116: PROPERTIES FOR THE MODALFREQUENCY REDUCED-ORDER MODEL.

| NAME                    | VALUE                    | DEFAULT                                                                                                            | DESCRIPTION                                                                                                                                                     | READ ONLY                                                                                                   |
|-------------------------|--------------------------|--------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| constrStateDescrs       | String array             | Constraint mode Y,<br>where "Y" represents<br>the index of the<br>constraint mode<br>among all constraint<br>modes | Description of the<br>Constraint mode.                                                                                                                          | Read only<br>in the<br>stateless<br>case;<br>editable in<br>the<br>stateful<br>case.                        |
| constrStateExprs        | String array             | {"0"}                                                                                                              | Constraint expression. This<br>is the Model Control Input<br>expression if one was found.<br>Else this expression is 0 per<br>default.                          | If the<br>constraint<br>variable is<br>mapped to<br>an input,<br>then its<br>expression<br>is read<br>only. |
| constrStateNames        | String array             | romX.constrStateY,<br>where "Y" represents<br>the index of the<br>constraint mode<br>among all constraint<br>modes | Constraint DOF variable<br>name (alias). This variable will<br>evaluate to the ROM<br>operator rom1.state(X),<br>with X being the internal<br>state DOF number. | √                                                                                                           |
| constrStateModesIndices | String array             | {}                                                                                                                 | The actual mode index of<br>constraint modes among all<br>modes.                                                                                                | √                                                                                                           |
| constrStateUsed         | String array             | {"off"}                                                                                                            | Flag for enabling and disabling<br>constraints for the constraint<br>variables.                                                                                 |                                                                                                             |
| controls                | String array             | {}                                                                                                                 | Values or expressions of<br>control variables.                                                                                                                  |                                                                                                             |
| controlDescr            | String array             | {}                                                                                                                 | Descriptions of control<br>variables.                                                                                                                           | √                                                                                                           |
| controlNames            | String array             | {}                                                                                                                 | Names of control variables.                                                                                                                                     | √                                                                                                           |
| dampingRatio            | String                   | "0"                                                                                                                | Damping ratio used by<br>Uniform damping.                                                                                                                       |                                                                                                             |
| dampingRatioPerMode     | String array             | {"0"}                                                                                                              | Damping ratio for each<br>eigenmode.                                                                                                                            |                                                                                                             |
| form                    | Automatic  <br>Frequency | Automatic                                                                                                          | Equation form (when<br>interf is stateful): study<br>controlled (Automatic) or<br>frequency domain<br>(Frequency).                                              |                                                                                                             |
| freq                    | String                   | freq                                                                                                               | Value or expression for the<br>frequency, when freq_src<br>is userdef or interf is<br>stateless.                                                                |                                                                                                             |

TABLE 2-116: PROPERTIES FOR THE MODALFREQUENCY REDUCED-ORDER MODEL.

| NAME             | VALUE                   | DEFAULT                                                                                                                                                                                                                                                                                                                                                                                                                                                                               | DESCRIPTION                                                                                     | READ ONLY |
|------------------|-------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------|-----------|
| freq_src         | fromSolver<br>  userdef | fromSolver                                                                                                                                                                                                                                                                                                                                                                                                                                                                            | Frequency source: from the<br>solver or a user-defined<br>frequency, when form is<br>Frequency. |           |
| interf           | stateful  <br>stateless | stateless                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Use a stateless or stateful<br>interface.                                                       |           |
| loadfact         | String                  | 1                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     | Load factor value or<br>expression.                                                             |           |
| matrices         | String matrix           | {{"Kr",<br>"Stiffness<br>matrix"},<br>{"Kr_c",<br>"Constrained<br>part of stiffness<br>matrix"},<br>{"Dr", "Damping<br>matrix"},<br>{"Dr_c",<br>"Constrained<br>part of damping<br>matrix"},<br>{"Dra", "Damping<br>ratio matrix"},<br>{"Dra_c",<br>"Constrained<br>part of damping<br>ratio matrix"},<br>{"Er", "Mass<br>matrix"},<br>{"Er_c",<br>"Constrained<br>part of mass<br>matrix"},<br>{"Br", "Input<br>matrix"},<br>{"Cr", "Output<br>matrix"},<br>{"F", "Input<br>feedback | Names and descriptions of<br>matrices.                                                          | √         |
| modalfrequencies | String array            | matrix"}}                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Frequency for each<br>eigenmode.                                                                | √         |
| modalDamping     | String                  | noDamping                                                                                                                                                                                                                                                                                                                                                                                                                                                                             | Damping of Modal reduced<br>order model.                                                        |           |

TABLE 2-116: PROPERTIES FOR THE MODALFREQUENCY REDUCED-ORDER MODEL.

| NAME            | VALUE         | DEFAULT                                                                                                                                                                                                                                                  | DESCRIPTION                                                                                                                 | READ ONLY |
|-----------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------|
| solveElimSystem | boolean       | false                                                                                                                                                                                                                                                    | Solve an eliminated system<br>with constraints from<br>constrain modes being<br>removed, when interf is<br>set to stateful. |           |
| vectors         | String matrix | {{"L", "Load<br>vector"},<br>{"Y0", "Output<br>bias"},<br>{"EPartSol",<br>"Mass matrix<br>times particular<br>solution"},<br>{"DPartSol",<br>"Damping matrix<br>times particular<br>solution"}},<br>{"CImap",<br>"Constraint<br>modes to inputs<br>map"} | Names and descriptions of<br>vectors.                                                                                       | √         |

TABLE 2-117: PROPERTIES FOR THE MODALTRANSIENT REDUCED-ORDER MODEL.

| NAME                    | VALUE        | DEFAULT                                                                                                            | DESCRIPTION                                                                                                                                                     | READ ONLY                                                                                                   |
|-------------------------|--------------|--------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------|
| constrStateDescrs       | String array | Constraint mode Y,<br>where "Y" represents<br>the index of the<br>constraint mode<br>among all constraint<br>modes | Description of the Constraint<br>mode.                                                                                                                          | Read only<br>in the<br>stateless<br>case;<br>editable in<br>the<br>stateful<br>case.                        |
| constrStateExprs        | String array | {"0"}                                                                                                              | Constraint expression. This is<br>the Model Control Input<br>expression if one was found.<br>Else this expression is 0 per<br>default.                          | If the<br>constraint<br>variable is<br>mapped to<br>an input,<br>then its<br>expression<br>is read<br>only. |
| constrStateNames        | String array | romX.constrStateY,<br>where "Y" represents<br>the index of the<br>constraint mode<br>among all constraint<br>modes | Constraint DOF variable<br>name (alias). This variable will<br>evaluate to the ROM<br>operator rom1.state(X),<br>with X being the internal state<br>DOF number. | √                                                                                                           |
| constrStateModesIndices | String array | {}                                                                                                                 | The actual mode index of<br>constraint modes among all<br>modes.                                                                                                | √                                                                                                           |
| constrStateUsed         | String array | {"off"}                                                                                                            | Flag for enabling and disabling<br>constraints for the constraint<br>variables.                                                                                 |                                                                                                             |

TABLE 2-117: PROPERTIES FOR THE MODALTRANSIENT REDUCED-ORDER MODEL.

| NAME                | VALUE                    | DEFAULT   | DESCRIPTION                                                                                                | READ ONLY |
|---------------------|--------------------------|-----------|------------------------------------------------------------------------------------------------------------|-----------|
| controls            | String array             | {}        | Values or expressions of<br>control variables.                                                             |           |
| controlDescr        | String array             | {}        | Descriptions of control<br>variables.                                                                      | √         |
| controlNames        | String array             | {}        | Names of control variables.                                                                                | √         |
| dampingRatio        | String                   | 0         | Damping ratio used by<br>Uniform damping.                                                                  |           |
| dampingRatioPerMode | String array             | {0}       | Damping ratio for each<br>eigenmode.                                                                       |           |
| form                | Automatic  <br>Transient | Automatic | Equation form (when interf<br>is stateful): study<br>controlled (Automatic) or<br>time domain (Transient). |           |
| interf              | stateful  <br>stateless  | stateless | Use a stateless or stateful<br>interface.                                                                  |           |
| loadfact            | String                   | "1"       | Load factor value or<br>expression.                                                                        |           |

TABLE 2-117: PROPERTIES FOR THE MODALTRANSIENT REDUCED-ORDER MODEL.

| NAME     | VALUE         | DEFAULT                                                            | DESCRIPTION                            | READ ONLY |
|----------|---------------|--------------------------------------------------------------------|----------------------------------------|-----------|
| matrices | String matrix | {{"Kr","Stiffness<br>matrix"},                                     | Names and descriptions of<br>matrices. | √         |
|          |               | {"Kr_c",<br>"Constrained part<br>of stiffness                      |                                        |           |
|          |               | matrix"},                                                          |                                        |           |
|          |               | {"Kr", "Stiffness<br>matrix"},                                     |                                        |           |
|          |               | {"Dr", "Damping<br>matrix"},                                       |                                        |           |
|          |               | {"Dr_c",<br>"Constrained part<br>of damping<br>matrix"},           |                                        |           |
|          |               | {"Dra", "Damping<br>ratio matrix"},                                |                                        |           |
|          |               | {"Dra_c",<br>"Constrained part<br>of damping ratio<br>matrix"},    |                                        |           |
|          |               | {"Er", "Mass<br>matrix"},                                          |                                        |           |
|          |               | {"Er_c",<br>"Constrained part<br>of mass matrix"},                 |                                        |           |
|          |               | {"Br", "Input<br>matrix"},                                         |                                        |           |
|          |               | {"Cr", "Output<br>matrix"},                                        |                                        |           |
|          |               | {"F", "Input<br>feedback<br>matrix"},                              |                                        |           |
|          |               | {"B0r","Initial<br>value input<br>matrix"},                        |                                        |           |
|          |               | {"B0rdot",<br>"Initial value<br>time derivative<br>input matrix"}, |                                        |           |
|          |               | {"Brdot", "Time<br>derivative input<br>matrix"},                   |                                        |           |
|          |               | {"Brdotdot",<br>"Second time<br>derivative input<br>matrix"},      |                                        |           |
|          |               | {"Mc", "Mass<br>matrix"},                                          |                                        |           |
|          |               | {"Mc_c",<br>"Constrained part<br>of mass matrix"},                 |                                        |           |

TABLE 2-117: PROPERTIES FOR THE MODALTRANSIENT REDUCED-ORDER MODEL.

| NAME             | VALUE         | DEFAULT                                                                                                                                                                                                                                                                    | DESCRIPTION                                                                                                                 | READ ONLY |
|------------------|---------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------|-----------|
| matrices         |               | {"MA", "Stiffness<br>matrix"},<br>{"MA_c",<br>"Constrained part<br>of stiffness<br>matrix"},<br>{"MB", "Input<br>matrix"},<br>{"D", "Input<br>feedback<br>matrix"},<br>{"C", "Output<br>matrix"},<br>{"C_c",<br>"Constrained part<br>of output<br>matrix"}}                | Continued from the previous<br>page.                                                                                        | √         |
| modalfrequencies | String array  |                                                                                                                                                                                                                                                                            | Frequency for each<br>eigenmode.                                                                                            | √         |
| modalDamping     | String        | noDamping                                                                                                                                                                                                                                                                  | Damping of Modal reduced<br>order model.                                                                                    |           |
| rtol             | double        | 0.01                                                                                                                                                                                                                                                                       | Relative tolerance.                                                                                                         |           |
| solveElimSystem  | boolean       | false                                                                                                                                                                                                                                                                      | Solve an eliminated system<br>with constraints from<br>constrain modes being<br>removed, when interf is set<br>to stateful. |           |
| time             | String        | t                                                                                                                                                                                                                                                                          | Value or expression for the<br>time, when interf is<br>stateless.                                                           |           |
| vectors          | String matrix | {{"L","Load<br>vector"},<br>{"Y0", "Output<br>bias"},<br>{"U0","Output<br>bias"},<br>{"Udot0","Initial<br>derivative<br>vector"},<br>{"Kud","Stiffness<br>matrix times<br>ud"},<br>{"x0","Initial<br>value vector"}},<br>{"CImap",<br>"Constraint modes<br>to inputs map"} | Names and descriptions of<br>vectors.                                                                                       | √         |

TABLE 2-118: PROPERTY FOR THE AWE REDUCED-ORDER MODEL.

| NAME | VALUE  | DEFAULT | DESCRIPTION                            | READ ONLY |
|------|--------|---------|----------------------------------------|-----------|
| freq | String | freq    | Value or expression for the frequency. |           |

TABLE 2-119: PROPERTIES FOR THE RANDOM VIBRATION MODEL.

| NAME                   | VALUE                                                     | DEFAULT      | DESCRIPTION                                                                                                               |
|------------------------|-----------------------------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------------|
| correlationMatrix      | upper-triangle of a matrix                                | all 0s       | The correlation matrix, when<br>correlationType is<br>crossCorrelated.                                                    |
| correlationType        | uncorrelated  <br>fullyCorrelated  <br>crossCorrelated    | uncorrelated | The correlation type.                                                                                                     |
| fHigh                  | positive double                                           | 1000         | Upper frequency limit as an<br>integration bound.                                                                         |
| fLow                   | positive double                                           | 1            | Lower frequency limit as an<br>integration bound.                                                                         |
| frequencyResponseModel | name of frequency<br>domain, modal reduced<br>order model |              | The frequency response model to use.<br>Specify its components using the<br>setIndex method.                              |
| integrationMethod      | automatic  <br>userDefined                                | automatic    | Use an automatic or user-defined<br>integration method.                                                                   |
| integrationPoints      | integer > 1                                               | 1001         | Number of integration points, if<br>integrationMethod is set to<br>userDefined.                                           |
| powerSpectralDensity   | double scalar vector                                      | all 0s       | The power spectral density for each<br>control name. Specify each power<br>spectral density using the setIndex<br>method. |

For information about the getM, getN, getNnz, isReal, and the getSparseMatrix and getVector methods, see the matrix data tables Table 6-6 and Table 6-7 in the *Solvers and Study Steps* chapter.

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

# **EXAMPLES**

*Code for Use with Java*

Create a dataset and set it to point to the tagged solution sol1 from a solver sequence:

```
model.result().dataset().create("dset", "Solution");
  model.result().dataset("dset").set("solution", "Sol1");
Code for Use with MATLAB
  model.result.dataset.create('dset', 'Solution');
  model.result.dataset('dset').set('solution', 'Sol1');
Create a 3D plot group containing a streamline plot and a plane with a contour plot on:
Code for Use with Java
  result().create("pg1",3);
  result("pg1").set("data","dset");
  result("pg1").create("stream","Streamline");
  model.result("pg1").feature("stream").set("expr", new String[]{"2-x", "0", "z"});
  model.result("pg1").feature("stream").selection().set(new int[]{2});
  result().dataset().create("cutp1","CutPlane");
  result("pg1").create("cont1","Contour");
  result("pg1").feature("cont1").set("data","cutp1");
  result("pg1").run();
Code for Use with MATLAB
  result.create('pg1',3);
```

```
result('pg1').set('data','dset');
  result('pg1').create('stream','Streamline');
  model.result('pg1').feature('stream').set('expr', {'2-x', '0', 'z'});
  model.result('pg1').feature('stream').selection.set(2);
  result.dataset.create('cutp1','CutPlane');
  result('pg1').create('cont1','Contour');
  result('pg1').feature('cont1').set('data','cutp1');
  result('pg1').run;
model.savePoint()
```

Manage selections and hide features used by result features.

#### **SYNTAX**

```
model.savePoint(<tag>).geom(<gtag>)
model.savePoint(<tag>).geom(<gtag>).selection(<stag>)
model.savePoint(<tag>).geom(<gtag>).view(<vtag>)
```

#### **DESCRIPTION**

model.savePoint(*<tag>*) is a container of selections and hide features used by result features. When solving, a copy of the model is made — a save point model — which is used in results and analysis. The selections and hide features contained in model.savePoint(*<tag>*) refer to the geometry in this copy.

Editing the data in model.savePoint(*<tag>*) can only be done in the following circumstances.

- **•** The geometry on which the analysis is done has been modified after solving. In this case the selections and hide feature can be edited but not created or removed.
- **•** The geometry on which the analysis is done has been removed. In this case the selections and hide features can be both edited, created, and deleted.

In all other circumstances, edit the selections in model.component(*<ctag>*).selection(), and the hide features in model.component(*<ctag>*).view(). Changes there are synchronized with the data in model.savePoint().

model.savePoint(*<tag>*).geom(*<gtag>*) returns a container with selections and views with hide features for a geometry in the save point model.

```
model.savePoint(<tag>).geom(<gtag>).selection(<stag>) returns a selection.
```

```
model.savePoint(<tag>).geom(<gtag>).view(<vtag>) returns a view. Contrary to the views in 
model.component(<ctag>).view(), only the hide features in view.hideEntities() can be edited.
```

## **SEE ALSO**

```
model.selection(), model.weak()
model.selection()
```

Named selections.

#### **SYNTAX**

```
model.selection().create(<tag>);
model.selection().create(<tag>,<type>);
model.selection(<tag>).model(<mtag>);
model.selection(<tag>).set(property,<value>);
model.selection(<tag>).geom(<gtag>,dim);
model.selection(<tag>).geom(<gtag>,highdim,lowdim,typelist);
model.selection(<tag>).geom(dim);
model.selection(<tag>).all();
model.selection(<tag>).set(<entlist>);
model.selection(<tag>).add(<entlist>);
model.selection(<tag>).remove(<entlist>);
model.selection(<tag>).clear();
model.selection(<tag>).inherit(bool);
model.selection(<tag>).model();
model.selection(<tag>).isGeom();
model.selection(<tag>).geom();
model.selection(<tag>).dimension();
model.selection(<tag>).dim();
model.selection(<tag>).entities(dim);
model.selection(<tag>).entities();
model.selection(<tag>).interiorEntities(dim);
model.selection(<tag>).isInheriting();
model.selection(<tag>).inputDimension();
model.selection(<tag>).inputEntities();
model.selection(<tag>).image();
```

#### **DESCRIPTION**

model.component(*<ctag>*).selection(*<tag>*) returns a named selection. Anywhere where you define a selection, you can point to a named selection by using its tag, for example, *selection*.named(<tag>.

model.component(*<ctag>*).selection().create(*<tag>*) creates a named selection of type Explicit.

model.component(*<ctag>*).selection().create(*<tag>,<type>*) creates a named selection of type *<type>*. The following types are available: "Explicit", "Union", "Intersection", "Difference", "Complement", "Adjacent", "Ball", "Box", "Cylinder", "Disk", and "LogicalExpression".

model.selection(*<tag>*).model(*<mtag>*) sets the model component node of the selection.

model.selection(*<tag>*).model() returns the model component node tag of the selection.

model.component(*<ctag>*).selection(*<tag>*).set(*property*,*<value>*) sets a property value for the selection. Which properties are available for the different selection types are listed on the following pages. All other assignment methods are only supported by the Explicit selection type.

Use the model.selection(<tag>).image() methods for plotting and exporting selection images. See Plotting and Exporting Images.

All other methods are explained in the section Selections.

Other entities can use any of the selections in model.component(*<ctag>*).selection() when defining its selection. For example, create a selection sel1:

```
model.component("comp1").selection().create("sel1");
```

Then, for example, a variable entities can use this selection:

```
model.component("comp1").variable().create("var1");
model.component("comp1").variable("var1").model("mod1");
model.component("comp1").variable("var1").selection().named("sel1");
```

What properties are available depends on the type of selection. The following selection types are available:

*Explicit* Selection defined by an explicit set of geometric entities such as domains or boundaries.

TABLE 2-123: EXPLICIT SELECTION PROPERTIES.

| NAME         | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| angletol     | double                                                                                      | 5                             | Angle tolerance for continuity evaluation.                                                                                                            |
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| groupcontang | on   off                                                                                    | off                           | Continuous tangent mode.                                                                                                                              |

When groupcontang is set to on, the set, add, and remove methods operate on groups of adjacent entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

*Ball*

Selection of entities that are inside or intersect a ball.

TABLE 2-124: BALL SELECTION PROPERTIES.

| NAME         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| entitydim    | 0   1   2   3                                                                            | sdim                          | Dimension of entities to select.                                                                                                                      |
| angletol     | double                                                                                   | 5                             | Angle tolerance for continuity evaluation.                                                                                                            |
| color        | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property. |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                              |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode.                                                                                                                              |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode.                                                                                                                              |
| inputent     | all   selections                                                                         | all                           | Use all entities or entities defined by input<br>property.                                                                                            |
| input        | String[]                                                                                 | {}                            | Input selections.                                                                                                                                     |
| condition    | intersects   inside  <br>somevertex  <br>allvertices                                     | intersects                    | Condition for inclusion of an entity.                                                                                                                 |
| posx         | double                                                                                   | 0                             | Center of ball, first coordinate.                                                                                                                     |
| posy         | double                                                                                   | 0                             | Center of ball, second coordinate.                                                                                                                    |
| posz         | double                                                                                   | 0                             | Center of ball, third coordinate.                                                                                                                     |
| r            | double                                                                                   | 0                             | Radius.                                                                                                                                               |

The posx, posy, and posz properties define the center of the ball, and r defines the radius. These properties take their units from the corresponding geometry sequence.

When condition is intersects, all entities that intersect the ball are included in the selection. The rendering mesh is used for the calculation. You can set the accuracy of the rendering mesh using

ModelUtil.setPreference("graphics.rendering.detail",*<detail>*);

where *<detail>* is coarse, normal, fine, or wireframe.

When condition is inside, all entities that are completely inside the ball are included in the selection. The rendering mesh is used for the calculation.

When condition is somevertex, all entities that have at least one adjacent vertex inside the ball are included in the selection.

When condition is allvertices, all entities that have all adjacent vertices inside the ball are included in the selection.

When inputent is selections, the selection is restricted to the entities in the selections defined by the input property. When inputent is all, all entities in the geometry are considered.

When groupcontang is set to on, the selection operates on groups of entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

*Box*

Selection of entities that are inside or intersect a box.

TABLE 2-125: BOX SELECTION PROPERTIES.

| NAME         | VALUE                                                                                 | DEFAULT                          | DESCRIPTION                                                                                                                                              |
|--------------|---------------------------------------------------------------------------------------|----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| entitydim    | 0   1   2   3                                                                         | sdim                             | Dimension of entities to select.                                                                                                                         |
| angletol     | double                                                                                | 5                                | Angle tolerance for continuity evaluation.                                                                                                               |
| color        | none   custom   integer<br>between 1 and the number of<br>colors in the current theme | none                             | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. |
| customcolor  | RGB-triplet                                                                           | Next<br>available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                 |
| groupcontang | on   off                                                                              | off                              | Continuous tangent mode.                                                                                                                                 |
| groupcontang | on   off                                                                              | off                              | Continuous tangent mode.                                                                                                                                 |
| inputent     | all   selections                                                                      | all                              | Use all entities or entities defined by input<br>property.                                                                                               |
| input        | String[]                                                                              | {}                               | Input selections.                                                                                                                                        |
| condition    | intersects   inside  <br>somevertex   allvertices                                     | intersects                       | Condition for inclusion of an entity.                                                                                                                    |
| xmax         | double                                                                                | inf                              | Maximum x-coordinate of box.                                                                                                                             |
| xmin         | double                                                                                | -inf                             | Minimum x-coordinate of box.                                                                                                                             |
| ymax         | double                                                                                | inf                              | Maximum y-coordinate of box.                                                                                                                             |
| ymin         | double                                                                                | -inf                             | Minimum y-coordinate of box.                                                                                                                             |
| zmax         | double                                                                                | inf                              | Maximum z-coordinate of box.                                                                                                                             |
| zmin         | double                                                                                | -inf                             | Minimum z-coordinate of box.                                                                                                                             |

The xmax, xmin, ymax, ymin, zmax, and zmin properties define the box. These properties take their units from the corresponding geometry sequence.

When condition is intersects, all entities that intersect the box are included in the selection. The rendering mesh is used for the calculation. You can set the accuracy of the rendering mesh using

ModelUtil.setPreference("graphics.rendering.detail",*<detail>*);

where *<detail>* is coarse, normal, fine, or wireframe.

When condition is inside, all entities that are completely inside the box are included in the selection. The rendering mesh is used for the calculation.

When condition is somevertex, all entities that have at least one adjacent vertex inside the box are included in the selection.

When condition is allvertices, all entities that have all adjacent vertices inside the box are included in the selection.

When inputent is selections, the selection is restricted to the entities in the selections defined by the input property. When inputent is all, all entities in the geometry are considered.

When groupcontang is set to on, the selection operates on groups of entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

#### *Cylinder*

Selection of entities that are inside or intersect a cylinder in 3D.

TABLE 2-126: CYLINDER SELECTION PROPERTIES.

| NAME         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1       | double                                                                                   | 0                             | Start angle                                                                                                                                                      |
| angle2       | double                                                                                   | 360                           | End angle (default: 360 degrees; that is, a full<br>cylinder)                                                                                                    |
| color        | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.            |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                         |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode                                                                                                                                          |
| entitydim    | 0   1   2   3                                                                            | 3                             | Dimension of entities to select                                                                                                                                  |
| angletol     | double                                                                                   | 5                             | Angle tolerance for continuity evaluation                                                                                                                        |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode                                                                                                                                          |
| inputent     | all selections                                                                           | all                           | Use all entities or entities defined by input<br>property                                                                                                        |
| input        | String[]                                                                                 | {}                            | Input selections                                                                                                                                                 |
| condition    | intersects   inside  <br>somevertex  <br>allvertices                                     | intersects                    | Condition for inclusion of an entity                                                                                                                             |
| pos          | double[]                                                                                 | {0,0,0}                       | Cylinder base point                                                                                                                                              |
| axis         | double[]                                                                                 | {0,0,1}                       | Direction of the cylinder axis. Vector has length 3<br>if axistype is cartesian and length 2 if<br>axistype is spherical. Not used if axistype<br>is x, y, or z. |
| axistype     | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                         |
| top          | double                                                                                   | inf                           | Coordinate of upper face in local coordinate<br>system                                                                                                           |
| bottom       | double                                                                                   | -inf                          | Coordinate of lower face in local coordinate<br>system                                                                                                           |

TABLE 2-126: CYLINDER SELECTION PROPERTIES.

| NAME | VALUE                | DEFAULT | DESCRIPTION  |
|------|----------------------|---------|--------------|
| r    | double (nonnegative) | 0       | Outer radius |
| rin  | double (nonnegative) | 0       | Inner radius |

The pos property defines the center of the cylinder and the axis property defines the cylinder axis. The top, bottom, r, and rin properties define the size of the cylinder. Setting rin equal to r corresponds to a cylindrical surface. These properties take their units from the corresponding geometry sequence. Using the angle1 and angle2 properties, you can create a cylinder segment.

When condition is intersects, all entities that intersect the cylinder are included in the selection. The rendering mesh is used for the calculation. You can set the accuracy of the rendering mesh using

ModelUtil.setPreference("graphics.rendering.detail",*<detail>*);

where *<detail>* is coarse, normal, fine, or wireframe.

When condition is inside, all entities that are completely inside the cylinder are included in the selection. The rendering mesh is used for the calculation.

When condition is somevertex, all entities that have at least one adjacent vertex inside the cylinder are included in the selection.

When condition is allvertices, all entities that have all adjacent vertices inside the cylinder are included in the selection.

When inputent is selections, the selection is restricted to the entities in the selections defined by the input property. When inputent is all, all entities in the geometry are considered.

When groupcontang is set to on, the selection operates on groups of entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

*Disk* Selection of entities that are inside or intersect a disk.

TABLE 2-127: DISK SELECTION PROPERTIES.

| NAME         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1       | double                                                                                   | 0                             | Start angle                                                                                                                                           |
| angle2       | double                                                                                   | 360                           | End angle (default: 360 degrees; that is, a full disk)                                                                                                |
| color        | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property. |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                              |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode.                                                                                                                              |
| entitydim    | 0   1   2                                                                                | sdim                          | Dimension of entities to select.                                                                                                                      |
| angletol     | double                                                                                   | 5                             | Angle tolerance for continuity evaluation.                                                                                                            |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode.                                                                                                                              |
| inputent     | all   selections                                                                         | all                           | Use all entities or entities defined by input<br>property.                                                                                            |
| input        | String[]                                                                                 | {}                            | Input selections                                                                                                                                      |

TABLE 2-127: DISK SELECTION PROPERTIES.

| NAME      | VALUE                                                | DEFAULT    | DESCRIPTION                           |
|-----------|------------------------------------------------------|------------|---------------------------------------|
| condition | intersects   inside  <br>somevertex  <br>allvertices | intersects | Condition for inclusion of an entity. |
| posx      | double                                               | 0          | Center of disk, first coordinate.     |
| posy      | double                                               | 0          | Center of disk, second coordinate.    |
| r         | double (nonnegative)                                 | 0          | Outer radius.                         |
| rin       | double (nonnegative)                                 | 0          | Inner radius.                         |

The posx and posy properties define the center of the disk, and r and rin define the outer and inner radius, respectively. These properties take their units from the corresponding geometry sequence. Using the angle1 and angle2 properties, you can create a disk segment.

When condition is intersects, all entities that intersect the disk are included in the selection. The rendering mesh is used for the calculation. You can set the accuracy of the rendering mesh using

ModelUtil.setPreference("graphics.rendering.detail",*<detail>*);

where *<detail>* is coarse, normal, fine, or wireframe.

When condition is inside, all entities that are completely inside the disk are included in the selection. The rendering mesh is used for the calculation.

When condition is somevertex, all entities that have at least one adjacent vertex inside the disk are included in the selection.

When condition is allvertices, all entities that have all adjacent vertices inside the disk are included in the selection.

When inputent is selections, the selection is restricted to the entities in the selections defined by the input property. When inputent is all, all entities in the geometry are considered.

When groupcontang is set to on, the selection operates on groups of entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

# *Union*

Selection defined by the union of a set of selections.

TABLE 2-128: UNION SELECTION PROPERTIES.

| NAME      | VALUE         | DEFAULT | DESCRIPTION                      |
|-----------|---------------|---------|----------------------------------|
| entitydim | 0   1   2   3 | sdim    | Dimension of entities to select. |
| input     | String array  | {}      | Selections to add.               |

#### *Intersection*

Selection defined by the intersection of a set of selections.

TABLE 2-129: INTERSECTION SELECTION PROPERTIES.

| NAME        | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|-------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color       | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |

TABLE 2-129: INTERSECTION SELECTION PROPERTIES.

| NAME         | VALUE         | DEFAULT | DESCRIPTION                      |
|--------------|---------------|---------|----------------------------------|
| groupcontang | on   off      | off     | Continuous tangent mode.         |
| entitydim    | 0   1   2   3 | sdim    | Dimension of entities to select. |
| input        | String[]      | {}      | Selections to intersect.         |

#### *Difference*

Selection defined by the difference between two sets of selections.

TABLE 2-130: DIFFERENCE SELECTION PROPERTIES.

| NAME         | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| groupcontang | on   off                                                                                    | off                           | Continuous tangent mode.                                                                                                                              |
| entitydim    | 0   1   2   3                                                                               | sdim                          | Dimension of entities to select.                                                                                                                      |
| add          | String[]                                                                                    | {}                            | Selections to add.                                                                                                                                    |
| subtract     | String[]                                                                                    | {}                            | Selections to subtract.                                                                                                                               |

#### *Complement*

Selection defined by the complement of a set of selections.

TABLE 2-131: COMPLEMENT SELECTION PROPERTIES.

| NAME         | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| groupcontang | on   off                                                                                    | off                           | Continuous tangent mode.                                                                                                                              |
| entitydim    | 0   1   2   3                                                                               | sdim                          | Dimension of entities to select.                                                                                                                      |
| input        | String[]                                                                                    | {}                            | Selections to invert.                                                                                                                                 |

## *Adjacent*

Selection of entities that are adjacent to entities in another selection.

TABLE 2-132: ADJACENT SELECTION PROPERTIES.

| NAME         | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                              |
| groupcontang | on   off                                                                                    | off                           | Continuous tangent mode                                                                                                                               |
| entitydim    | 0   1   2   3                                                                               | sdim                          | Dimension of entities to select.                                                                                                                      |
| input        | String[]                                                                                    | {}                            | Input selections.                                                                                                                                     |

TABLE 2-132: ADJACENT SELECTION PROPERTIES.

| NAME      | VALUE         | DEFAULT | DESCRIPTION                        |
|-----------|---------------|---------|------------------------------------|
| outputdim | 0   1   2   3 | sdim-1  | Dimension of output entities.      |
| exterior  | on   off      | on      | Include exterior boundaries/edges. |
| interior  | on   off      | off     | Include interior boundaries/edges. |

*LogicalExpression*

Selection defined by a logical expression in terms of other named selections.

TABLE 2-133: LOGICAL EXPRESSION SELECTION PROPERTIES.

| NAME        | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                  |
|-------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color       | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property.        |
| customcolor | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                        |
| entitydim   | 0   1   2   3                                                                               | sdim                          | Dimension of entities to select.                                                                                                                             |
| expression  | String                                                                                      |                               | The logical expression to use. It can contain parentheses<br>and the   , &&, and ! Boolean operators, operating on<br>the tags of existing named selections. |

## **EXAMPLES**

Define the selection equ1 as the domain of a rectangle and the selection bnd1 as the boundary of the rectangle.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1",2);
  model.component("comp1").geom("geom1").create("f1","Rectangle");
  model.component("comp1").geom("geom1").run("f1");
  model.component("comp1").selection().create("equ1").geom(2);
  model.component("comp1").selection("equ1").all();
  model.component("comp1").selection().create("bnd1").geom(1);
  model.component("comp1").selection("bnd1").all();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1',2);
  model.component('comp1').geom('geom1').create('f1','Rectangle');
  model.component('comp1').geom('geom1').run('f1');
  model.component('comp1').selection.create('equ1').geom(2);
  model.component('comp1').selection('equ1').all;
  model.component('comp1').selection.create('bnd1').geom(1);
  model.component('comp1').selection('bnd1').all;
The (outer) boundaries for the model can be set with the following selection:
```

*Code for Use with Java*

```
Model model = ModelUtil.create("Model");
model.component().create("comp1");
model.component("comp1").geom().create("geom1",2);
model.component("comp1").geom("geom1").create("r1","Rectangle");
model.component("comp1").selection().create("outer").
      geom("geom1",2,1,new String[]{"exterior"});
model.component("comp1").selection("outer").all();
```

```
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1',2);
  model.component('comp1').geom('geom1').create('r1','Rectangle');
  model.component('comp1').selection.create('outer').geom('geom1',2,1,{'exterior'});
  model.component('comp1').selection('outer').all;
Create a selection for all boundaries of a block intersecting a ball with radius 0.5 and center (1,1,1):
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("g1",3).create("blk1","Block");
  model.component("comp1").geom("g1").run();
  model.component("comp1").selection().create("ball1", "Ball");
  model.component("comp1").selection("ball1").set("entitydim", "2");
  model.component("comp1").selection("ball1").set("posx", "1");
  model.component("comp1").selection("ball1").set("posy", "1");
  model.component("comp1").selection("ball1").set("posz", "1");
  model.component("comp1").selection("ball1").set("r", "0.5");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('g1',3).create('blk1','Block');
  model.component('comp1').geom('g1').run;
  model.component('comp1').selection.create('ball1', 'Ball');
  model.component('comp1').selection('ball1').set('entitydim', '2');
  model.component('comp1').selection('ball1').set('posx', '1');
  model.component('comp1').selection('ball1').set('posy', '1');
  model.component('comp1').selection('ball1').set('posz', '1');
  model.component('comp1').selection('ball1').set('r', '0.5');
Create a selection of all edges adjacent to the boundaries in the ball selection:
Code for Use with Java
  model.component("comp1").selection().create("adj1", "Adjacent");
  model.component("comp1").selection("adj1").set("entitydim", "2");
  model.component("comp1").selection("adj1").set("outputdim", "1");
  model.component("comp1").selection("adj1").set("input", new String[]{"ball1"});
Code for Use with MATLAB
  model.component('comp1').selection.create('adj1', 'Adjacent');
  model.component('comp1').selection('adj1').set('entitydim', '2');
  model.component('comp1').selection('adj1').set('outputdim', '1');
  model.component('comp1').selection('adj1').set('input', {'ball1'});
SEE ALSO
Selections
model.shape()
```

Create and define shape functions for the field variables' elements.

#### **SYNTAX**

```
model.shape().create(<tag>,<frame>);
model.shape(<tag>).elementSet(<condition>);
model.shape(<tag>).frame(<ftag>);
model.shape(<tag>).create(<ftag>,<func>);
model.shape(<tag>).feature(<ftag>).set(property,<value>);
model.shape(<tag>).slits().named(<seltag>);
model.shape(<tag>).slits().set(...);
model.shape(<tag>).upFlux(<varName>);
model.shape(<tag>).downFlux(<varName>);
model.shape(<tag>).domainFlux(<expressions>,<frame>);
model.shape(<tag>).elementSet();
model.shape(<tag>).frame();
model.shape(<tag>).feature(<ftag>).shape();
model.shape(<tag>).feature(<ftag>).getType(<property>);
model.shape(<tag>).fieldVariable();
model.shape(<tag>).slits().named();
model.shape(<tag>).slits().getType();
model.shape(<tag>).upFlux();
model.shape(<tag>).downFlux();
```

## **DESCRIPTION**

model.shape(*<tag>*) returns a shape function.

model.shape().create(*<tag>*,*<frame>*) creates a shape function with tag *<tag>* and assigns the frame *<frame>* to it.

model.shape(*<tag>*).frame(*<ftag>*) assigns frame *<ftag>* to the shape function. See model.frame() for a discussion on the default frame.

model.shape(*<tag>*).create(*<ftag>*,*<func>*) creates a shape feature with the shape function expression func. func can be a shape function name (shlag, for example) or a shape function with arguments (shlag(2,u), for example). The latter is interpreted as an assignment of some property values.

model.shape(*<tag>*).feature(*<ftag>*).set(*property*,*<value>*) sets a property for the shape function. Of the data types listed in Table 2-4, the ones supported are those for integers, strings, and string arrays. Which ones are applicable differs for each property.

model.shape(*<tag>*).selection().named(*<seltag>*) assigns the shape function to the named selection *<seltag>*.

model.shape(*<tag>*).selection().set(...) defines a local selection that assigns the shape function to geometric entities. For a complete list of methods available under selection(), see Selections.

model.shape(<tag>).upFlux(<varName>) and model.shape(<tag>).downFlux(<varName>) set the names of the up and down boundary flux variables. model.shape(<tag>).domainFlux(<expressions>,<frame>) sets expressions for the domain flux in a given frame. This is required to make the boundary flux variables produce accurate results. Only Lagrange shape functions support boundary flux variables.

```
model.shape(<tag>).frame() returns the frame tag as a string.
```

model.shape(*<tag>*).feature(*<ftag>*).shape() returns the shape function expression as a string.

model.shape(*<tag>*).feature(*<ftag>*).get*Type*(*property*) returns a property value. For available data types, see get\* and Selection Access Methods.

model.shape(*<tag>*).fieldVariable() returns the field variables which the shape functions define.

model.shape(*<tag>*).selection().named() returns the selection tag as a string.

model.shape(*<tag>*).elementSet(*<condition>*) sets the element set condition to the given string. The condition should be an expression containing *element set variables* (defined in model.elementSet()) and the logical operators &&, ||, and !. The shape function is defined only on the mesh elements for which the condition is true (nonzero).

model.shape(*<tag>*).elementSet() returns the element set condition. An empty string means no condition.

model.shape(*<tag>*).selection().get*Type*() returns domain information. For available methods, see model.selection().

model.shape(*<tag>*).slits() returns a selection used to generate a slit on the shape. Works exactly as selections.

model.shape(<tag>).upFlux() and model.shape(<tag>).downFlux() return the names of the up and down flux variables (an empty string if the variable names have not been set.)

## **EXAMPLE**

Define the shape function shlag(2,"u"):

```
Code for Use with Java
  model.shape().create("shu","f");
  model.shape("shu").create("f1","shlag");
  model.shape("shu").feature("f1").set("order",2);
  model.shape("shu").feature("f1").set("basename","u");
  model.shape("shu").selection().named("equ1");
Code for Use with MATLAB
  model.shape.create('shu','f');
  model.shape('shu').create('f1','shlag');
  model.shape('shu').feature('f1').set('order',2);
  model.shape('shu').feature('f1').set('basename','u');
  model.shape('shu').selection.named('equ1');
```

See also Shape Functions and Element Types for information and syntax examples for all shape functions (element types).

## **SEE ALSO**

model.coeff(), model.intRule(), model.weak() and the Elements and Shape Function Programming chapter.

*model.sol()*

Solver sequences.

![](_page_177_Picture_13.jpeg)

Solvers and Study Steps

#### **SYNTAX**

```
model.sol().create(<tag>)
model.sol().create(<tag>,<studytag>)
model.sol().create(<tag>,<studytag>,<varstag>)
model.sol().remove(<tag>)
model.sol(<tag>).create(<ftag>,<oper>)
model.sol(<tag>).feature().remove(<ftag>)
model.sol(<tag>).feature(<ftag>).create(<f2tag>,<oper>)
model.sol(<tag>).feature(<ftag>).set(property,<value>)
model.sol(<tag>).attach(<stag>)
model.sol(<tag>).isAttached()
model.sol(<tag>).detach(<stag>)
model.sol(<tag>).study(<stag>)
model.sol(<tag>).clearSolutionData()
model.sol(<tag>).copySolution(<ctag>)
model.sol(<tag>).createAutoSequence(<stag>)
model.sol(<tag>).createSolution()
model.sol(<tag>).updateSolution()
model.sol(<tag>).updateSolution()
model.sol(<tag>).adaptationStudyFeature()
model.sol(<tag>).adaptationStudyFeature(<stag>)
model.sol(<tag>).getDefaultSolnum()
model.sol(<tag>).setClusterStorage
model.sol(<tag>).getClusterStorage
model.sol(<tag>).isEmpty()
model.sol(<tag>).isInitialized()
model.sol(<tag>).run(<ftag>,[<createPlots>])
model.sol(<tag>).runFrom(<ftag>,[<createPlots>])
model.sol(<tag>).runFromTo(<ftagstart>,<ftagstop>,[<createPlots>])
model.sol(<tag>).runAll([<createPlots>])
model.sol(<tag>).run()
model.sol(<tag>).continueRun()
```

#### **DESCRIPTION**

model.sol().create(*<tag>*) adds a solver sequence to the model.

model.sol().create(*<tag>*,*<studytag>*) adds a solver sequence to the model. The constructor adds one feature of the type StudyStep to the solver sequence with the tag *<studytag>*. This StudyStep feature is connected to a study step (see model.study()).

model.sol().create(*<tag>*,*<studytag>*,*<varstag>*) adds a solver sequence to the model. The constructor adds one feature of the type StudyStep with the tag *<studytag>* and one feature of the type Variables with the tag *<varstag>* to the solver sequence.

model.sol().remove(*<tag>*) removes a solver sequence from the model.

model.sol(*<tag>*).create(*<ftag>*,*<oper>*) creates a solver feature. Each solver feature is a solver operation.

model.sol(*<tag>*).feature().remove(*<ftag>*) removes the solver feature *<ftag>*.

model.sol(*<tag>*).feature(*<ftag>*).set(*property*,*<value>*) sets the property *property* for the feature *<ftag>*.

model.sol(*<tag>*).attach(*<stag>*) attaches a solver sequence with tag *<tag>* to a study with tag *<stag>*, which makes it visible under that study. You can use attach to make a solver sequence part of the study sequence. Using model.sol(*<tag>*).study(*<stag>*), on the other hand, only associates a solver sequence with a study. The attach() operation implies calling study(*<tag>*). You can only have one solver sequence attached to each study (but you can have multiple batch features).

model.sol(<tag>).isAttached() returns true if the solver sequence with tag *<tag>* is attached to a study.

model.sol(*<tag>*).detach(*<stag>*) detaches a solver sequence with tag *<tag>* from study with tag *<stag>*.

model.sol(*<tag>*).clearSolutionData() clears computed solution data associated with the solver sequence *<tag>*. Solution selection settings and settings in results features associated with the solution are not modified.

model.sol(<tag>).getDefaultSolnum() returns which solnum the call getU() returns (compare with getU(*<solnum>*); see Solution Data).

model.sol(*<tag>*).setClusterStorage(*<value>*) sets the solution storage format used on clusters. Use the *<value>* "all" to store the solution on all cluster nodes and the *<value>* "single" to store the solution only on a single cluster node.

model.sol(*<tag>*).getClusterStorage() returns "all" if the solution is stored on all cluster nodes and "single" if the solution is only stored a single cluster node.

model.sol(*<tag>*).copySolution(*<ctag>*) copies the solution data associated with the solver sequence *<tag>* to a new solver sequence *<ctag>*. The features are not copied.

model.sol(*<tag>*).createAutoSequence(*<stag>*) creates a solver sequence of features automatically from the study *<stag>*. The sequence of study steps are used as input to the sequence generation algorithm but also the physics used in the study steps are used to automatically adopt the solver settings.

model.sol(*<tag>*).createSolution() creates a solution object from one or more set operations (setU(…), …), see Solution Creation for details.

model.sol(*<tag>*).updateSolution() updates a solution data associated with the solver sequence to make it consistent with the current model.

model.sol(*<tag>*).adaptationStudyFeature() returns the path to the study feature with adaptation that controls this sequence or empty string if none. model.sol(*<tag>*).adaptationStudyFeature(*<ftag>*) sets the study feature with adaptation, *<ftag>*, that controls the solver sequence *<tag>*. Use an empty string to disable study control.

model.sol(*<tag>*).isEmpty() is true if there is no solution data or if all solution data has been cleared.

model.sol(*<tag>*).isInitialized() is true if the solution is a valid (initialized) object. Even if the solution has been cleared, isInitialized is true (use isEmpty to check for cleared solution data).

model.sol(*<tag>*).run(*<ftag>*) runs the features for a solver sequence up to and including the feature *<ftag>*. It corresponds to clicking **Compute** on the solver sequence feature node in the COMSOL Desktop.

model.sol(*<tag>*).runFrom(*<ftag>*) runs the features for a solver sequence from and including the feature *<ftag>*.

model.sol(*<tag>*).runFromTo(*<ftagstart>,<ftagstop>*) runs the features for a solver sequence from and including the feature *<ftagstart>* to and including the feature *<ftagstop>*.

model.sol(*<tag>*).runAll() and model.sol(*<tag>*).run() run all the features for a solver sequence.

All the run, runFrom, runFromTo, and runAll methods can take an additional boolean input argument createPlots, which, when set to true, generates the corresponding default plots when computing a solution.

model.sol(*<tag>*).continueRun() continues to run a solver sequence.

#### **EXAMPLES**

Assume that a study st1 represents one stationary study step with the tag stat1 for some equations.

```
Code for Use with Java
  model.sol().create("s","step1","vars1");
  model.sol("s").feature("step1").set("study","st1");
```

```
model.sol("s").feature("step1").set("studystep","stat1");
  model.sol("s").create("solver1","Stationary");
Code for Use with MATLAB
  model.sol.create('s','step1','vars1');
  model.sol('s').feature('step1').set('study','st1');
  model.sol('s').feature('step1').set('studystep','stat1');
  model.sol('s').create('solver1','Stationary');
```

Assume that a second study step with frequency response is added to the study with tag freq1 and that you want to make a frequency sweep from 10 to 1000 using the parametric solver and the solution above as the linearization point (bias solution).

```
Code for Use with Java
  model.sol("s").create("step2","StudyStep");
  model.sol("s").feature("step2").set("study","st1");
  model.sol("s").feature("step2").set("studystep","freq1");
  model.sol("s").create("vars2","Variables");
  SolverFeature s2 = (SolverFeature) model.sol("s").create("solver2","Stationary");
  s2.set("nonlin","linper"); // (*)
  s2.set("linpmethod","sol");
  s2.set("linpsol", "s");
  s2.set("storelinpoint", "on");
  s2.create("par","Parametric");
  s2.feature("par").set("pname","freq");
  s2.feature("par").set("plist",new double[]{10,1000});
  s2.runAll();
Code for Use with MATLAB
  model.sol('s').create('step2','StudyStep');
  model.sol('s').feature('step2').set('study','st1');
  model.sol('s').feature('step2').set('studystep','freq1');
  model.sol('s').create('vars2','Variables');
  s2 = model.sol('s').create('solver2','Stationary');
  s2.set('nonlin','linper'); // (*)
  s2.set('linpmethod','sol');
  s2.set('linpsol', 's');
  s2.set('storelinpoint', 'on');
  s2.create('par','Parametric');
  s2.feature('par').set('pname','freq');
  s2.feature('par').set('plist',[10,1000]);
  s2.runAll;
```

At this point the solution s is associated to the study step freq1 (but it depends indirectly on the bias study step stat1 as well).

(\*) Uses the small-signal study functionality, which makes it possible to access also the linearization point for postprocessing together with the small-signal solution. Here it is assumed that the bias problem and the small-signal problem can be set up independently for the two study steps.

## **COMPATIBILITY**

```
From version 5.3a, the method
```

```
model.sol(<tag>).clearSolution()
```

is deprecated and replaced by the method

```
model.sol(<tag>).clearSolutionData()
```

since clearSolutionData generally works as expected, while clearSolution clears settings unexpectedly.

## **SEE ALSO**

```
model.study()
```

Create and define events for the solver.

#### **SYNTAX**

```
model.solverEvent().create(<tag>,evtype);
model.solverEvent(<tag>).start(expr);
model.solverEvent(<tag>).start();
model.solverEvent(<tag>).period(expr);
model.solverEvent(<tag>).period();
model.solverEvent(<tag>).condition(expr);
model.solverEvent(<tag>).condition();
model.solverEvent(<tag>).reinit();
model.solverEvent(<tag>).reinit().create(<tag>);
model.solverEvent(<tag>).reinit(<tag>).set(<var>,expr);
model.solverEvent(<tag>).useConsistentInit(isConsistent);
```

#### **DESCRIPTION**

Create events and control event settings. There are two types of events; Explicit and Implicit.

model.solverEvent().create(*<tag>*,*evtype*) creates a new event of type *evtype*, either Explicit and Implicit.

There are also *event sequences*, which you create using the *evtype* set as EventSequence to which you can add *sequence members*. See Event Sequences.

# *Explicit Events*

Explicit events triggers on a predefined timing.

model.solverEvent(*<tag>*).start(expr) sets the start time for an explicit event.

model.solverEvent(*<tag>*).period(expr) sets the period for an explicit event. After the start time, the event then triggers after each period.

#### *Implicit Events*

Implicit events trigger when a condition goes from false to true.

model.solverEvent(*<tag>*).condition(expr) sets the condition for an implicit event.

## *Event Sequences*

You can also add event sequences to specify a sequence of events that will take place in the order that you add them. Event sequences simplify the setup of a sequence of events by automatically defining explicit and implicit events. The individual steps in the sequence are defined using sequence member subnodes:

```
model.solverEvent().feature(<estag>).create<tag>,SequenceMember);
```

For a sequence member you can set the property endConditionOptions to logicalExpression and then provide a logical expression using the condition property that is true when it evaluates to something that is >0, or set the property endConditionOptions to duration and then provide a time duration using the duration property to control for how long a step runs.

# *Reinitialization*

When an event is triggered, any degree of freedom can be reinitialized. This typically means that they get a new value. You specify these values with a reinitialization method, reinit(...), which has the same syntax as model.init(...) .

model.solverEvent(*<tag>*).reinit().create(*<tag>*) adds a new reinit feature to the event. In most cases you only need one, but you need more when you have reinitialization conditions on several geometric entity levels, for example on a global selection and a domain selection.

*Event State Variables*

An event needs state variables in most cases. There are discrete states and indicator states. Discrete states are just ODE states that only change during reinitialization, and can only have a zero-valued equation (or no equation). The indicator states are needed for implicit events and are ODE states with nonzero equations.

model.ode().create(*<tag>*).type(*<ode type>*) creates a new global equation that contains event state variables if you set the ode type to discrete for discrete states and quadrature for indicator states.

model.ode(*<tag>*).state(*<states>*) adds a new discrete states to the global equation.

model.ode(*<tag>*).ode(*<state>,*"sin(2\*pi\*t)") adds a new indicator state and its right-hand side to the global equation. The left-hand side of the equation is the state variable, so the full equation for the indicator state becomes nojac(sin(2\*pi\*t))-*<state>*.

model.solverEvent(<tag>).useConsistentInit(isConsistent) controls how consistency is enforced after reinitialization. If isConsistent = 0 for all of the triggered events, then consistency will not be enforced after reinitialization. If isConsistent = 1 for at least one of the triggered events and Time.consistent = bweuler (see Table 6-74), then consistency is enforced using an artificial step with the backward Euler method. See About the Reinitialization Process in the *COMSOL Reference Manual* for additional details. The solver log indicates whether and how consistency has been enforced after each reinitialization.

#### **EXAMPLE**

Example of an idealized bouncing ball using implicit events.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.study().create("std1");
  model.study("std1").create("time1", "Transient");
  model.study("std1").feature("time1").set("tlist", "0 10");
  model.study("std1").feature("time1").set("rtol", 1e-6);// Nondiscrete states
  model.ode().create("ode1");
  model.ode("ode1").ode("y", "-2*y-ytt");
  model.init().create("ode1");
  model.init("ode1").selection().global();
  model.init("ode1").set("y", "1");
  // Discrete states
  model.ode().create("ode2").type("quadrature");
  model.ode("ode2").ode("z1", "y");
  // Implicit event
  model.solverEvent().create("impl1", "Implicit");
  model.solverEvent("impl1").condition("!(z1>=0)");
  model.solverEvent("impl1").reinit().create("reinit");
  model.solverEvent("impl1").reinit("reinit").selection().global();
  model.solverEvent("impl1").reinit("reinit").set("y", "y");
  // Bounce reverts velocity
  model.solverEvent("impl1").reinit("reinit").set("yt", "-yt");
  model.sol().create("sol1");
  model.sol("sol1").createAutoSequence("std1");
  // Special solver settings for events
  model.sol("sol1").feature("t1").set("tout", "tsteps");
  model.sol("sol1").feature("t1").set("atolglobal", "1e-6");
  model.sol("sol1").feature("t1").set("initialstepbdfactive", "on");
  model.sol("sol1").feature("t1").set("initialstepbdf", "1e-6");
  model.sol("sol1").feature("t1").set("eventtol", "2e-6");
  model.sol("sol1").feature("t1").set("ewtrescale", "off");
  model.sol("sol1").runAll();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.study.create('std1');
```

```
model.study('std1').create('time1', 'Transient');
  model.study('std1').feature('time1').set('tlist', '0 10');
  model.study('std1').feature('time1').set('rtol', 1e-6);
  % Nondiscrete states
  model.ode.create('ode1');
  model.ode('ode1').ode('y', '-2*y-ytt');
  model.init.create('ode1');
  model.init('ode1').selection().global();
  model.init('ode1').set('y', '1');
  % Discrete states
  model.ode.create('ode2').type('quadrature');
  model.ode('ode2').ode('z1', 'y');
  % Implicit event
  model.solverEvent.create('impl1', 'Implicit');
  model.solverEvent('impl1').condition('!(z1>=0)');
  model.solverEvent('impl1').reinit().create('reinit');
  model.solverEvent('impl1').reinit('reinit').selection().global();
  model.solverEvent('impl1').reinit('reinit').set('y', 'y');
  % Bounce reverts velocity
  model.solverEvent('impl1').reinit('reinit').set('yt', '-yt');
  model.sol().create('sol1');
  model.sol('sol1').createAutoSequence('std1');
  % Special solver settings for events
  model.sol('sol1').feature('t1').set('tout', 'tsteps');
  model.sol('sol1').feature('t1').set('atolglobal', '1e-6');
  model.sol('sol1').feature('t1').set('initialstepbdfactive', 'on');
  model.sol('sol1').feature('t1').set('initialstepbdf', '1e-6');
  model.sol('sol1').feature('t1').set('eventtol', '2e-6');
  model.sol('sol1').feature('t1').set('ewtrescale', 'off');
  model.sol('sol1').runAll;
SEE ALSO
model.ode(), model.init()
model.study()
```

Create and define studies.

#### **SYNTAX**

```
model.study().create(<tag>);
model.study(<tag>).create(<ftag>,type);
model.study(<tag>).feature().move(<ftag>,position);
model.study(<tag>).run([<createPlots>])
model.study(<tag>).runNoGen()
model.study(<tag>).createAutoSequences(type)
model.study(<tag>).showAutoSequences(type);
model.study(<tag>).getSolverSequences(type);
model.study(<tag>).isGenConv();
model.study(<tag>).isGenIntermediatePlots();
model.study(<tag>).isGenPlots();
model.study(<tag>).isPlotUndefVals();
model.study(<tag>).isStoreSolution();
model.study(<tag>).setEntry(…);
model.study(<tag>).setGenConv(boolean);
model.study(<tag>).setGenIntermediatePlots(boolean);
model.study(<tag>).setGenPlots(boolean);
model.study(<tag>).setPlotUndefVals(boolean);
model.study(<tag>).setStoreSolution(boolean);
model.study(<tag>).feature(<ftag>).loadFile(filePath);
model.study(<tag>).feature(<ftag>).saveFile(filePath);
step = model.study(<tag>).feature(<ftag>);
step.discardData();
step.discretization(<physpath>,<discr>);
step.exportData(<filePath>);
step.importData(<filePath>);
step.loadFile(<filePath>);
step.mesh(<geom>,<mesh>);
step.refresh();
step.saveFile(<filePath>);
step.setSolveFor(<entityPath>,boolean)
step.type();
step.discretization(<physpath>);
step.mesh(<geom>);
step.solveFor(<entityPath>);
step.mglevel.create(<mglevel>);
step.mglevel(<mglevel>).mesh(<geom>,<mesh>);
step.mglevel(<mglevel>).discretization(<physpath>,<discr>);
step.mglevel(<mglevel>).mesh(<geom>);
step.mglevel(<mglevel>).discretization(<physpath>);
```

## **DESCRIPTION**

model.study stores a list of studies, each of which consists of a number of study steps. Each study step, in turn, defines a solver-ready problem. This means that a study step can be turned into an extended mesh, and a basic solver (Stationary, Time, Eigenvalue, Modal, AWE, or Optimization) can be applied, resulting in a solution object.

The central property of a study step is its *study type*, which on one hand controls the equations generated by physics interfaces, and on the other hand triggers automatic selection of a suitable solver. Another important property of a study step is which mesh to use (for each geometry in the model). Other fundamental simulation parameters can also be found among the study step settings, like the time span for a Time Dependent study type and frequency range for a Frequency Domain study type.

Under a study step, you can add *multigrid levels*. The parent node still defines the problem to be solved (for example, the study type and the mesh). Therefore, the added multigrid levels must necessarily be coarser than the parent study step.

Most physics features and also some other parts of the model object (for example, expression features) must support a step member, which (in analogy to the spatial selection) controls for which study steps the feature is active. In many ways, the study selection can be seen as a fourth, discrete, dimension.

The *StudyList* is the list of studies in a model. For instance, model.study("std1") gives the study with tag std1.

model.study().create(*<tag>*) creates a new study sequence.

model.study(<*tag>*).run() computes the study. The run method can take an additional boolean input argument createPlots, which, when set to true, generates the corresponding default plots when computing a solution.

model.study(<*tag>*).runNoGen() runs the attached solver sequence without regenerating it.

model.study(<*tag>*).createAutoSequences(*type*) creates an attached solver sequence or job using default solver settings if the solver sequence has not been edited. This command is similar to **Compute** in the COMSOL Desktop. The argument *type* is one of all, jobs, or sol, corresponding to creating both jobs and solver sequences or one of them.

model.study(<*tag>*).showAutoSequences(*type*) generates a new attached solver sequence or job using default solver settings. This command is similar to **Show Default Solver** in the COMSOL Desktop; that is, it always creates unedited solver sequences. See createAutoSequences above for information about the *type* argument.

model.study(<*tag>*).getSolverSequences(*type*) returns a list of tags for solver sequences (see model.sol()) connected to this study. The *type* argument is one of SolverSequence, CopySolution, ParametricStore, Stored, Parametric, None, or All.

model.study(<tag>).setGenConv(boolean) controls the generation of convergence plots. Use model.study(<tag>).isGenConv() to check if convergence plots will be generated.

model.study(<tag>).setGenIntermediatePlots(boolean) controls the generation of default plots for intermediate solutions. Use model.study(<tag>).isGenIntermediatePlots() to check if plots will be generated for intermediate solutions.

model.study(<tag>).setGenPlots(boolean) controls the generation of default plot for the final solution after the last step in a study sequence. Use model.study(<tag>).isGenPlots() to check if plots will be generated for the final solution.

model.study(*<tag>*).setPlotUndefVals(*boolean*) controls the creation of a plot that indicates the location of undefined values such as Inf and NaN. Use model.study(<tag>).isPlotUndefVals() to check if plots of undefined values will be generated.

model.study(<*tag>*).setStoreSolution(*boolean*) inserts a Solution Store node between each study step in a multistep study if set to true. If set to false, Solution Store nodes are only inserted in certain cases. Use model.study(<*tag>*).isStoreSolution() to check if a Solution Store node is inserted between each study step (it then returns true).

model.study(*<tag>*).create(*<ftag>*,*type*) creates a new study step of the given type within the specified sequence. The set of allowed values should be limited to study types supported by at least one physics interface present in the model (Stationary, Time, Frequency, and Eigenvalue should always be allowed).

model.study(*<tag>*).feature().move(*<ftag>*,*position*) moves the feature *<ftag>* to the zero indexed position *<position>* in the list.

The following two lines sets the outputs to store from a study to the selections with tags sel1 and sel2:

```
model.study(<tag>).setEntry("outputmap", "solid", "selection");
model.study(<tag>).setEntry("outputselectionmap", "solid", "sel1;sel2");
```

See setEntry() for more information about how it works.

boolean model.study(<tag>).feature(<ftag>).loadFile(String *filePath*) and boolean model.study(<tag>).feature(<ftag>).SaveFile(String *filePath*) both work if the type of feature is a Parametric Sweep and then loads or saves information concerning either All Combinations or Specified Combinations. These methods return false if the type of feature is not a Parametric Sweep. They also return false if the operation is not successful.

step = model.study(*<tag>*).feature(*<ftag>*) obtains a reference to a specified study step.

step.discardData() discards any experimental data imported into a Parameter Estimation study step.

step.discretization(*<phys>*,*<discr>*) assigns discretization for a physics interface. The string *<phys>* is the tag of a physics interface. The string *<discr>* is a tag of a discretization feature under a physics mode or the string physics to use the discretization settings in the physics interface itself.

step.exportData(*<filePath>*) exports any experimental data previously imported to a Parameter Estimation study step to the specified file.

step.importData(*<filePath>*) imports experimental data into a Parameter Estimation study step from the specified *<filePath>*.

step.loadFile(*<filePath>*) loads parameter values from the specified *<filePath>* into a Parametric Sweep study step.

step.mesh(*<geom>*,*<mesh>*) specifies which mesh to use for geometry *<geom>* in the model.

step.refresh() refreshes, that is, reloads, any experimental data files used by a Parameter Estimation study step.

step.saveFile(*<filePath>*) saves parameter values from a Parametric Sweep study step to *<filePath>*.

step.setSolveFor(*<entityPath>*,*solve*) controls whether degrees of freedom defined by the specified entity will be solved for in the study step. When *solve* is set to false, the degrees of freedom will not be solved for; when set to true, they will be solved for only if the entity can generate equations for the study-step type. The correct *<entityPath>* argument corresponding to a model entity is given by *<entity>*.resolveModelPath().

step.type() returns the study type.

step.discretization(*<phys>*) returns the tag of the discretization feature under a physics interface with tag *<phys>* that specifies the shape functions to use for the physics interface in this study step, or the string physics to indicate that the discretization settings in the physics interface itself are used.

step.mesh(*<geom>*) returns the tag of the mesh to be used in geometry *<geom>* in this study step.

step.solveFor(*<entityPath>*) returns true if degrees of freedom defined by the specified entity will be solved for in the study step. The return value accounts for both the state of the activate property and whether the entity allows the study step type. The correct *<entityPath>* argument corresponding to a model entity is given by *<entity>*.resolveModelPath().

step.mglevel.create(*<mglevel>*) adds a (coarser) multigrid level to a study.

step.mglevel(*<mglevel>*).mesh(*<geom>*,*<mesh>*) specifies a mesh for the multigrid level. The set of allowed values must, in addition to the actual meshes, include an option "from parent". This should be the default choice and indicates that the multigrid level uses the same mesh as the parent study.

step.mglevel(*<mglevel>*).discretization(*<physpath>*,*<discr>*) assigns discretization for a multigrid level. The string *<physpath>* is the path of a physics interface. The string *<discr>* is a tag of a discretization feature under a physics mode. The default *<discr>* the physics interface tag. It can be changed to the tag of a discretization node under a physics interface.

step.mesh(*<geom>*) returns the mesh selected for the given geometry.

step.mglevel(*<mglevel>*).mesh(*<geom>*) returns the mesh for the selected multigrid level and geometry.

step.mglevel(*<mglevel>*).discretization(*<discpath>*) returns activation status of a discretization feature.

#### **EXAMPLE**

The following code sets up a study sequence to analyze the influence of structural deformation on a waveguide with a numerical port boundary condition. It consists of three steps: stationary structural mechanics followed by an eigenvalue study for the port and finally a wave propagation problem solved with manual multigrid levels (to get nested meshes).

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1", 3);
  model.component("comp1").geom("geom1").create("blk1", "Block");
  model.component("comp1").geom().run();
  model.component("comp1").mesh().create("mesh1", "geom1");
  model.component("comp1").mesh().create("mesh2", "geom1");
  model.component("comp1").mesh().create("mesh3", "geom1");
  model.physics().create("rfw1", "ElectromagneticWaves", "geom1");
  model.study().create("seq1");
  Study s1 = model.study("seq1");
  s1.create("struct","Stationary");
  s1.feature("struct").mesh("geom1","mesh1");
  s1.create("port","BoundaryModeAnalysis");
  s1.feature("port").set("PortName","port1");
  s1.feature("port").mesh("geom1","mesh2");
  s1.create("wave","Frequency");
  s1.feature("wave").mesh("geom1","mesh2");
  s1.feature("wave").mglevel().create("mgl1");
  s1.feature("wave").mglevel().create("mgl2");
  s1.feature("wave").mglevel("mgl2").mesh("geom1","mesh3");
  model.physics("rfw1").create("mgl1","Discretization");
  model.physics("rfw1").feature("mgl1").set("order","1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 3);
  model.component('comp1').geom('geom1').create('blk1', 'Block');
  model.component('comp1').geom.run;
  model.component('comp1').mesh.create('mesh1', 'geom1');
  model.component('comp1').mesh.create('mesh2', 'geom1');
  model.component('comp1').mesh.create('mesh3', 'geom1');
  model.physics.create('rfw1', 'ElectromagneticWaves', 'geom1');
  model.study.create('seq1');
  s1 = model.study('seq1');
  s1.create('struct','Stationary');
  s1.feature('struct').mesh('geom1','mesh1');
  s1.create('port','BoundaryModeAnalysis');
  s1.feature('port').set('PortName','port1');
  s1.feature('port').mesh('geom1','mesh2');
  s1.create('wave','Frequency');
  s1.feature('wave').mesh('geom1','mesh2');
```

```
s1.feature('wave').mglevel.create('mgl1');
s1.feature('wave').mglevel.create('mgl2');
s1.feature('wave').mglevel('mgl2').mesh('geom1','mesh3');
model.physics('rfw1').create('mgl1','Discretization');
model.physics('rfw1').feature('mgl1').set('order','1');
```

In this case, the only settings that must be applied in the study members of other features are the ones relating to multigrid levels. The physics interfaces' equation form is by default set to automatic, which means that they respond suitably to the study type each time an extended mesh (xmesh) is created.

## **SEE ALSO**

```
model.batch(), model.physics(), model.sol()
model.thermodynamics()
```

Create constants and functions interfacing to a thermodynamics property package.

#### **SYNTAX**

Creating a thermodynamics property package feature.

```
model.thermodynamics().create(<ptag>,"PropertyPackage");
```

Setting and getting properties in a thermodynamics property package feature:

```
model.thermodynamics().feature(<ptag>).set(<prop>,<value>);
model.thermodynamics().feature(<ptag>).getString(<prop>);
```

TABLE 2-134: PROPERTIES SUPPORTED BY A THERMODYNAMICS PROPERTY PACKAGE.

| NAME            | TYPE   | DESCRIPTION                                                                 |  |  |
|-----------------|--------|-----------------------------------------------------------------------------|--|--|
| manager_id      | String | Thermodynamics manager ID.                                                  |  |  |
| manager_version | String | Thermodynamics manager version.                                             |  |  |
| package_id      | String | Thermodynamics package ID.                                                  |  |  |
| package_desc    | String | Thermodynamics package description. Only for display in the user interface. |  |  |

```
model.thermodynamics().feature(<ptag>).storePersistenceData();
```

Calling this method after a property package feature has been created, and manager\_id and package\_id have been set, stores information about how the thermodynamics package was created in the COMSOL model. If the model is later opened on a computer with the thermodynamics manager installed but without the property package, this information can be used to create the required property package.

```
model.thermodynamics().feature(<ptag>).create(<ftag>, <type>);
```

Creates a thermodynamics constant, function, or flash calculation feature. Possible types are CompoundConstant, TemperatureDependentProperty, PressureDependentProperty, OnePhaseProperty, TwoPhaseProperty, and FlashCalculationProperty.

```
model.thermodynamics().feature(<ptag>).feature(<ftag>).set(<prop>,<value>);
model.thermodynamics().feature(<ptag>).feature(<ftag>).getString(<prop>);
model.thermodynamics().feature(<ptag>).feature(<ftag>).getStringArray(<prop>);
model.thermodynamics().feature(<ptag>).feature(<ftag>).getStringMatrix(<prop>);
```

Set and get properties in a thermodynamics constant, function, or flash calculation feature.

TABLE 2-135: PROPERTIES SUPPORTED BY ALL THERMODYNAMICS CONSTANT, FUNCTION, AND FLASH CALCULATION FEATURES.

| NAME       | TYPE   | DESCRIPTION                                                                           |
|------------|--------|---------------------------------------------------------------------------------------|
| prop_basis | String | Basis ("mass" or "mole") for evaluated properties. Only relevant for some properties. |

## *Thermodynamics Constant Features*

The thermodynamics constant features are features with the type "CompoundConstant", and are used to define constants that get their value from a thermodynamics package.

TABLE 2-136: PROPERTIES SUPPORTED BY THERMODYNAMICS CONSTANT FEATURES.

| NAME     | TYPE   | DESCRIPTION                                                                                                                                                                                                   |  |  |  |
|----------|--------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|
| funcname | String | Name of constant; that is, a variable name that can be used in expressions.                                                                                                                                   |  |  |  |
| compound | String | Identifier for compound in the thermodynamics property package.                                                                                                                                               |  |  |  |
| property | String | Identifier for property in the thermodynamics property package.                                                                                                                                               |  |  |  |
| value    | String | Numerical value of constant. This value is only displayed in the user interface. When the<br>constant is evaluated in an expression, the value is obtained by calling the thermodynamics<br>property package. |  |  |  |

#### *Thermodynamics Function Features*

A thermodynamics function feature defines a function that can be used to evaluate properties that depend, for example, on temperature or pressure. Different types are TemperatureDependentProperty, PressureDependentProperty, OnePhaseProperty, and TwoPhaseProperty.

TABLE 2-137: PROPERTIES SUPPORTED BY THERMODYNAMICS FUNCTION FEATURES.

| NAME        | TYPE          | DESCRIPTION                                                                                                                         |  |
|-------------|---------------|-------------------------------------------------------------------------------------------------------------------------------------|--|
| funcname    | String        | Name of function.                                                                                                                   |  |
| derivatives | String array  | Names of partial derivatives of function.                                                                                           |  |
| compounds   | String array  | Identifiers for compounds in the thermodynamics property package.                                                                   |  |
| comp_basis  | String        | Basis ("mass" or "mole") for amounts of compounds. Only relevant for functions of<br>type "OnePhaseProperty" or "TwoPhaseProperty." |  |
| property    | String        | Identifier for the property to evaluate in the thermodynamics property package.                                                     |  |
| phase       | String        | Identifier for phase in the thermodynamics property package. Only for features of<br>type "OnePhaseProperty."                       |  |
| phase1      | String        | Identifier for first phase in the thermodynamics property package. Only for features of<br>type "TwoPhaseProperty."                 |  |
| phase2      | String        | Identifier for second phase in the thermodynamics property package. Only for<br>features of type "TwoPhaseProperty."                |  |
| args        | String matrix | Names, units, and descriptions for the function arguments. Only for display in the<br>user interface.                               |  |
| unit        | String        | Unit of the function. Only for display in the user interface.                                                                       |  |

Functions of type TemperatureDependentProperty and PressureDependentProperty have a single argument, which is the temperature or pressure, respectively.

Functions of type OnePhaseProperty have temperature and pressure as their first two arguments. If there is more than one compound, there are additional arguments for the fraction of each compound.

Functions of type TwoPhaseProperty have temperature and pressure as their first two arguments. If there is more than one compound, there are additional arguments for the fraction of each compound in each phase.

## *Thermodynamics Flash Calculation Features*

Thermodynamics flash calculation features are used as an interface for flash calculations, which take amounts of different compounds and two conditions (for example, temperature and pressure) as input and compute the fraction of each compound that is present in each phase.

TABLE 2-138: PROPERTIES SUPPORTED BY THERMODYNAMICS FLASH CALCULATION FEATURES.

| NAME        | TYPE          | DESCRIPTION                                                                                                                                                                     |  |
|-------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| compounds   | String array  | Identifiers for compounds in the thermodynamics property package.                                                                                                               |  |
| cond1       | String        | First flash condition.                                                                                                                                                          |  |
| cond2       | String        | Second flash condition.                                                                                                                                                         |  |
| temperature | String        | Name of function evaluating the temperature (if temperature is not one of the flash<br>conditions).                                                                             |  |
| pressure    | String        | Name of function evaluating the pressure (if pressure is not one of the flash<br>conditions).                                                                                   |  |
| inphase     | String        | Base name for functions evaluating presence of each phase. Function names for each<br>phase are formed by appending _ <phase> to the base name.</phase>                         |  |
| amounts     | String        | Base name for functions evaluating amount of each phase. Function names for each<br>phase are formed by appending _ <phase> to the base name.</phase>                           |  |
| composition | String        | Base name for functions evaluating fraction of each compound in each phase. Function<br>names are formed by appending _ <phase>_<compound> to the base name.</compound></phase> |  |
| soltype     | String        | Solution type ("undefined", "normal," or "retrograde").                                                                                                                         |  |
| args        | String matrix | Names, units, and descriptions for the function arguments. Only for display in the user<br>interface.                                                                           |  |
| phases      | String array  | Names of all phases. Only for display in the user interface. The phases used in the flash<br>calculation are determined by the thermodynamics property package.                 |  |

Each flash calculation feature defines a number of functions. All of the functions take the values of two flash conditions as their first two arguments, followed by arguments for the total amount of each compound.

# **SEE ALSO**

model.func()

*model.unitSystem()*

Unit systems.

#### **SYNTAX**

```
UnitSystem us = model.unitSystem().create(<tag>);
us.baseUnit().create(<tag>,<symbol>,<quantity>)
us.derivedUnit().create(<tag>,<units>,<powers>);
us.additionalUnit().create(<tag>,<dim>);
model.unitSystem().builtInTags();
us.baseUnit(<tag>);
us.derivedUnit(<tag>);
us.additionalUnit(<tag>)
us.derivedUnit(<tag>).aliases();
us.baseUnit(<tag>).dimension();
us.derivedUnit(<tag>).quantity();
us.derivedUnit(<tag>).offset();
us.derivedUnit(<tag>).scale();
us.derivedUnit(<tag>).symbol();
us.derivedUnit(<tag>).definition(<units>,<powers>);
us.additionalUnit(<tag>).aliases(<aliases>);
us.additionalUnit(<tag>).quantity(<quantity>);
us.additionalUnit(<tag>).offset(<offset>);
us.additionalUnit(<tag>).scale(<scale>);
us.additionalUnit(<tag>).offset(<offset>);
us.additionalUnit(<tag>).symbol(<symbol>);
```

#### **DESCRIPTION**

model.unitSystem().create(*<uname>*) creates a unit system *<uname>*.

us.baseUnit().create(*<tag>*,*<symbol>*,*<quantity>*) creates a base unit for the quantity *<quantity>*, tagged *<tag>* with the symbol *<symbol>*. The quantity is any of the seven base dimensions (length, mass, time, current, temperature, substance, and intensity).

us.derivedUnit().create(*<tag>*,*<units>*,*<powers>*) creates a new derived unit tagged *<tag>* and derived from the units in *<units>* each to the power of the powers in *<powers>*.

us.derivedUnit(*<tag>*).definition(*<units>*,*<powers>*) sets the definition of a derived unit in powers of other units. The resulting dimension must agree with any previously specified dimension for this unit. Use the create method to define a dimension from the derived units.

us.additionalUnit().create(*<tag>*,*<dim>*) creates a new additional unit.

All methods below are valid for all units, no matter what unit list they belong to. Furthermore, only the set methods are described here, but there is also a corresponding get method.

model.unitSystem().builtInTags() returns the tags of the built-in unit systems. The method model.unitSystem().tags() returns the tags of the user-defined unit systems. Both sets of tags can be used to retrieve the unit system using model.unitSystem(*<tag>*).

us.additionalUnit(*<tag>*).aliases(*<aliases>*) sets alternative names for the unit that can be used in unit expressions.

us.additionalUnit(*<tag>*).quantity(*<quantity>*) assigns a physical quantity to the given unit.

us.additionalUnit(*<tag>*).scale(*<scale>*) sets the scale of the additional unit.

us.derivedUnit(*<tag>*).symbol(*<symbol>*) sets the symbol of the derived unit.

us.derivedUnit(*<tag>*).offset(*<offset>*) sets the offset of the derived unit.

#### **NOTES**

You can set the base unit system for the entire model using model.baseSystem(*<utag>*) or separately for each component node using model.component(*<tag>*).baseSystem(*<utag>*).

The SI system is read only and always created by default.

#### **EXAMPLE**

Create a cgs2 unit system with the base unit for length set to centimeter (cm). Also add meter/second (m/s) as a derived unit for speed and degrees Celsius as an additional unit for temperature:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  UnitSystem us = model.unitSystem().create("cgs2");
  model.baseSystem("cgs2");
  us.baseUnit().create("centimeter","cm","length");
  us.derivedUnit().create("meter_per_second",new int[]{1,0,-1,0,0,0,0,0});
  Unit du = us.derivedUnit("meter_per_second");
  du.definition(new String[]{"meter","second"},new int[]{1,-1,0,0,0,0,0,0});
  Unit au = us.additionalUnit().create("celsius",new int[]{0,0,0,0,1,0,0,0});
  au.offset(273.15);
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  us = model.unitSystem.create('cgs2');
  model.baseSystem('cgs2');
  us.baseUnit.create('centimeter','cm','length');
  us.derivedUnit.create('meter_per_second',[1,0,-1,0,0,0,0,0]);
  du = us.derivedUnit('meter_per_second');
  du.definition({'meter','second'},[1,-1,0,0,0,0,0,0]);
  au = us.additionalUnit.create('celsius',[0,0,0,0,1,0,0,0]);
  au.offset(273.15);
SEE ALSO
model.physics()
model.variable()
```

Create, define, and remove variables.

## **SYNTAX**

```
model.variable().create(<tag>);
model.variable(<tag>).set(<var>,<expr>);
model.variable(<tag>).set(<var>,<expr>,<descr>);
model.variable(<tag>).descr(<var>,<descr>);
model.variable(<tag>).remove(<var>);
model.variable(<tag>).clear();
model.variable(<tag>).model(<mtag>);
model.variable(<tag>).varnames();
model.variable(<tag>).get(<var>);
model.variable(<tag>).descr(<var>);
model.variable(<tag>).model();
model.variable(<tag>).scope();
model.variable(<tag>).loadFile(tempFile, ...);
model.variable(<tag>).saveFile(tempFile, ...);
```

For variables on the component level, use

model.component(*<ctag>*).variable().create(*<tag>*), and so on, instead of the syntax above for global variables.

#### **DESCRIPTION**

model.variable(*<tag>*) returns a variable collection. Each variable collection can contain several variables, but only one selection.

```
model.variable().create(<tag>) creates a variables node with tag <tag>.
model.variable(<tag>).set(<var>,<expr>) defines the variable <var> by the expression <expr>.
model.variable(<tag>).set(<var>,<expr>,<descr>) defines a variable and gives it a description.
model.variable(<tag>).descr(<var>,<descr>) defines a description for the variable <var>.
model.variable(<tag>).model(<mtag>) sets the model component node.
model.variable(<tag>).selection().named(<seltag>) assigns the variable node to the named selection 
<seltag>. 
model.shape(<tag>).selection().set(...) defines a local selection that assigns the variable collection to 
geometric entities. Before assigning a selection, the variable's model must be set using 
model.variable(<tag>).model(<mtag>). Only the global selection and selections on a geometry in the model 
can be used. For a complete list of methods available under selection(), see Selections.
model.variable(<tag>).remove(<var>) removes a variable from the variable collection. 
model.variable(<tag>).clear() removes all variables from the variable collection.
model.variable(<tag>).varnames() returns the names of all expressions as a string array.
model.variable(<tag>).get(<var>) returns the variable value as a string.
model.variable(<tag>).descr(<var>) returns the variable description as a string.
model.variable(<tag>).model() returns the model component node tag.
model.variable(<tag>).scope() returns the fully qualified scope name.
model.variable(<tag>).selection().named() returns the selection tag as a string.
model.variable(<tag>).selection().getType() returns domain information. For available methods, see 
model.selection().
```

For model.param().loadFile() and model.param().saveFile(), see The loadFile and saveFile Methods.

#### **EXAMPLES**

Define the expression e as x+1 in Domains 1 and 2 and as x-1 in Domain 3.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1",3);
  model.component("comp1").geom("geom1").create("blk1", "Block");
  model.component("comp1").geom("geom1").run();
  model.component("comp1").variable().create("e1").set("e","x+1");
  model.component("comp1").variable("e1").selection().geom("geom1",2);
  model.component("comp1").variable("e1").selection().set(new int[]{1,2});
  model.component("comp1").variable().create("e2").set("e","x-1");
  model.component("comp1").variable("e2").selection().geom("geom1",2);
  model.component("comp1").variable("e2").selection().set(3);
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component.geom.create('geom1',3);
  model.component.geom('geom1').create('blk1', 'Block');
```

```
model.component.geom('geom1').run;
model.component.variable.create('e1').set('e','x+1');
model.component.variable('e1').selection.geom('geom1',2);
model.component.variable('e1').selection.set([1,2]);
model.component.variable.create('e2').set('e','x-1');
model.component.variable('e2').model('mod1');
model.component.variable('e2').selection().geom('geom1',2);
model.component.variable('e2').selection().set(3);
```

#### **SEE ALSO**

model.selection()

*model.view()*

Create and manage views.

![](_page_194_Picture_5.jpeg)

For views defined on the global level, under Results, omit component(*<ctag>*). from the syntax such as model.component(*<ctag>*).view().create(*<vtag>*,*<gtag>*) in the syntax examples below.

#### **SYNTAX**

```
model.component(<ctag>).view().create(<vtag>,<gtag>)
model.component(<ctag>).view().create(<vtag>,<viewdim>)
model.component(<ctag>).view().create(<vtag>,<gtag>,<workplane>)
model.component(<ctag>).view(<vtag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).axis().set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).axis().getType(<pname>)
model.component(<ctag>).view(<vtag>).camera().set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).camera().getType(<pname>)
model.component(<ctag>).view(<vtag>).copyToGeometry()
model.component(<ctag>).view(<vtag>).copyToWorkPlane()
model.component(<ctag>).view(<vtag>).geom()
model.component(<ctag>).view(<vtag>).getHiddenEntities()
model.component(<ctag>).view(<vtag>).getHiddenEntities(<mesh>)
model.component(<ctag>).view(<vtag>).getSDim()
model.component(<ctag>).view(<vtag>).isCurrent()
model.component(<ctag>).view(<vtag>).light().create(<ltag>,<ltype>)
model.component(<ctag>).view(<vtag>).light(<ltag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).light(<ltag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).hideObjects().create(<htag>)
model.component(<ctag>).view(<vtag>).hideObjects(<htag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).hideObjects(<htag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).hideEntities().create(<htag>)
model.component(<ctag>).view(<vtag>).hideEntities(<htag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).hideEntities(<htag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).hideEntities(<htag>).image()
model.component(<ctag>).view(<vtag>).hideMesh().create(<htag>)
model.component(<ctag>).view(<vtag>).hideMesh(<htag>).set(<pname>,<pvalue>)
model.component(<ctag>).view(<vtag>).hideMesh(<htag>).getType(<pname>)
model.component(<ctag>).view(<vtag>).hideMesh(<htag>).image()
```

# **DESCRIPTION**

*View Settings*

model.component(*<ctag>*).view() returns a list of view that can be used when viewing geometry/mesh and plot groups. Each view has an axis and some properties on the top level. In 3D, a view also has a camera and a list of lights. All views also have a list of hide features.

model.component(*<ctag>*).view().create(*<vtag>*,*<gtag>*) creates a view tied to the geometry with the given tag. The dimension of the view is the same as the dimension for the geometry.

model.component(*<ctag>*).view().create(*<vtag>*,*<viewdim>*) creates a view with the given tag for the given dimension (1, 2, or 3). These views are not tied to any geometry and show up under the Views node under Results in the COMSOL Desktop.

model.component(*<ctag>*).view().create(*<vtag>*,*<gtag>*,*<workplane>*) creates a view tied to the work plane with the given tag in the geometry sequence with the given tag. The dimension of the view is 2.

model.component(*<ctag>*).view(*<vtag>*).set(*<pname>*,*<pvalue>*) sets the given property to the given value.

model.component(*<ctag>*).view(*<vtag>*).geom() returns the geometry sequence (or null for the views not associated with a geometry).

model.component(*<ctag>*).view(*<vtag>*).getSDim() returns the view's space dimension.

model.component(*<ctag>*).view(*<vtag>*).get*Type*(*<pname>*) returns the property with the given name of type *Type*.

TABLE 2-139: VIEW PROPERTIES.

| NAME                 | VALUE        | DIMENSIONS | DESCRIPTION                                                                                       |
|----------------------|--------------|------------|---------------------------------------------------------------------------------------------------|
| default              | true   false | 1, 2, 3    | If this is the default view to use when viewing the<br>geometry and mesh.                         |
| headlight            | true   false | 3          | If the light in the camera should be turned on.                                                   |
| locked               | true   false | 1, 2, 3    | If the settings should be updated from interactive<br>changes or not.                             |
| rendermesh           | true   false | 2, 3       | If mesh rendering should be used (default: true).                                                 |
| scenelight           | true   false | 3          | If the background lights as specified by the added<br>lights should be turned on (default: true). |
| showmaterial         | true   false | 2, 3       | If the material color and texture should appear or<br>not (default: false).                       |
| showselection        | true   false | 2, 3       | If the selection colors should appear or not (default:<br>true).                                  |
| showunits            | true   false | 1, 2, 3    | If the axis units should appear or not.                                                           |
| transparency         | true   false | 3          | If the plot show be transparent (default: false).                                                 |
| transparencylevel    | 0 to 1       | 3          | The transparency level, where 0 is fully opaque and 1<br>is fully transparent (default: 0.5).     |
| uniformblending      | true   false | 3          | If the transparent plot should use Fresnel<br>transmittance (default: false).                     |
| uniformblendinglevel | 0 to 1       | 3          | The Fresnel transmittance (default: 0.5).                                                         |
| wireframe            | true   false | 3          | If wireframe rendering should be used.                                                            |
| xscale               | double       | 2, 3       | Scaling factor for x-axis when using a manual view<br>scale.                                      |
| yscale               | double       | 2, 3       | Scaling factor for y-axis when using a manual view<br>scale.                                      |
| zscale               | double       | 3          | Scaling factor for z-axis when using a manual view<br>scale.                                      |

*Axis Settings*

The axis settings apply to 2D views with an *x*- and a *y*-axis.

model.component(*<ctag>*).view(*<vtag>*).axis().set(*<pname>*,*<pvalue>*) sets the given axis property to the given value. Which axis properties that are available in the different dimensions are given in the table below.

model.component(*<ctag>*).view(*<vtag>*).axis().get*Type*(*<pname>*) returns the axis property with the given name.

TABLE 2-140: AXIS PROPERTIES.

| NAME          | VALUE                                   | DIMENSIONS | DESCRIPTION                                                                                                                  |  |
|---------------|-----------------------------------------|------------|------------------------------------------------------------------------------------------------------------------------------|--|
| auto          | on   off                                | 1, 2, 3    | Set if axis settings should be automatically stored and updated<br>from interactive changes using mouse and toolbar buttons. |  |
| autocontext   | autofit  <br>isotropic  <br>anisotropic | 2          | The automatic view scaling when viewscaletype is set to<br>automatic: autofit (the default), isotropic, or anisotropic.      |  |
| equal         | on   off                                | 2, 3       | Should the same scaling be used for all directions.                                                                          |  |
| logx          | on   off                                | 1          | Should log scale be used for the x-axis.                                                                                     |  |
| logy          | on   off                                | 1          | Should log scale be used for the y-axis.                                                                                     |  |
| manualspacing | on   off                                | 2          | Should manual spacing be used for x and y grid lines.                                                                        |  |
| manuallimits  | on   off                                | 1, 2, 3    | Should manual axis limits be used. If not a zoom extents is<br>performed each time something is plotted into the axis.       |  |
| viewscaletype | none   manual  <br>automatic            | 2          | The view scale specification: none (the default), manual, or<br>automatic.                                                   |  |
| xextra        | double array                            | 2          | An array with extra x grid lines.                                                                                            |  |
| xmax          | double                                  | 1, 2, 3    | The maximum x-coordinate.                                                                                                    |  |
| xscale        | double                                  | 2          | A positive scalar value for the x scale when viewscaletype<br>is set to manual.                                              |  |
| xspacing      | double                                  | 2          | Manual spacing for x grid lines.                                                                                             |  |
| xweight       | double                                  | 2          | A positive scalar value for the x weight when autocontext is<br>set to anisotropic.                                          |  |
| yextra        | double array                            | 2          | An array with extra y grid lines.                                                                                            |  |
| ymin          | double                                  | 2, 3       | The minimum y-coordinate.                                                                                                    |  |
| ymax          | double                                  | 2, 3       | The maximum y-coordinate.                                                                                                    |  |
| yscale        | double                                  | 2          | A positive scalar value for the yscale when viewscaletype is<br>set to manual.                                               |  |
| yspacing      | double                                  | 2          | Manual spacing for y grid lines.                                                                                             |  |
| yweight       | double                                  | 2          | A positive scalar value for the yweight when autocontext is<br>set to anisotropic.                                           |  |
| zmin          | double                                  | 3          | The minimum z-coordinate.                                                                                                    |  |
| zmax          | double                                  | 3          | The maximum z-coordinate.                                                                                                    |  |

#### *Camera Settings*

These settings apply to the camera for 3D views.

![](_page_196_Picture_6.jpeg)

Some camera settings are affected by the preference settings for default 3D views.

model.component(*<ctag>*).view*(<vtag>)*.camera().set(*<pname>*,*<pvalue>*) sets the given camera property to the given value.

model.component(*<ctag>*).view*(<vtag>)*.camera().get*Type*(*<pname>*) returns the camera property with the given name.

TABLE 2-141: CAMERA PROPERTIES.

| NAME          | VALUE                        | DESCRIPTION                                                                                                                      |  |
|---------------|------------------------------|----------------------------------------------------------------------------------------------------------------------------------|--|
| autocontext   | isotropic  <br>anisotropic   | Use an isotropic automatic cube scaling or an anisotropic automatic block<br>scaling with x, y, and z direction relative scales. |  |
| autoupdate    | true   false                 | Use automatic update of the view when viewscaletype is automatic.                                                                |  |
| projection    | perspective <br>orthographic | Use perspective or orthographic projection.                                                                                      |  |
| manualspacing | on   off                     | Should manual spacing be used for grid lines.                                                                                    |  |
| position      | double array                 | The position of the camera.                                                                                                      |  |
| target        | double array                 | The point the camera looks at.                                                                                                   |  |
| up            | double array                 | The up direction.                                                                                                                |  |
| rotationpoint | double array                 | The center of rotation.                                                                                                          |  |
| viewscaletype | none   automatic  <br>manual | Control the view scale to achieve a suitable axis scaling (default: None).                                                       |  |
| xextra        | double array                 | An array with extra x grid lines.                                                                                                |  |
| xspacing      | double                       | Manual spacing for x grid lines.                                                                                                 |  |
| xweight       | double                       | Relative weight in the x direction for anisotropic automatic view scale.                                                         |  |
| yextra        | double array                 | An array with extra y grid lines.                                                                                                |  |
| yspacing      | double                       | Manual spacing for y grid lines.                                                                                                 |  |
| yweight       | double                       | Relative weight in the y direction for anisotropic automatic view scale.                                                         |  |
| zextra        | double array                 | An array with extra z grid lines.                                                                                                |  |
| zspacing      | double                       | Manual spacing for z grid lines.                                                                                                 |  |
| zoomanglefull | double                       | The full field of view angle in degrees.                                                                                         |  |
| zweight       | double                       | Relative weight in the z direction for anisotropic automatic view scale.                                                         |  |

#### *Lighting Settings*

These settings control the different types of lighting — direction light, spotlight, headlight, and point light — that you can add to a 3D view.

model.component(*<ctag>*).view*(<vtag>)*.light().create(*<ltag>,<ltype>*) creates a light with the given tag and type. *<ltype>* can be any of 'DirectionalLight', 'PointLight', 'SpotLight', and 'HeadLight'.

model.component(*<ctag>*).view*(<vtag>)*.light(*<ltag>*).set(*<pname>*,*<pvalue>*) sets the given light property to the given value. Different properties are available for the different types of lights according to the table below.

model.component(*<ctag>*).view*(<vtag>)*.light(*<ltag>*).get*Type*(*<pname>*) returns the light property with the given name.

TABLE 2-142: LIGHT PROPERTIES.

| NAME                  | VALUE           | LIGHT TYPES | DESCRIPTION                                       |
|-----------------------|-----------------|-------------|---------------------------------------------------|
| angleattenuationscale | positive scalar | SpotLight   | Angle attenuation scale factor for<br>spotlights. |
| castlight             | boolean         | all         | Cast light.                                       |
| castshadows           | boolean         | all         | Cast shadows, if castlight is set<br>to true.     |
| castshadowsonfloor    | boolean         | all         | Cast shadows on floor.                            |

TABLE 2-142: LIGHT PROPERTIES.

| NAME                     | VALUE                 | LIGHT TYPES                    | DESCRIPTION                                                                                          |
|--------------------------|-----------------------|--------------------------------|------------------------------------------------------------------------------------------------------|
| color                    | string or RGB triplet | all                            | The color of the light.                                                                              |
| cameracoord              | on   off              | all                            | If the light should be defined in the<br>camera coordinate system or the<br>world coordinate system. |
| direction                | double array          | DirectionalLight,<br>SpotLight | The direction from which the light<br>shines or is directed at.                                      |
| distanceattenuationscale | positive scalar       | PointLight,<br>SpotLight       | Distance attenuation scale factor<br>for spotlights and point lights.                                |
| position                 | double array          | PointLight,<br>SpotLight       | The position from which the light<br>shines.                                                         |
| spreadangle              | double                | SpotLight                      | The spread angle for the light.                                                                      |

The following table lists the light properties for 3D views:

TABLE 2-143: LIGHT PROPERTIES IN 3D VIEWS.

| NAME              | VALUE                                                                                           | DEFAULT | DESCRIPTION                                                                     |
|-------------------|-------------------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------|
| ambientcolor      | custom   black  <br>blue   cyan   gray<br>  green   magenta  <br>red   white  <br>yellow   none | white   | The coloring of the intersection highlight, if<br>globalambient is set to true. |
| castshadows       | true   false                                                                                    | true    | Cast shadows from lights when direct shadows<br>are active.                     |
| globalambient     | true   false                                                                                    | true    | Include ambient light.                                                          |
| scenelight        | true   false                                                                                    | true    | Include scene light. Must be true for the other<br>properties to be active.     |
| showmarker        | true   false                                                                                    | true    | Show light marker.                                                              |
| totambient        | double (0–1)                                                                                    | 0.3     | The ambient intensity.                                                          |
| totlightintensity | double (0–1)                                                                                    | 1       | The light intensity.                                                            |
| usediffuse        | true   false                                                                                    | true    | Include diffuse light.                                                          |
| usespecular       | true   false                                                                                    | true    | Include specular light.                                                         |

*Visual Effects Settings: Ambient Occlusion, Shadows, and Gamma Correction*

The following table lists the properties for 3D views that control visual effects such as ambient occlusion, direct and floor shadows, and gamma correction:

TABLE 2-144: VISUAL EFFECTS PROPERTIES IN 3D VIEWS.

| NAME                        | VALUE        | DEFAULT | DESCRIPTION                                                        |
|-----------------------------|--------------|---------|--------------------------------------------------------------------|
| displayoutput               | boolean      | false   | Use gamma correction.                                              |
| displayoutput<br>brightness | double (0–1) | 0       | The brightness, if<br>displayoutputpreset is set to<br>custom.     |
| displayoutputcontrast       | double (0–4) | 1       | The contrast, if<br>displayoutputpreset is set to<br>custom.       |
| displayoutputexposure       | double (0–2) | 0.0     | The exposure value, if<br>displayoutputpreset is set to<br>custom. |

TABLE 2-144: VISUAL EFFECTS PROPERTIES IN 3D VIEWS.

| NAME                            | VALUE                                                                       | DEFAULT        | DESCRIPTION                                                                                                                                                                   |
|---------------------------------|-----------------------------------------------------------------------------|----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| displayoutputgamma              | double (1–4)                                                                | 2.2            | The gamma value, if<br>displayoutputpreset is set to<br>custom.                                                                                                               |
| displayoutputhue                | double (0–1)                                                                | 0              | The hue, if displayoutputpreset is<br>set to custom.                                                                                                                          |
| displayoutputpreset             | default   custom                                                            | default        | Use a preset gamma correction or<br>specify a custom gamma correction.                                                                                                        |
| displayoutput<br>saturation     | double (0–4)                                                                | 1              | The saturation, if<br>displayoutputpreset is set to<br>custom.                                                                                                                |
| displayoutputtonemap            | Integer string ("0" to<br>"4"                                               | "1" (Clamp)    | The tone map to use if<br>displayoutputpreset is set to<br>custom. The "0" to "4" correspond to<br>Filmic, None (the default), Extreme,<br>Bright, and Natural, respectively. |
| displayoutputvibrance           | double (0–1)                                                                | 0              | The                                                                                                                                                                           |
| flooreffect                     | boolean                                                                     | false          | Add floor shadows.                                                                                                                                                            |
| flooreffectambient<br>occlusion | boolean                                                                     | true           | Use ambient occlusion.                                                                                                                                                        |
| flooreffectangle                | double                                                                      | 5              | Pitch angle for the floor shadows (in<br>degrees), if<br>flooreffectnormalsettings is set<br>to angle.                                                                        |
| flooreffectnormal               | double array                                                                | {0, 0, 1}      | The floor effect normal vector, if<br>flooreffectnormalpreset is set to<br>custom.                                                                                            |
| flooreffectnormal<br>preset     | xyplane   yzplane  <br>zxplane   yzplane  <br>zyplane   xzplane  <br>custom | xyplane        | The floor shadow normal preset, if<br>flooreffectnormalsettings is set<br>to explicit.                                                                                        |
| flooreffectnormal<br>settings   | angle   explicit                                                            | angle          | The floor effect normal setting: derive<br>from pitch angle or specify explicitly.                                                                                            |
| flooreffectoffset               | double                                                                      | 0              | Additional floor shadow effect offset; a<br>positive number moved the floor<br>farther away.                                                                                  |
| flooreffectorigin               | double array                                                                | {0, 0, 0}      | The floor effect origin, if<br>flooreffectoriginsettings is set<br>to explicit.                                                                                               |
| flooreffectorigin<br>settings   | farthestvertex  <br>boundingsphere  <br>boundingbox  <br>explicit           | farthestvertex | Floor origin settings: offset by farthest<br>vertex, bounding sphere, bounding box,<br>or explicit.                                                                           |
| flooreffectshadow               | boolean                                                                     | true           | Use direct floor shadows                                                                                                                                                      |
| flooreffectshadowblur           | double (0–1)                                                                | 0              | Additional blur, if<br>flooreffectshadowblur is set to<br>true.                                                                                                               |
| flooreffect<br>transparency     | double (0–1)                                                                | 0              | The transparency of the floor shadows.                                                                                                                                        |
| shadowmapping                   | boolean                                                                     | false          | Add direct shadows.                                                                                                                                                           |

TABLE 2-144: VISUAL EFFECTS PROPERTIES IN 3D VIEWS.

| NAME                                     | VALUE                           | DEFAULT | DESCRIPTION                                                                                    |
|------------------------------------------|---------------------------------|---------|------------------------------------------------------------------------------------------------|
| shadowmappingaccurate<br>depthcomparison | boolean                         | false   | Use accurate depth comparison, when<br>shadowmappingpreset is set to<br>preset.                |
| shadowmappingbias<br>settings            | default   custom                | default | Use the default bias settings for direct<br>shadows, or use custom settings.                   |
| shadowmapping<br>constantdepthbias       | double (0–1)                    | 0.001   | Constant depth bias, if<br>shadowmappingbiassettings is set<br>to custom.                      |
| shadowmappinglimit<br>lightviewfrustums  | boolean                         | false   | Limit light view frustums, when<br>shadowmappingpreset is set to<br>preset.                    |
| shadowmappingmulti<br>samplingeverywhere | boolean                         | true    | Use multisampling everywhere, when<br>shadowmappingpreset is set to<br>preset.                 |
| shadowmappingnumber<br>ofoccludersamples | integer (1–200)                 | 8       | Number of occluder samples, when<br>shadowmappingpreset is set to<br>preset.                   |
| shadowmappingnormal<br>awaresmoothing    | boolean                         | false   | Use normal-aware smoothing, if<br>shadowmappingaccuratedepthcomp<br>arison is set to true.     |
| shadowmappingnormal<br>offsetbias        | double (0–1)                    | 0.003   | Normal offset bias, if<br>shadowmappingbiassettings is set<br>to custom.                       |
| shadowmappingnumber<br>ofsamples         | integer (1–200)                 | 16      | Number of samples, when<br>shadowmappingpreset is set to<br>preset.                            |
| shadowmappingpreset                      | low   medium   high<br>  custom | low     | Quality preset for direct shadows: low,<br>medium, or high quality, or use custom<br>settings. |
| shadowmapping<br>resolution              | double (0–1)                    | 0.5     | Resolution, when<br>shadowmappingpreset is set to<br>preset.                                   |
| shadowmappingslope<br>depthbias          | double (0–1)                    | 0.001   | Slope depth bias, if<br>shadowmappingbiassettings is set<br>to custom.                         |
| shadowmapping<br>softness                | double (0–3)                    | 0.5     | Strength of the direct shadows.                                                                |
| shadowmapping<br>strength                | double (0–1)                    | 0.5     | Softness of the direct shadows.                                                                |
| ssao                                     | boolean                         | false   | Add ambient occlusion.                                                                         |
| ssaokernelrotations<br>texturewidth      | double (0–8)                    | 4       | Kernel rotations texture width, when<br>ssaopreset is set to custom.                           |
| ssaomagnitude                            | double (0–10)                   | 1       | Shadow strength for ambient occlusion.                                                         |
| ssaonormalaware<br>smoothing             | boolean                         | false   | Add normal-aware smoothing for<br>ambient occlusion, when ssaopreset<br>is set to custom.      |
| ssaonsamples                             | integer (1–300)                 | 64      | Number of samples, when ssaopreset<br>is set to custom.                                        |

TABLE 2-144: VISUAL EFFECTS PROPERTIES IN 3D VIEWS.

| NAME               | VALUE                           | DEFAULT  | DESCRIPTION                                                                                       |
|--------------------|---------------------------------|----------|---------------------------------------------------------------------------------------------------|
| ssaopreset         | low   medium   high<br>  custom | medium   | Quality preset for ambient occlusion:<br>low, medium, or high quality, or use<br>custom settings. |
| ssaoradiusexplicit | double (>0)                     | 0.4      | Maximum distance to occluder, when<br>ssaoradiustype is set to explicit.                          |
| ssaoradiusrelative | double (>0)                     | 0.4      | Fraction of scene bounding box, when<br>ssaoradiustype is set to relative.                        |
| ssaoradiustype     | relative  <br>explicit          | relative | Radius type, for ambient occlusion<br>when ssao is set to true.                                   |
| ssaoresolution     | double (0–1)                    | 1        | Resolution, when ssaopreset is set to<br>custom.                                                  |
| ssaoroughness      | double (0–1)                    | 1        | Roughness, when ssaopreset is set to<br>custom.                                                   |
| ssaosmooth         | double (0–8)                    | 2        | Smooth, when ssaopreset is set to<br>custom.                                                      |
| ssaosqueeze        | double (0–10)                   | 1        | Shadow tightness for ambient occlusion.                                                           |

*Hiding Geometry Objects, Geometric Entities, and Imported Meshes*

model.component(*<ctag>*).view(*<vtag>*).hideObjects().create(*<htag>*) creates a hide feature of geometric objects in the geometry sequence. The API for controlling it is similar to the API for selection in the geometry sequence; see Geometry Object Selection Methods under model.geom().

model.component(*<ctag>*).view(*<vtag>*).hideEntities().create(*<htag>*) creates a hide feature of geometric entities in the analyzed geometry used, for example, for the physics. The API for controlling it is similar to the API for selections on the finalized geometry; see model.selection().

model.component(*<ctag>*).view(*<vtag>*).hideMesh().create(*<htag>*) creates a hide feature of geometric entities in the analyzed geometry from an imported mesh used, for example, for the physics. The API for controlling it is similar to the API for selections on the finalized geometry; see model.selection(). For example, the following code hides boundary 4 in the geometry based on the mesh in mesh1:

```
// Create mesh hide object in view 1
model.component("comp1").view("view1").hideMesh().create("hide1");
// Select mesh1
model.component("comp1").view("view1").hideMesh("hide1").mesh("mesh1");
// Hide boundary 4 (3D is assumed)
model.component("comp1").view("view1").hideMesh("hide1").geom(2).set(4);
```

model.component(*<ctag>*).view(*<vtag>*).getHiddenEntities() returns an integer array of hidden entities in each dimension. The entity numbers refer to the entities of the finalized geometry.

model.component(*<ctag>*).view(*<vtag>*).getHiddenEntities(*<mesh>*) returns an integer array of hidden entities in each dimension. The entity numbers refer to the entities of specified meshing sequence with the tag *<mesh>* in its current state.

For plotting or exporting images of views with hidden objects, use the model.component(<ctag>).view(<vtag>).hideEntities(<htag>).image() and model.component(<ctag>).view(<vtag>).hideMesh(<htag>).image() methods. See Plotting and Exporting Images.

# *Copying Views*

To copy a view to a geometry or work plane, you can use the copyToGeometry and copyToWorkPlane methods. For example,

```
model.component("comp1").view("view1").copyToWorkPlane();
```

copies the view view1 to a work plane.

## *Clipping Tool Settings*

These settings control the different types of clipping tools — clip plane, clip box, clip sphere, and clip cylinder that you can add to a 3D view.

model.component(*<ctag>*).view*(<vtag>)*.clip().create(*<ctag>,<ctype>*) creates clipping tool with the given tag and type. *<ctype>* can be any of 'ClipPlane', 'ClipBox', 'ClipSphere', and 'ClipCylinder'.

model.component(*<ctag>*).view*(<vtag>)*.clip(*<ctag>*).set(*<pname>*,*<pvalue>*) sets the given clipping tool property to the given value. Different properties are available for the different types of clipping tools according to the table below.

model.component(*<ctag>*).view*(<vtag>)*.clip(*<ctag>*).get*Type*(*<pname>*) returns the clipping tool property with the given name.

TABLE 2-145: CLIPPING PROPERTIES FOR THE VIEW FEATURES.

| NAME                                                | VALUE                                                                                                             | DEFAULT   | DESCRIPTION                                                                                                                        |
|-----------------------------------------------------|-------------------------------------------------------------------------------------------------------------------|-----------|------------------------------------------------------------------------------------------------------------------------------------|
| clipapplyclipping                                   | true   false                                                                                                      | true      | Set to false to disable the clipping<br>action for the clipping tools.                                                             |
| clippingactive                                      | true   false                                                                                                      | true      | If the clipping tools are active. The<br>other properties in this table are<br>not available if clippingactive is<br>set to false. |
| clipedges                                           | true   false                                                                                                      | true      | Clip edges in the geometry.                                                                                                        |
| clipfaces                                           | true   false                                                                                                      | true      | Clip faces in the geometry.                                                                                                        |
| cliphighlightintersection                           | true   false                                                                                                      | true      | Highlight the intersection when<br>clipping.                                                                                       |
| clipintersectionhighlightcolor                      | custom  <br>fromtheme  <br>black   blue  <br>cyan   gray  <br>green   magenta<br>  red   white  <br>yellow   none | fromtheme | The coloring of the intersection<br>highlight, if<br>cliphighlightintersection is<br>set to true.                                  |
| clippoints                                          | true   false                                                                                                      | true      | Clip points in the geometry.                                                                                                       |
| clipprimaryhovereffect                              | true   false                                                                                                      | true      | Use clip primary hover effect.                                                                                                     |
| clipsecondaryhovereffect                            | true   false                                                                                                      | false     | Use clip contextual hover effect.                                                                                                  |
| clipshowcappedfaces                                 | true   false                                                                                                      | false     | Show cross sections.                                                                                                               |
| clipshowcappedfacescolorize                         | true   false                                                                                                      | true      | Colorize cross sections, if<br>clipshowcappedfaces is true.                                                                        |
| clipshowcappedfacescolorizeper                      | domain   object                                                                                                   | domain    | Colorize per domain or per<br>geometry object.                                                                                     |
| clipcappedfaceshighlight<br>overlappingdomains      | true   false                                                                                                      | true      | Highlight overlapping domains, if<br>clipshowcappedfaces is true.                                                                  |
| clipcappedfaceshighlight<br>overlappingdomainscolor | custom  <br>fromtheme  <br>black   blue  <br>cyan   gray  <br>green   magenta<br>  red   white  <br>yellow   none | fromtheme | The coloring of the overlapping<br>domains, if<br>clipcappedfaceshighlight<br>overlappingdomains is true.                          |
| clipcappedfacestransparency                         | double (0–1)                                                                                                      | 0.2       | The amount of transparency for the<br>cross sections.                                                                              |

TABLE 2-145: CLIPPING PROPERTIES FOR THE VIEW FEATURES.

| NAME                                   | VALUE        | DEFAULT | DESCRIPTION                                 |
|----------------------------------------|--------------|---------|---------------------------------------------|
| clipcappedfacestransparency<br>enabled | true   false | false   | Use transparency for the cross<br>sections. |
| clipshowframes                         | true   false | true    | Show the frames of the clipping<br>tools.   |
| clipshowgizmos                         | true   false | true    | Show gizmos for the clipping tools.         |

The following table lists the properties available for the clipping tools. Properties that are not available for all clipping tools have a note about availability in the **Description** column.

TABLE 2-146: CLIPPING PROPERTIES FOR THE CLIPPING TOOLS.

| NAME                          | VALUE         | DEFAULT | DESCRIPTION                                                               |
|-------------------------------|---------------|---------|---------------------------------------------------------------------------|
| applyclipping                 | true   false  | true    | Set to false to disable the clipping<br>action for the clipping tools.    |
| disableclipping               | true   false  | false   | Disable the clipping.                                                     |
| drawasintersectionwithgridbox | true   false  | true    | Draw as intersection with grid box.                                       |
| invertclipping                | true   false  | false   | Invert the clipping.                                                      |
| length                        | double        |         | The length of the clipping tool. For<br>ClipCylinder only.                |
| position                      | 1-by-3 double |         | The position of the clipping tool.                                        |
| radius                        | double        |         | The radius of the clipping tool. For<br>ClipSphere and ClipCylinder only. |
| showframe                     | true   false  | true    | Show a frame.                                                             |
| showgizmo                     | true   false  | true    | Show a gizmo.                                                             |

## *Environment Mapping Settings*

These settings control the environment mapping that can provide reflections on the model geometry and as a skybox to provide a background in the view. You add environment mapping by specifying one of the built- in environment maps (images), such as envmap\_park2:

model.component(*<ctag>*).view*(<vtag>)*.set("environmentmap","envmap\_park2") adds an environment map that shows a city park. To see its reflection on a model geometry you need to clear any selections and also activate the setting for showing material color and texture:

model.component(*<ctag>*).view(*<vtag>)*.set("showmaterial",true);.

TABLE 2-147: ENVIRONMENT MAPPING PROPERTIES.

| NAME                   | VALUE                          | DEFAULT | DESCRIPTION                                                                            |
|------------------------|--------------------------------|---------|----------------------------------------------------------------------------------------|
| environmentmap         | environment map or<br>none     | none    | The environment map to use. Use<br>none to turn off environment<br>mapping.            |
| environmentquality     | low   medium   high  <br>ultra | high    | The quality of the environment map.                                                    |
| environmentreflections | true   false                   | true    | Add environment reflections.                                                           |
| rotateenvironment      | true   false                   | false   | Rotate the environment map.                                                            |
| skybox                 | true   false                   | false   | Activate a skybox to make the<br>environment mapping for a<br>background for the view. |
| skyboxblend            | double (0–1)                   | 1       | The blending of the skybox, if skybox<br>is set to true. 1 means no blending.          |

TABLE 2-147: ENVIRONMENT MAPPING PROPERTIES.

| NAME             | VALUE                                                                                                             | DEFAULT         | DESCRIPTION                                                                                              |
|------------------|-------------------------------------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------|
| skyboxblurriness | double (0–1)                                                                                                      | 0               | The blurriness of the skybox, if<br>skybox is set to true. 0 means no<br>blurriness.                     |
| skyboxfov        | double (1–180)                                                                                                    | 110             | Skybox field of view, in degrees, if<br>skyboxprojection is set to<br>special.                           |
| skyboxprojection | special  <br>fromcamera                                                                                           | special         | The skybox projection, if skybox is<br>set to true. With fromcamera. the<br>camera's projection is used. |
| skydirection     | positivex  <br>negativex  <br>positivey  <br>negativey  <br>positivez  <br>negativez                              | positivey       | The sky direction.                                                                                       |
| skyrotation      | skyrotationzero  <br>skyrotationninety<br> <br>skyrotationhundre<br>deighty  <br>skyrotationtwohun<br>dredseventy | skyrotationzero | Rotate the environment map by 0, 90,<br>180, or 270 degrees.                                             |

## **SEE ALSO**

model.result()

*model.weak()*

Weak form equations.

#### **SYNTAX**

```
model.weak().create(<tag>);
model.weak(<tag>).weak(<wlist>);
model.weak(<tag>).weak(<pos>,<wepxr>);
model.weak(<tag>).intRule(<irlist>);
model.weak(<tag>).intRule(<pos>,<irule>);
model.weak(<tag>).condition(<condition>);
model.weak(<tag>).weak();
model.weak(<tag>).intRule();
model.weak(<tag>).condition();
```

## **DESCRIPTION**

model.weak(*<tag>*) returns the weak form equations with tag *<tag>*.

model.weak().create(*<tag>*) creates weak form equations with tag *<tag>*.

model.weak(*<tag>*).weak(*<wlist>*) sets the equations. You can supply a single weak expression or a list of weak expressions. *<wlist>* is a string or a string array.

model.weak(*<tag>*).weak(*<pos>*,*<wexpr>*) sets the equations at position *<pos>* in the list.

model.weak(*<tag>*).intRule(*<irlist>*) assigns the integration rules to the weak form equations. The list of integration rules must have the same length as the list of equations, or be of length 1. In the latter case all weak expressions use the same integration rule.

model.weak(*<tag>*).intRule(*<pos>*,*<irule>*) sets the integration rule at position *<pos>* in the integration rule list.

model.weak(*<tag>*).condition(*<condition>*) introduces conditional assembly. The feature is assembled if *<condition>* is true.

model.weak(*<tag>*).selection().named(*<seltag>*) assigns the weak equations to the named selection *<seltag>*.

model.weak(*<tag>*).selection().named(*<seltag>*) defines a local selection that assigns the weak equations to geometric entities. Before assigning a selection, the variable's model must be set using model.variable(*<tag>*).model(*<mtag>*). Only the global selection and selections on a geometry in the model can be used. For a complete list of methods available under selection(), see Selections.

#### **EXAMPLE**

Define the weak expressions u\*test(u) and v\*test(v) on the selection dom1, using the integration rule gp1 and the frame ref.

```
Code for Use with Java
  model.weak().create("w1").selection().named("dom1");
  model.weak("w1").intRule("gp1");
  model.weak("w1").weak(new String[]{"u*test(u)","v*test(v)"});
Code for Use with MATLAB
  model.weak.create('w1').selection.named('dom1');
  model.weak('w1').intRule('gp1');
  model.weak('w1').weak({'u*test(u)','v*test(v)'});
SEE ALSO
model.coeff(), model.shape()
```

# Plotting and Exporting Images

# *Overview*

For a number of model entities, two methods for plotting and exporting images are available:

- **•** image().plot() plots the model entity in a window. The plotting is available when running a graphics server. The plot() method does nothing when run from a model method.
- **•** image().export() exports an image of the model entity to file.

To set properties related to the plotting or export of images, use the standard set method on the image() object.

The following examples show the basic usage of these methods.

This example plots a geometry sequence in a window:

```
model.geom("geom1").image().plot();
```

This example exports a physics interface to a PNG file.

```
model.physics("es").image().set("pngfilename", "C:\physics.png");
model.physics("es").image().export();
```

```
The image() method is available for many objects in, for example, the lists model.common(), model.cpl(), 
model.coordSys(), model.func(), model.geom() (including individual geometry features), 
model.material(), model.mesh(), model.multiphysics(), model.pair(), model.physics(), 
model.physics(<tag>).feature(), model.probe(), and model.selection().
```

For mesh features, you can use the set property to specify the selection for the image() object:

```
model.mesh(<mtag>).feature(<ftag>).image().set("selection", "main")
```

It specifies that the feature's main selection, model.mesh(*<mtag>*).feature(*<ftag>*).selection(), will appear in the plot. This is the default. Use

```
model.mesh(<mtag>).feature(<ftag>).image().set("selection",<propname>)
```

to specify that a property selection, model.mesh(*<mtag>*).feature(*<ftag>*).selection(*<propname>)*, will appear in the plot.

For mesh features that do not have any selection, the selection property is ignored when plotting.

# *Properties for the image() Objects*

The following properties are available for the export of images:

TABLE 2-148: EXPORT PROPERTIES.

| PROPERTY        | VALUE                               | DEFAULT | DESCRIPTION                                                                                          |
|-----------------|-------------------------------------|---------|------------------------------------------------------------------------------------------------------|
| antialias       | on   off                            | on*     | Enable or disable antialiasing.                                                                      |
| axes1d          | on   off                            | on*     | If options1d is on; enable/disable display of the<br>coordinate axes in 1D.                          |
| axes2d          | on   off                            | on*     | If options2d is on; enable/disable display of the<br>coordinate axes in 2D.                          |
| axisorientation | on   off                            | on*     | If options is on: enable or disable display of the axis<br>orientation indicator. Used for 3D plots. |
| background      | current  <br>color  <br>transparent | color*  | The background color.                                                                                |

TABLE 2-148: EXPORT PROPERTIES.

| PROPERTY     | VALUE                                                                                 | DEFAULT    | DESCRIPTION                                                                                                                                                                                                                                                                                                                             |
|--------------|---------------------------------------------------------------------------------------|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| bmpfilename  | String                                                                                |            | The name of the output file if imagetype is bmp.                                                                                                                                                                                                                                                                                        |
| customcolor  | double array                                                                          | {1, 1, 1}* | If background is color: the red, green, and blue<br>components of the background color.                                                                                                                                                                                                                                                 |
| epsfilename  | String                                                                                |            | The name of the output file if imagetype is eps.                                                                                                                                                                                                                                                                                        |
| fontsize     | integer                                                                               | 9*         | The font size.                                                                                                                                                                                                                                                                                                                          |
| giffilename  | String                                                                                |            | The name of the output file if imagetype is gif.                                                                                                                                                                                                                                                                                        |
| grid         | on   off                                                                              | on*        | If options is on: enable or disable display of the<br>coordinate grid. Used for 3D plots.                                                                                                                                                                                                                                               |
| height       | integer                                                                               | 480 px*    | The height of the image.                                                                                                                                                                                                                                                                                                                |
| lockratio    | on   off                                                                              | off*       | If on, the aspect ratio of the image is preserved when the<br>width or the height is changed.                                                                                                                                                                                                                                           |
| imagetype    | bmp   eps  <br>jpeg   png  <br>tiff   gif                                             | png*       | The type of image to export. eps can only be used for 1D<br>plots.                                                                                                                                                                                                                                                                      |
| jpegfilename | String                                                                                |            | The name of the output file if imagetype is jpeg.                                                                                                                                                                                                                                                                                       |
| legend1d     | on   off                                                                              | on*        | If options1d is on: enable or disable display of the<br>legend in 1D.                                                                                                                                                                                                                                                                   |
| legend2d     | on   off                                                                              | on*        | If options2d is on: enable or disable display of the<br>legend in 2D.                                                                                                                                                                                                                                                                   |
| legend3d     | on   off                                                                              | on*        | If options3d is on: enable or disable display of the<br>legend in 3D.                                                                                                                                                                                                                                                                   |
| logo1d       | on   off                                                                              | on*        | If options1d is on: enable or disable display of the logo<br>in 1D.                                                                                                                                                                                                                                                                     |
| logo2d       | on   off                                                                              | on*        | If options2d is on: enable or disable display of the logo<br>in 2D.                                                                                                                                                                                                                                                                     |
| logo3d       | on   off                                                                              | on*        | If options3d is on: enable or disable display of the logo<br>in 3D.                                                                                                                                                                                                                                                                     |
| options1d    | on   off                                                                              | off*       | Enable or disable optional components of the image in<br>1D.                                                                                                                                                                                                                                                                            |
| options2d    | on   off                                                                              | off*       | Enable or disable optional components of the image in<br>2D.                                                                                                                                                                                                                                                                            |
| options3d    | on   off                                                                              | off*       | Enable or disable optional components of the image in<br>3D.                                                                                                                                                                                                                                                                            |
| pngfilename  | String                                                                                |            | The name of the output file if imagetype is png.                                                                                                                                                                                                                                                                                        |
| resolution   | integer                                                                               | 480 px*    | Tthe image resolution in dots per inch.                                                                                                                                                                                                                                                                                                 |
| size         | current   web<br>print  <br>presentation<br>  custom   any<br>custom size<br>settings | current*   | How to specify the size and resolution of the image. The<br>value current gives a 800-by-600 image with the<br>resolution 96 dots per inch. The values manualweb and<br>manualprint let you give a size and resolution suitable<br>for the web or printing, respectively, but also let you<br>specify the size and resolution manually. |
| tifffilename | String                                                                                |            | The name of the output file if imagetype is tiff.                                                                                                                                                                                                                                                                                       |
| title1d      | on   off                                                                              | on*        | If options1d is on: enable or disable display of the title in<br>1D.                                                                                                                                                                                                                                                                    |
| title2d      | on   off                                                                              | on*        | If options2d is on: enable or disable display of the title in<br>2D.                                                                                                                                                                                                                                                                    |

TABLE 2-148: EXPORT PROPERTIES.

| PROPERTY | VALUE        | DEFAULT | DESCRIPTION                                                          |
|----------|--------------|---------|----------------------------------------------------------------------|
| title3d  | on   off     | on*     | If options3d is on: enable or disable display of the title in<br>3D. |
| unit     | px   mm   in | px*     | The unit for the dimensions of the image.                            |
| width    | integer      | 480 px* | The width of the image when size is manualweb.                       |

<sup>\*</sup> When making an image export, the value of the image feature doing the export will be stored and used as the default value when creating a new image feature. The image feature is created the first time the image() method is called.

The following properties are related to plotting of images:

TABLE 2-149: PROPERTIES FOR PLOTTING.

| PROPERTY    | VALUE               | DEFAULT | DESCRIPTION                                                                                                             |
|-------------|---------------------|---------|-------------------------------------------------------------------------------------------------------------------------|
| window      | new   window<br>tag | new     | The window to plot in. The window tags must be of the<br>form windowN, where N is an integer (for example,<br>window3). |
| windowtitle | String              | Plot N  | The window's title. The default is Plot N, where N is<br>taken from the window tag.                                     |

The following properties are used for both export and plotting of images:

TABLE 2-150: PROPERTIES FOR EXPORT AND PLOTTING.

| PROPERTY        | VALUE                                           | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                |
|-----------------|-------------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| renderwireframe | on   off   fromview                             | on      | Whether to use wireframe rendering for the<br>geometry. The value fromview specifies that the view<br>controls the rendering. The other values override the<br>view setting. This property is only available in 3D and<br>only for the features that plot a selection. This<br>excludes geometries, meshes, and functions. |
| view            | auto   view tag                                 | auto    | The view settings to use when displaying this image.<br>auto indicates that the view is selected automatically<br>and will be the current view for the geometry being<br>displayed.                                                                                                                                        |
| zoomextents     | on   off                                        | on      | Whether to zoom the image to its extents. This<br>property is only available for image objects displaying<br>a geometry or mesh.                                                                                                                                                                                           |
| zooming         | nozooming  <br>zoomextents  <br>zoomtoselection | px*     | How to zoom the image. This property is available for<br>all image objects except for those displaying a<br>geometry, mesh, or function.                                                                                                                                                                                   |
| zoomlevel       | integer (in the range<br>from -15 to 15)        | 0       | The number of zoom-in (if positive) or zoom-out (if<br>negative) action steps to perform after zooming or<br>zoomextents has been applied.                                                                                                                                                                                 |

The tables below contain properties that are available for image() objects attached to a certain parent type.

The following property is used when attached to a geometry object:

TABLE 2-151: GEOMETRY PROPERTY.

| PROPERTY      | VALUE                  | DEFAULT  | DESCRIPTION                                   |
|---------------|------------------------|----------|-----------------------------------------------|
| showmaterial  | on   off  <br>fromview | fromview | Enable or disable material color and texture. |
| showselection | on   off  <br>fromview | fromview | Enable or disable material color and texture. |

The only difference for the showmaterial and showselection properties for the geometry is that the values are taken from the view by default- They are off by default for all other features (such as probes and physics features).

The following property is used when attached to a pair object:

TABLE 2-152: PAIR PROPERTY.

| PROPERTY  | VALUE                                  | DEFAULT   | DESCRIPTION                                                                                                               |
|-----------|----------------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------|
| selection | srcanddst  <br>source  <br>destination | srcanddst | Whether to display the source and destination selection,<br>only the source selection, or only the destination selection. |

The following property is used when attached to a physics feature or multiphysics coupling object:

TABLE 2-153: PHYSICS FEATURE OR MULTIPHYSICS COUPLING PROPERTY.

| PROPERTY  | VALUE                    | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                      |
|-----------|--------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selection | main  <br>selection name | main    | Which selection to display. Some physics features and<br>multiphysics couplings have multiple selections. The value<br>main corresponds to the selection retrieved by calling<br>selection() on the physics feature or coupling, and the<br>other values are the names to obtain a selection using<br>selection( <name>).</name> |

The following property is used when attached to a nonlocal coupling object:

TABLE 2-154: PAIR PROPERTY.

| PROPERTY  | VALUE                                    | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                                                   |
|-----------|------------------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selection | srcanddst  <br>source  <br>destination   | srcanddst | A property with these values is available for the Boundary<br>Similarity, Edge Map, and Point Map nonlocal coupling<br>features. Whether to display the source and destination<br>selection, only the source selection, or only the destination<br>selection. |
| selection | source  <br>srcvertices  <br>dstvertices | source    | A property with these values is available for the Linear<br>Extrusion and Linear Projection nonlocal coupling features.<br>Whether to display the source selection, the source<br>vertices selection, or the destination vertices selection.                  |

# Errors and Warnings

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

# Geometry

This chapter includes reference information about the geometry commands and how to work with a geometry sequence and the geometry objects to create the model geometry. In this chapter:

- **•** About Geometry Commands
- **•** Working with a Geometry Sequence
- **•** Geometry Settings
- **•** Work Planes
- **•** Selections of Geometric Entities
- **•** Geometry Cleanup
- **•** Virtual Operations
- **•** Geometry Object Information
- **•** Measurements
- **•** Inserting Geometry Sequences from File
- **•** Exporting Geometry to File
- **•** Creating and Using Geometry Parts
- **•** Geometry Commands