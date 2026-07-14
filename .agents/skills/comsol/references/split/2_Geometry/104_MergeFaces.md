# *MergeFaces*

The feature merges the selected faces by collapsing the gap between the faces. The output object is a virtual geometry.

## **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MergeFaces");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MergeFaces") to merge faces using the following properties:

TABLE 3-107: VALID PROPERTIES.

| NAME           | VALUE                       | DEFAULT | DESCRIPTION                                                                                                                                                                 |  |
|----------------|-----------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| pairing        | auto   manual               | auto    | Specifies how to pair the faces in the merge.                                                                                                                               |  |
| input          | Selection                   |         | Faces to merge. Used if pairing is auto.                                                                                                                                    |  |
| keepfac        | Selection                   |         | Faces to keep. Used if pairing is manual.                                                                                                                                   |  |
| removefac      | Selection                   |         | Faces to remove. Used if pairing is manual.                                                                                                                                 |  |
| distancetype   | auto   relative  <br>manual | auto    | Specifies how to enter the maximum distance to bridge.                                                                                                                      |  |
| maxreldistance | Double                      | 0.01    | Maximum distance between faces to be merged, relative to<br>size of geometry. Used if distancetype is relative.                                                             |  |
| maxabsdistance | Double                      |         | Maximum absolute distance between faces to be merged.<br>Used if distancetype is absolute.                                                                                  |  |
| method         | imprint  <br>one-to-one     | imprint | Specifies how to pair the entities. The option imprint<br>creates an imprint of the entities to remove on the keep<br>side. Used when the geometry representation is cadps. |  |

TABLE 3-107: VALID PROPERTIES.

| NAME          | VALUE    | DEFAULT | DESCRIPTION                                                                                                                                       |
|---------------|----------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| precision     | [0,1]    | 0.5     | Specifies the precision with which to make the imprints. A<br>value close to 1 gives a more exact imprint. Used when<br>method is imprint.        |
| forceonetoone | on   off | off     | Forces the faces on the remove side to be matched with<br>the keep side without any imprints. Used when the<br>geometry representation is comsol. |
| createdom     | on   off | on      | Specify if to create domains for each watertight finite void<br>region.                                                                           |

Read more about the geometry representation in the section Geometry Representation in 3D and for Boolean Operations.

#### **SEE ALSO**

Geometry Cleanup

