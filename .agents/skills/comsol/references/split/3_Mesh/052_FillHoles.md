# *FillHoles*

Repair an imported surface mesh that might have minor holes by filling those holes.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"FillHoles");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"FillHoles") to fill small holes on surfaces (boundaries) of an imported mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the faces for which the holes are filled. If you do not specify the selection, it is left empty.

The following properties are available:

TABLE 4-51: AVAILABLE PROPERTIES FOR FILLHOLES.

| PROPERTY       | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|----------------|------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| colordom       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| createdom      | on   off                                                                                 | off                           | Specify if to create domains for each (connected)<br>finite void region.                                                                              |
| customcolordom | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colordom is set to<br>custom.                                                                                           |
| fillholestol   | auto   manual                                                                            | auto                          | Use an automatic or manual tolerance for the<br>maximum perimeter of a hole to be filled.                                                             |
| join           | on   off                                                                                 | on                            | Join with filled holes.                                                                                                                               |
| perimeter      | double scalar                                                                            | 0.01                          | The maximum perimeter of a hole to be filled when<br>fillholestol is set to manual.                                                                   |
| seldom         | on   off                                                                                 | on                            | Specifies if to create a selection of resulting domains.                                                                                              |
| seldomshow     | on   off                                                                                 | on                            | Show domain selection in physics, materials, and so<br>on. For mesh parts, this option shows selection<br>outside the part. Used if seldom is on.     |

#### **SEE ALSO**

Import, CreateFaces

