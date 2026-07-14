# *Finalize*

Form a union or assembly by combining all geometry objects. The only allowed tag for the Finalize feature is "fin".

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create("fin", "FormUnion");
model.component(<ctag>).geom(<tag>).create("fin", "FormAssembly");
model.component(<ctag>).geom(<tag>).feature("fin").set(property,<value>);
model.component(<ctag>).geom(<tag>).feature("fin").getType(property);
```

#### **DESCRIPTION**

The Finalize feature (Form Union/Assembly) combines all available geometry objects in the sequence to form a single geometry object. There can only be one Finalize feature per geometry sequence and is added by default for all geometry sequences except for geometry parts and work plane sequences. For 2D, 3D, work plane, and geometry part sequences, you can modify the finalized object by using virtual operations.

![](_page_89_Picture_1.jpeg)

The Finalize feature is optional for work plane and geometry part sequences but is necessary if you want to add virtual operations. It then needs to be manually created.

The output of the last geometry feature is the *finalized geometry* used when meshing and when setting up physics. If the property action is set to union, and multiple geometry objects are present in the geometry sequence, the objects are combined into a single object with multiple domains corresponding to the input objects and overlaps between these. In a 1D and 2D axisymmetric geometry, the union action also removes the part of the geometry that falls in the region *r*<0.

Set the property action to assembly to keep multiple objects in the finalized geometry. Use this option when modeling physics that needs separate geometry objects, for example, when modeling mechanical contact.

TABLE 3-84: VALID PROPERTIES.

| NAME          | VALUE                                   | DEFAULT  | DESCRIPTION                                                       |
|---------------|-----------------------------------------|----------|-------------------------------------------------------------------|
| absrepairtol  | double                                  | 1e-6     | Absolute repair tolerance.                                        |
| action        | union   assembly                        | union    | Handling of multiple objects,                                     |
| createpairs   | on   off                                | on       | Create pairs. Used if action is assembly,                         |
| frame         | mesh   geometry  <br>material   spatial | spatial  | Frame used for automatically generated Identity pair<br>features. |
| imprint       | on   off                                | off      | Create imprints. Used if action is assembly,                      |
| repairtol     | double                                  | 1e-6     | Relative repair tolerance, relative to size of union of inputs.   |
| repairtoltype | auto   relative  <br>absolute           | auto     | Repair tolerance type: automatic, relative, or absolute.          |
| pairtype      | identity   contact                      | identity | Type of pairs to create,                                          |
| splitpairs    | on   off                                | off      | Create one pair for each connected set of touching<br>boundaries, |

#### **SEE ALSO**

Compose, Union, Intersection, Difference

