# **CURRENT VERSION**

0

| ENTITY/OBJECT     | VARIABLE | DESCRIPTION                                                                                                  |  |
|-------------------|----------|--------------------------------------------------------------------------------------------------------------|--|
| integer           |          | Version.                                                                                                     |  |
| integer           | d        | Space dimension.                                                                                             |  |
| Boolean           |          | I if transformation is a unit transformation; 0 otherwise. If the value is $I$ , no more fields are present. |  |
| double [d+1][d+1] | M        | Values in transformation matrix.                                                                             |  |
| Boolean           |          | I if determinant is positive; 0 otherwise.                                                                   |  |
| Boolean           |          | I if matrix is isotropic; 0 otherwise.                                                                       |  |

## DESCRIPTION

The transformation class is defined by the transformation matrix, which operates as a premultiplier on column vectors containing homogeneous coordinates thus

$$\begin{bmatrix} x' \ y' \ z' \ s' \end{bmatrix} = M \cdot \begin{bmatrix} x \ y \ z \ s \end{bmatrix}'$$

where the conventional 3D coordinates are

$$\frac{x}{s} \frac{y}{s} \frac{z}{s}$$

The matrix thus consists of

$$\left[\begin{array}{ccc} T_x \ \mathbf{R} & T_y \ T_z \ 0 \ 0 \ 0 & S \end{array}\right]$$

where **R** is a nonsingular transformation matrix, containing the rotation, reflection, nonuniform scaling, and shearing components; T is a translation vector; and S is a global scaling factor greater than zero.

