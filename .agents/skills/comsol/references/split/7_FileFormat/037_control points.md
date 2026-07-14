# control points
1 0.3333333333333333 0
1 0.666666666666666 0.3333333333333333
1 1 1
```

## SEE ALSO

BezierCurve

## **CURRENT VERSION**

#### SUBTYPE OF

GeomSurf

## FIELDS

| ENTITY/OBJECT     | VARIABLE | DESCRIPTION                                                                                                                                                                                                                                                                                               |
|-------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| integer           |          | Version.                                                                                                                                                                                                                                                                                                  |
| Boolean           |          | I if the surface is rational, 0 if the surface is polynomial (nonrational).                                                                                                                                                                                                                               |
| integer           | p        | Degree in first parameter.                                                                                                                                                                                                                                                                                |
| integer           | q        | Degree in second parameter.                                                                                                                                                                                                                                                                               |
| Boolean           |          | I if the surface is periodic in the first parameter; 0 otherwise.                                                                                                                                                                                                                                         |
| Boolean           |          | I if the surface is periodic in the second parameter; 0 otherwise.                                                                                                                                                                                                                                        |
| integer           | m1       | Length of first knot vector.                                                                                                                                                                                                                                                                              |
| double[m1]        | U        | First knot vector.                                                                                                                                                                                                                                                                                        |
| integer           | m2       | Length of second knot vector.                                                                                                                                                                                                                                                                             |
| double[m2]        | V        | Second knot vector.                                                                                                                                                                                                                                                                                       |
| double[n2][n1][k] | Pw       | The control points of the surface. The number of control points, n1 and n2, are given by n1 = m1 - p - 1 and n2 = m2 - q - 1. If the surface is rational these are given in homogeneous coordinates and $k = d + 1$ . If the surface is polynomial these are given in Cartesian coordinates and $k = d$ . |

## DESCRIPTION

The generalization of B-spline curves to surfaces is a tensor product surfaces given by

$$\mathbf{S}(s,t) = \frac{\sum\limits_{i=0}^{n1}\sum\limits_{j=0}^{n2}\mathbf{P}_{i,j}w_{i,j}N_{i}^{p(s)}N_{j}^{q(t)}}{\sum\limits_{i=0}^{n1}\sum\limits_{j=0}^{n2}w_{i,j}N_{i}^{p(s)}N_{j}^{q(t)}}$$

For  $N_i^p$ , the following definition is used:

$$\begin{split} N_i^0(u) &= \left\{ \begin{array}{l} 1 \ u_i \leq u < u_{i+1} \\ 0 \quad \text{otherwise} \end{array} \right. \\ N_i^p(u) &= \frac{u - u_i}{u_{i+p} - u_i} N_i^{p-1}(u) + \frac{u_{i+p+1} - u}{u_{i+p+1} - u_{i+1}} N_{i+1}^{p-1}(u) \end{split}$$

The homogeneous control points Pw[j][i] used in the serialization of a rational surface have the components:

$$\begin{split} \mathrm{Pw[j][i][k]} &= \omega_{i,j} P_{i,j,\,k}, \, 0 \leq k < 3 \\ & \mathrm{Pw[j][i][d]} = \omega_{i\,\,j} \end{split}$$

A polynomial surface has all weights equal to 1.

### **SEE ALSO**

BezierSurf

