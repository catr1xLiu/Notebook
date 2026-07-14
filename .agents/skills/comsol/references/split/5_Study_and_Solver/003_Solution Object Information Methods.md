# *Solution Object Information Methods*

The following tables are an overview of the solution object information methods.

## **GENERAL INFORMATION**

TABLE 6-3: GENERAL SOLUTION INFORMATION METHODS.

| METHOD       | DESCRIPTION                                                        |
|--------------|--------------------------------------------------------------------|
| getType      | Get solution type                                                  |
| getSize      | Get number of dynamic solutions and length of solution vector      |
| getSizeMulti | Get number of local solution objects and total number of solutions |
| getMesh      | Get mesh name associated with solution and geometry                |
| getNU        | Get number of solutions of a certain solution data type            |
| getPNames    | Get parameter names                                                |
| getParamName | Get parameter names for parametric sweep                           |
| getParamVals | Get parameter values for parametric sweep                          |

#### **SOLUTION DATA**

TABLE 6-4: SOLUTION DATA ACCESS METHODS.

| METHOD           | DESCRIPTION                                                 |
|------------------|-------------------------------------------------------------|
| getU             | Get real part of solution vector                            |
| getUDot          | Get real part of the first time-derivative solution vector  |
| getUImag         | Get imaginary part of solution vector                       |
| getUDotImag      | Get imaginary part of first time-derivative solution vector |
| getPVals         | Get the real part of the parameter values                   |
| getPValsImag     | Get the imaginary part of the parameter values              |
| getUBlock        | A blocked version of the getU method                        |
| getUDotBlock     | A blocked version of the getUDot method                     |
| getUImagBlock    | A blocked version of the getUImag method                    |
| getUDotImagBlock | A blocked version of the getUDotImag method                 |

## **SOLUTION CREATION**

TABLE 6-5: SOLUTION CREATION METHODS.

| METHOD           | DESCRIPTION                                                 |
|------------------|-------------------------------------------------------------|
| setU             | Set real part of solution vector                            |
| setUDot          | Set real part of the first time-derivative solution vector  |
| setUImag         | Set imaginary part of solution vector                       |
| setUDotImag      | Set imaginary part of first time-derivative solution vector |
| setPVals         | Set the real part of the parameter values                   |
| setPValsImag     | Set the imaginary part of the parameter values              |
| setUBlock        | A blocked version of the setU method                        |
| setUDotBlock     | A blocked version of the setUDot method                     |
| setUImagBlock    | A blocked version of the setUImag method                    |
| setUDotImagBlock | A blocked version of the setUDotImag method                 |

## **ERRORS AND WARNINGS**

See Errors and Warnings in the *General Commands* chapter for handling of errors and warnings in solver sequences.

Some solver features, including Assemble, Modal, ModalReduction, and StateSpace, create and store matrices and vectors. These are accessed by name using the following common methods.

#### **GENERAL INFORMATION**

TABLE 6-6: GENERAL MATRIX INFORMATION METHODS.

| METHOD | DESCRIPTION                             |
|--------|-----------------------------------------|
| isReal | Check if matrix is real                 |
| getM   | Get number of rows                      |
| getN   | Get number of columns                   |
| getNnz | Get number of nonzeros in sparse matrix |

#### **MATRIX DATA**

TABLE 6-7: MATRIX ACCESS METHODS.

| METHOD                      | DESCRIPTION                                                          |
|-----------------------------|----------------------------------------------------------------------|
| getSparseMatrixVal          | Get matrix values                                                    |
| getSparseMatrixValImag      | Get the imaginary matrix values                                      |
| getSparseMatrixCol          | Get column indices of matrix values                                  |
| getSparseMatrixRow          | Get row indices of matrix values                                     |
| getVector                   | Get the vector associated with the matrix type                       |
| getVectorImag               | Get the imaginary part of the vector associated with the matrix type |
| getSparseMatrixValBlock     | A blocked version of getSparseMatrixVal                              |
| getSparseMatrixValImagBlock | A blocked version of getSparseMatrixValImag                          |
| getSparseMatrixColBlock     | A blocked version of getSparseMatrixCol                              |
| getSparseMatrixRowBlock     | A blocked version of getSparseMatrixRow                              |
| getVectorBlock              | A blocked version of getVector                                       |
| getVectorImagBlock          | A blocked version of getVectorImag                                   |

## **MATRIX CREATION**

The InputMatrix solver feature allows declaring and defining input matrices using the following methods.

TABLE 6-8: MATRIX CREATION METHODS.

| METHOD                 | DESCRIPTION                                                          |
|------------------------|----------------------------------------------------------------------|
| createSparseMatrix     | Create sparse matrix                                                 |
| addSparseMatrixVal     | Add matrix values to the created matrix                              |
| addSparseMatrixValImag | Add imaginary matrix values to the created matrix                    |
| createVector           | Create vector                                                        |
| setVector              | Set the vector associated with the matrix type                       |
| setVectorImag          | Set the imaginary part of the vector associated with the matrix type |
| setVectorBlock         | A blocked version of setVector                                       |
| setVectorImagBlock     | A blocked version of setVectorImag                                   |

