# *LineSegment*

Create line segments in 2D and 3D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"LineSegment");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"LineSegment") to create a line segment. The following properties are available:

TABLE 3-105: VALID PROPERTY/VALUE PAIRS FOR LINESEGMENT.

| PROPERTY     | VALUE                                                                                                   | DEFAULT                       | DESCRIPTION                                                                                                                                                                                                   |  |
|--------------|---------------------------------------------------------------------------------------------------------|-------------------------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| color        | none  <br>custom  <br>integer<br>between 1<br>and the<br>number of<br>colors in the<br>current<br>theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom color<br>in the customcolor property. Coloring is only available<br>when selresult in active. |  |
| contributeto | String                                                                                                  | none                          | Tag of cumulative selection to contribute to.                                                                                                                                                                 |  |
| coord1       | double[]                                                                                                | zero vector                   | Coordinates for starting point (with specify1 set to<br>coord).                                                                                                                                               |  |
| coord2       | double[]                                                                                                | zero vector                   | Coordinates for endpoint (with specify2 set to coord).                                                                                                                                                        |  |
| customcolor  | RGB-triplet                                                                                             | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                                                                         |  |
| p2           | Selection                                                                                               | 1                             | Endpoint (with specify2 set to vertex).                                                                                                                                                                       |  |
| selresult    | on   off                                                                                                | off                           | Create selections of all resulting objects.                                                                                                                                                                   |  |

TABLE 3-105: VALID PROPERTY/VALUE PAIRS FOR LINESEGMENT.

| PROPERTY      | VALUE                              | DEFAULT | DESCRIPTION                                                                                                                                                                                                                     |  |
|---------------|------------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| selresultshow | all   obj  <br>dom   bnd  <br>off  | dom     | Show selections, if selresult is on, of resulting objects<br>in physics, materials, and so on, or in part instances. obj is<br>not available in a component's geometry. dom, bnd, and<br>edg are not available in all features. |  |
| specify1      | vertex  <br>coord                  | vertex  | Type of starting point specification.                                                                                                                                                                                           |  |
| specify2      | vertex  <br>coord                  | vertex  | Type of endpoint specification.                                                                                                                                                                                                 |  |
| vertex1       | Selection                          | 0       | Starting point (with specify1 set to vertex).                                                                                                                                                                                   |  |
| workplanesrc  | this  <br>part-instance<br>feature | this    | Part-instance feature to take the work plane from (in 3D<br>and for coordinates only).                                                                                                                                          |  |
| workplane     | xyplane  <br>work-plane<br>feature | xyplane | Work-plane feature that defines the coordinate system (in<br>3D and for coordinates only). The default, xyplane, is the<br>global Cartesian coordinate system.                                                                  |  |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

Additional properties are available with the Design Module, see LineSegment.

The following attributes are available:

TABLE 3-106: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT                                                | DESCRIPTION |
|--------------|----------|--------------------------------------------------------|-------------|
| construction | on   off | off<br>Designate the resulting objects as construction |             |
|              |          |                                                        | geometry.   |

