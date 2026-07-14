# *Tangent*

Create a tangent line segment to one or two 2D edges.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Tangent");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Tangent") to create a line segment tangent to two edges or tangent to one edge with a fixed endpoint. The following properties are available:

TABLE 3-166: VALID PROPERTY/VALUE PAIRS FOR TANGENT.

| PROPERTY      | VALUE                                | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                |
|---------------|--------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| contributeto  | String                               | none    | Tag of cumulative selection to contribute to.                                                                                                                                                                                              |
| edge          | Selection                            |         | Edge in a geometry object to find tangent to.                                                                                                                                                                                              |
| selresult     | on   off                             | off     | Create selections of all resulting objects.                                                                                                                                                                                                |
| selresultshow | all   obj   bnd   edg  <br>pnt   off | bnd     | Show selections, if selresult is on, in physics,<br>materials, and so on; in part instances; or in 3D<br>from a plane geometry. obj is not available in a<br>component's geometry. dom, bnd, and edg are not<br>available in all features. |
| start         | double                               | 0.5     | Start guess for parameter value of point of<br>tangency.                                                                                                                                                                                   |
| type          | edge   point   coord                 | edge    | Type of tangent.                                                                                                                                                                                                                           |

If type is edge a common tangent line to two edges are constructed. Then, the following additional properties are available:

TABLE 3-167: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                                             |
|----------|-----------|---------|---------------------------------------------------------|
| edge2    | Selection |         | Second edge in some geometry object to find tangent to. |
| start2   | double    | 0.5     | Start guess for parameter value of point of tangency.   |

If type is point a tangent line through a given point is constructed. Then, the following additional property is available:

TABLE 3-168: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE     | DEFAULT | DESCRIPTION                    |
|----------|-----------|---------|--------------------------------|
| point    | Selection |         | Point in some geometry object. |

If type is coord a tangent line through a point with given coordinates are constructed. Then, the following additional property is available:

TABLE 3-169: VALID PROPERTY/VALUE PAIRS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION  |
|----------|----------|---------|--------------|
| coord    | double[] | {0,0}   | Coordinates. |

If a tangent cannot be found, a tangent to some adjacent edge is constructed, if possible.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-170: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

model.component(*<ctag>*).geom(gname).create(fname,"tangent") creates a Tangent feature.

The following properties are no longer supported:

model.component().create("comp1");

g.feature("c2").set("pos", "2 2");

g.create("c1","Circle"); g.create("c2","Circle");

TABLE 3-171: OBSOLETE PROPERTY/VALUE PAIRS.

| PROPERTY NAME | PROPERTY VALUE        | DEFAULT               | DESCRIPTION                                                 |
|---------------|-----------------------|-----------------------|-------------------------------------------------------------|
| edim1         | 0   1                 | geometry<br>dependent | Starting point element dimension: 0 for vertex, 1 for edge. |
| edim2         | 0   1                 | geometry<br>dependent | Ending point element dimension: 0 for vertex, 1 for edge.   |
| dom1          | integer               | 1                     | Starting point entity number.                               |
| dom2          | integer               | 1                     | Ending point entity number.                                 |
| out           | cell array of Strings | {}                    | Additional output data.                                     |
| start1        | double                | 0.5                   | Starting point parameter value on specified edge.           |

## **EXAMPLE**

The following sequence generates a tangent from the unit circle to the point (2, 0):

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",2);
  g.create("c1","Circle");
  g.run("c1");
  g.create("tan1","Tangent");
  g.feature("tan1").set("type","coord");
  g.feature("tan1").selection("edge").set("c1",3);
  g.feature("tan1").set("coord","2 0");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.run('c1');
  g.create('tan1','Tangent');
  g.feature('tan1').set('type','coord');
  g.feature('tan1').selection('edge').set('c1',3);
  g.feature('tan1').set('coord','2 0');
  g.run;
The following sequence generates a common tangent between two circles:
Code for Use with Java
  Model model = ModelUtil.create("Model1");
```

GeomSequence g = model.component("comp1").geom().create("geom1",2);

```
g.run("c2");
  g.create("tan1","Tangent");
  g.feature("tan1").selection("edge").set("c1",4);
  g.feature("tan1").selection("edge2").set("c2",4);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',2);
  g.create('c1','Circle');
  g.create('c2','Circle');
  g.feature('c2').set('pos', '2 2');
  g.run('c2');
  g.create('tan1','Tangent');
  g.feature('tan1').selection('edge').set('c1',4);
  g.feature('tan1').selection('edge2').set('c2',4);
  g.run;
```

#### **SEE ALSO**

BezierPolygon

