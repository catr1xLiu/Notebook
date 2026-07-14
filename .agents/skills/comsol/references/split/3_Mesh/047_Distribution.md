# *Distribution*

Mesh attribute to specify an element distribution along an edge (3D), a boundary (2D), or along the direction to sweep a mesh in a domain (3D).

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Distribution");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"Distribution");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).
      set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Distribution") to specify element distribution properties in the sequence. Use

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"Distribution") to specify element distribution properties for the feature *<ftag>* that can be any of the types Edge, FreeQuad, FreeTri, FreeTet, Map, or Sweep.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() or model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature(*<ftag1>*).selection() to specify the edge (3D), boundary (2D), or domain selection (1D and 3D).

You can specify a mesh element distribution in three different ways: by specifying the number of elements only, by specifying the number of elements together with properties determining the distribution of the elements, or by specifying the element distribution explicitly. The property type determines which of the three alternatives you want to use. However, you need not set type manually since it is automatically updated when you set a property from one of the three groups below.

TABLE 4-43: AVAILABLE PROPERTIES.

| PROPERTY | VALUE                                | DEFAULT | DESCRIPTION                                                                                                                                 |
|----------|--------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------|
| type     | number  <br>explicit  <br>predefined | number  | Specifies the distribution method: fixed number of elements,<br>explicit, user-defined element distribution, or predefined<br>distribution. |

The following group of properties are available:

TABLE 4-44: AVAILABLE PROPERTIES WHEN TYPE IS NUMBER.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                                                                           |
|-------------|----------|---------|---------------------------------------------------------------------------------------|
| numelem     | integer  | 5       | Number of elements.                                                                   |
| equidistant | on   off | off     | Specifies if to create an equidistant mesh along edges in 3D and<br>boundaries in 2D. |

Use the property numelem to specify the number of elements, but let the algorithm determine a suitable distribution, taking geometry and surrounding mesh into account.

TABLE 4-45: AVAILABLE PROPERTIES WHEN TYPE IS EXPLICIT.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                                  |
|----------|----------|---------|--------------------------------------------------------------|
| explicit | double[] | {0, 1}  | Specifies the relative placement of vertices along the edge. |
| reverse  | on   off | off     | Reverse the direction of the explicit distribution.          |

Use the explicit property to specify an explicit element distribution. The value of this property is an array with increasing values starting at 0.

TABLE 4-46: AVAILABLE PROPERTIES WHEN TYPE IS PREDEFINED.

| PROPERTY  | VALUE                     | DEFAULT    | DESCRIPTION                                                                                                                 |
|-----------|---------------------------|------------|-----------------------------------------------------------------------------------------------------------------------------|
| elemcount | integer                   | 5          | Number of elements.                                                                                                         |
| elemratio | double                    | 1          | Specifies the ratio in size between the last element and first<br>element along the edge.                                   |
| method    | arithmetic  <br>geometric | arithmetic | Specifies if the element size is linearly growing (arithmetic<br>sequence) or exponentially growing (geometric sequence).   |
| reverse   | on   off                  | off        | Specifies if the distribution is defined in the opposite edge<br>direction for the edge in the selection with lowest index. |
| symmetric | on   off                  | off        | Specifies if the distribution is made symmetric.                                                                            |

When the type is predefined, the distribution as calculated from the parameters given above.

This Distribution feature can be assigned to edges in 2D and 3D, or domains in 1D and 3D. The FreeTet, FreeTri, FreeQuad, Edge, and Map features use this property when defined on edges, the Sweep feature uses this property defined on domains.

#### **SEE ALSO**

Scale, Size

