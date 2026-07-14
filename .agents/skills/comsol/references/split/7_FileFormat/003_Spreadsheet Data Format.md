# *Spreadsheet Data Format*

This data format is used for importing unstructured data and exporting results data:

#### TABLE 9-2: DATA.

| SECTION | DESCRIPTION                     |
|---------|---------------------------------|
| Data    | Data values separated by spaces |

Each row of the file defines the coordinates and data values for the function in one point. A file used to define a function of three variables can begin as follows:

```
0 0 0.12 0.34
     0 1 0.52 1.50
     1 0 0.67 0.91
...
```

The first variable (input argument) appears in the first (leftmost) column, the second variable in the second column, the third variable in the third column, and the function values in the fourth (rightmost) column. The variables can be any function inputs. For space-dependent functions *f*(*x*, *y*, *z*) they are the *x*-, *y*-, and *z*-coordinates.

It is possible to define several functions in one file by providing more than one data column after the input variables (which, in many cases, are coordinates). When exporting several expressions to a file, COMSOL Multiphysics generates files with this structure.

![](_page_1_Picture_18.jpeg)

You can use the % character to indicate that a row contains comments and not data.

![](_page_2_Picture_1.jpeg)

The grid data format can only be used for import of data.

The following table shows the format for results data stored as grid points and corresponding data values:

TABLE 9-3: GRID, DATA.

| SECTION | NUMBER OF ROWS                                                                               | DESCRIPTION                                                                                                                          |
|---------|----------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| % Grid  | 1–3                                                                                          | x grid points separated by spaces.<br>y grid points separated by spaces (optional).<br>z grid points separated by spaces (optional). |
| % Data  | Number of y grid points (2D) or number of y grid points<br>times number of z grid points (3) | Data values separated by spaces.                                                                                                     |

Each row contains values for different *x* grid points for fixed values of *y* and *z*. The rows first increase the *y* grid value and then the *z* grid value. The grid points can also represent another independent variable that the data values depend on. For example, the "grid points" can be temperature values and the data values the thermal conductivity at these temperatures.

![](_page_2_Picture_7.jpeg)

It is important to use a comment line starting with % to separate the grid points or other interpolation points and the data values that are associated with these coordinates or interpolation points.

It is possible to include more than one function in the file as long as a % Data header separates them one from the other.

In the *COMSOL Multiphysics Reference Manual:*

![](_page_2_Picture_11.jpeg)

- **•** Interpolation
- **•** Examples of Spreadsheet, Sectionwise, and Grid File Formats
- **•** Exporting Data and Images

![](_page_2_Picture_15.jpeg)

*Rock Fracture Flow*: Application Library path **COMSOL\_Multiphysics/Geophysics/rock\_fracture\_flow**

