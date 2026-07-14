# *General Information*

This section contains information about general solution object information methods, listed in the following table and further described below.

TABLE 6-9: GENERAL SOLUTION OBJECT INFORMATION METHODS.

| METHOD                  | OUTPUT TYPE  |
|-------------------------|--------------|
| isAttached()            | Boolean      |
| isRealU()               | Boolean      |
| isRealU(int)            | Boolean      |
| isRealU(int,string)     | Boolean      |
| isRealU(int,string,int) | Boolean      |
| isRealUDot()            | Boolean      |
| isRealUDot(int)         | Boolean      |
| isRealPVals()           | Boolean      |
| getType()               | String       |
| getSize()               | int[2]       |
| getSize(int)            | int[2]       |
| getSizeMulti()          | int[2]       |
| getMesh(string)         | String       |
| getMesh(string,int)     | String       |
| getNU(String)           | int          |
| getPNames()             | String[]     |
| getPVals()              | double[]     |
| getParamNames()         | String[]     |
| getParamVals()          | double[]     |
| getSolutioninfo()       | SolutionInfo |

- **•** model.sol(*<tag>*).isAttached() returns true if the solution solver sequence is attached to a study.
- **•** model.sol(*<tag>*).isRealU() returns true if the solution is real.
- **•** model.sol(*<tag>*).isRealU(*<solnum>*) returns true if solution *<solnum>* is real.

- **•** model.sol(*<tag>*).isRealU(*<solnum>*,*<uType>*) returns true if the solution *<solnum>* of type *<uType>* is real.
- **•** model.sol(*<tag>*).isRealU(*<solnum>*,*<uType>*,*<uNum>*) returns true if the solution *<solnum>* of type *<uType>* and solution index *<uNum>* is real.
- **•** model.sol(*<tag>*).isRealUDot() returns true if the first time derivative is real.
- **•** model.sol(*<tag>*).isRealUDot(*<solnum>*) returns true if first time derivative *<solnum>* is real.
- **•** model.sol(*<tag>*).isRealPVals() returns true if the parameter values are real.
- **•** model.sol(*<tag>*).isRealU() returns true if the solution vector is real.
- **•** model.sol(*<tag>*).getType() returns a string for the solution type which can be any of the strings; Stationary, Parametric, Time, Eigenvalue, and None.
- **•** model.sol(*<tag>*).getSequenceType() returns a string for the solver sequence type, which can be any of the strings SolverSequence, CopySolution, ParametricStore, Stored, Parametric, and None.
- **•** model.sol(*<tag>*).getSize() returns an array of sizes for the solution data. The number of degrees of freedoms is stored in the first position and the number of solutions (solnums) in the second.
- **•** model.sol(*<tag>*).getSize(*<iMulti>*) returns an array of sizes for the solution number *<iMulti>* of the multisolution. A *multisolution* includes multiple solutions from automatic remeshing in single solution object. The number of degrees of freedoms is stored in the first position and the number of solutions (solnums) in the second.
- **•** model.sol(*<tag>*).getSizeMulti() returns an array of sizes for the multisolution. The number of local solution objects is stored in the first position and the total number of solutions (solnums) in the second.
- **•** model.sol(*<tag>*).getMesh(*<geom>*) returns the mesh name associated with the solution and the geometry *<geom>*.
- **•** model.sol(*<tag>*).getMesh(*<geom>,<iMulti>*) returns the mesh name associated with the solution number *<iMulti>* of the multisolution and the geometry *<geom>*.
- **•** model.sol(*<tag>*).getNU(*<uType>*) returns the number of solutions stored of the type *<uType>*. Here *<uType>* is the solution type as a string: Sol (main solution), Reacf (reaction force), Adj (adjoint solution), Fsens (functional sensitivity), and Sens (forward sensitivity).
- **•** model.sol(*<tag>*).getPNames() returns the parameter names from continuation solver as an array of strings.
- **•** model.sol(*<tag>*).getParamNames() returns the parameter names from a parametric sweep as an array of strings.
- **•** model.sol(*<tag>*).getParamVals() returns the parameter values from a parametric sweep as an array of double.

TABLE 6-10: SOLUTION DATA ACCESS METHODS, REAL PART.

| METHOD               | OUTPUT TYPE |
|----------------------|-------------|
| getU(int,string,int) | double[]    |
| getU(int,string)     | double[]    |
| getU(int)            | double[]    |
| getU()               | double[]    |
| getUDot()            | double[]    |
| getUDot(int)         | double[]    |
| getPVals()           | double[]    |
| getPVals(int)        | double[]    |

- **•** model.sol(*<tag>*).getU(*<solnum>*,*<uType>*,*<uNum>*) returns the real part of the solution vector for solution number *<solnum>*, the solution type *<uType>*, and the 1-based solution index *<uNum>*. Here, 1 <= *<uNum>* <= N, where N = model.sol(*<tag>*).getNU(*<uType>*).
- **•** model.sol(*<tag>*).getU(*<solnum>*,*<uType>*) returns the real part of the solution vector for the solution number *<solnum>* and the solution data type *<uType>*. The solution index *<uNum>*=1.
- **•** model.sol(*<tag>*).getU(*<solnum>*) returns the real part of the solution vector for solution number *<solnum>*. The solution data type *<uType>* =Sol and the solution index *<uNum>*=1.
- **•** model.sol(*<tag>*).getU() returns the real part of the solution vector. For a Time-dependent and Parametric type, the last solution number is used, and for an Eigenvalue type the first solution number. The solution data type *<uType>* =Sol and the solution index *<uNum>*=1.
- **•** model.sol(*<tag>*).getUDot() returns the real part of the first time-derivative solution vector for a Time-dependent type and if the time derivatives have been stored. The last solution number is used. For other types and if the time derivatives have not been stored, an error message is given.
- **•** model.sol(*<tag>*).getUDot(*<solnum>*) returns the real part of the first time-derivative solution vector for the solution number *<solnum>*.
- **•** model.sol(*<tag>*).getPVals() returns for a solution of a Parametric type the real part of all the parameter values stored. For multiple parameters all parameter tuples are concatenated. For a solution of a Time-dependent type, this is the time for which solution data is stored. For a solution of an Eigenvalue type, this is the real part of the eigenvalues stored. For a Time-dependent and Parametric type, the last solution number is used, and for an Eigenvalue type the first solution number.
- **•** model.sol(*<tag>*).getPVals(*<solnum>*) returns for a solution of a Parametric type the real part of the parameter tuples stored for solution number *<solnum>*. For a solution of a Time-dependent type, this is the time for solution number *<solnum>*. For a solution of an Eigenvalue type, this is the real part of the eigenvalue stored at solution number *<solnum>*.

TABLE 6-11: SOLUTION DATA ACCESS METHODS, IMAGINARY PART.

| METHOD                   | OUTPUT TYPE |
|--------------------------|-------------|
| getUImag()               | double[]    |
| getUImag(int)            | double[]    |
| getUImag(int,string)     | double[]    |
| getUImag(int,string,int) | double[]    |
| getUDotImag()            | double[]    |
| getUDotImag(int)         | double[]    |

TABLE 6-11: SOLUTION DATA ACCESS METHODS, IMAGINARY PART.

| METHOD            | OUTPUT TYPE |
|-------------------|-------------|
| getPValsImag()    | double[]    |
| getPValsImag(int) | double[]    |

**•** model.sol(*<tag>*).getUImag() returns the imaginary part of the solution vector. The same *<solnum>*, *<uType>*, and *<uNum>* is used as for the method getU(). And similarly for the other Imag methods.

TABLE 6-12: SOLUTION DATA ACCESS METHODS, BLOCKED VERSIONS.

| METHOD                                | OUTPUT TYPE |
|---------------------------------------|-------------|
| getUBlock(int,int)                    | double[]    |
| getUBlock(int,int,int)                | double[]    |
| getUBlock(int,string,int,int)         | double[]    |
| getUBlock(int,string,int,int,int)     | double[]    |
| getUDotBlock(int,int)                 | double[]    |
| getUDotBlock(int,int,int)             | double[]    |
| getUImagBlock(int,int)                | double[]    |
| getUImagBlock(int,int,int)            | double[]    |
| getUImagBlock(int,string,int,int)     | double[]    |
| getUImagBlock(int,string,int,int,int) | double[]    |
| getUDotImagBlock(int,int)             | double[]    |
| getUDotImagBlock(int,int,int)         | double[]    |

**•** model.sol(*<tag>*).getUBlock(*<startpos>*,*<endpos>*) returns a subset of the vector returned by getU(), the subarray from position *<startpos>* to the position *<endpos>*. And similarly for the other Block methods.

