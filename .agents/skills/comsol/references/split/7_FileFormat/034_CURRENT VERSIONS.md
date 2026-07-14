# CURRENT VERSIONS

## SUBTYPE OF

GeomCurve

#### FIELDS

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                                                                                                                                                                                   |  |  |
|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|--|
| integer       |          | Version.                                                                                                                                                                                                                                                      |  |  |
| integer       | d        | Space dimension.                                                                                                                                                                                                                                              |  |  |
| Boolean       |          | I if the curve is rational, 0 if the curve is polynomial (nonrational).                                                                                                                                                                                       |  |  |
| Boolean       |          | I if the curve is periodic, 0 if it is not periodic.                                                                                                                                                                                                          |  |  |
| integer       | p        | Degree.                                                                                                                                                                                                                                                       |  |  |
| integer       | m        | Length of knot vector.                                                                                                                                                                                                                                        |  |  |
| double[m]     | U        | Knot vector.                                                                                                                                                                                                                                                  |  |  |
| double[n][k]  | Pw       | The control points of the curve. The number of control points, n, is given by $n=m-p-1$ . If the curve is rational, these are given in homogeneous coordinates and $k=d+1$ . If the curve is polynomial, these are given in Cartesian coordinates and $k=d$ . |  |  |

