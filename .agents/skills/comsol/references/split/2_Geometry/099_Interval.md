# *Interval*

Create one or several connected intervals in 1D.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Interval");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"Interval") to create one or more intervals. The following properties are available:

TABLE 3-104: VALID PROPERTY/VALUE PAIRS FOR INTERVAL.

| PROPERTY      | VALUE                             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                     |  |
|---------------|-----------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| contributeto  | String                            | none    | Tag of cumulative selection to contribute to.                                                                                                                                                                                   |  |
| coord         | double[]                          | {0,1}   | Coordinates in table (used when coordsource is set to<br>table).                                                                                                                                                                |  |
| coordsource   | table  <br>vector                 | table   | Data source for coordinates: a table or a vector of<br>coordinates (used when specify is set to coord).                                                                                                                         |  |
| coordvec      | double[]                          | {0,1}   | Coordinates in table (used when coordsource is set to<br>table).                                                                                                                                                                |  |
| left          | double                            | 0       | Left endpoint (used when specify is set to len).                                                                                                                                                                                |  |
| lensource     | table  <br>vector                 | table   | Data source for interval lengths: a table or a vector of<br>lengths (used when specify is set to len).                                                                                                                          |  |
| len           | double[]                          | {1}     | Lengths in table (used when lensource is set to table).                                                                                                                                                                         |  |
| lensource     | table  <br>vector                 | table   | Data source for interval lengths: a table or a vector of<br>lengths (used when specify is set to len).                                                                                                                          |  |
| lenvec        | double[]                          | {1}     | Lengths in vector field (used when lensource is set to<br>table).                                                                                                                                                               |  |
| selresult     | on   off                          | off     | Create selections of all resulting objects.                                                                                                                                                                                     |  |
| selresultshow | all   obj  <br>dom   bnd  <br>off | dom     | Show selections, if selresult is on, of resulting objects<br>in physics, materials, and so on, or in part instances. obj is<br>not available in a component's geometry. dom, bnd, and<br>edg are not available in all features. |  |
| specify       | coord   len                       | coord   | Specify coordinates or interval lengths.                                                                                                                                                                                        |  |

To specify one interval, set the properties p1 and p2. Then, intervals is automatically set to one.

To specify a sequence of connected intervals, set the property p. Then, intervals is automatically set to many.

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

## **COMPATIBILITY**

model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"solid1") creates an interval.

The properties above were added in version 5.4; there is backward compatibility with respect to the previous properties as follows:

- **•** The property intervals set to one corresponds to coordsource set to table.
- **•** The property intervals set to many corresponds to coordsource set to vector.
- **•** Setting or getting the value of the property p1 operates on the first element of the coord array.
- **•** Setting or getting the value of the property p2 operates on the last (or second) element of the coord array.
- **•** Setting or getting the value of the property p operates on the coordvec array.

#### **EXAMPLE**

The following commands create a solid consisting of two intervals:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1",1);
  g.create("i1","Interval");
  g.feature("i1").set("p","0 1 3");
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1',1);
  g.create('i1','Interval');
  g.feature('i1').set('p','0 1 3');
  g.run;
```

#### **SEE ALSO**

BezierPolygon

