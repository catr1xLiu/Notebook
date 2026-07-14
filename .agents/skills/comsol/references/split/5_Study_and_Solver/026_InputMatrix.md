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

