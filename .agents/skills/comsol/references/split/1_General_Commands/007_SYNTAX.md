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

