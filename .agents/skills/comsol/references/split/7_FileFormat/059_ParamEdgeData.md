# *ParamEdgeData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                                            |
|---------------|----------|------------------------------------------------------------------------------------------------------------------------|
| int           |          | Index of the corresponding 3D edge (1-based).                                                                          |
| int[2]        |          | Indices of the start and end parameter vertices (1-based index in the vector<br>of ParamVertexData).                   |
| double[2]     |          | Parameter values of the start and end vertices.                                                                        |
| int[2]        |          | Indices of the left and right faces, respectively (1-based). This is 0 if there is<br>no face.                         |
| int           |          | Signed index of the underlying parameter curve. The sign indicates the<br>direction of the edge relative to the curve. |
| int           |          | Index of the surface (1-based).                                                                                        |
| double        |          | Relative tolerance of the edge.                                                                                        |

## *FaceData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                               |
|---------------|----------|-------------------------------------------|
| int[2]        |          | The up and down domain index of the face. |
| int           |          | Surface index of the face (1-based).      |
| double        |          | Relative tolerance of the edge.           |

## **DESCRIPTION**

The Geom3 type represents a geometry object in 3D represented using the COMSOL kernel that is not an assembly and is not virtual. The geometry object must not be self-intersecting.

*GeomCurve*

#### **SUBTYPE OF**

Serializable

## **DESCRIPTION**

GeomCurve is the abstract base type for all curve types. It has no fields (except for the type ID from Serializable).

*GeomSurf*

## **SUBTYPE OF**

Serializable

## **DESCRIPTION**

GeomSurf is the abstract base type for all surface types. It has no fields (except for the type ID from Serializable).

*Mesh*

#### **CURRENT VERSION**

4

## **SUBTYPE OF**

Serializable

#### **FIELDS**

| ENTITY/OBJECT    | VARIABLE | DESCRIPTION                                                                     |
|------------------|----------|---------------------------------------------------------------------------------|
| integer          |          | Version.                                                                        |
| integer          | d        | Space dimension (if equal to 0 no more fields).                                 |
| integer          | np       | Number of mesh vertices.                                                        |
| integer          |          | Lowest mesh vertex index.                                                       |
| double[d][np]    | p        | Mesh points.                                                                    |
| integer          | nt       | Number of element types (equals the number of repeats of the following fields). |
| string           |          | Element type.                                                                   |
| integer          | nep      | Number of vertices per element.                                                 |
| integer          | ne       | Number of elements.                                                             |
| integer[ne][nep] | elem     | Matrix of point indices for each element.                                       |
| integer          | ndom     | Number of geometric entity values.                                              |
| integer[ndom]    | dom      | Vector of geometric entity labels for each element.                             |

## **DESCRIPTION**

The geometric entity numbering for points, edges, and boundaries must start from 0 and the geometric entity numbering for domains must start from 1 when defining a mesh through a COMSOL Multiphysics mesh file.

For information about the local mesh numbering for the mesh element type in COMSOL Multiphysics, see Mesh Element Numbering Conventions.

#### **EXAMPLE**

The following displays a mesh with triangular elements on a unit square. Neither point nor edge elements are present.

```
