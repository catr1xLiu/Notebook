# *CompositeDomains*

Form composite domains.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"CompositeDomains");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"CompositeDomains") to form composite domains.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the domains to composite. The default selection is empty.

The feature forms a composite domain for each connected domain component of the selected domains by ignoring the boundaries between the domains. The output object is a virtual geometry.

The following properties are available:

TABLE 3-48: VALID PROPERTIES.

| NAME        | VALUE     | DEFAULT<br>DESCRIPTION |                                                  |
|-------------|-----------|------------------------|--------------------------------------------------|
| ignoreadj   | on   off  | on                     | Ignore edges (3D only) and vertices on boundary. |
| input       | Selection |                        | Edges to composite.                              |
| keepformesh | on   off  | off                    | Keep input domains for mesh control.             |

Use ignoreadj to specify if the feature also removes the ignorable edges (3D only) and vertices on the boundary of each resulting composite domain.

Use keepformesh to keep the input domains while meshing, to help you in constructing the mesh.

## **EXAMPLE**

Create a composite domain of domain 2 and 3.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  GeomSequence g = model.component("comp1").geom().create("geom", 2);
  g.create("r1", "Rectangle");
  g.create("c1", "Circle");
  g.run("fin");
  g.create("cmd1","CompositeDomains");
  g.feature("cmd1").selection("input").set("fin", 2, 3);
  g.run();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  g = model.component('comp1').geom.create('geom', 2);
  g.create('r1', 'Rectangle');
  g.create('c1', 'Circle');
  g.run('fin');
  g.create('cmd1','CompositeDomains');
  g.feature('cmd1').selection('input').set('fin', 2, 3);
  g.run;
```

