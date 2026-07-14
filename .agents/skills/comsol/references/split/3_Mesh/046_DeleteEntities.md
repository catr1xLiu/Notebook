# *DeleteEntities*

Delete geometric entities from an imported mesh.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"DeleteEntities");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"DeleteEntities") to delete geometric entities from an imported 2D or 3D mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify geometric entities to delete.

The following property is available:

TABLE 4-41: AVAILABLE PROPERTY FOR DELETEENTITIES.

| PROPERTY    | VALUE   | DEFAULT | DESCRIPTION                                                                                                                                                                                                       |
|-------------|---------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| unmesheddom | Boolean | false   | Specifies whether to remove domain elements, while keeping the<br>domains as unmeshed as well as keeping adjacent meshed boundaries.<br>Only available in 3D and only valid when dimension of the selection is 3. |
| deleteadj   | Boolean | true    | Specifies if the operation removes lower dimensional adjacent entities.<br>Ignored if unmesheddom is valid and set to true                                                                                        |

#### **SEE ALSO**

Import, JoinEntities

## *DetectFaces*

Split geometric boundary entities by detecting faces in the mesh.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"DetectFaces");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"DetectFaces") to split geometric boundary entities of an imported 3D mesh by detecting shapes in the mesh that are likely to constitute faces.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the boundary entities to split. If you do not specify the selection, it is left empty.

The following properties are available:

TABLE 4-42: VALID PROPERTY/VALUE PAIRS FOR DETECTFACES.

| PROPERTY                  | VALUE    | DEFAULT     | DESCRIPTION                                                                               |
|---------------------------|----------|-------------|-------------------------------------------------------------------------------------------|
| detectadjfillets          | on   off | on          | Whether to detect cylindrical faces adjacent to<br>the detected planar faces.             |
| detectfacesplanar         | on   off | on          | Whether to detect planar faces.                                                           |
| facemaxangle              | double   | 40 degrees  | Maximum tolerated angle between neighboring<br>boundary elements in the same face.        |
| planarfacemaxangle        | double   | 0.6 degrees | Maximum tolerated angle between neighboring<br>boundary elements in the same planar face. |
| planarfaceminareafraction | double   | 0.005       | Minimum relative area for a planar face to be<br>created.                                 |

#### **SEE ALSO**

Import, Ball, Box, Cylinder, LogicalExpression

