# **CURRENT VERSION**

1

## **SUBTYPE OF**

GeomCurve

| ENTITY/OBJECT   | VARIABLE | DESCRIPTION                                              |
|-----------------|----------|----------------------------------------------------------|
| integer         |          | Version.                                                 |
| integer         | d        | Space dimension.                                         |
| integer         | np       | Number of interpolation points.                          |
| double[np][d+1] | P        | Coordinates and parameters for each interpolation point. |
| BSplineCurve    |          | Interpolating curve.                                     |

In the matrix *P*, the first *d* values of each row are the coordinates for the point and the (*d*+1):th value is the parameter.

#### **DESCRIPTION**

A MeshCurve represents a cubic spline interpolation curve through given interpolation points. The corresponding parameter values are also given as an increasing sequence of numbers.

## **SEE ALSO**

BSplineCurve

*MeshSurf*

#### **CURRENT VERSIONS**

1

## **SUBCLASS OF**

GeomSurf

## **FIELDS**

| ENTITY/OBJECT   | VARIABLE | DESCRIPTION                                                     |
|-----------------|----------|-----------------------------------------------------------------|
| integer         |          | Version.                                                        |
| integer         | nv       | Number of mesh vertices.                                        |
| double[nv][5]   | p        | Coordinates and parameters for each mesh vertex.                |
| integer         | nt       | Number of mesh triangles.                                       |
| integers[nt][3] | elem     | Matrix of (0-based) mesh vertex indices for each mesh triangle. |

