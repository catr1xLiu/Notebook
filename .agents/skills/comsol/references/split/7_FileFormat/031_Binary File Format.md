# *Binary File Format*

COMSOL Multiphysics binary file, using the extension .mphbin, are binary files with the following data representation:

- **•** Integers and doubles are stored in little-endian byte order.
- **•** Strings are stored as the length of the string (integer) followed by the characters of the string (integers).

