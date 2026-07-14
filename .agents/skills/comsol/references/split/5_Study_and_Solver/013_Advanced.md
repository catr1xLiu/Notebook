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

