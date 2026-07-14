# Information and Statistics

## In this section:

- **•** Statistics
- **•** Number and Types of Elements
- **•** Quality of Elements
- **•** Volume of Elements and Mesh
- **•** Mesh Status
- **•** Mesh Plot
- **•** Measurements
- **•** Information on the Geometric Model

## *Statistics*

Use the stat() method on the meshing sequence to determine the number of elements of different types and the quality of elements. For information about number of entities, see Information on the Geometric Model.

The stat() method returns an object with a collection of methods that can be queried for statistical information about the current mesh. There is also a selection,

```
model.component(<ctag>).mesh(<tag>).stat().selection()
```

which is used to select geometric entities for which the statistics is calculated. The default selection is the entire geometry. The methods described below also exist directly on the meshing sequence. These methods always return statistics for the entire geometry.

Statistics can be requested per element type. The type is given as a string, denoted *type*, and the possible types are listed in the following table.

TABLE 4-4: ELEMENT TYPES.

| STRING | ELEMENT                                            | ELEMENT DIMENSION |
|--------|----------------------------------------------------|-------------------|
| vtx    | Vertex element                                     | 0                 |
| edg    | Edge element                                       | 1                 |
| tri    | Triangular element                                 | 2                 |
| quad   | Quadrilateral element                              | 2                 |
| tet    | Tetrahedral element                                | 3                 |
| pyr    | Pyramid element                                    | 3                 |
| prism  | Prism element                                      | 3                 |
| hex    | Hexahedral element                                 | 3                 |
| all    | All elements of maximal dimension in the selection |                   |

The parameter string all gives statistics for all elements with the same dimension as the maximal dimension of the current selection. For example, if the entire geometry is selected in 2D, the parameter all provides combined statistics for triangular and quadrilateral elements.

To specify the mesh quality measure to use, use the setQualityMeasure method. For example,

```
model.component(<ctag>).mesh(<tag>).stat().setQualityMeasure("maxangle")
```

To get the current mesh quality measure, use the getQualityMeasure method:

```
String model.component(<ctag>).mesh(<tag>).stat().getQualityMeasure()
```

The following mesh quality measures are available:

TABLE 4-5: MESH QUALITY MEASURES.

| NAME                                                                                                                                                                         | DESCRIPTION                                                                                                                                                                                |  |  |  |  |
|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|--|
| skewness<br>Skewness. This measure is based on a calculation of the mesh elements' equiangular skew.                                                                         |                                                                                                                                                                                            |  |  |  |  |
| maxangle                                                                                                                                                                     | Maximum angle. This measure is based on the largest angle in the element.                                                                                                                  |  |  |  |  |
| volcircum<br>Volume versus circumradius. This measure is based on a quotient of the element volume and the<br>radius of the circumscribed sphere (or circle) of the element. |                                                                                                                                                                                            |  |  |  |  |
| vollength                                                                                                                                                                    | Volume versus length. This measure is based on a quotient of element edge lengths and element<br>volume.                                                                                   |  |  |  |  |
| condition                                                                                                                                                                    | Condition number. This measure is based on the element dimension divided by the condition<br>number (in the Frobenius norm) of the matrix transforming the element to a reference element. |  |  |  |  |
| growth                                                                                                                                                                       | Neighbor growth rate. This measure is based on a mesh element growth rate calculation.                                                                                                     |  |  |  |  |
| curvedskewness                                                                                                                                                               | Curved skewness. This measure is defined as the elementwise product of skewness and<br>reldetjacmin, which is a measure of the deformation when generating the higher-order<br>element.    |  |  |  |  |
| custom                                                                                                                                                                       | A custom mesh quality expression.                                                                                                                                                          |  |  |  |  |

![](_page_14_Picture_4.jpeg)

- **•** Geometry Object Information
- **•** Selections

