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

