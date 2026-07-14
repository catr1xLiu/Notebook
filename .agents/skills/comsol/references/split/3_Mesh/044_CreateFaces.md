# *CreateFaces*

Create additional faces in a 3D mesh that defines its own geometric model. For more information, see Geometric Model.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"CreateFaces");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CreateFaces") to create additional faces by selecting bounding edges. Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the bounding edges. If you do not specify the selection, it is left empty.

The following property is available:

TABLE 4-36: AVAILABLE PROPERTY FOR CREATEFACES.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                                                              |
|-------------|----------|---------|--------------------------------------------------------------------------|
| createdom   | on   off | off     | Specify if to create domains for each (connected)<br>finite void region. |
| groupadjedg | on   off | on      | Group adjacent edges.                                                    |
| seldom      | on   off | on      | Specifies if to create a selection of resulting<br>domains.              |
| selfac      | on   off | on      | Specifies if to create a selection of resulting faces.                   |

TABLE 4-37: AVAILABLE ADDITIONAL PROPERTIES WHEN SELDOM AND SELFAC ARE SET TO ON.

| PROPERTY       | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                     |
|----------------|------------------------------------------------------------------------------------------|-------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colordom       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either given as an<br>integer indicating a color in the color theme, or as a<br>custom color in the customcolordom property. |
| colorfac       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the face selection, either given as an<br>integer indicating a color in the color theme, or as a<br>custom color in the customcolorfac property.   |
| customcolordom | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colordom is set to<br>custom.                                                                                                     |
| customcolorfac | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colordom is set to<br>custom.                                                                                                     |
| seldomshow     | on   off                                                                                 | on                            | Show domain selection in physics, materials, and so<br>on. For mesh parts, this option shows selection<br>outside the part. Used if seldom is on.               |
| selfacshow     | on   off                                                                                 | on                            | Show face selection in physics, materials, and so on.<br>For mesh parts, this option shows selection outside<br>the part. Used if selfac is on.                 |

Import, CreateDomains, CreateEdges, CreateVertices, FillHoles

