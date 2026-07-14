# *Geometry Representation in 3D and for Boolean Operations*

This settings is only relevant if you have a license for the CAD Import Module. The geometry representation determines which kernel (geometric modeler) that COMSOL uses to represent and operate on the geometry objects: the CAD Import Module's kernel (Parasolid) or COMSOL's own kernel. To change the geometry representation, enter

```
model.component(<ctag>).geom(<tag>).geomrep(newGeomRep);
where newGeomRep is comsol or cadps.
```

- **•** If you choose cadps, all objects and operations that support the CAD kernel (Parasolid kernel) use it. For example, the Work Plane, Extrude, and Revolve features currently do not support this kernel.
- **•** If you choose comsol, all objects are represented using the COMSOL kernel.

When you change the geometry representation, all nodes that support the CAD kernel get an *edited* status. To rebuild the geometry using the new kernel, use the run method.

To get the geometry representation of the geometry sequence *<tag>*, enter

```
model.component(<ctag>).geom(<tag>).geomrep();
```

When you create a new model (application), its default geometry representation is controlled by the preference setting **Geometry>Geometry representation>In new applications** (geometry.geomrep.default). To change or read this preference setting, enter

```
ModelUtil.setDefaultGeometryKernel(defaultGeomRep);
  ModelUtil.getDefaultGeometryKernel();
where defaultGeomRep is cadps or comsol.
```

When you open an existing model, you normally use the geometry representation used in the model. To always convert the geometry to the COMSOL kernel, change the preference setting **Geometry>Geometry representation> When opening an existing application** to **Convert to COMSOL kernel** (geometry.geomrep.open). To change or read this preference setting, enter

```
ModelUtil.setOpenGeometryKernel(openGeomRep);
ModelUtil.getOpenGeometryKernel();
```

where *openGeomRep* is model or comsol.

#### **USING THE DESIGN MODULE BOOLEAN OPERATIONS**

When you use the CAD kernel in 3D and the license includes the Design Module, you can use the Boolean operations from the Deign Module kernel (Parasolid kernel) by entering

```
model.component(<ctag>).geom(<tag>).designBooleans(true);
```

The default setting for Design Module Boolean operations is controlled by the preference setting **Geometry>Design Module Boolean operations>Use in new models**.

