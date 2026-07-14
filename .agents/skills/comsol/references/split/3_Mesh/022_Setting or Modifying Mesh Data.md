# *Setting or Modifying Mesh Data*

You can modify the mesh object of a meshing sequence via the data() method. Using this method you access a temporary object (MeshData) storing mesh data. When you use the data() method the first time the MeshData object is empty. You can fill it with mesh data by using various set methods or by transferring mesh data from the mesh of the meshing sequence. Call the method data().createMesh to construct a complete mesh from the MeshData object and store it in the meshing sequence. If the geometry is not empty, the new mesh is checked to ensure that it matches the geometry. Thus, to create an arbitrary mesh, you need to create an empty geometry sequence and a corresponding empty meshing sequence and construct the mesh on the empty meshing sequence.

To set the mesh vertices, use

```
model.component(<ctag>).mesh(<tag>).data().setVertex(double[][]);
```

where each column of the input matrix contains the coordinates of a mesh vertex.

To set the elements of a specific type, use

```
model.component(<ctag>).mesh(<tag>).data().setElem(type, int[][]);
```

where each column of input element matrix contains the mesh vertex indices of an element's corners.

If you want to specify the geometric entity number for the elements of a specific type, use

```
model.component(<ctag>).mesh(<tag>).data().setElemEntity(type, int[]);
```

The MeshData object has the same access methods as the meshing sequence.

```
int model.component(<ctag>).mesh(<tag>.data().getNumVertex();
double[][] model.component(<ctag>).mesh(<tag>).data().getVertex();
String[] model.component(<ctag>).mesh(<tag>).data().getTypes();
int model.component(<ctag>).mesh(<tag>).data().getNumElem(type);
int[][] model.component(<ctag>).mesh(<tag>).data().getElem(type);
int[] model.component(<ctag>).mesh(<tag>).data().getElemEntity(type);
```

![](_page_19_Picture_15.jpeg)

## Accessing Mesh Data

It is also possible to fill the MeshData object with mesh data from the mesh of a meshing sequence. To transfer the mesh from the current meshing sequence into the MeshData object, use

```
model.component(<ctag>).mesh(<tag>).data().transferMesh();
```

To transfer the mesh from another meshing sequence, specified by *mtag*, into the MeshData object, use

```
model.component(<ctag>).mesh(<tag>).data().transferMesh(mtag);
```

To clear the MeshData object, use

```
model.component(<ctag>).mesh(<tag>).data().clearData();
```

To create a complete mesh from the MeshData object and store it in the sequence, use

```
model.component(<ctag>).mesh(<tag>).data().createMesh();
```

This method uses several properties when creating a complete mesh from the specified mesh data. To set a property, use

```
model.component(<ctag>).mesh(<tag>).data().set(property, <value>);
To get a property, use
  model.component(<ctag>).mesh(<tag>).data().getType(property);
```

Running the createMesh() method from provided, possibly incomplete, mesh data is equivalent to importing possibly incomplete mesh data from file. See Importing Externally Generated Mesh Data in the *COMSOL Multiphysics Reference Manual* for more information.

The following properties are available.

TABLE 4-7: VALID PROPERTY/VALUE PAIRS.

| PROPERTY      | VALUE  | DEFAULT        | 2D | 3D | DESCRIPTION                                                                                                                                 |
|---------------|--------|----------------|----|----|---------------------------------------------------------------------------------------------------------------------------------------------|
| extrangle     | double | 0.6<br>degrees |    | √  | Maximum angle between boundary element normal and<br>extrusion plane that causes the element to be a part the<br>extruded face if possible. |
| faceangle     | double | 360<br>degrees |    | √  | Maximum angle between any two boundary elements in the<br>same face.                                                                        |
| facecleanup   | double | 0.01           |    | √  | Avoid creating small faces. Faces with an area less than<br>Facecleanup * the mean face area, are merged with adjacent<br>faces.            |
| facecurv      | double | 10<br>degrees  |    | √  | Maximum relative angle deviation between any two boundary<br>elements in the same face.                                                     |
| minareacurv   | double | 1              |    | √  | Minimum relative area of face to be considered as a face with<br>constant curvature.                                                        |
| minareaextr   | double | 0.05           |    | √  | Minimum relative area of face to be considered extruded.                                                                                    |
| minareaeplane | double | 0.005          | √  | √  | Minimum relative area of face to be considered planar.                                                                                      |
| neighangle    | double | 20<br>degrees  | √  | √  | Maximum angle between a boundary element and a neighbor<br>that causes the elements to be part of the same boundary<br>domain if possible.  |
| planarangle   | double | 0.6<br>degrees | √  | √  | Maximum angle between boundary element normal and a<br>neighbor that causes the element to be a part the planar face<br>if possible         |

