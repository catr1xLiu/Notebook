# Serializable Classes

In this section:

| •<br>BezierCurve |  |
|------------------|--|
|------------------|--|

- **•** BezierSurf
- **•** BezierTri
- **•** BSplineCurve
- **•** BSplineSurf
- **•** Ellipse
- **•** Geom1
- **•** Geom2
- **•** Geom3
- **•** GeomCurve

- **•** GeomSurf
- **•** Mesh
- **•** MeshCurve
- **•** MeshSurf
- **•** PolChain
- **•** Selection
- **•** Serializable
- **•** Straight
- **•** Transform

The Serializable class is the base type, and all other types are subtypes of Serializable or of its subtypes.

![](_page_60_Picture_22.jpeg)

In the **Fields** sections for each type below, the fields appear in the table in the exact order that they must appear in the data files.

The **Variable** column lists the internal variables used in the descriptions of data types and in the definitions of what the class implements.

![](_page_60_Picture_25.jpeg)

The serialization of a subtype of Serializable begins with Serializable's serialization; that is, it begins with the type ID string. The type ID strings are the same as the headers of the following sections.

For an example of the serialization format — specifically, of a file containing a 3D mesh with tetrahedral and prism elements — see mesh\_example\_4.mphtxt in \models\COMSOL\_Multiphysics\Meshing\_Tutorials.

![](_page_60_Picture_28.jpeg)

For geometry types, you can import and export older versions of the serializable classes.

*BezierCurve*

**CURRENT VERSION**

1

**SUBTYPE OF**

GeomCurve

| ENTITY/OBJECT  | VARIABLE | DESCRIPTION                                                                                                                                                                                                |
|----------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| integer        |          | Version.                                                                                                                                                                                                   |
| integer        | d        | Space dimension.                                                                                                                                                                                           |
| Boolean        |          | I if the curve is rational, 0 if the curve is polynomial (nonrational).                                                                                                                                    |
| integer        | р        | Degree.                                                                                                                                                                                                    |
| double[p+1][k] | Pw       | The control points. If the curve is rational, then the points are given in homogeneous coordinates and $k = d+1$ . If the curve is polynomial, the points are given in Cartesian coordinates and $k = d$ . |

#### DESCRIPTION

A rational Bézier curve is a parameterized curve of the form

$$\mathbf{C}(t) = \frac{\sum_{i=0}^{p} \mathbf{P}_i w_i B_i^p(t)}{\sum_{i=0}^{p} w_i B_i^p(t)} \quad , 0 \leq t \leq 1$$

where the functions

$$B_i^p(t) = \binom{p}{i} t^i (1-t)^{p-i}$$

are the Bernstein basis functions of degree p,  $P_i = (x_1, ..., x_d)$  are the control points in the d-dimensional space, and  $w_i$  are the weights, which should always be positive real numbers to get a properly defined rational Bézier curve. A rational Bézier curve has a direction defined by the parameter t. The homogeneous control points Pw[i] used in the serialization of a rational curve have the components:

$$\begin{aligned} \text{Pw[i][k]} &= \omega_i P_{i,\,k}, \, 0 \leq k < d \\ &\text{Pw[i][d]} &= \omega_i \end{aligned}$$

A polynomial curve has all weights equal to 1.

## EXAMPLE

The following example illustrates a Bézier curve:

- 11 BezierCurve # class
- 1 # version
- 3 # sdim
- 1 # rational?
- 2 # degree
- # homogeneous control points
- -0.70710678118654757 -0.70710678118654757 0 0.70710678118654757
- 0 -1 0 1

## SEE ALSO

**BSplineCurve** 

#### **CURRENT VERSION**

#### SUBTYPE OF

GeomSurf

## FIELDS

| ENTITY/OBJECT       | VARIABLE | DESCRIPTION                                                                                                                                                                                                                                                       |
|---------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| integer             |          | Version.                                                                                                                                                                                                                                                          |
| Boolean             |          | I if the surface is rational, 0 if it is polynomial (nonrational).                                                                                                                                                                                                |
| integer             | р        | Degree in the first parameter.                                                                                                                                                                                                                                    |
| integer             | q        | Degree in the second parameter.                                                                                                                                                                                                                                   |
| double[q+1][p+1][k] | Pw       | The surface control points. If the surface is rational, these are given in homogeneous coordinates and $k=4$ . If the surface is polynomial, these are given in Cartesian coordinates and $k=3$ . The value of p must be greater than or equal to the value of q. |

#### DESCRIPTION

A rectangular rational Bézier surface of degree p-by-q is described by

$$\mathbf{S}(s,t) = \frac{\sum_{i=0}^{p} \sum_{j=0}^{q} \mathbf{P}_{i,j} w_{i,j} B_{i}^{p}(s) B_{j}^{q}(t)}{\sum_{i=0}^{p} \sum_{j=0}^{q} w_{i,j} B_{i}^{p}(s) B_{j}^{q}(t)}, \ 0 \leq s, t \leq 1 \ ,$$

where  $B_i^p$  and  $B_i^q$  are the Bernstein basis functions of degree p and q, respectively, as described in the entry of BezierCurve. This surface description is called rectangular because the parameter domain is rectangular; that is, the two parameters s and t can vary freely in given intervals. The homogeneous control points Pw[j][i] used in the serialization of a rational surface have the components:

$$\begin{aligned} \text{Pw[j][i][k]} &= \omega_{i,j} P_{i,j,\,k}, \, 0 \leq k < 3 \\ &\text{Pw[j][i][d]} &= \omega_{i,\,j} \end{aligned}$$

A polynomial surface has all weights equal to 1.

#### SEE ALSO

BSplineSurf, BezierTri

BezierTri

#### **CURRENT VERSION**

## SUBTYPE OF

GeomSurf

The class is defined by the following fields:

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                          |
|---------------|----------|--------------------------------------|
| integer       |          | Version.                             |
| double[3][3]  | P        | Control points P[0], P[1], and P[2]. |

