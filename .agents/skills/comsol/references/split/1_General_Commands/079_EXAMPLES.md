# **EXAMPLES**

*Code for Use with Java*

Create a dataset and set it to point to the tagged solution sol1 from a solver sequence:

```
model.result().dataset().create("dset", "Solution");
  model.result().dataset("dset").set("solution", "Sol1");
Code for Use with MATLAB
  model.result.dataset.create('dset', 'Solution');
  model.result.dataset('dset').set('solution', 'Sol1');
Create a 3D plot group containing a streamline plot and a plane with a contour plot on:
Code for Use with Java
  result().create("pg1",3);
  result("pg1").set("data","dset");
  result("pg1").create("stream","Streamline");
  model.result("pg1").feature("stream").set("expr", new String[]{"2-x", "0", "z"});
  model.result("pg1").feature("stream").selection().set(new int[]{2});
  result().dataset().create("cutp1","CutPlane");
  result("pg1").create("cont1","Contour");
  result("pg1").feature("cont1").set("data","cutp1");
  result("pg1").run();
Code for Use with MATLAB
  result.create('pg1',3);
```

```
result('pg1').set('data','dset');
  result('pg1').create('stream','Streamline');
  model.result('pg1').feature('stream').set('expr', {'2-x', '0', 'z'});
  model.result('pg1').feature('stream').selection.set(2);
  result.dataset.create('cutp1','CutPlane');
  result('pg1').create('cont1','Contour');
  result('pg1').feature('cont1').set('data','cutp1');
  result('pg1').run;
model.savePoint()
```

Manage selections and hide features used by result features.

#### **SYNTAX**

```
model.savePoint(<tag>).geom(<gtag>)
model.savePoint(<tag>).geom(<gtag>).selection(<stag>)
model.savePoint(<tag>).geom(<gtag>).view(<vtag>)
```

#### **DESCRIPTION**

model.savePoint(*<tag>*) is a container of selections and hide features used by result features. When solving, a copy of the model is made — a save point model — which is used in results and analysis. The selections and hide features contained in model.savePoint(*<tag>*) refer to the geometry in this copy.

Editing the data in model.savePoint(*<tag>*) can only be done in the following circumstances.

- **•** The geometry on which the analysis is done has been modified after solving. In this case the selections and hide feature can be edited but not created or removed.
- **•** The geometry on which the analysis is done has been removed. In this case the selections and hide features can be both edited, created, and deleted.

In all other circumstances, edit the selections in model.component(*<ctag>*).selection(), and the hide features in model.component(*<ctag>*).view(). Changes there are synchronized with the data in model.savePoint().

model.savePoint(*<tag>*).geom(*<gtag>*) returns a container with selections and views with hide features for a geometry in the save point model.

```
model.savePoint(<tag>).geom(<gtag>).selection(<stag>) returns a selection.
```

```
model.savePoint(<tag>).geom(<gtag>).view(<vtag>) returns a view. Contrary to the views in 
model.component(<ctag>).view(), only the hide features in view.hideEntities() can be edited.
```

## **SEE ALSO**

```
model.selection(), model.weak()
model.selection()
```

Named selections.

#### **SYNTAX**

```
model.selection().create(<tag>);
model.selection().create(<tag>,<type>);
model.selection(<tag>).model(<mtag>);
model.selection(<tag>).set(property,<value>);
model.selection(<tag>).geom(<gtag>,dim);
model.selection(<tag>).geom(<gtag>,highdim,lowdim,typelist);
model.selection(<tag>).geom(dim);
model.selection(<tag>).all();
model.selection(<tag>).set(<entlist>);
model.selection(<tag>).add(<entlist>);
model.selection(<tag>).remove(<entlist>);
model.selection(<tag>).clear();
model.selection(<tag>).inherit(bool);
model.selection(<tag>).model();
model.selection(<tag>).isGeom();
model.selection(<tag>).geom();
model.selection(<tag>).dimension();
model.selection(<tag>).dim();
model.selection(<tag>).entities(dim);
model.selection(<tag>).entities();
model.selection(<tag>).interiorEntities(dim);
model.selection(<tag>).isInheriting();
model.selection(<tag>).inputDimension();
model.selection(<tag>).inputEntities();
model.selection(<tag>).image();
```

#### **DESCRIPTION**

model.component(*<ctag>*).selection(*<tag>*) returns a named selection. Anywhere where you define a selection, you can point to a named selection by using its tag, for example, *selection*.named(<tag>.

model.component(*<ctag>*).selection().create(*<tag>*) creates a named selection of type Explicit.

model.component(*<ctag>*).selection().create(*<tag>,<type>*) creates a named selection of type *<type>*. The following types are available: "Explicit", "Union", "Intersection", "Difference", "Complement", "Adjacent", "Ball", "Box", "Cylinder", "Disk", and "LogicalExpression".

model.selection(*<tag>*).model(*<mtag>*) sets the model component node of the selection.

model.selection(*<tag>*).model() returns the model component node tag of the selection.

model.component(*<ctag>*).selection(*<tag>*).set(*property*,*<value>*) sets a property value for the selection. Which properties are available for the different selection types are listed on the following pages. All other assignment methods are only supported by the Explicit selection type.

Use the model.selection(<tag>).image() methods for plotting and exporting selection images. See Plotting and Exporting Images.

All other methods are explained in the section Selections.

Other entities can use any of the selections in model.component(*<ctag>*).selection() when defining its selection. For example, create a selection sel1:

```
model.component("comp1").selection().create("sel1");
```

Then, for example, a variable entities can use this selection:

```
model.component("comp1").variable().create("var1");
model.component("comp1").variable("var1").model("mod1");
model.component("comp1").variable("var1").selection().named("sel1");
```

What properties are available depends on the type of selection. The following selection types are available:

*Explicit* Selection defined by an explicit set of geometric entities such as domains or boundaries.

TABLE 2-123: EXPLICIT SELECTION PROPERTIES.

| NAME         | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| angletol     | double                                                                                      | 5                             | Angle tolerance for continuity evaluation.                                                                                                            |
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| groupcontang | on   off                                                                                    | off                           | Continuous tangent mode.                                                                                                                              |

When groupcontang is set to on, the set, add, and remove methods operate on groups of adjacent entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

*Ball*

Selection of entities that are inside or intersect a ball.

TABLE 2-124: BALL SELECTION PROPERTIES.

| NAME         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| entitydim    | 0   1   2   3                                                                            | sdim                          | Dimension of entities to select.                                                                                                                      |
| angletol     | double                                                                                   | 5                             | Angle tolerance for continuity evaluation.                                                                                                            |
| color        | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property. |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                              |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode.                                                                                                                              |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode.                                                                                                                              |
| inputent     | all   selections                                                                         | all                           | Use all entities or entities defined by input<br>property.                                                                                            |
| input        | String[]                                                                                 | {}                            | Input selections.                                                                                                                                     |
| condition    | intersects   inside  <br>somevertex  <br>allvertices                                     | intersects                    | Condition for inclusion of an entity.                                                                                                                 |
| posx         | double                                                                                   | 0                             | Center of ball, first coordinate.                                                                                                                     |
| posy         | double                                                                                   | 0                             | Center of ball, second coordinate.                                                                                                                    |
| posz         | double                                                                                   | 0                             | Center of ball, third coordinate.                                                                                                                     |
| r            | double                                                                                   | 0                             | Radius.                                                                                                                                               |

The posx, posy, and posz properties define the center of the ball, and r defines the radius. These properties take their units from the corresponding geometry sequence.

When condition is intersects, all entities that intersect the ball are included in the selection. The rendering mesh is used for the calculation. You can set the accuracy of the rendering mesh using

ModelUtil.setPreference("graphics.rendering.detail",*<detail>*);

where *<detail>* is coarse, normal, fine, or wireframe.

When condition is inside, all entities that are completely inside the ball are included in the selection. The rendering mesh is used for the calculation.

When condition is somevertex, all entities that have at least one adjacent vertex inside the ball are included in the selection.

When condition is allvertices, all entities that have all adjacent vertices inside the ball are included in the selection.

When inputent is selections, the selection is restricted to the entities in the selections defined by the input property. When inputent is all, all entities in the geometry are considered.

When groupcontang is set to on, the selection operates on groups of entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

*Box*

Selection of entities that are inside or intersect a box.

TABLE 2-125: BOX SELECTION PROPERTIES.

| NAME         | VALUE                                                                                 | DEFAULT                          | DESCRIPTION                                                                                                                                              |
|--------------|---------------------------------------------------------------------------------------|----------------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------|
| entitydim    | 0   1   2   3                                                                         | sdim                             | Dimension of entities to select.                                                                                                                         |
| angletol     | double                                                                                | 5                                | Angle tolerance for continuity evaluation.                                                                                                               |
| color        | none   custom   integer<br>between 1 and the number of<br>colors in the current theme | none                             | The color of the selection, either given as an<br>integer indicating a color in the color theme, or<br>as a custom color in the customcolor<br>property. |
| customcolor  | RGB-triplet                                                                           | Next<br>available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                 |
| groupcontang | on   off                                                                              | off                              | Continuous tangent mode.                                                                                                                                 |
| groupcontang | on   off                                                                              | off                              | Continuous tangent mode.                                                                                                                                 |
| inputent     | all   selections                                                                      | all                              | Use all entities or entities defined by input<br>property.                                                                                               |
| input        | String[]                                                                              | {}                               | Input selections.                                                                                                                                        |
| condition    | intersects   inside  <br>somevertex   allvertices                                     | intersects                       | Condition for inclusion of an entity.                                                                                                                    |
| xmax         | double                                                                                | inf                              | Maximum x-coordinate of box.                                                                                                                             |
| xmin         | double                                                                                | -inf                             | Minimum x-coordinate of box.                                                                                                                             |
| ymax         | double                                                                                | inf                              | Maximum y-coordinate of box.                                                                                                                             |
| ymin         | double                                                                                | -inf                             | Minimum y-coordinate of box.                                                                                                                             |
| zmax         | double                                                                                | inf                              | Maximum z-coordinate of box.                                                                                                                             |
| zmin         | double                                                                                | -inf                             | Minimum z-coordinate of box.                                                                                                                             |

The xmax, xmin, ymax, ymin, zmax, and zmin properties define the box. These properties take their units from the corresponding geometry sequence.

When condition is intersects, all entities that intersect the box are included in the selection. The rendering mesh is used for the calculation. You can set the accuracy of the rendering mesh using

ModelUtil.setPreference("graphics.rendering.detail",*<detail>*);

where *<detail>* is coarse, normal, fine, or wireframe.

When condition is inside, all entities that are completely inside the box are included in the selection. The rendering mesh is used for the calculation.

When condition is somevertex, all entities that have at least one adjacent vertex inside the box are included in the selection.

When condition is allvertices, all entities that have all adjacent vertices inside the box are included in the selection.

When inputent is selections, the selection is restricted to the entities in the selections defined by the input property. When inputent is all, all entities in the geometry are considered.

When groupcontang is set to on, the selection operates on groups of entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

#### *Cylinder*

Selection of entities that are inside or intersect a cylinder in 3D.

TABLE 2-126: CYLINDER SELECTION PROPERTIES.

| NAME         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                                      |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1       | double                                                                                   | 0                             | Start angle                                                                                                                                                      |
| angle2       | double                                                                                   | 360                           | End angle (default: 360 degrees; that is, a full<br>cylinder)                                                                                                    |
| color        | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property.            |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                                         |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode                                                                                                                                          |
| entitydim    | 0   1   2   3                                                                            | 3                             | Dimension of entities to select                                                                                                                                  |
| angletol     | double                                                                                   | 5                             | Angle tolerance for continuity evaluation                                                                                                                        |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode                                                                                                                                          |
| inputent     | all selections                                                                           | all                           | Use all entities or entities defined by input<br>property                                                                                                        |
| input        | String[]                                                                                 | {}                            | Input selections                                                                                                                                                 |
| condition    | intersects   inside  <br>somevertex  <br>allvertices                                     | intersects                    | Condition for inclusion of an entity                                                                                                                             |
| pos          | double[]                                                                                 | {0,0,0}                       | Cylinder base point                                                                                                                                              |
| axis         | double[]                                                                                 | {0,0,1}                       | Direction of the cylinder axis. Vector has length 3<br>if axistype is cartesian and length 2 if<br>axistype is spherical. Not used if axistype<br>is x, y, or z. |
| axistype     | x   y   z   cartesian  <br>spherical                                                     | z                             | Coordinate system used for axis. The value is<br>synchronized with axis.                                                                                         |
| top          | double                                                                                   | inf                           | Coordinate of upper face in local coordinate<br>system                                                                                                           |
| bottom       | double                                                                                   | -inf                          | Coordinate of lower face in local coordinate<br>system                                                                                                           |

TABLE 2-126: CYLINDER SELECTION PROPERTIES.

| NAME | VALUE                | DEFAULT | DESCRIPTION  |
|------|----------------------|---------|--------------|
| r    | double (nonnegative) | 0       | Outer radius |
| rin  | double (nonnegative) | 0       | Inner radius |

The pos property defines the center of the cylinder and the axis property defines the cylinder axis. The top, bottom, r, and rin properties define the size of the cylinder. Setting rin equal to r corresponds to a cylindrical surface. These properties take their units from the corresponding geometry sequence. Using the angle1 and angle2 properties, you can create a cylinder segment.

When condition is intersects, all entities that intersect the cylinder are included in the selection. The rendering mesh is used for the calculation. You can set the accuracy of the rendering mesh using

ModelUtil.setPreference("graphics.rendering.detail",*<detail>*);

where *<detail>* is coarse, normal, fine, or wireframe.

When condition is inside, all entities that are completely inside the cylinder are included in the selection. The rendering mesh is used for the calculation.

When condition is somevertex, all entities that have at least one adjacent vertex inside the cylinder are included in the selection.

When condition is allvertices, all entities that have all adjacent vertices inside the cylinder are included in the selection.

When inputent is selections, the selection is restricted to the entities in the selections defined by the input property. When inputent is all, all entities in the geometry are considered.

When groupcontang is set to on, the selection operates on groups of entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

*Disk* Selection of entities that are inside or intersect a disk.

TABLE 2-127: DISK SELECTION PROPERTIES.

| NAME         | VALUE                                                                                    | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| angle1       | double                                                                                   | 0                             | Start angle                                                                                                                                           |
| angle2       | double                                                                                   | 360                           | End angle (default: 360 degrees; that is, a full disk)                                                                                                |
| color        | none   custom   integer<br>between 1 and the<br>number of colors in the<br>current theme | none                          | The color of the selection, either given as an<br>integer indicating a color in the color theme, or as<br>a custom color in the customcolor property. |
| customcolor  | RGB-triplet                                                                              | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                              |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode.                                                                                                                              |
| entitydim    | 0   1   2                                                                                | sdim                          | Dimension of entities to select.                                                                                                                      |
| angletol     | double                                                                                   | 5                             | Angle tolerance for continuity evaluation.                                                                                                            |
| groupcontang | on   off                                                                                 | off                           | Continuous tangent mode.                                                                                                                              |
| inputent     | all   selections                                                                         | all                           | Use all entities or entities defined by input<br>property.                                                                                            |
| input        | String[]                                                                                 | {}                            | Input selections                                                                                                                                      |

TABLE 2-127: DISK SELECTION PROPERTIES.

| NAME      | VALUE                                                | DEFAULT    | DESCRIPTION                           |
|-----------|------------------------------------------------------|------------|---------------------------------------|
| condition | intersects   inside  <br>somevertex  <br>allvertices | intersects | Condition for inclusion of an entity. |
| posx      | double                                               | 0          | Center of disk, first coordinate.     |
| posy      | double                                               | 0          | Center of disk, second coordinate.    |
| r         | double (nonnegative)                                 | 0          | Outer radius.                         |
| rin       | double (nonnegative)                                 | 0          | Inner radius.                         |

The posx and posy properties define the center of the disk, and r and rin define the outer and inner radius, respectively. These properties take their units from the corresponding geometry sequence. Using the angle1 and angle2 properties, you can create a disk segment.

When condition is intersects, all entities that intersect the disk are included in the selection. The rendering mesh is used for the calculation. You can set the accuracy of the rendering mesh using

ModelUtil.setPreference("graphics.rendering.detail",*<detail>*);

where *<detail>* is coarse, normal, fine, or wireframe.

When condition is inside, all entities that are completely inside the disk are included in the selection. The rendering mesh is used for the calculation.

When condition is somevertex, all entities that have at least one adjacent vertex inside the disk are included in the selection.

When condition is allvertices, all entities that have all adjacent vertices inside the disk are included in the selection.

When inputent is selections, the selection is restricted to the entities in the selections defined by the input property. When inputent is all, all entities in the geometry are considered.

When groupcontang is set to on, the selection operates on groups of entities that have continuous tangents at their junctions.

The angletol property defines the tolerance for the continuity evaluation.

