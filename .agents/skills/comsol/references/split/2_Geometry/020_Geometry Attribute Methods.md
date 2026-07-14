# *Geometry Attribute Methods*

Attributes are string values that can be assigned to geometric entities or geometry objects. Currently, there are only two types of attributes:

- **•** The Construction geometry attribute. See Construction Geometry for more information.
- **•** The PCB component attribute that can appear when importing components from some ECAD files. The PCB component attribute also has a field that has the tag package. This field assigns a component type to each component.

Get the type of the attribute, for example Construction or PCBComponent. The method returns a string.

```
model.geom(<gtag>).attribute(<atag>).getType();
```

where *<atag>* is the tag of the attribute, for example imp1.component.

Get the tag/name of the attribute, for example construction, imp1.component. The method returns a string.

```
model.geom(<gtag>).attribute(<atag>).tag();
```

Get the (localized) label of the attribute, for example Construction geometry or PCB component. The method returns a string.

```
model.geom(<gtag>).attribute(<atag>).label();
```

Get the whole objects that have the given attribute value *<value>* in the current state of the geometry sequence. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).objects(<value>);
```

Get the objects that have some entity in dimension *<dim>* that have the given attribute value*<value>* in the current state of the geometry sequence. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).objects(<value>, <dim>);
```

Get the entities in dimension *<dim>* in the object *<oname>* that have the given attribute value *<value>* in the current state of the geometry sequence. The method returns an integer array.

```
model.geom(<gtag>).attribute(<atag>).entities(<value>, <oname>, <dim>);
```

For the finalized geometry: Get the entities in dimension *<dim>* that have the given attribute value *<value>*. The method returns an integer array.

```
model.geom(<gtag>).attribute(<atag>).entities(<value>, <dim>);
```

Get all values of the attribute that exist in the current state of the geometry sequence. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).values();
```

Get all values of the attribute that exist in the finalized geometry. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).valuesFinal();
```

Get all tags of the fields of the attribute. The method returns a string array.

```
model.geom(<gtag>).attribute(<atag>).fieldTags();
```

Get the field value of a given field for a given attribute value. The method returns a string.

```
model.geom(<gtag>).attribute(<atag>).fieldValue(<attributeValue>, <fieldTag>);
```

