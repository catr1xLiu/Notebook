# *Ellipse*

#### **CURRENT VERSION**

1

#### **SUBTYPE OF**

GeomCurve

#### **FIELDS**

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                  |
|---------------|----------|--------------------------------------------------------------|
| integer       |          | Version.                                                     |
| integer       | d        | Space dimension.                                             |
| Transform     |          | Transformation class. Only present if d = 3.                 |
| double[d]     | center   | Centerpoint.                                                 |
| Boolean       |          | 1 if clockwise rotation; 0 otherwise. Only present if d = 2. |
| double[d]     | normal   | Normal vector. Only present if d = 3.                        |
| double[d]     | M        | Major axis.                                                  |
| double        | rat      | Ratio of minor axis length to major axis length.             |
| double        | offset   | Parameter at the end of major axis.                          |

#### **DESCRIPTION**

This curve defines an ellipse in the two or three dimensional space.

In 2D, an ellipse is defined by a centerpoint center, a vector defining the major axis M of the ellipse (including the magnitude of the major axis), the radius ratio of the minor axis length to the major axis length rat, the direction of the ellipse, and the parameter offset at the major axis offset.

In 3D, an ellipse is defined by a centerpoint center, a unit vector normal to the plane of the ellipse normal, a vector defining the major axis of the ellipse M (including the magnitude of the major axis), the radius ratio, and the parameter offset at the major axis offset. The direction of the ellipse is defined by the right-hand rule using the normal vector.

An ellipse is a closed curve that has a period of 2π. It is parameterized as:

```
point = center + M cos(t - offset) + N sin(t - offset)
```

where M and N are the major and minor axes, respectively.

