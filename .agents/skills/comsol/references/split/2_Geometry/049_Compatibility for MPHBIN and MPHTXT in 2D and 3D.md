# *Compatibility for MPHBIN and MPHTXT in 2D and 3D*

If you want to open a COMSOL Multiphysics geometry file in an earlier versions of COMSOL Multiphysics, you might need to set the COMSOL Multiphysics version using

```
model.component(<ctag>).geom(<tag>).export().setCompat(<ver>);
where <ver> is a string 4.0 (only 3D), 4.0a (only 3D), 4.2a, 4.3b, 5.1, or 5.5.
```

