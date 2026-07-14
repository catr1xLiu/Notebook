# *HardwareAcceleration*

Hardware acceleration using a supported GPU for transient acoustics simulations based on the discontinuous Galerkin method.

## **SYNTAX**

```
model.sol(sname).feature(solv).create(fname,"HardwareAcceleration")
model.sol(sname).feature(solv).feature(fname).set(pname,value)
```

## **DESCRIPTION**

This feature can be used as an attribute to the Time feature to accelerate the solution time if you are simulating transient acoustics using a discontinuous Galerkin method. It requires access to a supported GPU.

The following properties are available:

TABLE 6-36: VALID HARDWARE ACCELERATION PROPERTIES

| PROPERTY           | VALUE   | DEFAULT | DESCRIPTION                                                                                        |
|--------------------|---------|---------|----------------------------------------------------------------------------------------------------|
| dgacc              | boolean | false   | Use an accelerated solver for discontinuous Galerkin.                                              |
| gpuresidual        | boolean | true    | Compute residual on GPU, if dgacc is set to true.                                                  |
| gpusingleprecision | boolean | false   | Use single precision on GPU, if gpuresidual is set<br>to true. If false, double precision is used. |

