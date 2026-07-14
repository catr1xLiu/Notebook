# **EXAMPLE**

Create a component node and assign it to a geometry and an analytic function.

```
Code for Use with Java
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1", 3);
  model.component("comp1").func().create("an1", "Analytic");
Code for Use with MATLAB
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 3);
  model.component('comp1').func.create('an1', 'Analytic');
model.constr()
```

Creating and modifying constraints in a model.

#### **SYNTAX**

```
model.constr().create(<tag>,<shtags>);
model.constr().create(<tag>,<nglobal>);
model.constr(<tag>).shape(<shtags>);
model.constr(<tag>).shape(<pos>,<shtags>);
model.constr(<tag>).global(<nglobal>);
model.constr(<tag>).create(<ftag>);
model.constr(<tag>).feature(<ftag>).set(ctype,<value>);
model.constr(<tag>).shape();
model.constr(<tag>).global();
model.constr(<tag>).feature(<ftag>).getType(ctype);
model.constr(<tag>).feature(<ftag>).set(String pname, int value);
model.constr(<tag>).feature(<ftag>).set(String pname, int pos, int value);
model.constr(<tag>).feature(<ftag>).set(String pname, int pos, int[] value);
model.constr(<tag>).feature(<ftag>).set(String pname, int pos1, int pos2, int value);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String value, int firstIndex,
                    int secondIndex);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String[] value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, double value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, double value, int firstIndex,
                    int secondIndex);
model.constr(<tag>).feature(<ftag>).setIndex(String name, double[] value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, int value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, String value, int index);
model.constr(<tag>).feature(<ftag>).setIndex(String name, int value, int firstIndex,
                    int secondIndex);
model.constr(<tag>).feature(<ftag>).setIndex(String name, int[] value, int index);
```

The set() methods index/position arguments are 1-based. The setIndex() methods index/position arguments are 0-based. See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

#### **DESCRIPTION**

model.constr(*<tag>*) returns the constraint with tag *<tag>*.

model.constr().create(*<tag>*,*<shtags>*) creates a constraint with tag *<tag>* using the shape functions *<shtags>*.

model.constr().create(*<tag>*,*<nglobal>*) creates a global constraint with tag *<tag>* expecting *<nglobal>* components.

model.constr(*<tag>*).shape(*<shtags>*) points to the shape functions associated with the constraint. Reassigning the shape functions can have the side effect of modifying the constraints since the number of constraints can change as the size of each constraint vector can change.

model.constr(*<tag>*).global(*<nglobal>*) specifies that the constraint is global and sets the expected number of components.

```
model.constr(<tag>).feature(<ftag>) is a feature in the constraint with tag <tag>.
```

model.constr(*<tag>*).create(*<ftag>*) creates a constraint feature.

model.constr(*<tag>*).feature(*<ftag>*).set(*ctype*,*<value>*) sets the parameter *ctype* to *<value>*, where *ctype* is either constr or constrf, and *<value>* is a single constraint expression or a list of constraint expressions. The number of elements in the constraint expression depends on the number of global constraint components or shape functions specified, and on the shape function type. A Lagrange shape function or global constraint

component requires a single item, whereas a vector shape function requires one item for each space dimension. The supported set methods are the ones for double string arrays defined in Table 2-4.

model.constr(*<tag>*).feature(*<ftag>*).selection().named(*<seltag>*) assigns the constraint to the named selection *<seltag>*.

model.constr(*<tag>*).feature(*<ftag>*).selection().set(...) defines a local selection that assigns the constraint to geometric entities. For a complete list of methods available under selection(), see model.selection(). Only selections at a single geometry level is allowed in the selection.

model.constr(*<tag>*).shape() returns the shape function tags as a string array.

model.constr(*<tag>*).global() returns the number of components if the constraint is global, otherwise −1.

```
model.constr(<tag>).feature(<ftag>)).
```

getAllowedPropertyValues(property) returns the set of allowed values for a property if the set is a finite set of strings; otherwise, it returns null.

model.constr(*<tag>*).feature(*<ftag>*).get*Type*(*ctype*) returns the constraint or constraint force value. For available methods, see get\* and Selection Access Methods.

model.constr(*<tag>*).feature(*<ftag>*).selection().named() returns the named selection tag, and model.constr(*<tag>*).feature(*<ftag>*).selection().get*Type*() returns domain information. For available methods, see Selections.

model.constr(*<tag>*).feature(*<ftag>*).selection(*<estype>*).set(...) defines a subselection of a given lower-dimensional excluded selection type that should be excluded from the constraint selection. Excluded selection type can be exclude0 for points, exclude1 for edges, and exclude2 for excluded face subselections. The constraint is not enforced on the specified excluded subselections. Excluded subselections have to have lower dimension than the constraint selection. For a complete list of methods available under selection(*<estype>*), see model.selection().

## **EXAMPLES**

*Code for Use with Java*

Set several constraint by using multiple constraints:

```
ConstrFeature f = model.constr("c1").create("f1");
  f.set("constr",new String[]{"u-1","v"});
  f.selection().geom("geom1",1);
  f.selection().all();
Vector elements need a set of constraints:
  model.constr().create("c2",new String[]{"shE"});
  ConstrFeature f = model.constr("c2").create("f1");
  f.set("constr",new String[]{"Ex-1","Ey-0","Ez-0"});
  f.selection().geom("geom1",1);
  f.selection().all();
Code for Use with MATLAB
  model.constr.create('c1',{'shu','shv'});
  f = model.constr('c1').create('f1');
  f.set('constr',{'u-1','v'});
  f.selection.geom('geom1',1);
  f.selection.all;
Vector elements need a set of constraints:
  model.constr.create('c2',{'shE'});
  f = model.constr('c2').create('f1');
```

model.constr().create("c1",new String[]{"shu","shv"});

```
f.set('constr',{'Ex-1','Ey-0','Ez-0'});
  f.selection.geom('geom1',1);
  f.selection.all;
SEE ALSO
model.shape()
model.coordSystem()
```

Add coordinate systems, perfectly matched layers, infinite elements, and absorbing layers. Perfectly matched layers, infinite elements, and absorbing layers are all available with a set of add-on products only.

![](_page_59_Picture_2.jpeg)

The syntax that includes the component level, such as model.component(*<ctag>*).coordSys()... is the default and is used throughout this chapter. To use the earlier model.coordSys()... syntax, clear the **Generate code using component syntax** checkbox on the **Application Builder>Methods** page in the **Preferences** window.

#### **SYNTAX**

```
model.component(<ctag>).coordSystem().create(<tag>,<gtag>,type);
model.component(<ctag>).coordSystem(<tag>).set(property, <value>);
model.component(<ctag>).component(<ctag>).coordSystem(<tag>).
      setIndex(property,<value>,row);
model.component(<ctag>).coordSystem(<tag>).setIndex(property, <value>,row,col);
model.component(<ctag>).coordSystem(<tag>).selection();
model.component(<ctag>).coordSystem(<tag>).coord()
model.component(<ctag>).coordSystem(<tag>).isOrthonormal()
model.component(<ctag>).coordSystem(<tag>).isLinear()
model.component(<ctag>).coordSystem(<tag>).image()
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

## **DESCRIPTION**

model.component(*<ctag>*).coordSystem().create(*<tag>*,*<gtag>*,*type*) creates a coordinate system with tag *<tag>* on geometry *<gtag>* of type *type*. There are the following types of coordinate systems: mapped system (Mapping), base-vector system (VectorBase), rotated system (Rotated), boundary system (Boundary), scaling system (Scaling), cylindrical system (Cylindrical), and system from geometry (SystemFromGeometry). The boundary system only applies to boundaries. In addition, the perfectly matched layers (PMLs), infinite elements, and absorbing layers are also implemented as types of coordinate systems: PML, InfiniteElement, and AbsorbingLayer, respectively.

model.component(*<ctag>*).coordSystem(*<tag>*).selection().named(*<seltag>*) assigns the coordinate system to the named selection *<seltag>*.

model.component(*<ctag>*).coordSystem(*<tag>*).selection().set(...) defines a local selection that assigns the coordinate system to geometric entities. For a complete list of methods available under selection(), see Selections. The selection method is only available for coordinate systems of the following types: Scaling, PML, InfiniteElement, and AbsorbingLayer.

model.component(*<ctag>*).coordSystem(*<tag>*).set("orthonormal","on") specifies that this is an orthonormal system. This affects the internal calculation of systems, so some simplifications on expressions can be made. It is recommended to use this option when possible. Boundary systems, rotated systems, and cylindrical system are always orthonormal.

TABLE 2-49: COMMON PROPERTIES FOR COORDINATE SYSTEMS.

| PROPERTY | VALUE  | DESCRIPTION             |
|----------|--------|-------------------------|
| name     | String | Coordinate system name. |

#### *Mapping*

model.component(*<ctag>*).coordSystem().create(*<tag1>*,*<gtag>*,"Mapping") creates a mapped system. In a mapped system you specify the coordinate mapping given in some of the available frame coordinates (usually x, y, z).

TABLE 2-50: PROPERTIES FOR MAPPING SYSTEM.

| PROPERTY    | VALUE                                   | DEFAULT      | DESCRIPTION                   |
|-------------|-----------------------------------------|--------------|-------------------------------|
| coord       | String matrix                           | [(x1,x2,x3)] | Coordinate names.             |
| map         | String array                            | (x,y,z)      | The map.                      |
| orthonormal | boolean                                 | false        | If the system is orthonormal. |
| frametype   | mesh   material  <br>spatial   geometry | spatial      | The frame type.               |

model.component(*<ctag>*).coordSystem(*<tag1>*).setIndex("map", "x+1", 0) sets the mapping of the first coordinate system coordinate to be a function of the first frame coordinate, x.

model.component(*<ctag>*).coordSystem(*<tag1>*).setIndex("map", "y+1", 2) sets the mapping of the third coordinate system coordinate to be a function of the second frame coordinate y.

#### *VectorBase*

model.component(*<ctag>*).coordSystem().create(*<tag2>*,"VectorBase") creates a base-vector system. In a base-vector system you specify the base vectors given as components of a frame system. If the components are independent of frame coordinates this is a linear system and can be applied for any frame.

TABLE 2-51: PROPERTIES FOR BASE VECTOR SYSTEM.

| PROPERTY        | VALUE                                         | DEFAULT                 | DESCRIPTION                                                                                                                   |
|-----------------|-----------------------------------------------|-------------------------|-------------------------------------------------------------------------------------------------------------------------------|
| coord           | String matrix                                 | [(x1,x2,x3)]            | Coordinate names, set using setIndex<br>syntax.                                                                               |
| base            | String matrix                                 | [(1,0,0)(0,1,0)(0,0,1)] | Base vectors.                                                                                                                 |
| frametype       | mesh  <br>material  <br>spatial  <br>geometry | spatial                 | Frame type for the specification of the<br>origin.                                                                            |
| makeorthonormal | boolean                                       | false                   | Make the system orthonormal.                                                                                                  |
| origin          | String array                                  | (0,0,0)                 | Origin of system; set using setIndex<br>syntax.                                                                               |
| orthonormal     | boolean                                       | false                   | If the system is orthonormal or not.                                                                                          |
| outofplane      | String                                        | 2 in 2D, 1,2 in 1D      | Out-of-plane index.                                                                                                           |
| workplanesrc    | this   part<br>Instance feature               | this                    | Part-instance feature to take the work<br>plane from.                                                                         |
| workplane       | xyplane   work<br>plane feature               | xyplane                 | Work-plane feature that defines the<br>coordinate system. The default, xyplane,<br>is the global Cartesian coordinate system. |

model.component(*<ctag>*).coordSystem(*<tag2>*).setIndex("base", "1", 0, 1) sets the first base vector's second component to one. As an alternative, it is possible to specify the full base-vector matrix using the following syntax:

model.component(*<ctag>*).coordSystem(*<tag2>*).set("base",

new String[][]{{"0","1","0"},{"0","0","1"},{"1","0","0"}}) sets the base vector matrix so the first base vector is equal to the *y*-axis of the frame system, the second is the *z*-axis, and so on. In 2D, you only use a two rows and two columns from the full base vector matrix for the in-plane base vectors. As an option, it is therefore possible to specify which of the coordinate system base vectors that corresponds to the out-of-plane axis in the frame system. Internally, this base vector always gets the components {"0","0","1"}. The third column is also set using these components. To make a general 3D system in 2D, you must use the mapped system.

model.component(*<ctag>*).coordSystem(*<tag2>*).set("outofplane", "2") sets the third base vector to represent the out-of-plane vector (*z*-axis in 2D). The value is zero based. In 1D the out-of-plane index is set using the syntax "1,2" to set second and third base vectors to represent the out-of-plane vector.

#### *Rotated*

model.component(*<ctag>*).coordSystem().create(*<tag3>*,"Rotated") creates a rotated system. In 3D you specify the Euler angles, which correspond to sequential rotation first about, by default, the *z*-axis, then the *x*-axis, and finally the *z*-axis again. In 2D you can either specify a full 3D rotation or a rotation only about a selected outof-plane axis.

TABLE 2-52: PROPERTIES FOR ROTATED SYSTEM.

| PROPERTY         | VALUE                                                                          | DEFAULT            | DESCRIPTION                                                                                                                   |
|------------------|--------------------------------------------------------------------------------|--------------------|-------------------------------------------------------------------------------------------------------------------------------|
| angle            | String array                                                                   | (0,0,0)            | Rotation angles.                                                                                                              |
| coord            | String matrix                                                                  | [(x1,x2,x3)]       | Coordinate names.                                                                                                             |
| method           | String                                                                         | inPlane            | Input method in 2D.                                                                                                           |
| frametype        | mesh   material<br>  spatial  <br>geometry                                     | spatial            | Frame type for the specification of the<br>origin.                                                                            |
| inPlaneAngle     | String                                                                         | 0                  | Rotation angle when method is inPlane.                                                                                        |
| origin           | String array                                                                   | (0,0,0)            | Origin of system; set using setIndex<br>syntax.                                                                               |
| outofplane       | String                                                                         | 2 in 2D, 1,2 in 1D | Out-of-plane index.                                                                                                           |
| rotationSequence | XYX   XYZ   XZX  <br>XZY   YXY   YXZ  <br>YZX   YZY   ZXY  <br>ZXZ   ZYX   ZYZ | ZXZ                | The rotation sequence for the Euler angles.                                                                                   |
| workplanesrc     | this   part<br>Instance feature                                                | this               | Part-instance feature to take the work plane<br>from.                                                                         |
| workplane        | xyplane   work<br>plane feature                                                | xyplane            | Work-plane feature that defines the<br>coordinate system. The default, xyplane, is<br>the global Cartesian coordinate system. |

model.component(*<ctag>*).coordSystem(*<tag3>*).setIndex("angle","12[deg]",0) sets the first rotation about the *z*-axis to 12 degrees. The default unit for angles are radians.

#### *Boundary*

model.component(*<ctag>*).coordSystem().create(*<tag4>*,*<gtag>*,"Boundary") creates a new boundary system, which is a local base vector system on 2D boundaries (**t**, **n**) and on 3D boundaries (**t**1, **t**2, **n**). There is always one boundary system added by default for each geometry.

TABLE 2-53: PROPERTIES FOR BOUNDARY SYSTEM.

| PROPERTY  | VALUE                                   | DEFAULT      | DESCRIPTION       |
|-----------|-----------------------------------------|--------------|-------------------|
| coord     | String matrix                           | [(x1,x2,x3)] | Coordinate names, |
| frametype | mesh   material  <br>spatial   geometry | spatial      | Frame type,       |

TABLE 2-53: PROPERTIES FOR BOUNDARY SYSTEM.

| PROPERTY           | VALUE                                         | DEFAULT                              | DESCRIPTION                                                |
|--------------------|-----------------------------------------------|--------------------------------------|------------------------------------------------------------|
| reversenormal      | boolean                                       | false                                | Reverse normal direction.                                  |
| tangent            | String array                                  |                                      | Tangent direction.                                         |
| mastersystem       | manual  <br>globalCartesian  <br><tag>)</tag> | globalCartesian                      | Which system to create first<br>tangential direction from. |
| mastercoordsyscomp | String                                        | "2" in axisymmetry,<br>"3" otherwise | Which axis to create first<br>tangential direction from.   |

model.component(*<ctag>*).coordSystem(*<tag4>*).set("reversenormal","on") flips the normal direction for this system, so that it is opposite to the normal direction given by the geometry.

model.component(*<ctag>*).coordSystem(*<tag4>*).set("mastersystcomp","2") sets the first tangential direction from the second axis of the specified master system.

model.component(*<ctag>*).coordSystem(*<tag4>*).set("mastersystem","manual") specifies that no master system is used and that the tangential direction must be entered by the user.

model.component(*<ctag>*).coordSystem(*<tag4>*).setIndex("tangent","1") sets the first component of the first tangential direction.

In addition, you can add ReverseNormal and DomainNormal subfeatures to reverse the normal for some boundaries and switch the normal direction on the exterior of some domains, respectively.

model.component(*<ctag>*).coordSystem(*<tag4>*).create(*<rntag>*, "ReverseNormal") creates a ReverseNormal subfeature. To it, you then assign a boundary selection. For boundary 3, for example, use model.component(*<ctag>*).coordSystem(*<tag4>*).feature(*<rntag>*).selection().set(3);

model.component(*<ctag>*).coordSystem(*<tag4>*).create(*<dntag>*, DomainNormal") creates a DomainNormal subfeature. To it, you then assign a domain selection. For domain 2, for example, use model.component(*<ctag>*).coordSystem(*<tag4>*).feature(*<dntag>*).selection().set(3);. There is one property for the DomainNormal subfeature: normalDirection, which can be a string outward (the default) or inward.

