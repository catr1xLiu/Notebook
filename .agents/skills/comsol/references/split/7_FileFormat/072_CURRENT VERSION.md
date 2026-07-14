# **CURRENT VERSION**

1

#### **SUBTYPE OF**

GeomCurve

#### **FIELDS**

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                        |
|---------------|----------|------------------------------------|
| integer       |          | Version.                           |
| integer       | np       | Number of polygon points.          |
| double[np][2] | pol      | Coordinates of the polygon points. |

## **DESCRIPTION**

A PolChain represents a polygon in 2D with a parameter interval [*i*/(np-1), (*i*+1)/(np-1)] on the *i*th polygon segment. Using np > 2 is not recommended because it gives a curve with tangent discontinuities.

## **SEE ALSO**

MeshCurve

*Selection*

#### **CURRENT VERSION**

0

#### **SUBTYPE OF**

Serializable

#### **FIELDS**

| ENTITY/OBJECT | DESCRIPTION                                                                                                                       |  |  |
|---------------|-----------------------------------------------------------------------------------------------------------------------------------|--|--|
| integer       | Version.                                                                                                                          |  |  |
| string        | Selection label. The string is encoded in UTF-8.                                                                                  |  |  |
| string        | Tag of corresponding object (mesh) in file.                                                                                       |  |  |
| integer       | Dimension of selection (0: vertex; 1: edge; 2: face; 3: domain in 3D).                                                            |  |  |
| integer       | Number of entities.                                                                                                               |  |  |
| integer[]     | The indices of the entities for the selection. The integers specify the 0-based indices of the entities<br>(1-based for domains). |  |  |

