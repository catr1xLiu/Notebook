# *Objects*

The objects section contains the serialization data for each serialized object, instantiated from a serializable class. The serialization of each object start with a version number. With this version number, the serialization can be revised in future versions while maintaining backward compatibility.

The following section describes the format of the supported version:

#### **OBJECT VERSION 0**

The following table contains the fields of the objects:

| DATA TYPE    | VARIABLE | DESCRIPTION                             |
|--------------|----------|-----------------------------------------|
| Integer      |          | Version.                                |
| Integer      |          | Not used.                               |
| Integer      | type     | Serialization type, 1 for Serializable. |
| Serializable | obj      | If type equals 1, this field follows.   |

Serialization type 1 indicates that the following field is a subtype to Serializable.

