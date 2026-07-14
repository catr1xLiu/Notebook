# *InfiniteElement*

model.component(*<ctag>*).coordSystem().create(*<tag11>*,*<gtag>*,"InfiniteElement") creates an infinite element, which acts as an unbounded domain for a simulation. You can specify the type and scaling of the infinite element using the following properties:

TABLE 2-61: PROPERTIES FOR INFINITE ELEMENT.

| PROPERTY    | VALUE                                                      | DEFAULT                   | DESCRIPTION                                                                      |
|-------------|------------------------------------------------------------|---------------------------|----------------------------------------------------------------------------------|
| r0          | double array                                               | 0; 0 (2D)<br>0; 0; 0 (3D) | Center coordinates for cylindrical infinite<br>elements.                         |
| raxis       | double array                                               | 0; 0; 0                   | Center axis direction for cylindrical infinite<br>elements in 3D,                |
| pole        | double                                                     | dGeomChar                 | Pole distance                                                                    |
| ScalingType | Cartesian  <br>Cylindrical  <br>Spherical  <br>userDefined | Cartesian                 | The scaling type for the infinite element.<br>Spherical is only available in 3D. |
| width       | double                                                     | 1e3*dGeomChar             | Physical width.                                                                  |
| directions  | integer                                                    | 1                         | Number of stretching directions (for<br>userDefined scaling).                    |
| d           | String array                                               | x; y, z                   | Distance function for stretching directions (1–<br>3).                           |
| dmax        | double array                                               | 1; 1, 1                   | Thickness function for stretching directions<br>(1–3).                           |

#### *AbsorbingLayer*

model.component(*<ctag>*).coordSystem().create(*<tag12>*,*<gtag>*,"AbsorbingLayer") creates an absorbing layer, which acts as an effective nonreflecting-like boundary condition in transient simulations using a time-explicit solver. You can specify the type and scaling of the absorbing layer using the following properties:

TABLE 2-62: PROPERTIES FOR ABSORBING LAYER.

| PROPERTY | VALUE        | DEFAULT                   | DESCRIPTION                                                      |
|----------|--------------|---------------------------|------------------------------------------------------------------|
| r0       | double array | 0; 0 (2D)<br>0; 0; 0 (3D) | Center coordinates for cylindrical absorbing<br>layers.          |
| raxis    | double array | 0; 0; 0                   | Center axis direction for cylindrical absorbing<br>layers in 3D, |
| pole     | double       | dGeomChar                 | Pole distance                                                    |

TABLE 2-62: PROPERTIES FOR ABSORBING LAYER.

| PROPERTY    | VALUE                                                      | DEFAULT       | DESCRIPTION                                                                     |
|-------------|------------------------------------------------------------|---------------|---------------------------------------------------------------------------------|
| ScalingType | Cartesian  <br>Cylindrical  <br>Spherical  <br>userDefined | Cartesian     | The scaling type for the absorbing layer.<br>Spherical is only available in 3D. |
| width       | double                                                     | 1e3*dGeomChar | Physical width.                                                                 |
| directions  | integer                                                    | 1             | Number of stretching directions (for<br>userDefined scaling).                   |
| d           | String array                                               | x; y, z       | Distance function for stretching directions (1–<br>3).                          |
| dmax        | double array                                               | 1; 1, 1       | Thickness function for stretching directions<br>(1–3).                          |

#### **EXAMPLE**

Create a cylindrical coordinate system with a radial base vector direction that is (0, 1, 0); that is, a coordinate that points in the global *y* direction:

```
Code for Use with Java
  model.component("comp1").coordSystem().create("sys2", "geom1", "Cylindrical");
  model.component("comp1").coordSystem("sys2").setIndex("radialbasevector", "1", 1);
  model.component("comp1").coordSystem("sys2").setIndex("radialbasevector", "0", 0);
Code for Use with MATLAB
  model.component('comp1').coordSystem.create('sys2', 'geom1', 'Cylindrical');
  model.component('comp1').coordSystem('sys2').setIndex('radialbasevector', '1', 1);
  model.component('comp1').coordSystem('sys2').setIndex('radialbasevector', '0', 0);
model.cpl()
```

Add nonlocal couplings.

## **SYNTAX**

```
model.component(<ctag>).cpl().create(<tag>,type);
model.component(<ctag>).cpl().create(<tag>,type,<gtag>);
model.component(<ctag>).cpl(<tag>).set(property,<value>);
model.component(<ctag>).cpl(<tag>).set("opname",<opname>)
model.component(<ctag>).cpl(<tag>).selection(property).named(<seltag>);
model.component(<ctag>).cpl(<tag>).selection(property).set(...);
model.component(<ctag>).cpl(<tag>).create(<subtag>,subtype);
model.component(<ctag>).cpl(<tag>).feature(<subtag>).set(property,<value>);
model.component(<ctag>).cpl(<tag>).getType(property,<value>);
model.component(<ctag>).cpl(<tag>).feature(<subtag>).getType(property,<value>);
model.component(<ctag>).cpl(<tag>).image();
model.component(<ctag>).cpl(<tag>).set(property,<value>);
model.component(<ctag>).cpl(<tag>).setIndex(property,<value>,<index1>);
model.component(<ctag>).cpl(<tag>).setIndex(property,<value>,<index1>,<index2>);
```

The set() methods index/position arguments are 1-based. The setIndex() methods index/position arguments are 0-based. See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

