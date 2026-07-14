# About Solver Commands

The following sections describe the solver commands:

**•** Features Producing and Manipulating Solutions

**•** Features with Solver Settings

- **•** Solution Object Information Methods
- **•** Solution Feature Information Methods
- **•** Studies and Solvers in the *COMSOL Multiphysics Reference Manual*

# *Features Producing and Manipulating Solutions*

Table 6-1 is an overview of the available features for producing and handling solution objects.

TABLE 6-1: SOLUTION OBJECT FEATURES.

| FEATURE                       | PURPOSE                                                                                         |
|-------------------------------|-------------------------------------------------------------------------------------------------|
| Assemble                      | Assembles and stores the matrices generated during assembly                                     |
| AWE                           | Solve parametric problem with asymptotic waveform evaluation                                    |
| CombineSolution               | Combine solutions by concatenation or summation                                                 |
| CopySolution                  | Copy solution                                                                                   |
| Eigenvalue                    | Solve eigenvalue problem                                                                        |
| EigenvalueAttrib              | Eigenvalue solver attribute to Sensitivity and Optimization solvers                             |
| EigenvalueParam               | Solve parametric eigenvalue problem                                                             |
| FFT                           | Perform a forward or inverse fast Fourier transform (FFT or IFFT)                               |
| InputMatrix                   | Input matrices or vectors (for example, load vectors or stiffness matrices) to a<br>solver      |
| Modal                         | Solve time-dependent or parametric problem with modal analysis                                  |
| ModalReduction                | Solve time-dependent or parametric problem with modal reduction                                 |
| Optimization                  | Solve optimization problem                                                                      |
| PlugFlow                      | Solve stationary plug flow problem                                                              |
| ProperOrthogonalDecomposition | Solve time-dependent or frequency-domain problem with POD reduction                             |
| StateSpace                    | Assembles and stores matrices that describe a model as a dynamic system                         |
| Stationary                    | Solve stationary problem                                                                        |
| StudyStep                     | Specifies which problem to compile                                                              |
| Time                          | Solve time-dependent problem with implicit or explicit time stepping                            |
| TimeDiscrete                  | Solve time-dependent problem with user's own time stepping                                      |
| TimeExplicit                  | Solve time-dependent problem with explicit time stepping                                        |
| Variables                     | Handle variables solved for (initial values, scaling) and not solved for (prescribed<br>values) |

Table 6-2 is an overview of the available features for solver settings.

TABLE 6-2: SOLVER SETTING FEATURES.

| FEATURE                       | SETTINGS HANDLED                                                  |  |
|-------------------------------|-------------------------------------------------------------------|--|
| Adaption                      | Adaptation subfeature (created by the study step)                 |  |
| Advanced                      | Advanced general settings                                         |  |
| AutoRemesh                    | Automatically remesh deformed geometries                          |  |
| ControlField                  | Control fields (a set of control variables)                       |  |
| ControlState                  | Set of global control variables                                   |  |
| Field                         | Fields (a set of dependent variables)                             |  |
| FullyCoupled                  | Fully coupled nonlinear solution approach                         |  |
| HardwareAcceleration          | Hardware acceleration using GPU for dG-based transient acoustics. |  |
| LowerLimit                    | Lower limits.                                                     |  |
| LumpedStep                    | Lumped steps.                                                     |  |
| Parametric                    | Parameter stepping                                                |  |
| Previous Solution             | Previous solution solvers                                         |  |
| Segregated                    | Segregated nonlinear solution approach                            |  |
| SegregatedStep                | Segregated steps                                                  |  |
| Sensitivity                   | Sensitivity analysis                                              |  |
| StatAcceleration              | Stationary acceleration                                           |  |
| StopCondition                 | Stop conditions                                                   |  |
| TimeAdaption                  | Time-dependent adaptive mesh refinement                           |  |
| UpperLimit                    | Upper limits.                                                     |  |
| See Linear for the following: |                                                                   |  |
| Direct                        | Direct linear system solvers                                      |  |
| DirectPreconditioner          | Direct linear system solvers as preconditioners                   |  |
| DomainDecomposition           | Domain decomposition solver (Schwarz)                             |  |
| DomainDecompositionSchur      | Domain decomposition solver (Schur)                               |  |
| HierarchicalLU                | Hierarchical LU linear system preconditioner (for BEM)            |  |
| IncompleteLU                  | Incomplete factorization preconditioners                          |  |
| Iterative                     | Iterative linear system solvers                                   |  |
| Jacobi                        | Jacobi linear system preconditioners                              |  |
| KrylovPreconditioner          | Krylov linear system preconditioners                              |  |
| SchurKrylovPreconditioner     | Krylov linear system preconditioners for a Schur solver           |  |
| Multigrid                     | Multigrid linear system preconditioners                           |  |
| SCGS                          | SCGS linear system preconditioners                                |  |
| SOR                           | SOR linear system preconditioners                                 |  |
| SORGauge                      | SOR Gauge linear system preconditioners                           |  |
| SORLine                       | SOR Line linear system preconditioners                            |  |
| SORVector                     | SOR Vector linear system preconditioners                          |  |
| SchurLocal                    | Localized Schur solver                                            |  |
| SchurSpLocal                  | Sparse localized Schur solver                                     |  |

TABLE 6-2: SOLVER SETTING FEATURES.

| FEATURE | SETTINGS HANDLED                    |
|---------|-------------------------------------|
| State   | Sets of global dependent variables  |
| Vanka   | Vanka linear system preconditioners |

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

# Solution Object Data

The solver sequence works as a solution object itself. The solution object data produced by running the sequence (partially or in whole) can be obtained by a number of access methods on the sequence. See Table 6-3 and Table 6-4 for an overview.

In this section:

- **•** General Information
- **•** Solution Data
- **•** SolutionInfo Object and Its Methods
- **•** Solution Creation

- **•** General Matrix Information
- **•** Matrix Data
- **•** Matrix Creation

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

# *SolutionInfo Object and Its Methods*

For each solver sequence, there is an associated SolutionInfo object, which can be accessed by the function getSolutioninfo(). This object has several methods to access the solution data generated by a parametric sweep. Such parametric sweep generated solution data is normally stored in solver sequences of type Parametric or of type SolverSequence, depending on whether so-called outer parametric sweeps have been used or not. It can also be used to convert between so-called loop-level settings and solution numbers. The following methods in Table 6-13 are supported.

TABLE 6-13: SOLUTIONINFO METHODS.

| METHOD                   | OUTPUT TYPE |
|--------------------------|-------------|
| getIndices(int, int[])   | int[]       |
| getISol(int, double)     | int         |
| getISol(int, int)        | int[]       |
| getLevelDescription(int) | String      |
| getLevelNames()          | String[]    |
| getLevels()              | int         |
| getMaxInner(int[])       | int         |
| getMaxLevels()           | int         |
| getName(int)             | String      |
| getOuterSolnum()         | int[]       |
| getPNamesOuter()         | String[]    |

TABLE 6-13: SOLUTIONINFO METHODS.

| METHOD                                           | OUTPUT TYPE |
|--------------------------------------------------|-------------|
| getPUnitsOuter()                                 | String[]    |
| getSol(int)                                      | String      |
| getSolDescriptions(int, int[], boolean, boolean) | String[]    |
| getSolnum(int, boolean)                          | int[]       |
| getSplitLevelDescriptions()                      | String[]    |
| getSplitLevelNames()                             | String[]    |
| getSplitLevelUnits()                             | String[]    |
| getSplitName(int)                                | String[]    |
| getSplitUnit(int)                                | String[]    |
| getUnit(String)                                  | String      |
| getVals(int, int[])                              | double[][]  |
| getValsImag(int, int[])                          | double[][]  |
| isStructured()                                   | Boolean     |
| isValid()                                        | Boolean     |
| mapToLevel(int[], int[], boolean)                | int[][]     |
| mapToSolnum(int[][], boolean)                    | int[][]     |

info = model.sol(<tag>).getSolutioninfo()

**•** getIndices(int level, int[] levels) Returns the one-based indices available for the loop level, level (index-zero based). If the format is structured, levels can be set to null as it does not affect the result. If the format is unstructured, and defining X = levels[*i*], then the level *i* is set to its X-th value or tuple. The returned values are 1,…, *N*, where *N* is the number of values or tuples for the given level. When level=getMaxLevel()-1, the indices can be the result of an outer product between levels. When the format is unstructured, and when levels is set, then the unstructured list of indices is returned. When the format is unstructured, and when levels=null or levels.length=0, an error is given if level is such that there are no structured data to return (currently level=0 and multiple inner parameter names).

An example: A parameter p taking the values 1 and 2, for which a time-dependent simulation is done. All time steps from the solver are saved. Assume that p is affecting the time stepping. Using the Time Parametric solver (or a Parametric Sweep for a time-dependent study) will result in a SolutionInfo object with two levels, one for the time t (level 0) and one for p (level 1). To access the indices for the solutions on level 0, use the method getIndices:

```
SolverSequence sol = model.sol("sol1");
SolutionInfo info = sol.getSolutioninfo();
int [] indx_1 = info.getIndices(0, int [] {1,1});
int [] indx_2 = info.getIndices(0, int [] {1,2});
```

- **•** getISol(int outersolnum, int innersolnum) returns the index zero-based multisolution object number and the index zero based solution number within it, for the index one based outer and inner solution numbers. The solution object number is returned in the first position and the corresponding solution number in the second. The solution object number is normally the same (0) for all innersolnum, but can vary for time-dependent adaptation or for automatic remeshing.
- **•** getISol(int outersolnum, double t) returns the index-zero based multisolution object number for the one-based outer solution number outersolnum and time value t. The returned solution number is normally the same (0) for all t but can vary for time-dependent adaptation or for automatic remeshing.
- **•** getLevelDescription(int level) returns a description of the index zero-based loop level, level.

- **•** getLevelNames() returns the names of the different loop levels. Some of these can be a concatenated string such as "p1,p2".
- **•** getLevels() returns the number of loop levels, getLevels()<=getMaxLevels().
- **•** getMaxInner(int[] outersolnum) returns the maximum number of inner solutions for the given index one based outer solution numbers. If outersolnum is null, the maximum is taken over all outer solutions.
- **•** getMaxLevels() returns the maximum number of used loop levels, getLevels()<=getMaxLevels().
- **•** getName(int level) returns the parameter name for the index zero based looplevel level. This name can be a concatenated string such as "p1, p2".
- **•** getOuterSolnum() returns the one based indices for the outer solutions. If there are no outer parameters or added corresponding parameter values the array is empty.
- **•** getPNamesOuter() returns the subset of parameter names that are looped by a job sequence parametric sweep.
- **•** getSol(int outersolnum) returns the solver sequence tag for the index one based outer solution number outersolnum. If the solution number is invalid, null is returned.
- **•** getSolDescriptions(int level, int[] levels, boolean paramInclusion, boolean indexInclusion) returns the descriptions for the solutions for the index-zero based loop level, level. The current level setting can be given in levels (index one based). One string for each solution is returned. When paramInclusion is true, the description always includes the parameter name, even if this level contains only one. When paramInclusion is false, the parameter name is only included when there is more than one parameter name on this level. When the format is unstructured, and when levels is set, then the unstructured list of descriptions is returned. When the format is unstructured, and when levels==null or levels.length==0, an error is given if level is such that there are no structured data to return.
- **•** getSolnum(int outersolnum, boolean strict) returns the one based inner solution numbers for the index one based outer solution number outersolnum. If strict is true the inner solution numbers is returned if outersolnum is a valid outer solution number and else a zero array is returned. If strict is false and if the outersolnum does not match, then the solution numbers for the containing solution object is returned.
- **•** getSplitLevelDescriptions() returns the description of the different parameters, split into an array for the case when there is more than one parameter for a loop level.
- **•** getSplitLevelNames() returns the names of the different parameters, split into an array for the case when there is more than one parameter for a loop level.
- **•** getSplitLevelUnits() returns the units for the parameters. It returns a vector of the same length and order as getSplitLevelDescriptions, with null as the contents when units are not used or defined.
- **•** getSplitNames(int level) returns the parameter names for the index-zero based loop level level.
- **•** getUnit(String name) returns the unit of the sweep parameter name.
- **•** getVals(int level, int[] levels) returns the parameter values for the index-zero based loop level, level. The current level setting can be given in levels (index-one based). For level < getMaxLevels()-1 this is just the values of the parameters for this level. The number of rows is the same as the number of parameters for this level. The columns are the values. For level = getMaxLevels()-1 the values are expanded into tuples for the case that levels have been merged. When the format is unstructured, and when levels is set, then the unstructured lists of values are returned. When the format is unstructured, and when levels==null or levels.length=0, an error is given if level is such that there are no structured data to return.
- **•** getValsImag(int level, int[] levels) returns the imaginary parts of the parameter values for the index-zero based loop level, level. The current level setting can be given in levels (index-one based). For level < getMaxLevels()-1 this is just the values of the parameters for this level. The number of rows is the same as the number of parameters for this level. The columns are the values. For level = getMaxLevels()-1 the values are expanded into tuples for the case that levels have been merged. When the format is unstructured, and when levels is set, then the unstructured lists of values are returned. When the format is unstructured, and

when levels==null or levels.length=0, an error is given if level is such that there are no structured data to return.

- **•** isStructured() returns true unless the underlying solution object/objects has a parameter variation that depends on the solution process itself. Examples are time-dependent simulations where the output is determined by the steps taken by the solver or eigenvalue simulations.
- **•** isValid() returns true if the underlying solution data is consistent with this info object.
- **•** mapToLevel(int[] outersolnum, int[] innersolnum, boolean compressedOutput) returns the index one based level representation of the index-one based outer and inner solution numbers, outersolnum and innersolnum respectively. The number of rows of the returned data is equal to the number of levels. When compressedOutput is false, the columns represent the tuples, which is the most general format. When compressedOutput is true, the level settings are made unique on each level.

![](_page_11_Picture_4.jpeg)

When compressedOutput is true and if the compressed representation does not match the input, an array with the right number of rows, but each with zero length, are returned.

**•** mapToSolnum(int[][] levelSetting, boolean expandInput) returns the one based solution number representation of a loop level setting levelSetting. The first row in the output is the inner and the second the outer solution numbers. The levelSettings must have the same number of rows as there are levels. On each row, index one based settings for each level should be given. If expandInput is false the number of columns must be the same and the columns are treated as level-tuples. If expandInput is true, the number of columns can be different and the output is expanded to the outer product of each levels setting.

# *Solution Creation*

TABLE 6-14: SOLUTION CREATION METHODS, REAL PART.

| METHOD                 | OUTPUT TYPE |
|------------------------|-------------|
| setU(double[])         |             |
| setU(int,double[])     |             |
| setPNames(String[])    |             |
| setPVals(double[])     |             |
| setPVals(int,double[]) |             |
| createSolution()       |             |

- **•** model.sol(*<tag>*).setU(*<vals>*) sets the real part of the solution vector to *<vals>*.
- **•** model.sol(*<tag>*).setU(*<solnum>*,*<vals>*) sets the real part of solution vector *<solnum>*, to *<vals>*.
- **•** model.sol(*<tag>*).setPNames(*<pnames>*) sets parameter names of the solution vectors to *<pnames>*.
- **•** model.sol(*<tag>*).setPVals(*<vals>*) sets the parameter values to *<vals>*.
- **•** model.sol(*<tag>*).setPVals(*<solnum>*,*<vals>*) sets the parameter values *<solnum>* to *<vals>*.
- **•** model.sol(*<tag>*).createSolution() creates solutions based on the input from the vectors previously set. The solution is created at this stage. Afterward the user input is cleared. If a created solution is used before this function is run the result is unpredictable.

TABLE 6-15: SOLUTION CREATION METHODS, IMAGINARY PART.

| METHOD                 | OUTPUT TYPE |
|------------------------|-------------|
| setUImag(double[])     |             |
| setUImag(int,double[]) |             |

TABLE 6-15: SOLUTION CREATION METHODS, IMAGINARY PART.

| METHOD                     | OUTPUT TYPE |
|----------------------------|-------------|
| setPValsImag(double[])     |             |
| setPValsImag(int,double[]) |             |

**•** model.sol(*<tag>*).setUImag(*<solnum>*,*<vals>*) sets the imaginary part of solution vector *<solnum>* to *<vals>* (and similarly for the other Imag methods).

TABLE 6-16: SOLUTION CREATION METHODS, REAL PART.

| METHOD                          | OUTPUT TYPE |
|---------------------------------|-------------|
| setUBlock(double[],int)         |             |
| setUBlock(int,double[],int)     |             |
| setUBImaglock(double[],int)     |             |
| setUImagBlock(int,double[],int) |             |
| setUDotBlock(double[],int)      |             |
| setUDotBlock(int,double[],int)  |             |
| setUImagBlock(double[],int)     |             |
| setUImagBlock(int,double[],int) |             |

**•** model.sol(*<tag>*).setUBlock(*<solnum>*,*<vals>,<start>*) sets the real part of solution vector *<solnum>*, the subarray from position *<start>* to position *<start>*+*<vals>.length*-1 to *<vals>* (and similarly for the other Imag methods).

# *General Matrix Information*

TABLE 6-17: GENERAL MATRIX OBJECT INFORMATION METHODS.

| METHOD         | OUTPUT TYPE |
|----------------|-------------|
| isReal(String) | Boolean     |
| getM(String)   | int         |
| getN(String)   | int         |
| getNnz(String) | int         |

- **•** model.sol(*<tag>*).feature(*<ftag>*).isReal(*<mname>*) returns true if the matrix *<mname>* is real.
- **•** model.sol(*<tag>*).feature(*<ftag>*).getM(*<mname>*) returns number of rows in the matrix *<mname>*.
- **•** model.sol(*<tag>*).feature(*<ftag>*).getN(*<mname>*) returns number of columns in the matrix *<mname>*.
- **•** model.sol(*<tag>*).feature(*<ftag>*).getNnz(*<mname>*) returns number of nonzero entries in the matrix *<mname>*.

The following table lists available matrices and vectors (availability depends on the solvers used in the simulation):

TABLE 6-18: AVAILABLE MATRIX AND VECTOR NAMES.

| PROPERTY | DESCRIPTION               |
|----------|---------------------------|
| K        | Stiffness matrix          |
| L        | Load vector               |
| M        | Constraint vector         |
| N        | Constraint Jacobian       |
| D        | Damping matrix            |
| E        | Mass matrix               |
| NF       | Constraint force Jacobian |

TABLE 6-18: AVAILABLE MATRIX AND VECTOR NAMES.

| PROPERTY | DESCRIPTION                       |
|----------|-----------------------------------|
| NP       | Optimization constraint Jacobian  |
| MP       | Optimization constraint vector    |
| MLB      | Lower bound constraint vector     |
| MUB      | Upper bound constraint vector     |
| Kc       | Eliminated stiffness matrix       |
| Lc       | Eliminated load vector            |
| Dc       | Eliminated damping matrix         |
| Ec       | Eliminated mass matrix            |
| Null     | Constraint null-space basis       |
| Nullf    | Constraint force null-space basis |
| ud       | Particular solution ud            |
| uscale   | Scale vector                      |

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

# *The clist and cname Properties*

The cname property is a string array where you provide names of constants as input parameters. The clist property is a string array where you provide values for constants as input parameters. The clist array must have the same length as the cname array. These constants overrule any previous definition (for example, from Global Definitions). Each string is evaluated as a list of values. This means, for example, that the range() operator, units, and global expressions are supported. The first entry in each of these lists will be used to temporarily set the corresponding parameter as given by cname. This parameter can be a new or an existing global parameter. The constant is temporary in the sense that it is only defined during the solver run. It cannot be evaluated during postprocessing; in fact, it will be unknown if it is not an existing global parameter, and it will use its default value if it is. This is similar to other solver parameters, like t and timestep, behave.

For example, a "bootstrapped" definition like

```
"cname" = {"foo", "bar"}
"clist" = {"5", "foo+2"}
```

also works, but in the COMSOL Desktop you will get an error about "foo" for not being recognized in the evaluation context. And if you use a circular dependency like

```
"cname" = {"foo", "bar"}
"clist" ={"bar", "foo+2"}
```

you will get warnings about this if the parameters are used, and the evaluation will be NaN (not-a-number).

If "a" and "b" are already defined as global parameters and, say, b=a+1; then redefining "a" to a new value through cname and clist leads to the value for "b" being redefined (correctly).

You cannot override parameters used in the following parts of the model:

- **•** Mesh and geometry
- **•** Selections
- **•** Probes
- **•** Functions
- **•** Materials
- **•** Pairs
- **•** Solver sequences
- **•** Parameter-dependent lists

Also, the Parametric and Time Dependent solvers overrule any definition of solver constants.

Constants settings for a solver node do not carry over to postprocessing.

Some examples of when it can be useful to define constants for a solver:

- **•** When doing more advanced solver sequences, where constants need to be changed between calls (for example, in for-loops).
- **•** When you do not want to change the global definition of a parameter or when you cannot or do not want to use a Parametric Solver feature.

When you want to define auxiliary parameters that are part of the equations like CFLCMP or niterCMP and where the solver does not define these parameters.

# *Adaption*

Adaptive mesh refinement.

## **DESCRIPTION**

The Adaption feature can be created from study steps of Eigenvalue or Stationary types See Stationary for the properties that control mesh adaptation and error estimates. See also TimeAdaption for the feature for time-dependent adaptation.

# *Advanced*

Handle advanced general solver properties.

## **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"Advanced")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
```

## **DESCRIPTION**

Feature for a number of advanced solver settings and assembly settings.

TABLE 6-25: VALID GENERAL PROPERTY/VALUE PAIRS FOR ADVANCED.

| PROPERTY           | VALUES                  | DEFAULT | DESCRIPTION                                                                                            |
|--------------------|-------------------------|---------|--------------------------------------------------------------------------------------------------------|
| assemdistrsol      | auto   true   false     | auto    | Use distributed solution for<br>assembly.                                                              |
| assemloc           | true   false            | true    | Optimize data locality on clusters.                                                                    |
| assemtol           | 0 or a positive double  | 1e-12   | Drop tolerance for                                                                                     |
| autorescale        | on   off                | on      | Automatic rescaling of linear<br>equations (for the Stationary<br>solver).                             |
| blocksize          | positive integer   auto | auto    | Assembly block size.                                                                                   |
| cachepattern       | true   false            | false   | Reuse sparsity pattern during<br>assembly.                                                             |
| cachepatternmethod | auto   expr             | auto    | User an expression or automatic<br>setting with distributed solution for<br>assembly.                  |
| cachepatternexpr   | String                  |         | The expression for a distributed<br>solution for assembly, if<br>cachepatternmethod is set to<br>auto. |

TABLE 6-25: VALID GENERAL PROPERTY/VALUE PAIRS FOR ADVANCED.

| PROPERTY            | VALUES                                                               | DEFAULT         | DESCRIPTION                                                                                                                                                  |
|---------------------|----------------------------------------------------------------------|-----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| checkmatherr        | on   off                                                             | off             | Check for undefined numerical<br>values after each operation.                                                                                                |
| complexfun          | on   off                                                             | off             | Use complex-valued functions with<br>real input.                                                                                                             |
| convinfo            | on   detailed   off                                                  | on              | Print info to log.                                                                                                                                           |
| D, E, K, L, M, N    | on   off                                                             |                 | Manual control of reassembly.                                                                                                                                |
| elemdatainit        | boolean                                                              | true            | Optimize element data initialization<br>for contact problems and<br>reduced-order modeling.                                                                  |
| keep                | on   off                                                             |                 | Manual control of reassembly.                                                                                                                                |
| logsampling         | double, zero or positive                                             | 0.005           | Minimum time (in seconds) for log<br>sampling of time-dependent solvers.                                                                                     |
| matherr             | on   off                                                             | on              | Error for undefined operations.                                                                                                                              |
| matrixformat        | auto   sparse   filled  <br>matrixfree                               | auto            | Matrix format.                                                                                                                                               |
| optthread           | boolean                                                              | false           | Optimize thread scheduling.                                                                                                                                  |
| orthonormallimit    | double                                                               | 1e7             | Limit, as an estimate of the<br>complexity (number of operations),<br>for using the orthonormal method<br>in the automatic or hybrid<br>null-space function. |
| nullfun             | flnullorth   flspnull  <br>auto explicitorth <br>explicitsp flhybrid | auto            | Null-space function.                                                                                                                                         |
| recoverysaveevery   | nonnegative double                                                   | 1800            | The interval for which to save<br>recovery files (in seconds), if<br>recoverysaveforce is set to<br>manual.                                                  |
| recoverysaveforce   | frompreferences  <br>manual                                          | frompreferences | Force recovery file saving at an<br>interval: take from the preferences<br>or specify manually.                                                              |
| recoverysavinginfo  | frompreferences  <br>oneveryiteration  <br>ratio                     | frompreferences | Recovery saving frequency: from<br>preferences, on every iteration, or<br>using a saving ratio.                                                              |
| recoverysavingratio | double (0–1)                                                         | 0.1             | The recovery file saving ratio, if<br>recoverysavinginfo is set to<br>ratio.                                                                                 |
| rowscale            | on   off                                                             | on              | Equilibrate rows.                                                                                                                                            |
| statblockdistr      | boolean                                                              | false           | Use static distribution of assembly<br>blocks.                                                                                                               |
| storeresidual       | off   solving  <br>solvingandoutput                                  | off             | Store the latest residual while<br>solving or while solving and in the<br>output.                                                                            |
| symmetric           | auto   on   off  <br>hermitian                                       | auto            | Symmetric matrices.                                                                                                                                          |

The Advanced section in the *COMSOL Multiphysics Reference Manual*, describes the functionality corresponding to the properties blocksize, complexfun, nullfun, orthonormallimit, and rowscale.

You can use the property symmetric to tell the solver that the model is symmetric or Hermitian, or you can use the automatic feature to find out (see Advanced in the *COMSOL Multiphysics Reference Manual*).

You can set convinfo=detailed to print more detailed information about the solver process in the log window. For example information about individual linear iterations or the scales per field computed by the automatic scaling algorithm. When convinfo=off, only minimal information about the solution process is printed.

By default, COMSOL Multiphysics gives an error message if the solver encounters an undefined mathematical operation when solving the model, for instance, 0/0 or log(0). If you instead want the solver to proceed, put the property matherr=off. Then 0/0=NaN (not a number) and log(0)=-Inf.

The properties keep and D, E, K, L, M, and N allow manual control of reassembly. If keep=on, each of the other properties controls reassembly of a specific matrix or vector. Setting the property value to on, means that the quantity is constant, and therefore can be assembled once and then kept. The letters have the following meaning: E=constant mass, D=constant damping, K=constant Jacobian, L=constant load, M=constant constraint, N=constant constraint Jacobian.

The autorescale property control if the automatically computed scales should be recomputed. This property only affects stationary nonlinear problems and fields that are using the automatic scaling method and for the constant damping technique. The initially computed scales are based on the initial assembled matrix. When autorescale=on the scales are recomputed in each nonlinear iteration based on the current solution.

You can use the property matrixformat to tell the solver which matrix format to store the system matrices in:

- **•** sparse stores the matrix in a sparsely populated matrix format.
- **•** filled stores the matrix in a densely populated format.
- **•** matrixfree does not store matrices. The effects of matrix operations are assembled when needed.

When you specify auto (the default), the format is automatically determined based on the solver used.

By default, COMSOL does not check for undefined numerical values (for example, from numerical overflow) after each numerical operation. Set the property checkmatherr to on to make COMSOL check for such undefined numerical values, which will give more accurate error messages if such undefined numerical values occur.

# *Assemble*

Assemble and store the matrices generated during assembly.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Assemble")
model.sol(sname).feature(fname).set(pname,value)
model.sol(sname).feature(fname).getSparseMatrixVal(mname)
model.sol(sname).feature(fname).getSparseMatrixValImag(mname)
model.sol(sname).feature(fname).getSparseMatrixRow(mname)
model.sol(sname).feature(fname).getSparseMatrixCol(mname)
model.sol(sname).feature(fname).getVector(vname)
model.sol(sname).feature(fname).getVectorImag(vname)
model.sol(sname).feature(fname).getSparseMatrixValBlock(mname,start,stop)
model.sol(sname).feature(fname).getSparseMatrixValImagBlock(mname,start,stop)
model.sol(sname).feature(fname).getSparseMatrixRowBlock(mname,start,stop)
model.sol(sname).feature(fname).getSparseMatrixColBlock(mname,start,stop)
model.sol(sname).feature(fname).getVectorBlock(vname,start,stop)
model.sol(sname).feature(fname).getVectorImagBlock(vname,start,stop)
model.sol(sname).feature(fname).isReal(mname)
model.sol(sname).feature(fname).getM(mname)
model.sol(sname).feature(fname).getN(mname)
```

## **DESCRIPTION**

Assemble feature.

TABLE 6-26: VALID GENERAL PROPERTY/VALUE PAIRS.

| PROPERTY | VALUES       | DEFAULT | DESCRIPTION                                                                                                                                                       |
|----------|--------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| K        | on   off     | off     | Assemble the stiffness matrix                                                                                                                                     |
| L        | on   off     | off     | Assemble the load vector                                                                                                                                          |
| M        | on   off     | off     | Assemble the constraint vector                                                                                                                                    |
| N        | on   off     | off     | Assemble the constraint Jacobian                                                                                                                                  |
| D        | on   off     | off     | Assemble the damping matrix                                                                                                                                       |
| E        | on   off     | off     | Assemble the mass matrix                                                                                                                                          |
| NF       | on   off     | off     | Assemble the constraint force Jacobian                                                                                                                            |
| NP       | on   off     | off     | Assemble the optimization constraint Jacobian                                                                                                                     |
| MP       | on   off     | off     | Assemble the optimization constraint vector                                                                                                                       |
| MLB      | on   off     | off     | Assemble the lower bound constraint vector                                                                                                                        |
| MUB      | on   off     | off     | Assemble the upper bound constraint vector                                                                                                                        |
| Kc       | on   off     | off     | Assemble the eliminated stiffness matrix                                                                                                                          |
| Lc       | on   off     | off     | Assemble the eliminated load vector                                                                                                                               |
| Dc       | on   off     | off     | Assemble the eliminated damping matrix                                                                                                                            |
| Ec       | on   off     | off     | Assemble the eliminated mass matrix                                                                                                                               |
| Null     | on   off     | off     | Assemble the constraint null-space basis                                                                                                                          |
| Nullf    | on   off     | off     | Assemble the constraint force null-space basis                                                                                                                    |
| ud       | on   off     | off     | Assemble the particular solution ud                                                                                                                               |
| uscale   | on   off     | off     | Assemble the scale vector                                                                                                                                         |
| clist    | String array |         | Provide values for constants as input parameters using a string array; for<br>the corresponding constant names, use cname. See The clist and cname<br>Properties. |
| cname    | String array |         | Provide names of constants as input parameters using a string array; for<br>the corresponding constant values, use clist. See The clist and cname<br>Properties.  |
| eiguse   | on   off     | off     | Assemble an eigenvalue problem using the eigname as the eigenvalue                                                                                                |
| eigname  | String       | lambda  | The name of the eigenvalue                                                                                                                                        |
| eigref   | String       | 0       | Value of eigenvalue linearization point                                                                                                                           |
| message  | String       |         | The log message from the last assembly process                                                                                                                    |

The assemble feature assembles the matrices specified as output matrices and stores them in the feature. The output is stored in the feature. You can access the result using the matrix and vector access methods. The linearization point is determined by the current solution (that is, the solution computed by the previous feature in the sequence). The linearization point is stored in the sequence after the run. For information about the eliminated system, see Advanced in the *COMSOL Multiphysics Reference Manual*.

# *AutoRemesh*

Iteratively and automatically create deformed geometries and remesh these geometries. In each step, map the solution and restart the simulation.

#### **SYNTAX**

model.sol(sname).feature(tname).create(fname,"AutoRemesh") model.sol(sname).feature(tname).feature(fname).set(pname,pvalue)

#### **DESCRIPTION**

Operation feature. The following property/values are accepted:

TABLE 6-27: VALID PROPERTY/VALUE PAIRS FOR AUTOREMESH.

| PROPERTY                    | VALUE                                                            | DEFAULT | DESCRIPTION                                                                                                        |
|-----------------------------|------------------------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------|
| autoremeshgeom              | String                                                           |         | Name of geometry sequence.                                                                                         |
| consistentremesh            | on   off                                                         | off     | Consistent initialization after remesh.                                                                            |
| initialstepremesh           | positive scalar                                                  | 0.001   | Initial time step size after remesh.                                                                               |
| initialstepremesh<br>active | on   off                                                         | off     | Use initialstepremesh.                                                                                             |
| remeshtimes                 | double array                                                     |         | Times for remeshing, if stepcondtype is spectime.                                                                  |
| remeshtimestep              | double                                                           |         | Time step for remeshing, if stepcondtype is<br>specstep.                                                           |
| solutionremesh              | tout   tstep                                                     | tstep   | Solution to use for remeshing.                                                                                     |
| stopcondtype                | quality  <br>distortion  <br>general  <br>spectime  <br>specstep | quality | Type of condition for remeshing: mesh quality,<br>distortion, general, specified times, or specified time<br>step. |
| stopdistexpr                | String                                                           |         | Distortion expression, if stepcondtype is<br>distortion.                                                           |
| stopdistval                 | String                                                           | 2       | Maximum distortion allowed, if stepcondtype is<br>distortion.                                                      |
| stopexpr                    | String                                                           |         | Mesh quality expression, if stepcondtype is<br>quality.                                                            |
| stopgenexpr                 | String                                                           |         | Logical condition for remeshing, if stepcondtype is<br>general.                                                    |
| stopval                     | String                                                           | 0.2     | Minimal mesh quality, if stepcondtype is quality.                                                                  |
| storesolmesh                | on   off                                                         | on      | Store solutions when new meshes are created.                                                                       |

The automatic remeshing solver works in one geometry at a time. You specify the name of the geometry sequence in the property autoremeshgeom. Automatic remeshing is available for Time-Dependent studies and is intended for use with the moving meshes and deformed geometries.

Use the stopcondtype property to select the type of condition for when remeshing should occur:

- **•** quality. This means that the solver remeshes when the value of stopexpr becomes smaller than the value of stopval.
- **•** distortion. This means that the solver remeshes when the value of stopdistexpr becomes larger than the value of stopdistval.
- **•** general. This means that the solver remeshes when the stopgenexpr property becomes true (nonzero).
- **•** spectime. This means that the solver remeshes at the times given in remeshtimes.
- **•** specstep. This means that the solver remeshes at the time step given in remeshtimestep.

The solutionremesh property determines which previous solution is used for the remeshing:

- **•** tout means that remeshing is done on the last solution that would have been stored by the solver if remeshing would not have occurred. This setting discards any solver progress done since the last output.
- **•** tstep means that the remeshing is done using the solution from the last solver step before the condition for remeshing became fulfilled. Only the very last solver step, at which the condition was triggered, is discarded. Typically this setting is preferred because then the progress of the automatic remeshing does not depend on the solver's list of output times.

After each remeshing, the time integration is restarted and you can control the time stepping by the Time type analogous properties consistentremesh and initialstepremesh.

If the time integrator runs into problems, the computation is restarted at the beginning of the previous time interval using stricter time stepping controls.

# *AWE*

Solve a parametric problem using asymptotic waveform evaluation (AWE).

## **SYNTAX**

```
model.sol(sname).create(fname,"AWE")
model.sol(sname).feature(fname).set(pname,pvalue)
```

## **DESCRIPTION**

Operation feature. The following properties are accepted:

TABLE 6-28: VALID AWE PROPERTIES.

| PROPERTY       | VALUE                         | DEFAULT                    | DESCRIPTION                                                                                                                                                       |
|----------------|-------------------------------|----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| acceptshort    | on   off                      | on                         | If on, the solver accepts short intervals unconditionally.                                                                                                        |
| atol           | scalar                        | 0.001                      | Absolute tolerance for parameter sweep.                                                                                                                           |
| aweassemble    | all   one                     | all                        | Either assemble all the needed matrices at once, or one at<br>a time.                                                                                             |
| awefunc        | String   vector of<br>strings |                            | Expression(s) used in the search algorithm.                                                                                                                       |
| clist          | String array                  |                            | Provide values for constants as input parameters using a<br>string array; for the corresponding constant names, use<br>cname. See The clist and cname Properties. |
| cname          | String array                  |                            | Provide names of constants as input parameters using a<br>string array; for the corresponding constant values, use<br>clist. See The clist and cname Properties.  |
| control        | String                        | user                       | Name of controlling study step.                                                                                                                                   |
| expeval        | scalar   numeric<br>vector    | range(0.<br>1,0.1,0.<br>9) | Where to check the error in each subinterval.                                                                                                                     |
| expsize        | scalar                        | 3                          | Number of terms in expansion.                                                                                                                                     |
| exptype        | pade   taylor                 | pade                       | Use Padé or Taylor expansions to approximate the<br>unknown.                                                                                                      |
| keeplog        | on   off                      | off                        | Keep warnings in stored log.                                                                                                                                      |
| linearity      | false   linper                | false                      | Use linear linearity or a linear perturbation.                                                                                                                    |
| linplistsolnum | integer array                 | new<br>int[]{1}            | List of solutions to use for the linearization point, when<br>linpsolnum is set to from_list.                                                                     |

TABLE 6-28: VALID AWE PROPERTIES.

| PROPERTY         | VALUE                                                                                 | DEFAULT         | DESCRIPTION                                                                                                                                                                                                                                     |
|------------------|---------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| linpmanualsolnum | solution number                                                                       | new<br>int[]{1} | Solution number (index) to use for the linearization point,<br>when linpsolnum is set to manual.                                                                                                                                                |
| linpmethod       | sol   init                                                                            | init            | Method used for linearization point, which for sol is given<br>by the linpsol property.                                                                                                                                                         |
| linpsol          | zero   solution<br>object                                                             | zero            | Linearization point solution.                                                                                                                                                                                                                   |
| linpsolnum       | all   auto  <br>first   last  <br>from_list  <br>interp   manual  <br>solution number | auto            | Indices to solutions to use as linearization points. The<br>default value from a default solver is case dependent.                                                                                                                              |
| linpsoluse       | current   manual<br>  solution store tag                                              | current         | Linearization point solution to use.                                                                                                                                                                                                            |
| linpsolusesolnum | integer                                                                               |                 | Index for the solution to use when linpsoluse is set to<br>manual.                                                                                                                                                                              |
| linpt            | double                                                                                | 0               | Interpolated point for the linearization point when<br>linpsolnum is set to interp.                                                                                                                                                             |
| minint           | scalar                                                                                | 0               | The shortest allowed subinterval length.                                                                                                                                                                                                        |
| minintactive     | on   off                                                                              | off             | If off, rtol times the parameter span is used. If on,<br>minint is used.                                                                                                                                                                        |
| message          | String                                                                                |                 | The log message from the last solution process.                                                                                                                                                                                                 |
| output           | solution   rom                                                                        | solution        | Output the solution or a reduced-order model.                                                                                                                                                                                                   |
| outsollinearized | du   u                                                                                | du              | Store the total solution (u) or deviation and linearization<br>point (du), when storelinpoint is set to off.                                                                                                                                    |
| plist            | scalar   numeric<br>vector                                                            |                 | Parameter list.                                                                                                                                                                                                                                 |
| plot             | on   off                                                                              | off             | Plot while solving.                                                                                                                                                                                                                             |
| plotgroup        | String                                                                                | default         | Plot group to use for plot while solving.                                                                                                                                                                                                       |
| pname            | vector of strings                                                                     |                 | Parameter names.                                                                                                                                                                                                                                |
| pout             | plist   psteps                                                                        | plist           | When pout is set to plist, output solutions for the<br>parameters in plist. When pout is set to psteps,<br>output solutions at the parameter values chosen by the<br>solver, which will coincide with the adaptively found<br>expansion points. |
| probesel         | all   none  <br>manual                                                                | all             | The probes to compute.                                                                                                                                                                                                                          |
| probes           | vector of strings                                                                     |                 | Probes to use when probesel=manual.                                                                                                                                                                                                             |
| romdata          | String                                                                                | new             | Tag of the target container for the reduced model (new<br>for a new reduced model), when output is set to rom.                                                                                                                                  |
| rtol             | scalar                                                                                | 0.01            | Relative tolerance for parameter sweep.                                                                                                                                                                                                         |
| storelinpoint    | on   off                                                                              | off             | Whether to store the linearization point.                                                                                                                                                                                                       |

The AWE solver computes expansions of an underlying problem around certain parameter values. In the first step the largest and smallest values of plist are used as expansion points. Using these expansions, the values of one or more functions at intermediate parameter values are computed. If the two expansions give similar enough functional values at these internal points, the interval is accepted and no subdivisions of that particular interval are deemed necessary.

The property awefunc is used to specify the functionals of interest, and the property expeval determines at which internal points these functionals are to be evaluated. The values for expeval are given relative the interval. That is, a value of 0.5 means that the functionals are evaluated at the midpoint of each interval. When the functional values from the two expansions are compared, a check is performed to see if they fulfill the specified tolerances atol and rtol. If neither of the tolerances are fulfilled, the interval is bisected, and the process is repeated for each subinterval. Before a bisection is performed a check is made to make sure that the new intervals are not shorter than the shortest allowed. By default the shortest allowed interval is given by the relative tolerance times the length of the interval defined by plist (when minintactive is set to off). If minintactive has been set to on the value of minint is the shortest interval allowed. If minint has been specified, the value of minintactive is on by default. The property acceptshort determines how to handle too short intervals. If acceptshort is set to off and a short interval is detected, the solver is interrupted with an error/warning. If acceptshort is set to on and a short interval is detected, the solver accepts the interval even if the tolerances have not been fulfilled.

In AWE several matrices are needed to compute each expansion. There are two options when it comes to assembling these matrices: With aweassemble set to all everything is assembled in a single call to the Xmesh. With aweassemble set to one, the matrices are assembled one at a time. The first option is faster but requires more memory.

#### **COMPATIBILITY**

The romReconstruct property has been removed since version 5.5.

The soltypeonline and soltypesol properties have been removed since version 5.6.

# *CombineSolution*

Combine two solutions using concatenation or summing of solutions or by removing solutions.

## **SYNTAX**

```
model.sol(sname).create(fname,"CombineSolution")
model.sol(sname).feature(fname).set(pname,pvalue)
```

#### **DESCRIPTION**

This feature combines solutions by concatenation or summation. The concatenation can, for example, take two time-dependent solutions solver over different time spans and combine them into a single time-dependent solution including all times from both solutions. You can also remove solutions. Stationary solutions are not possible to use. The following properties are accepted:

TABLE 6-29: VALID COMBINESOLUTION PROPERTIES.

| PROPERTY       | VALUE   | DEFAULT | DESCRIPTION                                                                                   |
|----------------|---------|---------|-----------------------------------------------------------------------------------------------|
| addinterpparam | Boolean | true    | Add interpolated solution<br>at intersection points for<br>continuous parameter<br>intervals. |
| addinterpt     | Boolean | true    | Add interpolated solution<br>at intersection times.                                           |
| clearscrsol    | Boolean | false   | Clear the source solution<br>when creating a weighted<br>summation or removing<br>solutions.  |

TABLE 6-29: VALID COMBINESOLUTION PROPERTIES.

| PROPERTY                     | VALUE                               | DEFAULT         | DESCRIPTION                                                                                                 |
|------------------------------|-------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------|
| concatmethod                 | firstprecedence  <br>includeall     | firstprecedence | For soloper set to<br>concatenation, make<br>first solution have<br>precedence or include all<br>solutions. |
| conjugatepairconsecutivesort | Boolean                             | true            | Use a conjugate-pair<br>consecutive sort of<br>eigenvalues regardless of<br>the sorting method.             |
| cssol                        | current   any available<br>solution | current         | The solution to sum, when<br>soloper is set to<br>summation.                                                |
| cssol1                       | current   any available<br>solution | current         | The first solution to<br>concatenate, when<br>soloper is set to<br>concatenation.                           |
| cssol2                       | current   any available<br>solution | current         | The second solution to<br>sum, when soloper is set<br>to concatenation.                                     |
| cssolwghtsum                 | current   any available<br>solution | current         | The solution to use for a<br>weighted solution, when<br>soloper is set to wgtsum.                           |
| excludeorinclude             | explicit   implicit                 | explicit        | Exclude or include selected<br>solutions when soloper is<br>set to remsol.                                  |
| excmethod                    | explicit   implicit                 | explicit        | Exclude method: explicit<br>or implicit selection.                                                          |
| incmethod                    | explicit   implicit                 | explicit        | Include method: explicit or<br>implicit selection.                                                          |
| interpandsort                | auto   manual                       | auto            | Automatic or manual<br>interpolation and sort<br>settings if soloper is set<br>to concatenation.            |
| keeplog                      | true   false                        | false           | Keep warnings in stored<br>log.                                                                             |
| listsolnum                   | vector of integers                  | {1}             | Indices to solutions to use<br>as linearization points<br>when solnum =<br>from_list.                       |
| manualsolnum                 | vector of positive<br>integers      |                 | Identifies the solutions<br>used when solnum =<br>manual.                                                   |
| removesol                    | current   any available<br>solution | current         | The solution to remove<br>from, when soloper is set<br>to remsol.                                           |
| remsolfromexprexc            | String                              |                 | Logical expression for<br>solutions to exclude, when<br>soloper is set to remsol.                           |
| remsolfromexprinc            | String                              |                 | Logical expression for<br>solutions to include, when<br>soloper is set to remsol.                           |

TABLE 6-29: VALID COMBINESOLUTION PROPERTIES.

| PROPERTY             | VALUE                                                                         | DEFAULT         | DESCRIPTION                                                                                                                                                                                    |
|----------------------|-------------------------------------------------------------------------------|-----------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| solnum               | all   from_list  <br>manual                                                   | all             | Selection of solutions to<br>exclude or include, when<br>soloper is set to remsol:<br>All, from listsolnum, or<br>from manualsolnum.                                                           |
| soloper              | concatenation  <br>summation   wgtsum  <br>gensum   remsol                    | concatenation   | Combine solutions using<br>concatenation, summation,<br>weighted summation,<br>general summation, or<br>remove solutions.                                                                      |
| solutiontype         | parametric   time  <br>eigenvalue                                             | parametric      | Specify a solution type if<br>interpandsort is set to<br>manual.                                                                                                                               |
| sortdiscontinparams  | Boolean                                                                       | true            | Sort discontinuous<br>single-parameter values.                                                                                                                                                 |
| sorteigexpression    | String                                                                        |                 | The expressions used to<br>sort the eigenvalues or<br>eigenfrequencies. Specified<br>using setIndex().                                                                                         |
| sorteigmethod        | predefined   manual                                                           | predefined      | Use a predefined or<br>manual sorting method, if<br>sorteigvalues is set to<br>true.                                                                                                           |
| sorteigorder         | ascend   descend                                                              | ascend          | Sort eigenvalues in<br>ascending or descending<br>order, if sorteigvalues<br>is set to true.                                                                                                   |
| sorteigprimarily     | realpart   imagpart  <br>realpartmagnitude  <br>imagpartmagnitude  <br>absval | See description | Primary sorting<br>expression, if<br>sorteigmethod is set to<br>predefined. For<br>eigenvalues, the default is<br>realpart; for<br>eigenfrequencies, the<br>default is imagpart.               |
| sorteigsecondly      | realpart   imagpart  <br>realpartmagnitude  <br>imagpartmagnitude  <br>absval | See description | Secondary sorting<br>expression, if<br>sorteigmethod is set to<br>predefined. For<br>eigenvalues, the default is<br>imagpart; for<br>eigenfrequencies, the<br>default is<br>imagpartmagnitude. |
| sorteigvalues        | Boolean                                                                       | true            | Sort eigenvalues.                                                                                                                                                                              |
| sortontransformedeig | true   false                                                                  | true            | Sort based on transformed<br>eigenvalues, if<br>sorteigmethod is set to<br>predefined.                                                                                                         |

TABLE 6-29: VALID COMBINESOLUTION PROPERTIES.

| PROPERTY      | VALUE              | DEFAULT | DESCRIPTION                                                                                      |
|---------------|--------------------|---------|--------------------------------------------------------------------------------------------------|
| weightsmethod | oneexpr   listexpr | oneexpr | Use one expression or a<br>list of expressions for the<br>weighted summation.                    |
| weightoneexpr | String             | 1       | A single expression as<br>weight for the summation<br>(when weightsmethod is<br>set to oneexpr). |

When weightsmethod is set to listexpr, use setIndex with the properties wsolnum. weightlistexpr, and weightlistexpractive to specify the index (solution number), lists of weights, and active flags, respectively, for the case with a list of weights for a weighted summation. See setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

# *CopySolution*

Handle a solution copy from another solver.

## **SYNTAX**

model.sol(sname).create(fname,"CopySolution")

## **DESCRIPTION**

This feature gives access to a copy of a solution from another solver. The following property is accepted:

TABLE 6-30: VALID COPYSOLUTION PROPERTY.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION                                   |
|----------|--------|---------|-----------------------------------------------|
| sol      | String | none    | Name of solution to copy, or "none" if empty. |

# *Eigenvalue*

Solve a PDE eigenvalue problem.

## **SYNTAX**

```
model.sol(sname).create(fname,"Eigenvalue")
model.sol(sname).feature(fname).set(pname,value)
model.sol(sname).feature(fname).create(fname2,LinearType)
model.sol(sname).feature(fname).create(fname2,"Advanced")
```

Here LinearType is any of the allowed linear solver feature types.

#### **DESCRIPTION**

Operation feature.

For both linear and nonlinear problems, the eigenvalue problem is that of the linearization about a solution *U*0. If the eigenvalue appears nonlinearly, COMSOL Multiphysics reduces the problem to a quadratic approximation around a value λ0 specified by the property eigref. The discretized form of the problem reads

$$KU - (\lambda - \lambda_0)DU + (\lambda - \lambda_0)^2 EU = -N_F \Lambda$$

$$NU = M$$

where *K*, *D*, *E*, *N*, and *NF* are evaluated for *U* = *U*0 and λ=λ0. Λ is the Lagrange multiplier vector, and λ is the eigenvalue. The eigenvalue name can be given by the property eigname. The linearization point *U*0 can be given with the property U. The shift, described below, is compensated according to the linearization point for the eigenvalue. Therefore, changing the linearization point has no effect at all for linear or quadratic eigenvalue problems. The eigenvalue search method can be manual or a region in the complex plane (controlled by the property eigmethod) for the ARPACK eigenvalue solver or by stochastic estimation or a manually defined half or full contour in the complex plane for the FEAST eigenvalue solver. There is also a LAPACK eigenvalue for small filled matrices.

The eigenvalue feature accepts the following properties:

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY                     | VALUES           | DEFAULT | DESCRIPTION                                                                                                                                                             |
|------------------------------|------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| appnreigs                    | positive integer |         | Approximate number of eigenvalues<br>(for eigmethod = region).                                                                                                          |
| approxnep                    | tol   fixed      | tol     | Taylor expansion truncation using a<br>tolerance or a fixed truncation,<br>when eigsolver is set to<br>arpacknonlinear.                                                 |
| chkeigregion                 | true   false     | false   | Perform eigenvalue region<br>consistency check when eigsolver<br>is arpack and eigmethod is<br>region.                                                                  |
| clist                        | String array     |         | Provide values for constants as input<br>parameters using a string array; for<br>the corresponding constant names,<br>use cname. See The clist and<br>cname Properties. |
| cname                        | String array     |         | Provide names of constants as input<br>parameters using a string array; for<br>the corresponding constant values,<br>use clist. See The clist and<br>cname Properties.  |
| computeandstorelefteig       | auto   on   off  | auto    | Compute and store left<br>eigenvectors.                                                                                                                                 |
| conangle                     | integer          | 0       | Rotation angle of the ellipse contour<br>(−180 – 180 degrees), when<br>eigsolver is feast and<br>searchcon is wholecon.                                                 |
| conjugatepairconsecutivesort | true   false     | true    | Use a conjugate-pair consecutive<br>sort regardless of the sorting<br>method.                                                                                           |
| conlbdy                      | real scalar      | 0       | Lower bound of search interval,<br>when eigsolver is feast and<br>searchcon is halfcon.                                                                                 |
| conmid                       | real scalar      | 0       | Center of the ellipse contour, when<br>eigsolver is feast and<br>searchcon is wholecon.                                                                                 |
| conrad                       | real scalar      | 1       | Horizontal radius of the ellipse<br>contour, when eigsolver is feast<br>and searchcon is wholecon.                                                                      |
| conradyhm                    | real scalar      | 0.15    | Imaginary semiaxis, when<br>eigsolver is feast and<br>searchcon is halfcon.                                                                                             |

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY             | VALUES                                          | DEFAULT | DESCRIPTION                                                                                            |
|----------------------|-------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------|
| control              | String                                          | user    | Name of the controlling study step<br>or user if the feature is controlled<br>manually.                |
| conubdy              | real scalar                                     | 1       | Upper bound of search interval,<br>when eigsolver is feast and<br>searchcon is halfcon.                |
| distrlinsol          | true   false                                    | false   | Distribute linear system solution.                                                                     |
| eighermchk           | true   false                                    | false   | Real symmetric or Hermitian<br>eigenvalue solver consistency check,<br>if eigsolver is feast.          |
| eigli                | real scalar                                     | 0       | Largest imaginary value of search<br>region when eigsolver is arpack.                                  |
| eiglr                | real scalar                                     | 0       | Largest real value of search region<br>when eigsolver is arpack.                                       |
| eigmethod            | manual   region                                 | manual  | Eigenvalue search method when<br>eigsolver is arpack: around a<br>shift or using a rectangular region. |
| eigname              | String                                          | lambda  | Name of eigenvalue variable.                                                                           |
| eigref               | String                                          | 0       | Linearization point for the<br>eigenvalue.                                                             |
| eigreschk            | true   false                                    | false   | Add an a posteriori residual check.                                                                    |
| eigsi                | real scalar                                     | 0       | Smallest imaginary value of search<br>region when eigsolver is arpack.                                 |
| eigsr                | real scalar                                     | 0       | Smallest real value of search region<br>when eigsolver is arpack.                                      |
| eigsolver            | arpack   feast  <br>lapack  <br>arpacknonlinear | arpack  | Which eigenvalue solver to use:<br>ARPACK, FEAST, LAPACK (filled<br>matrix), or ARPACK nonlinear.      |
| eigsymchk            | true   false                                    | false   | Real symmetric eigenvalue<br>consistency check. Active if<br>usesymeig is auto.                        |
| eigunit              | valid unit                                      | rad/s   | The unit for the eigenvalue.                                                                           |
| eigvfunscale         | average   maximum<br>  mass                     | average | The scaling of eigenvectors: RMS<br>(average), maximum, or so that the<br>modal masses become unity.   |
| eigvfunscaleparam    | positive real scalar                            | 1       | The maximum absolute value for the<br>eigenvector scaling, when<br>eigvfunscale is maximum.            |
| eigwhich             | lm lr sr li si                                  | lm      | Eigenvalue search direction (for<br>eigmethod = manual).                                               |
| expdegnep            | Integer                                         | 3       | Degree of the Taylor expansion, if<br>approxnep is set to fixed.                                       |
| filtereigdescription | array of strings                                |         | The description of the associated<br>entry in filtereigexpression.<br>This is just for usability.      |
| filtereigexpression  | array of strings                                |         | The expressions used to filter the<br>eigenvalues or eigenfrequencies.<br>Specified using setIndex().  |

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY              | VALUES                                   | DEFAULT  | DESCRIPTION                                                                                                                                                               |
|-----------------------|------------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| intgtypehm            | auto   gaussf  <br>trapez   zolot        | auto     | Integration type for estimation:<br>automatic, Gauss, or trapezoidal,<br>when eigsolver is feast. Also,<br>you can choose Zolotarev (zolot)<br>when searchcon is halfcon. |
| keeplog               | on   off                                 | off      | Keep warnings in stored log.                                                                                                                                              |
| krylovdim             | positive integer                         | 300      | Dimension of Krylov space when<br>eigsolver is arpack.                                                                                                                    |
| linpmethod            | init   sol                               | init     | Method used for linearization point.                                                                                                                                      |
| linpsol               | zero   solution<br>object                | zero     | Linearization point solution.                                                                                                                                             |
| linpsoluse            | current   manual  <br>solution store tag | current  | Linearization point solution to use.                                                                                                                                      |
| linpsolusesolnum      | integer                                  |          | Index for the solution to use when<br>linpsoluse is set to manual.                                                                                                        |
| maxdegnep             | Integer                                  | 5        | The maximum degree for the Taylor<br>expansion truncation, if approxnep<br>is set to tol.                                                                                 |
| maxeigit              | positive integer                         | 300      | Maximum number of eigenvalue<br>iterations when eigmethod is<br>region.                                                                                                   |
| maxmatsize            | positive integer                         | 2000     | Maximum matrix size, when<br>eigsolver is set to lapack.                                                                                                                  |
| maxnreigs             | positive integer                         | 200      | Maximum number of eigenvalues<br>when eigmethod is region.                                                                                                                |
| maxnumberstoredeigsol | positive integer                         | 1000     | Maximum number of stored<br>solutions, if storeeigsol is set to<br>firstnth.                                                                                              |
| message               | String                                   |          | The log message from the last<br>solution process.                                                                                                                        |
| neigs                 | positive integer                         | 6        | Number of eigenvalues sought when<br>eigsolver is arpack.                                                                                                                 |
| neigsmanual           | positive integer                         | 6        | Approximate number of eigenvalues,<br>when neigsmethodnhm is set to<br>manual, and size of initial search<br>subspace for estimation, when<br>neigsmethodnhm is stochest. |
| neigsmethodnhm        | stochest   manual                        | stochest | The number of eigenvalues,<br>determined using a stochastic<br>estimation algorithm or manually,<br>when eigsolver is feast.                                              |
| nintgptsmethodhmest   | auto   manual                            | auto     | Number of integration points for<br>estimation: automatic or manual,<br>when eigsolver is feast.                                                                          |
| nintgptsmethodhm      | auto   manual                            | auto     | Number of integration points for<br>eigenvalue solver: automatic or<br>manual, when eigsolver is feast.                                                                   |
| nintgptshm            | positive integer                         | 16       | Number of integration points, when<br>nintgptsmethodhm is manual.                                                                                                         |

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY             | VALUES                                                                           | DEFAULT            | DESCRIPTION                                                                                                                                                                           |
|----------------------|----------------------------------------------------------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| nintgptshmest        | positive integer                                                                 | 6                  | Number of integration points for<br>estimation, when<br>nintgptsmethodhmest is manual.                                                                                                |
| qnmaxitnep           | positive integer                                                                 | 20                 | Maximum number of iterations for<br>quasi-Newton refinement, when<br>qnrefinementnep is set to true.                                                                                  |
| qnrefinementnep      | Boolean                                                                          | true               | Use quasi-Newton refinement, when<br>eigsolver is set to<br>arpacknonlinear.                                                                                                          |
| rtol                 | scalar                                                                           | 1e-6               | Relative tolerance.                                                                                                                                                                   |
| searchcon            | halfcon  <br>wholecon                                                            | wholecon           | Specify the eigenvalue search<br>contour when eigsolver is feast:<br>a whole contour or a half contour<br>(Hermitian problem).                                                        |
| shift                | scalar                                                                           | 0                  | Eigenvalue search location when<br>eigsolver is arpack or lapack.                                                                                                                     |
| shiftactive          | on   off                                                                         | off                | Specify eigenvalue search location<br>when eigsolver is arpack.                                                                                                                       |
| shiftregman          | scalar                                                                           | 0                  | Eigenvalue shift (when<br>shiftregselect = manual).                                                                                                                                   |
| shiftregselect       | auto   manual                                                                    | auto               | Search for eigenvalues around (auto<br>= center of search region) when<br>eigsolver is arpack.                                                                                        |
| solnum               | auto   all   positive<br>integer                                                 | auto               | The solution numbers to use.                                                                                                                                                          |
| solutiontype         | parametric   type<br>  eigenvalue                                                | parametric         | The solution type for solutions to<br>concatenate, when interpandsort<br>is set to manual.                                                                                            |
| sorteigexpression    | String                                                                           |                    | The expressions used to sort the<br>eigenvalues or eigenfrequencies.<br>Specified using setIndex().                                                                                   |
| sorteigmethod        | predefined  <br>manual                                                           | predefined         | Use a predefined or manual s                                                                                                                                                          |
| sorteigorder         | ascend   descend                                                                 | ascend             | Sort eigenvalues in ascending or<br>descending order.                                                                                                                                 |
| sorteigprimarily     | realpart  <br>imagpart  <br>realpartmagnitude  <br>imagpartmagnitude  <br>absval | See<br>description | Primary sorting expression, if<br>sorteigmethod is set to<br>predefined. For eigenvalues, the<br>default is realpart; for<br>eigenfrequencies, the default is<br>imagpart.            |
| sorteigsecondly      | realpart  <br>imagpart  <br>realpartmagnitude  <br>imagpartmagnitude  <br>absval | See<br>description | Secondary sorting expression, if<br>sorteigmethod is set to<br>predefined. For eigenvalues, the<br>default is imagpart; for<br>eigenfrequencies, the default is<br>imagpartmagnitude. |
| sortontransformedeig | true   false                                                                     | true               | Sort based on transformed<br>eigenvalues, if sorteigmethod is<br>set to predefined.                                                                                                   |

TABLE 6-31: VALID EIGENVALUE PROPERTIES.

| PROPERTY         | VALUES                     | DEFAULT     | DESCRIPTION                                                                                                        |
|------------------|----------------------------|-------------|--------------------------------------------------------------------------------------------------------------------|
| storeeigsol      | all   firstnth             | all         | Store all converged solution or only<br>the first Nth solutions.                                                   |
| storefact        | true   false               | false       | Store linear system factorization.                                                                                 |
| storelinpoint    | on   off                   | off         | Whether to store the linearization<br>point.                                                                       |
| termfeast        | relerrtrace  <br>maxrelres | relerrtrace | Termination criterion: relative error<br>on the trace or maximum relative<br>residual, when eigsolver is<br>feast. |
| tolfactqnnep     | double                     | 1           | Tolerance factor for quasi-Newton<br>refinement, when<br>qnrefinementnep is set to true.                           |
| toltruncationnep | double                     | 1E-12       | Tolerance for the Taylor expansion<br>truncation, if approxnep is set to<br>tol.                                   |
| transcontour     | true   false               | true        | Enter transformed values, when<br>eigsolver is feast and<br>eigmethod is manual.                                   |
| transeigref      | true   false               | true        | Transform eigenvalue linearization<br>point and eigmethod is region.                                               |
| transform        | String                     | none        | Eigenvalue transformation.                                                                                         |
| transshift       | true   false               | true        | Enter transformed values, when<br>eigsolver is arpack.                                                             |
| usesymeig        | auto   false               | auto        | Use real symmetric eigenvalue<br>solver when eigsolver is arpack.                                                  |

Specify where to look for the desired eigenvalues with the property shift. Enter a real or complex scalar; the default value is 0, meaning that the solver tries to find eigenvalues close to 0.

For more information about the eigenvalue solver, see Eigenvalue Solver in the *COMSOL Multiphysics Reference Manual*.

# *EigenvalueAttrib*

An attribute to Sensitivity and Optimization solvers. It has the same properties as the Eigenvalue solver. See Eigenvalue for more information.

# *EigenvalueParam*

Handle properties for parameter stepping for a parametric eigenvalue problem.

## **SYNTAX**

```
model.sol(sname).create(fname,"Eigenvalue")
model.sol(sname).feature(fname).create(parname,"EigenvalueParam")
model.sol(sname).feature(fname).feature(parname).set(pname,pvalue)
```

#### **DESCRIPTION**

Attribute feature.

TABLE 6-32: EIGENVALUE PARAMETRIC PROPERTIES.

| PROPERTY            | VALUE                   | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                               |
|---------------------|-------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| addsolutions        | boolean                 | true    | Add solution data points from the general<br>noncontinuation parameter values lists, if<br>uselsqdata is set to true.                                                                                                                                                                     |
| auxsweepeigval      | default  <br>preveigval | default | ARPACK starting vector: the default or from previous<br>eigenvalues.                                                                                                                                                                                                                      |
| auxsweepeigvalshift | average  <br>closest    | closest | ARPACK shift from previous eigenvalues: average of<br>converged eigenvalues or eigenvalue closest to the<br>previous shift, if auxsweepeigvec is set to<br>preveigvec.                                                                                                                    |
| auxsweepeigvec      | default  <br>preveigvec | default | ARPACK shift: as specified (default) or based on<br>eigenvalues from last parameter (preveigvec).                                                                                                                                                                                         |
| auxsweepeigvecstart | sum   closest           | sum     | ARPACK starting vector from previous eigenvalues:<br>summation of all eigenvalues or eigenvector with<br>eigenvalue closest to the shift, if auxsweepeigval is<br>set to preveigval.                                                                                                      |
| control             | String                  | user    | Name of the controlling study step or user if the<br>feature is controlled manually.                                                                                                                                                                                                      |
| excludelsqvalues    | boolean                 | true    | Create bounding box from general parameter value<br>lists, if uselsqdata is set to true.                                                                                                                                                                                                  |
| pdistrib            | on   off                | off     | If the solver should distribute the parameter sweep.                                                                                                                                                                                                                                      |
| peigonerror         | stop   skip  <br>empty  | stop    | Stop, skip the error and then continue, or add an<br>empty solution and then continue when an error<br>occurs.                                                                                                                                                                            |
| plist               | real array              |         | List of parameter values. Obsolete, use plistarr<br>instead.                                                                                                                                                                                                                              |
| plistarr            | real matrix             |         | Lists of parameter values. One row of values for each<br>parameter name.                                                                                                                                                                                                                  |
| pname               | vector of strings       |         | Parameter names.                                                                                                                                                                                                                                                                          |
| pwork               | integer                 | 1       | Maximum number of distributed groups.                                                                                                                                                                                                                                                     |
| sweeptype           | sparse   filled         | sparse  | Method for doing the parameter variation. For<br>sweeptype=sparse, the parameter tuples defined by<br>the columns in plistarr are solved for. This method<br>requires equal length for the rows. For<br>sweeptype=filled, all parameter combinations<br>given by plistarr are solved for. |
| uselsqdata          | boolean                 | true    | Use parameters from least-squares objectives<br>(requires the Optimization Module).                                                                                                                                                                                                       |

# *FFT*

Compute a fast Fourier transform (FFT) or inverse fast/nonuniform Fourier transform (IFFT/INFT) using an FFT study step and solver,

## **SYNTAX**

```
model.sol(sname).create(fname,"FFT")
model.sol(sname).feature(fname).set(pname,pvalue)
```

## **DESCRIPTION**

Operation feature. The following properties are accepted:

TABLE 6-33: VALID FFT SOLVER PROPERTIES.

| PROPERTY        | VALUES                                               | DEFAULT                                            | DESCRIPTION                                                                                                                                                                        |
|-----------------|------------------------------------------------------|----------------------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| addstatsol      | on   off                                             | off                                                | Add stationary solution.                                                                                                                                                           |
| control         | String                                               | user                                               | Set control for FFT solver by study.                                                                                                                                               |
| fftendf         | double                                               | 1.0                                                | Endpoint of frequency interval, only applicable<br>when fftsteptypef = interval.                                                                                                   |
| fftendtime      | double                                               | 1.0                                                | End time for the time interval in a forward FFT.                                                                                                                                   |
| fftextend       | on   off                                             | on                                                 | For an inverse NFT/FFT, extend the input data<br>samples by adding complex conjugate pairs.                                                                                        |
| fftfile         | on   off                                             | off                                                | Store intermediate FFT data on disk.                                                                                                                                               |
| fftinputdata    | fftperiodic  <br>fftnotperiodic  <br>ffthalfperiodic | fftperiodic                                        | Interpret the input data as periodic, not periodic,<br>or half-periodic (antisymmetric). The first two<br>options replaces the Boolean fftperiodic<br>property in earlier version. |
| fftinputmethod  | sol   init                                           | sol                                                | Prescribe the input values using a solution or an<br>initial expression.                                                                                                           |
| fftmaxfreq      | double                                               | 10                                                 | Maximum output frequency in forward FFT.                                                                                                                                           |
| fftoutorder     | nat   sym                                            | nat                                                | Output order (natural or symmetric) of<br>frequencies for forward FFT.                                                                                                             |
| fftouttrange    | double array                                         |                                                    | Output times for inverse NFT/FFT.                                                                                                                                                  |
| fftphaseinexpr  | String                                               |                                                    | Expression for input phase function, can be<br>expressed in terms of t, freq, and niterFFTin<br>(if applicable).                                                                   |
| fftphaseoutexpr | String                                               |                                                    | Expression for output phase function, can be<br>expressed in terms of t, freq, and<br>niterFFTout (if applicable).                                                                 |
| fftphasetypein  | none   fromexpr                                      | none                                               | Method for input phase function.                                                                                                                                                   |
| fftphasetypeout | none   fromexpr                                      | none                                               | Method for output phase function.                                                                                                                                                  |
| fftrealstore    | on   off                                             | on                                                 | Do not store negative frequencies for real input.                                                                                                                                  |
| fftscaling      | cont   discrete                                      | cont                                               | Use a discrete or continuous scaling for the<br>Fourier transform.                                                                                                                 |
| fftstartf       | double                                               | 0.0                                                | Starting point of frequency interval, only<br>applicable when fftsteptypef = interval.                                                                                             |
| fftstarttime    | double                                               | 0.0                                                | Start time for the time interval in a forward FFT.                                                                                                                                 |
| fftsteptypef    | allfreqs  <br>interval                               | allfreqs                                           | Method for selecting frequencies from range.                                                                                                                                       |
| fftstoretimes   | out   store                                          | out                                                | Store time steps taken by the solver (out) or<br>output times stored in fftstoretrange<br>(store).                                                                                 |
| fftstoretrange  | String (vector of<br>output times)                   |                                                    | Output times for the inverse FFT if<br>fftstoretimes is set to store.                                                                                                              |
| ffttranstype    | transfft  <br>transifft                              | transfft<br>(depends on type<br>of FFT study step) | Type of FFT transformation: forward or inverse.                                                                                                                                    |
| fftwinalpha     | double                                               | 0.5                                                | Window parameter for a Tukey window.                                                                                                                                               |
| fftwincenterfw  | double                                               | 0.5                                                | Window center for a Gaussian window function<br>in a forward FFT.                                                                                                                  |

TABLE 6-33: VALID FFT SOLVER PROPERTIES.

| PROPERTY         | VALUES                                                                                      | DEFAULT  | DESCRIPTION                                                                                                              |
|------------------|---------------------------------------------------------------------------------------------|----------|--------------------------------------------------------------------------------------------------------------------------|
| fftwincenterinv  | double                                                                                      | 50       | Window center for a Gaussian window function<br>in an inverse NFT/FFT.                                                   |
| fftwindev        | double                                                                                      | 1        | Standard deviation for a Gaussian window<br>function.                                                                    |
| fftwincutoff     | double                                                                                      | 1.0      | Cutoff fraction for window function in [0, 1].                                                                           |
| fftwindowfw      | on   off                                                                                    | off      | Use window function in forward FFT.                                                                                      |
| fftwindowinv     | on   off                                                                                    | off      | Use window function in inverse NFT/FFT.                                                                                  |
| fftwinexpr       | String                                                                                      |          | Expression for window function, can be<br>expressed in terms of t, freq, niterFFTin, and<br>niterFFTout (if applicable). |
| fftwinmaxfw      | double                                                                                      | 1        | Maximum (end) value for window in forward FFT.                                                                           |
| fftwinmaxinv     | double                                                                                      | 100      | Maximum (end) value for window in inverse<br>NFT/FFT.                                                                    |
| fftwinminfw      | double                                                                                      | 0        | Minimum (start) value for window in forward<br>FFT.                                                                      |
| fftwinmininv     | double                                                                                      | 0        | Minimum (start) value for window in inverse<br>NFT/FFT.                                                                  |
| fftwintypefw     | fromexpr  <br>cutoff  <br>rectangle  <br>gauss   hamming  <br>hanning  <br>blackman   tukey | fromexpr | Method for window function in a forward FFT.                                                                             |
| fftwintypeinv    | fromexpr  <br>cutoff  <br>rectangle  <br>gauss   hamming  <br>hanning  <br>blackman   tukey | fromexpr | Method for window function in an inverse NFT/<br>FFT.                                                                    |
| keeplog          | on   off                                                                                    | off      | Keep warnings in stored log.                                                                                             |
| punit            | String                                                                                      | Hz       | Frequency unit.                                                                                                          |
| statmethod       | init   sol                                                                                  | sol      | For an added stationary solution, use a solution<br>or initial expression.                                               |
| statsol          | String                                                                                      |          | Solution to use as an added stationary solution.                                                                         |
| statsolnum       | String                                                                                      |          | The solution number to use for the solution used<br>as an added stationary solution.                                     |
| statsoluse       | a stored solution or<br>current                                                             | current  | Use the current solution or a stored solution as<br>the added stationary solution.                                       |
| statstudy        | String                                                                                      |          | Study from which the added stationary solution is<br>chosen.                                                             |
| statt            | double                                                                                      |          | Time value at which the added stationary<br>solution is chosen.                                                          |
| statmanualsolnum | integer                                                                                     |          | Solution number of the added stationary<br>solution.                                                                     |
| tunit            | String                                                                                      | s        | Time unit.                                                                                                               |
| winpunit         | unit                                                                                        | Hz       | Frequency unit for window in an inverse NFT/<br>FFT.                                                                     |

## **EXAMPLE**

```
Code for Use with Java
  model.study("std2").create("tdfft", "TimeToFreqFFT");
  model.study("std2").feature("tdfft").set("fftinputstudy", "std1");
  model.study("std2").feature("tdfft").set("fftstarttime", "0.5");
  model.study("std2").feature("tdfft").set("fftendtime", "2.0");
  model.study().create("std3");
  model.study("std3").create("fdfft2", "FreqToTimeFFT");
  model.study("std3").feature("fdfft2").set("fftinputstudy", "std2");
  ...
  model.sol("sol7").create("fft1", "FFT");
  model.sol("sol7").feature("fft1").set("ffttranstype", "transfft");
  model.sol("sol7").feature("fft1").set("fftstarttime", "0.5");
  model.sol("sol7").feature("fft1").set("fftendtime", "2.0");
  model.sol("sol7").feature("fft1").set("control", "tdfft");
  ...
  model.sol("sol9").feature("fft1").set("ffttranstype", "transifft");
  model.sol("sol9").feature("fft1").set("control", "fdfft2");
  model.study("std3").feature("fdfft2").set("fftinputmethod", "sol");
  model.study("std3").feature("fdfft2").set("fftinputstudy", "std2");
  model.study("std3").feature("fdfft2").set("fftinputsol", "current");
  model.study("std3").feature("fdfft2").set("fftinputsoluse", "current")
  ...
  model.sol("sol2").feature("ft1").set("fftstarttime", "0.5");
  model.sol("sol2").feature("ft1").set("fftendtime", "2.0");
  model.sol("sol2").feature("ft1").set("fftperiodic", "off");
  model.sol("sol2").feature("ft1").set("fftoutorder", "nat");
  ...
  model.sol("sol2").feature("ft1").set("fftphase", "on");
  model.sol("sol2").feature("ft1").set("fftwintypefw", "fromexpr");
  model.sol("sol2").feature("ft1").set("fftwinexpr","(niterFFTin<5)*niterFFTin");
  model.sol("sol2").feature("ft1").set("fftphasetypein", "fromexpr");
  model.sol("sol2").feature("ft1").set("fftphaseinexpr", "5+i*2*niterFFTin");
  model.sol("sol2").feature("ft1").set("fftphasetypeout", "fromexpr");
  model.sol("sol2").feature("ft1").set("fftphaseoutexpr","2+i*4*niterFFTout");
```

## **COMPATIBILITY**

The property fftperiodic has been replaced by the property fftinputdata since version 6.2.

The properties fftbwalgtype and fftmeasure from earlier versions are no longer available since version 5.2.

In version 5.2, the property fftwintype for the window type in earlier versions was replaced by fftwintypefw and fftwintypeinv for the window type for a forward FFT and for an inverse NFT/FFT, respectively.

In version 5.2, the property fftwindow for switching a window on and off in earlier versions was replaced by fftwindowfw and fftwindowinv for the window type for a forward FFT and for an inverse NFT/FFT, respectively.

In version 5.2, the property tlist for the input time range to a forward FFT in earlier versions was replaced by the properties fftstarttime and fftendtime for the start time and end time, respectively.

Add for loops to a solver sequence.

#### **SYNTAX**

```
model.sol("sol1").create("for1", "For");
model.sol("sol1").create("endfor1", "EndFor");
```

#### **DESCRIPTION**

```
model.sol("sol1").create("for1", "For") adds the start of a for loop.
model.sol("sol1").create("endfor1", "EndFor") adds the end of a for loop.
```

Use For and EndFor to enclose a sequence of solver commands that you want to iterate in a for loop. You can add more than one for loop, but they must be balanced so that each For ends with a corresponding EndFor.

You control the number of iterations in the loop using the following properties:

TABLE 6-34: PROPERTIES FOR THE FOR LOOP.

| PROPERTY   | VALUE                          | DEFAULT    | DESCRIPTION                                                                                                                        |
|------------|--------------------------------|------------|------------------------------------------------------------------------------------------------------------------------------------|
| control    | String                         | user       | Name of the controlling study step or user if the feature is<br>controlled manually.                                               |
| expr       | String                         | 1          | Global expression used to compute relative error when<br>method=convergence.                                                       |
| iter       | Positive<br>integer            | 5          | Number of iterations of the solver loop when<br>method=iterations.                                                                 |
| maxiter    | Positive<br>integer            | 25         | Maximum number of iterations in the solver loop when<br>method=convergence.                                                        |
| method     | convergence<br> <br>iterations | iterations | Choose whether termination of the solver loop is based on the<br>convergence of a global variable or a fixed number of iterations. |
| miniter    | Positive<br>integer            | 1          | Minimum number of iterations in the solver loop when<br>method=convergence.                                                        |
| rtolterm   | Positive real<br>number        | 0.001      | Relative tolerance for termination of the solver loop when<br>method=convergence.                                                  |
| rtolthresh | Positive real<br>number        | 1          | Threshold used to avoid division by zero while computing the<br>relative error when method=convergence.                            |

# *FullyCoupled*

Handle the fully coupled nonlinear solution approach.

## **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"FullyCoupled")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
```

## **DESCRIPTION**

This feature can be used as an attribute to the Time and Stationary features. The nonlinear solver is an affine invariant form of the damped Newton method.

The following properties are available:

TABLE 6-35: VALID FULLY COUPLED PROPERTIES.

| PROPERTY          | VALUE                                                                        | DEFAULT      | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
|-------------------|------------------------------------------------------------------------------|--------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| aaccdelay         | positive integer                                                             | 0            | Number of iterations between pseudo<br>time stepping becomes inactive and<br>Anderson acceleration becomes active<br>when stabacc = aacc.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| aaccdim           | positive integer                                                             | 10           | Dimension of Anderson iteration<br>space when stabacc = aacc.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| aaccmix           | scalar 0–1                                                                   | 1            | Mixing parameter when segstabacc<br>= segaacc.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| adaptcfltol       | boolean                                                                      | true         | Use an adaptive target error estimate<br>for pseudo time stepping.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| adapttol          | boolean                                                                      | false        | Use adaptive tolerance in the linear<br>solver if set to true. Available if<br>dtech is set to bcktrack or const.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
| adapttolerrweight | boolean                                                                      | true         | Apply nonlinear error weighting to the<br>adaptive tolerance for models that do<br>not use pseudo time stepping and if<br>adapttol is set to true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              |
| adapttolcflweight | boolean                                                                      | true         | Apply CFL weighting to the adaptive<br>tolerance for models using pseudo<br>time stepping and if adapttol is set<br>to true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| atolchoice        | fullerrorest  <br>partialerrorest  <br>nonlinresidual  <br>onlycfl   onlyerr | fullerrorest | The error estimation method to use if<br>adapttol is set to true.<br>fullerrorest uses the full<br>information about the linear and<br>nonlinear error estimates to<br>determine the tolerance.<br>partialerrorest uses partial<br>information about the linear and<br>nonlinear error estimates to<br>determine the tolerance.<br>nonlinresidual uses the nonlinear<br>residual only to determine the<br>tolerance. onlycfl applies CFL<br>suppression to the initial tolerance for<br>models using pseudo time stepping.<br>onlyerr applies a suppression<br>mechanism based on the nonlinear<br>error estimate for models with a<br>stationary solver and not using pseudo<br>time stepping. |
| atolthreshold     | positive value, 0–1                                                          | 0.1          | The threshold for using the safeguards<br>when determining the tolerance. The<br>higher the value, the faster the<br>safeguards get disabled. Only available<br>when adapttol is set to true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| backdampstep      | scalar (0–1)                                                                 | 0.5          | Damping in one step, when dtech is<br>set to bcktrack and backmethod is<br>set to conststep.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

TABLE 6-35: VALID FULLY COUPLED PROPERTIES.

| PROPERTY      | VALUE                  | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                    |
|---------------|------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| backmethod    | fullest   conststep    | fullest | Backtracking method when dtech is<br>set to bcktrack: full estimation or<br>constant step.                                                                                                                                                                                                                                                     |
| backtrackonce | boolean                | false   | When set to true, it forces the solver<br>to apply at least one backtracking step<br>even if the algorithm does not strictly<br>require it. Available only when dtech<br>is set to bcktrack.                                                                                                                                                   |
| cflaa         | boolean                | false   | Use Anderson acceleration when the<br>CFL number is under a CFL threshold<br>set by cflaacfl. Only available when<br>pseudo time stepping is used<br>(stabacc=cflcmp).                                                                                                                                                                         |
| cflaacfl      | positive scalar        | 100     | CFL threshold when stabacc =<br>cflcmp.                                                                                                                                                                                                                                                                                                        |
| cflaadelay    | nonnegative integer    | 0       | Number of iterations between pseudo<br>time stepping becomes inactive and<br>Anderson acceleration becomes active<br>when segstabacc = cflcmp.                                                                                                                                                                                                 |
| cflaadim      | 10<br>positive integer |         | Dimension of the iteration space for<br>Anderson Acceleration when used<br>with pseudo time stepping (stabacc<br>= cflcmp and cflaa = on).                                                                                                                                                                                                     |
| cflaafact     | positive scalar        | 1       | Threshold for Anderson step for<br>pseudo time stepping (stabacc =<br>cflcmp and cflaa = on).                                                                                                                                                                                                                                                  |
| cflaamix      | real scalar 0–1        | 1       | Mixing parameter for Anderson<br>acceleration when segstabacc =<br>cflcmp.                                                                                                                                                                                                                                                                     |
| cflaaset      | pid   lock             | pid     | Decides if the PID controller should<br>be disabled and the CFL number set to<br>the target CFL number when<br>Anderson acceleration is enabled<br>(lock) or if the PID controller should<br>be used also when Anderson<br>acceleration is enabled (pid). Available<br>when pseudo time stepping is used<br>(stabacc = cflcmp and cflaa = on). |
| cfljtech      | boolean                | false   | Override Jacobian update for step<br>when stabacc = cflcmp.                                                                                                                                                                                                                                                                                    |
| cfljtechval   | onfirst   minimal      | onfirst | Jacobian update on first iteration or<br>minimal when stabacc = cflcmp and<br>cfljtech = true.                                                                                                                                                                                                                                                 |
| cfltech       | simple   interp        | simple  | When simple is used, the PID<br>controller is using the classical PID<br>control theory. The interp option<br>combines the classical PID controller<br>with a linear interpolation method.<br>Available when stabacc is set to<br>cflcmp.                                                                                                      |
| cfltol        | positive scalar        | 0.1     | Target error estimate for pseudo time<br>stepping.                                                                                                                                                                                                                                                                                             |

TABLE 6-35: VALID FULLY COUPLED PROPERTIES.

| PROPERTY      | VALUE                                      | DEFAULT                     | DESCRIPTION                                                                                                                                                    |
|---------------|--------------------------------------------|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| damp          | positive real                              | 1                           | Damping factor for the damped<br>Newton method.                                                                                                                |
| dampexponent  | real scalar (1–2)                          | 2                           | The exponential factor used to<br>determine the adaptive tolerance. if<br>atolchoice is set to<br>nonlinresidual.                                              |
| dampfactor    | real scalar (0–1)                          | 1                           | The linear damping factor used to<br>determine the adaptive tolerance, if<br>atolchoice is set to<br>nonlinresidual.                                           |
| ddoginitdamp  | nonnegative scalar                         | 1                           | Initial damping factor for dtech set to<br>ddog.                                                                                                               |
| ddogrestart   | positive integer                           | 7                           | Number of iterations before restart<br>for double dogleg solver.                                                                                               |
| dtech         | const   auto  <br>bcktrack  <br>hnlin ddog | auto   const<br>(Time)      | Damping technique. For more<br>information, see below this table.                                                                                              |
| etamax        | scalar (0–1)                               | 0.9                         | Maximal tolerance for the adaptive<br>tolerance algorithm, if adapttol is set<br>to true.                                                                      |
| forcecfl      | boolean                                    | true                        | Limit to target CFL number for<br>pseudo time stepping.                                                                                                        |
| initcfl       | positive scalar                            | 5.0                         | Initial CFL number for pseudo time<br>stepping.                                                                                                                |
| initiallintol | scalar (0–1)                               | 0.5                         | Initial tolerance for the adaptive<br>tolerance algorithm, if adapttol is set<br>to true.                                                                      |
| initstep      | nonnegative scalar                         | 1                           | Initial damping factor for dtech set to<br>auto.                                                                                                               |
| initsteph     | nonnegative scalar                         | 1e-4                        | Initial damping factor for dtech set of<br>hnlin.                                                                                                              |
| jtech         | minimal   once  <br>onevery                | onevery  <br>minimal (Time) | Jacobian update technique for dtech<br>set to const or bcktrack.                                                                                               |
| jtechcfl      | positive scalar                            | 100                         | CFL threshold for Jacobian update<br>when segstabacc = cflcmp and<br>cfljtech = true.                                                                          |
| kdpid         | positive scalar                            | 0.05                        | PID controller, derivative for pseudo<br>time stepping.                                                                                                        |
| kipid         | positive scalar                            | 0.05                        | PID controller, integral for pseudo<br>time stepping.                                                                                                          |
| kppid         | positive scalar                            | 0.65                        | PID controller, proportional for<br>pseudo time stepping.                                                                                                      |
| maxdamp       | scalar (0, 1]                              | 1.0                         | The maximum damping factor. If<br>backtracking returns a damping larger<br>than this value, maxdamp is used.<br>Available only if dtech is set to<br>bcktrack. |
| maxiter       | positive integer                           | 25   4 (Time)               | Maximum number of Newton<br>iterations.                                                                                                                        |

TABLE 6-35: VALID FULLY COUPLED PROPERTIES.

| PROPERTY            | VALUE                            | DEFAULT                     | DESCRIPTION                                                                                                                                                                                                             |
|---------------------|----------------------------------|-----------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mincfl              | positive scalar                  | 10000                       | Target CFD number for pseudo time<br>stepping.                                                                                                                                                                          |
| mindamp             | positive scalar                  | 0.1                         | The minimum damping factor. If<br>backtracking returns a damping<br>smaller than this value, mindamp is<br>used. Values above 1 just mean that no<br>damping is allowed. Available only if<br>dtech is set to bcktrack. |
| minstep             | scalar (0–1)                     | 1.0e-4                      | Minimum damping factor for dtech<br>set to auto.                                                                                                                                                                        |
| minsteph            | scalar (0–1)                     | 1.0e-8                      | Minimum damping factor for dtech<br>set to hnlin.                                                                                                                                                                       |
| minsteprecovery     | positive scalar                  | 0.75                        | Recovery damping factor. Available<br>when useminsteprecovery is set to<br>auto or on.                                                                                                                                  |
| niter               | positive integer                 | 1                           | Fixed number of iterations.                                                                                                                                                                                             |
| ntermauto           | tol   itertol                    | tol                         | Termination techniques for dtech set<br>to auto/hnlin.                                                                                                                                                                  |
| ntermconst          | iter   tol   itertol             | tol                         | Termination techniques for dtech set<br>to const or bcktrack.                                                                                                                                                           |
| ntolfact            | positive scalar                  | 1                           | Tolerance factor.                                                                                                                                                                                                       |
| ratelimit           | positive scalar                  | 0.9 (dtech set to<br>const) | Limit on nonlinear convergence rate.                                                                                                                                                                                    |
| plot                | on   off                         | off                         | Plot while solving.                                                                                                                                                                                                     |
| plotgroup           | String                           | default                     | Plot group to use for plot while<br>solving.                                                                                                                                                                            |
| probesel            | all   none   manual              | all                         | The probes to compute.                                                                                                                                                                                                  |
| probes              | vector of strings                |                             | Probes to use when<br>probesel=manual.                                                                                                                                                                                  |
| ratelimitactive     | on   off                         | off   on (Time)             | Use limit on nonlinear convergence<br>rate.                                                                                                                                                                             |
| relaxationressmooth | positive scalar                  | 0.1                         | Relaxation factor for residual<br>smoothing when ressmooth is set to<br>true.                                                                                                                                           |
| reserrfact          | positive scalar                  | 1000                        | Residual factor for termonres if set<br>to auto or both.                                                                                                                                                                |
| resscale            | scalefieldwise  <br>scaleuniform | scalefieldwise              | Residual scaling technique for dtech<br>set to ddog.                                                                                                                                                                    |
| ressmooth           | boolean                          | false                       | Use residual smoothing for pseudo<br>time stepping (when stabacc is set to<br>cflcmp).                                                                                                                                  |
| rstep               | positive scalar                  | 10                          | Restrictions for step-size update<br>(limits how much the damping factor is<br>allowed to change in a Newton<br>iteration).                                                                                             |
| rstepabs            | positive scalar 0–1              | 1                           | Restrictions for step-size increase<br>(maximum for the allowed absolute<br>increase in the damping factor for a<br>Newton iteration).                                                                                  |

TABLE 6-35: VALID FULLY COUPLED PROPERTIES.

| PROPERTY               | VALUE                     | DEFAULT      | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                |
|------------------------|---------------------------|--------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| stabacc                | none   cflcmp   aacc      | none         | Stabilization and acceleration: None,<br>pseudo time stepping (for stationary<br>solvers), or Anderson acceleration.                                                                                                                                                                                                                                                                                       |
| termonres              | off   on   auto   both    | auto/off     | Termination criterion: Solution,<br>residual, solution or residual, or<br>solution and residual. The default is<br>auto for stationary problems and off<br>for time-dependent problems.                                                                                                                                                                                                                    |
| updweightsauto         | true   false  <br>wthresh | true         | Updates the weights for automatic<br>scales if they change two orders of<br>magnitude and then restart the<br>Newton solver from the current<br>solution if true. If set to wthresh,<br>you can use thresholds for the weights.<br>All updweights properties are<br>available for stationary and parametric<br>studies and for Newton solvers only<br>(that is, dtech is not ddog,<br>bcktrack, or const). |
| updweightsdamp         | current   manual          | current      | Available if updweightsauto is<br>wthresh. Use fraction of the current<br>damping factor at update (current)<br>or a constant update damping factor<br>(manual).                                                                                                                                                                                                                                           |
| updweightsdampval      | positive scalar           | 1            | Fraction of current damping factor. If<br>updweightsauto is wthresh and<br>updweightsdamp is current.                                                                                                                                                                                                                                                                                                      |
| updweightsdampvalconst | positive scalar           | 0.1          | Update damping factor. If<br>updweightsauto is wthresh and<br>updweightsdamp is manual.                                                                                                                                                                                                                                                                                                                    |
| updweightsfac          | scalar                    | 100          | Weights threshold factor for update. If<br>updweightsauto is wthresh.                                                                                                                                                                                                                                                                                                                                      |
| useheuristicfact       | boolean                   | false (Time) | Use pre-6.2 linear heuristic for<br>adaptive tolerance.                                                                                                                                                                                                                                                                                                                                                    |
| useminsteprecovery     | auto   on   off           | auto         | Use recovery damping factor. The<br>recovery damping is used when the<br>damping is reaching its minimum value,<br>and would otherwise return an error<br>(about minimum damping factor<br>reached). Available when dtech is set<br>to auto or hnlin.                                                                                                                                                      |

The property dtech controls which damping factor to use in the damped Newton iterations.

For dtech set to auto, the solver determines an appropriate damping factor automatically. For this method the initial and minimally allowed damping factors are controlled by the properties initstep and minstep, respectively. The termination technique is controlled by the property ntermauto.

For dtech set to hnlin, the solver determines an appropriate damping factor automatically but treat the problem as being highly nonlinear. This option can be tried if there is no convergence with dtech set to auto. For this method the initial and minimally allowed damping factors are controlled by the properties initsteph and minsteph respectively. Moreover, certain internal control structures are adapted. Especially, the error control is biased from a more absolute norm toward a relative norm. So this parameter is also useful if a solution with

components of highly varying orders of magnitudes are present. In the context of parameter stepping, you can also try this option if the step sizes in the parameter seem to be too small.

When dtech is set to const, the constant damping factor specified in the property damp is used. For this method the termination technique is controlled by the property ntermconst. Furthermore, the property jtech can be used to control how often the Jacobian is updated. With jtech=minimal, the Jacobian is updated as seldom as possible (only once for a stationary problem and at most once per time step for a time-dependent problem). For time-dependent problems, the choice jtech=once makes the solver update the Jacobian once per time step. With jtech=onevery, the Jacobian is updated on every Newton iteration. The default is onevery for stationary problems and minimal for time-dependent problems.

When dtech is set to ddog (stationary problems), the double dogleg solver is used. The initial damping factor is controlled by the property ddoginitdamp and the property resscale controls the residual scaling. The option resscale=scalefieldwise scales the equations based on the field-wise sizes of the initial residual. When the option resscale=scaleuniform is selected the algorithm terminates on the relative residual based on the initial residual.

When dtech is set to bcktrack, backtracking is used as an automated way of finding the "optimal" damping factor used in the nonlinear solvers.

The tolerance ntol gives the criterion for convergence for a stationary problem; see Stationary Solver in the *COMSOL Multiphysics Reference Manual*.

The property ntolfact controls how accurately the nonlinear system of equations is solved. The value given in ntolfact is multiplied with the main solver tolerance and used in the convergence criteria. Also, the solution process is interrupted (and the Jacobian updated or the time step reduced) if the convergence is too slow. This can be disabled by setting useratelimit=off. When useratelimit=on, what is to be considered as too slow convergence can be controlled through the property ratelimit. The solution process is interrupted if the estimated linear convergence rate (of all steps, when the segregated solver is used) becomes larger than the value given in ratelimit.

The property stabacc enables or disables pseudo time stepping (for stationary problems) or Anderson acceleration. When enabled the pseudo time stepping is controlled by the scalar-valued controller parameters cfltol, initcfl, kdpid, kipid, and kppid. For the Anderson acceleration, the parameter aaccdim specifies the dimension of the Anderson iteration space.

The property termonres controls the termination criterion for stationary problems when dtech=const or bcktrack (and ntermconst is not iter), auto, or hnlin. When termonres=off the estimated error is solution based, with termonres=on it is based on a relative residual and for termonres=auto the estimated error is the minimum of the solution and residual based errors. For termonres=auto the property reserrfact is a scalar factor multiplying the relative residual error. For termonres=both, both methods are used.

# **COMPATIBILITY**

The property usecflcmp from earlier versions of COMSOL Multiphysics is not used in version 5.0. Use the property stabacc instead.

# *HardwareAcceleration*

Hardware acceleration using a supported GPU for transient acoustics simulations based on the discontinuous Galerkin method.

## **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"HardwareAcceleration")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
```

## **DESCRIPTION**

This feature can be used as an attribute to the Time feature to accelerate the solution time if you are simulating transient acoustics using a discontinuous Galerkin method. It requires access to a supported GPU.

The following properties are available:

TABLE 6-36: VALID HARDWARE ACCELERATION PROPERTIES

| PROPERTY           | VALUE   | DEFAULT | DESCRIPTION                                                                                        |
|--------------------|---------|---------|----------------------------------------------------------------------------------------------------|
| dgacc              | boolean | false   | Use an accelerated solver for discontinuous Galerkin.                                              |
| gpuresidual        | boolean | true    | Compute residual on GPU, if dgacc is set to true.                                                  |
| gpusingleprecision | boolean | false   | Use single precision on GPU, if gpuresidual is set<br>to true. If false, double precision is used. |

# *InputMatrix*

Input matrices and vectors to the linear solvers.

#### **SYNTAX**

```
solver=model.sol(sequenceTag).feature(solverTag)
solver.create(fname,"InputMatrix")
solver.feature(fname).set(pname,value)
solver.feature(fname).addSparseMatrixVal(mname,row,col,val)
solver.feature(fname).addSparseMatrixValImag(mname,row,col,val)
solver.feature(fname).createSparseMatrix(mname,M,N,Nnz,isReal)
solver.feature(fname).createVector(mname,M,isReal)
solver.feature(fname).getSparseMatrixVal(mname)
solver.feature(fname).getSparseMatrixValImag(mname)
solver.feature(fname).getSparseMatrixRow(mname)
solver.feature(fname).getSparseMatrixCol(mname)
solver.feature(fname).getVector(vname)
solver.feature(fname).getVectorImag(vname)
solver.feature(fname).getSparseMatrixValBlock(mname,start,stop)
solver.feature(fname).getSparseMatrixValImagBlock(mname,start,stop)
solver.feature(fname).getSparseMatrixRowBlock(mname,start,stop)
solver.feature(fname).getSparseMatrixColBlock(mname,start,stop)
solver.feature(fname).getVectorBlock(vname,start,stop)
solver.feature(fname).getVectorImagBlock(vname,start,stop)
solver.feature(fname).setVector(vname,val)
solver.feature(fname).setVectorImag(vname,val)
solver.feature(fname).setVectorBlock(vname,val,start)
solver.feature(fname).setVectorImagBlock(vname,val,start)
solver.feature(fname).isReal(mname)
solver.feature(fname).getM(mname)
solver.feature(fname).getN(mname)
```

## **DESCRIPTION**

The InputMatrix feature can be used to create the raw data of an assembled matrix or vector from Java®. The InputMatrix feature can exist as a subfeature of the Eigenvalue, Stationary, and Time solver features. These solver feature automatically pick up matrices from the InputMatrix subfeature instead of automatically assembling the matrices. The matrices are not stored in the model when the model is saved. They must be created before computing the solver features.

TABLE 6-37: VALID INPUTMATRIX PROPERTIES.

| PROPERTY | VALUES   | DEFAULT | DESCRIPTION                 |
|----------|----------|---------|-----------------------------|
| K        | on   off | off     | Input the stiffness matrix  |
| L        | on   off | off     | Input the load vector       |
| M        | on   off | off     | Input the constraint vector |

TABLE 6-37: VALID INPUTMATRIX PROPERTIES.

| PROPERTY | VALUES   | DEFAULT | DESCRIPTION                         |
|----------|----------|---------|-------------------------------------|
| N        | on   off | off     | Input the constraint Jacobian       |
| D        | on   off | off     | Input the damping matrix            |
| E        | on   off | off     | Input the mass matrix               |
| NF       | on   off | off     | Input the constraint force Jacobian |

## **SEE ALSO**

Matrix Data, Matrix Creation

# *Linear*

Handle linear system solvers with three different attribute features: Direct, Iterative, and Multigrid.

#### **SYNTAX**

```
sol.feature(fname).create(lname,"Direct")
sol.feature(fname).feature(lname).set(pname,value)
sol.feature(fname).create(lname,"Iterative")
sol.feature(fname).feature(lname).set(pname,value)
sol.feature(fname).feature(lname).create(pcname,PType);
sol.feature(fname).feature(lname).feature(pcname).set(pname,value)
sol.feature(fname).feature(lname).create(pname,"Multigrid")
sol.feature(fname).feature(lname).feature(pname).feature("pr").create(prename,SType)
sol.feature(fname).feature(lname).feature(pname).feature("po").create(postname,SType)
sol.feature(fname).feature(lname).feature(pname).feature("cs").create(cname,CType)
sol.feature(fname).feature(lname).feature(pname).feature("pr").feature(prename).
  set(pname,value)
sol.feature(fname).feature(lname).feature(pname).feature("po").feature(postname).
  set(pname,value)
sol.feature(fname).feature(lname).feature(pname).feature("cs").feature(cname).
  set(pname,value)
```

*PType* is any of the allowed preconditioner feature types. These types are Direct preconditioner, Multigrid, Domain decomposition, SCGS, SOR, SOR Gauge, SOR Vector, Vanka, SOR Line, AMS, Auxiliary-Space AMG, Incomplete LU, Krylov, and Block Navier–Stokes. *SType* is any of the allowed smoother types. These are the same as the *PType* except Domain decomposition, Multigrid, AMS, and Auxiliary-Space AMG. *CType* is any of the allowed coarse grid solver types: Direct and all types listed for *PType*.

*Presmoother, AMG Presmoother, Postsmoother, AMG Postsmoother, Coarse Solver, AMG Coarse Solver, SchurSolver, SchurSourceSolver, PressureSolver, and VelocitySolver*

Specify the Presmoother and AMG Presmoother, Postsmoother and AMG Postsmoother, Coarse Solver and AMG Coarse Solver, Schur Solver, Schur Source Solver, Pressure Solver, and Velocity Solver via feature("pr"), feature("po"), feature("cs"), feature("sso"), feature("ssso"), feature("ps"), and feature("vs"), respectively. These features are for administrative purposes only and do not contain any settings themselves.

#### **DESCRIPTION**

Three attribute features for linear system solvers.

# **EXAMPLES:**

GMRES with ILU as preconditioner:

```
Code for Use with Java
  SolverFeature solver = sol.feature(fname).create("iter1","Iterative");
  solver.set("solver","gmres");
```

```
solver.create("ilu","IncompleteLU");
Code for Use with MATLAB
  solver = sol.feature(fname).create('iter1','Iterative');
  solver.set('solver','gmres');
  solver.create('ilu','IncompleteLU');
Change the preconditioner to GMG/SORVector/SPOOLES:
Code for Use with Java
  solver.create("gmg","Multigrid");
  solver("gmg").set("solver","gmg");
  solver("gmg").feature("pr").create("p1","SORVector");
  solver("gmg").feature("po").create("p1","SORVector");
  SolverFeature csolver = solver("gmg").feature("csolver").create("c1","Direct");
  csolver.set("solver","spooles");
  csolver.set("errorchkd","on");
Code for Use with MATLAB
  solver.create('gmg','Multigrid');
  solver('gmg').set('solver','gmg');
  solver('gmg').feature('pr').create('p1','SORVector');
  solver('gmg').feature('po').create('p1','SORVector');
  csolver = solver('gmg').feature('csolver').create('c1','Direct');
  csolver.set('solver','spooles');
  csolver.set('errorchkd','on');
Use Conjugate Gradients instead of GMRES:
Code for Use with Java
  solver.set("solver","cg");
Code for Use with MATLAB
  solver.set('solver','cg');
Use the sparse approximate inverse (SAI) preconditioner using a sparsity pattern of SAI defined by a power of 3 of 
the system matrix:
Code for Use with Java
  model.sol("sol1").feature("t1").create("i1", "Iterative");
  model.sol("sol1").feature("t1").feature("i1").set("linsolver", "cg");
  model.sol("sol1").feature("t1").feature("i1").create("sai1", "SAI");
  model.sol("sol1").feature("t1").feature("i1").feature("sai1").set("saisymm", "on");
  model.sol("sol1").feature("t1").feature("i1").feature("sai1").
     set("saipattern","saipowa");
  model.sol("sol1").feature("t1").feature("i1").feature("sai1").set("saipowera", "3");
Code for Use with MATLAB
  iter = model.sol('sol1').feature('t1').create('i1', 'Iterative');
  iter.set('linsolver', 'cg');
  iter.create('sai1', 'SAI');
  iter.feature('sai1').set('saisymm', 'on');
  iter.feature('sai1').set('saipattern','saipowa');
  iter.feature('sai1').set('saipowera', '3');
```

## **THE PREFUN PROPERTY**

The prefun property for the solver (preconditioner) accepts a different set of values depending on the context. In the section below, its possible values and default value is listed for each preconditioner that supports it.

#### **DIRECT PROPERTIES**

TABLE 6-38: VALID DIRECT PROPERTIES (FOR ALL SOLVERS).

| PROPERTY        | VALUES                               | DEFAULT                       | DESCRIPTION                                                              |
|-----------------|--------------------------------------|-------------------------------|--------------------------------------------------------------------------|
| errorchk        | off   on   auto                      | auto                          | Check error estimate.                                                    |
| errorratiobound | nonnegative scalar                   | 0.5                           | Error ratio bound (typical values in the<br>range of 0–1).               |
| iterrefine      | on   off                             | on<br>off (eigenvalue solver) | Iterative refinement.                                                    |
| linsolver       | mumps   pardiso  <br>spooles   dense | mumps                         | Method to use.                                                           |
| maxrefinesteps  | nonnegative integer                  | 15                            | Maximum number of iterative refinement<br>steps.                         |
| nliniterrefine  | on   off                             | off                           | Use iterative refinement in nonlinear<br>solver.                         |
| prefun          | mumps   pardiso  <br>spooles   dense | mumps                         | Solver for preconditioner (MUMPS,<br>PARDISO, SPOOLES, or Dense Matrix). |
| rhob            | scalar > 1                           | 1                             | Factor in linear error estimate.                                         |

TABLE 6-39: OPTIONAL DIRECT PROPERTIES.

| PROPERTY         | VALUES                          | DEFAULT   | DESCRIPTION                                                                                             |
|------------------|---------------------------------|-----------|---------------------------------------------------------------------------------------------------------|
| clusterpardiso   | on   off                        | off       | Use Parallel Direct Sparse Solver for Clusters<br>(PARDISO).                                            |
| incore           | auto   manual                   | auto      | In-core memory method (PARDISO, MUMPS).                                                                 |
| internalmemusage | positive real                   | 3         | Internal memory usage factor (PARDISO,<br>MUMPS).                                                       |
| memfracooc       | scalar between 0 and 1          | 0.99      | Fraction of memory to store out of core.                                                                |
| minicmemory      | positive real                   | 512.0     | Minimum in-core memory in MB (PARDISO,<br>MUMPS).                                                       |
| mumpsalloc       | scalar at least 1               | 1.2       | MUMPS memory allocation factor (MUMPS).                                                                 |
| mumpsblr         | on   off                        | off       | Block low rank factorization (MUMPS).                                                                   |
| mumpsblrtol      | scalar between 0 and 1          | 1e-8      | Block low rank factorization tolerance (MUMPS).                                                         |
| mumpsblrtype     | normal   aggressive             | normal    | The compression type for the block low rank<br>factorization.                                           |
| mumpsreorder     | auto   amd   amf  <br>qamd   nd | auto      | Preordering algorithm (MUMPS).                                                                          |
| mumpsrreorder    | on   off                        | on        | Row preordering (MUMPS).                                                                                |
| ooc              | automatic   on   off            | automatic | Use out-of-core (PARDISO, MUMPS). The<br>automatic option switches to out-of-core<br>storage if needed. |
| oocmemory        | positive real                   | 512.0     | In-core memory in MB (PARDISO, MUMPS).                                                                  |
| pardmtsolve      | on   off                        | off       | Multithreaded forward and backward solve<br>(PARDISO).                                                  |
| pardreorder      | mmd   nd   ndmt                 | nd        | Preordering algorithm (PARDISO).                                                                        |
| pardrreorder     | on   off                        | on        | Row preordering algorithm (PARDISO).                                                                    |
| pardschedule     | auto   one   two                | auto      | Scheduling method (PARDISO).                                                                            |
| pivotenable      | on   off                        | on        | Use pivoting (MUMPS).                                                                                   |

TABLE 6-39: OPTIONAL DIRECT PROPERTIES.

| PROPERTY      | VALUES                 | DEFAULT | DESCRIPTION                                                                            |
|---------------|------------------------|---------|----------------------------------------------------------------------------------------|
| pivotperturb  | scalar between 0 and 1 | 1e-8    | Pivot perturbation threshold (PARDISO,<br>MUMPS).                                      |
| pivotrefines  | nonnegative integer    | 0       | Number of forced iterative refinements<br>(PARDISO, MUMPS).                            |
| pivotstrategy | on   off               | off     | Use 2-by-2 Bunch-Kaufman pivoting (on) or<br>1-by-1 diagonal pivoting (off) (PARDISO). |
| preorder      | mmd   nd   ms   bestof | nd      | Preordering algorithm (SPOOLES).                                                       |
| reusereorder  | true   false           | true    | Reuse preordering (PARDISO, MUMPS).                                                    |
| thresh        | scalar between 0 and 1 | 0.1     | Pivot threshold (MUMPS, SPOOLES).                                                      |
| usetotmemory  | scalar between 0 and 1 | 0.8     | Used fraction of total memory (PARDISO,<br>MUMPS).                                     |

#### **ITERATIVE PROPERTIES**

TABLE 6-40: VALID ITERATIVE PROPERTIES (FOR ALL SOLVERS).

| PROPERTY  | VALUES                                              | DEFAULT                      | DESCRIPTION                                                                                                                    |
|-----------|-----------------------------------------------------|------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| errorchk  | off   on   auto                                     | auto                         | Validate error estimate.                                                                                                       |
| linsolver | gmres   fgmres   bicgstab  <br>tfqmr   cg   precond | gmres, ilu<br>(precond)      | Method to use.                                                                                                                 |
| maxilinit | positive integer                                    | 100                          | Maximum number of intermediate<br>iteration for the iterative solver in<br>error checking. Available when<br>errorchk is auto. |
| maxlinit  | positive integer                                    | 10000<br>500 (coarse solver) | Maximum number of linear<br>iterations (when used with a<br>tolerance).                                                        |
| rhob      | scalar > 1                                          | 1                            | Factor in linear error estimate.                                                                                               |

TABLE 6-41: OPTIONAL ITERATIVE PROPERTIES.

| PROPERTY   | VALUES                 | DEFAULT                                                                                                                                                                          | DESCRIPTION                                                                                                                             |
|------------|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| approxscgs | true   false           | false                                                                                                                                                                            | Use approximate approximation, if<br>vankavarsactive is set to true<br>(SCGS).                                                          |
| droptol    | scalar between 0 and 1 | 0.01 when<br>used as<br>preconditioner;<br>1 when used as<br>presmoother,<br>postsmoother,<br>or coarse<br>solver; 0.001<br>for Hierarchical<br>LU and Sparse<br>Localized Schur | Drop tolerance (SPOOLES, Hierarchical<br>LU, Incomplete LU with tolerance<br>element dropping strategy, and Sparse<br>Localized Schur). |
| droptype   | tol   fill             | tol                                                                                                                                                                              | Element dropping strategy for<br>Incomplete LU (Tolerance, Fill ratio).                                                                 |
| eigk       | positive integer       | 25                                                                                                                                                                               | Number of approximate eigenvectors,<br>when gcrodr is set to true (GMRES).                                                              |

TABLE 6-41: OPTIONAL ITERATIVE PROPERTIES.

| PROPERTY      | VALUES                                 | DEFAULT                   | DESCRIPTION                                                                                                                                                                                    |
|---------------|----------------------------------------|---------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eigkrel       | scalar between 0 and 1                 | 0.5                       | Fraction of GMRES iterations when<br>gcrodrrel is set to true (GMRES).                                                                                                                         |
| elimtol       | scalar between 0 and 1                 | 1                         | Elimination tolerance (Hierarchical LU).                                                                                                                                                       |
| fillratio     | nonnegative integer                    | 1                         | Fill ratio (Incomplete LU with Fill ratio<br>element dropping strategy and SAI).                                                                                                               |
| gcrodr        | true   false                           | true                      | Use GCRO-DR for an adaptive<br>restarted GMRES solver (GMRES).                                                                                                                                 |
| gcrodrrel     | true   false                           | false                     | Use relative subspace size when gcrodr<br>is set to true (GMRES).                                                                                                                              |
| hybridcomp    | vector of strings                      |                           | Field/State components in step if<br>hybridvarspec=manual.                                                                                                                                     |
| hybridization | single   multi                         | single                    | Use a single preconditioner or multiple<br>preconditioner as a hybrid<br>preconditioner.                                                                                                       |
| hybridvar     | vector of strings                      |                           | Fields/States in step.                                                                                                                                                                         |
| hybridvarspec | all   manual                           | all                       | Include all components or specify which<br>manually.                                                                                                                                           |
| irestol       | scalar between 0 and 1                 | 0.01                      | Residual tolerance when prefuntype is<br>left (gmres, cg, bicgstab, tfqmr).                                                                                                                    |
| ilutdroptol   | scalar between 0 and 1                 | 0.01                      | Drop tolerance (ILUT).                                                                                                                                                                         |
| ilutfillratio | nonnegative integer                    | 1                         | Fill ratio (ILUT).                                                                                                                                                                             |
| iter          | nonnegative integer                    | 2 (1 for ILU and<br>ILUT) | Fixed number of iterations (when used<br>as preconditioner, smoother, or coarse<br>solver), for all iterative solvers except<br>direct preconditioner when iterm is set<br>to iter or itertol. |
| iterm         | tol   iter   itertol                   | iter                      | Termination technique (when<br>Incomplete LU, ILUT, or ILU0 are used<br>as coarse solver or Localized Schur or<br>Sparse Localized Schur are used as<br>Schur solver).                         |
| itol          | scalar between 0 and 1                 | 0.1                       | Relative tolerance when iterm is set to<br>tol or itertol.                                                                                                                                     |
| itrestart     | positive integer                       | 50                        | Number of iterations before restart<br>(gmres, fgmres).                                                                                                                                        |
| keepy         | auto   on   off                        | auto                      | Reuse the subspace when gcrodr is set<br>to true (GMRES).                                                                                                                                      |
| linesweeptype | ssor   sor   soru                      | ssor                      | The sweep type, which decides in which<br>order the blocks are looped through<br>(SCGS, SOR line, Vanka).                                                                                      |
| matrixformat  | auto   sparse   filled  <br>matrixfree | auto                      | Matrix format.                                                                                                                                                                                 |
| maxlinit      | positive integer                       | 10                        | Maximum number of iterations when<br>iterm is set to tol.                                                                                                                                      |
| nrkeepss      | positive integer                       | 5                         | Minimum number of restarts for<br>GCRO-DR, when keepy is set to auto.                                                                                                                          |
| prefun        | ilu   ilut   ilu0  <br>spooles         | ilu                       | Solver (preconditioner) for Incomplete<br>LU, ILUT (Intel MKL), ILU0 (Intel MKL),<br>or SPOOLES).                                                                                              |

TABLE 6-41: OPTIONAL ITERATIVE PROPERTIES.

| PROPERTY             | VALUES                               | DEFAULT                | DESCRIPTION                                                                                                                       |
|----------------------|--------------------------------------|------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| prefuntype           | auto (SAI only)   left  <br>right    | left (auto for<br>SAI) | Left or right preconditioning (gmres,<br>cg, bicgstab, tfqmr, SAI). For SAI, the<br>default preconditioning type is auto.         |
| relax                | scalar between 0 and 2               | 1                      | Relaxation factor (Jacobi, SOR-based<br>algorithms, ILU, ILUT, SAI, Vanka, and<br>Hierarchical LU).                               |
| respectpattern       | on   off                             | on                     | Respect the matrix pattern (ILU).                                                                                                 |
| reuselines           | on   off                             | on                     | Reuse lines of nodes (SOR line).                                                                                                  |
| reusepattern         | true   false                         | true                   | Reuse sparsity pattern (SCGS).                                                                                                    |
| reuseprolongators    | on   off                             | on                     | Reuse blocks of data (SCGS, SOR line,<br>Vanka).                                                                                  |
| saicolmaxfactor      | positive integer                     | 5                      | Limit the maximum number of nonzero<br>elements of each column in the SAI<br>preconditioner matrix.                               |
| saisymm              | auto   off   on  <br>hermitian       | auto                   | Symmetry characteristics of SAI method<br>corresponding to Automatic,<br>Nonsymmetric, Symmetric, and<br>Hermitian, respectively. |
| saipattern           | sysmat   saipowa                     | sysmat                 | Sparsity pattern of SAI defined by<br>system matrix or power of system<br>matrix.                                                 |
| saipowera            | positive integer                     | 2                      | Power of system matrix for SAI sparsity<br>pattern.                                                                               |
| scgsblocked          | true   false                         | true                   | Use a blocked version (SCGS).                                                                                                     |
| scgsdirectmaxsize    | positive integer                     | 150                    | Maximum size for direct stored<br>factorization, if scgssolv is approx.                                                           |
| scgsfilter           | true   false                         | true                   | Apply filter to lines (SCGS)                                                                                                      |
| scgsfilteraggressive | true   false                         | true                   | Use an efficient smoother when a filter<br>is applied to lines (SCGS),.                                                           |
| scgsfilteramglvls    | true   false                         | false                  | Apply filter to AMG levels only, if<br>scgsfilter is true (SCGS).                                                                 |
| scgsfilterelems      | true   false                         | true                   | Filter individual elements, if<br>scgsfilter is true (SCGS)                                                                       |
| scgslinefiltertype   | none   filterstart  <br>filterall    | filterstart            | Apply filter to elements: none, unique<br>start elements, or unique lines, if<br>scgsfilter is true (SCGS).                       |
| scgsmethod           | elements   lines  <br>lines_vertices | elements               | Method for SCGS: Mesh elements, Mesh<br>element lines, or Mesh element lines and<br>vertices (SCGS).                              |
| scgsmumpsminsize     | positive integer                     | 150                    | Maximum size for MUMPS factorization,<br>if scgssolv is approx.                                                                   |
| scgsrelax            | scalar between 0 and 2               | 1                      | Relaxation factor (SCGS).                                                                                                         |
| scgsrestart          | positive integer                     | 100                    | GMRES restart value (SCGS).                                                                                                       |
| scgsreusemeshdata    | true   false                         | true                   | Reuse mesh data (SCGS).                                                                                                           |
| scgssolv             | gmres   direct   stored<br>  approx  | gmres                  | Local block solver (SCGS).                                                                                                        |
| scgstol              | positive scalar                      | 0.02                   | GMRES tolerance (SCGS).                                                                                                           |

TABLE 6-41: OPTIONAL ITERATIVE PROPERTIES.

| PROPERTY           | VALUES                              | DEFAULT | DESCRIPTION                                                                                       |
|--------------------|-------------------------------------|---------|---------------------------------------------------------------------------------------------------|
| seconditer         | positive integer                    | 1       | Number of second iterations.                                                                      |
| sorblocked         | on   off                            | on      | Blocked SOR method.                                                                               |
| sorvecdof          | vector of strings                   |         | Vector element variables (SOR vector<br>and SOR gauge algorithms).                                |
| symmetric          | on   off                            | off     | Use symmetric form; ssor instead of sor,<br>and so forth. (SOR, SORVector,<br>SORGauge, SORLine). |
| thresh             | scalar between 0 and 1              | 1       | Pivot threshold (ILU).                                                                            |
| transpose          | on   off                            | off     | Use transposed form; soru instead of<br>sor and so forth. (SOR, SORVector,<br>SORGauge, SORLine). |
| usenlweights       | true   false                        | true    | Terminate using nonlinear scales<br>(GMRES with left preconditioning).                            |
| vankablocked       | on   off                            | on      | Blocked Vanka method.                                                                             |
| vankadirectmaxsize | positive integer                    | 150     | Maximum size for direct stored<br>factorization, if vankasolv is approx.                          |
| vankamumpsminsize  | positive integer                    | 150     | Maximum size for MUMPS factorization,<br>if vankasolv is approx.                                  |
| vankarelax         | scalar between 0 and 2              | 0.8     | Relaxation factor for Vanka update.                                                               |
| vankarestart       | positive integer                    | 100     | GMRES restart value (Vanka).                                                                      |
| vankasolv          | gmres   direct   stored<br>  approx | gmres   | Local block solver (Vanka).                                                                       |
| vankatol           | positive scalar                     | 0.02    | GMRES tolerance (Vanka).                                                                          |
| vankavars          | vector of strings                   | {}      | Lagrange multiplier variables (Vanka,<br>SCGS).                                                   |
| vankavarsactive    | true   false                        | false   | Use Vanka variables (SCGS).                                                                       |

The property divcleantol is used in the inequality |*TTb*| < divcleantol*·*|*b*| to ensure that the numerical divergence after divergence cleaning is small enough; see SOR Gauge in the *COMSOL Multiphysics Reference Manual*.

## **MULTIGRID PROPERTIES**

TABLE 6-42: VALID MULTIGRID PROPERTIES.

| PROPERTY      | VALUES               | DEFAULT                                                        | DESCRIPTION                                                                                           |
|---------------|----------------------|----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| gmglevels     | positive integer     | 1                                                              | Maximum number of geometric multigrid levels.                                                         |
| iter          | integer              | 2                                                              | Fixed number of iterations (when used as<br>preconditioner, smoother, or coarse solver).              |
| linsolver     | gmg   amg            | gmg                                                            | Method to use.                                                                                        |
| maxlinit      | positive integer     | 500                                                            | Maximum number of linear iterations (when used with a<br>tolerance).                                  |
| mgcycle       | v   w   f            | v                                                              | Cycle type.                                                                                           |
| mglevels      | positive integer     | 5                                                              | Maximum number of algebraic multigrid levels.                                                         |
| prefermatfree | true   false         | false                                                          | Prefer the free matrix format.                                                                        |
| prefun        | gmg   amg  <br>saamg | amg if used as<br>Krylov<br>preconditioner.<br>gmg, otherwise. | Solver for preconditioner (Geometric multigrid,<br>Algebraic multigrid, or Smoothed aggregation AMG). |
| rhob          | scalar > 1           | 1                                                              | Factor in linear error estimate.                                                                      |

TABLE 6-43: OPTIONAL MULTIGRID PROPERTIES.

| PROPERTY           | VALUES               | DEFAULT  | DESCRIPTION                                                                              |
|--------------------|----------------------|----------|------------------------------------------------------------------------------------------|
| agglevel           | positive integer     | 2        | Multigrid level to start smoothing at, if<br>aggmethod=manual (saamg).                   |
| aggmethod          | auto   manual        | auto     | Smoothing of prolongations if<br>usesmooth=on (saamg).                                   |
| amgauto            | integer from 1 to 10 | 3        | Quality of multigrid hierarchy (amg).                                                    |
| amgcompwise        | true   false         | true     | Construct prolongators<br>componentwise (amg).                                           |
| assemall           | on   off             | on       | Assemble on the order-lowered levels<br>when loweramg is on (amg and<br>saamg).          |
| coarseningmethod   | parallel   classic   | parallel | The coarsening method to use (amg).                                                      |
| compactaggregation | on   off             | off      | Use an aggregation algorithm that leads<br>to a less rapid coarsening (saamg).           |
| geomuse            | vector of strings    |          | Geometries for geometric multigrid<br>hierarchy.                                         |
| hybridization      | single   multi       | single   | Use a single preconditioner or multiple<br>preconditioner as a hybrid<br>preconditioner. |
| hybridvar          | vector of strings    |          | Fields/States in step.                                                                   |
| hybridvarspec      | all   manual         | all      | Include all components or specify<br>which manually.                                     |
| hybridcomp         | vector of strings    |          | Field/State components in step if<br>hybridvarspec=manual.                               |
| jacdamp            | positive scalar      | 2/3      | Jacobi damping factor if<br>usesmooth=on (saamg).                                        |
| kwslaplacemg       | on   off             | off      | Keep generated weak contribution.                                                        |
| loweramg           | on   off             | on       | Lower the element order first (any)<br>(amg and saamg).                                  |

TABLE 6-43: OPTIONAL MULTIGRID PROPERTIES.

| PROPERTY                  | VALUES                                                                              | DEFAULT | DESCRIPTION                                                                           |
|---------------------------|-------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------------|
| massem                    | on   off                                                                            | on      | Assemble on multigrid levels (gmg).                                                   |
| maxcoarsedof              | positive integer                                                                    | 5000    | Maximum number of DOFs at coarsest<br>level (amg, saamg).                             |
| mcaseassem                | vector of strings                                                                   |         | Multigrid levels where assemble should<br>be performed (gmg,<br>mcasegen=manual).     |
| mcasegen                  | manual   all   any  <br>coarse   coarseorder<br>  refine   refineany  <br>refineall | any     | Hierarchy generation method (gmg).                                                    |
| mcaseuse                  | vector of strings                                                                   |         | Multigrid levels which should be used<br>(gmg, mcasegen=manual).                      |
| mindofthread              | positive integer                                                                    | 5000    | Minimum number of DOFs per thread<br>on multigrid levels (when prefun is<br>not gmg). |
| mkeep                     | on   off                                                                            | off     | Keep generated mesh cases (gmg).                                                      |
| nullspace                 | constant   rbm                                                                      |         | Null-space vectors: constant or rigid<br>body modes (saamg).                          |
| prolongatoronlystrongconn | on   off                                                                            | on      | Use a sparser prolongator to achieve<br>better performance per iteration<br>(amg).    |
| prolongatortruncation     | positive scalar                                                                     | 0.1     | Prolongator truncation factor (amg).                                                  |
| reuseprolongators         | on   off                                                                            | on      | Reuse prolongators when possible<br>(saamg).                                          |
| rmethod                   | regular   longest                                                                   | regular | Mesh refinement method (gmg).                                                         |
| saamgcompwise             | on   off                                                                            | off     | Construct the SAAMG prolongators<br>componentwise (saamg).                            |
| scale                     | vector of positive<br>numbers                                                       | 2       | Mesh scale factor (gmg).                                                              |
| strconn                   | positive scalar                                                                     | 0.01    | Strength of connection (saamg).                                                       |
| strconnamgp               | positive scalar                                                                     | 0.25    | Strength of connection (amg).                                                         |
| usefilter                 | on   off                                                                            | on      | Use filtering if usesmooth=on<br>(saamg).                                             |
| usesmooth                 | on   off                                                                            | on      | Use prolongation smoothing (saamg).                                                   |

The useaggressive property is no longer used from version 5.3. For the geometric multigrid solver/ preconditioners, the multigrid hierarchy is controlled in the following way (see also Multigrid in the *COMSOL Multiphysics Reference Manual*):

- **•** If mcasegen=all, any, or coarse, coarseorder, then the multigrid hierarchy is automatically constructed starting from the mesh and discretization set by the study. The number of multigrid levels generated is given in the property gmglevels. The method all and any first tries to lower the discretization order for the shape functions used, and secondly coarsens the mesh. The method all lowers the order (by one) if all used shape functions can be lowered. The method any lowers the order (by one) if at least one shape function can be lowered. The method coarse does not lower the order, it only coarsens the mesh. The method coarseorder both lowers the order (for any shape functions that can be lowered by one) and coarsen the mesh, at the same time.
- **•** If mcasegen=refine, refineany, or refineall then the multigrid hierarchy is automatically constructed by a combination of refining the mesh given by the study and changing the discretization. The number of multigrid

levels generated is given in the property gmglevels. The refinement method can be specified using the property rmethod. The originally selected mesh for the study is used, in the case of refining the mesh, in a multigridlevel and the finest multigrid level generated is used for the study (solved for). The generated multigrid levels are kept in the model and the mcasegen property is changed into manual. The method refine only refines the mesh and does not change the shape function order. The method refineany and refineall first tries to lower the order, and secondly refines the mesh. The method refineany constructs a multigrid level by lowering the order (by one) if at least on shape function can be lowered. The method refineall generates multigrid levels by lowering the order (by one) if all used shape function can be lowered.

**•** If mcasegen=manual, then the existing multigrid levels (children to the current study) can be used. The subset to use is selected by giving their tags to the mcaseuse property.

The construction of coarse level matrices is controlled by the property massem and mcaseassem. The first property controls if the matrices should be assembled for the automatically generated levels. If set to off, prolongation and restriction matrices are used to project the matrices from the top level in the hierarchy. The second property controls which multigrid levels that should use the assemble technique in the mcasegen=manual case.

When an iterative solver is used as preconditioner, smoother, or coarse solver, you can choose whether to solve using a tolerance or to perform a fixed number of iterations. When used as a coarse solver, the default is to solve using a tolerance. When used as a preconditioner or smoother, the default is to perform a fixed number of iterations. If both properties itol and iter are given, the program solves using a tolerance.

## **DOMAIN DECOMPOSITION PROPER TIES (SCHWARZ AND SCHUR)**

TABLE 6-44: VALID DOMAIN DECOMPOSITION PROPERTIES (SCHWARZ AND SCHUR).

| PROPERTY           | VALUE                     | DEFAULT    | DESCRIPTION                                                                                                                              |
|--------------------|---------------------------|------------|------------------------------------------------------------------------------------------------------------------------------------------|
| agglevel           | positive integer          | 2          | Multigrid level to start smoothing at, if<br>aggmethod =manual (aggregation)<br>(Schwarz only).                                          |
| aggmethod          | auto   manual             | auto       | Postpone prolongation smoothing<br>(aggregation) (Schwarz only).                                                                         |
| amgauto            | integer from 1 to 10      | 3          | Quality of multigrid hierarchy<br>(algebraic) (Schwarz only).                                                                            |
| amgauto            | integer from 1 to 10      | 3          | Quality of multigrid hierarchy<br>(algebraic) (Schwarz only).                                                                            |
| assemall           | on   off                  | on         | Assemble on the order-lowered levels<br>(algebraic, aggregation) if<br>loweramgdd is on (Schwarz only).                                  |
| compactaggregation | on   off                  | off        | Use an aggregation algorithm that leads<br>to a less rapid coarsening<br>(aggregation) (Schwarz only).                                   |
| ddreordermethod    | none   dissection   space | dissection | Element preordering method: none,<br>nested dissection, or using a space-filling<br>curve.                                               |
| ddvisualize        | Boolean                   | false      | Visualize domains in the domain<br>decomposition instead of the finite<br>element solution.                                              |
| domdofmax          | integer                   | 1          | Maximum number of nodes per<br>subdomain.                                                                                                |
| domgeom            | vector of strings         |            | Partition geometries.                                                                                                                    |
| domnodesmax        | integer                   | 100000     | Maximum number of DOFs per<br>subdomain.                                                                                                 |
| geomuse            | vector of strings         |            | Use coarse level in geometries (for<br>mcasegen=coarseorder   all   any  <br>coarse   refineall   refineany  <br>refine) (Schwarz only). |
| hybridcomp         | vector of strings         |            | Field/state components in step /<br>Preconditioner selection (for<br>hybridvarspec= manual).                                             |
| hybridization      | single   multi            | single     | Use a single preconditioner or multiple<br>preconditioner as a hybrid<br>preconditioner.                                                 |
| hybridvar          | vector of strings         |            | Fields/states in step / Preconditioner<br>variables (for hybridization=multi).                                                           |
| hybridvarspec      | all   manual              | all        | Include all components or specify which<br>manually (for hybridization=multi).                                                           |
| includeextradim    | Boolean                   | true       | Include extra dimensions (if used) in the<br>partitioning of domains for the domain<br>decomposition.                                    |
| iter               | integer                   | 1          | Number of iterations.                                                                                                                    |
| jacdamp            | positive scalar           | 2/3        | Jacobi damping factor (aggregation)<br>(Schwarz only).                                                                                   |

TABLE 6-44: VALID DOMAIN DECOMPOSITION PROPERTIES (SCHWARZ AND SCHUR).

| PROPERTY                | VALUE                                                                               | DEFAULT                   | DESCRIPTION                                                                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| keepschur               | on   off                                                                            | on                        | Keep Schur complement matrices<br>(Schur only).                                                                                             |
| kwslaplacemg            | on   off                                                                            | off                       | Keep generated weak contribution.                                                                                                           |
| loweramgdd              | on   off                                                                            | on                        | Lower element order first (algebraic,<br>aggregation) (Schwarz only).                                                                       |
| massem                  | on   off                                                                            | on                        | Assemble on coarse level (for<br>mcasegen=coarseorder   all   any  <br>coarse   refineall   refineany  <br>refine   manual) (Schwarz only). |
| maxcoarsedof            | positive integer                                                                    | 5000                      | Maximum number of DOFs at coarsest<br>level (algebraic, aggregation) if<br>maxcoarsedofsactive is on (Schwarz<br>only).                     |
| maxcoarsedofs<br>active | on   off                                                                            | off                       | Enable setting the maximum number of<br>DOFs at coarsest level (Schwarz only).                                                              |
| mcasegen                | coarseorder   all   any  <br>coarse   refineall  <br>refineany   refine  <br>manual | any                       | Coarse level generation method<br>(Schwarz only).                                                                                           |
| mcaseuse                | vector of strings                                                                   |                           | Coarse level that should be used (for<br>mcasegen=manual) (Schwarz only).                                                                   |
| mglevels                | positive integer                                                                    | 5                         | Maximum number of algebraic multigrid<br>levels (algebraic, aggregation)<br>(Schwarz only).                                                 |
| mkeep                   | on   off                                                                            | on                        | Keep generated coarse level (for<br>mcasegen=all   any   coarse)<br>(Schwarz only).                                                         |
| ndom                    | integer                                                                             | 2 (Schwarz);<br>4 (Schur) | Minimum number of subdomains.                                                                                                               |
| overlap                 | integer                                                                             | 1                         | Additional overlap.                                                                                                                         |
| overlapmethod           | auto   matrix   mesh                                                                | auto                      | Overlap method (Schwarz only).                                                                                                              |
| prefermatfree           | on   off                                                                            | off                       | Automatically choose matrix free format<br>(Schwarz only).                                                                                  |
| prefun (Schur)          | ddschuradd   ddschurmul                                                             | ddchurmul                 | Domain decomposition solver (Additive<br>Schur/Multiplicative Schur), for Schur<br>methods.                                                 |
| prefun (Schwarz)        | ddadd   ddmul   ddhyb  <br>ddsym                                                    | ddmul                     | Domain decomposition solver (Additive<br>Schwarz/Multiplicative Schwarz/Hybrid<br>Schwarz/ Symmetric Schwarz), for<br>Schwarz methods.      |
| reuseprolongators       | on   off                                                                            | on                        | Reuse prolongators when possible<br>(aggregation) (Schwarz only).                                                                           |
| rmethod                 | longest   regular                                                                   | longest                   | Mesh refinement method (for<br>mcasegen=refineall   refineany  <br>refine) (Schwarz only).                                                  |
| scale                   | scalar > 0                                                                          | 2.0                       | Mesh coarsening factor (for<br>mcasegen=coarseorder   any   all  <br>coarse) (Schwarz only).                                                |
| strconn                 | positive scalar                                                                     | 0.01                      | Strength of connection (aggregation)<br>(Schwarz only).                                                                                     |

TABLE 6-44: VALID DOMAIN DECOMPOSITION PROPERTIES (SCHWARZ AND SCHUR).

| PROPERTY         | VALUE                                                 | DEFAULT | DESCRIPTION                                                                                                                                                      |
|------------------|-------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| useaggressive    | on   off                                              | on      | Use aggressive coarsening<br>(aggregation) (Schwarz only).                                                                                                       |
| usecoarse        | on   algebraic  <br>aggregation   nicolaides<br>  off | on      | Use coarse level: geometric (on),<br>algebraic multigrid (algebraic),<br>aggregations AMG (aggregation),<br>nicolaides (Schwarz only), or off<br>(Schwarz only). |
| usecoloring      | on   off                                              | on      | Use coloring (for prefun = ddmul  <br>ddsym) (Schwarz only).                                                                                                     |
| usefilter        | on   off                                              | on      | Use filtering (aggregation) (Schwarz<br>only).                                                                                                                   |
| userac           | auto   on   off                                       | auto    | Recompute and clear subdomain data.                                                                                                                              |
| useschurcoloring | on   off                                              | on      | Use coloring (for prefun =<br>ddschurmul) (Schur only).                                                                                                          |

```
Example Code for Use With Java
```

```
model.sol("sol1").feature("s1").create("i1", "Iterative");
model.sol("sol1").feature("s1").feature("i1").create("dd1","DomainDecomposition");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").feature("ds").
      create("mg1","Multigrid");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").set("prefun","ddadd");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").set("mcasegen","refine");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").set("domnodesmax","2");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").
      set("overlapmethod","mesh");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").set("ndom", "16");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").
      set("domgeom", new String[]{"geom1"});
model.sol("sol1").feature("s1").feature("i1").feature("dd1").feature("cs").
      feature("dDef").set("linsolver","pardiso");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").feature("ds").
      feature("mg1").set("gmglevels","5");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").
      set("hybridization","multi");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").
      set("hybridcomp", new String[]{"comp1.u"});
```

#### **SOR PREFUN PROPERTY**

TABLE 6-45: SOR PREFUN PROPERTY.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                  |
|----------|-------------------|---------|------------------------------|
| prefun   | ssor   sor   soru | ssor    | Solver (SSOR, SOR, or SORU). |

## **SSOR GAUGE PREFUN PROPERTY**

TABLE 6-46: SSOR GAUGE PREFUN PROPERTY.

| PROPERTY | VALUE                               | DEFAULT                                                                                              | DESCRIPTION                                       |
|----------|-------------------------------------|------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| prefun   | ssorgauge   sorgauge<br>  sorugauge | sorgauge when used as<br>presmoother; sorugauge<br>when used as postsmoother;<br>ssorgauge otherwise | Solver (SSOR gauge, SOR gauge, or<br>SORU gauge). |

#### **SOR VECTOR PREFUN PROPERTY**

TABLE 6-47: SOR VECTOR PREFUN PROPERTY.

| PROPERTY | VALUE                         | DEFAULT                                                                                     | DESCRIPTION                                          |
|----------|-------------------------------|---------------------------------------------------------------------------------------------|------------------------------------------------------|
| prefun   | ssorvec   sorvec  <br>soruvec | sorvec when used as presmoother;<br>soruvec when used as<br>postsmoother; ssorvec otherwise | Solver (SSOR vector, SOR vector,<br>or SORU vector). |

# *LowerLimit*

Handle lower limits for segregated steps. This feature can be added as a subfeature to a Segregated feature.

#### **SYNTAX**

model.sol(sname).feature(solv).feature(segregated).create(fname,"LowerLimit") model.sol(sname).feature(solv).feature(segregated).feature(fname).set(pname,value)

## **DESCRIPTION**

This feature controls the lower limits for variables used in segregated steps.

TABLE 6-48: VALID LOWER LIMIT PROPERTY.

| PROPERTY   | VALUE  | DEFAULT | DESCRIPTION                               |
|------------|--------|---------|-------------------------------------------|
| lowerlimit | String |         | String of variable and lower limit pairs. |

A valid lowerlimit string contains pairs of variables names and their associated lower limits. For example, to impose a lower limit of 0.25 for the value of the field u in Component 1, and a lower limit of 0.0 for the value of the field v in Component 1, use the string "comp1.u 0.25 comp1.v 0.0".

#### **SEE ALSO**

Segregated, UpperLimit

# *LumpedStep*

Handle a lumped solution step, which can be added as a subfeature to a Segregated feature.

## **SYNTAX**

```
model.sol(sname).feature(solv).feature(segregated).create(fname,"LumpedStep")
model.sol(sname).feature(solv).feature(segregated).feature(fname).set(pname,value)
```

#### **DESCRIPTION**

This feature controls one lumped solution step.

TABLE 6-49: VALID LUMPED STEP PROPERTIES.

| PROPERTY        | VALUE                            | DEFAULT | DESCRIPTION                                            |
|-----------------|----------------------------------|---------|--------------------------------------------------------|
| segcomp         | vector of strings                |         | Field/State components in step if<br>segvarspec=manual |
| segvar          | vector of strings                |         | Fields/States in step                                  |
| segvarspec      | all   manual                     | all     | Include all components or specify which manually       |
| submatrixformat | auto   sparse  <br>filled   free | auto    | Matrix format: automatic, sparse, filled, or free.     |

See SegregatedStep for more information about these properties.

# *Modal*

Solve parametric or time-dependent problem using the eigenmodal method.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Modal")
model.sol(sname).feature(fname).set(pname,pvalue)
```

## **DESCRIPTION**

Operation feature. The following properties are accepted:

TABLE 6-50: VALID MODAL PROPERTIES FOR THE MODAL SOLVER.

| PROPERTY              | VALUE                    | DEFAULT   | DESCRIPTION                                                                                                                                                          |
|-----------------------|--------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| analysistype          | frequency  <br>transient | frequency | Solve for frequency response or transient<br>response.                                                                                                               |
| atolglobal            | positive scalar          | 0.001     | Absolute tolerance when<br>atolglobalvaluemethod is set to manual.                                                                                                   |
| atolglobalfactor      | positive scalar          | 0.1       | Tolerance factor when<br>atolglobalvaluemethod is set to factor.                                                                                                     |
| atolglobalmethod      | scaled   unscaled        | scaled    | Global method for the absolute tolerance<br>when analysistype has been set to<br>transient.                                                                          |
| atolglobalvaluemethod | factor   manual          | factor    | Tolerance method if analysistype has been<br>set to transient.                                                                                                       |
| clist                 | String array             |           | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname.<br>See The clist and cname Properties. |
| cname                 | String array             |           | Provide names of constants as input<br>parameters using a string array; for the<br>corresponding constant values, use clist.<br>See The clist and cname Properties.  |
| complex               | true   false             | false     | Allow complex-valued data, if analysistype<br>has been set to transient.                                                                                             |
| constrmodes           | array of integers        |           | The constraint modes to use, if<br>constrmodeselection is set to manual.                                                                                             |
| constrmodeselection   | all   manual             | all       | The constraint modes to use.                                                                                                                                         |
| constrsol             | solution object or none  |           | The solution to use for the constraint modes.                                                                                                                        |

TABLE 6-50: VALID MODAL PROPERTIES FOR THE MODAL SOLVER.

| PROPERTY             | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                                             |
|----------------------|------------------------------------------------------------------------------------|-----------------|-------------------------------------------------------------------------------------------------------------------------|
| control              | String                                                                             | user            | Name of the controlling study step or user if<br>the feature is controlled manually.                                    |
| dampratio            | scalar   numeric vector                                                            | 0               | Damping ratios for participating modes.                                                                                 |
| eigsol               | solution object or none                                                            |                 | Precomputed eigenpairs (or other vectors) to<br>be used in the modal analysis.                                          |
| eigsoluse            | current   manual   an<br>applicable solution                                       | current         | The parametric solution to use if such a<br>solution has been set as the eigsol.                                        |
| eigsolusesolnum      | solution index                                                                     |                 | The solution index to use if eigsoluse is set<br>to manual.                                                             |
| ewtrescale           | true   false                                                                       | true            | Update scaled absolute tolerance when<br>analysistype has been set to transient.                                        |
| initialdataextend    | automatic   true  <br>false                                                        | automatic       | Extend basis with initial data when<br>analysistype has been set to transient.                                          |
| keeplog              | on   off                                                                           | off             | Keep warnings in stored log.                                                                                            |
| linearity            | false   linper                                                                     | false           | Use linear linearity or a linear perturbation<br>when analysistype has been set to<br>frequency.                        |
| linplistsolnum       | Integer array                                                                      | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to<br>from_list.                        |
| linpmanualsolnum     | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set<br>to manual.                     |
| linpmethod           | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.                                 |
| linpsol              | zero   solution object                                                             | zero            | Linearization point solution.                                                                                           |
| linpsolnum           | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1               | Indices to solutions to use as linearization<br>points.                                                                 |
| linpsoluse           | current   manual  <br>solution store tag                                           | current         | Subsolution that defines linearization point for<br>the Eigenvalue study step.                                          |
| linpsolusesolnum     | integer                                                                            |                 | Index for the solution to use when<br>linpsoluse is set to manual.                                                      |
| linpt                | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                                     |
| maxfreq              | positive scalar                                                                    | 0               | Maximum frequency if maxfreqactive is<br>true.                                                                          |
| maxfreqactive        | true   false                                                                       | false           | True to specify the maximum frequency<br>manually.                                                                      |
| maxstepbdf           | positive scalar                                                                    | 1e-1            | Maximum time step when<br>maxstepconstraintbdf is set to const.                                                         |
| maxstepconstraintbdf | auto   const   expr                                                                | auto            | Maximum time step for time-dependent<br>modal analysis: automatic (auto), constant<br>(const), or an expression (expr). |
| maxstepexpressionbdf | String                                                                             |                 | Expression for the maximum time step when<br>maxstepconstraintbdf is set to expr.                                       |

TABLE 6-50: VALID MODAL PROPERTIES FOR THE MODAL SOLVER.

| PROPERTY         | VALUE                        | DEFAULT | DESCRIPTION                                                                                                                                             |
|------------------|------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| message          | String                       |         | The log message from the last solution<br>process.                                                                                                      |
| minfreq          | positive scalar              | 0       | Minimum frequency if maxfreqactive is<br>true.                                                                                                          |
| minfreqactive    | true   false                 | false   | True to specify the minimum frequency<br>manually.                                                                                                      |
| modes            | integer vector               | all     | Participating modes.                                                                                                                                    |
| modeselection    | all   manual                 | all     | The eigenpairs to use.                                                                                                                                  |
| outsollinearized | du   u                       | du      | Store the total solution (u) or deviation and<br>linearization point (du), when analysistype<br>is set to frequency and storelinpoint is<br>set to off. |
| plist            | scalar   numeric vector      |         | Frequency list. Only applicable when<br>analysistype has been set to frequency.                                                                         |
| plistaddfreq     | numeric list                 |         | List of additional frequencies when pout is<br>set to fraction or spread.                                                                               |
| pname            | vector of strings            |         | Parameter names.                                                                                                                                        |
| pout             | plist   fraction  <br>spread | plist   | Use plist as it stands or modify in relation<br>to the participating modes.                                                                             |
| romdata          | String                       | new     | Tag of the target container for the reduced<br>model (new for a new reduced model).                                                                     |
| romReconstruct   | true   false                 | true    | Enable reconstruction in the produced<br>reduced model.                                                                                                 |
| rtol             | scalar                       | 0.01    | Relative tolerance. Only applicable when<br>analysistype has been set to transient.                                                                     |
| soltypemat       | on   off                     | off     | Store reduced-model matrices.                                                                                                                           |
| soltypeonline    | on   off                     | off     | Create a reduced model.                                                                                                                                 |
| soltypesol       | on   off                     | on      | Perform frequency sweep or transient<br>simulation using the modal solver.                                                                              |
| storelinpoint    | on   off                     | off     | Whether to store the linearization point.                                                                                                               |
| tderglobalfactor | positive scalar              | 1       | Time derivative factor when<br>tderglobalmethod is set to manual.                                                                                       |
| tderglobalmethod | auto   manual                | auto    | Derivative tolerance method when<br>analysistype has been set to transient.                                                                             |
| tlist            | scalar   numeric<br>vector   |         | Time list. Only applicable when<br>analysistype has been set to transient.                                                                              |
| tunit            | A valid time unit            | s       | Time unit. Only applicable when<br>analysistype has been set to transient.                                                                              |

In addition, the following properties are available for exporting matrices and vectors:

TABLE 6-51: VALID MODAL PROPERTIES FOR MATRIX AND VECTOR EXPORT FROM THE MODAL SOLVER.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                              |
|----------|----------|---------|----------------------------------------------------------|
| AllL     | on   off | off     | All load vectors, frequency.                             |
| B0r      | on   off | off     | Reduced initial value input matrix, transient.           |
| B0rdot   | on   off | off     | Reduced initial time derivative input matrix, transient. |
| Br       | on   off | off     | Reduced input matrix, transient and frequency.           |
| Brdot    | on   off | off     | Reduced time derivative input matrix, transient.         |

TABLE 6-51: VALID MODAL PROPERTIES FOR MATRIX AND VECTOR EXPORT FROM THE MODAL SOLVER.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                             |
|----------|----------|---------|---------------------------------------------------------|
| Brdotdot | on   off | off     | Reduced second time derivative input matrix, transient. |
| C        | on   off | off     | Output matrix (state space).                            |
| Clmap    | on   off | off     | Constraint modes to inputs map.                         |
| Cr       | on   off | off     | Reduced output matrix, transient and frequency.         |
| D        | on   off | off     | Input feedback matrix (state space).                    |
| DPartSol | on   off | off     | Damping matrix times particular solution, frequency.    |
| Dr       | on   off | off     | Reduced damping matrix, transient and frequency.        |
| Dra      | on   off | off     | Damping ratio matrix, transient and frequency.          |
| EPartSol | on   off | off     | Mass matrix times particular solution, frequency.       |
| Er       | on   off | off     | Reduced mass matrix, transient and frequency.           |
| F        | on   off | off     | Input feedback, transient and frequency.                |
| Kr       | on   off | off     | Reduced stiffness matrix, transient and frequency.      |
| Kud      | on   off | off     | Stiffness matrix times ud, transient.                   |
| L        | on   off | off     | Load vector, transient and frequency.                   |
| MA       | on   off | off     | Stiffness matrix (state space).                         |
| MB       | on   off | off     | Input matrix (state space).                             |
| Mc       | on   off | off     | Mass matrix (state space).                              |
| Pm       | on   off | off     | Projection matrix, transient and frequency.             |
| U0       | on   off | off     | Initial value vector, transient.                        |
| ud       | on   off | off     | Particular solution (state space).                      |
| Udot0    | on   off | off     | Initial derivative vector, transient.                   |
| x0       | on   off | off     | Initial value (state space).                            |
| Y0       | on   off | off     | Output bias, transient and frequency.                   |

The reduced matrices are the matrices that result from the elimination of constraints in the discretized model.

For frequency response analysis, nonconstant Neumann boundary conditions and constant Dirichlet boundary conditions are supported. The only allowed type of parameter-dependent Dirichlet boundary condition are those that can be written as a constant vector times a scalar function. The scalar function is specified via the property loadfact. For transient response analysis only constant Dirichlet boundary conditions are supported. Neumann conditions that can be written as a constant vector times a scalar function are supported for transient response (specified in a Frequency Domain, Modal or Time Dependent, Modal study step).

The property modes is index 0 based.

If pout is set to fraction the output frequencies are the ones in plist multiplied by the absolute value of the largest eigenvalue in eigsol (or some other fraction of the largest participating eigenvalue of eigsol). The purpose of this property is to be able to automatically compute the frequency response for reasonable frequencies. If pout is set to spread then plist is interpreted as an interval around each participating eigenvalue. For example, if plist is set to range(0.9,0.04,1.1) then each participating eigenvalue is multiplied by this list, and the resulting lists are concatenated into the plist that is used.

#### **REMOVED PROPERTIES**

TABLE 6-52: REMOVED PROPERTIES FOR THE MODAL SOLVER SEQUENCE FEATURE.

| PROPERTY   | REASON                                                                                 |
|------------|----------------------------------------------------------------------------------------|
| Callblevel | Given by the solver sequence attribute feature.                                        |
| soltype    | Deprecated in version 5.3 and replaced with soltypesol, soltypemat, and soltypeonline. |

# *ModalReduction*

Solve parametric or time-dependent problem using modal reduction.

#### **SYNTAX**

model.sol(sname).create(fname,"ModalReduction") model.sol(sname).feature(fname).set(pname,pvalue)

## **DESCRIPTION**

Operation feature. The following properties are accepted:

TABLE 6-53: VALID MODAL PROPERTIES FOR THE MODAL REDUCTION.

| PROPERTY            | VALUE                                | DEFAULT         | DESCRIPTION                                                                                                                                                          |
|---------------------|--------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| analysistype        | frequency  <br>transient             | frequency       | Solve for frequency response or transient<br>response.                                                                                                               |
| clist               | String array                         |                 | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname.<br>See The clist and cname Properties. |
| cname               | String array                         |                 | Provide names of constants as input<br>parameters using a string array; for the<br>corresponding constant values, use clist. See<br>The clist and cname Properties.  |
| constrmodes         | array of integers                    |                 | The constraint modes to use, if<br>constrmodeselection is set to manual.                                                                                             |
| constrmodeselection | all   manual                         | all             | The constraint modes to use.                                                                                                                                         |
| constrsol           | solution object or none              |                 | The solution to use for the constraint modes.                                                                                                                        |
| constrsoluse        | current   manual  <br>solution store | current         | Subsolution to use for the constraint modes.                                                                                                                         |
| control             | String                               | user            | Name of the controlling study step or user if<br>the feature is controlled manually.                                                                                 |
| eigensoluse         | current   manual  <br>solution store | current         | Subsolution to use for the eigenmodes.                                                                                                                               |
| eigsol              | solution object                      |                 | Precomputed eigenpairs (or other vectors) to<br>be used in the modal analysis.                                                                                       |
| initialdataextend   | automatic   true  <br>false          | automatic       | Extend basis with initial data. For automatic,<br>it is done only if it is large enough to make a<br>difference.                                                     |
| keeplog             | on   off                             | off             | Keep warnings in stored log.                                                                                                                                         |
| linearity           | false   linper                       | false           | Use linear linearity or a linear perturbation<br>when analysistype has been set to<br>frequency.                                                                     |
| linplistsolnum      | Integer array                        | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to<br>from_list.                                                                     |

TABLE 6-53: VALID MODAL PROPERTIES FOR THE MODAL REDUCTION.

| PROPERTY         | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                                                                             |
|------------------|------------------------------------------------------------------------------------|-----------------|---------------------------------------------------------------------------------------------------------------------------------------------------------|
| linpmanualsolnum | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual.                                                     |
| linpmethod       | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.                                                                 |
| linpsol          | zero   solution object                                                             | zero            | Linearization point solution.                                                                                                                           |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1               | Indices to solutions to use as linearization<br>points.                                                                                                 |
| linpsoluse       | current   manual  <br>solution store                                               | current         | Subsolution that defines linearization point for<br>the Eigenvalue study step.                                                                          |
| linpsolusesolnum | integer                                                                            |                 | Index for the solution to use when<br>linpsoluse is set to manual.                                                                                      |
| linpt            | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                                                                     |
| message          | String                                                                             |                 | The log message from the last solution<br>process.                                                                                                      |
| modes            | integer vector                                                                     | all             | Participating modes.                                                                                                                                    |
| modeselection    | all   manual                                                                       | all             | The eigenpairs to use.                                                                                                                                  |
| outsollinearized | du   u                                                                             | du              | Store the total solution (u) or deviation and<br>linearization point (du), when analysistype<br>is set to frequency and storelinpoint is<br>set to off. |
| plist            | scalar   numeric<br>vector                                                         |                 | Frequency list. Only applicable when<br>analysistype has been set to frequency.                                                                         |
| pname            | vector of strings                                                                  |                 | Parameter names.                                                                                                                                        |
| pout             | plist   fraction  <br>spread                                                       | plist           | Use plist as it stands or modify in relation to<br>the participating modes.                                                                             |
| romdata          | String                                                                             | new             | Tag of the target container for the reduced<br>model (new for a new reduced model).                                                                     |
| rominterf        | stateless  <br>stateful                                                            | stateless       | The reduced-order model interface if<br>romdata is set to new.                                                                                          |
| romReconstruct   | true   false                                                                       | true            | Enable reconstruction in the produced<br>reduced model.                                                                                                 |
| rtol             | scalar                                                                             | 0.01            | Relative tolerance. Only applicable when<br>analysistype has been set to transient.                                                                     |
| soltypemat       | on   off                                                                           | off             | Store reduced-model matrices.                                                                                                                           |
| soltypeonline    | on   off                                                                           | off             | Create a reduced model.                                                                                                                                 |
| soltypesol       | on   off                                                                           | on              | Perform frequency sweep or transient<br>simulation using the modal solver.                                                                              |
| storelinpoint    | on   off                                                                           | off             | Whether to store the linearization point.                                                                                                               |
| tlist            | scalar   numeric<br>vector                                                         |                 | Time list. Only applicable when<br>analysistype has been set to transient.                                                                              |
| usesens          | true   false                                                                       | false           | If set to true, the sensitivity solution (when<br>available) is used as constraint modes.                                                               |

In addition, the following properties are available for exporting matrices and vectors:

TABLE 6-54: VALID MODAL PROPERTIES FOR MATRIX AND VECTOR EXPORT FROM THE MODAL SOLVER.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                              |
|----------|----------|---------|----------------------------------------------------------|
| AllL     | on   off | off     | All load vectors, frequency.                             |
| B0r      | on   off | off     | Reduced initial value input matrix, transient.           |
| B0rdot   | on   off | off     | Reduced initial time derivative input matrix, transient. |
| Br       | on   off | off     | Reduced input matrix, transient and frequency.           |
| Brdot    | on   off | off     | Reduced time derivative input matrix, transient.         |
| Brdotdot | on   off | off     | Reduced second time derivative input matrix, transient.  |
| C        | on   off | off     | Output matrix (state space).                             |
| C_c      | on   off | off     | Constrained part of output matrix.                       |
| Clmap    | on   off | off     | Constraint modes to inputs map.                          |
| Cr       | on   off | off     | Reduced output matrix, transient and frequency.          |
| D        | on   off | off     | Input feedback matrix (state space).                     |
| DPartSol | on   off | off     | Damping matrix times particular solution, frequency.     |
| Dr       | on   off | off     | Reduced damping matrix, transient and frequency.         |
| Dr_c     | on   off | off     | Constrained part of damping matrix.                      |
| Dra      | on   off | off     | Damping ratio matrix, transient and frequency.           |
| Dra_c    | on   off | off     | Constrained part of damping ratio matrix.                |
| EPartSol | on   off | off     | Mass matrix times particular solution, frequency.        |
| Er       | on   off | off     | Reduced mass matrix, transient and frequency.            |
| Er_c     | on   off | off     | Constrained part of mass matrix.                         |
| F        | on   off | off     | Input feedback, transient and frequency.                 |
| Kr       | on   off | off     | Reduced stiffness matrix, transient and frequency.       |
| Kr_c     | on   off | off     | Constrained part of stiffness matrix.                    |
| Kud      | on   off | off     | Stiffness matrix times ud, transient.                    |
| L        | on   off | off     | Load vector, transient and frequency.                    |
| MA       | on   off | off     | Stiffness matrix (state space).                          |
| MA_c     | on   off | off     | Constrained part of stiffness matrix.                    |
| MB       | on   off | off     | Input matrix (state space).                              |
| Mc       | on   off | off     | Mass matrix (state space).                               |
| Mc_c     | on   off | off     | Constrained part of mass matrix.                         |
| Pm       | on   off | off     | Projection matrix, transient and frequency.              |
| U0       | on   off | off     | Initial value vector, transient.                         |
| ud       | on   off | off     | Particular solution (state space).                       |
| Udot0    | on   off | off     | Initial derivative vector, transient.                    |
| x0       | on   off | off     | Initial value (state space).                             |
| Y0       | on   off | off     | Output bias, transient and frequency.                    |

The reduced matrices are the matrices that result from the elimination of constraints in the discretized model.

For frequency response analysis, nonconstant Neumann boundary conditions and constant Dirichlet boundary conditions are supported. The only allowed type of parameter-dependent Dirichlet boundary condition are those that can be written as a constant vector times a scalar function. The scalar function is specified via the property loadfact. For transient response analysis only constant Dirichlet boundary conditions are supported. Neumann

conditions that can be written as a constant vector times a scalar function (which is specified via the property loadfact) are supported for transient response.

The property modes is index-0 based.

If pout is set to fraction the output frequencies are the ones in plist multiplied by the absolute value of the largest eigenvalue in eigsol (or some other fraction of the largest participating eigenvalue of eigsol). The purpose of this property is to be able to automatically compute the frequency response for reasonable frequencies. If pout is set to spread then plist is interpreted as an interval around each participating eigenvalue. For example, if plist is set to range(0.9,0.04,1.1) then each participating eigenvalue is multiplied by this list, and the resulting lists are concatenated into the plist that is used.

# *Optimization*

Handle optimization solver properties.

## **SYNTAX**

```
model.sol(sname).create(fname,"Optimization")
model.sol(sname).feature(fname).set(pname,value)
model.sol(sname).feature(fname).create(aname,SolverAttribute)
```

## **DESCRIPTION**

Operation feature. Use this feature to solve PDE-constrained optimization problems. The computed solution object contains the PDE solution evaluated for the optimal set of design variables. When the gradient-evaluation method is analytic, it also returns the adjoint solution.

The Optimization Module includes SNOPT and several other optimization solvers. See the *Optimization Module Manual* for details.

To add a stationary solver, substitute SolverAttribute above with StationaryAttrib. For a time-dependent solver, replace SolverAttribute with TimeAttrib.

Choosing solver is done with the following property:

TABLE 6-55: PROPERTY TO SELECT OPTIMIZATION SOLVER.

| PROPERTY  | VALUE                                                                                                | DEFAULT    | DESCRIPTION         |
|-----------|------------------------------------------------------------------------------------------------------|------------|---------------------|
| optsolver | bobyqa   cobyla  <br>coordsearch   lm  <br>mma   montecarlo  <br>neldermead  <br>snopt   ipopt   ego | neldermead | Optimization solver |

The following table includes general optimization solver properties, which a common to all optimization solvers:

TABLE 6-56: GENERAL OPTIMIZATION PROPERTIES.

| PROPERTY | VALUE        | DEFAULT | DESCRIPTION                                                                                                                                                          |
|----------|--------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clist    | String array | off     | Provide values for constants as input parameters<br>using a string array; for the corresponding<br>constant names, use cname. See The clist and<br>cname Properties. |
| cname    | String array | off     | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties.  |
| control  | String       | user    | Name of the controlling study step or user, if the<br>feature is controlled manually.                                                                                |

TABLE 6-56: GENERAL OPTIMIZATION PROPERTIES.

| PROPERTY          | VALUE                                    | DEFAULT                                                                                      | DESCRIPTION                                                                                                                               |
|-------------------|------------------------------------------|----------------------------------------------------------------------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------|
| keeplog           | on   off                                 | off                                                                                          | Keep warnings in stored log.                                                                                                              |
| message           | String                                   |                                                                                              | The log message from the last solution process.                                                                                           |
| objcontrib        | all   manual                             | all                                                                                          | Whether to use all objective contributions<br>present or specify manually (not available if<br>optsolver is lm).                          |
| opttol            | real scalar                              | 0.01                                                                                         | Optimality tolerance for derivative free<br>optimization solvers.                                                                         |
| opttolinner       | real scalar                              | 0.001                                                                                        | Optimality tolerance for gradient based<br>optimization solvers.                                                                          |
| gradientstep      | String                                   | The last study<br>step in the list<br>or none, if<br>there is no<br>supported<br>study step. | Name of the study step to use for gradient<br>computation.                                                                                |
| useseed           | on   off                                 | off                                                                                          | Random seed. Available for montecarlo.                                                                                                    |
| randseed          | integer                                  | 1000                                                                                         | Random seed. Available for montecarlo.                                                                                                    |
| nsolvemax         | integer                                  | 1000                                                                                         | Maximum number of model evaluations.                                                                                                      |
| lsqdatamethod     | manual lsq                               | manual                                                                                       | Least-squares time/parameter method. Available<br>when there are lsq objectives in the model.                                             |
| keepsol           | auto   last   all                        | auto=last                                                                                    | Keep last or all solutions for derivative free<br>optimization solvers.                                                                   |
| keepsolgb         | last   lastn  <br>everynth               | last                                                                                         | Keep last or all solutions for gradient based<br>optimization solvers.                                                                    |
| err               | on   off                                 | on                                                                                           | Stop if error. Available for derivative free<br>optimization solvers.                                                                     |
| nkeepsols         | integer                                  | 2                                                                                            | Number of solutions to save. Available for<br>gradient based optimization solvers, when<br>keepsolgb=lastn.                               |
| nskipsols         | integer                                  | 10                                                                                           | Save every Nth. Available for gradient based<br>optimization solvers, when<br>keepsolgb=everynth.                                         |
| optobj            | String array                             |                                                                                              | User defined objective expressions.                                                                                                       |
| descr             | String array                             |                                                                                              | Descriptions for used defined objective<br>expressions.                                                                                   |
| optobjEvaluateFor | String array                             |                                                                                              | Study to evaluate objective expressions for.                                                                                              |
| objectivetype     | minimization  <br>maximization           | sum                                                                                          | Determines whether the objective should be<br>minimized or maximized.                                                                     |
| multiobjective    | sum   min   max                          | sum                                                                                          | Multiple objectives. Only sum is supported for<br>gradient based optimization solvers.                                                    |
| objectivesolution | auto   first   last<br>  sum   min   max | auto                                                                                         | Solution. Handling of multiple solution vectors.<br>Only auto available for SNOPT, IPOPT, and LM.                                         |
| outersolution     | sum   min   max                          | sum                                                                                          | Outer solution. Available for derivative free<br>optimization solvers, when there are Parametric<br>Sweep study steps under Optimization. |
| objectivescaling  | init   manual  <br>none                  | none                                                                                         | Enable/disable objective scaling.                                                                                                         |
| objscaleval       | real scalar                              | 1                                                                                            | Objective scale.                                                                                                                          |

TABLE 6-56: GENERAL OPTIMIZATION PROPERTIES.

| PROPERTY                 | VALUE                          | DEFAULT                                              | DESCRIPTION                                                                                                                     |
|--------------------------|--------------------------------|------------------------------------------------------|---------------------------------------------------------------------------------------------------------------------------------|
| pname                    | String array                   |                                                      | Global parameter names to use as control<br>variables.                                                                          |
| initval                  | String array                   |                                                      | Initial values for global parameters used as control<br>variables.                                                              |
| scale                    | String array                   |                                                      | Scales for global parameters used as control<br>variables.                                                                      |
| lbound                   | String array                   |                                                      | Lower bounds for global parameters used as<br>control variables.                                                                |
| ubound                   | String array                   |                                                      | Upper bounds for global parameters used as<br>control variables.                                                                |
| constraint<br>Expression | String array                   |                                                      | Global constraint expressions.                                                                                                  |
| constraintL<br>bound     | String array                   |                                                      | Lower bounds for global constraint expressions.                                                                                 |
| constraintU<br>bound     | String array                   |                                                      | Upper bounds for global constraint expressions.                                                                                 |
| constrmethod             | penalty  <br>augLagrange       | augLagrange<br>for BOBYQA,<br>penalty for<br>others. | Constraint handling method, not available for<br>COBYLA.                                                                        |
| coefrho                  | auto   manual                  | auto                                                 | Strategy for penalty parameter rho. Available<br>when constrmethod=penalty.                                                     |
| rho                      | real scalar                    | 10                                                   | Penalty parameter rho. Available when<br>constrmethod=penalty and<br>coefrho=manual.                                            |
| tau                      | real scalar                    | 0.5                                                  | Tolerance for the penalty parameter. Available<br>when constrmethod=augLagrange.                                                |
| gamma                    | real scalar                    | 10                                                   | Multiplication factor for the penalty parameter.<br>Available when constrmethod=augLagrange.                                    |
| mu                       | real scalar                    | Max double<br>value                                  | Upper bound on Lagrange multipliers. Available<br>when constrmethod=augLagrange.                                                |
| nlagevals                | integer                        | 10                                                   | Maximum number of augmented iterations.<br>Available when constrmethod=augLagrange.                                             |
| deltachoice              | dynamic  <br>dynamic2   static | dynamic                                              | Strategy for the subsolver tolerance.                                                                                           |
| aCoef                    | real scalar                    | 2                                                    | Tolerance parameter for the subsolver. Available<br>when deltachoice=dynamic2.                                                  |
| delta                    | real scalar                    | 0.001                                                | Tolerance parameter for the subsolver. Available<br>when deltachoice=static.                                                    |
| enfdesconstr             | on   off                       | on                                                   | Enforce design constraints strictly. Available when<br>optsolver is equal to neldermead, cobyla,<br>montecarlo, or coordsearch. |
| plot                     | on   off                       | off                                                  | Enable/disable plot while solving.                                                                                              |
| plotgroup                | String                         | default                                              | Tag of the plotgroup to plot while solving.                                                                                     |
| probesel                 | all   none   manual            | all                                                  | The probes to compute while solving.                                                                                            |
| probes                   | String array                   |                                                      | Probes to use, if probesel=manual.                                                                                              |
| useobjtable              | on   off                       | on                                                   | Keep objective values in table.                                                                                                 |
| objtable                 | String                         | new                                                  | Output table to use, when useobjtable=on.                                                                                       |

TABLE 6-56: GENERAL OPTIMIZATION PROPERTIES.

| PROPERTY       | VALUE                  | DEFAULT | DESCRIPTION                                                                                                     |
|----------------|------------------------|---------|-----------------------------------------------------------------------------------------------------------------|
| showindobj     | on   off               | off     | Show individual objective values in table.                                                                      |
| plotobj        | on   off               | off     | Plot objective while solving.                                                                                   |
| window         | String                 | new     | Window to use, if plotobj=bj=on.                                                                                |
| useconstrtable | on   off               | on      | Keep values of constraints in table. Only available<br>with the derivative free optimization solvers.           |
| constrtable    | String                 | new     | Table to use, when useconstrtable=on.                                                                           |
| pdistrib       | on   off               | off     | Distribute parametric sweep. Available when<br>optsolver is equal to coordsearch,<br>neldermead, or montecarlo. |
| nparallelsolve | integer                | 1       | Maximum number of model evaluations in each<br>parametric sweep, available when pdistrib=on.                    |
| convinfo       | on   off  <br>detailed | on      | Optimization log.                                                                                               |
| keepaccumtable | on   off               | off     | Keep accumulated probe table. Available for<br>derivative free optimization solvers.                            |

When the optimization solver is set to SNOPT (snopt), the following properties are accepted:

TABLE 6-57: VALID PROPERTIES FOR OPTSOLVER SNOPT.

| PROPERTY           | VALUE                                                          | DEFAULT    | DESCRIPTION                                                                                                           |
|--------------------|----------------------------------------------------------------|------------|-----------------------------------------------------------------------------------------------------------------------|
| cendiff            | real scalar                                                    | 6e-6       | Central difference interval (only available when<br>gradientsnopt is numeric)                                         |
| difint             | real scalar                                                    | 1.5e-8     | Difference interval (only available when<br>gradientsnopt is numeric).                                                |
| feastol            | real scalar                                                    | 1e-6       | Linear constraint tolerance.                                                                                          |
| funcprec           | real scalar                                                    | 3.8e-11    | Function precision.                                                                                                   |
| gradientsnopt      | analytic  <br>numeric  <br>forward adjoint <br>forward_numeric | analytic   | Gradient/Jacobian evaluation method for<br>SNOPT.                                                                     |
| hessupd            | integer                                                        | 10         | Hessian updates.                                                                                                      |
| linesearch         | derivative  <br>nonderivative                                  | derivative | Use a derivative (gradient) or nonderivative<br>(gradient free) linesearch strategy.                                  |
| linestol           | real scalar                                                    | 0.9        | Linesearch tolerance (a value between 0 and 1).<br>A lower value gives a more accurate search.                        |
| majfeastol         | real scalar                                                    | 1e-6       | Nonlinear constraint tolerance.                                                                                       |
| manualhessupd      | on   off                                                       | off        | Whether to use the property hessupd.                                                                                  |
| manualstepcond     | on   off                                                       | off        | Whether to use manual step condition.                                                                                 |
| optobj             | String                                                         |            | Objective function that is minimized when<br>objcontrib=manual.                                                       |
| qpsolver           | cholesky   cg   qn                                             | cholesky   | QP subproblem algorithm.                                                                                              |
| snoptmaxiter       | integer                                                        | 1          | Maximum number of major iterations                                                                                    |
| snoptmaxiteractive | on   off                                                       | off        | Enable maximum major iterations.                                                                                      |
| snoptprintdir      | String                                                         |            | For log files for SNOPT, specify the directory of<br>the log file. Use the snoptprintfile to specify<br>the log file. |

TABLE 6-57: VALID PROPERTIES FOR OPTSOLVER SNOPT.

| PROPERTY         | VALUE   | DEFAULT               | DESCRIPTION                                                                                                                                                                     |
|------------------|---------|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| snoptprintfile   | String  | snoptout.txt          | For log files for SNOPT, specify the name of the<br>log file. Use the snoptprintdir to specify the<br>directory. If no name is specified, the log-file<br>name is snoptout.txt. |
| snopttotitlim    | integer | Integer.<br>MAX_VALUE | Total number of iterations in SNOPT.                                                                                                                                            |
| snoptverifylevel | integer | -1                    | Verify the objective and constraint gradients<br>using finite differences. This property takes<br>values from -1 to 3. See the User's Guide for<br>SNOPT for more information.  |
| stepcond         | String  | empty                 | Manual step condition.                                                                                                                                                          |

The property gradientsnopt is used to control if the gradient should be computed analytically (by solving the adjoint problem) or numerically. If the number of design variables is large, numerical computation of the gradient can be very time consuming. Analytic gradient is only supported when the underlying PDE problem is stationary.

If manualstepcond is set to on, the expression in the property stepcond is evaluated when new values for the design variables have been computed. If the expression becomes negative, the new values are discarded and the optimization solver reduces the step length in the current line search.

When the optimization solver is set to IPOPT (ipopt), the following properties are accepted:

TABLE 6-58: VALID PROPERTIES FOR OPTSOLVER IPOPT.

| PROPERTY                                     | VALUE                                                | DEFAULT  | DESCRIPTION                                                                                                |
|----------------------------------------------|------------------------------------------------------|----------|------------------------------------------------------------------------------------------------------------|
| evaluate_orig_ob<br>j_at_resto_trial         | on   off                                             | off      | Determines if the original objective function<br>should be evaluated at restoration phase trial<br>points. |
| expect_infeasibl<br>e_problem                | on   off                                             | off      | Enable heuristics to quickly detect an<br>infeasible problem.                                              |
| gradientipopt                                | analytic   forward  <br>adjoint  <br>forward_numeric | analytic | Gradient/Jacobian evaluation method for<br>IPOPT.                                                          |
| ipopt_acceptable<br>_iter                    | integer                                              | 15       | Number of acceptable iterates before<br>triggering termination.                                            |
| ipopt_acceptable<br>_constr_viol_tol         | real scalar                                          | 1        | Constraint violation acceptance absolute<br>tolerance factor                                               |
| ipopt_acceptable<br>_compl_inf_tol           | real scalar                                          | 1        | Complementarity conditions acceptance<br>absolute tolerance factor                                         |
| ipopt_acceptable<br>_tol_fact                | real scalar                                          | 10       | Acceptable convergence tolerance (relative).                                                               |
| ipopt_dual_inf_t<br>ol                       | real scalar                                          | 1        | Absolute tolerance on the dual infeasibility<br>factor.                                                    |
| ipopt_expect_inf<br>easible_problem_<br>ctol | real scalar                                          | 1e-2     | Threshold for disabling<br>expect_infeasible_problem option.                                               |
| ipopt_expect_inf<br>easible_problem_<br>ytol | real scalar                                          | 1e8      | Multiplier threshold for activating<br>expect_infeasible_problem option.                                   |
| ipopt_file_print<br>_level                   | integer                                              | 5        | Verbosity level for output file.                                                                           |
| ipopt_linear_sol<br>ver                      | mumps   pardiso                                      | mumps    | Linear solver used for step computations.                                                                  |

TABLE 6-58: VALID PROPERTIES FOR OPTSOLVER IPOPT.

| PROPERTY                    | VALUE       | DEFAULT      | DESCRIPTION                                                                                                                                                                     |
|-----------------------------|-------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| ipopt_mumps_mem_<br>percent | real scalar | 1000         | Percentage increase in the estimated working<br>space for MUMPS.                                                                                                                |
| ipopt_mumps_pivt<br>ol      | real scalar | 1e-6         | Pivot tolerance. Available for MUMPS.                                                                                                                                           |
| ipopt_mumps_pivt<br>olmax   | real scalar | 0.1          | Maximum pivot tolerance. Available for<br>MUMPS.                                                                                                                                |
| ipoptprintdir               | String      |              | For log files for IPOPT, specify the directory<br>of the log file. Use the ipoptprintfile to<br>specify the log file.                                                           |
| ipoptprintfile              | String      | ipoptout.txt | For log files for IPOPT, specify the name of<br>the log file. Use the ipoptprintdir to<br>specify the directory. If no name is specified,<br>the log-file name is snoptout.txt. |
| optobj                      | String      |              | Objective function that is minimized when<br>objcontrib=manual.                                                                                                                 |
| start_with_resto            | on   off    | off          | Tells algorithm to switch to restoration<br>phase in first iteration.                                                                                                           |

The property gradientipopt is used to control if the gradient should be computed analytically (by solving the adjoint problem) or numerically. If the number of design variables is large, numerical computation of the gradient can be very time consuming. Analytic gradient is only supported when the underlying PDE-problem is stationary.

When the optimization solver is set to Levenberg–Marquardt (lm), the following properties are accepted:

TABLE 6-59: VALID PROPERTIES FOR OPTSOLVER LM.

| PROPERTY        | VALUE                                                          | DEFAULT  | DESCRIPTION                                                                                                                                                                                                 |
|-----------------|----------------------------------------------------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| cendiff         | real scalar                                                    | 6e-6     | Central difference interval (only available when<br>gradientlm is numeric and gradorder is second)                                                                                                          |
| difint          | real scalar                                                    | 1.5e-8   | Difference interval (only available when gradientlm is<br>numeric and gradorder is first).                                                                                                                  |
| gammaf          | real scalar                                                    | 1        | Defect reduction tolerance factor.                                                                                                                                                                          |
| gammafactive    | on   off                                                       | off      | Terminate also for defect reduction.                                                                                                                                                                        |
| gammax          | real scalar                                                    | 1        | Control variable tolerance factor.                                                                                                                                                                          |
| gradientlm      | analytic   numeric<br>  forward   adjoint<br>  forward_numeric | analytic | Gradient/Jacobian evaluation method.                                                                                                                                                                        |
| gradorder       | first   second                                                 | first    | Approximation order of the gradient.                                                                                                                                                                        |
| lmfact          | real scalar                                                    | 1e-3     | Initial Levenberg-Marquardt factor.                                                                                                                                                                         |
| lmmaxiter       | integer                                                        | 1        | Maximum number of outer iterations.                                                                                                                                                                         |
| lmmaxiteractive | on   off                                                       | off      | Enable maximum outer iterations.                                                                                                                                                                            |
| outfsens        | on   off   onpws                                               | on       | Store functional sensitivity. onpws is equivalent to on,<br>except the sensitivity is also stored in the solution<br>while solving. This is relevant when using the results<br>while solving functionality. |

When the optimization solver is set to MMA, the following properties are accepted:

TABLE 6-60: VALID PROPERTIES FOR OPTSOLVER MMA.

| PROPERTY         | VALUE                                                          | DEFAULT  | DESCRIPTION                                                                                   |
|------------------|----------------------------------------------------------------|----------|-----------------------------------------------------------------------------------------------|
| gcmma            | on   off                                                       | on       | Use the globally convergent MMA algorithm.                                                    |
| gradientmma      | analytic   forward  <br>numeric   adjoint  <br>forward_numeric | analytic | Gradient/Jacobian evaluation method.                                                          |
| mmamaxiter       | positive integer                                               | 1        | Maximum outer iterations.                                                                     |
| mmamaxiteractive | on   off                                                       | off      | Enable maximum outer iterations.                                                              |
| mmainnmax        | positive integer                                               | 10       | Maximum inner iterations per outer iteration (only<br>for gcmma=off ).                        |
| mmagepsfactor    | real scalar                                                    | 0.1      | Internal tolerance factor.                                                                    |
| mmacfactor       | real scalar                                                    | 1000     | Constraint penalty factor.                                                                    |
| mmaghinit        | real scalar                                                    | 0.5      | Initial asymptote factor (ghinit).                                                            |
| mmaghdecr        | real scalar                                                    | 0.7      | Decreasing asymptote factor (ghdecr).                                                         |
| mmaghincr        | real scalar                                                    | 1.2      | Increasing asymptote factor (ghincr).                                                         |
| mmaasymin        | real scalar                                                    | 0.01     | Minimum asymptote level (asymin).                                                             |
| mmaasymax        | real scalar                                                    | 10       | Maximum asymptote level (asymax).                                                             |
| mmaalbefa        | real scalar                                                    | 0.1      | Bounds asymptote factor (albefa).                                                             |
| mmaxxmove        | real scalar                                                    | 0.5      | Bounds control factor (xxmove).                                                               |
| mmaraai          | real scalar                                                    | 0.00001  | Approximation increment (raai).                                                               |
| mmaraamin        | real scalar                                                    | 0.000001 | Lower approximation bound (raamin).                                                           |
| mmalsq           | on   off                                                       | on       | Automatically transform least-squares objectives<br>to constraints for efficiency.            |
| mmaminmax        | on   off                                                       | on       | Automatically transform minimax and maximin<br>problems to constraints for efficiency.        |
| movelimit        | real scalar                                                    | 0.1      | Limit the maximum absolute change of any scaled<br>control variable between outer iterations. |
| movelimitactive  | on   off                                                       | off      | Enable movelimit.                                                                             |

When the optimization solver is set to EGO, these additional properties are available:

TABLE 6-61: VALID PROPERTIES FOR OPTSOLVER EGO

| PROPERTY               | VALUE                              | DEFAULT  | DESCRIPTION                                                                                                                                                                                               |
|------------------------|------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| acquisitionmaxmethod   | direct   montecarlo                | direct   | Optimization method for acquisition<br>function.                                                                                                                                                          |
| covfunction            | se   matern32  <br>matern52   nn   | matern32 | Type of covariance function to use in the<br>Gaussian process function. Use se for<br>Squared exponential, matern32 for<br>Matérn 3/2, matern52 for Matérn 5/2<br>and nn for Single-layer neural network. |
| globalgpconstrfunction | new   Gaussian Process<br>function | new      | Constraint Gaussian process function to<br>use.                                                                                                                                                           |
| globalgpfunction       | new   Gaussian Process<br>function | new      | Gaussian process function to use.                                                                                                                                                                         |
| gpusage                | restart   continue                 | restart  | Usage: restart or continue to improve.                                                                                                                                                                    |

TABLE 6-61: VALID PROPERTIES FOR OPTSOLVER EGO

| PROPERTY              | VALUE                         | DEFAULT | DESCRIPTION                                                                                        |
|-----------------------|-------------------------------|---------|----------------------------------------------------------------------------------------------------|
| maxgpevalsacquisition | positive integer              | 10000   | Maximum surrogate evaluations for<br>optimization, if<br>acquisitionmaxmethod is set to<br>direct. |
| maxgpitersacquisition | positive integer              | 500     | Maximum number of optimization<br>iterations, if acquisitionmaxmethod<br>is set to direct.         |
| meanfunction          | const   linear  <br>quadratic | const   | Defines the overall trend of the trained<br>function(s).                                           |
| ninitsample           | positive integer              | 10      | Initial sample per control variable, if<br>gpusage is set to restart.                              |
| nmontecarlo           | positive integer              | 10000   | Surrogate evaluations for optimization, if<br>acquisitionmaxmethod is set to<br>montecarlo.        |
| restol                | double                        | 1e-16   | Resolution tolerance for the Gaussian<br>process function.                                         |

For a description of the optimization properties, see Advanced Solver Properties in the *Optimization Module User's Guide*.

TABLE 6-62: REMOVED FEMOPTIM PROPERTIES.

| PROPERTY   | REASON                        |
|------------|-------------------------------|
| Callblevel | Handled by attribute features |
| Solprop    | Handled by stationary or time |
| Solcomp    | Handled by variables          |
| Report     | Handled by variables          |
| Out        | Solution should be exported   |

# *Parametric*

Handle parameters for parameter stepping for stationary problems.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Stationary")
model.sol(sname).feature(fname).create(parname,"Parametric")
model.sol(sname).feature(fname).feature(parname).set(pname,pvalue)
```

## **DESCRIPTION**

Attribute feature.

TABLE 6-63: PARAMETRIC PROPERTIES.

| PROPERTY           | VALUE   | DEFAULT | DESCRIPTION                                                                                                           |
|--------------------|---------|---------|-----------------------------------------------------------------------------------------------------------------------|
| addsolutions       | boolean | true    | Add solution data points from the general<br>noncontinuation parameter values lists, if<br>uselsqdata is set to true. |
| continuationlsqall | boolean | true    | Use all for continuation, if uselsqdata is set to<br>true.                                                            |
| control            | String  | user    | Name of the controlling study step or user if the<br>feature is controlled manually.                                  |
| excludelsqvalues   | boolean | true    | Create bounding box from general parameter value<br>lists, if uselsqdata is set to true.                              |

TABLE 6-63: PARAMETRIC PROPERTIES.

| PROPERTY          | VALUE               | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                               |
|-------------------|---------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| initdampall       | off   on   auto     | auto    | Setting this property to on the initial damping factor<br>is used for all parameter steps.                                                                                                                                                                                                |
| paramtuning       | on   off            | off     | Setting this property to on enables the use of the<br>properties pinitstep, pmaxstep, and pminstep.                                                                                                                                                                                       |
| pcontinuationmode | no   last   manual  | last    | Determines if a continuation sweep should be<br>performed for one of the parameters in pname.                                                                                                                                                                                             |
| pcontinuation     | String              |         | For pcontinuationmode=manual this is one of the<br>parameter names from pname.                                                                                                                                                                                                            |
| pdistrib          | on   off            | off     | If the solver should distribute the parameter sweep.                                                                                                                                                                                                                                      |
| pinitstep         | positive real       |         | Initial step size for parameter. See paramtuning.                                                                                                                                                                                                                                         |
| plist             | real array          |         | List of parameter values. Obsolete, use plistarr<br>instead.                                                                                                                                                                                                                              |
| plistarr          | real matrix         |         | Lists of parameter values. One row of values for each<br>parameter name.                                                                                                                                                                                                                  |
| plooporder        | auto   manual       | auto    | Parametric values loop order. If set to auto, a more<br>efficient loop order is used if possible.                                                                                                                                                                                         |
| pmaxstep          | positive real       |         | Maximum step size for parameter. See<br>paramtuning.                                                                                                                                                                                                                                      |
| pminstep          | positive real       |         | Minimum step size for parameter. See paramtuning.                                                                                                                                                                                                                                         |
| pname             | vector of strings   |         | Parameter names.                                                                                                                                                                                                                                                                          |
| ponerror          | stop   skip   empty | stop    | Determines what the solver does when there is a<br>solver error or when the continuation backtracking<br>fails: Stop, skip the parameter with an error, or store<br>an empty solution.                                                                                                    |
| porder            | constant   linear   | linear  | Predictor order for parameter stepping.                                                                                                                                                                                                                                                   |
| pout              | plist   psteps      | plist   | When pout is set to plist, output solutions for the<br>parameters in plist. When pout is set to psteps,<br>output solutions at the parameter values chosen by<br>the solver.                                                                                                              |
| plot              | on   off            | off     | Plot while solving.                                                                                                                                                                                                                                                                       |
| plotgroup         | String              | default | Plot group to use for plot while solving.                                                                                                                                                                                                                                                 |
| preusesol         | no   yes   auto     | no      | Determines how the converged solutions are reused<br>in the parameter sweep.                                                                                                                                                                                                              |
| probefreq         | pout   psteps       | pout    | When to update probes.                                                                                                                                                                                                                                                                    |
| probes            | array of strings    |         | Probes to use when probesel=manual.                                                                                                                                                                                                                                                       |
| probesel          | all   none   manual | all     | The probes to compute.                                                                                                                                                                                                                                                                    |
| pwork             | integer             | 1       | Maximum number of distributed groups.                                                                                                                                                                                                                                                     |
| pworkactive       | on   off            | off     | Divide distributed parametric sweep work into<br>distributed groups.                                                                                                                                                                                                                      |
| sweeptype         | sparse   filled     | sparse  | Method for doing the parameter variation. For<br>sweeptype=sparse, the parameter tuples defined<br>by the columns in plistarr are solved for. This<br>method requires equal length for the rows. For<br>sweeptype=filled, all parameter combinations<br>given by plistarr are solved for. |

TABLE 6-63: PARAMETRIC PROPERTIES.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                                                                         |
|-------------|----------|---------|-------------------------------------------------------------------------------------|
| useloadcase | on   off | off     | Define load cases.                                                                  |
| uselsqdata  | boolean  | true    | Use parameters from least-squares objectives<br>(requires the Optimization Module). |

# *PlugFlow*

Solve a stationary plug flow problem.

#### **SYNTAX**

model.sol(sname).create(fname,"PlugFlow")

## **DESCRIPTION**

This solver is a version of the Time-Dependent Solver (see Time). The difference being that it steps in volume instead of time. The available properties are those given in Table 6-74, where the word *time* in the Description column should be understood as *volume*.

# *ProperOrthogonalDecomposition*

Solve frequency-domain or time-dependent problem using POD (proper orthogonal decomposition) reduction.

#### **SYNTAX**

model.sol(sname).create(fname,"ProperOrthogonalDecomposition") model.sol(sname).feature(fname).set(pname,pvalue)

## **DESCRIPTION**

Operation feature. The following properties are accepted:

TABLE 6-64: VALID MODAL PROPERTIES FOR THE POD REDUCTION.

| PROPERTY            | VALUE                        | DEFAULT   | DESCRIPTION                                                                                                                                                          |
|---------------------|------------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| analysistype        | frequency  <br>transient     | transient | Solve for frequency response or transient<br>response.                                                                                                               |
| clist               | String array                 |           | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname.<br>See The clist and cname Properties. |
| cname               | String array                 |           | Provide names of constants as input<br>parameters using a string array; for the<br>corresponding constant values, use clist.<br>See The clist and cname Properties.  |
| constrmodes         | array of integers            |           | The constraint modes to use, if<br>constrmodeselection is set to manual.                                                                                             |
| constrmodeselection | all   manual                 | all       | The constraint modes to use.                                                                                                                                         |
| constrsol           | solution object or none      |           | The solution to use for the constraint<br>modes.                                                                                                                     |
| control             | String                       | user      | Name of the controlling study step or user<br>if the feature is controlled manually.                                                                                 |
| groupmethod         | one   individual  <br>manual | one       | Variable grouping method for training<br>solution: one group, one group per<br>variable, or manual.                                                                  |
| keeplog             | on   off                     | off       | Keep warnings in stored log.                                                                                                                                         |

TABLE 6-64: VALID MODAL PROPERTIES FOR THE POD REDUCTION.

| PROPERTY                | VALUE                              | DEFAULT   | DESCRIPTION                                                                                      |
|-------------------------|------------------------------------|-----------|--------------------------------------------------------------------------------------------------|
| linearity               | false   linper                     | false     | Use linear linearity or a linear perturbation<br>when analysistype has been set to<br>frequency. |
| plist                   | scalar   numeric<br>vector         |           | Frequency list. Only applicable when<br>analysistype has been set to<br>frequency.               |
| pname                   | vector of strings                  |           | Parameter names.                                                                                 |
| podtrainingsol          | String                             |           | Solution selection for POD training.                                                             |
| podtrainingsoluse       | current   manual  <br>solution tag | current   | POD training solution to use.                                                                    |
| podtrainingsolusesolnum | integer                            |           | Index of the POD solution to use, when<br>podtrainingsoluse is set to manual.                    |
| punit                   | String                             | s         | Parameter unit. Only applicable when<br>analysistype has been set to<br>frequency.               |
| romdata                 | String                             | new       | Tag of the target container for the reduced<br>model (new for a new reduced model).              |
| rominterf               | stateless  <br>stateful            | stateless | The reduced-order model interface if<br>romdata is set to new.                                   |
| romReconstruct          | true   false                       | true      | Enable reconstruction in the produced<br>reduced model.                                          |
| rtol                    | scalar                             | 0.01      | Relative tolerance. Only applicable when<br>analysistype has been set to<br>transient.           |
| tlist                   | scalar   numeric<br>vector         |           | Time list. Only applicable when<br>analysistype has been set to<br>transient.                    |
| truncationrtol          | double                             | 0.01      | The relative truncation tolerance.                                                               |
| tunit                   | String                             | s         | Time unit. Only applicable when<br>analysistype has been set to<br>transient.                    |

# *Previous Solution*

Compute solutions for previous parametric solution parameters and previous time-dependent solution parameters.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Stationary")
model.sol(sname).feature(fname).create(parname,"Parametric")
model.sol(sname).feature(fname).feature(parname).create(psname,"PreviousSolution")
model.sol(sname).feature(fname).feature(parname).feature(psname).set(pname,pvalue)
model.sol(sname).create(fname, "Time");
model.sol(sname).feature(fname).create(psname, "PreviousSolution");
model.sol(sname).feature(fname).feature(psname).set(pname, pvalue);
```

## **DESCRIPTION**

Attribute feature. After the solver has converged for a parameter step or a time step, the previous components are solved for in a separate solver step. These components are held fixed (not solved for) during the normal solver procedure.

Handle the segregated solution approach.

#### **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"Segregated")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
model.sol(sname).feature(solv).feature(fname).feature(fname2).set(pname,value)
```

#### **DESCRIPTION**

This feature can be used as an attribute for the Time and Stationary features. The approach taken is nonlinear Uzawa iterations in which user-defined groups of variables are solved for separately (a segregated step) while other variables are held fixed. The segregated steps for the segregated solver is handled by subattributes of the sort of SegregatedStep, LumpedStep, LowerLimit, and UpperLimit.

The Segregated attribute supports the following properties (of which the ones that start with sub are properties for segregated steps);

TABLE 6-65: VALID SEGREGATED PROPERTIES.

| PROPERTY        | VALUE                         | DEFAULT        | DESCRIPTION                                                                                                                                                                          |
|-----------------|-------------------------------|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| maxsegiter      | positive integer              | 100, 25 (Time) | Maximum number of segregated iterations.                                                                                                                                             |
| ntolfact        | positive scalar               | 1              | Tolerance factor.                                                                                                                                                                    |
| plot            | on   off                      | off            | Plot while solving.                                                                                                                                                                  |
| plotgroup       | String                        | default        | Plot group to use for plot while solving.                                                                                                                                            |
| probesel        | all   none   manual           | all            | The probes to compute.                                                                                                                                                               |
| probes          | array of strings              |                | Probes to use when probesel=manual.                                                                                                                                                  |
| ratelimit       | positive scalar               | 1 (Time)       | Limit on nonlinear convergence rate.                                                                                                                                                 |
| ratelimitactive | on   off                      | off, on (Time) | Use limit on nonlinear convergence rate.                                                                                                                                             |
| segaaccdim      | positive integer              | 10             | Dimension of Anderson iteration space when<br>segstabacc = segaacc.                                                                                                                  |
| segiter         | positive integer              | 1              | Fixed number of segregated iterations.                                                                                                                                               |
| segreserrfact   | positive scalar               | 1000           | Residual factor when segtermonres is set to<br>auto or both (for stationary solvers).                                                                                                |
| segstabacc      | none   segclfcmp  <br>segaacc | none           | Stabilization and acceleration: None, pseudo time<br>stepping (for stationary solvers), or Anderson<br>acceleration.                                                                 |
| segterm         | iter   tol  <br>itertol       | tol            | Segregated solver termination technique.                                                                                                                                             |
| segtermonres    | off   on   auto  <br>both     | auto/off       | Termination criterion: Solution, residual, solution<br>or residual, or solution and residual. The default is<br>auto for stationary problems but off for<br>time-dependent problems. |
| segaaccdelay    | nonnegative integer           | 0              | Number of iterations between pseudo time<br>stepping becomes inactive and Anderson<br>acceleration becomes active when segstabacc =<br>segaacc.                                      |
| segaaccdim      | positive integer              | 10             | Dimension of Anderson iteration space when<br>segstabacc = segaacc.                                                                                                                  |
| segaaccmix      | scalar 0–1                    | 1              | Mixing parameter when segstabacc = segaacc.                                                                                                                                          |

TABLE 6-65: VALID SEGREGATED PROPERTIES.

| PROPERTY         | VALUE               | DEFAULT      | DESCRIPTION                                                                                                                                       |
|------------------|---------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| segcflaadelay    | nonnegative integer | 0            | Number of iterations between pseudo time<br>stepping becomes inactive and Anderson<br>acceleration becomes active when segstabacc =<br>segcflcmp. |
| segcflaafact     | nonnegative scalar  | 1            | Threshold for Anderson step for pseudo time<br>stepping.                                                                                          |
| segcflaacfl      | positive scalar     | 100          | CFL threshold when segstabacc = segcflcmp.                                                                                                        |
| segcflaadim      | positive integer    | 10           | Dimension of Anderson iteration space when<br>segstabacc = segcflcmp.                                                                             |
| segcflaamix      | scalar 0–1          | 1            | Mixing parameter when segstabacc =<br>segcflcmp.                                                                                                  |
| segcflaaset      | pid   lock          | pid          | Above the CFL threshold, use the PID controller<br>or lock to the target CFL number.                                                              |
| segcfljtech      | true   false        | false        | Override Jacobian update for step when<br>segstabacc = segcflcmp.                                                                                 |
| segcfljtechval   | onfirst   minimal   | onfirst      | Jacobian update on first iteration or minimal when<br>segstabacc = segcflcmp and segcfljtech =<br>true.                                           |
| segjtechcfl      | positive scalar     | 100          | CFL threshold for Jacobian update when<br>segstabacc = segcflcmp and segcfljtech =<br>true.                                                       |
| subcfltol        | positive scalar     | 0.1          | Target error estimate for pseudo time stepping.                                                                                                   |
| subforcecfl      | boolean             | true         | Limit to target CFL number for pseudo time<br>stepping.                                                                                           |
| subinitcfl       | positive scalar     | 5.0          | Initial CFL number for pseudo time stepping.                                                                                                      |
| subkdpid         | positive scalar     | 0.05         | PID controller - derivative for pseudo time<br>stepping.                                                                                          |
| subkipid         | positive scalar     | 0.05         | PID controller - integral for pseudo time stepping.                                                                                               |
| subkppid         | positive scalar     | 0.65         | PID controller - proportional for pseudo time<br>stepping.                                                                                        |
| submincfl        | positive scalar     | 10000        | Target CFD number for pseudo time stepping.                                                                                                       |
| useheuristicfact | boolean             | false (Time) | Use pre-6.2 linear heuristic for adaptive tolerance.                                                                                              |

Termination of the segregated solver is controlled by the property segterm. The default setting is tol, in which case the segregated iterations are terminated when, for each group, the estimated error is below the corresponding tolerance set by the main tolerance for the parent solver multiplied with the nonlinear tolerance factor ntolfact. However, a maximum number of allowed segregated iterations is chosen through the property maxsegiter; if the maximum is reached, the iterations are terminated and an error message is displayed. Termination after a fixed number of segregated iterations is achieved by instead choosing iter. The number of segregated iterations is controlled by the property segiter. The third available option for segterm is itertol, which is a combination of the other two options; the segregated iterations are terminated when one of the two convergence criteria of tol and iter is met. The property maxsegiter is only supported when tol is used for termination. For both the settings iter and itertol, the number of iterations is controlled by the property segiter.

The nonlinear solver uses an adaptive tolerance for termination of iterative linear system solvers. This adaptive tolerance is based on the maximum of ntol and itol. During the nonlinear iterations, it can, however, be larger or smaller than this number. The segregated solver uses the same tolerance as the linear solver when constant damping is used. However, when automatically adjusted damping is used, the adaptive tolerance of the nonlinear solver is used. The parametric solver uses the same tolerance as the corresponding stationary solver.

The property segstabacc enables or disables pseudo time stepping (for stationary problems) or Anderson acceleration. When enabled the pseudo time stepping is controlled by the scalar-valued controller parameters subcfltol, subinitcfl, subkdpid, subkipid, and subkppid. For the Anderson acceleration, the parameter segaaccdim specifies the dimension of the Anderson iteration space.

The property segtermonres controls the termination criterion for stationary problems when segterm is not iter. When segtermonres=off the estimated error is solution based, with segtermonres=on it is based on a relative residual and for segtermonres=auto the estimated error is the minimum of the solution and residual based errors. For segtermonres=auto the property segreserrfact is a scalar factor multiplying the relative residual error. For subtermonres=both, both methods are used.

#### **COMPATIBILITY**

The property subusecflcmp from earlier versions of COMSOL Multiphysics is not used in version 5.0 and later versions. Use the property segstabacc instead.

#### **SEE ALSO**

LowerLimit, LumpedStep, SegregatedStep, UpperLimit

# *SegregatedStep*

Handle a segregated solution step, which can be added as a subfeature to a Segregated feature.

#### **SYNTAX**

```
model.sol(sname).feature(solv).feature(segregated).create(fname,"SegregatedStep")
model.sol(sname).feature(solv).feature(segregated).feature(fname).set(pname,value)
model.sol(sname).feature(solv).feature(segregated).feature(fname).feature(sname).
  set(pname,value)
```

#### **DESCRIPTION**

This feature controls one segregated solution step.

TABLE 6-66: VALID SEGREGATED STEP PROPERTIES.

| PROPERTY    | VALUE               | DEFAULT | DESCRIPTION                                                                                   |
|-------------|---------------------|---------|-----------------------------------------------------------------------------------------------|
| linsolver   | linear solver tag   |         | Linear solver to use.                                                                         |
| maxsubiter  | integer             | 20      | Maximum number of substep iterations.                                                         |
| segcomp     | vector of strings   |         | Field/State components in step if<br>segvarspec=manual.                                       |
| segvar      | vector of strings   |         | Fields/States in step.                                                                        |
| segvarspec  | all   manual        | all     | Include all components or specify which<br>manually.                                          |
| subaacc     | boolean             | false   | Use Anderson acceleration, when<br>subdtech is set to const or bcktrack.                      |
| subaccdelay | nonnegative integer | 0       | Iteration delay for Anderson acceleration.                                                    |
| subaaccdim  | positive integer    | 10      | Dimension of iteration space for Anderson<br>acceleration.                                    |
| subaaccfact | nonnegative scalar  | 1       | Threshold for Anderson step.                                                                  |
| subaaccmix  | scalar (0–1)        | 1       | Mixing parameter for Anderson<br>acceleration.                                                |
| subadapttol | boolean             | false   | Use adaptive tolerance in the linear solver,<br>when subdtech is set to const or<br>bcktrack. |

TABLE 6-66: VALID SEGREGATED STEP PROPERTIES.

| PROPERTY             | VALUE                                                                           | DEFAULT          | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                               |
|----------------------|---------------------------------------------------------------------------------|------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| subadapttolcflweight | boolean                                                                         | true             | Apply CFL weighting for pseudo time<br>stepping and if subadapttol is set to<br>true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| subadapttolerrweight | boolean                                                                         | true             | Apply nonlinear error weighting for models<br>that do not use pseudo time stepping and if<br>subadapttol is set to true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                  |
| subatolchoice        | fullerrorest  <br>partialerrorest<br>  nonlinresidual<br>  onlycfl  <br>onlyerr | fullerro<br>rest | The error estimation method to use if<br>subadapttol is set to true.<br>fullerrorest uses the full information<br>about the linear and nonlinear error<br>estimates to determine the tolerance.<br>partialerrorest uses partial information<br>about the linear and nonlinear error<br>estimates to determine the tolerance.<br>nonlinresidual uses the nonlinear<br>residual only to determine the tolerance.<br>onlycfl applies CFL suppression to the<br>initial tolerance for models using pseudo<br>time stepping. onlyerr applies a<br>suppression mechanism based on the<br>nonlinear error estimate for models with a<br>stationary solver and not using pseudo time<br>stepping. |
| subatolthreshold     | positive value, 0–1                                                             | 0.1              | The threshold for using the safeguards<br>when determining the tolerance. The higher<br>the value, the faster the safeguards get<br>disabled. Only available when<br>subadapttol is set to true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| subbackdampstep      | scalar (0–1)                                                                    | 0.5              | Damping in one step, when subdtech is set<br>to bcktrack and subbackmethod is set to<br>conststep.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        |
| subbackmethod        | fullest  <br>conststep                                                          | fullest          | Backtracking method when subdtech is set<br>to bcktrack: full estimation or constant<br>step.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| subbacktrackonce     | boolean                                                                         | false            | Backtrack at least once when subdtech is<br>set to bcktrack and subbackmethod is<br>set to fullest.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| subdamp              | real                                                                            | 1.0              | Substep damping factor.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                   |
| subdampexponent      | real scalar (1–2)                                                               | 2                | Damping exponent, if subatolchoice is<br>set to nonlinresidual.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                           |
| subdampfactor        | real scalar (0–1)                                                               | 1                | Damping factor, if subatolchoice is set to<br>nonlinresidual.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                             |
| subddoginitdamp      | nonnegative scalar                                                              | 1                | Initial damping factor for subdtech set to<br>ddog.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| subddogrestart       | positive integer                                                                | 7                | Number of iterations before restart for<br>subdtech set to ddog.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
| subdtech             | const   auto  <br>bcktrack   hnlin  <br>ddog                                    | const            | Substep damping technique.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                |
| subetamax            | scalar (0–1)                                                                    | 0.9              | Maximal tolerance, if subadapttol is set<br>to true.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                      |

TABLE 6-66: VALID SEGREGATED STEP PROPERTIES.

| PROPERTY               | VALUE                                 | DEFAULT            | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                             |
|------------------------|---------------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| subinitstep            | real                                  | 1                  | Substep initial damping factor for when<br>subdtech set to auto.                                                                                                                                                                                                                                                                                                                                        |
| subinitsteph           | real                                  | 1e-4               | Substep initial damping factor when<br>subdtech set to hnlin.                                                                                                                                                                                                                                                                                                                                           |
| subiter                | integer                               | 1                  | Substep iterations.                                                                                                                                                                                                                                                                                                                                                                                     |
| subjtech               | minimal   once  <br>onfirst   onevery | see below          | Substep Jacobian update technique when<br>subdtech is set to const or bcktrack.                                                                                                                                                                                                                                                                                                                         |
| submatrixformat        | auto   sparse  <br>filled   free      | auto               | Matrix format: automatic, sparse, filled, or<br>free.                                                                                                                                                                                                                                                                                                                                                   |
| submaxdamp             | scalar (0, 1]                         | 1.0                | The maximum damping factor. If<br>backtracking returns a damping larger than<br>this value, submaxdamp is used. Available<br>only if subdtech is set to bcktrack.                                                                                                                                                                                                                                       |
| submindamp             | positive scalar                       | 0.1                | Substep minimum damping factor when<br>subdtech is set to bcktrack.                                                                                                                                                                                                                                                                                                                                     |
| subminstep             | real                                  | 1e-4               | Substep minimum damping factor when<br>subdtech is set to auto.                                                                                                                                                                                                                                                                                                                                         |
| subminsteph            | real                                  | 1e-8               | Substep minimum damping factor when<br>subdtech is set to hnlin.                                                                                                                                                                                                                                                                                                                                        |
| subntolfact            | real                                  | 10                 | Substep tolerance factor.                                                                                                                                                                                                                                                                                                                                                                               |
| subrelaxationressmooth | positive scalar                       | 0.2                | Relaxation factor, if subressmooth is set<br>to true.                                                                                                                                                                                                                                                                                                                                                   |
| subreserrfact          | positive scalar                       | 100                | Residual factor when subtermonres is set<br>to auto or both.                                                                                                                                                                                                                                                                                                                                            |
| subresscale            | scalefieldwise  <br>scaleuniform      | scalefieldwi<br>se | Residual scaling technique for subdtech set<br>to ddog.                                                                                                                                                                                                                                                                                                                                                 |
| subressmooth           | boolean                               | false              | Add residual smoothing.                                                                                                                                                                                                                                                                                                                                                                                 |
| subrstep               | real                                  | 10                 | Substep restrictions for step-size update.                                                                                                                                                                                                                                                                                                                                                              |
| subtermconst           | iter   tol  <br>itertol               | iter               | Substep termination technique when<br>subdtech is set to const or bcktrack.                                                                                                                                                                                                                                                                                                                             |
| subtermauto            | tol   itertol                         | itertol            | Substep termination technique when<br>subdtech is set to auto or hnlin.                                                                                                                                                                                                                                                                                                                                 |
| subtermonres           | off   on   auto  <br>both             | auto/off           | Termination criterion: Solution, residual,<br>solution or residual, or solution and<br>residual. The default is auto for stationary<br>problems but off for time-dependent<br>problems.                                                                                                                                                                                                                 |
| subupdweights          | boolean                               | true               | Update automatic scale factors in weights<br>when subdtech is set to const or<br>bcktrack.                                                                                                                                                                                                                                                                                                              |
| subupdweightsauto      | true   false  <br>wthresh             | true               | Updates the weights for automatic scales if<br>they change two orders of magnitude and<br>then restart the Newton solver from the<br>current solution if true. If set to wthresh,<br>you can use thresholds for the weights. All<br>updweights properties are available for<br>stationary and parametric studies and for<br>Newton solvers only (that is, subdtech is<br>not ddog, bcktrack, or const). |

TABLE 6-66: VALID SEGREGATED STEP PROPERTIES.

| PROPERTY                  | VALUE            | DEFAULT | DESCRIPTION                                                                                                                                                      |
|---------------------------|------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| subupdweightsdamp         | current   manual | current | Available if subupdweightsauto is<br>wthresh. Use fraction of the current<br>damping factor at update (current) or a<br>constant update damping factor (manual). |
| subupdweightsdampval      | positive scalar  | 1       | Fraction of current damping factor. If<br>subupdweightsauto is wthresh and<br>subupdweightsdamp is current.                                                      |
| subupdweightsdampvalconst | positive scalar  | 0.1     | Update damping factor. If<br>subupdweightsauto is wthresh and<br>subupdweightsdamp is manual.                                                                    |
| subupdweightsfac          | scalar           | 100     | Weights threshold factor for update. If<br>subupdweightsauto is wthresh.                                                                                         |

The fields/states to include in the step are defined through the property segvar. The property segvarspec controls which components of the fields/states in segvar to include in the step. By default segvarspec is all, in which case all components in the fields/states of segvar are included. By setting segvarspec to manual, a subset of the fields/states of segvar can be included in the step. The components to include in the step are then defined through the property segcomp.

Analogously, the property subterm controls how each substep is terminated through the properties maxsubiter, subiter, and subntol/subntolfact for a stationary or time-dependent problem.

The damping technique used in each substep is controlled by the property subdtech. The default setting is const, which means that damped Newton iterations with a fixed damping factor is used. The damping factor is set in the property subdamp. The other available damping technique is autodamp in which case the damping factor is automatically adjusted. For substeps which uses autodamp, four other properties are supported: subhnlin, subinitstep, subminstep, and subrstep. For each substep, these properties set the properties hnlin, initstep, minstep, and rstep supported by the nonlinear solver, see FullyCoupled.

In substeps with subdtech=const or bcktrack, the property subjtech controls how often the Jacobian is updated. The values minimal, once, and onevery give the same Jacobian update techniques as they do when applied to the coupled solver through the property jtech; see FullyCoupled. The value onfirst makes the solver update the Jacobian of the substep on the first subiteration each time the substep is solved for. Default value is onevery for stationary problems and minimal for time-dependent problems.

When subdtech is set to ddog (stationary problems), the double dogleg solver is used. The initial damping factor is controlled by the property subddoginitdamp and the property subresscale controls the residual scaling. The option resscale=scalefieldwise scales the equations based on the field-wise sizes of the initial residual. When the option subresscale=scaleuniform is selected the algorithm terminates on the relative residual based on the initial residual.

The property subtermonres controls the termination criterion for stationary problems when segterm is not iter. When subtermonres=off the estimated error is solution based, with subtermonres=on it is based on a relative residual, and for subtermonres=auto the estimated error is the minimum of the solution and residual based errors. For subtermonres=auto the property subreserrfact is a scalar factor multiplying the relative residual error. For subtermonres=both, both methods are used.

# *Sensitivity*

Handle sensitivity solver parameters.

#### **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"Sensitivity")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
```

#### **DESCRIPTION**

Attribute feature. This feature can be used to make analytic forward or backward (adjoint) sensitivity analysis. This analysis is done after the main problem has converged. The solution approach (coupled or segregated, Jacobians, and so on) for the main problem is reused.

TABLE 6-67: VALID SENSITIVITY PROPERTIES.

| PROPERTY   | VALUE                                 | DEFAULT | DESCRIPTION                          |
|------------|---------------------------------------|---------|--------------------------------------|
| sensfunc   | String                                |         | Sensitivity functional variable name |
| sensmethod | none   adjoint   forward<br>  numeric | none    | Sensitivity analysis method          |

The forward numeric method (numeric) is a variant of the forward sensitivity method where the right-hand side of the sensitivity problem is computed by numerical differentiation.

# *StatAcceleration*

Handle stationary acceleration for nonlinear problems with time-periodic stationary solution.

## **SYNTAX**

model.sol(sname).feature(solv).create(fname,"StatAcceleration")

## **DESCRIPTION**

This feature can added as a subfeature to the Time-Dependent Solver and the Time Discrete Solver. Instead of time marching the problem from start to finish, the Stationary Acceleration node solves for a number of periods and then extrapolates the solution forward in time based on the average solution and the average time derivative. This solution process is repeated until the average time derivative has reached steady state.

TABLE 6-68: VALID PROPERTIES FOR STATACCELERATION.

| PROPERTY       | VALUE             | DEFAULT    | DESCRIPTION                                                                    |
|----------------|-------------------|------------|--------------------------------------------------------------------------------|
| acccomp        | vector of strings |            | Variable components to use stationary acceleration on<br>if accvarspec=manual. |
| accvar         | vector of strings |            | Variables to use stationary acceleration on.                                   |
| accvarspec     | all   manual      | all        | Include all components or specify which manually.                              |
| stataccfreq    | String            | 13.56[MHz] | Frequency of periodic solution.                                                |
| statacctol     | double            | 0.01       | Stationary tolerance.                                                          |
| stataccnperext | integer           | 50         | Number of extrapolation cycles.                                                |
| stataccnperavg | integer           | 5          | Number of period averaging cycles.                                             |
| stataccsmooth  | integer           | 10         | Number of smoothing cycles.                                                    |

# *StateSpace*

Assemble and store matrices that describe a model as a dynamic system.

#### **SYNTAX**

```
model.sol(sname).create(fname,"StateSpace")
model.sol(sname).feature(fname).set(pname,value)
model.sol(sname).feature(fname).getSparseMatrixVal(mname)
model.sol(sname).feature(fname).getSparseMatrixValImag(mname)
model.sol(sname).feature(fname).getSparseMatrixRow(mname)
model.sol(sname).feature(fname).getSparseMatrixCol(mname)
model.sol(sname).feature(fname).getVector(vname)
model.sol(sname).feature(fname).getVectorImag(vname)
model.sol(sname).feature(fname).getSparseMatrixValBlock(mname,start,stop)
model.sol(sname).feature(fname).getSparseMatrixValImagBlock(mname,start,stop)
model.sol(sname).feature(fname).getSparseMatrixRowBlock(mname,start,stop)
model.sol(sname).feature(fname).getSparseMatrixColBlock(mname,start,stop)
model.sol(sname).feature(fname).getVectorBlock(vname,start,stop)
model.sol(sname).feature(fname).getVectorImagBlock(vname,start,stop)
model.sol(sname).feature(fname).isReal(mname)
model.sol(sname).feature(fname).getM(mname)
model.sol(sname).feature(fname).getN(mname)
```

#### **DESCRIPTION**

State-space feature.

TABLE 6-69: VALID STATESPACE PROPERTIES.

| PROPERTY | VALUES       | DEFAULT | DESCRIPTION                                 |
|----------|--------------|---------|---------------------------------------------|
| input    | String array |         | The input parameters that affect the model. |
| output   | String array |         | The output expressions.                     |
| static   | on   off     | on      | Static linearized model.                    |
| Mc       | on   off     | off     | Assemble the Mc matrix.                     |
| MA       | on   off     | off     | Assemble the McA matrix.                    |
| MB       | on   off     | off     | Assemble the McB matrix.                    |
| C        | on   off     | off     | Assemble the C matrix.                      |
| D        | on   off     | off     | Assemble the D matrix.                      |
| Null     | on   off     | off     | Assemble the Null matrix.                   |
| ud       | on   off     | off     | Assemble the ud vector.                     |
| x0       | on   off     | off     | Assemble the initial data.                  |

The state-space feature assembles matrices that describe a model as a dynamic system when Static is off.

$$Mc\dot{x} = McAx + McBu$$
$$y = Cx + Du$$

In the case when Static is on a static linearized model of the system is described by

$$y = (D - C(McA)^{-1}McB)u$$

Let *Null* be the PDE constraint null-space matrix and *ud* a particular solution fulfilling the constraints. The solution vector *U* for the problem can then be written

$$U = \text{Null}x + ud + u0$$

where *u*0 is the linearization point, which is determined by the current solution (that is, the solution computed by the previous feature in the sequence). The previous feature can, for example, be a solver or a Dependent Variable node. The Dependent Variable node gives control over which variables to solve for (compute the matrices for). The input linearization point is stored in the sequence after the state-space feature is run.

The input parameters input should contain all parameters that are of interest as input to the model. The output expressions output should contain a list of all expressions that are to be evaluated as output from the model.

# *Stationary*

Solve a stationary problem with or without parameters, mesh adaptation, sensitivity, or optimization.

## **SYNTAX**

```
model.sol(sname).create(fname,"Stationary")
model.sol(sname).feature(fname).set(pname,value)
```

## **DESCRIPTION**

Operation feature.

The following properties are available.

TABLE 6-70: STATIONARY PROPERTIES.

| PROPERTY         | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                                                                                          |
|------------------|------------------------------------------------------------------------------------|-----------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clist            | String array                                                                       |                 | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname. See<br>The clist and cname Properties. |
| cname            | String array                                                                       |                 | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties.  |
| control          | String                                                                             | user            | Name of the controlling study step or user if<br>the feature is controlled manually.                                                                                 |
| keeplog          | on   off                                                                           | off             | Keep warnings in stored log.                                                                                                                                         |
| keepnotsolstatic | on   off                                                                           | off             | Used in Fatigue analysis to store all solnums<br>from the source solution in the Fatigue solution<br>object (default value is on for Fatigue analysis).              |
| linplistsolnum   | Integer array                                                                      | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to from_list.                                                                        |
| linpmanualsolnum | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual.                                                                  |
| linpmethod       | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.                                                                              |
| linpsol          | zero   solution object                                                             | zero            | Linearization point solution.                                                                                                                                        |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | auto            | Indices to solutions to use as linearization<br>points. The default value from a default solver is<br>case dependent.                                                |
| linpsoluse       | current   manual  <br>solution store tag                                           | current         | Linearization point solution to use. The<br>solution store can be all solution objects that<br>can be found in the solver sequence set by the<br>linpsol property.   |
| linpsolusesolnum | integer                                                                            |                 | Index for the solution to use when<br>linpsoluse is set to manual.                                                                                                   |
| linpt            | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                                                                                  |

TABLE 6-70: STATIONARY PROPERTIES.

| PROPERTY         | VALUE                          | DEFAULT | DESCRIPTION                                                                                                                                 |
|------------------|--------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------|
| listsolnum       | vector of integers             | {1}     | Indices to solutions to use as linearization<br>points when linpsolnum is set to<br>from_list.                                              |
| lumpedflux       | on   off                       | off     | Use lumping when computing fluxes.                                                                                                          |
| manualsolnum     | vector of positive<br>integers |         | Identifies the solutions used when linpsolnum<br>is set to manual.                                                                          |
| nonlin           | auto   on   off <br>linper     | auto    | Use the nonlinear solver.                                                                                                                   |
| message          | String                         |         | The log message from the last solution process.                                                                                             |
| outsollinear     | du   u                         | u       | Store the total solution (u) or deviation and<br>linearization point (du), when nonlin is set to<br>off and storelinpoint is set to off.    |
| outsollinearized | du   u                         | du      | Store the total solution (u) or deviation and<br>linearization point (du), when nonlin is set to<br>linper and storelinpoint is set to off. |
| plot             | on   off                       | off     | Whether to plot while solving.                                                                                                              |
| plotgroup        | String                         | default | Name of plot group for plot while solving.                                                                                                  |
| probes           | vector of strings              |         | Probes to use if probesel=manual.                                                                                                           |
| probesel         | all   none   manual            | all     | The probes to compute.                                                                                                                      |
| reacf            | on   off                       | on      | Compute reaction forces.                                                                                                                    |
| stol             | positive real                  | 1e-3    | Relative tolerance, if control is set to user.                                                                                              |
| storelinpoint    | on   off                       | off     | Whether to store the linearization point.                                                                                                   |
| t                | real                           | 0       | Interpolation time for linearization point from<br>another solution, when linpsolnum is set to<br>interp.                                   |

This solver uses a nonlinear solver if nonlin is on, and it uses the linear solver if nonlin is off or linper. If nonlin is set to auto an analysis is performed to automatically detect if the problem can be solved with a linear solver approach.

The automatic nonlinear/linear detection works in the following way. The linear solver is called if the residual Jacobian matrix (the stiffness matrix, *K*) and the constraint Jacobian matrix (the constraint matrix, *N*) are both found not solution dependent and if these matrices are detected as complete. In all other situations the nonlinear solver is used. The analysis is performed by a symbolic analysis of the expressions contributing to these matrices. Complete here means that in the residual and constraint vectors, only expressions were found for which COMSOL Multiphysics computes the correct Jacobian contribution.

Therefore, if you want to solve a linearized (nonlinear) problem, you must set nonlin to off or linper. The off option uses the linearization point for both the residual computation and for the Jacobian and the solution to the linear problem is added to the linearization point. This corresponds to one step in the Newton method. For linper, the linearization point is used for the Jacobian, the zero solution is used for the assembly of the residual and the solution to the linear problem is returned as the solution. Furthermore, the residual assembled for linper is computed using loads marked with the linper operator.

There are variables for which COMSOL Multiphysics is conservative and therefore flags these, and their Jacobian contribution, as solution dependent even though they not always are. For these situations, the nonlinear solver is used even though the linear solver could be used. This should only result in some extra computational effort, and should not influence the result. The opposite situation however, where the linear solver is used for a nonlinear problem is more dangerous. So, select nonlin to off with great care.

The property reacf controls the computation and storage of constraint reaction forces. The value reacf=on (default) means that the solver stores the FEM residual vector *L* in the solution object model.sol. Because *L = NF*Λ for a converged solution, the residual is the same as the constraint force. Only the components of *L* that correspond to nonzero rows of *NF* are stored. The value reacf=off gives no computation or storage of the reaction force and saves some memory.

The linear solver uses the property itol for termination of iterative linear system solvers and for error checking for direct solvers (if enabled).

# *StopCondition*

Handle stop conditions for time-dependent, time explicit, and parametric solver processes.

## **SYNTAX**

```
model.sol(sname).create(fname,"Stationary")
model.sol(sname).feature(fname).create(pname,Parametric)
model.sol(sname).feature(fname).feature(pname).create(ocname,StopCondition)
model.sol(sname).feature(fname).feature(pname).feature(ocname).setIndex(pname,pvalue,ix)
```

## **DESCRIPTION**

Attribute feature. Use the StopCondition feature to make sure the solver stops when a specified condition is fulfilled. When you provide a scalar expression, then the expression is evaluated after each time or parameter step. The stepping is stopped if the real part of the expression is evaluated to something negative. The corresponding solution, for which the expression is negative, is not returned. When you provide an integer, the solver stops when the corresponding implicit event is triggered. Use setIndex to set the stop condition properties for multiple stop conditions. For example,

```
model.sol("sol1").feature("t1").feature("st1").setIndex("stopcondarr", "(1/timestep)<200", 1);
specifies the second stop condition to be (1/timestep)<200.
```

TABLE 6-71: VALID STOPCONDITION PROPERTIES.

| PROPERTY            | VALUE                                         | DEFAULT | DESCRIPTION                                                                                                  |
|---------------------|-----------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------|
| stopcondActive      | Vector with entries<br>"on" and "off"         |         | Vector describing which stop condition expression<br>that are active.                                        |
| stopcondarr         | Vector of strings                             |         | Stop condition expressions.                                                                                  |
| stopconddesc        | Vector of strings                             |         | Descriptions for stop condition expressions.                                                                 |
| stopcondition       | String                                        |         | Stop condition expression (deprecated).                                                                      |
| stopcondterminateon | Vector with entries<br>"true" and "negative". |         | For "true" ("negative"), entries, the solver stops if the<br>associated stopcondarr entry satisfies ≥1 (<0). |

# *StoreSolution*

A placeholder for a solver sequence that is used to store a computed solution.

#### **SYNTAX**

```
model.sol(sname).create(fname,"StoreSolution")
model.sol(sname).feature(fname).getString("sol")
```

## **DESCRIPTION**

The store solution feature stores a reference to a computed solution. Use the sol property to find out the name of the referenced solution.

TABLE 6-72: VALID STORESOLUTION PROPERTY.

| PROPERTY | VALUE  | DEFAULT           | DESCRIPTION                                       |
|----------|--------|-------------------|---------------------------------------------------|
| sol      | String | A solver sequence | Name of solver sequence that stores the solution. |

In the case of a parametric sweep you can use the StoreSolution features to find the solutions created during the sweep. You first find out the solver sequence that holds the stored solutions

```
model.batch(pname).feature(fname).getString('psol')
```

where pname is the name of the parametric sweep feature that ran and fname is the name of the solution feature that stored the solutions. Use

```
model.sol(sname).feature().tags()
to find out the tags of the stored solutions. Use
  model.sol(sname).feature(fname).getString('sol')
to find the solver sequence for a parameter. Use
  model.sol(sname).getParamNames()
and
  model.sol(sname).getParamVals()
to find the parameter values that created the solution object.
```

# *StudyStep*

Specify which problem to use for subsequent solver operations.

#### **SYNTAX**

```
model.sol(sname).create(fname,"StudyStep")
model.sol(sname).feature(fname).set(pname,pvalue)
```

## **DESCRIPTION**

Utility feature. This feature determines which problem to use for subsequent solver operations and appears as **Compile Equations** in the COMSOL Desktop. It contains a reference to a study and a reference to a study step within that study. When run, the corresponding low-level equation representation is compiled.

TABLE 6-73: VALID CONFIGURATION PROPERTIES.

| PROPERTY     | VALUE                               | DEFAULT | DESCRIPTION                                                                                                                             |
|--------------|-------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------|
| entsel       | List of tags of<br>named selections | {}      | Selections whose geometric entities should be used.<br>Used if useent is set to selected.                                               |
| keeplog      | boolean                             | false   | Keep warnings in stored log.                                                                                                            |
| partmethod   | parent   mo   nd  <br>wnd   false   | parent  | Partitioning method for distributed computing: from<br>parent, mesh ordering, nested dissection, weighted<br>nested dissection, or off. |
| study        | String                              |         | Name of study to use.                                                                                                                   |
| studystep    | String                              |         | Name of study step to use.                                                                                                              |
| splitcomplex | boolean                             | false   | Represent complex variables by separate degrees of<br>freedom for real and imaginary parts.                                             |
| useent       | all   selected                      | all     | Use all geometric entities or selected entities.                                                                                        |

Solve a time-dependent problem using implicit or explicit time stepping.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Time")
model.sol(sname).feature(fname).set(pname,value)
```

#### **DESCRIPTION**

Operation feature.

The time interval and possible intermediate time values are given in the property Tlist. The output times are controlled by the property Tout.

The feature Time accepts the following properties and values:

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY                | VALUES            | DEFAULT | DESCRIPTION                                                                                                       |
|-------------------------|-------------------|---------|-------------------------------------------------------------------------------------------------------------------|
| algebraicsolveeverydt   | positive double   | 0       | Value of the period Δt, when<br>algebraicsolvemethod is set to dt for<br>Adams–Bashforth methods.                 |
| algebraicsolveeverydtRK | positive double   | 0       | Value of the period Δt, when<br>algebraicsolvemethod is set to dt for<br>Runge–Kutta methods.                     |
| algebraicsolveeveryn    | positive integer  | 1       | Value of N, when<br>algebraicsolvemethod is set to n for<br>Adams–Bashforth methods.                              |
| algebraicsolveeverynRK  | positive integer  | 1       | Value of N, when<br>algebraicsolvemethod is set to n for<br>Runge–Kutta methods.                                  |
| algebraicsolvemethod    | n   dt            | n       | Strategy used to solve the algebraic<br>equations: every Nth step or periodically<br>for Adams–Bashforth methods. |
| algebraicsolvemethodRK  | n   dt            | n       | Strategy used to solve the algebraic<br>equations: every Nth step or periodically<br>for Runge–Kutta methods.     |
| assumeperiodic          | Boolean           | false   | Assume periodic values of variables not<br>solved for.                                                            |
| atol                    | String            | empty   | Absolute tolerance per field. See below.                                                                          |
| atolmethod              | String            | empty   | How to interpret the atolfields value. See<br>below.                                                              |
| atolglobal              | positive scalar   | 1e-3    | Global absolute tolerance, if<br>atolglobalvaluemethod is manual.                                                 |
| atolglobalfactor        | positive scalar   | 0.1     | Global absolute tolerance as a factor of<br>the relative tolerance, if<br>atolglobalvaluemethod is factor.        |
| atolglobalmethod        | scaled   unscaled | scaled  | How to interpret the atolglobal value.                                                                            |
| atolglobalvaluemethod   | factor   manual   | factor  | Use a factor of the relative tolerance or a<br>user-defined value for the absolute<br>tolerance.                  |
| atoludot                | String            | empty   | Absolute tolerance for time derivatives<br>per field. Only applicable if<br>atoludotactive is on. See below.      |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY             | VALUES                       | DEFAULT | DESCRIPTION                                                                                                                                                                                                                   |
|----------------------|------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| atoludotactive       | String                       | empty   | Used to activate manual specification of<br>absolute tolerance for time derivatives.<br>See below.                                                                                                                            |
| bdforder             | 1–5                          | 2       | BDF order for manual BDF settings.                                                                                                                                                                                            |
| bwinitstepfrac       | positive scalar              | 0.001   | Fraction of initial step, when consistent<br>is set to bweuler.                                                                                                                                                               |
| bwinitfactor         | positive scalar              | 20      | Safety factor used in the algebraic equation<br>termination, when consistent is set to<br>bweuler.                                                                                                                            |
| checkvalidity        | true   false                 | false   | Check validity of coupled system, if<br>odesolvertype is set to explicit.                                                                                                                                                     |
| complex              | true   false                 | false   | Allow complex numbers.                                                                                                                                                                                                        |
| consistent           | off   on   bweuler           | bweuler | Consistent initialization of DAE systems.                                                                                                                                                                                     |
| clist                | String array                 |         | Provide values for constants as input<br>parameters using a string array; for the<br>corresponding constant names, use cname.<br>See The clist and cname Properties.                                                          |
| cname                | String array                 |         | Provide names of constants as input<br>parameters using a string array; for the<br>corresponding constant values, use clist.<br>See The clist and cname Properties.                                                           |
| control              | String                       | user    | Name of the controlling study step or<br>user if the feature is controlled manually.                                                                                                                                          |
| doprigrowmax         | positive scalar              | 10      | Maximum step size growth ratio for<br>Dormand–Prince 5.                                                                                                                                                                       |
| doprigrowmin         | positive scalar              | 0.2     | Minimum step size growth ratio for<br>Dormand–Prince 5.                                                                                                                                                                       |
| dopripicontrol       | smooth   quick  <br>disabled | smooth  | Control behavior of the<br>proportional-integral controller that adds<br>damping on step size changes for<br>Dormand–Prince 5.                                                                                                |
| doprisafe            | positive scalar              | 0.9     | Step size safety factor for Dormand–Prince<br>5.                                                                                                                                                                              |
| endtimeinterpolation | Boolean                      | true    | Interpolate the last time specified in the list<br>of output times, if true. If set to false,<br>the last output time is solved and not<br>interpolated. In particular, the solver does<br>not take steps past the last time. |
| erkorder             | integer, 1–4                 | 4       | Classical Runge–Kutta order.                                                                                                                                                                                                  |
| estrat               | include   exclude            | include | Error estimation strategy.                                                                                                                                                                                                    |
| exprs                | String                       |         | Expression for time stepping when<br>tstepping=elemexprs.                                                                                                                                                                     |
| eventtol             | positive scalar              | 0.01    | Event tolerance used for root finding of<br>event conditions when using implicit<br>events for BDF.                                                                                                                           |
| ewtrescale           | on   off                     | on      | Update scaled absolute tolerance for BDF.                                                                                                                                                                                     |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY                   | VALUES                     | DEFAULT | DESCRIPTION                                                                                                                                                                                                   |
|----------------------------|----------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| geometricNonlinearity      | on   off                   | off     | Include geometric nonlinearity. Available if<br>the license includes the Structural<br>Mechanics Module, Acoustics Module,<br>MEMS Module, or Multibody Dynamics<br>Module.                                   |
| incrdelay                  | positive integer           | 15      | Number of time steps to delay a time step<br>increase.                                                                                                                                                        |
| incrdelayactive            | on   off                   | off     | Use delay in time step increase.                                                                                                                                                                              |
| initialstepbdf             | positive scalar            | 1e-3    | Initial time step for BDF.                                                                                                                                                                                    |
| initialstepbdfactive       | on   off                   | off     | Use an initial time step for BDF.                                                                                                                                                                             |
| initialstepck5             | positive scalar            | 1e-3    | Initial time step for Cash–Karp 5.                                                                                                                                                                            |
| initialstepdopri5          | positive scalar            | 1e-3    | Initial time step for Dormand–Prince 5.                                                                                                                                                                       |
| initialsteprk34            | positive scalar            | 1e-3    | Initial time step for the RK34 method.                                                                                                                                                                        |
| initialstepck5active       | on   off                   | off     | Use an initial time step for Cash–Karp 5.                                                                                                                                                                     |
| initialstepdopri5active    | on   off                   | off     | Use an initial time step for Dormand–<br>Prince 5.                                                                                                                                                            |
| initialsteprk34active      | on   off                   | off     | Use an initial time step for RK34.                                                                                                                                                                            |
| initialstepgenalpha        | positive scalar            | 1e-3    | Initial time step for generalized alpha.                                                                                                                                                                      |
| initialstepgenalphaactive  | on   off                   | off     | Use an initial time step for generalized<br>alpha.                                                                                                                                                            |
| initialstepfractionbdf-i   | positive scalar            |         | The fraction of the time step for the initial<br>step of a manual time stepping for BDF.<br>The name and the default depend on the<br>BDF order; for example,<br>initialstepfractionbdf-2 for BDF<br>order 2. |
| initialstepgrowthratebdf-i | positive scalar            |         | The growth rate for the initial steps of a<br>manual time stepping for BDF. The name<br>and the default depend on the BDF order;<br>for example,<br>initialstepgrowthratebdf-2 for<br>BDF order 2.            |
| keeplog                    | boolean                    | false   | Keep warnings in stored log.                                                                                                                                                                                  |
| lumpedflux                 | on   off                   | off     | Use lumping when computing fluxes.                                                                                                                                                                            |
| masssingular               | yes   maybe                | maybe   | Singular mass matrix.                                                                                                                                                                                         |
| maxorder                   | integer between 1<br>and 5 | 5       | Maximum BDF order.                                                                                                                                                                                            |
| maxstepbdf                 | positive scalar            | 1e-1    | Maximum time step for BDF, when<br>maxstepconstraintbdf is set to const.                                                                                                                                      |
| maxstepconstraintbdf       | auto   const   expr        | auto    | Maximum time step for BDF: automatic<br>(auto), constant (const), or an<br>expression (expr).                                                                                                                 |
| maxstepconstraintdopri5    | auto   const   expr        | auto    | Maximum time step for Dormand–Prince<br>5: automatic (auto), constant (const), or<br>an expression (expr).                                                                                                    |
| maxstepconstraintgenalpha  | auto   const   expr        | auto    | Maximum time step for generalized alpha:<br>automatic (auto), constant (const), or an<br>expression (expr).                                                                                                   |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY                   | VALUES                 | DEFAULT  | DESCRIPTION                                                                                                        |
|----------------------------|------------------------|----------|--------------------------------------------------------------------------------------------------------------------|
| maxstepdopri5              | positive scalar        | 1e-1     | Maximum time step for Dormand–Prince<br>5, when maxstepconstraintdopri5 is<br>const.                               |
| maxstepexpressionbdf       | String                 |          | Expression for the maximum time step for<br>BDF, when maxstepconstraintbdf is<br>expr.                             |
| maxstepexpressiongendopri5 | String                 |          | Expression for the maximum time step for<br>Dormand–Prince 5, when<br>maxstepconstraintdopri5 is expr.             |
| maxstepexpressiongenalpha  | String                 |          | Expression for the maximum time step for<br>generalized alpha, when<br>maxstepconstraintgenalpha is expr.          |
| maxstepgenalpha            | positive scalar        | 1e-1     | Maximum time step for generalized alpha,<br>when maxstepconstraintgenalpha is<br>const.                            |
| message                    | String                 |          | The log message from the last solution<br>process.                                                                 |
| minorder                   | 1   2                  | 1        | Minimum BDF order.                                                                                                 |
| mlinsolver                 | direct   lumped        | direct   | Mass matrix solver: direct or lumped (if<br>timemethodexp is not rk).                                              |
| nlsolver                   | automatic  <br>manual  | manual   | Nonlinear solver settings.                                                                                         |
| ntimestepsupdate           | positive integer       | 100      | Number of time steps between updates,<br>when updtlvl is set to manual when<br>timemethodexp is not set to ab3loc. |
| ntimestepsupdateab3loc     | positive integer       | 100      | Number of time steps between updates,<br>when updtlvl is set to manual when<br>timemethodexp is set to ab3loc.     |
| odesolvertype              | implicit  <br>explicit | implicit | ODE solver type: using an implicit or<br>explicit time stepping method.                                            |
| plot                       | on   off               | off      | Plot while solving.                                                                                                |
| plotfreq                   | tsteps   tout          | tout     | Times to update plot.                                                                                              |
| plotgroup                  | String                 |          | Name of plot group for plot while solving.                                                                         |
| probefreq                  | tsteps   tout          | tsteps   | Times to update probe.                                                                                             |
| probes                     | vector of strings      |          | Probed to use if probesel=manual.                                                                                  |
| probesel                   | all   none   manual    | all      | The probes to compute.                                                                                             |
| predictor                  | linear   constant      | linear   | Predictor type to use (linear or constant),                                                                        |
| reacf                      | on   off               | on       | Compute reaction forces.                                                                                           |
| rescaleafterinitbw         | on   off               | off      | Rescale after initialization for the BDF and<br>Generalized alpha methods, when<br>consistent is set to bweuler.   |
| rhoinf                     | numeric                | 0.75     | Amplification factor for high frequencies.                                                                         |
| rkmethod                   | rk34   ck5   dopri5    | rk34     | Runge–Kutta method: RK34, Cash–Karp 5,<br>or Dormand–Prince 5. Only available when<br>timemethodexp is set to rk.  |
| rkstiffcheck               | on   off               | on       | Check for and stop if problem becomes<br>numerically stiff for Runge–Kutta solvers.                                |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY         | VALUES                                                            | DEFAULT | DESCRIPTION                                                                                                      |
|------------------|-------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------|
| rktimestep       | String                                                            | 1e-3    | Time step for manual time stepping with<br>the classical Runge–Kutta method.                                     |
| rtol             | numeric                                                           | 0.01    | Relative tolerance.                                                                                              |
| rtstepab3loc     | numeric                                                           | 0.1     | Relative time step change, when                                                                                  |
| solref           | true   false                                                      | false   | Use output solution for the time<br>operators.                                                                   |
| solutionperiod   | numeric                                                           | 0       | The interval length for a periodic solution,<br>when assumeperiodic is set to true.                              |
| stabcntrl        | on   off                                                          | off     | Use a nonlinear controller for more<br>efficient time-step control in the BDF<br>method.                         |
| starttime        | numeric                                                           | 0       | The start time for a period of a periodic<br>solution, if assumeperiodic is set to<br>true.                      |
| storeudot        | on   off                                                          | on      | Store time derivatives.                                                                                          |
| tderglobalfactor | numeric                                                           | 1       | The global time derivative factor, if<br>tderglobalmethod is set to manual.                                      |
| tderglobalmethod | auto   manual                                                     | auto    | Global derivative tolerance method.                                                                              |
| tderfactor       | numeric                                                           | 1       | The time derivative factor, if tdermethod<br>is set to manual.                                                   |
| tdermethod       | auto   manual                                                     | auto    | Derivative tolerance method.                                                                                     |
| timemethod       | bdf   genalpha  <br>init                                          | bdf     | Implicit time-stepping method.                                                                                   |
| timemethodexp    | rk   erk   ab3  <br>ab3loc                                        | rk      | Time-explicit solver: Runge–Kutta, classical<br>Runge–Kutta, Adams–Bashforth 3, or<br>Adams–Bashforth 3 (local). |
| timestepbdf      | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the BDF method.                                                     |
| timestepck5      | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the Cash–Karp 5 Runge–Kutta<br>method.                              |
| timestepdopri5   | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the Dormand–Prince Runge–Kutta<br>method.                           |
| timestepgenalpha | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the generalized alpha method.                                       |
| timesteprk34     | numeric scalar  <br>numeric vector  <br>string with<br>expression | 0.01    | Time step when manual time stepping<br>using the RK34 Runge–Kutta method.                                        |
| tlist            | numeric vector                                                    |         | List of output times.                                                                                            |

TABLE 6-74: VALID PROPERTIES FOR TIME.

| PROPERTY       | VALUES                                      | DEFAULT | DESCRIPTION                                                                                                                               |
|----------------|---------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------|
| tout           | tlist   tsteps  <br>tstepsclosest           | tlist   | Times to store: output times by<br>interpolation; every Nth step taken by<br>solver; or steps taken by solver closest to<br>output times. |
| tstepping      | manual  <br>elemexprs                       | manual  | Manual or from expressions time stepping.                                                                                                 |
| tstepsbdf      | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when timemethod is<br>set to bdf.                                                                                      |
| tstepsck5      | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when rkmethod is<br>set to ck5.                                                                                        |
| tstepsdopri5   | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when rkmethod is<br>set to dopri5.                                                                                     |
| tstepsgenalpha | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when timemethod is<br>set to genalpha.                                                                                 |
| tstepsrk34     | free  <br>intermediate  <br>strict   manual | free    | Time-stepping mode when rkmethod is<br>set to rk34.                                                                                       |
| tstepsstore    | positive integer                            | 1       | Value of N for every Nth step from the<br>solver to store when tout is set to<br>tsteps.                                                  |
| updtlvl        | false   manual  <br>factor                  | false   | Update time step: off (false), manual, or<br>factor when timemethodexp is set to<br>ab3loc.                                               |
| updtstep       | false   manual                              | false   | Update time step: off (false) or manual,<br>when tstepping is set to explicit for<br>the timemethodexp methods erk and<br>ab3.            |

By default, you can control the process of solving the linear or nonlinear system of equations in each time step manually. For a coupled problem, this is done through the properties Damp, Dtech, Hnlin, Initstep, Jtech, Maxiter, Minstep, and Rstep listed under femnlin. For a segregated problem, the properties listed under femstatic that are related to the segregated solver are available. When Timemethod is set to bdf it is possible to use the internal nonlinear solver of the time integrator. This can be achieved by setting Nlsolver to automatic.

The properties atol, atolmethod, atolglobal, atolglobalfactor, atolglobalmethod, atolglobalvaluemethod, atoludot, and atoludotactive require some additional explanation. The default value of the absolute tolerance for all fields is given by the property atolglobalfactor or atolglobal, depending on the setting for atolglobalvaluemethod. The modifier atolglobalmethod specifies whether the given value of atolglobal should be applied to scaled or unscaled variables. For variables where the automatic scaling does a good job, or where a manual scaling has been used, specifying the absolute tolerance in scaled variables is much easier. If either a different absolute value or scaling method than dictated by atolglobal and atolglobalmethod is wanted for one or several variables you can use the properties atol and atolmethod. Enter atol as a space-separated string with alternating field names and tolerances (for example, "u 1e-3 v 1e-6"). Enter atolmethod as a space-separated string with alternating field names and one of the strings global, scaled, or unscaled (for example, "u unscaled v scaled"). By default atolmethod is equal to global for all fields. The lists atol and atolmethod do not have to contain all fields. The ones not present get absolute tolerances as specified by atolglobal and atolglobalmethod. When solving wave-type equations, the time derivatives of all fields are also treated as unknowns, and therefore absolute tolerances have to be specified also for these

components. By default these tolerances are chosen automatically. In some situations it might be necessary to specify them manually with the properties atoludot and atoludotactive. To turn on manual specification for, say, the two fields u and v, set the property atoludotactive to the string "u on v on". If atoludot is not specified, these two time-derivatives get the default absolute tolerance 1e-3. To specify other absolute tolerances, set atoludot to, for instance, the string "u 1e-4 v 1e-7". The absolute tolerance method for all time derivatives is the same as the method specified for the field itself.

The maximum allowed relative error in each time step (the local error) is specified using rtol. However, for small components of the solution vector *U*, the algorithm tries only to reduce the absolute local error in *U* below the given absolute tolerance.

There is no guarantee that the error tolerances are met strictly; that is, for hard problems they can be exceeded.

For the tolerance parameter in the convergence criterion for linear systems, the maximum of the numbers rtol and itol is used.

Use complex=on if complex numbers occur in the solution process.

The property Consistent controls the consistent initialization of a *differential algebraic equation* (DAE) system. The value Consistent=off means that the initial values are consistent (this is seldom the case because the initial value of the time derivative is 0). Otherwise, the solver tries to modify the initial values so that they become consistent. The value consistent=on can be used (when timemethod=bdf and nlsolver=automatic) for index-1 DAEs. Then the solver fixes the values of the differential DOFs and solves for the initial values of the algebraic DOFs and the time derivative of the differential DOFs. The value Consistent=bweuler can be used for both index-1 and index-2 DAEs. Then the solver perturbs the initial values of all DOFs by taking a backward Euler step.

For a DAE system, if Estrat=exclude, then the algebraic DOFs are excluded from the error norm of the time discretization error.

You can suggest a size of the initial time step using the property initialstepbdf when timemethod is set to bdf the property initialstepdopri5 when timemethod is set to dopri5, and the property initialstepgenalpha when timemethod is set to genalpha. You also have to set one of the properties initialstepbdfactive, initialstepdopri5active, or initialstepgenalphaactive to on for the specified initial step to be active.

By default, the solver determines whether the system is differential-algebraic by looking after zero rows or columns in the mass matrix. If you have a DAE where the mass matrix has no zero rows or columns, put masssingular=yes.

The property maxorder gives the maximum degree of the interpolating polynomial in the BDF method (when timemethod=bdf).

If timemethod=bdf and maxstepconstraintbdf=const, then the property maxstepbdf put an upper limit on the time step size (this property is not allowed when tstepsbdf=manual). If instead maxstepconstraintbdf=expr, then the property maxstepexpressionbdf controls the maximum step size via an expression that is evaluated while solving. The same holds true for the associated maxstep properties if timemethod=genalpha or timemethod=rk and rkmethod=dopri5.

The odesolver property is used to select which time-stepping method to use for the ODEs:

- **•** With implicit (the default), an implicit time-stepping method such as BDF is used.
- **•** With explicit, an explicit time-stepping method, such as the Runge–Kutta family of explicit methods is used.

The timemethod property is used to select which implicit time-stepping method to use:

- **•** With timemethod=bdf, the IDA solver (which uses a variable order backward differentiation formula) is used.
- **•** With timemethod=genalpha, the generalized-α method is used. With generalized-α, the numerical damping can be controlled by giving a value, 0 ≤ ρ∞ ≤ 1, by which the amplitude of the highest possible frequency is

multiplied each time step (hence, a small value corresponds to large damping while a value close to 1 corresponds to little damping). This is done through the property rhoinf. Also, the initial guess for the solution at the next time step (needed by the nonlinear solver) can be controlled through the property predictor when generalized-α is used. With predictor=linear, linear extrapolation using the current solution and time-derivative is used. With predictor=constant, the current solution is used as initial guess.

**•** When timemethod is set to init the solver computes consistent initial values (for the start time, as defined by the property tlist) for the system and then stop. Time derivatives of algebraic variables and indicator functions might still be uninitialized after this operation. Such uninitialized quantities are represented by NaN (not a number) in the solution object.

The timemethodexp property is used to select which explicit time-stepping method to use:

- **•** With timemethodexp=rk, an explicit Runge–Kutta method is used: RK34, Cash–Karp 5, or Dormand–Prince 5 (specified using the rkmethod property).
- **•** With timemethodexp=erk, a classical Runge–Kutta method of order 1–4 is used.
- **•** With timemethodexp=ab3, an explicit Adams–Bashforth 3 method is used.
- **•** With timemethodexp=ab3loc, a local time-stepping version of Adams–Bashforth 3 is used (for the Wave Form PDE interface).

The property reacf controls the computation and storage of the constraint reaction force. The value reacf=on (default) means that the solver stores the FEM residual vector *L* in the solution object. Because *L = NF*Λ for a converged solution, the residual is the same as the constraint force. Only the components of *L* that correspond to nonzero rows of *NF* are stored. For each time for which the solution is requested an extra residual vector assembly is performed. The value reacf=off gives no computation or storage of the reaction force and can therefore save some computational time.

The property tlist must be a strictly monotone vector of real numbers. Commonly, the vector consists of a start time and a stop time. If more than two numbers are given, the intermediate times can be used as output times, or to control the size of the time steps (see below). If just a single number is given, it represents the stop time, and the start time is 0.

The property tout determines the times that occur in the output. If tout=tsteps, then the output contains every *N*th time steps (where *N* is specified using the tstepsstore property; default: 1) taken by the solver. If tout=tlist, then the output contains interpolated solutions for the times in the tlist property. If tout=tstepsclosest. The default is tout=tlist.

The properties tstepsbdf (applicable when timemethod=bdf), tstepsdopri5 (applicable when timemethod=dopri5), and tstepsgenalpha (applicable when timemethod=genalpha) control the selection of time steps. If either of these properties is set to free, the solver selects the time steps according to its own logic, disregarding the intermediate times in the tlist vector. If either of the properties is set to strict, then time steps taken by the solver contain the times in tlist. If either of the properties is set to intermediate, then there is at least one time step in each interval of the tlist vector. If tstepsgenalpha has been set to manual, the solver follows the time step specified in the property timestepgenalpha. If timestepgenalpha is a scalar value, this time step is taken in the entire simulation. When timestepgenalpha is a (strictly monotone) numeric vector, the solver computes the solution at the times in the vector. The start time and stop time is still obtained from tlist; the vector given in timestepgenalpha is truncated or expanded using the first and last time step in the vector so that the start time and stop time agree with the values in tlist. Finally, an expression using variables with global scope and which results in a scalar can be used as timestepgenalpha.

For problems of wave type, the logic by which the solver selects the time step can sometimes result in a time step that oscillates in an inefficient manner. When timemethod=genalpha (the solver typically used for wave-type problems), you can avoid such oscillations in the time step using the properties incrdelay and incrdelayactive. When incrdelayactive=on, a counter keeps track of the number of consecutive time steps for which a time step increase has been warranted. When this counter exceeds the number given in the property incrdelay, the time step is increased and the counter is set to zero.

The order of the Runge–Kutta method can be set by the erkorder property. The size of the time step is controlled through the property rktimestep and can be given as a single scalar value, a (strictly monotone) numeric vector, or an expression using variables with global scope, which results in a scalar. For Adams–Bashforth 3, only a scalar constant value of the time step is allowed. Time stepping from expressions tstepping=elemexprs is useful for the Wave Form PDE interface. A local time-stepping version of Adams–Bashforth 3 is available for the Wave Form PDE interface by timemethodexp=ab3loc.

## **COMPATIBILITY**

The TimeExplicit time-explicit solver has been removed from the Model Builder in version 6.1 but can still be used in the API. Instead, use the Time solver with an explicit time stepping. The TimeExplicit solver is still available in the Model Builder if you open models created in versions before 6.1 that include a TimeExplicit solver.

![](_page_96_Picture_4.jpeg)

In structural mechanics models, the displacements are often quite small, and it is critical that a userdefined absolute tolerance value is chosen to be smaller than the actual displacements.

![](_page_96_Picture_6.jpeg)

For more information about the Time-Dependent solver; see Time-Dependent Solver in the *COMSOL Multiphysics Reference Manual*.

# *TimeAdaption*

Handle time-dependent adaptive mesh refinement parameters.

# **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"TimeAdaption")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
```

## **DESCRIPTION**

Handles settings for time-dependent adaptive mesh refinement. This feature can be added to a solver of the Time Dependent type.

The TimeAdaption feature splits the overall time range into subintervals, and in each interval an adapted mesh is generated and used. The meshes for these intervals as well as the solutions are added to the model. The solutions are stored in one container node (model.sol()) to facilitate the result processing.

The feature TimeAdaption accepts the following properties

TABLE 6-75: VALID TIMEADAPTION PROPERTIES.

| PROPERTY          | VALUE        | DEFAULT | DESCRIPTION                                                                                                                                                          |
|-------------------|--------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| consistentrestart | on   off     | off     | Consistent initialization after restart.                                                                                                                             |
| clist             | String array |         | Provide values for constants as input parameters<br>using a string array; for the corresponding<br>constant names, use cname. See The clist and<br>cname Properties. |

TABLE 6-75: VALID TIMEADAPTION PROPERTIES.

| PROPERTY                     | VALUE                           | DEFAULT            | DESCRIPTION                                                                                                                                                         |
|------------------------------|---------------------------------|--------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| cname                        | String array                    |                    | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties. |
| convertmesh                  | on   off                        | on                 | Convert to simplex mesh.                                                                                                                                            |
| eefuntime                    | user                            | user               | Error indicator function.                                                                                                                                           |
| eefunctime                   | String                          |                    | Error indicator name (eefuntime=user).                                                                                                                              |
| elfrac                       | positive scalar                 | 0.2                | Fraction of maximum refinement if<br>tauto=automatic.                                                                                                               |
| elselect                     | globalmin   worst  <br>elements |                    | Method for selecting elements to refine.                                                                                                                            |
| elselectauto                 | globalmin                       |                    | Method for selecting elements to refine if<br>tauto=automatic.                                                                                                      |
| gf                           | positive scalar                 | 2                  | Interval growth factor.                                                                                                                                             |
| globalminpar                 | positive scalar                 |                    | Controls refinement if elselect=globalmin.                                                                                                                          |
| globalminparauto             | positive scalar                 |                    | Controls refinement if<br>elselectauto=globalmin.                                                                                                                   |
| initialsteprestart           | positive scalar                 | 0.001              | Initial time step size after restart.                                                                                                                               |
| initialsteprestart<br>active |                                 |                    |                                                                                                                                                                     |
| maxrefinement                | scalar integer                  | 5                  | Maximum number of element refinements.                                                                                                                              |
| message                      | String                          |                    | The log message from the last solution process.                                                                                                                     |
| minti                        | positive scalar                 | 0.01               | Minimal length of adaptation time intervals.                                                                                                                        |
| rf                           | positive scalar                 | 0.5                | Interval reduction factor.                                                                                                                                          |
| rmethod                      | regular   longest               | longest            | Refinement method.                                                                                                                                                  |
| samplepts                    | scalar   numeric<br>vector      | range(0,0.<br>1,1) | Where to check the error in next subinterval.                                                                                                                       |
| tauto                        | manual   automatic              | manual             | Time interval control.                                                                                                                                              |
| tfrac                        | positive scalar                 | 0.1                | Length of adaptation time intervals.                                                                                                                                |
| tfracauto                    | positive scalar                 | 0.1                | Length of initial adaptation time interval if<br>tauto=automatic.                                                                                                   |
| timeadapgeom                 | String                          |                    | Name of geometry sequence.                                                                                                                                          |
| worstpar                     | positive scalar                 |                    | Controls refinement if elselect=worst.                                                                                                                              |

# **TIME ADAPTATION**

The TimeAdaption algorithm solves a sequence of problems on a sequence of adapted meshes. The first mesh, the base mesh, is obtained from the meshing sequence. The new adapted mesh is obtained by evaluating the mesh element error indicator, selecting a set of elements based on the element pick function, and then finally refining these elements. The solution to the problem on the previous mesh is then mapped to the new mesh and time integration continues until the next mesh adaptation takes place. The time of mesh adaptation can be determined manually or automatically.

The time adaptive solver works in one geometry at a time. You specify the name of the geometry sequence in the property timeadapgeom. The solver only supports simplex meshes, and if the base mesh is not simplex it can be converted by using the property convertmesh.

The length of the time interval using a fixed adapted spatial mesh can be controlled manually or automatically by the property tauto. If the time integrator runs into problems the computation is restarted at the beginning of the previous time interval. The length of the new interval is reduced to a fraction of the current interval length. This fraction is specified by the property rf. In the tauto=manual case the time interval length is given by property tfrac; if tauto=automatic the property tfracauto controls the initial interval length. For both cases the shortest possible interval length is given by the property minti.

If the property tauto is set to automatic the TimeAdaption algorithm tries to determine the length of the time interval according to the requested fraction of maximum refinement. The fraction is given by the value of the property elfrac. A value of zero means no refinement of the base mesh and a value of one means refinement everywhere with the maximum number of refinements (set through property ngenlocal). The algorithm strives to assume the given value of elfrac by controlling the size of the time interval. The shortening and lengthening of the interval is determined by the interval reduction and growth factors. These are the properties rf and gf, respectively.

The error indicator is specified using the property eefunctime. A solution on the coarse base mesh is computed in the next time interval and the error indicator is evaluated at the points given by property samplepts. In this way a new adapted mesh appropriate for the next time interval can be generated and the computation on this new mesh is then started. The sample points must be specified as a number between 0 and 1 because they are interpreted as being relative to the time interval under consideration. Entering a scalar value of 0.5 means that the error indicator is evaluated at the midpoint of the interval.

After each mesh adaptation the time integration is restarted and you can control the time stepping by the Time type analogous properties consistentrestart and initialsteprestart.

## **COMPATIBILITY**

The property ngenlocal in versions prior to 5.5 has been renamed to maxrefinement.

# *TimeDiscrete*

Solve a time-discretized problem.

## **SYNTAX**

```
model.sol(sname).create(fname,"TimeDiscrete")
model.sol(sname).feature(fname).set(pname,value)
```

# **DESCRIPTION**

Operation feature.

The output time interval and possible intermediate time values are given in the property tlist. The times to store are controlled by the property tout.

The feature TimeDiscrete accepts the following properties:

TABLE 6-76: VALID PROPERTIES FOR THE TIME-DISCRETE SOLVER.

| PROPERTY         | VALUES            | DEFAULT | DESCRIPTION                                                                                                |
|------------------|-------------------|---------|------------------------------------------------------------------------------------------------------------|
| atol             | String            | empty   | Absolute tolerance per field. See below,                                                                   |
| atolmethod       | String            | empty   | How to interpret the atolfields value. See below.                                                          |
| atolglobal       | positive scalar   | 1e-3    | Global absolute tolerance, if<br>atolglobalvaluemethod is manual.                                          |
| atolglobalfactor | positive scalar   | 0.1     | Global absolute tolerance as a factor of the<br>relative tolerance, if atolglobalvaluemethod<br>is factor. |
| atolglobalmethod | scaled   unscaled | scaled  | How to interpret the atolglobal value.                                                                     |

TABLE 6-76: VALID PROPERTIES FOR THE TIME-DISCRETE SOLVER.

| PROPERTY              | VALUES                                                         | DEFAULT | DESCRIPTION                                                                                                                                                          |
|-----------------------|----------------------------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| atolglobalvaluemethod | factor   manual                                                | factor  | Use a factor of the relative tolerance or a<br>user-defined value for the absolute tolerance.                                                                        |
| clist                 | String array                                                   |         | Provide values for constants as input parameters<br>using a string array; for the corresponding<br>constant names, use cname. See The clist and<br>cname Properties. |
| cname                 | String array                                                   |         | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties.  |
| control               | String                                                         | user    | Name of the controlling study step or user if the<br>feature is controlled manually.                                                                                 |
| keeplog               | on   off                                                       | off     | Keep warnings in stored log.                                                                                                                                         |
| message               | String                                                         |         | The log message from the last solution process.                                                                                                                      |
| plot                  | on   off                                                       | off     | Plot while solving.                                                                                                                                                  |
| plotfreq              | tsteps   tout                                                  | tout    | Times to update plot.                                                                                                                                                |
| plotgroup             | String                                                         |         | Name of plot group for plot while solving.                                                                                                                           |
| prevlevels            | positive integer                                               | 2       | Number of previous time levels to store.                                                                                                                             |
| probefreq             | tsteps   tout                                                  | tsteps  | Times to update probe.                                                                                                                                               |
| probes                | vector of strings                                              |         | Probed to use if probesel=manual.                                                                                                                                    |
| probesel              | all   none   manual                                            | all     | The probes to compute.                                                                                                                                               |
| rtol                  | numeric                                                        | 0.01    | Relative tolerance.                                                                                                                                                  |
| timestepdiscrete      | numeric scalar  <br>numeric vector   string<br>with expression | 0.01    | Time step when manual time stepping.                                                                                                                                 |
| tlist                 | numeric vector                                                 |         | Time list.                                                                                                                                                           |
| tout                  | tlist   tsteps  <br>tstepsclosest                              | tlist   | Times to store: output times by interpolation;<br>every Nth step taken by solver; or steps taken by<br>solver closest to output times.                               |
| tstepsstore           | positive integer                                               | 1       | Value of N for every Nth step from the solver to<br>store when tout is set to tsteps.                                                                                |

The TimeDiscrete solver is used for solving time-dependent PDEs that have already been discretized in time using, for example, the prev operator or the bdf operator. Such discretization requires the solution at previous time steps. Different discretizations require different number of previous time steps. For example, the first order accurate bdf method requires the solution at the previous time step, while the second-order accurate bdf-method requires the solution at the two preceding time steps. How many previous time steps should be accessible to the solver is controlled through the property prevlevels.

You can control the process of solving the linear or nonlinear system of equations in each time step manually. For a coupled problem, this is done through the properties Damp, Dtech, Hnlin, Initstep, Jtech, Maxiter, Minstep, and Rstep listed under femnlin. For a segregated problem, the properties listed under femstatic that are related to the segregated solver are available.

Because only manual time stepping is available, there is no estimation of the error made in a time step. However, the tolerances, specified through the properties rtol, atol, atolmethod, atolglobal, and atolglobalmethod are still important as tolerances when solving the nonlinear system of equations in each time step. For a description of these properties, see Time. They should in general be set to the desired accuracy in the final solution.

The property tlist must be a strictly monotone vector of real numbers. Commonly, the vector consists of a start time and a stop time. If more than two numbers are given, the intermediate times can be used as output times, or to control the size of the time-steps (see below). If just a single number is given, it represents the stop time, and the start time is 0.

The property tout determines the times that occur in the output. If tout=tsteps, then the output contains every *N*th time steps (where *N* is specified using the tstepsstore property; default: 1) taken by the solver. If tout=tlist, then the output contains interpolated solutions for the times in the tlist property. If tout=tstepsclosest. The default is tout=tlist.

The size of the time step is controlled through the property timestepdiscrete. If timestepdiscrete is a scalar value, this time step is taken in the entire simulation. When timestepdiscrete is a (strictly monotone) numeric vector, the solver computes the solution at the times in the vector. The start time and stop time is still obtained from tlist; the vector given in timestepdiscrete is truncated and/or expanded using the first and/or last time step in the vector so that the start time and stop time agrees with the values in tlist. Finally, an expression using variables with global scope and which results in a scalar can be used as timestepdiscrete.

![](_page_100_Picture_3.jpeg)

For more information about the time discrete solver; see Time Discrete Solver in the *COMSOL Multiphysics Reference Manual*.

# *TimeExplicit*

Solve time-dependent problems with explicit time stepping. Note that in the Model Builder, the **Time-Dependent Solver** node includes all time-explicit settings, and the **Time-Explicit Solver** is not available since version 6.1. You can use the API for Time instead.

#### **SYNTAX**

```
model.sol(sname).create(fname,"TimeExplicit")
model.sol(sname).feature(fname).set(pname,pvalue)
```

## **DESCRIPTION**

Operation feature. The TimeExplicit solver is used for solving time-dependent PDEs using the classic Runge– Kutta or the Adams–Bashforth 3 explicit time-stepping schemes

TABLE 6-77: VALID TIMEEXPLICIT PROPERTIES.

| PROPERTY              | VALUES           | DEFAULT | DESCRIPTION                                                                                                                                                          |
|-----------------------|------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| algebraicsolveeverydt | positive double  | 0       | Value of the period Δt, when<br>algebraicsolvemethod is set to dt.                                                                                                   |
| algebraicsolveeveryn  | positive integer | 1       | Value of N, when algebraicsolvemethod is<br>set to n.                                                                                                                |
| algebraicsolvemethod  | n   dt           | n       | Strategy used to solve the algebraic equations:<br>every Nth step or periodically.                                                                                   |
| clist                 | String array     |         | Provide values for constants as input parameters<br>using a string array; for the corresponding<br>constant names, use cname. See The clist and<br>cname Properties. |
| cname                 | String array     |         | Provide names of constants as input parameters<br>using a string array; for the corresponding<br>constant values, use clist. See The clist and<br>cname Properties.  |
| control               | String           | user    | Name of the controlling study step or user if<br>the feature is controlled manually.                                                                                 |

TABLE 6-77: VALID TIMEEXPLICIT PROPERTIES.

| PROPERTY               | VALUES                            | DEFAULT | DESCRIPTION                                                                                                                                                                                                                   |
|------------------------|-----------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| endtimeinterpolation   | Boolean                           | true    | Interpolate the last time specified in the list of<br>output times, if true. If set to false, the last<br>output time is solved and not interpolated. In<br>particular, the solver does not take steps past<br>the last time. |
| erkorder               | integer between 1 and<br>4        | 4       | Runge-Kutta order.                                                                                                                                                                                                            |
| exprs                  | String                            |         | Expression for time stepping when<br>tstepping=elemexprs.                                                                                                                                                                     |
| keeplog                | on   off                          | off     | Keep warnings in stored log.                                                                                                                                                                                                  |
| linsolver              | linear solver tag                 |         | Linear solver to use.                                                                                                                                                                                                         |
| message                | String                            |         | The log message from the last solution process.                                                                                                                                                                               |
| ntimestepsupdateab3loc | Positive integer                  | 100     | Number of time steps between updates, when<br>updtlvl is set to manual.                                                                                                                                                       |
| odesolver              | erk   ab3   ab3loc                | erk     | Time explicit solver.                                                                                                                                                                                                         |
| plot                   | on   off                          | off     | Plot while solving.                                                                                                                                                                                                           |
| plotfreq               | tsteps   tout                     | tout    | Times to update plot.                                                                                                                                                                                                         |
| plotgroup              | String                            |         | Name of plot group for plot while solving.                                                                                                                                                                                    |
| probefreq              | tsteps   tout                     | tsteps  | Times to update probe.                                                                                                                                                                                                        |
| probes                 | vector of strings                 |         | Probed to use if probesel=manual.                                                                                                                                                                                             |
| probesel               | all   none   manual               | all     | The probes to compute.                                                                                                                                                                                                        |
| rktimestep             | positive scalar                   | 1e-3    | Time step.                                                                                                                                                                                                                    |
| storeudot              | on   off                          | on      | Store time derivatives.                                                                                                                                                                                                       |
| rtstepab3loc           | positive scalar                   | 0.1     | Relative time step level, when updtlvl is set to<br>factor.                                                                                                                                                                   |
| tlist                  | vector of strings                 |         | Specified time list.                                                                                                                                                                                                          |
| tout                   | tlist   tsteps  <br>tstepsclosest | tlist   | Times to store: output times by interpolation;<br>every Nth step taken by solver; or steps taken<br>by solver closest to output times.                                                                                        |
| tstepping              | manual   elemexprs                | manual  | Manual or from expressions time stepping.                                                                                                                                                                                     |
| tstepsstore            | positive integer                  | 1       | Value of N for every Nth step from the solver to<br>store when tout is set to tsteps.                                                                                                                                         |
| updtlvl                | false   manual  <br>factor        | false   | Update time step: off (false), manual, or<br>factor (factor only when odesolver is set<br>to ab3loc).                                                                                                                         |

The order of the Runge–Kutta method can be set by the erkorder property. The size of the time step is controlled through the property rktimestep and can be given as a single scalar value, a (strictly monotone) numeric vector, or an expression using variables with global scope, which results in a scalar. For Adams–Bashforth 3, only a scalar constant value of the time step is allowed. Time stepping from expressions tstepping=elemexprs is useful for the Wave Form PDE interface. A local time-stepping version of Adams–Bashforth 3 is available for the Wave Form PDE interface by odesolver=ab3loc.

# **COMPATIBILITY**

The TimeExplicit time-explicit solver has been removed from the Model Builder in version 6.1 but can still be used in the API. Instead, use the Time solver with an explicit time stepping. The TimeExplicit solver is still

available in the Model Builder if you open models created in versions before 6.1 that include a TimeExplicit solver.

# *TimeParametric*

Handle properties for parameter stepping for a time-dependent problem.

## **SYNTAX**

```
model.sol(sname).create(fname,"Time")
model.sol(sname).feature(fname).create(parname,"TimeParametric")
model.sol(sname).feature(fname).feature(parname).set(pname,pvalue)
```

## **DESCRIPTION**

Attribute feature.

TABLE 6-78: TIME PARAMETRIC PROPERTIES.

| PROPERTY         | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                   |
|------------------|-------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| addsolutions     | boolean           | true    | Add solution data points from the general<br>noncontinuation parameter values lists, if uselsqdata is<br>set to true.                                                                                                                                                                         |
| control          | String            | user    | Name of the controlling study step or user if the feature<br>is controlled manually.                                                                                                                                                                                                          |
| excludelsqvalues | boolean           | true    | Create bounding box from general parameter value lists,<br>if uselsqdata is set to true.                                                                                                                                                                                                      |
| pdistrib         | on   off          | off     | If the solver should distribute the parameter sweep.                                                                                                                                                                                                                                          |
| plist            | real array        |         | List of parameter values. Obsolete, use plistarr<br>instead.                                                                                                                                                                                                                                  |
| plistarr         | real matrix       |         | Lists of parameter values. One row of values for each<br>parameter name.                                                                                                                                                                                                                      |
| pname            | vector of strings |         | Parameter names.                                                                                                                                                                                                                                                                              |
| pwork            | integer           | 1       | Maximum number of distributed groups.                                                                                                                                                                                                                                                         |
| sweeptype        | sparse   filled   | sparse  | Method for doing the parameter variation. For<br>sweeptype = sparse, the parameter tuples defined by<br>the columns in plistarr are solved for. This method<br>requires equal length for the rows. For sweeptype =<br>filled, all parameter combinations given by plistarr<br>are solved for. |
| uselsqdata       | boolean           | true    | Use parameters from least-squares objectives (requires<br>the Optimization Module).                                                                                                                                                                                                           |

# *UpperLimit*

Handle upper limits for segregated steps. This feature can be added as a subfeature to a Segregated feature.

## **SYNTAX**

```
model.sol(sname).feature(solv).feature(segregated).create(fname,"UpperLimit")
model.sol(sname).feature(solv).feature(segregated).feature(fname).set(pname,value)
```

## **DESCRIPTION**

This feature controls the upper limits for variables used in segregated steps.

TABLE 6-79: VALID UPPER LIMIT PROPERTY.

| PROPERTY   | VALUE  | DEFAULT | DESCRIPTION                               |
|------------|--------|---------|-------------------------------------------|
| upperlimit | String |         | String of variable and upper limit pairs. |

A valid upperlimit string contains pairs of variables names and their associated upper limits. For example, to impose an upper limit of 200 for the value of the field u in Component 1, and an upper limit of 90 for the value of the field v in Component 1, use the string "comp1.u 200 comp1.v 90".

## **SEE ALSO**

LowerLimit, Segregated

# *Variables*

Handle initial data and scaling for variables solved, as well as how variables not solved for are computed. The methods are applied for the dependent variables present as Field or State subattributes. These attributes are automatically created and updated by this feature. So, if the Analysis (for the solver sequence) is altered or if a different Analysis is used in the sequence, then the Field attributes are changed accordingly.

#### **SYNTAX**

```
model.sol(sname).create(fname,"Variables")
model.sol(sname).feature(fname).set(pname,pval)
model.sol(sname).feature(fname).feature(varname).set(pname,pval)
model.sol(sname).feature(fname).updateVariables()
```

## **DESCRIPTION**

Operation feature. Computes the initial values for the variables that are solved for and how the variables not solved for are computed. The variables handled are the ones present as Field or State attributes. The feature also handles scaling and which variables to store in output.

Use the updateVariables method if needed to perform a manual update of the variables after some change that affects them.

TABLE 6-80: VALID VARIABLES PROPERTIES.

| PROPERTY   | VALUES                                   | DEFAULT | DESCRIPTION                                                                                                                                                          |
|------------|------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| clist      | String array                             |         | Provide values for constants as input parameters<br>using a string array; for the corresponding constant<br>names, use cname. See The clist and cname<br>Properties. |
| cname      | String array                             |         | Provide names of constants as input parameters<br>using a string array; for the corresponding constant<br>values, use clist. See The clist and cname<br>Properties.  |
| control    | String                                   | user    | Name of the controlling study step or user if the<br>feature is controlled manually.                                                                                 |
| initmethod | init   sol                               | init    | Method used for initial value computation.                                                                                                                           |
| initsol    | zero   solution object                   | zero    | Initial value solution object.                                                                                                                                       |
| initsoluse | current   manual  <br>solution store tag | current | Use current or stored values from the initial value<br>solution object, or use manual to provide a<br>solution index in the initsolusesolnum<br>property.            |

TABLE 6-80: VALID VARIABLES PROPERTIES.

| PROPERTY         | VALUES                                                                              | DEFAULT | DESCRIPTION                                                                                                         |
|------------------|-------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------|
| initsolusesolnum | integer or parameter<br>name                                                        |         | An outer solution index for a parametric sweep,<br>such as a global parameter, when initsoluse is<br>set to manual. |
| manualsolnum     | positive integer                                                                    |         | Identifies the solution used when solnum =<br>manual.                                                               |
| notlistsolnum    | vector of positive integers                                                         |         | List that identifies the solutions used when<br>notsolnum = from_list.                                              |
| notmanualsolnum  | vector of positive integers                                                         |         | Identifies the solutions used when notsolnum =<br>manual.                                                           |
| notsol           | zero   solution object                                                              | zero    | Solution object for variables not solved for.                                                                       |
| notsolmethod     | init   sol                                                                          | init    | Method used for variables not solved for.                                                                           |
| notsolnum        | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Which solnums from other solution to use for<br>variables not solved for.                                           |
| notsoluse        | current   solution store<br>tag                                                     | current | Use current or stored values from the solution<br>object for variables not solved for.                              |
| nott             | double                                                                              |         | The interpolation value used for values of variables<br>not solved for when notsolnum = interp.                     |
| resscalemethod   | auto   manual                                                                       | auto    | Method used for scaling of residual.                                                                                |
| resscaleval      | scalar                                                                              | 1       | Residual scaling value, if resscalemethod is<br>manual.                                                             |
| scalemethod      | auto   init   none  <br>manual                                                      | auto    | Method used for scaling of variables.                                                                               |
| scaleval         | scalar                                                                              | 1       | Global scaling value, if scalemethod is manual.                                                                     |
| solnum           | auto   all   first  <br>last   interp   manual  <br>positive integer                | auto    | The solnum from other solution to use for initial<br>values of variables solved for.                                |
| t                | double                                                                              |         | The interpolation value used for initial values of<br>variables solved for when solnum = interp.                    |
| useinitsol       | on   off                                                                            | off     | Use user-controlled initial values of variables solved<br>for.                                                      |
| usesol           | on   off                                                                            | off     | Use user-controlled values of variables not solved<br>for.                                                          |

TABLE 6-81: VALID VARIABLE SUBATTRIBUTE FIELD/STATE PROPERTIES.

| PROPERTY    | VALUES                               | DEFAULT | DESCRIPTION                                                                             |
|-------------|--------------------------------------|---------|-----------------------------------------------------------------------------------------|
| comp        | vector of strings                    |         | Field/State components                                                                  |
| out         | on   off                             | on      | Store Field/State in output                                                             |
| reconstruct | String                               | none    | Tag of a compatible reduced model to<br>use for reconstruction when solvefor<br>is off. |
| scalemethod | auto   init   none   manual   parent | parent  | Method used for scaling of variables                                                    |
| scaleval    | scalar                               | 1       | Scaling value                                                                           |
| solvefor    | on   off                             | on      | Solve for this Field/State                                                              |

TABLE 6-81: VALID VARIABLE SUBATTRIBUTE FIELD/STATE PROPERTIES.

| PROPERTY    | VALUES                     | DEFAULT | DESCRIPTION                                                              |
|-------------|----------------------------|---------|--------------------------------------------------------------------------|
| storesel    | Array of selection strings |         | Selections defining which field data to<br>store.                        |
| usestoresel | all   selection            | all     | Store all field data or field data defined<br>in selections in storesel. |

The properties initmethod, initsol, and initsoluse determine the initial value for the solution components you solve for when useinitsol is set to on.

The properties notsolmethod, notsol, notsoluse, and notsolnum determine the value of solution components you do not solve when usesol is set to on.

Which variables to solve for, and which variables to store in the solution is controlled by the properties solvefor and out in the Field or State attributes.

The reconstruct property is only available when using model reduction and then to configure reconstruction for dependent variables not solved for.

The properties scalemethod and scaleval determine a scaling of the degrees of freedom that is applied in order to get a more well-conditioned system. The possible values of scalemethod are:

TABLE 6-82: VALUES FOR THE PROPERTY SCALEMETHOD.

| VALUE  | MEANING                                                                                                                                                                           |
|--------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| auto   | The scaling is automatically determined.                                                                                                                                          |
| init   | The scaling is determined from the initial value. Use this if the sizes of the components of the initial<br>value give a good estimate of the order of magnitude of the solution. |
| none   | No scaling is applied.                                                                                                                                                            |
| manual | The scaling is user controlled by setting the property scaleval.                                                                                                                  |
| parent | Scaling method is inherited from the parent Variables feature (only for subattributes).                                                                                           |

# *XmeshInfo*

Get extended mesh information.

#### **SYNTAX**

```
SolverFeature step = model.sol(seqTag).feature(studyStepTag);
XmeshInfo xmi = step.xmeshInfo();
XmeshInfo xmi = step.xmeshInfo(meshCase);
SolverFeature var = model.sol(seqTag).feature(variablesTag);
XmeshInfo xmi = var.xmeshInfo();
XmeshInfo xmi = var.xmeshInfo(meshCase);
XmeshInfo xmi = model.sol(seqTag).xmeshInfo();
XmeshInfo xmi = model.sol(seqTag).xmeshInfo(meshCase);
String[] mcases = xmi.meshCases();
int nDofs = xmi.nDofs();
String[] fieldNames = xmi.fieldNames();
int[] fieldNDofs = xmi.fieldNDofs();
String[] geomTags = xmi.geoms();
String[] meshTypes = xmi.meshTypes();
String[] meshTypes = xmi.meshTypes(geomTag);
XmeshInfoDofs dofs = xmi.dofs();
int[] dofs.geomNums()
int[] dofs.nodes()
double[][] dofs.coords()
String[] dofs.dofNames()
int[] dofs.nameInds()
int[] dofs.solVectorInds()
XmeshInfoNodes nodes = xmi.nodes();
XmeshInfoNodes nodes = xmi.nodes(geomTag);
double[][] nodes.coords()
String[] nodes.dofNames()
int[][] nodes.dofs()
XmeshInfoElements elems = xmi.elements(meshType);
XmeshInfoElements elems = xmi.elements(meshType,geomTag);
double[][] elems.localCoords()
int[][] elems.nodes()
String[] elems.localDofNames()
double[][] elems.localDofCoords()
int[][] elems.dofs()
model.sol(seqTag).feature(studyStepTag).clearXmesh();
model.sol(seqTag).feature(variablesTag).clearXmesh();
```

## **DESCRIPTION**

The Xmesh information methods provide information about the numbering of elements, nodes, and degrees of freedom (DOFs) in the extended mesh and in the matrices returned by Assemble and the solvers.

```
SolverFeature step = model.sol(seqTag).feature(studyStepTag);
XmeshInfo xmi = step.xmeshInfo();
```

returns information about all degrees of freedom in the given study step, for the main mesh case. This includes information about internal degrees of freedom.

```
XmeshInfo xmi = step.xmeshInfo(meshCase);
```

returns information about the given mesh case. The string meshCase can be main, adaptionresidual, or a multigrid level tag.

```
SolverFeature var = model.sol(seqTag).feature(variablesTag);
XmeshInfo xmi = var.xmeshInfo();
XmeshInfo xmi = var.xmeshInfo(meshCase);
```

returns information about the degrees of freedom solved for in the given variables feature. That is, the numbering of the degrees of freedom span over the DOFs solved for, which is the indexing used in the matrices and vectors assembled by the solver. Internal degrees of freedom are not included.

```
XmeshInfo xmi = model.sol(seqTag).xmeshInfo();
XmeshInfo xmi = model.sol(seqTag).xmeshInfo(meshCase);
```

is equivalent to calling xmeshInfo on the last study step feature in the sequence.

```
model.sol(seqTag).feature(studyStepTag).clearXmesh();
model.sol(seqTag).feature(variablesTag).clearXmesh();
```

clears out the Xmesh object created by the call to xmeshInfo. After the required information has been obtained from the XmeshInfo object, this function should be called to release memory. When xmeshInfo is called on a solver sequence, an already existing Xmesh object is used, so there is no need to call clearXmesh.

## *General Information*

String[] mcases = xmi.meshCases() returns a string vector containing tags of all mesh cases.

int nDofs = xmi.nDofs() returns the total number of DOFs.

String[] fieldNames = xmi.fieldNames() returns the field names, or the field names solved for.

int[] fieldNDofs = xmi.fieldNDofs() returns the number of DOFs for each field.

String[] geomTags = xmi.geoms() returns the tags of all geometries that exist in the xmesh.

String[] meshTypes = xmi.meshTypes() returns all mesh types.

String[] meshTypes = xmi.meshTypes(geomTag) returns all mesh types in geometry geomTag (a string). Possible mesh types are vtx, edg, tri, quad, tet, hex, prism, and pyr.

*Information About Each DOF*

XmeshInfoDofs dofs = xmi.dofs() returns information about each DOF.

The class XmeshInfoDofs has the following methods:

TABLE 6-83: XMESHINFODOFS METHODS.

| FIELD                           | CONTENTS                                                                                                                                                                                                                                 |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| int[] geomNums()                | 1-based geometry numbers for all DOFs                                                                                                                                                                                                    |
| int[] nodes()                   | 0-based node numbers for all DOFs.                                                                                                                                                                                                       |
| double[][] coords()             | Global coordinates for all DOFs in the model length unit. The kth column of this<br>matrix contains the coordinates of DOF number k.                                                                                                     |
| double[][]<br>coords(xdGeomTag) | For DOFs in an extra dimension product, return the coordinates of each DOF in<br>the extra dimension geometry xdGeomTag. For DOFs that are not located in an<br>extra dimension product containing xdGeomTag, the value NaN is returned. |
| double[][] gCoords()            | Same as coords() except that coordinates are given in the geometry length unit.<br>If there is more than one geometry, the coordinates of each DOF are given in the<br>length unit of the geometry of that DOF.                          |
| String[] dofNames()             | DOF names                                                                                                                                                                                                                                |
| int[] nameInds()                | 0-based indices into dofNames() for all DOFs.                                                                                                                                                                                            |
| int[] solVectorInds()           | 0-based indices into solution vector for all DOFs.                                                                                                                                                                                       |

*Information About Each Node Point*

XmeshInfoNodes nodes = xmi.nodes() returns information about nodes. This method issues an error if there is more than one geometry.

XmeshInfoNodes nodes = xmi.nodes(geomTag) returns information about nodes in geometry geomTag (a string).

The class XmeshInfoNodes has the following methods:

TABLE 6-84: XMESHINFONODES CLASS METHODS.

| FIELD                | CONTENTS                                                                                                                                                                                                                                                                                  |  |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| double[][] coords()  | Global coordinates for all nodes. The nth column of the matrix coords contains the<br>coordinates of node point number n                                                                                                                                                                  |  |
| double[][] gCoords() | Same as coords() except that coordinates are given in the geometry length unit.                                                                                                                                                                                                           |  |
| String[] dofNames()  | DOF names in this geometry                                                                                                                                                                                                                                                                |  |
| int[][] dofs()       | 0-based DOF numbers for all nodes in this geometry. dofs()[k][n] is the DOF<br>number for DOF name dofNames()[k] at node point n. A value of -1 means that<br>there is no DOF with this name at the node. Note: If there is a slit, only one of the<br>DOFs is given for each node point. |  |

*Information About Each Mesh Element*

XmeshInfoElements[] elems = xmi.elements(meshType) returns information about mesh elements of type meshType (a string). This method issues an error if there is more than one geometry.

XmeshInfoElements[] elems = xmi.elements(meshType,geomTag) returns information about mesh elements of type meshType in geometry geomTag.

The XmeshInfoElements class has the following methods:

TABLE 6-85: XMESHINFOELEMENTS CLASS METHODS.

| FIELD                       | CONTENTS                                                                                                                                                                                                                                                                               |  |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| double[][] localCoords()    | Local coordinates of nodes. The kth column of the matrix localCoords()<br>contains the coordinates of local node point number k.                                                                                                                                                       |  |
| int[][] nodes()             | 0-based node point indices for all mesh elements of type type().<br>nodes()[k][el] is the node point number within geometry geomNum()<br>(see the output xmi.nodes()) for local node point k within mesh element<br>el. A value -1 means that there is no node point at this location. |  |
| String[] localDofNames()    | The name for each local DOF.                                                                                                                                                                                                                                                           |  |
| double[][] localDofCoords() | The local coordinates for each local DOF (one column for each local DOF).                                                                                                                                                                                                              |  |
| int[][] dofs()              | 0-based DOF numbers for all mesh elements of type type().<br>dofs()[k][el] is the DOF number for local DOF k within mesh element<br>el. A value -1 means that there is no DOF at this location.                                                                                        |  |

# Studies and Study Steps

# *Introduction*

In the COMSOL Desktop, you create one or more *studies*, each with one or more *study steps* to compute the solution to a model. The studies generate a solver sequence with the solvers and other solver features that correspond to the study steps in the study.

Study and Study Step Types in the *COMSOL Multiphysics Reference Manual*.

## **CREATING A STUDY AND ADDING STUDY STEP**

The following commands create a study std1 and adds a Stationary study step to that study:

```
model.study().create("std1");
model.study("std1").create("stat", "Stationary");
```

## **RUNNING (COMPUTING) A STUDY**

To run a study, use

```
model.study(<tag>).run();
```

The run() command corresponds to clicking **Compute** on a **Study** node in the COMSOL Desktop.

#### **CREATING A REFERENCE TO A STUDY STEP**

You can also create a reference to an existing study step from a solver sequence:

```
model.sol("sol1").create("st1", "StudyStep");
model.sol("sol1").feature("st1").set("study", "std1");
model.sol("sol1").feature("st1").set("studystep", "stat");
```

## **ATTACHING A STUDY**

It is also possible to attach a study for making a solver sequence or batch feature part of the study sequence:

```
model.sol("sol1").attach("std1");
```

The attach() operation implies calling study(*<tag>*)(see below). You can only have one solver sequence attached to each study but you can have multiple batch features.

#### **ASSOCIATING A SOLVER SEQUENCE WITH A STUDY**

You can associate a solver sequence with a study using the following syntax:

```
model.sol("sol1").study("std1");
```

In contrast, attach() (see above) also makes the solver sequence part of the study sequence.

#### **MAIN STUDY FEATURE SETTINGS**

TABLE 6-86: METHODS FOR THE MAIN STUDY FEATURE SETTINGS.

| METHOD                           | DESCRIPTION                                                                            |
|----------------------------------|----------------------------------------------------------------------------------------|
| isGenConv()                      | True if convergence plots should be generated.                                         |
| isGenIntermediatePlots()         | True if plots for intermediate Stored Solution nodes should be<br>generated.           |
| isGenPlots()                     | True if default results plots should be generated.                                     |
| isPlotUndefVals()                | True if plots should be generated showing locations of undefined<br>values.            |
| isStoreSolution()                | True if a Store Solution node should be generated for each<br>intermediate study step. |
| setGenConv(boolean)              | Set to true if convergence plots should be generated.                                  |
| setGenIntermediatePlots(boolean) | Set to true to generate plots for intermediate Store Solution nodes.                   |
| setGenPlots(boolean)             | Set to true if default results plots should be generated.                              |
| setPlotUndefVals(boolean)        | Set to true to generate plots showing the location of undefined values.                |
| setStoreCompleteHistory(boolean) | Set to true to store the complete solver history.                                      |
| setStoreSolution(boolean)        | Set to true to generate a Store Solution node for each intermediate<br>study step.     |

For example, use

model.study("std1").setGenConv(true);

to generate convergence plots when computing the solution.

## **COMMON STUDY STEP PROPERTIES**

The following table explains properties available for all study steps defining equations:

TABLE 6-87: PHYSICS AND VARIABLES SELECTION

| PROPERTY         | VALUE      | DEFAULT | DESCRIPTION                                                                                                                                  |
|------------------|------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------|
| activate         | String Map |         | Choose physics interfaces and other features<br>to solve for. Allowed keys are                                                               |
|                  |            |         | •<br>A physics interface tag                                                                                                                 |
|                  |            |         | •<br>frame: followed by a Frame entity tag                                                                                                   |
|                  |            |         | •<br>rom: followed by a ReducedModel entity<br>tag                                                                                           |
|                  |            |         | •<br>A component tag followed by :shape<br>controlling shape optimization in the<br>component                                                |
|                  |            |         | •<br>A component tag followed by :topopt<br>controlling topology optimization in the<br>component                                            |
|                  |            |         | Allowed values are on or off. Default depends<br>on the key.                                                                                 |
| activateCoupling | String Map |         | Choose coupling features to solve for. Allowed<br>keys are MultiphysicsCoupling entity tags.<br>Allowed values are on or off. Default is on. |

TABLE 6-87: PHYSICS AND VARIABLES SELECTION

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                               |
|---------------------------|-----------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| activaterom               | String Map      |         | Choose reduced-order model output variables<br>to solve for. Allowed keys are ReducedModel<br>entity tags. Allowed values are on or off.<br>Default is off.                                                                                                               |
| disabledcommon            | Reference Array |         | CommonFeature entities disabled when<br>useadvanceddisable is on. Not all types can be<br>disabled.                                                                                                                                                                       |
| disabledcoordinatesystems | Reference Array |         | Coordinate system features disabled when<br>useadvanceddisable is on. Only types<br>representing PMLs, infinite elements and<br>absorbing layers can be disabled.                                                                                                         |
| disabledcoupling          | Reference Array |         | MultiphysicsCoupling entities disabled<br>when useadvanceddisable is on.                                                                                                                                                                                                  |
| disabledpair              | Reference Array |         | Pair entities disabled useadvanceddisable is<br>on.                                                                                                                                                                                                                       |
| disabledphysics           | Reference Array |         | Physics interfaces and features disabled when<br>useadvanceddisable is on. Allowed<br>reference tags are:                                                                                                                                                                 |
|                           |                 |         | •<br>A physics interface tag                                                                                                                                                                                                                                              |
|                           |                 |         | •<br>A path to a physics feature of the form<br>phys_tag/feature_tag/                                                                                                                                                                                                     |
| disabledreduced           | Reference Array |         | Reduced-order model features disabled when<br>useadvanceddisable is on.                                                                                                                                                                                                   |
| disabledvariables         | Reference Array |         | Variables entities disabled when<br>useadvanceddisable is on.                                                                                                                                                                                                             |
| disableFrameControl       | Reference Array |         | Entities which should not control any frame<br>when useadvanceddisable is on. Allowed<br>reference tags are:                                                                                                                                                              |
|                           |                 |         | •<br>A physics interface tag                                                                                                                                                                                                                                              |
|                           |                 |         | •<br>frame: followed by a Frame entity tag                                                                                                                                                                                                                                |
|                           |                 |         | •<br>A component tag followed by :shape                                                                                                                                                                                                                                   |
|                           |                 |         | controlling shape optimization in the                                                                                                                                                                                                                                     |
|                           |                 |         | component                                                                                                                                                                                                                                                                 |
| discretization            | String Map      |         | Select discretization for physics interfaces.<br>Allowed keys are the same as in activate.<br>Allowed values are physics (also default) and<br>tags of any Discretization feature belonging to<br>the key entity.                                                         |
| equationform              | String Map      |         | Override study step equation form for physics<br>interfaces. Allowed keys are the same as in<br>activate. Allowed values are physics (also<br>default if the physics allows setting equation<br>form) and any equation form allowed by the<br>physics interface settings. |

TABLE 6-87: PHYSICS AND VARIABLES SELECTION

| PROPERTY              | VALUE      | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                       |
|-----------------------|------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| equationform_freq     | String Map |         | Specify frequency to use for a physics interface<br>when its equation form is set to a<br>frequency-domain type using the<br>equationform property. Allowed keys are the<br>same as in activate. Allowed values are<br>parameter expressions. The default is the same<br>as the default in the physics interface settings.                                                                                        |
| equationform_freq_src | String Map |         | Specify whether an equation-based physics<br>interface should define time derivatives using<br>the main frequency of a frequency-domain<br>study step or a specific frequency given in<br>equationform_freq. Allowed values are<br>fromSolver (the default) and userdef.                                                                                                                                          |
| reconstructors        | String Map |         | Choose a reduced-order model to reconstruct<br>dependent variables in a physics interface not<br>solved for. Allowed keys are tags of physics<br>interfaces not solved for and for which there<br>exists at least one reconstructing<br>reduced-order model. Allowed values are none<br>(also default) and tags of ReducedModel<br>entities capable of reconstructing the key<br>interface's dependent variables. |
| useadvanceddisable    | on   off   | off     | Enable advanced frame control and disabling of<br>model entities.                                                                                                                                                                                                                                                                                                                                                 |

#### **PROPERTIES OF SPECIFIC STUDY STEP TYPES**

The following table lists the major study steps with links to documentation of available properties for each study step:

- **•** Batch
- **•** Batch Sweep
- **•** Bidirectionally Coupled Particle Tracing
- **•** Bidirectionally Coupled Ray Tracing
- **•** Cluster Computing
- **•** Cluster Sweep
- **•** Eigenfrequency
- **•** Eigenvalue
- **•** Stationary Then Eigenfrequency
- **•** Frequency Domain and Frequency-Domain Perturbation
- **•** Frequency to Time FFT

- **•** Function Sweep
- **•** Material Sweep
- **•** Model Reduction
- **•** Multigrid Level
- **•** Parametric Sweep
- **•** Ray Tracing
- **•** Sensitivity
- **•** Stationary
- **•** Surrogate Model Training
- **•** Time Dependent
- **•** Time Discrete
- **•** Time to Frequency FFT

# *Batch*

Use a Batch study step to start a COMSOL Multiphysics batch process that solves the current study on your computer.

## **SYNTAX**

```
model.study(stdname).create(fname, "Batch");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-88: PROPERTIES FOR BATCH SETTINGS.

| PROPERTY     | VALUE    | DEFAULT        | DESCRIPTION                                      |
|--------------|----------|----------------|--------------------------------------------------|
| batchfile    | String   | batchmodel.mph | Filename.                                        |
| extsolvergen | on   off | off            | Generate solver sequence in external<br>process. |

#### TABLE 6-89: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                          |
|-------------|----------|---------|--------------------------------------|
| graphics    | on   off | off     | Use graphics.                        |
| maxalive    | Integer  |         | Alive time (seconds).                |
| maxallow    | Integer  |         | Maximum number of simultaneous jobs. |
| maxrestarts | Integer  |         | Maximum number of job restarts.      |

# *Batch Sweep*

Use the Batch Sweep study step to find the solution to a sequence of stationary or time-dependent simulations that arise when you vary some parameters of interest.

## **SYNTAX**

```
model.study(stdname).create(fname, "BatchSweep");
model.study(stdname).feature(fname).set(pname,value);
```

# **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-90: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY  | VALUE             | DEFAULT | DESCRIPTION                                                        |
|-----------|-------------------|---------|--------------------------------------------------------------------|
| plistarr  | Real matrix       |         | List of parameter values. One row of values per<br>parameter name. |
| pname     | Vector of strings |         | Parameter names.                                                   |
| punit     | Vector of strings |         | Parameter units.                                                   |
| sweeptype | filled   sparse   | sparse  | Sweep type.                                                        |

TABLE 6-91: PROPERTIES FOR OUTPUT WHILE SOLVING.

| PROPERTY      | VALUE               | DEFAULT | DESCRIPTION                                    |
|---------------|---------------------|---------|------------------------------------------------|
| accumtable    | String              | new     | Accumulated probe table.                       |
| accumtableall | on   off            | on      | Use all probes for the accumulated probe table |
| probes        | Vector of strings   |         | Probes to use when probesel=manual.            |
| probesel      | all   none   manual | all     | Probes to compute.                             |
| useaccumtable | on   off            | on      | Use accumulated probe table.                   |

TABLE 6-92: PROPERTIES FOR BATCH SETTINGS.

| PROPERTY            | VALUE      | DEFAULT        | DESCRIPTION                                                           |
|---------------------|------------|----------------|-----------------------------------------------------------------------|
| batchfile           | String     | batchmodel.mph | Name of batch model file.                                             |
| clearmesh           | on   off   | on             | Clear meshes.                                                         |
| clearsol            | on   off   | on             | Clear solutions.                                                      |
| extsolvergen        | on   off   | off            | Generate solver sequence in external<br>process.                      |
| paramfilename       | on   index | on             | Add parameter names and values or shorter<br>indices to the filename. |
| savefile            | on   off   | off            | Output model to file.                                                 |
| serverdir           | String     |                | Server directory.                                                     |
| specserverdir       | on   off   | off            | Specify server directory path.                                        |
| sychaccumprobetable | on   off   | on             | Synchronize accumulated probe table.                                  |
| synchsolutions      | on   off   | off            | Synchronize solutions.                                                |

TABLE 6-93: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                          |
|-------------|----------|---------|--------------------------------------|
| graphics    | on   off | off     | Use graphics.                        |
| maxalive    | Integer  |         | Alive time (seconds).                |
| maxallow    | Integer  | 1       | Maximum number of simultaneous jobs. |
| maxrestarts | Integer  |         | Maximum number of job restarts.      |

# *Bidirectionally Coupled Particle Tracing*

The Bidirectionally Coupled Particle Tracing study step is a special case of the Time Dependent study step that is used to model bidirectionally coupled particle-field or fluid-particle interactions. It is available with the Particle Tracing Module. It is similar to the Time Dependent study step but has an additional section called Iterations, which determines the behavior of the iterative solver loop for self-consistently modeling particle-field interactions in the default solver sequence.

## **SYNTAX**

model.study(*stdname*).create(*fname*, "BidirectionallyCoupledParticleTracing"); model.study(*stdname*).feature(*fname*).set(*pname*,*value*);

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-94: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY | VALUE           | DEFAULT | DESCRIPTION                                   |
|----------|-----------------|---------|-----------------------------------------------|
| tlist    | Numeric vector  |         | Time list.                                    |
| usertol  | on   off        | off     | Physics-controlled or user-defined tolerance. |
| rtol     | Positive scalar | 0.01    | Relative tolerance, if usertol is on.         |
| tunit    | String          | s       | Time unit.                                    |

TABLE 6-95: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE    | DEFAULT | DESCRIPTION                               |
|-----------|----------|---------|-------------------------------------------|
| plot      | on   off | off     | Plot while solving.                       |
| plotgroup | String   | default | Plot group to use for plot while solving. |

TABLE 6-95: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                         |
|-----------|---------------------|---------|-------------------------------------|
| probefreq | pout   psteps       | pout    | When to update probes.              |
| probes    | Vector of strings   |         | Probes to use when probesel=manual. |
| probesel  | all   none   manual | all     | Probes to compute.                  |
| plotfreq  | tout   tsteps       | tout    | Where to update plot.               |

TABLE 6-96: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |
| discretization            | String Map      |         | See Physics and Variables Selection. |
| equationform              | String Map      |         | See Physics and Variables Selection. |
| equationform_freq         | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src     | String Map      |         | See Physics and Variables Selection. |
| reconstructors            | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable        | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-97: PROPERTIES FOR ITERATIONS SECTION.

| PROPERTY   | VALUE                       | DEFAULT    | DESCRIPTION                                                                                                                           |
|------------|-----------------------------|------------|---------------------------------------------------------------------------------------------------------------------------------------|
| expr       | String                      | 1          | Global expression used to compute relative error<br>when method=convergence.                                                          |
| iter       | Positive integer            | 5          | Number of iterations of the solver loop when<br>method=iterations.                                                                    |
| maxiter    | Positive integer            | 25         | Maximum number of iterations in the solver loop<br>when method=convergence.                                                           |
| method     | convergence  <br>iterations | iterations | Choose whether termination of the solver loop<br>is based on the convergence of a global variable<br>or a fixed number of iterations. |
| miniter    | Positive integer            | 1          | Minimum number of iterations in the solver loop<br>when method=convergence.                                                           |
| rtolterm   | Positive real number        | 0.001      | Relative tolerance for termination of the solver<br>loop when method=convergence.                                                     |
| rtolthresh | Positive real number        | 1          | Threshold used to avoid division by zero while<br>computing the relative error when<br>method=convergence.                            |

TABLE 6-98: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| initmethod         | init   sol                                                                          | init    | Method for initial values for variables solved for.                                                                                                                    |
| initstudy          | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| manualsolnum       | Vector of integers                                                                  | [1]     | Index to solution for initial value for variables<br>solved for.                                                                                                       |
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer                      | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                                              |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |
| useinitsol         | on   off                                                                            | off     | User-controlled initial values for variables<br>solved for.                                                                                                            |
| usesol             | on   off                                                                            | off     | User-controlled values for variables not solved<br>for.                                                                                                                |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-99: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-100: PROPERTIES FOR MESH ADAPTATION AND STUDY EXTENSIONS.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                               |
|----------------|-------------------|---------|-------------------------------------------------------------------------------------------|
| adapgeom       | String            |         | Name of geometry to use.                                                                  |
| adaption       | on   off          | off     | Adaptive mesh refinement.                                                                 |
| adaptselection | selection         | all()   | The selection for the adaptation (the default is<br>the entire geometry). See Selections. |
| autoremesh     | on   off          | off     | Automatic remeshing.                                                                      |
| autoremeshgeom | String            |         | Name of geometry to use.                                                                  |
| plistarr       | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                        |
| pname          | Vector of strings |         | Parameter names.                                                                          |
| punit          | Vector of strings |         | Parameter units.                                                                          |
| sweeptype      | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                                   |
| useparam       | on   off          | off     | Auxiliary sweep.                                                                          |

# *Bidirectionally Coupled Ray Tracing*

The Bidirectionally Coupled Particle Tracing study step is a special case of the Ray Tracing study step that is used to model bidirectionally coupled particle-field or fluid-particle interactions. It is available with the Ray Optics Module. It is similar to the Ray Tracing study step but has an additional section called Iterations, which determines the behavior of the iterative solver loop for self-consistently modeling ray-field interactions in the default solver sequence.

## **SYNTAX**

```
model.study(stdname).create(fname, "BidirectionallyCoupledRayTracing");
model.study(stdname).feature(fname).set(pname,value);
```

# **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-101: PROPERTIES FOR BIDIRECTIONALLY COUPLED RAY TRACING STUDY SETTINGS.

| PROPERTY            | VALUE                                                | DEFAULT                  | DESCRIPTION                                                                                             |
|---------------------|------------------------------------------------------|--------------------------|---------------------------------------------------------------------------------------------------------|
| charvel             | String                                               | c_const<br>or<br>343 m/s | Group velocity used to convert path lengths to<br>solution times when<br>timestepspec=specifylength.    |
| llist               | Numeric vector                                       |                          | List of path lengths when<br>timestepspec=specifylength.                                                |
| lunit               | String                                               | m                        | Length unit when<br>timestepspec=specifylength.                                                         |
| numberofreflections | Positive integer                                     | 5                        | Maximum number of reflections per ray for<br>automatic stop conditions when<br>raystopcond=reflections. |
| raystopcond         | nostop   noactive  <br>rayintensity  <br>reflections | nostop                   | Automatic stop condition in the default solver<br>sequence.                                             |
| rtol                | Positive scalar                                      | 0.01                     | Relative tolerance, if usertol is on.                                                                   |
| thresholdintensity  | String                                               | 1[W/m^2]                 | Threshold intensity for automatic stop<br>conditions when<br>raystopcond=rayintensity.                  |

TABLE 6-101: PROPERTIES FOR BIDIRECTIONALLY COUPLED RAY TRACING STUDY SETTINGS.

| PROPERTY     | VALUE                          | DEFAULT         | DESCRIPTION                                                                                 |
|--------------|--------------------------------|-----------------|---------------------------------------------------------------------------------------------|
| timestepspec | specifytime  <br>specifylength | specifyt<br>ime | Determines whether the time intervals are<br>entered directly or in terms of a path length. |
| tlist        | Numeric vector                 |                 | Time list when<br>timestepspec=specifytime.                                                 |
| tunit        | String                         | ns or ms        | Time unit when<br>timestepspec=specifytime.                                                 |
| usertol      | on   off                       | off             | Physics-controlled or user-defined tolerance.                                               |

#### TABLE 6-102: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |
| plotfreq  | tout   tsteps       | tout    | Where to update plot.                     |

TABLE 6-103: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |
| discretization            | String Map      |         | See Physics and Variables Selection. |
| equationform              | String Map      |         | See Physics and Variables Selection. |
| equationform_freq         | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src     | String Map      |         | See Physics and Variables Selection. |
| reconstructors            | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable        | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-104: PROPERTIES FOR ITERATIONS SECTION.

| PROPERTY | VALUE            | DEFAULT | DESCRIPTION                                                                  |
|----------|------------------|---------|------------------------------------------------------------------------------|
| expr     | String           | 1       | Global expression used to compute relative error<br>when method=convergence. |
| iter     | Positive integer | 5       | Number of iterations of the solver loop when<br>method=iterations.           |
| maxiter  | Positive integer | 25      | Maximum number of iterations in the solver loop<br>when method=convergence.  |

TABLE 6-104: PROPERTIES FOR ITERATIONS SECTION.

| PROPERTY   | VALUE                       | DEFAULT    | DESCRIPTION                                                                                                                           |
|------------|-----------------------------|------------|---------------------------------------------------------------------------------------------------------------------------------------|
| method     | convergence  <br>iterations | iterations | Choose whether termination of the solver loop<br>is based on the convergence of a global variable<br>or a fixed number of iterations. |
| miniter    | Positive integer            | 1          | Minimum number of iterations in the solver loop<br>when method=convergence.                                                           |
| rtolterm   | Positive real number        | 0.001      | Relative tolerance for termination of the solver<br>loop when method=convergence.                                                     |
| rtolthresh | Positive real number        | 1          | Threshold used to avoid division by zero while<br>computing the relative error when<br>method=convergence.                            |

TABLE 6-105: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| initmethod         | init   sol                                                                          | init    | Method for initial values for variables solved for.                                                                                                                    |
| initstudy          | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| manualsolnum       | Vector of integers                                                                  | [1]     | Index to solution for initial value for variables<br>solved for.                                                                                                       |
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer                      | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                                              |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |
| useinitsol         | on   off                                                                            | off     | User-controlled initial values for variables<br>solved for.                                                                                                            |
| usesol             | on   off                                                                            | off     | User-controlled values for variables not solved<br>for.                                                                                                                |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-106: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-107: PROPERTIES FOR MESH ADAPTATION AND STUDY EXTENSIONS.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                               |
|----------------|-------------------|---------|-------------------------------------------------------------------------------------------|
| adapgeom       | String            |         | Name of geometry to use.                                                                  |
| adaption       | on   off          | off     | Adaptive mesh refinement.                                                                 |
| adaptselection | selection         | all()   | The selection for the adaptation (the default is<br>the entire geometry). See Selections. |
| autoremesh     | on   off          | off     | Automatic remeshing.                                                                      |
| autoremeshgeom | String            |         | Name of geometry to use.                                                                  |
| classicadap    | on   off          | off     | If on, use adaptive method for vector elements<br>from version 6.0 and earlier.           |
| plistarr       | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                        |
| pname          | Vector of strings |         | Parameter names.                                                                          |
| punit          | Vector of strings |         | Parameter units.                                                                          |
| sweeptype      | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                                   |
| useparam       | on   off          | off     | Auxiliary sweep.                                                                          |

# *Cluster Computing*

Use the Cluster Computing study step when you want to submit COMSOL Multiphysics batch jobs to a job scheduler that in turn runs the batch job on a second computer or cluster.

#### **SYNTAX**

```
model.study(stdname).create(fname, "ClusterComputing");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-108: PROPERTIES FOR CLUSTER COMPUTING SETTINGS.

| PROPERTY     | VALUE                                                     | DEFAULT        | DESCRIPTION                                      |
|--------------|-----------------------------------------------------------|----------------|--------------------------------------------------|
| batchfile    | String                                                    | batchmodel.mph | Name of batch model file.                        |
| batchlic     | on   off                                                  |                | Use batch license.                               |
| clustertype  | general   whpc2008  <br>sge   slurm   pbs  <br>lsf   none |                | The type of cluster job.                         |
| extsolvergen | on   off                                                  | off            | Generate solver sequence in external<br>process. |

TABLE 6-108: PROPERTIES FOR CLUSTER COMPUTING SETTINGS.

| PROPERTY      | VALUE    | DEFAULT | DESCRIPTION                                                                               |
|---------------|----------|---------|-------------------------------------------------------------------------------------------|
| hostfile      | String   |         | Path to host file.                                                                        |
| mpiargs       | String   |         | Additional MPI arguments.                                                                 |
| mpibootstrap  | String   |         | Name of bootstrap server.                                                                 |
| mpipath       | String   |         | Installation directory for MPI.                                                           |
| nn            | Integer  | 1       | Number of nodes.                                                                          |
| rundir        | String   |         | The directory to store files used by the<br>batch job.                                    |
| schedargs     | String   |         | Additional scheduler arguments                                                            |
| scheduler     | String   |         | The scheduler for the batch job, if<br>clustertype is whpc2008, slurm, or<br>pbs, or lsf. |
| serverdir     | String   |         | Server directory.                                                                         |
| sgequeue      | String   |         | The name for the cluster queue, if<br>clustertype is sge, slurm, pbs, or<br>lsf.          |
| specbatchdir  | on   off |         | Specify different directory for batch<br>process than used by the current<br>process.     |
| specserverdir | on   off | off     | Specify server directory path.                                                            |
| user          | String   |         | User account for submitting the job if<br>clustertype is whpc2008, slurm,<br>pbs, or lsf. |

#### TABLE 6-109: PROPERTY FOR CLUSTER SETTINGS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                  |
|----------|----------|---------|------------------------------|
| pdistrib | on   off | off     | Distribute parametric sweep. |

#### TABLE 6-110: PROPERTIES FOR REMOTE AND CLOUD ACCESS.

| PROPERTY                | VALUE                             | DEFAULT | DESCRIPTION                                                                              |
|-------------------------|-----------------------------------|---------|------------------------------------------------------------------------------------------|
| filecmd                 | String                            |         | File for commands when remotecmd is file.                                                |
| filetransfercmd         | none   scp   file  <br>user       | none    | Command transfer file.                                                                   |
| filetransferfrom        | String                            |         | List of files to transfer from the other<br>computer after the batch jobs have finished. |
| filetransferfromusercmd | String                            |         | Command to transfer files from remote<br>location.                                       |
| filetransferto          | String                            |         | List of files to transfer to the other computer<br>before running the batch job.         |
| filetransfertousercmd   | String                            |         | Command to transfer files to remote location.                                            |
| remote                  | on   off                          |         | Run on remote server.                                                                    |
| remotecmd               | none   ssh   file  <br>mpi   user |         | Command to use when invoking a command on<br>a remote server.                            |
| remotehosts             | String                            |         | List of remote hostnames.                                                                |
| remoteos                | native   windows  <br>linux       |         | Command transfer file.                                                                   |
| remoteusercmd           | String                            |         | Command to use when invoking a command on<br>a remote server.                            |
| scpkey                  | String                            |         | SCP key file.                                                                            |

TABLE 6-110: PROPERTIES FOR REMOTE AND CLOUD ACCESS.

| PROPERTY    | VALUE              | DEFAULT | DESCRIPTION                                   |
|-------------|--------------------|---------|-----------------------------------------------|
| scppath     | String             |         | Directory where SCP resides.                  |
| scpuser     | String             |         | Username used by SCP.                         |
| scpusercmd  | String             |         | Command for copying files to remote location. |
| sshcmd      | ssh   putty   user |         | SSH command.                                  |
| sshkey      | String             |         | SSH key file.                                 |
| sshpath     | String             |         | Directory where SSH resides.                  |
| sshporthost | String             |         | Port host.                                    |
| sshports    | String             |         | Ports that should be forwarded by SSH.        |
| sshuser     | String             |         | Username used by SSH.                         |

TABLE 6-111: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                          |
|-------------|----------|---------|--------------------------------------|
| graphics    | on   off | off     | Use graphics.                        |
| maxalive    | Integer  |         | Alive time (seconds).                |
| maxallow    | Integer  | 1       | Maximum number of simultaneous jobs. |
| maxrestarts | Integer  |         | Maximum number of job restarts.      |

# *Cluster Sweep*

Use the Cluster Sweep study step when you want to study to solve several models in parallel where each model has a different set of parameters.

## **SYNTAX**

```
model.study(stdname).create(fname, "ClusterSweep");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-112: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY  | VALUE             | DEFAULT | DESCRIPTION                                                        |
|-----------|-------------------|---------|--------------------------------------------------------------------|
| plistarr  | Real matrix       |         | List of parameter values. One row of values per<br>parameter name. |
| pname     | Vector of strings |         | Parameter names.                                                   |
| punit     | Vector of strings |         | Parameter units.                                                   |
| sweeptype | filled   sparse   | sparse  | Sweep type.                                                        |

TABLE 6-113: PROPERTIES FOR OUTPUT WHILE SOLVING.

| PROPERTY      | VALUE               | DEFAULT | DESCRIPTION                                     |
|---------------|---------------------|---------|-------------------------------------------------|
| accumtable    | String              | new     | Accumulated probe table.                        |
| accumtableall | on   off            | on      | Use all probes for the accumulated probe table. |
| probes        | Vector of strings   |         | Probes to use when probesel=manual.             |
| probesel      | all   none   manual | all     | Probes to compute.                              |
| useaccumtable | on   off            | on      | Use an accumulated probe table.                 |

TABLE 6-114: PROPERTIES FOR BATCH SETTINGS.

| PROPERTY             | VALUE                                                     | DEFAULT        | DESCRIPTION                                                                           |
|----------------------|-----------------------------------------------------------|----------------|---------------------------------------------------------------------------------------|
| batchfile            | String                                                    | batchmodel.mph | Name of batch model file.                                                             |
| batchlic             | on   off                                                  |                | Use batch license.                                                                    |
| clearmesh            | on   off                                                  | on             | Clear meshes.                                                                         |
| clearsol             | on   off                                                  | on             | Clear solutions.                                                                      |
| clustertype          | general   whpc2008  <br>sge   slurm   pbs  <br>lsf   none |                | The type of cluster job.                                                              |
| extsolvergen         | on   off                                                  | off            | Generate solver sequence in external<br>process.                                      |
| hostfile             | String                                                    |                | Path to host file.                                                                    |
| mpiargs              | String                                                    |                | Additional MPI arguments.                                                             |
| mpibootstrap         | String                                                    |                | Name of bootstrap server.                                                             |
| mpipath              | String                                                    |                | Installation directory for MPI.                                                       |
| nn                   | Integer                                                   | 1              | Number of nodes.                                                                      |
| paramfilename        | on   index                                                | on             | Add parameter names and values or<br>shorter indices to the filename.                 |
| rundir               | String                                                    |                | The directory to store files used by the<br>batch job.                                |
| savefile             | on   off                                                  | off            | Output model to file.                                                                 |
| serverdir            | String                                                    |                | Server directory.                                                                     |
| specbatchdir         | on   off                                                  |                | Specify different directory for batch<br>process than used by the current<br>process. |
| specserverdir        | on   off                                                  | off            | Specify server directory path.                                                        |
| synchaccumprobetable | on   off                                                  | on             | Synchronize accumulated probe table.                                                  |
| synchsolutions       | on   off                                                  | off            | Synchronize solutions.                                                                |

TABLE 6-115: PROPERTIES FOR REMOTE AND CLOUD ACCESS.

| PROPERTY                | VALUE                       | DEFAULT | DESCRIPTION                                                   |
|-------------------------|-----------------------------|---------|---------------------------------------------------------------|
| filetransfercmd         | none   scp   user           | none    | Command transfer file.                                        |
| filetransferfromusercmd | String                      |         | Command to transfer files from remote<br>location.            |
| filetransfertousercmd   | String                      |         | Command to transfer files to remote location.                 |
| remote                  | on   off                    |         | Run on remote server.                                         |
| remotecmd               | none   ssh   user           |         | Command to use when invoking a command on<br>a remote server. |
| remotehosts             | String                      |         | List of remote hostnames.                                     |
| remoteos                | native   windows  <br>linux |         | OS used on remote hosts.                                      |
| remoteusercmd           | String                      |         | Command to use when invoking a command on<br>a remote server. |
| scpkey                  | String                      |         | SCP key file.                                                 |
| scppath                 | String                      |         | Directory where SCP resides.                                  |
| scpuser                 | String                      |         | Username used by SCP.                                         |
| scpusercmd              | String                      |         | Command for copying files to remote location.                 |

TABLE 6-115: PROPERTIES FOR REMOTE AND CLOUD ACCESS.

| PROPERTY    | VALUE              | DEFAULT | DESCRIPTION                            |
|-------------|--------------------|---------|----------------------------------------|
| sshcmd      | ssh   putty   user |         | SSH command.                           |
| sshkey      | String             |         | SSH key file.                          |
| sshpath     | String             |         | Directory where SSH resides.           |
| sshporthost | String             |         | Port host.                             |
| sshports    | String             |         | Ports that should be forwarded by SSH. |
| sshuser     | String             |         | Username used by SSH.                  |

TABLE 6-116: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                          |
|-------------|----------|---------|--------------------------------------|
| graphics    | on   off | off     | Use graphics.                        |
| maxalive    | Integer  |         | Alive time (seconds).                |
| maxallow    | Integer  | 1       | Maximum number of simultaneous jobs. |
| maxrestarts | Integer  |         | Maximum number of job restarts.      |

# *Eigenfrequency*

The Eigenfrequency study step is used to compute eigenmodes and eigenfrequencies of a linear or linearized model.

## **SYNTAX**

```
model.study(stdname).create(fname, "Eigenfrequency");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-117: PROPERTIES FOR EIGENFREQUENCY STUDY SETTINGS.

| PROPERTY     | VALUE                                           | DEFAULT | DESCRIPTION                                                                                                                                           |
|--------------|-------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| appnreigs    | Integer                                         | 20      | Approximate number of eigenfrequencies.                                                                                                               |
| approxnep    | tol   fixed                                     | tol     | Taylor expansion truncation using a tolerance<br>or a fixed truncation, when eigsolver is set<br>to arpacknonlinear.                                  |
| chkeigregion | on   off                                        | on      | Perform consistency check.                                                                                                                            |
| eigli        | Real scalar                                     | 0       | Largest imaginary part.                                                                                                                               |
| eiglr        | Real scalar                                     | 0       | Largest real part.                                                                                                                                    |
| eigmethod    | manual   region  <br>all                        | manual  | Eigenfrequency search method; the all<br>method finds all eigenvalues for a full matrix<br>and can only be used for small eigenfrequency<br>problems. |
| eigsi        | Real scalar                                     | 0       | Smallest imaginary part.                                                                                                                              |
| eigsolver    | arpack   feast  <br>lapack  <br>arpacknonlinear | arpack  | Which eigenfrequency solver to use: ARPACK,<br>FEAST, LAPACK (filled matrix), or ARPACK<br>nonlinear.                                                 |
| eigsr        | Real scalar                                     | 0       | Smallest real part.                                                                                                                                   |
| eigwhich     | lm   lr   sr   li   si                          | lm      | Eigenfrequency search method around shift.                                                                                                            |
| expdegnep    | Integer                                         | 3       | Degree of the Taylor expansion, if approxnep<br>is set to fixed.                                                                                      |

TABLE 6-117: PROPERTIES FOR EIGENFREQUENCY STUDY SETTINGS.

| PROPERTY         | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                         |
|------------------|------------------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------------------------------------------|
| linplistsolnum   | Integer array                                                                      | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to from_list.       |
| linpmanualsolnum | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual. |
| linpmethod       | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.             |
| linpsol          | zero   solution object                                                             | zero            | Linearization point solution.                                                                       |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1               | Indices to solutions to use as linearization<br>points.                                             |
| linpsoluse       | current   manual  <br>solution store tag                                           | current         | Subsolution that defines linearization point for<br>the Eigenfrequency study step.                  |
| linpsolusesolnum | Integer                                                                            | 1               | Index for the solution to use when<br>linpsoluse is set to manual.                                  |
| linpstudy        | String                                                                             | zero            | Study that defines linearization point for the<br>Eigenfrequency study step.                        |
| linpt            | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                 |
| maxdegnep        | Integer                                                                            | 5               | The maximum degree for the Taylor expansion<br>truncation, if approxnep is set to tol.              |
| maxnreigs        | Integer                                                                            | 200             | Maximum number of eigenfrequencies.                                                                 |
| neigs            | Integer                                                                            | 6               | Desired number of eigenfrequencies.                                                                 |
| neigsactive      | on   off                                                                           | off             | Set desired number of eigenfrequencies.                                                             |
| pdistrib         | on   off                                                                           | off             | Distribute parametric sweep.                                                                        |
| scalingnep       | double                                                                             | 1               | Eigenvalue scaling factor, when eigsolver is<br>set to arpacknonlinear.                             |
| shift            | Complex scalar                                                                     | 0               | Shift.                                                                                              |
| shiftactive      | on   off                                                                           | off             | Use shift.                                                                                          |
| toltruncationnep | double                                                                             | 1E-12           | Tolerance for the Taylor expansion truncation,<br>if approxnep is set to tol.                       |
| useparam         | on   off                                                                           | off             | Auxiliary sweep.                                                                                    |

TABLE 6-118: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |

TABLE 6-118: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY              | VALUE           | DEFAULT | DESCRIPTION                          |
|-----------------------|-----------------|---------|--------------------------------------|
| disableFrameControl   | Reference Array |         | See Physics and Variables Selection. |
| discretization        | String Map      |         | See Physics and Variables Selection. |
| equationform          | String Map      |         | See Physics and Variables Selection. |
| equationform_freq     | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src | String Map      |         | See Physics and Variables Selection. |
| reconstructors        | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable    | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-119: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-120: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

The following ARPACK properties are available when eigsolver is set to arpack and useparam (auxiliary sweep) is on:

TABLE 6-121: ARPACK PROPERTIES FOR AUXILIARY SWEEPS

| PROPERTY            | VALUE                   | DEFAULT | DESCRIPTION                                                                                                                                                                                   |
|---------------------|-------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| auxsweepeigval      | default  <br>preveigval | default | ARPACK starting vector: the default or from<br>previous eigenfrequencies.                                                                                                                     |
| auxsweepeigvalshift | average  <br>closest    | closest | ARPACK shift from previous eigenfrequencies:<br>average of converged eigenfrequencies or<br>eigenfrequency closest to the previous shift, if<br>auxsweepeigvec is set to preveigvec.          |
| auxsweepeigvec      | default  <br>preveigvec | default | ARPACK shift: as specified (default) or based on<br>eigenfrequencies from last parameter (preveigvec).                                                                                        |
| auxsweepeigvecstart | sum   closest           | sum     | ARPACK starting vector from previous<br>eigenfrequencies: summation of all eigenvalues or<br>eigenvector with eigenfrequency closest to the<br>shift, if auxsweepeigval is set to preveigval. |

For the adaptation and error estimates settings, see Table 6-171.

# *Eigenvalue*

The Eigenvalue study step is used to compute eigenmodes and eigenvalues of a linear or linearized model.

## **SYNTAX**

```
model.study(stdname).create(fname, "Eigenvalue");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-122: PROPERTIES FOR THE EIGENVALUE STUDY SETTINGS.

| PROPERTY     | VALUE                                           | DEFAULT | DESCRIPTION                                                                                                                                |
|--------------|-------------------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------|
| appnreigs    | Integer                                         | 20      | Approximate number of eigenvalues.                                                                                                         |
| approxnep    | tol   fixed                                     | tol     | Taylor expansion truncation using a tolerance<br>or a fixed truncation, when eigsolver is set<br>to arpacknonlinear.                       |
| chkeigregion | on   off                                        | on      | Perform consistency check.                                                                                                                 |
| eigli        | Real scalar                                     | 0       | Largest imaginary part.                                                                                                                    |
| eiglr        | Real scalar                                     | 0       | Largest real part.                                                                                                                         |
| eigmethod    | manual   region  <br>all                        | manual  | Eigenvalue search method; the all method<br>finds all eigenvalues for a full matrix and can<br>only be used for small eigenvalue problems. |
| eigsi        | Real scalar                                     | 0       | Smallest imaginary part.                                                                                                                   |
| eigsolver    | arpack   feast  <br>lapack  <br>arpacknonlinear | arpack  | Which eigenvalue solver to use: ARPACK,<br>FEAST, LAPACK (filled matrix), or ARPACK<br>nonlinear.                                          |
| eigsr        | Real scalar                                     | 0       | Smallest real part.                                                                                                                        |
| eigwhich     | lm   lr   sr   li   si                          | lm      | Eigenfrequency search method around shift.                                                                                                 |
| expdegnep    | Integer                                         | 3       | Degree of the Taylor expansion, if approxnep<br>is set to fixed.                                                                           |

TABLE 6-122: PROPERTIES FOR THE EIGENVALUE STUDY SETTINGS.

| PROPERTY         | VALUE                                                                              | DEFAULT         | DESCRIPTION                                                                                         |
|------------------|------------------------------------------------------------------------------------|-----------------|-----------------------------------------------------------------------------------------------------|
| linplistsolnum   | Integer array                                                                      | new<br>int[]{1} | List of solutions to use for the linearization<br>point, when linpsolnum is set to from_list.       |
| linpmanualsolnum | Integer array                                                                      | new<br>int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual. |
| linpmethod       | init   sol                                                                         | init            | Method used for linearization point, which for<br>sol is given by the linpsol property.             |
| linpsol          | zero   solution object                                                             | zero            | Linearization point solution.                                                                       |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1               | Indices to solutions to use as linearization<br>points.                                             |
| linpsoluse       | current   manual  <br>solution store tag                                           | current         | Subsolution that defines linearization point for<br>the Eigenvalue study step.                      |
| linpsolusesolnum | Integer                                                                            | 1               | Index for the solution to use when<br>linpsoluse is set to manual.                                  |
| linpstudy        | String                                                                             | zero            | Study that defines linearization point for the<br>Eigenvalue study step.                            |
| linpt            | double                                                                             | 0               | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                 |
| maxdegnep        | Integer                                                                            | 5               | The maximum degree for the Taylor expansion<br>truncation, if approxnep is set to tol.              |
| maxnreigs        | Integer                                                                            | 200             | Maximum number of eigenvalues.                                                                      |
| neigs            | Integer                                                                            | 6               | Desired number of eigenvalues.                                                                      |
| neigsactive      | on   off                                                                           | off             | Set desired number of eigenvalues.                                                                  |
| pdistrib         | on   off                                                                           | off             | Distribute parametric sweep.                                                                        |
| scalingnep       | double                                                                             | 1               | Eigenvalue scaling factor, when eigsolver is<br>set to arpacknonlinear.                             |
| shift            | Complex scalar                                                                     | 0               | Shift.                                                                                              |
| shiftactive      | on   off                                                                           | off             | Use shift.                                                                                          |
| toltruncationnep | double                                                                             | 1E-12           | Tolerance for the Taylor expansion truncation,<br>if approxnep is set to tol.                       |
| useparam         | on   off                                                                           | off             | Auxiliary sweep.                                                                                    |

TABLE 6-123: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |

TABLE 6-123: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY              | VALUE           | DEFAULT | DESCRIPTION                          |
|-----------------------|-----------------|---------|--------------------------------------|
| disableFrameControl   | Reference Array |         | See Physics and Variables Selection. |
| discretization        | String Map      |         | See Physics and Variables Selection. |
| equationform          | String Map      |         | See Physics and Variables Selection. |
| equationform_freq     | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src | String Map      |         | See Physics and Variables Selection. |
| reconstructors        | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable    | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-124: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-125: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

The following ARPACK properties are available when eigsolver is set to arpack and useparam (auxiliary sweep) is on:

TABLE 6-126: ARPACK PROPERTIES FOR AUXILIARY SWEEPS

| PROPERTY            | VALUE                   | DEFAULT | DESCRIPTION                                                                                                                                                                               |
|---------------------|-------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| auxsweepeigval      | default  <br>preveigval | default | ARPACK starting vector: the default or from<br>previous eigenvalues.                                                                                                                      |
| auxsweepeigvalshift | average  <br>closest    | closest | ARPACK shift from previous eigenvalues: average of<br>converged eigenvalues or eigenvalue closest to the<br>previous shift, if auxsweepeigvec is set to<br>preveigvec.                    |
| auxsweepeigvec      | default  <br>preveigvec | default | ARPACK shift: as specified (default) or based on<br>eigenvalues from last parameter (preveigvec).                                                                                         |
| auxsweepeigvecstart | sum   closest           | sum     | ARPACK starting vector from previous<br>eigenfrequencies: summation of all eigenvalues or<br>eigenvector with eigenvalue closest to the shift, if<br>auxsweepeigval is set to preveigval. |

For the adaptation and error estimates settings, see Table 6-171.

# *Stationary Then Eigenfrequency*

The Stationary Then Eigenfrequency study step is primarily intended for use with optimization, see the description of the Stationary Then Eigenfrequency study step in the reference manual.

## **SYNTAX**

```
model.study(stdname).create(fname, "StationaryEigenfrequency");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The available properties are identical to those of the Eigenfrequency study step.

# *Frequency Domain and Frequency-Domain Perturbation*

A Frequency Domain study step is used to compute the response of a linear or linearized model subjected to harmonic excitation for one or several frequencies. A Frequency-Domain Perturbation study step is used for studying small oscillations about a biased solution (small-signal analysis).

## **SYNTAX**

```
model.study(stdname).create(fname, "Frequency");
model.study(stdname).create(fname, "Frequencylinearized");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available. The properties for linearization point are only available for the Frequency-Domain Perturbation study step (see Table 6-133 below).

TABLE 6-127: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY       | VALUE       | DEFAULT | DESCRIPTION            |
|----------------|-------------|---------|------------------------|
| loadparameters | String      |         | Load parameter values. |
| plist          | Real vector |         | Frequencies.           |

TABLE 6-127: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY  | VALUE           | DEFAULT | DESCRIPTION                                                                                                     |
|-----------|-----------------|---------|-----------------------------------------------------------------------------------------------------------------|
| preusesol | no   yes   auto | no      | Reuse solution from previous step. The default<br>is auto for MeanEnergies and<br>ReducedElectricField studies. |
| punit     | String          | Hz      | Frequency unit.                                                                                                 |
| stol      | Positive scalar | 0.001   | Relative tolerance, is usestol is set to true.                                                                  |
| usestol   | Boolean         | false   | Use a user-defined relative tolerance.                                                                          |

#### TABLE 6-128: PROPERTIES FOR RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |

#### TABLE 6-129: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |
| discretization            | String Map      |         | See Physics and Variables Selection. |
| equationform              | String Map      |         | See Physics and Variables Selection. |
| equationform_freq         | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src     | String Map      |         | See Physics and Variables Selection. |
| reconstructors            | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable        | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-130: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY        | VALUE              | DEFAULT | DESCRIPTION                                                               |
|-----------------|--------------------|---------|---------------------------------------------------------------------------|
| initmethod      | init   sol         | init    | Method for initial values for variables solved for.                       |
| initstudy       | String             |         | Reference to study or "zero" for zero<br>solution.                        |
| manualsolnum    | Vector of integers | [1]     | Index to solution for initial value for variables<br>solved for.          |
| notlistsolnum   | Vector of integers | [1]     | Indices to selected solutions for values for<br>variables not solved for. |
| notmanualsolnum | Vector of integers | [1]     | Indices to solutions for values for variables not<br>solved for.          |
| notsolmethod    | init   sol         | init    | Method for values for variables not solved for.                           |

TABLE 6-130: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer                      | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                                              |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |
| useinitsol         | on   off                                                                            | off     | User-controlled initial values for variables<br>solved for.                                                                                                            |
| usesol             | on   off                                                                            | off     | User-controlled values for variables not solved<br>for.                                                                                                                |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-131: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-132: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY          | VALUE              | DEFAULT | DESCRIPTION                                                                                   |
|-------------------|--------------------|---------|-----------------------------------------------------------------------------------------------|
| awe               | on   off           | off     | Use asymptotic waveform evaluation.                                                           |
| awefunc           | Vector of strings  |         | AWE expressions.                                                                              |
| pcontinuation     | String             |         | Continuation parameter when<br>pcontinuationmode = manual.                                    |
| pcontinuationmode | no   last   manual | last    | Determines if a continuation sweep should be<br>performed for one of the parameters in pname. |
| pdistrib          | on   off           | off     | Distribute parametric sweep.                                                                  |
| plistarr          | Real matrix        |         | List of parameter values. One row of values per<br>parameter name.                            |

TABLE 6-132: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY  | VALUE             | DEFAULT | DESCRIPTION                             |
|-----------|-------------------|---------|-----------------------------------------|
| pname     | Vector of strings |         | Parameter names.                        |
| punit     | String            |         | Parameter units.                        |
| sweeptype | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep. |
| useparam  | on   off          | off     | Auxiliary sweep.                        |

TABLE 6-133: LINEARIZATION POINT PROPERTIES FOR THE FREQUENCY-DOMAIN PERTURBATION STUDY STEP

| PROPERTY         | VALUE                                                                              | DEFAULT      | DESCRIPTION                                                                                         |
|------------------|------------------------------------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------|
| linplistsolnum   | Integer array                                                                      | new int[]{1} | List of solutions to use for the linearization point,<br>when linpsolnum is set to from_list.       |
| linpmanualsolnum | Integer array                                                                      | new int[]{1} | Solution number (index) to use for the<br>linearization point, when linpsolnum is set to<br>manual. |
| linpmethod       | init   sol                                                                         | init         | Method used for linearization point, which for<br>sol is given by the linpsol property.             |
| linpsol          | zero   solution object                                                             | zero         | Linearization point solution.                                                                       |
| linpsolnum       | all   auto   first  <br>last   from_list  <br>interp   manual  <br>solution number | 1            | Indices to solutions to use as linearization points.                                                |
| linpsoluse       | current   manual  <br>solution store tag                                           | current      | Subsolution that defines linearization point for<br>the Eigenvalue study step.                      |
| linpsolusesolnum | integer                                                                            |              | Index for the solution to use when linpsoluse<br>is set to manual.                                  |
| linpstudy        | String                                                                             | zero         | Study that defines the linearization point for the<br>Frequency-Domain Perturbation study step.     |
| linpt            | double                                                                             | 0            | Interpolated point for the linearization point<br>when linpsolnum is set to interp.                 |

For the adaptation and error estimates settings, see Table 6-171.

# *Frequency to Time FFT*

A Frequency to Time FFT study step, which you can add to a time-dependent study, performs an inverse FFT (or, alternatively, the nonuniform Fourier transform) from the frequency domain (input) to the time domain (output). As the default solver it adds an FFT solver.

# **SYNTAX**

```
model.study(stdname).create(fname, "FreqToTimeFFT");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-134: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY       | VALUE      | DEFAULT | DESCRIPTION                                                              |
|----------------|------------|---------|--------------------------------------------------------------------------|
| addstatsol     | on   off   | off     | Add stationary solution.                                                 |
| fftinputmethod | sol   init | sol     | Prescribe the input values using a solution or an<br>initial expression. |

TABLE 6-134: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY         | VALUE                                                                                 | DEFAULT  | DESCRIPTION                                                                                                                                        |
|------------------|---------------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| fftinputstudy    | String                                                                                | current  | Study that defines input values for the FFT<br>study step.                                                                                         |
| fftoutrange      | Numeric vector                                                                        |          | Output times.                                                                                                                                      |
| fftscaling       | cont   discrete                                                                       | cont     | Use a discrete or continuous scaling for the<br>Fourier transform.                                                                                 |
| fftwinalpha      | Real scalar                                                                           | 0.5      | Window parameter for a Tukey window.                                                                                                               |
| fftwincenterinv  | Real scalar                                                                           | 50       | Window center for a Gaussian window<br>function.                                                                                                   |
| fftwincutoff     | Real scalar                                                                           | 1        | Cutoff fraction for window function in [0, 1].                                                                                                     |
| fftwindev        | Real scalar                                                                           | 1        | Standard deviation for a Gaussian window<br>function.                                                                                              |
| fftwindowinv     | on   off                                                                              | off      | Use window function.                                                                                                                               |
| fftwinexpr       | String                                                                                | 1        | Expression for window function (when set to<br>fromexpr). Can be expressed in terms of t,<br>freq, niterFFTin, and niterFFTout (if<br>applicable). |
| fftwinmaxinv     | Real scalar                                                                           | 100      | Maximum (end) value for window.                                                                                                                    |
| fftwinmininv     | Real scalar                                                                           | 0        | Minimum (start) value for window.                                                                                                                  |
| fftwintypeinv    | fromexpr   cutoff  <br>rectangle   gauss  <br>hamming   hanning  <br>blackman   tukey | fromexpr | Method for window function.                                                                                                                        |
| statmanualsolnum | Integer                                                                               | 1        | Index to stationary solution to add.                                                                                                               |
| statmethod       | sol   init                                                                            | sol      | For an added stationary solution, use a solution<br>or initial expression.                                                                         |
| statsolnum       | auto   first   last  <br>interp   manual  <br>positive integer                        | auto     | Selection method for stationary solution to<br>add.                                                                                                |
| statstudy        | String                                                                                | zero     | Study from which the added stationary solution<br>is chosen.                                                                                       |
| statt            | String                                                                                |          | Specify time for interpolated solution to add.                                                                                                     |
| tunit            | String                                                                                | s        | Time unit.                                                                                                                                         |
| winpunit         | String                                                                                | Hz       | Frequency unit for window.                                                                                                                         |

TABLE 6-135: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |

TABLE 6-135: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY              | VALUE           | DEFAULT | DESCRIPTION                          |
|-----------------------|-----------------|---------|--------------------------------------|
| disableFrameControl   | Reference Array |         | See Physics and Variables Selection. |
| discretization        | String Map      |         | See Physics and Variables Selection. |
| equationform          | String Map      |         | See Physics and Variables Selection. |
| equationform_freq     | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src | String Map      |         | See Physics and Variables Selection. |
| reconstructors        | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable    | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-136: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-137: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

# *Function Sweep*

A Function Sweep study step is a special case of a Parametric Sweep study step, where the solver sweeps over functions defined under a Switch node in the Model Builder.

#### **SYNTAX**

```
model.study(stdname).create(fname, "FunctionSweep");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-138: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY | VALUE                                    | DEFAULT | DESCRIPTION                                                                                        |
|----------|------------------------------------------|---------|----------------------------------------------------------------------------------------------------|
| pcase    | Vector with entries<br>"all" and "user". | ["all"] | Cases, one per function switch.                                                                    |
| plistarr | Vector of integer<br>vectors             |         | Integer case numbers. One list of integers (for<br>example, range(1,1,10)) per function<br>switch. |
| pname    | Vector of strings                        |         | Function switches.                                                                                 |

TABLE 6-139: ADVANCED AND OTHER PROPERTIES.

| PROPERTY      | VALUE                          | DEFAULT | DESCRIPTION                                                                                                                                              |
|---------------|--------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| accumtable    | String                         | new     | Accumulated probe table.                                                                                                                                 |
| accumtableall | on   off                       | on      | Use all probes for the accumulated probe table.                                                                                                          |
| defsolvergen  | global   first  <br>last   all | global  | Control when a solver sequence should be<br>generated during a function sweep using global<br>parameters or the first, last, or each parameter<br>tuple. |
| filename      | String                         |         | Filename.                                                                                                                                                |
| keepsol       | last   all                     |         | Keep solutions (only the last or all solutions).                                                                                                         |
| pdistrib      | true   false                   | false   | Distribute parametric sweep.                                                                                                                             |
| plot          | on   off                       | off     | Plot while solving.                                                                                                                                      |
| plotgroup     | String                         | default | Plot group to use for plot while solving.                                                                                                                |
| probes        | Vector of strings              |         | Probes to use when probesel=manual.                                                                                                                      |
| probesel      | all   none   manual            | all     | Probes to compute.                                                                                                                                       |
| save          | on   off                       |         | Save each solution as a model file.                                                                                                                      |
| useaccumtable | on   off                       | on      | Use an accumulated probe table.                                                                                                                          |

# *Material Sweep*

A Material Sweep study step is a special case of a Parametric Sweep study step, where the solver sweeps over materials defined under a Switch node in the Model Builder.

## **SYNTAX**

```
model.study(stdname).create(fname, "MaterialSweep");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-140: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY | VALUE                                    | DEFAULT | DESCRIPTION                                                                                        |
|----------|------------------------------------------|---------|----------------------------------------------------------------------------------------------------|
| plistarr | Vector of integer<br>vectors             |         | Integer case numbers. One list of integers (for<br>example, range(1,1,10)) per material<br>switch. |
| pname    | Vector of strings                        |         | Material switches.                                                                                 |
| pcase    | Vector with entries<br>"all" and "user". | ["all"] | Cases, one per material switch.                                                                    |

TABLE 6-141: ADVANCED AND OTHER PROPERTIES.

| PROPERTY      | VALUE                          | DEFAULT | DESCRIPTION                                                                                                                                              |
|---------------|--------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| accumtable    | String                         | new     | Accumulated probe table.                                                                                                                                 |
| accumtableall | on   off                       | on      | Use all probes for the accumulated probe table.                                                                                                          |
| defsolvergen  | global   first  <br>last   all | global  | Control when a solver sequence should be<br>generated during a material sweep using global<br>parameters or the first, last, or each parameter<br>tuple. |
| filename      | String                         |         | Filename.                                                                                                                                                |
| keepsol       | last   all                     |         | Keep solutions (only the last or all solutions).                                                                                                         |
| pdistrib      | true   false                   | false   | Distribute parametric sweep.                                                                                                                             |
| plot          | on   off                       | off     | Plot while solving.                                                                                                                                      |
| plotgroup     | String                         | default | Plot group to use for plot while solving.                                                                                                                |
| probes        | Vector of strings              |         | Probes to use when probesel=manual.                                                                                                                      |
| probesel      | all   none   manual            | all     | Probes to compute.                                                                                                                                       |
| save          | on   off                       |         | Save each solution as a model file.                                                                                                                      |
| useaccumtable | on   off                       | on      | Use an accumulated probe table.                                                                                                                          |

# *Model Reduction*

Use a Model Reduction study step to perform simulations with reduced models or to produce reduced models.

A Model reduction study step will involve the following settings

- **1** Selecting the model reduction method to apply.
- **2** If applicable: Selecting the training data (Select or generate Study and Study step reference).
- **3** Defining the unreduced (source) model (Study and Study step reference).
- **4** If applicable: Defining the objective function representing a quality measure to minimize.
- **5** Selecting to create or update an instance of the reduced model under reduced models for online use.
- **6** If applicable: Specifying if the reduced model should be capable of reconstruction.
- **7** Defining reduced-model control inputs.
- **8** Defining reduced-model outputs.

## **SYNTAX**

```
model.study(stdname).create(fname,"ModelReduction");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step for model reduction. The following general and common properties are available.

TABLE 6-142: GENERAL AND COMMON PROPERTIES FOR MODEL REDUCTION.

| PROPERTY           | VALUE                    | DEFAULT | DESCRIPTION                                                                                                             |
|--------------------|--------------------------|---------|-------------------------------------------------------------------------------------------------------------------------|
| awefunc            | String array             |         | Error expressions, if<br>reducedModelType is awe.                                                                       |
| awefuncdesc        | String array             |         | Description of the error variables, if<br>reducedModelType is awe.                                                      |
| awefuncscale       | String array             |         | Scale of the error variables, if<br>reducedModelType is awe.                                                            |
| awefuncunit        | String array             |         | Unit of the error functions, if<br>reducedModelType is awe.                                                             |
| awefuncuse         | String array             |         | Error expressions, if<br>reducedModelType is awe.                                                                       |
| awevar             | String array             |         | Model error/output variables, if<br>reducedModelType is awe.                                                            |
| initval            | String array             |         | Values for the model control inputs used<br>for the simulation using the modal solver,<br>if reducedModelType is modal. |
| reducedModelType   | modal   awe  <br>pod     | modal   | Model reduction method to use.                                                                                          |
| romdata            | String                   | new     | Tag of the target container for the<br>reduced model (new for a new reduced<br>model).                                  |
| romReconstruct     | true   false             | true    | Enable reconstruction in the produced<br>reduced model.                                                                 |
| pname              | String array             |         | Model parameter names to use as model<br>control input variables, if<br>reducedModelType is modal.                      |
| podtrainingsol     | String                   |         | Solution selection, if<br>reducedModelType is pod.                                                                      |
| qoidescr           | String array             |         | Descriptions for user-defined output<br>expressions, if reducedModelType is<br>modal.                                   |
| qoiexpr            | String array             |         | Global expressions defining outputs, if<br>reducedModelType is modal.                                                   |
| qoiname            | String array             |         | Variable names for outputs, if<br>reducedModelType is modal.                                                            |
| qoiunit            | String array             |         | Units for user-defined output<br>expressions, if reducedModelType is<br>modal.                                          |
| rtol               | double                   | 0.1     | Relative tolerance for adaptation, if<br>reducedModelType is awe                                                        |
| soltypemat         | true   false             | false   | Store reduced matrices in the modal<br>solver solution, if reducedModelType is<br>modal.                                |
| soltypeonline      | on   off                 | on      | Create a reduced model.                                                                                                 |
| trainingStepConstr | String (auto or<br>none) | auto    | Study step for constraint modes, if<br>reducedModelType is pod.                                                         |

TABLE 6-142: GENERAL AND COMMON PROPERTIES FOR MODEL REDUCTION.

| PROPERTY                        | VALUE        | DEFAULT | DESCRIPTION                                                                            |
|---------------------------------|--------------|---------|----------------------------------------------------------------------------------------|
| trainingStudyConstr             | String       | none    | Training study for constraint modes, if<br>reducedModelType is pod.                    |
| truncationrtol                  | double       | 0.01    | The relative truncation tolerance, if<br>reducedModelType is awe or pod.               |
| unreducedModelStepAWE           | String       | none    | Frequency domain study step, if<br>reducedModelType is awe.                            |
| unreducedModelStepPOD           | String       | none    | Frequency domain study step, if<br>reducedModelType is pod.                            |
| unreducedModelStudyAWE          | String       | none    | Study containing at least one compatible<br>study step, if reducedModelType is<br>awe. |
| unreducedModelStudyPOD          | String       | none    | Study containing at least one compatible<br>study step, if reducedModelType is<br>pod. |
| useExtraResultsCompileEquations | true   false | false   | Use extra Compile Equations for Results.                                               |

For the modal model reduction method, the following methods are available.

TABLE 6-143: PROPERTIES FOR MODAL MODEL REDUCTION.

| PROPERTY            | VALUE                 | DEFAULT | DESCRIPTION                                                                                                         |
|---------------------|-----------------------|---------|---------------------------------------------------------------------------------------------------------------------|
| trainingStep        | String (auto or none) | auto    | Study step compatible with the chosen model<br>reduction method used to produce the basis of<br>the reduced method. |
| trainingStudy       | String                | none    | Study containing a study step compatible with<br>training data for the chosen method.                               |
| unreducedModelStep  | String                | none    | Study step compatible with the chosen model<br>reduction method used to define the model to<br>reduced.             |
| unreducedModelStudy | String                | none    | Study containing a study step for reduction<br>compatible with the chosen method.                                   |

The following properties are available for a time-dependent unreduced study (an unreducedModelStep).

TABLE 6-144: PROPERTIES FOR A TIME-DEPENDENT UNREDUCED STUDY.

| PROPERTY          | VALUE        | DEFAULT        | DESCRIPTION                                         |
|-------------------|--------------|----------------|-----------------------------------------------------|
| romSolveTransient | on   off     | off            | Reduced-model simulation using the modal solver.    |
| tlist             | double array | range(0,0.1,1) | Time list for the simulation with the modal solver. |

The following properties are available for a frequency-dependent unreduced study (an unreducedModelStep).

TABLE 6-145: PROPERTIES FOR A FREQUENCY-DEPENDENT UNREDUCED STUDY.

| PROPERTY          | VALUE        | DEFAULT | DESCRIPTION                                                                                                                                                                  |
|-------------------|--------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| romSolveFrequency | on   off     | off     | Reduced-model simulation using the modal solver.                                                                                                                             |
| plist             | double array |         | Frequency list for the simulation with the modal<br>solver. The first frequency is used as the<br>linearization frequency for the second-order<br>expansion of the matrices. |

# *Multigrid Level*

A Multigrid Level study substep specifies the geometric multigrid level used by the study step (a Stationary study step, for example).

#### **SYNTAX**

```
model.study(stdname).create(fname,"Stationary");
model.study(stdname).feature(fname).mglevel().create(mglname);
model.study(stdname).feature(fname).mglevel(mglname).set(pname,value);
```

#### **DESCRIPTION**

Study step attribute.

The following properties are available.

TABLE 6-146: PROPERTIES FOR PHYSICS SELECTION.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                         |
|----------------|-------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| discretization | Vector of strings |         | Select discretizations for physics interfaces. The<br>length of the vector is two times the number of<br>physics interfaces. Example value when two<br>physics interfaces g and c are available is: new<br>String[]{"g", "disc1", "c",<br>"disc2"}. |

#### TABLE 6-147: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

# *Parametric Sweep*

Use the Parametric Sweep study step when you want to find the solution to a sequence of stationary or time-dependent problems that arise when you vary some parameters of interest.

## **SYNTAX**

```
model.study(stdname).create(fname, "Parametric");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-148: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY           | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                  |
|--------------------|-------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| keepbeforeandafter | on   off          | off     | Store solutions not only before but also after<br>the stop condition has been fulfilled (only for<br>parametric sweep study steps in job<br>configurations). |
| plistarr           | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                                                                                           |
| pname              | Vector of strings |         | Parameter names.                                                                                                                                             |
| punit              | Vector of strings |         | Parameter units.                                                                                                                                             |

TABLE 6-148: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY  | VALUE                       | DEFAULT | DESCRIPTION                                                                                 |
|-----------|-----------------------------|---------|---------------------------------------------------------------------------------------------|
| stopcond  | String                      |         | Stop condition expression (only for parametric<br>sweep study steps in job configurations). |
| sweeptype | filled   sparse  <br>switch | sparse  | Sweep type.                                                                                 |

TABLE 6-149: ADVANCED AND OTHER PROPERTIES.

| PROPERTY      | VALUE                                      | DEFAULT    | DESCRIPTION                                                                                                                                                |
|---------------|--------------------------------------------|------------|------------------------------------------------------------------------------------------------------------------------------------------------------------|
| accumtable    | String                                     | new        | Accumulated probe table.                                                                                                                                   |
| accumtableall | on   off                                   | on         | Use all probes for the accumulated probe<br>table.                                                                                                         |
| clearprevrom  | true   false                               | true       | Clear previously generated reduced-order<br>models.                                                                                                        |
| defsolvergen  | global   first  <br>last   all             | global     | Control when a solver sequence should be<br>generated during a parametric sweep using<br>global parameters or the first, last, or each<br>parameter tuple. |
| filename      | String                                     |            | Filename.                                                                                                                                                  |
| keepgenrom    | true   false                               | true       | Keep the generating reduced-order model.                                                                                                                   |
| keeprom       | on   off                                   | on         | Keep reduced-order models.                                                                                                                                 |
| keepsol       | last   all                                 |            | Keep solutions (only the last or all<br>solutions).                                                                                                        |
| plot          | on   off                                   | off        | Plot while solving.                                                                                                                                        |
| plotgroup     | String                                     | default    | Plot group to use for plot while solving.                                                                                                                  |
| probes        | Vector of strings                          |            | Probes to use when probesel=manual.                                                                                                                        |
| probesel      | all   none   manual                        | all        | Probes to compute.                                                                                                                                         |
| reusesol      | true   false                               | false      | Reuse solution from previous step.                                                                                                                         |
| romtagsuffix  | parindex  <br>parnameval  <br>parnamevalnz | parnameval | Add as suffix to tag: index, parameter name<br>and value (the default), or name and<br>nonzero value.                                                      |
| save          | on   off                                   |            | Save each solution as a model file.                                                                                                                        |
| switchcase    | Vector with entries<br>"all" and "user".   | {"all"}    | Cases, one per parameter switch.                                                                                                                           |
| switchlistarr | Vector of integer<br>vectors               |            | Integer case numbers. One list of integers<br>(for example, range(1,1,10)) per<br>parameter switch.                                                        |
| switchname    | Vector of strings                          |            | Parameter switches.                                                                                                                                        |
| useaccumtable | on   off                                   | on         | Use an accumulated probe table.                                                                                                                            |

TABLE 6-150: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE        | DEFAULT | DESCRIPTION                  |
|-------------|--------------|---------|------------------------------|
| pdistrib    | true   false | false   | Distribute parametric sweep. |
| paramselect | auto   off   | auto    | Use parametric solver.       |

# *Ray Tracing*

The Ray Tracing study step is a special case of the Time Dependent study step. It includes additional options for computing ray paths. The Ray Tracing study step is available with the Acoustics Module or the Ray Optics Module.

#### **SYNTAX**

```
model.study(stdname).create(fname, "RayTracing");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-151: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY           | VALUE                               | DEFAULT         | DESCRIPTION                                                                                          |
|--------------------|-------------------------------------|-----------------|------------------------------------------------------------------------------------------------------|
| charvel            | String                              | c_const         | Group velocity used to convert path lengths to<br>solution times when<br>timestepspec=specifylength. |
| llist              | Numeric vector                      |                 | List of path lengths when<br>timestepspec=specifylength.                                             |
| lunit              | String                              | m               | Length unit when<br>timestepspec=specifylength.                                                      |
| raystopcond        | nostop   noactive  <br>rayintensity |                 | Automatic stop condition in the default solver<br>sequence.                                          |
| rtol               | Positive scalar                     | 0.01            | Relative tolerance, if usertol is on.                                                                |
| thresholdintensity | String                              | 1[W/m^2]        | Threshold intensity for automatic stop<br>conditions when<br>raystopcond=rayintensity.               |
| timestepspec       | specifytime  <br>specifylength      | specifyt<br>ime | Determines whether the time intervals are<br>entered directly or in terms of a path length.          |
| tlist              | Numeric vector                      |                 | Time list when<br>timestepspec=specifytime.                                                          |
| tunit              | String                              | s               | Time unit when<br>timestepspec=specifytime.                                                          |
| usertol            | on   off                            | off             | Physics-controlled or user-defined tolerance.                                                        |

TABLE 6-152: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |
| plotfreq  | tout   tsteps       | tout    | Where to update plot.                     |

TABLE 6-153: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |

TABLE 6-153: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY              | VALUE           | DEFAULT | DESCRIPTION                          |
|-----------------------|-----------------|---------|--------------------------------------|
| disabledphysics       | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced       | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables     | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl   | Reference Array |         | See Physics and Variables Selection. |
| discretization        | String Map      |         | See Physics and Variables Selection. |
| equationform          | String Map      |         | See Physics and Variables Selection. |
| equationform_freq     | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src | String Map      |         | See Physics and Variables Selection. |
| reconstructors        | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable    | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-154: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| initmethod         | init   sol                                                                          | init    | Method for initial values for variables solved for.                                                                                                                    |
| initstudy          | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| manualsolnum       | Vector of integers                                                                  | [1]     | Index to solution for initial value for variables<br>solved for.                                                                                                       |
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer                      | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                                              |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |

TABLE 6-154: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY   | VALUE    | DEFAULT | DESCRIPTION                                                 |
|------------|----------|---------|-------------------------------------------------------------|
| useinitsol | on   off | off     | User-controlled initial values for variables<br>solved for. |
| usesol     | on   off | off     | User-controlled values for variables not solved<br>for.     |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-155: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-156: PROPERTIES FOR MESH ADAPTATION AND STUDY EXTENSIONS.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                               |
|----------------|-------------------|---------|-------------------------------------------------------------------------------------------|
| adapgeom       | String            |         | Name of geometry to use.                                                                  |
| adaption       | on   off          | off     | Adaptive mesh refinement.                                                                 |
| adaptselection | selection         | all()   | The selection for the adaptation (the default is<br>the entire geometry). See Selections. |
| autoremesh     | on   off          | off     | Automatic remeshing.                                                                      |
| autoremeshgeom | String            |         | Name of geometry to use.                                                                  |
| plistarr       | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                        |
| pname          | Vector of strings |         | Parameter names.                                                                          |
| punit          | Vector of strings |         | Parameter units.                                                                          |
| sweeptype      | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                                   |
| useparam       | on   off          | off     | Auxiliary sweep.                                                                          |

# *Schrödinger–Poisson*

The Schrödinger–Poisson study step is a special case of the Eigenfrequency study step that is used to model bidirectionally coupled Schrödinger–Poisson systems. It is available with the Semiconductor Module. It is similar to the Eigenvalue study step but has an additional section called Iterations, which determines the behavior of the iterative solver loop for self-consistently modeling of the Schrödinger-Poisson system.

# **SYNTAX**

```
model.study(stdname).create(fname, "SchrodingerPoisson");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-157: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY     | VALUE                    | DEFAULT | DESCRIPTION                                                                                                                                       |
|--------------|--------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| appnreigs    | Integer                  | 20      | Approximate number of eigenfrequencies.                                                                                                           |
| chkeigregion | on   off                 | on      | Perform consistency check.                                                                                                                        |
| eigli        | Real scalar              | 0       | Largest imaginary part.                                                                                                                           |
| eiglr        | Real scalar              | 0       | Largest real part.                                                                                                                                |
| eigmethod    | manual   region  <br>all | manual  | Eigenvalue search method; the all method<br>finds all eigenvalues for a full matrix and can<br>only be used for small eigenfrequency<br>problems. |
| eigsi        | Real scalar              | 0       | Smallest imaginary part.                                                                                                                          |
| eigsr        | Real scalar              | 0       | Smallest real part.                                                                                                                               |
| eigwhich     | lm   lr   sr   li   si   | lm      | Eigenfrequency search method around shift.                                                                                                        |
| maxnreigs    | Integer                  | 200     | Maximum number of eigenfrequencies.                                                                                                               |
| neigs        | Integer                  | 6       | Desired number of eigenfrequencies.                                                                                                               |
| neigsactive  | on   off                 | off     | Set desired number of eigenfrequencies.                                                                                                           |
| shift        | Complex scalar           | 0       | Shift.                                                                                                                                            |
| shiftactive  | on   off                 | off     | Use shift.                                                                                                                                        |

#### TABLE 6-158: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |
| plotfreq  | tout   tsteps       | tout    | Where to update plot.                     |

TABLE 6-159: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |
| discretization            | String Map      |         | See Physics and Variables Selection. |
| equationform              | String Map      |         | See Physics and Variables Selection. |
| equationform_freq         | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src     | String Map      |         | See Physics and Variables Selection. |

TABLE 6-159: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY           | VALUE      | DEFAULT | DESCRIPTION                          |
|--------------------|------------|---------|--------------------------------------|
| reconstructors     | String Map |         | See Physics and Variables Selection. |
| useadvanceddisable | on   off   | off     | See Physics and Variables Selection. |

TABLE 6-160: PROPERTIES FOR ITERATIONS SECTION.

| PROPERTY   | VALUE                                                                                     | DEFAULT    | DESCRIPTION                                                                                                                                                                 |
|------------|-------------------------------------------------------------------------------------------|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| atolterm   | Positive real number                                                                      | 1E-6       | Absolute tolerance for termination of the solver<br>loop when method =<br>minimization_of_global_variable.                                                                  |
| expr       | String                                                                                    | 1          | Global expression used to compute relative error<br>when method!=iterations.                                                                                                |
| iter       | Positive integer                                                                          | 5          | Number of iterations of the solver loop when<br>method=iterations.                                                                                                          |
| maxiter    | Positive integer                                                                          | 25         | Maximum number of iterations in the solver loop<br>when method!=iterations.                                                                                                 |
| method     | minimization_of_<br>global_variable<br> convergence_of_<br>global_variable <br>iterations | iterations | Choose whether termination of the solver loop<br>is based on the convergence of a global variable,<br>minimization of a global variable or a fixed<br>number of iterations. |
| miniter    | Positive integer                                                                          | 1          | Minimum number of iterations in the solver loop<br>when method!=iterations.                                                                                                 |
| rtolterm   | Positive real number                                                                      | 0.001      | Relative tolerance for termination of the solver<br>loop when method =<br>convergence_of_global_variable.                                                                   |
| rtolthresh | Positive real number                                                                      | 1          | Threshold used to avoid division by zero while<br>computing the relative error when method =<br>convergence_of_global_variable.                                             |

TABLE 6-161: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY        | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                       |
|-----------------|-------------------------------------------------------------------------------------|---------|-----------------------------------------------------------------------------------|
| initmethod      | init   sol                                                                          | init    | Method for initial values for variables solved for.                               |
| initstudy       | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                |
| manualsolnum    | Vector of integers                                                                  | [1]     | Index to solution for initial value for variables<br>solved for.                  |
| notlistsolnum   | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.         |
| notmanualsolnum | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                  |
| notsolmethod    | init   sol                                                                          | init    | Method for values for variables not solved for.                                   |
| notsolnum       | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                    |
| notstudy        | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                |
| nott            | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for. |

TABLE 6-161: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                          | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|----------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| outputInterface    | The interfaces to use<br>as key                                |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                     |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                     |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                         |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |
| useinitsol         | on   off                                                       | off     | User-controlled initial values for variables<br>solved for.                                                                                                            |
| usesol             | on   off                                                       | off     | User-controlled values for variables not solved<br>for.                                                                                                                |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-162: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-163: PROPERTIES FOR MESH ADAPTATION AND STUDY EXTENSIONS.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                               |
|----------------|-------------------|---------|-------------------------------------------------------------------------------------------|
| adapgeom       | String            |         | Name of geometry to use.                                                                  |
| adaption       | on   off          | off     | Adaptive mesh refinement.                                                                 |
| adaptselection | selection         | all()   | The selection for the adaptation (the default is<br>the entire geometry). See Selections. |
| autoremesh     | on   off          | off     | Automatic remeshing.                                                                      |
| autoremeshgeom | String            |         | Name of geometry to use.                                                                  |
| plistarr       | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                        |
| pname          | Vector of strings |         | Parameter names.                                                                          |
| punit          | Vector of strings |         | Parameter units.                                                                          |
| sweeptype      | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                                   |
| useparam       | on   off          | off     | Auxiliary sweep.                                                                          |

# *Sensitivity*

Use a Sensitivity study step to add sensitivity analysis to a study.

#### **SYNTAX**

```
model.study(stdname).create(fname, "Sensitivity");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-164: PROPERTIES FOR SENSITIVITY METHOD.

| PROPERTY        | VALUE                                  | DEFAULT                   | DESCRIPTION                                                                        |
|-----------------|----------------------------------------|---------------------------|------------------------------------------------------------------------------------|
| descr           | String                                 |                           | Objective function description.                                                    |
| gradientMethod  | adjoint   forward                      | adjoint                   | Gradient method.                                                                   |
| gradientStep    | String                                 |                           | Reference to study step.                                                           |
| objectiveActive | Vector with entries<br>"on" and "off". | Vector with<br>only "on". | Controls which objective functions from the<br>physics interfaces that are active. |
| optobj          | String                                 |                           | Objective function expression.                                                     |

TABLE 6-165: PROPERTIES FOR CONTROL VARIABLES AND PARAMETERS.

| PROPERTY              | VALUE                                       | DEFAULT                     | DESCRIPTION                                                                      |
|-----------------------|---------------------------------------------|-----------------------------|----------------------------------------------------------------------------------|
| controlVariableActive | Vector with entries "on"<br>and "off".      | Vector with<br>only "on".   | Controls which control variables from<br>the physics interfaces that are active. |
| initval               | Vector of scalars                           |                             | Initial values, one per parameter.                                               |
| pname                 | Vector of strings                           |                             | Parameter names.                                                                 |
| scale                 | Vector of type valuetype                    |                             | Scales, one per parameter.                                                       |
| valuetype             | Vector with entries "real"<br>and "complex" | Vector with<br>only "real". | Value types, one per parameter.                                                  |

# *Stationary*

A Stationary study step is intended for a stationary or steady-state situation where you can use a stationary solver, including mesh adaptation and error estimation (see Table 6-171).

## **SYNTAX**

```
model.study(stdname).create(fname, "Stationary");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-166: PROPERTIES FOR STUDY SETTINGS

| PROPERTY              | VALUE           | DEFAULT | DESCRIPTION                                                                                                                                                              |
|-----------------------|-----------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| geometricNonlinearity | Boolean         | false   | Include geometric nonlinearity. Available if the<br>license includes the Structural Mechanics<br>Module, Acoustics Module, MEMS Module, or<br>Multibody Dynamics Module. |
| stol                  | Positive scalar | 0.001   | Relative tolerance, is usestol is set to true.                                                                                                                           |
| usestol               | Boolean         | false   | Use a user-defined relative tolerance.                                                                                                                                   |

TABLE 6-167: PROPERTIES FOR RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |

TABLE 6-168: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |
| discretization            | String Map      |         | See Physics and Variables Selection. |
| equationform              | String Map      |         | See Physics and Variables Selection. |
| equationform_freq         | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src     | String Map      |         | See Physics and Variables Selection. |
| reconstructors            | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable        | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-169: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY        | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                       |
|-----------------|-------------------------------------------------------------------------------------|---------|-----------------------------------------------------------------------------------|
| initmethod      | init   sol                                                                          | init    | Method for initial values for variables solved for.                               |
| initstudy       | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                |
| manualsolnum    | Vector of integers                                                                  | [1]     | Index to solution for initial value for variables<br>solved for.                  |
| notlistsolnum   | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.         |
| notmanualsolnum | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                  |
| notsolmethod    | init   sol                                                                          | init    | Method for values for variables not solved for.                                   |
| notsolnum       | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                    |
| notstudy        | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                |
| nott            | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for. |

TABLE 6-169: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                          | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|----------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| outputInterface    | The interfaces to use<br>as key                                |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                     |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                     |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                         |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |
| useinitsol         | on   off                                                       | off     | User-controlled initial values for variables<br>solved for.                                                                                                            |
| usesol             | on   off                                                       | off     | User-controlled values for variables not solved<br>for.                                                                                                                |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-170: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-171: PROPERTIES FOR MESH ADAPTATION AND ERROR ESTIMATES.

| PROPERTY       | VALUE                  | DEFAULT   | DESCRIPTION                                                                                                                                                                                |
|----------------|------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| adapgeom       | String                 |           | Adaptation in geometry.                                                                                                                                                                    |
| adapsolnum     | Array of integers>0    | 1         | Indices.                                                                                                                                                                                   |
| adaptselection | selection              | all()     | The selection for the adaptation (the<br>default is the entire geometry). See<br>Selections.                                                                                               |
| adderrestvars  | errandres   err   none | errandres | Add variables for error estimation:<br>error estimates and residuals<br>(errandres), error estimates only<br>(err), or no variables (none).                                                |
| adjppr         | on   off               | on        | Adjoint solution error estimate (for<br>adaptation). The on value<br>corresponds to PPR for Lagrange,<br>and the off value corresponds to<br>Interpolation error in the user<br>interface. |

TABLE 6-171: PROPERTIES FOR MESH ADAPTATION AND ERROR ESTIMATES.

| PROPERTY                | VALUE                           | DEFAULT                                               | DESCRIPTION                                                                                                                                                  |
|-------------------------|---------------------------------|-------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| allowcoarsening         | on   off                        | on                                                    | Controls if the mesh can be<br>coarsened by the general<br>modification method<br>(meshadaptmethod set to modify).                                           |
| elementspar             | Positive scalar                 | 0.5                                                   | Element fraction (for adaptation).                                                                                                                           |
| elselect                | globalmin   worst  <br>elements | globalmin                                             | Method for selecting elements to<br>refine (for adaptation).                                                                                                 |
| erredim                 | domain   boundary   edge        | domain                                                | Geometric entity selection for the<br>adaptation. edge is only available in<br>3D.                                                                           |
| errestandadap           | none   adaption   errest        | none                                                  | Perform adaptation or error<br>estimation (or none).                                                                                                         |
| errestim                | l2errest   goalerrest           | l2errest<br>for adaption;<br>goalerrest<br>for errest | Error estimate.                                                                                                                                              |
| gfunc                   | String                          |                                                       | Functional when goalfunctype is<br>set to gfman.                                                                                                             |
| goalerrest              | on   off                        | off                                                   | Goal-oriented error estimation.                                                                                                                              |
| goalfuncpredef          | gfint   gfl2   gfl1  <br>gflinf | gfint                                                 | Predefined functionals for the<br>solution when goalfunctype is set<br>to gfpredef: integral (the default),<br>L2 norm, L1 norm, or approximate<br>max norm. |
| goalfunctype            | gfpredef   gfman                | gfpredef                                              | Functional type: predefined (the<br>default) or manual.                                                                                                      |
| goalorientedtermination | off   auto   manual             | off                                                   | Activate goal-oriented termination.<br>See below for additional properties<br>when set to manual.                                                            |
| goeloglevel             | minimal   normal  <br>detailed  | normal                                                | Level of information in the log for<br>adaptation using goal-oriented<br>termination.                                                                        |
| goeplot                 | Boolean                         | true                                                  | Output goal-oriented termination<br>increments.                                                                                                              |
| goetableid              | table name   new                | new                                                   | Table to use for convergence<br>information from adaptation using<br>goal-oriented termination.                                                              |
| globalminpar            | Positive scalar                 | 1.7                                                   | Element growth rate (for<br>adaptation).                                                                                                                     |
| l2scale                 | String                          | 1                                                     | Scaling factor.                                                                                                                                              |
| l2staborder             | String                          | 2                                                     | Stability estimate derivative order                                                                                                                          |
| maxrefinement           | scalar integer                  | 5                                                     | Maximum number of element<br>refinements (available when<br>meshadaptmethod is not<br>rebuild).                                                              |
| maxscale                | Double                          | 3                                                     | Maximum coarsening factor (for<br>adaptation).                                                                                                               |
| maxt                    | Double                          | 1E7                                                   | Maximum number of elements (for<br>adaptation).                                                                                                              |

TABLE 6-171: PROPERTIES FOR MESH ADAPTATION AND ERROR ESTIMATES.

| PROPERTY        | VALUE                                   | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                         |
|-----------------|-----------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| meshadaptmethod | modify   rebuild  <br>regular   longest | longest | The refinement method for mesh<br>adaptation (general mesh<br>modification, rebuild mesh, regular<br>refinement, or longest edge<br>refinement)                                                                                                     |
| ngen            | Scalar integer                          | 2       | Maximum number of refinements<br>(for adaptation).                                                                                                                                                                                                  |
| resorder        | String                                  | 0       | Residual order.                                                                                                                                                                                                                                     |
| savesolsref     | true   false                            | true    | Save solution on every refined mesh<br>(for adaptation).                                                                                                                                                                                            |
| selection       | first   last   all  <br>manual          | last    | Solution selection: the first or last<br>solution, all solutions, or manual,<br>using weights and solution number<br>indices in adapsolnum.<br>Eigenfrequency studies use all with<br>weights set to 1, which then uses<br>the first solution only. |
| weights         | double[] (positive values)              | 1.0     | Weight for each selected solution<br>(for adaptation).                                                                                                                                                                                              |
| window          | graphics   new                          | new     | Plot window to use for displaying<br>converge of goal-oriented<br>termination.                                                                                                                                                                      |
| worstpar        | positive scalar                         |         | Controls refinement if<br>elselect=worst (for adaptation).                                                                                                                                                                                          |

When the goalorientedtermination property is set to manual, you can add goal-oriented termination expression using the setIndex() method:

- **•** goalorientedterminationexpression: The expression for goal-oriented termination.
- **•** goalorientedterminationtolerance: The tolerance for the goal-oriented termination.
- **•** goalorientedtolerancetype: The tolerance type: "relative" or "absolute".
- **•** goalorientedterminationactive: If the goal-oriented expression is active or not (true or false).

TABLE 6-172: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY          | VALUE                              | DEFAULT                      | DESCRIPTION                                                                                   |
|-------------------|------------------------------------|------------------------------|-----------------------------------------------------------------------------------------------|
| constraintgroup   | Matrix with "on"/<br>"off" entries | Matrix<br>with only<br>"off" | Constraint group status (active or not). One<br>row per load case.                            |
| loadcase          | Vector of strings                  |                              | Load cases.                                                                                   |
| loadgroup         | Matrix with "on"/<br>"off" entries | Matrix<br>with only<br>"off" | Load group status (active or not). One row per<br>load case.                                  |
| loadgroupweight   | Real matrix                        | off                          | Weight of each load case (as a scalar number).<br>One row per load case.                      |
| pcontinuation     | String                             |                              | Continuation parameter when<br>pcontinuationmode = manual.                                    |
| pcontinuationmode | no   last   manual                 | last                         | Determines if a continuation sweep should be<br>performed for one of the parameters in pname. |
| pdistrib          | on   off                           | off                          | Distribute parametric sweep.                                                                  |

TABLE 6-172: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE             | DEFAULT | DESCRIPTION                                                                  |
|-------------|-------------------|---------|------------------------------------------------------------------------------|
| plistarr    | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.           |
| pname       | Vector of strings |         | Parameter names.                                                             |
| preusesol   | no   yes   auto   | no      | Determines how the converged solutions are<br>reused in the parameter sweep. |
| punit       | Vector of strings |         | Parameter units.                                                             |
| sweeptype   | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                      |
| useloadcase | on   off          | off     | Define load cases.                                                           |
| useparam    | on   off          | off     | Auxiliary sweep.                                                             |

# *Surrogate Model Training*

A Surrogate Model Training study step is intended for training a deep neural network and creating a surrogate model that can replace a full finite-element model.

## **SYNTAX**

```
model.study(stdname).create(fname, "SurrogateModelTraining");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available:

TABLE 6-173: SURROGATEMODELTRAINING PROPERTIES

| PROPERTY          | VALUE                           | DEFAULT             | DESCRIPTION                                                                                                |
|-------------------|---------------------------------|---------------------|------------------------------------------------------------------------------------------------------------|
| accumtable        | new   name of existing<br>table | new                 | Output table to use for accumulated<br>probe table.                                                        |
| accumtableall     | boolean                         | false               | Use all probes.                                                                                            |
| activation        | string array                    | {"none",<br>"tanh"} | Array of activation functions to use<br>for each layer. Choose from none,<br>relu, elu, sigmoid, and tanh. |
| adpevals          | nonnegative integer             | 10,000              | Surrogate evaluations for<br>optimization, when<br>gpadpoptmethod is set to<br>montecarlo.                 |
| automatictraining | boolean                         | false               | Train all the generated surrogate<br>models after the design of<br>experiments.                            |
| basefilepath      | string                          |                     | File path to where all the external<br>files will be created.                                              |
| computeaction     | recompute   append              | recompute           | Compute and build surrogate model<br>(recompute), or improve and build<br>it (append).                     |
| convinfo          | of   on  detailed               | on                  | Surrogate model training log level.                                                                        |
| correlatedinput   | boolean                         | false               | Set to true if the input parameters<br>are correlated.                                                     |

TABLE 6-173: SURROGATEMODELTRAINING PROPERTIES

| PROPERTY                     | VALUE                                                                                                                            | DEFAULT   | DESCRIPTION                                                                                                                                                                                                  |
|------------------------------|----------------------------------------------------------------------------------------------------------------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| covfunction                  | se   matern32  <br>matern52   nn                                                                                                 | matern32  | Type of covariance function to use<br>when surrogatemodel is set to<br>gp. Use se for Squared exponential,<br>matern32 for Matérn 3/2,<br>matern52 for Matérn 5/2 and nn<br>for Single-layer neural network. |
| defsolvergen                 | global   all                                                                                                                     | global    | Use global parameters or each<br>parameter tuple for the default<br>solver sequence generation.                                                                                                              |
| distributionselection        | string array with keys<br>col1, col2, col3, …<br>and values uniform,<br>normal, lognormal,<br>gamma, beta,<br>weibull, or gumbel | {}        | The distributions to use for each<br>input parameter as an array of<br>alternating keys and values.                                                                                                          |
| errorhandling                | immediate   later                                                                                                                | immediate | Use immediate to stop<br>immediately if there is an error, or<br>use later to skip problematic<br>parameters.                                                                                                |
| file                         | string map with keys 1,<br>2, 3, … and values<br>embedded or<br>external                                                         | {}        | Whether each quantity of interest<br>should be stored embedded or<br>external as an alternating array of<br>keys and values.                                                                                 |
| filename                     | string array with keys 1,<br>2, 3, … and valid<br>filenames for the values                                                       | {}        | The filename for each quantity of<br>interest as an alternating array of<br>keys and values.                                                                                                                 |
| funcname                     | string array with keys 1,<br>2, 3, … and valid<br>function names for the<br>values                                               | {}        | The function name for each quantity<br>of interest as an alternating array of<br>keys and values.                                                                                                            |
| geometrysampling             | string array with keys 1,<br>2, 3, … and values<br>none or name of<br>existing geometry<br>sampling node                         | {}        | Which Geometry Sampling node to<br>use for each quantity of interest as<br>an alternating array of keys and<br>values.                                                                                       |
| globaldnnfunction            | string array with keys 1,<br>2, 3, … and values new<br>or name of existing<br>function                                           | {}        | Deep Neural Network function to<br>use, when surrogatemodel is set<br>to dnn for each quantity of interest<br>as an alternating array of keys and<br>values.                                                 |
| globalgpfunction             | string array with keys 1,<br>2, 3, … and values new<br>or name of existing<br>function                                           | {}        | Gaussian Process function to use,<br>when surrogatemodel is set to gp<br>for each quantity of interest as an<br>alternating array of keys and values.                                                        |
| globalleastsquarefitfunction | string array with keys 1,<br>2, 3, … and values new<br>or name of existing<br>function                                           | {}        | Least-Squares Fit function to use,<br>when surrogatemodel is set to<br>lsq for each quantity of interest as<br>an alternating array of keys and<br>values.                                                   |

TABLE 6-173: SURROGATEMODELTRAINING PROPERTIES

| PROPERTY           | VALUE                                                                                                                                 | DEFAULT               | DESCRIPTION                                                                                                                                                                           |
|--------------------|---------------------------------------------------------------------------------------------------------------------------------------|-----------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| globalpcefunction  | string array with keys 1,<br>2, 3, … and values new<br>or name of existing<br>function                                                | {}                    | Polynomial Chaos Expansion (PCE)<br>function to use, when<br>surrogatemodel is set to pce for<br>each quantity of interest as an<br>alternating array of keys and values.             |
| gpadpoptmethod     | direct   montecarlo                                                                                                                   | direct                | Optimization method for error<br>estimation, when surrogatemodel<br>is set to gp.                                                                                                     |
| includeintraining  | string matrix of on or<br>off                                                                                                         | {{}}                  | For each quantity of interest (row)<br>and study-input parameter (column)<br>whether the study-input parameter<br>name should be included as input of<br>the surrogate models or not. |
| innermostparameter | string array with keys 1,<br>2, 3, … and values sum,<br>min, max, last,<br>first, all, or<br>interp<br>(time-dependent study<br>only) | {}                    | The selection for the innermost<br>parameter for each quantity of<br>interest as an alternating array of<br>keys and values.                                                          |
| interptimes        | string array with keys 1,<br>2, 3, … and<br>interpolation time<br>expressions for values                                              | {}                    | The interpolation times to sample<br>for when innermostparameter is<br>set to interp for each quantity of<br>interest as an alternating array of<br>keys and values.                  |
| keepsol            | last   all                                                                                                                            | last                  | Keep only last or all model<br>evaluations in memory.                                                                                                                                 |
| layertype          | Array of dense and<br>input for the first<br>(input) layer                                                                            | {"input",<br>"dense"} | The type of layer in the DNN.                                                                                                                                                         |
| lboundselection    | string array with keys<br>col1, col2, col3, …<br>and values between 0<br>and 1 as strings                                             |                       | The lower bound for the CDF for<br>each input parameter distribution if<br>lcdfselection is set to manual<br>as an alternating array of keys and<br>values.                           |
| lcdfselection      | string array with keys<br>col1, col2, col3, …<br>and values 0.3, 0.1,<br>0.01, 1e-3, 1e-4, 1e-5,<br>1e-6, 1e-7, or manual             |                       | The lower bound for the CDF for<br>each input parameter distribution as<br>an alternating array of keys and<br>values.                                                                |
| lsqexpression      | string                                                                                                                                |                       | The definition of the least-squares fit<br>function.                                                                                                                                  |
| lsqlowerbound      | string array                                                                                                                          | {}                    | The lower bound for each<br>least-squares parameter.                                                                                                                                  |
| lsqparameternames  | string array                                                                                                                          | {}                    | The name for each least-squares<br>parameter.                                                                                                                                         |
| lsqparametervalues | array of doubles                                                                                                                      | {}                    | The value for each least-squares<br>parameter.                                                                                                                                        |
| lsqscale           | string array                                                                                                                          | {}                    | The scaling for each least-squares<br>parameter.                                                                                                                                      |

TABLE 6-173: SURROGATEMODELTRAINING PROPERTIES

| PROPERTY               | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                     |
|------------------------|-------------------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| lsqupperbound          | string array                                                                        | {}      | The upper bound for each<br>least-squares parameter.                                                                                                                                                                                                                                            |
| maxgpevals             | nonnegative integer                                                                 | 10,000  | Maximum surrogate evaluations for<br>optimization, when<br>gpadpoptmethod is set to direct.                                                                                                                                                                                                     |
| maxgpiters             | nonnegative integer                                                                 | 500     | Maximum number of optimization<br>iterations, when gpadpoptmethod<br>is set to direct.                                                                                                                                                                                                          |
| meanfunction           | const   linear  <br>quadratic                                                       | const   | Defines the overall trend of the<br>trained function(s) when<br>surrogatemodel is set to gp.                                                                                                                                                                                                    |
| nsolvenonadp           | positive integer                                                                    | 20      | Number of input points when<br>computeaction is set to<br>recompute.                                                                                                                                                                                                                            |
| nsolvenonadpimprove    | positive integer                                                                    | 10      | Number of input points when<br>computeaction is set to append.                                                                                                                                                                                                                                  |
| objgrp                 | new   name of table<br>group                                                        | new     | The output table group, when<br>surrogatemodel is set to none.                                                                                                                                                                                                                                  |
| outfeatures            | array of positive<br>integers                                                       | {0,0}   | The number of output features for<br>each layer in the DNN.                                                                                                                                                                                                                                     |
| outputtable            | string array with keys 1,<br>2, 3, … and values new<br>or name of existing<br>table | {}      | Output table to use, when<br>surrogatemodel is set to none for<br>each quantity of interest as an<br>alternating array of keys and values.                                                                                                                                                      |
| parameterselection     | string matrix of last<br>or all                                                     | {{}}    | Specify for each quantity of interest<br>(row) and study-input parameter<br>(column) the selection for the<br>study-input parameter.                                                                                                                                                            |
| pcesettings            | auto   manual                                                                       | auto    | PCE settings method. If set to auto<br>(the default), the training will<br>automatically determine the<br>required polynomial degree needed<br>to obtain suitable accuracy. If set to<br>manual, the maximum polynomial<br>degree is determined by the<br>polydegreespce and qnorm<br>settings. |
| pdistr                 | boolean                                                                             | false   | Distribute model evaluation.                                                                                                                                                                                                                                                                    |
| pname                  | string array                                                                        | {}      | Array of input parameter names.                                                                                                                                                                                                                                                                 |
| polydegreespce         | positive integer                                                                    | 30      | Maximum polynomial degree, when<br>pcesettings is set to manual.                                                                                                                                                                                                                                |
| punitselection         | string array with keys<br>col1, col2, col3, …<br>and units for the values           | {}      | The unit for each input parameter as<br>an alternating array of keys and<br>values.                                                                                                                                                                                                             |
| qoiconfigurestudyinput | string array with keys 1,<br>2, 3, … and values<br>reduce or configure              | {}      | For each quantity of interest, specify<br>if it is global (reduce) or nonglobal<br>(configure) as an array of<br>alternating keys and values.                                                                                                                                                   |
| qoiexpression          | string array                                                                        | {}      | Array of expressions for each<br>quantity of interest.                                                                                                                                                                                                                                          |

TABLE 6-173: SURROGATEMODELTRAINING PROPERTIES

| PROPERTY             | VALUE                                                                                                                                  | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                                            |
|----------------------|----------------------------------------------------------------------------------------------------------------------------------------|-----------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| qoisolutionindv      | string array with keys 1,<br>2, 3, … and values<br>auto, sum, min, max,<br>last, or first.                                             | {}        | Individual solution selection for each<br>quantity of interest as an alternating<br>array of keys and values.                                                                                                                                          |
| qoisolutionouterindv | string array with keys 1,<br>2, 3, … and values sum,<br>min, or max.                                                                   | {}        | Individual outer solution selection<br>for each quantity of interest as an<br>alternating array of keys and values.                                                                                                                                    |
| qnorm                | double (0–1)                                                                                                                           | 0.5       | Q norm, when pcesettings is set<br>to manual.                                                                                                                                                                                                          |
| randseed             | integer                                                                                                                                | 1         | Initial random seed when useseed<br>is set to manual.                                                                                                                                                                                                  |
| reusesol             | boolean                                                                                                                                | false     | Reuse solution from previous step.                                                                                                                                                                                                                     |
| s1selection          | string array with keys<br>col1, col2, col3, …<br>and double values as<br>strings                                                       | {}        | The first parameter for each input<br>parameter distribution as an<br>alternating array of keys and values.                                                                                                                                            |
| s2selection          | string array with keys<br>col1, col2, col3, …<br>and double values as<br>strings                                                       | {}        | The second parameter for each<br>input parameter distribution as an<br>alternating array of keys and values.                                                                                                                                           |
| studyinputparamname  | string array                                                                                                                           | {}        | Array of study-input parameters.                                                                                                                                                                                                                       |
| surrogatemodel       | none   gp   pce   dnn  <br>lsq                                                                                                         | none      | Use gp (Gaussian Process), pce<br>(Polynomial Chaos Expansion), dnn<br>(Deep Neural Network), or lsq<br>(Least-squares fit) to set up<br>surrogate models after the design of<br>experiments, or use none if no<br>surrogate models should be created. |
| uboundselection      | string array with keys<br>col1, col2, col3, …<br>and values between 0<br>and 1 as strings                                              | {}        | The upper bound for the CDF for<br>each input parameter distribution if<br>ucdfselection is manual as an<br>alternating array of keys and values.                                                                                                      |
| ucdfselection        | string array with keys<br>col1, col2, col3, …<br>and values 0.7, 0.9,<br>0.99, 1-1e-3, 1-1e-4,<br>1-1e-5, 1-1e-6, 1-1e-7,<br>or manual | {}        | The upper bound for the CDF for<br>each input parameter distribution as<br>an alternating array of keys and<br>values.                                                                                                                                 |
| useaccumtable        | boolean                                                                                                                                | false     | Use accumulated probe table.                                                                                                                                                                                                                           |
| useseed              | automatic   manual  <br>currenttime                                                                                                    | automatic | Random seed type for input<br>parameters sampling.                                                                                                                                                                                                     |

# *Time Dependent*

A Time Dependent study step is intended for simulations where field variables vary over time and you can use a time-dependent solver.

#### **SYNTAX**

```
model.study(stdname).create(fname, "Transient");
model.study(stdname).feature(fname).set(pname,value);
```

#### **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-174: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY | VALUE           | DEFAULT | DESCRIPTION                                   |
|----------|-----------------|---------|-----------------------------------------------|
| tlist    | Numeric vector  |         | Time list.                                    |
| usertol  | on   off        | off     | Physics-controlled or user-defined tolerance. |
| rtol     | Positive scalar | 0.01    | Relative tolerance, if usertol is on.         |
| tunit    | String          | s       | Time unit.                                    |

#### TABLE 6-175: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |
| plotfreq  | tout   tsteps       | tout    | Where to update plot.                     |

TABLE 6-176: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |
| discretization            | String Map      |         | See Physics and Variables Selection. |
| equationform              | String Map      |         | See Physics and Variables Selection. |
| equationform_freq         | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src     | String Map      |         | See Physics and Variables Selection. |
| reconstructors            | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable        | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-177: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY     | VALUE              | DEFAULT | DESCRIPTION                                                      |
|--------------|--------------------|---------|------------------------------------------------------------------|
| initmethod   | init   sol         | init    | Method for initial values for variables solved for.              |
| initstudy    | String             |         | Reference to study or "zero" for zero<br>solution.               |
| manualsolnum | Vector of integers | [1]     | Index to solution for initial value for variables<br>solved for. |

TABLE 6-177: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |
| solnum             | auto   first   last  <br>interp   manual  <br>positive integer                      | auto    | Solution selection of initial values for variables<br>solved for.                                                                                                      |
| t                  | String                                                                              |         | Specify time for interpolated solution of initial<br>value for variables solved for.                                                                                   |
| useinitsol         | on   off                                                                            | off     | User-controlled initial values for variables<br>solved for.                                                                                                            |
| usesol             | on   off                                                                            | off     | User-controlled values for variables not solved<br>for.                                                                                                                |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-178: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

#### TABLE 6-179: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY       | VALUE       | DEFAULT | DESCRIPTION                                                        |
|----------------|-------------|---------|--------------------------------------------------------------------|
| autoremesh     | on   off    | off     | Automatic remeshing.                                               |
| autoremeshgeom | String      |         | Name of geometry to use.                                           |
| plistarr       | Real matrix |         | List of parameter values. One row of values per<br>parameter name. |

TABLE 6-179: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY  | VALUE             | DEFAULT | DESCRIPTION                             |
|-----------|-------------------|---------|-----------------------------------------|
| pname     | Vector of strings |         | Parameter names.                        |
| punit     | Vector of strings |         | Parameter units.                        |
| sweeptype | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep. |
| useparam  | on   off          | off     | Auxiliary sweep.                        |

TABLE 6-180: PROPERTIES FOR TIME-DEPENDENT MESH ADAPTATION.

| PROPERTY       | VALUE               | DEFAULT | DESCRIPTION                                                                               |
|----------------|---------------------|---------|-------------------------------------------------------------------------------------------|
| adapgeom       | String              |         | Adaptation in geometry.                                                                   |
| adapsolnum     | Array of integers>0 | 1       | Indices.                                                                                  |
| adaptselection | selection           | all()   | The selection for the adaptation (the default is<br>the entire geometry). See Selections. |
| timeadaption   | on   off            | off     | Adaptive mesh refinement.                                                                 |

# *Time Discrete*

A Time Discrete study step adds a Time Discrete Solver. Use it for performing time-dependent analysis using the projection method.

## **SYNTAX**

```
model.study(stdname).create(fname, "TimeDiscrete");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-181: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY | VALUE           | DEFAULT | DESCRIPTION                                   |
|----------|-----------------|---------|-----------------------------------------------|
| tlist    | Numeric vector  |         | Time list.                                    |
| usertol  | on   off        | off     | Physics-controlled or user-defined tolerance. |
| rtol     | Positive scalar | 0.01    | Relative tolerance, if usertol is on.         |
| tunit    | String          | s       | Time unit.                                    |

TABLE 6-182: PROPERTIES FOR PLOT RESULTS WHILE SOLVING.

| PROPERTY  | VALUE               | DEFAULT | DESCRIPTION                               |
|-----------|---------------------|---------|-------------------------------------------|
| plot      | on   off            | off     | Plot while solving.                       |
| plotgroup | String              | default | Plot group to use for plot while solving. |
| probefreq | pout   psteps       | pout    | When to update probes.                    |
| probes    | Vector of strings   |         | Probes to use when probesel=manual.       |
| probesel  | all   none   manual | all     | Probes to compute.                        |
| plotfreq  | tout   tsteps       | tout    | Where to update plot.                     |

TABLE 6-183: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY         | VALUE      | DEFAULT | DESCRIPTION                          |
|------------------|------------|---------|--------------------------------------|
| activate         | String Map |         | See Physics and Variables Selection. |
| activateCoupling | String Map |         | See Physics and Variables Selection. |
| activaterom      | String Map |         | See Physics and Variables Selection. |

TABLE 6-183: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |
| discretization            | String Map      |         | See Physics and Variables Selection. |
| equationform              | String Map      |         | See Physics and Variables Selection. |
| equationform_freq         | String Map      |         | See Physics and Variables Selection. |
| equationform_freq_src     | String Map      |         | See Physics and Variables Selection. |
| reconstructors            | String Map      |         | See Physics and Variables Selection. |
| useadvanceddisable        | on   off        | off     | See Physics and Variables Selection. |

TABLE 6-184: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| initmethod         | init   sol                                                                          | init    | Method for initial values for variables solved for.                                                                                                                    |
| initstudy          | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| manualsolnum       | Vector of integers                                                                  | [1]     | Index to solution for initial value for variables<br>solved for.                                                                                                       |
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |

TABLE 6-184: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY   | VALUE                                                          | DEFAULT | DESCRIPTION                                                                          |
|------------|----------------------------------------------------------------|---------|--------------------------------------------------------------------------------------|
| solnum     | auto   first   last  <br>interp   manual  <br>positive integer | auto    | Solution selection of initial values for variables<br>solved for.                    |
| t          | String                                                         |         | Specify time for interpolated solution of initial<br>value for variables solved for. |
| useinitsol | on   off                                                       | off     | User-controlled initial values for variables<br>solved for.                          |
| usesol     | on   off                                                       | off     | User-controlled values for variables not solved<br>for.                              |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-185: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

TABLE 6-186: PROPERTIES FOR MESH ADAPTATION AND STUDY EXTENSIONS.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                               |
|----------------|-------------------|---------|-------------------------------------------------------------------------------------------|
| adapgeom       | String            |         | Name of geometry to use.                                                                  |
| adaption       | on   off          | off     | Adaptive mesh refinement.                                                                 |
| adaptselection | selection         | all()   | The selection for the adaptation (the default is<br>the entire geometry). See Selections. |
| plistarr       | Real matrix       |         | List of parameter values. One row of values per<br>parameter name.                        |
| pname          | Vector of strings |         | Parameter names.                                                                          |
| punit          | Vector of strings |         | Parameter units.                                                                          |
| sweeptype      | filled   sparse   | sparse  | Sweep type: a filled or a sparse sweep.                                                   |
| useparam       | on   off          | off     | Auxiliary sweep.                                                                          |

# *Time to Frequency FFT*

A Time to Frequency FFT study step, which you can add to a frequency domain study, performs a forward FFT from the time domain (input) to the frequency domain (output). As the default solver it adds an FFT solver.

# **SYNTAX**

```
model.study(stdname).create(fname, "TimeToFreqFFT");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-187: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY       | VALUE                                                                                 | DEFAULT  | DESCRIPTION                                                                                                                                        |
|----------------|---------------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| fftendtime     | Real scalar                                                                           | 1.0      | End time for the time interval.                                                                                                                    |
| fftinputmethod | sol   init                                                                            | sol      | Prescribe the input values using a solution or an<br>initial expression.                                                                           |
| fftinputpstudy | String                                                                                | current  | Study that defines input values for the FFT<br>study step.                                                                                         |
| fftmaxfreq     | Real scalar                                                                           | 10       | Maximum output frequency.                                                                                                                          |
| fftrealstore   | on   off                                                                              | on       | Do not store negative frequencies for real<br>input.                                                                                               |
| fftscaling     | cont   discrete                                                                       | cont     | Use a discrete or continuous scaling for the<br>Fourier transform.                                                                                 |
| fftstarttime   | Real scalar                                                                           | 0.0      | Start time for the time interval.                                                                                                                  |
| fftwinalpha    | Real scalar                                                                           | 0.5      | Window parameter for a Tukey window.                                                                                                               |
| fftwincenterfw | Real scalar                                                                           | 0.5      | Window center for a Gaussian window<br>function.                                                                                                   |
| fftwincutoff   | Real scalar                                                                           | 1        | Cutoff fraction for window function in [0, 1].                                                                                                     |
| fftwindev      | Real scalar                                                                           | 1        | Standard deviation for a Gaussian window<br>function.                                                                                              |
| fftwindowfw    | on   off                                                                              | off      | Use window function.                                                                                                                               |
| fftwinexpr     | String                                                                                | 1        | Expression for window function (when set to<br>fromexpr). Can be expressed in terms of t,<br>freq, niterFFTin, and niterFFTout (if<br>applicable). |
| fftwinmaxfw    | Real scalar                                                                           | 1        | Maximum (end) value for window.                                                                                                                    |
| fftwinminfw    | Real scalar                                                                           | 0        | Minimum (start) value for window.                                                                                                                  |
| fftwintypefw   | fromexpr   cutoff  <br>rectangle   gauss  <br>hamming   hanning  <br>blackman   tukey | fromexpr | Method for window function.                                                                                                                        |
| punit          | String                                                                                | Hz       | Frequency unit.                                                                                                                                    |
| tunit          | String                                                                                | s        | Time unit.                                                                                                                                         |

TABLE 6-188: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |

TABLE 6-188: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY              | VALUE      | DEFAULT | DESCRIPTION                          |
|-----------------------|------------|---------|--------------------------------------|
| discretization        | String Map |         | See Physics and Variables Selection. |
| equationform          | String Map |         | See Physics and Variables Selection. |
| equationform_freq     | String Map |         | See Physics and Variables Selection. |
| equationform_freq_src | String Map |         | See Physics and Variables Selection. |
| reconstructors        | String Map |         | See Physics and Variables Selection. |
| useadvanceddisable    | on   off   | off     | See Physics and Variables Selection. |

TABLE 6-189: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-190: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

# Results

Detailed COMSOL® API reference information is included for the results features and utility methods for extracting, evaluating, and plotting results data from the simulations.

#### In this chapter:

- **•** About Results Commands
- **•** Use of Datasets
- **•** Extracting and Storing Plot Data
- **•** Solution Selection
- **•** Custom Color Tables
- **•** Stepping Through Plots
- **•** Results Commands