# *BndLayerProp*

Set the boundary layer meshing properties.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"BndLayerProp");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).
      set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).create(*<ftag1>*,"BndLayerProp") to define boundary layer properties for the BndLayer feature *<ftag>*.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature(*<ftag1>*).selection() to specify the boundary or edge selection. If you do not specify the selection, it is empty.

The following properties are available:

TABLE 4-17: AVAILABLE PROPERTIES.

| PROPERTY   | VALUE                           | DEFAULT    | DESCRIPTION                                                                       |
|------------|---------------------------------|------------|-----------------------------------------------------------------------------------|
| blnlayers  | Integer                         | 8          | Number of boundary layers                                                         |
| blstretch  | Double                          | 1.2        | Boundary layer stretching factor                                                  |
| inittype   | blhminfact   blhmin  <br>blhtot | blhminfact | Specifies how the thickness of the boundary<br>layer mesh is calculated.          |
| blhminfact | Double                          | 1          | Factor used to adjust the default thickness.<br>Used when inittype is blhminfact. |

TABLE 4-17: AVAILABLE PROPERTIES.

| PROPERTY | VALUE  | DEFAULT | DESCRIPTION                                                                  |
|----------|--------|---------|------------------------------------------------------------------------------|
| blhmin   | Double |         | Thickness of first boundary layer. Used when<br>inittype is blhmin.          |
| blhtot   | Double |         | Total thickness of the boundary layer mesh.<br>Used when inittype is blhtot. |

The value of blnlayers is a positive integer scalar, or a string that evaluates to a positive integer.

The values of blhmin, blhminfact, blhtot, and blstretch are positive real scalars, or strings that evaluate to positive real scalars.

Use the properties blhmin, blstretch, and blnlayers to specify the distribution of the boundary layers. blhmin specifies the thickness of the initial boundary layer, blhtot specifies the total thickness of the boundary layer mesh, blstretch a stretching factor, and blnlayers the number of boundary layers. The thickness of the *m*th boundary layer (*m*=1 to blnlayers) is blstretch(*m*−1) blhmin*.* The number of boundary layers and the thickness of the boundary layers might be automatically reduced in thin regions.

The default values of blhmin and blhtot are determined from the specified element size in the sequence.

It is also possible to specify the thickness of the initial layer by using the blhminfact property. Use this property to specify a scaling factor that multiplies the thickness of the first boundary layer.

The property inittype determines which of blhminfact, blhmin, or blhtot that is used. You do not need to set it explicitly because the feature automatically changes it when you set one of blhminfact, blhmin, or blhtot.

## **SEE ALSO**

BndLayer, Scale, Size

## *Box*

Split geometric entities of an imported mesh by a box.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Box");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Box") to split geometric entities of an imported 2D or 3D mesh by an element set defined by a box.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify geometric entities to split. If you do not specify the selection, the feature operates on the entire geometry.

The following properties are available:

TABLE 4-18: AVAILABLE PROPERTIES.

| PROPERTY  | VALUE                    | DEFAULT     | DESCRIPTION                           |
|-----------|--------------------------|-------------|---------------------------------------|
| condition | allvertices   somevertex | allvertices | Condition for inclusion of an element |
| xmin      | double                   | -inf        | Minimum x-coordinate of box           |
| xmax      | double                   | inf         | Maximum x-coordinate of box           |
| ymin      | double                   | -inf        | Minimum y-coordinate of box           |
| ymax      | double                   | inf         | Maximum y-coordinate of box           |

TABLE 4-18: AVAILABLE PROPERTIES.

| PROPERTY   | VALUE    | DEFAULT | DESCRIPTION                                          |
|------------|----------|---------|------------------------------------------------------|
| zmin       | double   | -inf    | Minimum z-coordinate of box                          |
| zmax       | double   | inf     | Maximum z-coordinate of box                          |
| selinside  | on   off | off     | Create selection of all entities inside<br>the box.  |
| seloutside | on   off | off     | Create selection of all entities outside<br>the box. |

TABLE 4-19: AVAILABLE ADDITIONAL PROPERTIES WHEN SELINSIDE AND SELOUTSIDE ARE SET TO ON.

| PROPERTY           | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                            |
|--------------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| colorinside        | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either<br>given as an integer indicating a color in the<br>color theme, or as a custom color in the<br>customcolorinside property.  |
| coloroutside       | none   custom  <br>integer between 1 and<br>the number of colors<br>in the current theme | none                          | The color of the domain selection, either<br>given as an integer indicating a color in the<br>color theme, or as a custom color in the<br>customcoloroutside property. |
| customcolorinside  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when colorinside<br>is set to custom.                                                                                                         |
| customcoloroutside | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when<br>coloroutside is set to custom.                                                                                                        |
| selinsideshow      | all   dom   bnd   pnt  <br>off                                                           | dom                           | Show the selection on the specified entity<br>level in physics, materials, and so on. For<br>mesh parts, this option shows selection<br>outside the part.              |
| seloutsideshow     | all   dom   bnd   pnt  <br>off                                                           | dom                           | Show the selection on the specified entity<br>level in physics, materials, and so on. For<br>mesh parts, this option shows selection<br>outside the part.              |

Import, Ball, Cylinder, DetectFaces, LogicalExpression

## *CollapseEntities*

Collapse geometric entities of the mesh. The operation can collapse edges and boundaries smaller than a tolerance. If all boundaries around an unmeshed domain are collapsed, the domain will also be collapsed.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"CollapseEntities");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"CollapseEntities") to collapse entities in 3D mesh. Supported input: entire geometry, boundaries, and edges.

The following properties are available:

TABLE 4-20: AVAILABLE PROPERTIES.

| PROPERTY   | VALUE                      | DEFAULT | DESCRIPTION                                               |
|------------|----------------------------|---------|-----------------------------------------------------------|
| sizetype   | auto   relative   absolute | auto    | Specifies the type of maximum size.                       |
| maxabssize | double                     |         | Specifies the absolute size when sizetype is<br>absolute. |
| maxrelsize | double                     | 0.01    | Specifies the relative size when sizetype is<br>relative. |

#### **SEE ALSO**

MergeEntities, JoinEntities, DeleteEntities, Import

