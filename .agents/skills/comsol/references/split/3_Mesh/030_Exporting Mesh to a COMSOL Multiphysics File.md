# *Exporting Mesh to a COMSOL Multiphysics File*

To specify the dimensions of the elements to export or to choose to include or exclude the geometric entity information, enter

model.component(*<ctag>*).mesh(*<tag>*).export().set(*<property>,<value>*);

The following table lists the available properties:

| PROPERTY        | VALUE    | DEFAULT | DESCRIPTION                                                                         |
|-----------------|----------|---------|-------------------------------------------------------------------------------------|
| domelem         | on   off | on      | Specify if domain elements are exported.                                            |
| bndelem         | on   off | on      | Specify if boundary elements are exported.                                          |
| edgelem         | on   off | on      | Specify if edge elements are exported (3D only).                                    |
| vtxelem         | on   off | on      | Specify if vertex elements are exported (2D and 3D only).                           |
| geominfo        | on   off | on      | Specify if geometric entity information for each element is<br>exported.            |
| nativequadratic | on   off | off     | Specify if elements are exported as linear or second-order<br>(quadratic) elements. |
| selection       | on   off | off     | Specify if mesh selections are exported.                                            |

