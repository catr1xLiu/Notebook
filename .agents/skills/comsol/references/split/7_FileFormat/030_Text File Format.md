# *Text File Format*

COMSOL Multiphysics text file, using the file extension .mphtxt, are text files where values are stored as text separated by whitespace characters.

## Lexical conventions:

- **•** Strings are serialized as the length of the string followed by a space and then the characters of the string, for example, "6 COMSOL". This is the only place where whitespace matters.
- **•** The software ignores everything following a # on a line except when reading a string. This makes it possible to store comments in the file.

