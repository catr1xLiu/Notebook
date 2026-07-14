# *CreateDomains*

Create a domain for each (connected) finite void region that is defined by a 3D mesh that defines its own geometric model, such as an imported mesh. For more information, see Geometric Model.

## **SYNTAX**

model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CreateDomains");

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CreateDomains") to creates a domain for each (connected) finite void region that is defined by an imported 3D mesh. There are no additional selections or properties for the CreateDomains operation.

TABLE 4-28: VALID PROPERTIES

| PROPERTY       | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                              |
|----------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colordom       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either given as an<br>integer indicating a color in the color theme, or as a<br>custom color in the customcolordom property.<br>Used if seldom is on. |
| customcolordom | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colordom is set to<br>custom.                                                                                                                              |
| seldom         | on   off                                                                                 | on                            | Specifies if to create a selection of resulting<br>domains.                                                                                                                              |
| seldomshow     | on   off                                                                                 | on                            | Show domain selection in physics, materials, and so<br>on. For mesh parts, this option shows selection<br>outside the part. Used if seldom is on.                                        |

Import, CreateEdges, CreateFaces, CreateVertices

## *CreateEdges*

Create geometrical edges of a selection of mesh edges or between two vertices.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"CreateEdges");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CreateEdges") to create additional edges in a mesh that defines its own geometric model. For more information, see Geometric Model.

Choose between creating new meshed edges between vertices or converting existing mesh edges into edge elements. In the general case, converting mesh edges is most easily done by clicking in the Graphics window, as the midpoint coordinates must be exact.

When specifying start/end vertices, specify the size distribution in four different ways: by specifying the number of elements only, by specifying the maximum element size, by specifying the element distribution explicitly, or by specifying the number of elements together with properties determining the distribution of the elements. The property type determines which of the four alternatives you want to use.

The following properties are available:

TABLE 4-29: AVAILABLE PROPERTIES FOR CREATEEDGES.

| PROPERTY     | VALUE                                    | DEFAULT  | DESCRIPTION                                                                                                                             |
|--------------|------------------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------|
| edgespec     | vertices   meshedge                      | vertices | Specifies how to create edges. Either give<br>selections of start/end vertices, or give exact<br>coordinates of a mesh edge's midpoint. |
| start        | Selection                                |          | Starting vertices to create edges from when<br>edgespec is vertices.                                                                    |
| end          | Selection                                |          | End vertices to create edges to when<br>edgespec is vertices.                                                                           |
| type         | size   number  <br>explicit   predefined | size     | Size distribution type when edgespec is<br>vertices.                                                                                    |
| coordsel     | double[][]                               | {}       | Enter exact midpoint coordinates of mesh<br>edge when edgespec is meshedges.                                                            |
| groupcontang | on   off                                 | off      | Specifies if a selection of a mesh edge is<br>propagated to tangent edges. Used if<br>edgespec is meshedge.                             |
| angletol     | double                                   | 10       | Specifies which mesh edges are considered<br>tangent when groupcontang is on.                                                           |
| seldom       | on   off                                 | off      | Specifies if to create a selection of resulting<br>small domains. Used in 2D.                                                           |
| seledg       | on   off                                 | off      | Specifies if to create a selection of resulting<br>edges.                                                                               |
| selfac       | on   off                                 | off      | Specifies if to create a selection of resulting<br>small faces. Used in 3D.                                                             |

TABLE 4-30: AVAILABLE ADDITIONAL PROPERTY WHEN TYPE IS SET TO SIZE.

| PROPERTY | VALUE  | DEFAULT                                                         | DESCRIPTION           |
|----------|--------|-----------------------------------------------------------------|-----------------------|
| size     | double | 0.1*(size of bounding box) (3D); (size of bounding box)/15 (2D) | Maximum element size. |

TABLE 4-31: AVAILABLE ADDITIONAL PROPERTY WHEN TYPE IS NUMBER.

| PROPERTY | VALUE   | DEFAULT | DESCRIPTION         |
|----------|---------|---------|---------------------|
| numelem  | integer | 1       | Number of elements. |

TABLE 4-32: AVAILABLE ADDITIONAL PROPERTIES WHEN TYPE IS EXPLICIT.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                                |
|----------|----------|---------|------------------------------------------------------------|
| explicit | double[] | {0,1}   | Specify the relative placement of vertices along the edge. |
| reverse  | on   off | on      | Reverse the direction of the explicit distribution.        |

TABLE 4-33: AVAILABLE ADDITIONAL PROPERTIES WHEN TYPE IS PREDEFINED.

| PROPERTY  | VALUE                     | DEFAULT    | DESCRIPTION                                                                                                               |
|-----------|---------------------------|------------|---------------------------------------------------------------------------------------------------------------------------|
| elemcount | integer                   | 5          | Number of elements.                                                                                                       |
| elemratio | double                    | 1          | Specify the ratio in size between the last element and first<br>element along the edge.                                   |
| method    | arithmetic  <br>geometric | arithmetic | Specifies if the element size is linearly growing (arithmetic<br>sequence) or exponentially growing (geometric sequence). |
| reverse   | on   off                  | off        | Specify if the distribution is defined in the opposite edge<br>direction for the edge in the selection with lowest index. |
| symmetric | on   off                  | off        | Specify if the distribution is made symmetric.                                                                            |

TABLE 4-34: AVAILABLE ADDITIONAL PROPERTY WHEN SELEDG IS SET TO ON.

| PROPERTY   | VALUE    | DEFAULT | DESCRIPTION                                                                                                                                     |
|------------|----------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------|
| seledgshow | on   off | on      | Show edge selection in physics, materials, and so on.<br>For mesh parts, this option shows selection outside<br>the part. Used if seledg is on. |

TABLE 4-35: AVAILABLE ADDITIONAL PROPERTIES WHEN SELFAC AND SELDOM ARE SET TO ON.

| PROPERTY         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                                                     |
|------------------|------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colorcompl       | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the entity selection, either given<br>as an integer indicating a color in the color<br>theme, or as a custom color in the<br>customcolorcompl property. Used if<br>selcompl is on. |
| colorfac         | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the entity selection, either given<br>as an integer indicating a color in the color<br>theme, or as a custom color in the<br>customcolorfac property. Used if selfac<br>is on.     |
| customcolorcompl | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorcompl is<br>set to custom.                                                                                                                                   |
| customcolorfac   | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorfac is<br>set to custom.                                                                                                                                     |
| selareafraction  | double                                                                                   | 0.1                           | Maximum area of a small face (3D) or domain<br>(2D) as a fraction of the total area of the input<br>faces. Used when selfac or seldom,<br>respectively, is on.                                  |
| selcompl         | on   off                                                                                 | off                           | Specifies if to create a complement selection<br>of resulting faces (3D) or domains (2D) when<br>selfac or seldom, respectively, is on.                                                         |

TABLE 4-35: AVAILABLE ADDITIONAL PROPERTIES WHEN SELFAC AND SELDOM ARE SET TO ON.

| PROPERTY     | VALUE    | DEFAULT | DESCRIPTION                                                                                                                                            |
|--------------|----------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------|
| selcomplshow | on   off | on      | Show entity selection in physics, materials, and<br>so on. For mesh parts, this option shows<br>selection outside the part. Used if selcompl<br>is on. |
| seldomshow   | on   off | on      | Show domain selection in physics, materials,<br>and so on. For mesh parts, this option shows<br>selection outside the part. Used if seldom is<br>on.   |
| selfac       | on   off | off     | Specifies if to create a selection of resulting<br>small faces. Used in 3D.                                                                            |
| selfacshow   | on   off | on      | Show face selection in physics, materials, and<br>so on. For mesh parts, this option shows<br>selection outside the part. Used if selfac is<br>on.     |

CreateDomains, CreateFaces, CreateVertices

