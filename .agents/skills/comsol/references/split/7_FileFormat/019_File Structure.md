# *File Structure*

The COMSOL Multiphysics native data file format has a global version number, so that it is possible to revise the whole structure. The first entry in each file is the file format, indicated by two integers. The first integer is the major file version and the second is referred to as the minor file version. For the current version, the first two entries in a file is 0 1.

The following sections describe the file structure of the supported version.

## **FILE VERSION 0.1**

After the file version, the file contains three groups of data:

- **•** A number of *tags* stored as strings, which are used so that objects can refer to each other.
- **•** A number of *types*, which are strings that can be used in serializing the object. The types are currently not used by the COMSOL Multiphysics software.
- **•** *Objects*, where each object starts with the header 0 0 1, followed by a string that defines which type of object that follows.

**Example** When using model.mesh(<tag>).export(<filename>) or **Mesh** > **Export to File** to save a COMSOL mesh, the tag equals the variable name (m1), the type is set to obj (but this is not used), and the file contains the serialization of the mesh object, including point coordinates and element data of the mesh. In this case, the file also contains a selection object. See some of the entries in Serializable Classes for more examples of COMSOL Multiphysics native text data file content.

```
