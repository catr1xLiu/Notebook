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

