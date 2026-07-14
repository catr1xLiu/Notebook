# Mesh Commands

The following list includes the available commands for creating and modifying meshes (listed in alphabetical order):

- **•** Adapt
- **•** AdjacentSelection
- **•** Ball
- **•** BndLayer
- **•** BndLayerProp
- **•** Box
- **•** CollapseEntities
- **•** Convert
- **•** CopyEdge
- **•** CopyFace
- **•** CopyDomain
- **•** Copy
- **•** CornerProp
- **•** CornerRefinement
- **•** CreateDomains
- **•** CreateEdges
- **•** CreateFaces
- **•** CreateVertices
- **•** Cylinder
- **•** DeleteEntities
- **•** DetectFaces
- **•** Distribution
- **•** Edge
- **•** EdgeGroup
- **•** EdgeMap
- **•** ExplicitSelection
- **•** FillHoles

- **•** FixedMesh
- **•** FreeQuad
- **•** FreeTet
- **•** FreeTri
- **•** IdenticalMesh
- **•** Import
- **•** Imprint
- **•** IntersectLine
- **•** IntersectPlane
- **•** JoinEntities
- **•** LogicalExpression
- **•** Map
- **•** MergeEntities
- **•** OnePointMap
- **•** Reference
- **•** Refine
- **•** RemeshDomains
- **•** RemeshEdges
- **•** RemeshFaces
- **•** Scale
- **•** Size
- **•** SizeExpression
- **•** Sweep
- **•** Transform
- **•** TwoPointMap
- **•** Union
- **•** Vertex

## *Adapt*

Set up an adaptive mesh refinement.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Adapt");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).importData();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Adapt") to set up a mesh adaptation based on some expressions and criteria. The adaptive mesh refinement feature is also available for imported meshing sequences.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify geometric entities to perform adaptive mesh refinement in. If you do not specify the selection, the feature operates on the entire geometry.

To use an anisotropic metric for the type of expression to base the adaptive mesh refinement on, use the following code for a 2D anisotropic expression in the local mesh size h:

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set("method", "modify");
model.component(<ctag>).mesh(<tag>).feature("ada1").set("exprtype", "metric");
model.component(<ctag>).mesh(<tag>).feature("ada1").
   set("metric", new String[][]{{"2/h", "0"}, {"0", "1/h"}});
```

You can use mesh.feature(*<ftag>*).importData() to rebuild the adapted mesh, taking an updated model into account.

The following properties are available.

TABLE 4-12: AVAILABLE PROPERTIES FOR ADAPT.

| PROPERTY        | VALUE                           | DEFAULT                                                                        | DESCRIPTION                                                                                                                                |
|-----------------|---------------------------------|--------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| adapsolnum      | Integer array (positive values) | 1                                                                              | Solution number indices, determining<br>which solutions in a parametric or<br>eigenvalue simulation to use for the<br>adaptation.          |
| allowcoarsening | on   off                        | on                                                                             | Controls if the mesh can be coarsened<br>by the general modification method<br>(that is, method set to modify).                            |
| elementspar     | Positive scalar                 | Empty                                                                          | Controls refinement if elselect =<br>elements.                                                                                             |
| elselect        | globalmin   worst  <br>elements | Empty                                                                          | Method to select elements to refine.                                                                                                       |
| errorexpr       | String                          | Empty                                                                          | Error expression.                                                                                                                          |
| exprtype        | size   error   metric           | error, if added in<br>a component and<br>a solution exists;<br>otherwise, size | Type of expression for the adaptive<br>mesh generation: an absolute size, an<br>error expression, or (2D and 3D) an<br>anisotropic metric. |
| facerep         | curved   linear                 | curved                                                                         | Specify face representation when<br>placing moved or new mesh vertices<br>for meshes that define their own<br>geometric models.            |
| globalminparam  | Positive scalar                 | Empty                                                                          | Controls refinement if elselect =<br>globalmin.                                                                                            |
| horder          | Double array                    | 0                                                                              | Error orders (see below).                                                                                                                  |
| maxcoarsening   | Positive integer                | 5                                                                              | The maximum coarsening factor (if<br>method is set to modify and<br>allowcoarsening is on).                                                |
| maxrefinement   | Positive integer                | 5                                                                              | The maximum number of mesh<br>refinements.                                                                                                 |

TABLE 4-12: AVAILABLE PROPERTIES FOR ADAPT.

| PROPERTY        | VALUE                                                 | DEFAULT                            | DESCRIPTION                                                                                                                                          |
|-----------------|-------------------------------------------------------|------------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------|
| method          | modify   regular   longest                            | longest                            | The refinement method for mesh<br>adaptation (general mesh modification,<br>regular refinement, or longest edge<br>refinement)                       |
| metric          | 2-by-2 (2D) or 3-by-3 (3D)<br>symmetric string matrix | {{"1/h",<br>"0"}, {"0",<br>"1/h"}} |                                                                                                                                                      |
| selection       | first   last   all   manual                           | last                               | Solution selection: the first or last<br>solution, a sum of the selection, or<br>manual, using weights and solution<br>number indices in adapsolnum. |
| sizeexpr        | String                                                | Empty                              | Mesh size expression.                                                                                                                                |
| solution        | String                                                | Empty                              | The tag of the solution defining the<br>mesh adaptation, or none to evaluate<br>on the input mesh.                                                   |
| updatecondition | A parameter name                                      | Empty                              | Name of a parameter used to trigger<br>an update.                                                                                                    |
| weights         | Double array (positive values)                        | 1.0                                | Weight for each selected solution.                                                                                                                   |
| worstpar        | Positive scalar                                       | Empty                              | Controls refinement if elselect =<br>worst.                                                                                                          |

The facerep property is only used for meshes that define their own geometric model. For example, when having an imported mesh. Use curved to place new or moved mesh vertices on a curved surface approximation of the input mesh. Use linear to place new or moved mesh vertices on the input mesh.

### **SEE ALSO**

Refine, SizeExpression

## *AdjacentSelection*

Define a selection of entities that are adjacent to a specified selection.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"AdjacentSelection");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Supported for meshes that define their own geometric model, such as imported meshes. For more information, see Geometric Model.

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"AdjacentSelection") to create a named selection for one or more entities.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection() to specify the input entities for the selection. For information about specifying a named selection as input, see Selections.

The following properties are available:

TABLE 4-13: AVAILABLE PROPERTIES FOR ADJACENTSELECTION.

| PROPERTY     | VALUE                                                                                 | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| angletol     | double                                                                                | 15                            | Angle tolerance for continuity evaluation. Used<br>when groupcontang is on.                                                                           |
| color        | none   custom   integer<br>between 1 and the number of<br>colors in the current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor property. |
| customcolor  | RGB-triplet                                                                           | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                              |
| groupcontang | on   off                                                                              | off                           | Specify to group faces (in 3D) or edges by<br>continuous tangent.                                                                                     |
| exterior     | on   off                                                                              | on                            | Include output entities that are exterior to the<br>union of the input selections.                                                                    |
| interior     | on   off                                                                              | off                           | Include output entities that are interior to the<br>union of the input selections.                                                                    |
| outputdim    | 0   1   2   3                                                                         | space<br>dimension - 1        | Dimension of entities in the output selection.                                                                                                        |
| selshow      | on   off                                                                              | on                            | Show selection in physics, materials, and so on.<br>For mesh parts, this option shows selection<br>outside the part.                                  |

#### **SEE ALSO**

ExplicitSelection

