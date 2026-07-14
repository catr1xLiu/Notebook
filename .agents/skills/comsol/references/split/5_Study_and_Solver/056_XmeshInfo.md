# *XmeshInfo*

Get extended mesh information.

#### **SYNTAX**

```
SolverFeature step = model.sol(seqTag).feature(studyStepTag);
XmeshInfo xmi = step.xmeshInfo();
XmeshInfo xmi = step.xmeshInfo(meshCase);
SolverFeature var = model.sol(seqTag).feature(variablesTag);
XmeshInfo xmi = var.xmeshInfo();
XmeshInfo xmi = var.xmeshInfo(meshCase);
XmeshInfo xmi = model.sol(seqTag).xmeshInfo();
XmeshInfo xmi = model.sol(seqTag).xmeshInfo(meshCase);
String[] mcases = xmi.meshCases();
int nDofs = xmi.nDofs();
String[] fieldNames = xmi.fieldNames();
int[] fieldNDofs = xmi.fieldNDofs();
String[] geomTags = xmi.geoms();
String[] meshTypes = xmi.meshTypes();
String[] meshTypes = xmi.meshTypes(geomTag);
XmeshInfoDofs dofs = xmi.dofs();
int[] dofs.geomNums()
int[] dofs.nodes()
double[][] dofs.coords()
String[] dofs.dofNames()
int[] dofs.nameInds()
int[] dofs.solVectorInds()
XmeshInfoNodes nodes = xmi.nodes();
XmeshInfoNodes nodes = xmi.nodes(geomTag);
double[][] nodes.coords()
String[] nodes.dofNames()
int[][] nodes.dofs()
XmeshInfoElements elems = xmi.elements(meshType);
XmeshInfoElements elems = xmi.elements(meshType,geomTag);
double[][] elems.localCoords()
int[][] elems.nodes()
String[] elems.localDofNames()
double[][] elems.localDofCoords()
int[][] elems.dofs()
model.sol(seqTag).feature(studyStepTag).clearXmesh();
model.sol(seqTag).feature(variablesTag).clearXmesh();
```

## **DESCRIPTION**

The Xmesh information methods provide information about the numbering of elements, nodes, and degrees of freedom (DOFs) in the extended mesh and in the matrices returned by Assemble and the solvers.

```
SolverFeature step = model.sol(seqTag).feature(studyStepTag);
XmeshInfo xmi = step.xmeshInfo();
```

returns information about all degrees of freedom in the given study step, for the main mesh case. This includes information about internal degrees of freedom.

```
XmeshInfo xmi = step.xmeshInfo(meshCase);
```

returns information about the given mesh case. The string meshCase can be main, adaptionresidual, or a multigrid level tag.

```
SolverFeature var = model.sol(seqTag).feature(variablesTag);
XmeshInfo xmi = var.xmeshInfo();
XmeshInfo xmi = var.xmeshInfo(meshCase);
```

returns information about the degrees of freedom solved for in the given variables feature. That is, the numbering of the degrees of freedom span over the DOFs solved for, which is the indexing used in the matrices and vectors assembled by the solver. Internal degrees of freedom are not included.

```
XmeshInfo xmi = model.sol(seqTag).xmeshInfo();
XmeshInfo xmi = model.sol(seqTag).xmeshInfo(meshCase);
```

is equivalent to calling xmeshInfo on the last study step feature in the sequence.

```
model.sol(seqTag).feature(studyStepTag).clearXmesh();
model.sol(seqTag).feature(variablesTag).clearXmesh();
```

clears out the Xmesh object created by the call to xmeshInfo. After the required information has been obtained from the XmeshInfo object, this function should be called to release memory. When xmeshInfo is called on a solver sequence, an already existing Xmesh object is used, so there is no need to call clearXmesh.

## *General Information*

String[] mcases = xmi.meshCases() returns a string vector containing tags of all mesh cases.

int nDofs = xmi.nDofs() returns the total number of DOFs.

String[] fieldNames = xmi.fieldNames() returns the field names, or the field names solved for.

int[] fieldNDofs = xmi.fieldNDofs() returns the number of DOFs for each field.

String[] geomTags = xmi.geoms() returns the tags of all geometries that exist in the xmesh.

String[] meshTypes = xmi.meshTypes() returns all mesh types.

String[] meshTypes = xmi.meshTypes(geomTag) returns all mesh types in geometry geomTag (a string). Possible mesh types are vtx, edg, tri, quad, tet, hex, prism, and pyr.

*Information About Each DOF*

XmeshInfoDofs dofs = xmi.dofs() returns information about each DOF.

The class XmeshInfoDofs has the following methods:

TABLE 6-83: XMESHINFODOFS METHODS.

| FIELD                           | CONTENTS                                                                                                                                                                                                                                 |
|---------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| int[] geomNums()                | 1-based geometry numbers for all DOFs                                                                                                                                                                                                    |
| int[] nodes()                   | 0-based node numbers for all DOFs.                                                                                                                                                                                                       |
| double[][] coords()             | Global coordinates for all DOFs in the model length unit. The kth column of this<br>matrix contains the coordinates of DOF number k.                                                                                                     |
| double[][]<br>coords(xdGeomTag) | For DOFs in an extra dimension product, return the coordinates of each DOF in<br>the extra dimension geometry xdGeomTag. For DOFs that are not located in an<br>extra dimension product containing xdGeomTag, the value NaN is returned. |
| double[][] gCoords()            | Same as coords() except that coordinates are given in the geometry length unit.<br>If there is more than one geometry, the coordinates of each DOF are given in the<br>length unit of the geometry of that DOF.                          |
| String[] dofNames()             | DOF names                                                                                                                                                                                                                                |
| int[] nameInds()                | 0-based indices into dofNames() for all DOFs.                                                                                                                                                                                            |
| int[] solVectorInds()           | 0-based indices into solution vector for all DOFs.                                                                                                                                                                                       |

*Information About Each Node Point*

XmeshInfoNodes nodes = xmi.nodes() returns information about nodes. This method issues an error if there is more than one geometry.

XmeshInfoNodes nodes = xmi.nodes(geomTag) returns information about nodes in geometry geomTag (a string).

The class XmeshInfoNodes has the following methods:

TABLE 6-84: XMESHINFONODES CLASS METHODS.

| FIELD                | CONTENTS                                                                                                                                                                                                                                                                                  |  |
|----------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| double[][] coords()  | Global coordinates for all nodes. The nth column of the matrix coords contains the<br>coordinates of node point number n                                                                                                                                                                  |  |
| double[][] gCoords() | Same as coords() except that coordinates are given in the geometry length unit.                                                                                                                                                                                                           |  |
| String[] dofNames()  | DOF names in this geometry                                                                                                                                                                                                                                                                |  |
| int[][] dofs()       | 0-based DOF numbers for all nodes in this geometry. dofs()[k][n] is the DOF<br>number for DOF name dofNames()[k] at node point n. A value of -1 means that<br>there is no DOF with this name at the node. Note: If there is a slit, only one of the<br>DOFs is given for each node point. |  |

*Information About Each Mesh Element*

XmeshInfoElements[] elems = xmi.elements(meshType) returns information about mesh elements of type meshType (a string). This method issues an error if there is more than one geometry.

XmeshInfoElements[] elems = xmi.elements(meshType,geomTag) returns information about mesh elements of type meshType in geometry geomTag.

The XmeshInfoElements class has the following methods:

TABLE 6-85: XMESHINFOELEMENTS CLASS METHODS.

| FIELD                       | CONTENTS                                                                                                                                                                                                                                                                               |  |
|-----------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| double[][] localCoords()    | Local coordinates of nodes. The kth column of the matrix localCoords()<br>contains the coordinates of local node point number k.                                                                                                                                                       |  |
| int[][] nodes()             | 0-based node point indices for all mesh elements of type type().<br>nodes()[k][el] is the node point number within geometry geomNum()<br>(see the output xmi.nodes()) for local node point k within mesh element<br>el. A value -1 means that there is no node point at this location. |  |
| String[] localDofNames()    | The name for each local DOF.                                                                                                                                                                                                                                                           |  |
| double[][] localDofCoords() | The local coordinates for each local DOF (one column for each local DOF).                                                                                                                                                                                                              |  |
| int[][] dofs()              | 0-based DOF numbers for all mesh elements of type type().<br>dofs()[k][el] is the DOF number for local DOF k within mesh element<br>el. A value -1 means that there is no DOF at this location.                                                                                        |  |

