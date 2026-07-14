# *model.multiphysics()*

Add multiphysics features to this feature container.

#### **SYNTAX**

```
model.multiphysics().create(<tag>,...);
model.multiphysics().image()
```

## **DESCRIPTION**

model.multiphysics().create(*<tag>*,*<coupling>*,*<geom>*,*<sdim>*); adds a multiphysics coupling with the tag and the name to a geometry and a space dimension. Use -1 as the space dimension to indicate a coupling valid in the entire model.

#### **EXAMPLE**

In a model with a Solid Mechanics interface and a Heat Transfer in Solids interface, add a Thermal Expansion multiphysics coupling on the domain level and a Temperature Coupling on a model-wide level in a geometry geom1:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom.create("geom1", 3);
  model.multiphysics().create("te1","ThermalExpansion","geom1",3);
  model.multiphysics().create("tc1","TemperatureCoupling","geom1",-1);
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 3);
  model.multiphysics.create('te1','ThermalExpansion','geom1',3);
  model.multiphysics.create('tc1','TemperatureCoupling','geom1',-1);
model.nodeGroup()
```

Node groups.

You can create node groups to structure the nodes in the model tree. It can be useful in this context when editing a Model Java-file created in the COMSOL Desktop and then opens it in the COMSOL Desktop again. It can also be useful in model methods.

#### **SYNTAX**

```
model.nodeGroup().create(<tag>,<type>);
model.nodeGroup().create(<tag>,<type>,<context>);
model.nodeGroup(<tag>).add(<nodetag>);
model.nodeGroup(<tag>).add(<parenttag>,<nodetag>);
model.nodeGroup().ungroup(<tag>);
```

There is also a component list model.component("comp1").nodeGroup() with the groups belonging to a component.

## **DESCRIPTION**

```
model.nodeGroup(<tag>) represents a node group in the model tree.
model.nodeGroup().create(<tag>,<type>) creates a node group of the specified type. For example,
  model.nodeGroup().create("grp1", "GlobalDefinitions");
creates a node group with the tag "grp1" under the Global Definitions node in the model tree.
model.nodeGroup().create(<tag>,<type>,<context>) creates a group of the specified type in the specified 
context. For example,
  model.nodeGroup().create("g", "Geometry", "geom1")
creates a group in a geometry sequence.
```

Use model.nodeGroup().ungroup(*<tag>*) to ungroup (remove) a group. Removing the group does not remove its members from the model.

For a node group, the following methods are available:

- **•** Use nodeGroup.add(*<type>*,*<tag>*) to add a node with the tag *<tag>* of the type *<type>* to the group. For example group.add("func", "an1") adds model.func("an1") to the group.
- **•** Use nodeGroup.remove(*<type>*,*<tag>*) to remove a node with the tag *<tag>* of the type *<type>* from the group.

## **EXAMPLE**

The following example creates a node group under Definitions in a Component, adds two Model Input features to it, and then removes it by the ungroup method:

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1", true);
  model.component("comp1").geom().create("geom1", 3);
  model.component("comp1").common().create("minpt1", "CommonInputDef");
  model.component("comp1").common().create("minpt2", "CommonInputDef");
  model.nodeGroup().create("grp1", "Definitions", "comp1");
  model.nodeGroup("grp1").set("type", "commondef");
  model.nodeGroup("grp1").add("common", "minpt1");
  model.nodeGroup("grp1").add("common", "minpt2");
  model.nodeGroup().ungroup("grp1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1',true);
  model.component('comp1').geom.create('geom1',3);
  model.component('comp1').common.create('minpt1','CommonInputDef');
  model.component('comp1').common().create('minpt2', 'CommonInputDef');
  model.nodeGroup.create('grp1','Definitions','comp1');
  model.nodeGroup('grp1').set('type','commondef');
  model.nodeGroup('grp1').add('common','minpt1');
  model.nodeGroup('grp1').add('common','minpt2');
  model.nodeGroup.ungroup('grp1');
```

Create global equations (ODEs and DAEs).

#### **SYNTAX**

*model.ode()*

```
model.ode().create(<tag>);
model.ode(<tag>).state(<statelist>);
model.ode(<tag>).state(<pos>,<state>);
model.ode(<tag>).ode(<state>,<equation>);
model.ode(<tag>).descr(<state>,<descr>);
model.ode(<tag>).weak(<wlist>);
model.ode(<tag>).weak(<pos>,<wexpr>);
model.ode(<tag>).discrete(<boolean>);
model.ode(<tag>).valueType(prop);
model.ode(<tag>).state();
model.ode(<tag>).ode(<state>);
model.ode(<tag>).descr(<state>);
model.ode(<tag>).weak();
model.ode(<tag>).discrete();
model.ode(<tag>).valueType();
```

