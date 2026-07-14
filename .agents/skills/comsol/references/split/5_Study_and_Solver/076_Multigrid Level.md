# *Multigrid Level*

A Multigrid Level study substep specifies the geometric multigrid level used by the study step (a Stationary study step, for example).

#### **SYNTAX**

```
model.study(stdname).create(fname,"Stationary");
model.study(stdname).feature(fname).mglevel().create(mglname);
model.study(stdname).feature(fname).mglevel(mglname).set(pname,value);
```

#### **DESCRIPTION**

Study step attribute.

The following properties are available.

TABLE 6-146: PROPERTIES FOR PHYSICS SELECTION.

| PROPERTY       | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                         |
|----------------|-------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| discretization | Vector of strings |         | Select discretizations for physics interfaces. The<br>length of the vector is two times the number of<br>physics interfaces. Example value when two<br>physics interfaces g and c are available is: new<br>String[]{"g", "disc1", "c",<br>"disc2"}. |

#### TABLE 6-147: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

