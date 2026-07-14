# **DESCRIPTION**

This feature creates an instance of a geometry part with new values of its input parameters. Use model. component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).geom() to access its local copy of the part.

The following properties are available:

TABLE 3-124: VALID PROPERTY/VALUE PAIRS.

| PROPERTY  | VALUES   | DEFAULT | DESCRIPTION                                        |
|-----------|----------|---------|----------------------------------------------------|
| part      | String   |         | Tag of part to call, or local to use a local part. |
| inputname | String[] |         | Names of the input parameters (read-only).         |
| inputexpr | String[] |         | Expressions for the input parameters.              |

The default for part is the first part in model.geom(), or local if there is none.

In 3D, the following additional properties are available to control the positioning of the output objects:

TABLE 3-125: VALID PROPERTY/VALUE PAIRS IN 3D.

| PROPERTY      | VALUES                                  | DEFAULT | DESCRIPTION                                                                                                                      |
|---------------|-----------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------|
| ax2           | double[2]                               | {0,0}   | Spherical angles theta and phi, used if axistype is<br>spherical.                                                                |
| ax3           | double[3]                               | {0,0,1} | Axis vector, used if axistype is cartesian.                                                                                      |
| axis          | double[]                                | {0,0,1} | Rotation axis. Vector has length 3 if axistype is<br>cartesian, and length 2 if axistype is spherical. Alias<br>for ax2 and ax3. |
| axistype      | x   y   z  <br>cartesian  <br>spherical | z       | Coordinate system used for axis. Used if specify is set to<br>axis.                                                              |
| displ         | double[3]                               | {0,0,0} | Displacement vector.                                                                                                             |
| edge          | Selection                               |         | Edge selection. Used when specify is set to edge.                                                                                |
| eulerang      | double[3]                               | {0,0,0} | Intrinsic Z-X-Z Euler angles α, β, and γ, used if specify is<br>set to eulerang.                                                 |
| rot           | double                                  | 0       | Rotation angle, used if specify is set to axis.                                                                                  |
| specify       | axis   eulerang<br>  edge               | axis    | Specify an axis of rotation, Euler angles (Z-X-Z) or a<br>straight edge.                                                         |
| workplanepart | String                                  | xyplane | Tag of work plane in the geometry part, or xyplane.                                                                              |
| workplanesrc  | String                                  | this    | Tag of PartInstance feature to take work plane from, or<br>this to take it from this sequence.                                   |
| workplane     | String                                  | xyplane | Tag of work plane to match, or xyplane.                                                                                          |

In 2D, the following additional properties are available to control the positioning of the output objects:

TABLE 3-126: VALID PROPERTY/VALUE PAIRS IN 2D.

| PROPERTY | VALUES    | DEFAULT | DESCRIPTION          |
|----------|-----------|---------|----------------------|
| displ    | double[2] | {0,0}   | Displacement vector. |
| rot      | double    | 0       | Rotation angle.      |

For each geometric entity level (object, domain, boundary, edge, and point) that exists in the geometry, there is in addition the following properties related to the output selections for that level:

TABLE 3-127: VALID PROPERTY/VALUE PAIRS FOR OUTPUT SELECTIONS.

| PROPERTY             | VALUES                         | DEFAULT  | DESCRIPTION                                                                                                                 |
|----------------------|--------------------------------|----------|-----------------------------------------------------------------------------------------------------------------------------|
| selcolorlevel        | String[]                       | all none | Colors of selections (read-only). This property is only<br>available for domains and boundaries in 3D and domains in<br>2D. |
| selkeepnoncontr      | on   off                       | on       | Keep all noncontributing selections.                                                                                        |
| seltaglevel          | String[]                       |          | Tags of selections (read-only).                                                                                             |
| selnamelevel         | String[]                       |          | Names of selections (read-only).                                                                                            |
| selcontributetolevel | String[]                       | all none | Tags of cumulative selections to contribute to, or none to<br>not contribute.                                               |
| selkeeplevel         | String[] with<br>on/off values | all off  | Keep selection from part (only used when<br>selkeepnoncontr is off).                                                        |
| selshowlevel         | String[] with<br>on/off values | all on   | Show selection in physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.                      |

where *level* is obj, dom, bnd, edg, or pnt for geometry objects, domains, boundaries, edges, and points, respectively.

The following attributes are available:

TABLE 3-128: VALID ATTRIBUTES

| NAME         | VALUE    | DEFAULT | DESCRIPTION                                                  |
|--------------|----------|---------|--------------------------------------------------------------|
| construction | on   off | off     | Designate the resulting objects as construction<br>geometry. |

#### **COMPATIBILITY**

In version 5.1, the following properties were deprecated and replaced:

TABLE 3-129: DEPRECATED PROPERTIES.

| PREVIOUS NAME | NEW NAME IN 5.1 |
|---------------|-----------------|
| arg           | inputname       |
| argexpr       | inputexpr       |
| argvalue      | inputvalue      |
| argdescr      | inputdescr      |
| subsequence   | part            |
| workplanesub  | workplanepart   |

### **EXAMPLE**

Create a geometry part that makes a torus of revolution angle *a*, where *a* is an argument (default value: 90 degrees). Then add work planes for the two planar face to make it easy to position the result:

```
Code for Use with Java
  Model model = ModelUtil.create("Model1");
  GeomSequence p = model.geom().create("part1", "Part", 3);
  p.inputParam().set("a", 90);
  p.create("tor1", "Torus");
  p.feature("tor1").set("angle", "a");
  p.run("tor1");
  p.create("wp1", "WorkPlane");
  p.feature("wp1").set("planetype", "faceparallel");
  p.feature("wp1").selection("face").set("tor1", new int[]{1});
  p.feature("wp1").set("reverse", "on");
  p.create("wp2", "WorkPlane");
  p.feature("wp2").set("planetype", "faceparallel");
  p.feature("wp2").selection("face").set("tor1", new int[]{6});
Code for Use with MATLAB
  model = ModelUtil.create('Model1');
  p = model.geom.create('part1', 'Part', 3);
  p.inputParam.set('a', 90);
  p.create('tor1', 'Torus');
  p.feature('tor1').set('angle', 'a');
  p.run('tor1');
  p.create('wp1', 'WorkPlane');
  p.feature('wp1').set('planetype', 'faceparallel');
  p.feature('wp1').selection('face').set('tor1', 1);
  p.feature('wp1').set('reverse', 'on');
  p.create('wp2', 'WorkPlane');
```

p.feature('wp2').set('planetype', 'faceparallel'); p.feature('wp2').selection('face').set('tor1', 6);

Create two part instances of this geometry part. The first has *a* = 90 (the default value), and the second has *a* = 120. The objects are positioned so that the two circular faces match, with a rotation angle of 50 degrees.

```
Code for Use with Java
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom1", 3);
  g.create("pi1", "PartInstance");
  g.create("pi2", "PartInstance");
  g.feature("pi2").setIndex("inputexpr", 120, 0);
  g.feature("pi2").set("workplanepart", "wp1");
  g.feature("pi2").set("workplanesrc", "pi1");
  g.feature("pi2").set("workplane", "wp2");
  g.feature("pi2").set("rot", 50);
  g.run("pi2");
Code for Use with MATLAB
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom1', 3);
  g.create('pi1', 'PartInstance');
  g.create('pi2', 'PartInstance');
  g.feature('pi2').setIndex('inputexpr', 120, 0);
  g.feature('pi2').set('workplanepart', 'wp1');
  g.feature('pi2').set('workplanesrc', 'pi1');
  g.feature('pi2').set('workplane', 'wp2');
  g.feature('pi2').set('rot', 50);
  g.run('pi2');
SEE ALSO
If, ElseIf, Else, EndIf
```

Partition 2D and 3D geometry objects using tool objects or a work plane.

