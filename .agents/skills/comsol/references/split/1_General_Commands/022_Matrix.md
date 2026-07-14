# *Matrix*

model.component(*<ctag>*).common().create(*<tag>*,"Matrix") creates a matrix variable feature. For a Matrix definition, the following properties are available.

TABLE 2-18: PROPERTIES FOR MATRIX.

| PROPERTY | VALUE                           | DEFAULT                                                   | DESCRIPTION                                                                |
|----------|---------------------------------|-----------------------------------------------------------|----------------------------------------------------------------------------|
| format   | full   symmetric  <br>hermitian | full                                                      | Matrix format.                                                             |
| matrix   | String matrix                   | {{"1", "0", "0"},<br>{"0", "1", "0"},<br>{"0", "0", "1"}} | The matrix elements of a square matrix.                                    |
| size     | Integer                         | 3                                                         | Matrix size. Valid values: 1–9,<br>representing 1-by-1 to 9-by-9 matrices. |

## *MatrixInverse*

model.component(*<ctag>*).common().create(*<tag>*,"MatrixInverse") creates a matrix inverse feature. For a MatrixInverse definition, the following properties are available.

TABLE 2-19: PROPERTIES FOR MATRIXINVERSE.

| PROPERTY | VALUE                           | DEFAULT                                                   | DESCRIPTION                                                                |
|----------|---------------------------------|-----------------------------------------------------------|----------------------------------------------------------------------------|
| format   | full   symmetric  <br>hermitian | full                                                      | Matrix format.                                                             |
| matrix   | String matrix                   | {{"1", "0", "0"},<br>{"0", "1", "0"},<br>{"0", "0", "1"}} | The matrix elements of the square matrix<br>to invert.                     |
| size     | Integer                         | 3                                                         | Matrix size. Valid values: 1–9,<br>representing 1-by-1 to 9-by-9 matrices. |

