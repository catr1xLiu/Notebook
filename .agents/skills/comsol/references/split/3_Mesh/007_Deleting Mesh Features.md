# *Deleting Mesh Features*

To delete a feature, enter

```
model.component(<ctag>).mesh(<tag>).feature().remove(<ftag>);
```

## *Disabling Mesh Features*

To disable a feature, enter

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).active(false);
```

To enable a disabled feature, enter

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).active(true);
```

You can get the enabled/disabled status of a feature by entering

```
boolean isEnabled = model.component(<ctag>).mesh(<tag>).feature(<ftag>).active();
```

## *Clearing Meshes*

To clear the built mesh of a sequence while keeping all features and settings in the sequence, enter

```
model.component(<ctag>).mesh(<tag>).clearMesh();
```

To clear the built mesh and remove all features in a sequence, enter

```
model.component(<ctag>).mesh(<tag>).feature().clear();
```

To clear all built meshes in a component while keeping all features and settings in the sequences, enter

```
model.component(<ctag>).mesh().clearMeshes();
```

To clear all built meshes in a model while keeping all features and settings in the sequences, enter

```
model.mesh().clearMeshes();
```

Lock a mesh to make it independent of any other data in the model. Locking a mesh is useful if you, for example, want to keep an adapted mesh but need to clear the solution data that generated the adapted mesh. To lock a mesh, enter

```
model.component(<ctag>).mesh(<tag>).lockMesh();
You can examine the status of a mesh by entering
  boolean locked = model.component(<ctag>).mesh(<tag>).isLocked();
Use the command
  model.component(<ctag>).mesh(<tag>).geometricModel("");
```

to disconnect the mesh from the geometry. See the section Geometric Model for more information.

