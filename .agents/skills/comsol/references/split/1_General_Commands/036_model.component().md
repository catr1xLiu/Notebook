# *model.component()*

Model component nodes.

A component node has one of three types:

- **•** Component: Component nodes in the model builder tree have this type.
- **•** ExtraDim: Extra dimension nodes under global definitions have this type.
- **•** MeshComponent: Mesh parts nodes under global definitions have this type.

All three types are included, if present, in the list returned by model.component().

![](_page_54_Picture_9.jpeg)

The model.component syntax replaces the earlier model.modelNode syntax, which is still available for backward compatibility.

The list object returned by model.component() still has type ModelNodeList and individual components returned from model.component(*<tag>*) are of type ModelNode.

![](_page_54_Picture_12.jpeg)

Component nodes control which frames are created as individual Frame objects in the model.frame() list once a geometry is added to the component. If the defineAllFrames flag is set, all four logical frames (spatial, material, geometry, and mesh frame) are created. Otherwise a single frame object is created, representing all four logical frames.

When a model is created in the GUI, defineAllFrames is always set to true. This is required by some Moving Mesh and Deformed Geometry functionality, which otherwise becomes inaccessible. Working with a single frame object is still allowed from the API, for compatibility reasons.

#### **SYNTAX**

```
model.component().create(<tag>);
model.component().create(<tag>, <basetag>);
model.component().create(<tag>, <type>);
model.component().create(<tag>, boolean);
model.component(<tag>).defineAllFrames();
model.component(<tag>).defineAllFrames(boolean);
model.component(<tag>).getType();
model.component(<tag>).scope();
model.component(<tag>).baseSystem();
model.component(<tag>).baseSystem(<system>);
model.component(<tag>).sorder();
model.component(<tag>).sorder(<stype>);
model.component(<tag>).defineLocalCoord();
model.component(<tag>).defineLocalCoord(boolean);
model.component(<tag>).curvedInterior()
model.component(<tag>).curvedInterior(boolean)
model.component(<tag>).geometricModel();
model.component(<tag>).geometricModel(<sequencetag>);
model.component(<tag>).measure().measurementMethod;
```

#### **DESCRIPTION**

model.component(*<tag>*) represents a component node in the model tree.

model.component().create(*<tag>*) creates a component node of type Component with the given tag and defineAllFrames set to false.

model.component().create(*<tag>*,*<type>*) creates a component node with the tag *<tag>* of one of the following types, set as the string *<type>*: Component, for a normal geometry component; ExtraDim, for an extra dimension; or MeshComponent, for a mesh component. For example, to create a mesh component:

```
model.component().create("mcomp1", "MeshComponent");
model.component("mcomp1").geom().create("mgeom1", 3);
model.component("mcomp1").mesh().create("mpart1", "mgeom1");
```

The defineAllFrames flag is set to false.

model.component().create(*<tag>*, boolean) creates a model component node of type Component with the specified value of the defineAllFrames flag.

model.component(*<tag>*).defineAllFrames() returns the current value of the defineAllFrames flag.

model.component(*<tag>*).defineAllFrames(boolean) sets the defineAllFrames flag controlling whether all four logical frames (spatial, material, geometry, and mesh frame) should be created as separate Frame objects in model.frame() when a geometry is added to the component.

model.component(*<tag>*).getType() returns the type of component that the component with the tag *<tag>* is an instance of: Component, for a normal model component; ExtraDim for an extra dimension component; and MeshComponent for a mesh component.

model.component(*<tag>*).scope() returns the fully qualified scope name.

model.component(*<tag>*).baseSystem(*<system>*) use the given base system as unit system for the component node. This overrides the global unit system specified for the entire model object. To use global system again, set the base system of the component node to null.

model.component(*<tag>*).sorder() returns the geometry shape function used for the component node and its descendants.

model.component(*<tag>*).sorder(*<stype>*) sets the geometry shape function. Allowed values are automatic (the default), linear, quadratic, cubic, quartic, quintic, sextic, septic, linear\_serp, quadratic\_serp, cubic\_serp, and quartic\_serp (the latter four values represent serendipity elements). With an automatic shape function, the physics interfaces under the component node decide the most optimum shape function. The shape function set here is also used for the discretization of the mesh displacement when using ALE functionality.

model.component(*<tag>*).defineLocalCoord() returns true if element local coordinate variables exist. By default, this is the case.

model.component(*<tag>*)).defineLocalCoord(boolean) sets a flag that determines whether element local coordinate variables exist.

model.component(*<tag>*).curvedInterior() returns true if curved interior mesh is activated in the component.

model.component(*<tag>*).curvedInterior(boolean) sets the curved interior mesh setting in the component. If true, the interior domain mesh elements can be curved to avoid inverted elements.

model.component(*<tag>*).geometricModel() returns the component's geometric model on which the physics is defined. The returned tag is prefixed with geom/ or mesh/ to indicate if it is a geometry or mesh.

model.component(*<tag>*).geometricModel(*<sequencetag>*) specifies the geometric model used in the component. Enter the tag for the geometry or meshing sequence *<sequencetag>* to be specified as the component's geometric model. Use the prefix /geom or /mesh if the tag only is ambiguous. Only meshing sequences that define their own geometric models can be specified as the component's geometric model. For more information, see Geometric Model.

model.component(<tag>).measure().*measurementMethod* returns the volume, area, length, vertex coordinates, average coordinates, or distance between two vertices according to the entity selection. For a list of the available measurement methods to use, see Measurement Methods. The measurements are done on the finalized geometry or mesh that defines the component's geometric model. See Geometric Model for more information. For information about how to select entities, see Selections.

