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

