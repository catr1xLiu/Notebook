# *Special Property Types*

In addition to the basic data types, the set() and get\*() methods let you manipulate certain properties with special behavior.

#### **REFERENCE PROPERTY**

A reference property is property that stores a reference to an entity in the model object. Each reference property allows references to entities of a particular type, normally identified by the entity's tag. The property is set by passing the identifying tag to the standard set(<name>,String) method and read using getString(<name>). But since it is the reference rather than the tag that is stored, the returned value will change if the entity's tag is changed. If the referenced entity is removed or modified in a way which no longer makes it an allowed target for the property, the return value will be null or the string "none".

#### **REFERENCE ARRAY**

A reference array is an array of references where each position behaves like a reference property. Entity tags are set using set(<name>, String[]) or setIndex(<name>, String), and read using getStringArray(<name>). Some reference arrays store a specific number of references, while others represent sets of entities. When a referenced entity is removed from the model, it will also be removed from any referring property of the latter type.

#### **STRING MAP**

A string map property is a special type of string array property which is used to specify a value for each key in a given set of allowed keys. The key-value pairs are stored interleaved {key, value, key, value, ...} in the array. The order of the pairs is arbitrary when setting the array using set(<name>, String[]). The value for a specific key can also be set using setEntry(name, <key>, <value>). The keys are many cases references to a model entity specified using the entity's tag. But there are also properties using, for example, prefixed tags for entities of different types.

The complete map containing all possible keys and their current values is returned by getStringArray(name). The value for a specific key is returned by getString(name, <key>). If no values has been explicitly set for a given key, a default value is returned. The default may be different for each key. Values may also be references to a model entity.

