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

