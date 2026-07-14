# *Accessing Mesh Data*

To get the number of mesh vertices, use

```
int model.component(<ctag>).mesh(<tag>).getNumVertex();
```

To get the coordinates of the mesh vertices, use

```
double[][] model.component(<ctag>).mesh(<tag>).getVertex();
```

which gives you a matrix where each column corresponds to a mesh vertex.

To get the element types in the mesh, use

```
String[] model.component(<ctag>).mesh(<tag>).getTypes();
```

The following table lists the possible types. See Mesh Element Numbering Conventions for an explanation of each type.

TABLE 4-6: MESH ELEMENT TYPES.

| STRING | ELEMENT               | DIMENSION | NUMBER OF NODES |
|--------|-----------------------|-----------|-----------------|
| vtx    | Vertex element        | 0         | 1               |
| edg    | Edge element          | 1         | 2               |
| tri    | Triangular element    | 2         | 3               |
| quad   | Quadrilateral element | 2         | 4               |
| tet    | Tetrahedral element   | 3         | 4               |
| pyr    | Pyramid element       | 3         | 5               |
| prism  | Prism element         | 3         | 6               |
| hex    | Hexahedral element    | 3         | 8               |

To get the number of elements of a specific type, use

```
int model.component(<ctag>).mesh(<tag>).getNumElem(type);
```

To get the elements for a specific type, use

```
int[][] model.component(<ctag>).mesh(<tag>).getElem(type);
```

which gives you a matrix where each column contains the mesh vertex indices of an element's corners.

To get the geometric entity number for the elements of a specific type, use

```
int[] model.component(<ctag>).mesh(<tag>).getElemEntity(type);
```

To return the tags of imported mesh selections, use

```
String[] outputSelection();
```

The tag for the corresponding selection feature can then be derived by adding component tag and feature tag in front of the mesh selection tag. For example, if a mesh selection feature is imported by a feature imp1 in component comp1, and its tag (returned by the function outputSelection()) is mytag, the tag of the selection feature is comp1\_imp1\_mytag.

![](_page_19_Picture_1.jpeg)

Information and Statistics

