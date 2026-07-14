# *Matrix Data*

TABLE 6-19: MATRIX DATA ACCESS METHODS, REAL PART.

| METHOD                     | OUTPUT TYPE |
|----------------------------|-------------|
| getSparseMatrixVal(String) | double[]    |
| getSparseMatrixCol(String) | int[]       |
| getSparseMatrixRow(String) | int[]       |
| getVector(String)          | double[]    |

See Ref. 6-18 above for a list of available matrix and vector names.

- **•** model.sol(*<tag>*).feature(*<ftag>*).getSparseMatrixVal(*<mname>*) returns the real part of the sparse matrix values of matrix *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is one of "K", "D", "E", "N", "NF", "NP", "Kc", "Dc", "Ec", "Null", "Nullf", "Mc", "MA", "MB", or "C".
- **•** model.sol(*<tag>*).feature(*<ftag>*).getSparseMatrixCol(*<mname>*) returns the column numbers of the sparse matrix values of matrix <mname> stored in the feature *<ftag>*. Here, *<mname>* is one of "K", "D", "E", "N", "NF", "NP", "Kc", "Dc", "Ec", "Null", "Nullf", "Mc", "MA", "MB", or "C".
- **•** model.sol(*<tag>*).feature(*<ftag>*).getSparseMatrixRow(*<mname>*) returns the row numbers of the sparse matrix values of matrix *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is one of "K", "D", "E", "N", "NF", "NP", "Kc", "Dc", "Ec", "Null", "Nullf", "Mc", "MA", "MB", or "C".
- **•** model.sol(*<tag>*).feature(*<ftag>*).getVector(*<mname>*) returns the real part of the vector *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is one of "L", "M", "MP", "MLB", "MUB", "ud", "uscale", or "x0".

TABLE 6-20: MATRIX DATA ACCESS METHODS, IMAGINARY PART.

| METHOD                         | OUTPUT TYPE |
|--------------------------------|-------------|
| getSparseMatrixValImag(String) | double[]    |
| getVectorImag(String)          | double[]    |

**•** model.sol(*<tag>*).feature(*<ftag>*).getSparseMatrixValImag(*<mname>*) returns the imaginary part of the sparse matrix values of matrix *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is one of "K", "D", "E", "N", "NF", "NP", "Kc", "Dc", "Ec", "Null", "Nullf", "Mc", "MA", "MB", "C".

**•** model.sol(*<tag>*).feature(*<ftag>*).getVectorImag(*<mname>*) returns the imaginary part of the vector *<mname>* stored in the feature *<ftag>*. Here, *<mname>* is one of "L", "M", "MP", "MLB", "MUB", "ud", "uscale", or "x0".

TABLE 6-21: MATRIX DATA ACCESS METHODS, BLOCKED VERSIONS.

| METHOD                                      | OUTPUT TYPE |
|---------------------------------------------|-------------|
| getSparseMatrixValBlock(String,int,int)     | double[]    |
| getSparseMatrixColBlock(String,int,int)     | int[]       |
| getSparseMatrixRowBlock(String,int,int)     | int[]       |
| getVectorBlock(String,int,int)              | double[]    |
| getSparseMatrixValImagBlock(String,int,int) | double[]    |
| getVectorImagBlock(String,int,int)          | double[]    |

- **•** model.sol(*<tag>*).feature(*<ftag>*).getSparseMatrixValBlock(*<mname>*,*<startpos>*,*<endpos>*) returns a subset of the real part of the sparse matrix values returned by getSparseMatrixVal(*<mname>*), the subarray from the position *<startpos>* to the position *<endpos>*. And similarly for the other Block methods.
- **•** model.sol(*<tag>*).feature(*<ftag>*).getVectorBlock(*<mname>*,*<vals>*) returns a subset of the real part of the vector values returned by getVector(*<mname>*), the subvector from the position *<startpos>* to the position *<endpos>*. Here, *<mname>* is "L" or "M".

