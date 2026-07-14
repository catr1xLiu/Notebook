# *WorkPlane*

Create a work plane in 3D for drawing 2D objects that can be extruded, revolved, or embedded.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"WorkPlane");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom().geomSequenceMethod
model.component(<ctag>).geom(<tag>).feature(<ftag>).geom().feature();
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

## **DESCRIPTION**

A work plane embeds 2D objects in 3D. The sections below describe how to define the location of the work plane and how to create 2D objects in it. You can also use a work plane in the CrossSection and Partition features. In that case, you do not need to draw anything in the work plane.

## *Unite Objects*

There is an option to unite all objects in the work plane before using the 2D geometry in 3D. Uniting all objects can improve the handling of the 2D geometry when extruding it, for example. You can control the union of 2D objects using the following properties:

TABLE 3-179: VALID PROPERTIES, UNITE OBJECTS.

| PROPERTY      | VALUE                         | DEFAULT   | DESCRIPTION                                                     |
|---------------|-------------------------------|-----------|-----------------------------------------------------------------|
| absrepairtol  | double                        | See below | Absolute repair tolerance.                                      |
| repairtol     | double                        | See below | Relative repair tolerance, relative to size of union of inputs. |
| repairtoltype | auto   relative  <br>absolute | See below | Repair tolerance type: automatic, relative, or absolute.        |
| unite         | on   off                      | off       | Unite objects.                                                  |

The tolerance settings are active when unite is set to on. The default values for the repair tolerance is taken from the geometry sequence's default repair tolerance.

## *Visualization*

To control the in-plane visualization of the 3D geometry, the visualization of the local coordinate system, and to activate the ability to draw directly on the work plane in 3D, use the following properties:

TABLE 3-180: VALID PROPERTIES, VISUALIZATION.

| PROPERTY         | VALUE   | DEFAULT | DESCRIPTION                       |
|------------------|---------|---------|-----------------------------------|
| showcoincident   | boolean | true    | Show coincident 3D geometry.      |
| showintersection | boolean | true    | Show intersection of 3D geometry. |
| showcoordsys     | boolean | true    | Show local coordinate system.     |
| showprojection   | boolean | true    | Show projection of 3D geometry.   |
| workplane3d      | boolean | true    | Draw on work plane in 3D.         |

## *Defining the Location of the Work Plane*

A work plane has a local coordinate system that is orthonormal and positively oriented (right-handed). The work plane coincides with the *xy*-plane in the local coordinate system. The following properties control how the work plane is defined.

TABLE 3-181: VALID PROPERTIES, LOCATION.

| PROPERTY     | VALUE                                                                                                                             | DEFAULT | DESCRIPTION                                   |
|--------------|-----------------------------------------------------------------------------------------------------------------------------------|---------|-----------------------------------------------|
| planetype    | quick   faceparallel  <br>edgeparallel   edgeangle  <br>circleperpendicular  <br>normal   vertices  <br>coordinates   transformed | quick   | Type of data defining the work plane.         |
| contributeto | String                                                                                                                            | none    | Tag of cumulative selection to contribute to. |

For information about the selresult and contributeto properties, see Selections of Geometric Entities. Note that in a work plane's Plane Geometry, the selresultshow and selindividualshow properties are not available.

Depending on planetype, additional properties are available.

## *Quick*

This creates a work plane parallel to one of the global coordinate planes.

TABLE 3-182: VALID PROPERTIES, QUICK.

| PROPERTY        | VALUE                          | DEFAULT  | DESCRIPTION                                                |
|-----------------|--------------------------------|----------|------------------------------------------------------------|
| quickplane      | xy   yz   zx   yx  <br>zy   xz | xy       | Coordinate plane.                                          |
| quickx          | double                         | 0        | x-coordinate for work plane (used when plane is yz or zy). |
| quicky          | double                         | 0        | y-coordinate for work plane (used when plane is xz or zx). |
| quickz          | double                         | 0        | z-coordinate for work plane (used when plane is xy or yx). |
| quickoffsettype | distance  <br>vertex           | distance | Type of offset specification.                              |
| offsetvertex    | Selection                      |          | Vertex for offset.                                         |
| quickorigin     | global  <br>vertexproj         | global   | Origin of local coordinate system.                         |
| originvertex    | Selection                      |          | Vertex for origin.                                         |
| quickaxis       | natural  <br>vertexproj        | natural  | Local x-axis.                                              |
| axisvertex      | Selection                      |          | Vertex for axis.                                           |
| displ           | double[2]                      | {0,0}    | Displacement of local coordinate system.                   |
| rot             | double                         | 0        | Rotation angle of local coordinate system.                 |

## *Face Parallel*

This creates a work plane that is parallel to a planar face in a geometry object

TABLE 3-183: VALID PROPERTIES, FACE PARALLEL.

| PROPERTY             | VALUE                                  | DEFAULT    | DESCRIPTION                                            |
|----------------------|----------------------------------------|------------|--------------------------------------------------------|
| face                 | Selection                              |            | Planar face.                                           |
| offset               | double                                 | 0          | Signed offset in the direction of the local<br>z-axis. |
| reverse              | on   off                               | off        | Reverse direction of local z-axis.                     |
| offsettype           | distance   vertex                      | distance   | Type of offset specification.                          |
| offsetvertex         | Selection                              |            | Vertex for offset.                                     |
| origin               | facecenter   boxcorner  <br>vertexproj | facecenter | Origin of local coordinate system.                     |
| originvertex         | Selection                              |            | Vertex for origin.                                     |
| faceparallel<br>axis | s1   s2   vertexproj                   | s1         | Local x-axis.                                          |
| axisvertex           | Selection                              |            | Vertex for axis.                                       |
| displ                | double[2]                              | {0,0}      | Displacement of local coordinate system.               |
| rot                  | double                                 | 0          | Rotation angle of local coordinate system.             |

## *Edge Parallel*

This creates a work plane that is parallel to a planar edge in a geometry object.

TABLE 3-184: VALID PROPERTIES, FACE PARALLEL.

| PROPERTY               | VALUE                                   | DEFAULT     | DESCRIPTION                                         |
|------------------------|-----------------------------------------|-------------|-----------------------------------------------------|
| edge                   | Selection                               |             | Planar edge.                                        |
| offset                 | double                                  | 0           | Signed offset in the direction of the local z-axis. |
| origin                 | edgecenter   boxcorner                  | edgecenter  | Origin of local coordinate system.                  |
| reverse                | on   off                                | off         | Reverse direction of local z-axis.                  |
| offsettype             | distance   vertex                       | distance    | Type of offset specification.                       |
| offsetvertex           | Selection                               |             | Vertex for offset.                                  |
| edgeparallel<br>origin | startvertex   endvertex  <br>vertexproj | startvertex | Origin of local coordinate system.                  |
| originvertex           | Selection                               |             | Vertex for origin.                                  |
| edgeparallel<br>axis   | tangent   vertexproj                    | tangent     | Local x-axis.                                       |
| axisvertex             | Selection                               |             | Vertex for axis.                                    |
| displ                  | double[2]                               | {0,0}       | Displacement of local coordinate system.            |
| rot                    | double                                  | 0           | Rotation angle of local coordinate system.          |

## *Edge Angle*

This creates a work plane through a straight edge of a geometry object. The work plane makes a given angle with the tangent plane of a face in the same geometry object. The face must be adjacent to the edge, and its tangent plane must be the same at all points on the edge. The origin of the local coordinate system coincides with the start vertex (if reverse is off) or end vertex (if reverse is on) of the edge. The direction of the local *x*-axis coincides with the direction of the edge (if reverse is off) or its opposite (if reverse is on). If the property angle is zero, the direction of the local *y*-axis points into the face. In general, the local coordinate system is rotated by angle about the local *x*-axis.

TABLE 3-185: VALID PROPERTIES, EDGE ANGLE.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                                |  |
|----------|-----------|---------|--------------------------------------------|--|
| angle    | double    | 0       | Angle between face and work plane.         |  |
| edge     | Selection |         | Straight edge.                             |  |
| adjface  | Selection |         | Face adjacent to edge in the same object.  |  |
| reverse  | on   off  | off     | Reverse direction of local x-axis.         |  |
| displ    | double[2] | {0,0}   | Displacement of local coordinate system.   |  |
| rot      | double    | 0       | Rotation angle of local coordinate system. |  |

## *Circle Perpendicular*

This creates a work plane that is perpendicular to a given circular edge. The origin of the local coordinate system is at the circle's center. By default, the local *x*-axis goes through the edge's start vertex. Thus, if the geometry is rotationally symmetric, the symmetry axis coincides with the local *y*-axis.

TABLE 3-186: VALID PROPERTIES, CIRCLE PERPENDICULAR.

| PROPERTY   | VALUE                                    | DEFAULT     | DESCRIPTION                                |
|------------|------------------------------------------|-------------|--------------------------------------------|
| circedge   | Selection                                | empty       | Circular edge.                             |
| circpoint  | startvertex   endvertex  <br>othervertex | startvertex | Point on plane.                            |
| circvertex | Selection                                |             | Vertex on plane.                           |
| circoffset | double                                   | 0           | Offset angle.                              |
| reverse    | on   off                                 | off         | Reverse direction of local x-axis.         |
| displ      | double[2]                                | {0,0}       | Displacement of local coordinate system.   |
| rot        | double                                   | 0           | Rotation angle of local coordinate system. |

