# *Matrix Creation*

TABLE 6-22: MATRIX DATA CREATION METHODS, REAL PART.

| METHOD                                          | OUTPUT TYPE |
|-------------------------------------------------|-------------|
| createSparseMatrix(String,int,int,int,boolean)  | void        |
| addSparseMatrixVal(String,int[],int[],double[]) | void        |
| createVector(String,int,boolean)                | void        |
| setVector(String,double[])                      | void        |

- **•** model.sol(*<tag>*).feature(*<ftag>*).createSparseMatrixVal(*<mname>,<M>,<N>,<Nnz>,isReal*) creates a sparse matrix *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is one of "K", "D", "E", "N", or "NF"; *<M>* is the number of rows; *<N>* is the number of columns; <*Nnz>* is the number of nonzeros; and *isReal* is true if the matrix is real.
- **•** model.sol(*<tag>*).feature(*<ftag>*).addSparseMatrixVal(*<mname>*,*<row>*,*<col>*,*<val>*) adds the values stored in *<val>* to the sparse matrix *<mname>* stored in the feature *<ftag>*. Here *<mname>* is one of "K", "D", "E", "N", or "NF"; *<row>* lists the rows; *<col>* lists the columns; and *<val>* are the values of the entries.
- **•** model.sol(*<tag>*).feature(*<ftag>*).createVector(*<mname>*,*<M>*,*isReal*) creates a vector *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is one of "L", or "M"; *<M>* is the size of the vector; and *isReal* is true if the vector is real.
- **•** model.sol(*<tag>*).feature(*<ftag>*).setVector(*<mname>,<val>*) sets the real part of the vector *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is "L" or "M" and *<val>* are the values to store in the vector.

TABLE 6-23: MATRIX DATA CREATION METHODS, IMAGINARY PART.

| METHOD                                              | OUTPUT TYPE |
|-----------------------------------------------------|-------------|
| addSparseMatrixValImag(String,int[],int[],double[]) | void        |
| setVectorImag(String,double[])                      | void        |

**•** model.sol(*<tag>*).feature(*<ftag>*).addSparseMatrixValImag(*<mname>*,*<row>*,*<col>*,*<val>*) creates the imaginary part of the sparse matrix values of matrix *<mname>* stored in the feature *<ftag>*. Here, *<mname>*

is one of "K", "D", "E", "N", or "NF"; *<row>* lists the rows; *<col>* lists the columns; and *<val>* are the imaginary values of the entries.

**•** model.sol(*<tag>*).feature(*<ftag>*).setVectorImag(*<mname>*,*<val>*) sets the imaginary part of the vector *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is "L" or "M" and *<val>* are the imaginary values to store in the vector.

TABLE 6-24: MATRIX DATA CREATION METHODS, BLOCKED VERSIONS.

| METHOD                                  | OUTPUT TYPE |
|-----------------------------------------|-------------|
| setVectorBlock(String,double[],int)     | void        |
| setVectorImagBlock(String,double[],int) | void        |

**•** model.sol(*<tag>*).feature(*<ftag>*).setVectorBlock(*<mname>*,*<vals>*,*<startpos>*) sets a subset of the real part of the vector values set by setVector(*<mname>*,*<vals>*), the subvector from the position *<startpos>*. Here, *<mname>* is "L" or "M".

