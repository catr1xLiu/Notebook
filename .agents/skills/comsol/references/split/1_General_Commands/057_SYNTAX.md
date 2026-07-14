# **SYNTAX**

```
model.extraDim().create(<tag>,<type>);
model.extraDim(<tag>).set(<property>,<value>);
model.extraDim(<tag>).model(<mtag>);
model.extraDim(<tag>).selection();
model.extraDim(<tag>).selection("point");
model.extraDim(<tag>).getType(<property>);
model.extraDim(<tag>).model();
```

#### **DESCRIPTION**

model.extraDim().create(*<tag>*,*<type>*) creates an extra dimension feature of the given type. The supported types are AttachDimension, PointsToAttach, and Integration.

model.extraDim(*<tag>*).set(*<property>*,*<value>*) specifies properties relevant for the selected extra dimension feature type.

- **•** Properties for AttachDimension: extradim
- **•** PointsToAttach has no properties.
- **•** Properties for Integration: opname, intrule, intorder, frame, axisym

model.extraDim(*<tag>*).model(*<mtag>*) sets the model component node. For features of type AttachDimension, this defines the base model component node. For features of type PointsToAttach and Integration, this defines the extra dimension component node.

```
model.extraDim(<tag>).selection();
```

Returns the selection of the feature (for features of type AttachDimension and Integration).

model.extraDim(<tag>).selection("point") returns the selection of points to attach (for features of type PointsToAttach).

```
model.extraDim(<tag>).getType(<property>) returns the value of the specified property.
```

model.extraDim(*<tag>*).model() returns the model component node tag.

```
model.field()
```

Create and define properties for fields with shape functions that defined field variables.

## **SYNTAX**

```
model.field().create(<tag>,<fname>);
model.field(<tag>).field(<fname>);
model.field(<tag>).shape(<shlist>);
model.field(<tag>).field();
model.field(<tag>).shape();
model.field(<tag>).geom();
```

#### **DESCRIPTION**

model.field().create(*<tag>*,*<fname>*) creates a field with tag *<tag>* with the field name *<fname>*.

```
model.field(<tag>).field(<fname>) sets the field name.
```

model.field(*<tag>*).shape(*<shlist>*) sets the shape functions defining the field variables. *<shlist>* is a list of shape function tags. Each shape function defines one or more field variables. Together the shape functions specify which field variables there are in the field.

```
model.field(<tag>).field() returns the field name as a string.
```

```
model.field(<tag>).shape() returns the shape function tags as a string array.
```

model.field(*<tag>*).geom() returns the geometry associated with the field.

## **SEE ALSO**

```
model.shape(), model.coeff()
```

