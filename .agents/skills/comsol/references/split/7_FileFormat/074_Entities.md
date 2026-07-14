# Entities
1
3
```

| ENTITY/OBJECT | VARIABLE | DESCRIPTION              |
|---------------|----------|--------------------------|
| String        |          | Type ID for the subtype. |

The subtypes have additional fields.

## **DESCRIPTION**

Serializable is the abstract base type for all other types.

*Straight*

#### **CURRENT VERSION**

1

#### **SUBTYPE OF**

GeomCurve

## **FIELDS**

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                       |
|---------------|----------|-------------------------------------------------------------------|
| integer       |          | Version.                                                          |
| integer       | d        | Space dimension.                                                  |
| double[d]     | root     | The point on the line which corresponds to the parameter value 0. |
| double[d]     | dir      | The direction in vector of the line.                              |
| double        | pscale   | Parameter scale.                                                  |

