# *Sectionwise Data Format*

The following table shows the format for results data stored as node coordinates, elements, and corresponding data values:

TABLE 9-4: NODES, ELEMENTS, DATA.

| SECTION      | NO. COLUMNS    | DESCRIPTION                                                                                                                                                              |
|--------------|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| %Coordinates | 1–3            | One to three columns containing x, y (optional), and z (optional)                                                                                                        |
| %Elements    | 3 (2D), 4 (3D) | Triangulation where each row contains the row indices of the points in the<br>Coordinates section that make up a single element — triangular in 2D,<br>tetrahedral in 3D |
| %Data        | 1              | Column of data values                                                                                                                                                    |

This format can also be used to import data for unstructured interpolation. It has the advantage over the Spreadsheet Data Format in that it also contains the exact mesh used to perform the interpolation.

![](_page_3_Picture_1.jpeg)

Duplicate values (that is, evaluations with the same coordinates and the same values of the evaluated expressions) are removed before the sectionwise data is exported to file.

In the *COMSOL Multiphysics Reference Manual:*

![](_page_3_Picture_4.jpeg)

- **•** Examples of Spreadsheet, Sectionwise, and Grid File Formats
- **•** Exporting Data and Images

