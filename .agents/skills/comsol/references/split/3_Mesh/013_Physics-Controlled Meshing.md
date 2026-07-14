# Physics-Controlled Meshing

![](_page_10_Picture_1.jpeg)

When a physics-controlled sequence is built, a sequence of ordinary meshing features is created. This sequence can be customized by editing these features. However, do not assume the existence of a certain feature in a Java program designed to run with future versions of COMSOL Multiphysics. The actual contents of the sequence might change.

A physics-controlled meshing sequence examines the physics to automatically determine size attributes and sequence operations needed to create a mesh adapted to the geometry and the problem. The physics-controlled sequence is based on heuristics and knowledge built-in by mesh and application experts. It is not adapted by numerical error estimates — that type of adaptation is provided by mesh adaptation in the solver sequence.

When a mesh is built or a problem solved, the physics-controlled sequence is updated to match the currently active physics. If the sequence is in any other state than physics-controlled, it is not updated or modified before it is built.

By default, a meshing sequence is in the physics-controlled state. If you manually add a feature to the sequence or edit a feature, the sequence automatically switches to the user-controlled state. It is also possible to explicitly switch to user-controlled state by entering

```
model.component(<ctag>).mesh(<tag>).automatic(false);
```

To switch back to physics-controlled mesh, enter

```
model.component(<ctag>).mesh(<tag>).automatic(true);
```

The current sequence is then modified or overwritten next time the sequence is built or the problem is solved.

Use model.component(*<ctag>*).mesh(*<tag>*).isAutomatic() to determine in which state the sequence is.

You can adjust the overall size of a physics-induced mesh by using the method

```
model.component(<ctag>).mesh(<tag>).autoMeshSize(<size>);
```

The value 5 of *<size>* corresponds to the default size, the values 4, 3, 2, and 1 give you an increasingly finer mesh, whereas the values 6, 7, 8, and 9 give you a coarser mesh. The method model.component(*<ctag>*).mesh(*<tag>*).autoMeshSize() returns the current size adjustment.

## *Geometric Analysis, Detail Size Contribution*

Use the method below to control if the geometric analysis will contribute to the physics-controlled mesh.

```
model.component(<ctag>).mesh(<tag>).contribute("geom/detail",<contribute>);
```

## *Selecting Contributing Physics*

You can control which physics interface that contributes to the physics-controlled mesh using

```
model.component(<ctag>).mesh(<tag>).contribute(<interface>,<contribute>);
```

The argument contribute (true or false) value is used to specify if the interface contributes or not.

The interface can be a physics interface, a multiphysics coupling, or a common feature, specified according to the following table:

TABLE 4-3: INTERFACE TYPES.

| TYPE                  | INTERFACE SPECIFICATION            | EXAMPLE           |
|-----------------------|------------------------------------|-------------------|
| Physics interface     | <tag> or physics/<tag></tag></tag> | ht                |
| Multiphysics coupling | multiphysics/ <tag></tag>          | multiphysics/emb1 |
| Common feature        | common/ <tag></tag>                | common/free1      |

To check if an interface is currently contributing to the physics controlled mesh, use

```
model.component(<ctag>).mesh(<tag>).contributing(<interface>);
```

The following code shows some examples of how to use these methods, assuming there is a Heat Transfer interface tagged ht and an Electromagnetic Heating multiphysics coupling tagged emh1:

```
model.component(<ctag>).mesh("mesh1").contribute("ht", false);
model.component(<ctag>).mesh("mesh1").contribute("multiphysics/emh1", true);
boolean isActivated = model.component(<ctag>).mesh("mesh1").contributing("ht");
```

