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

