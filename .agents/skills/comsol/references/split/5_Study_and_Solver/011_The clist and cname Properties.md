# *The clist and cname Properties*

The cname property is a string array where you provide names of constants as input parameters. The clist property is a string array where you provide values for constants as input parameters. The clist array must have the same length as the cname array. These constants overrule any previous definition (for example, from Global Definitions). Each string is evaluated as a list of values. This means, for example, that the range() operator, units, and global expressions are supported. The first entry in each of these lists will be used to temporarily set the corresponding parameter as given by cname. This parameter can be a new or an existing global parameter. The constant is temporary in the sense that it is only defined during the solver run. It cannot be evaluated during postprocessing; in fact, it will be unknown if it is not an existing global parameter, and it will use its default value if it is. This is similar to other solver parameters, like t and timestep, behave.

For example, a "bootstrapped" definition like

```
"cname" = {"foo", "bar"}
"clist" = {"5", "foo+2"}
```

also works, but in the COMSOL Desktop you will get an error about "foo" for not being recognized in the evaluation context. And if you use a circular dependency like

```
"cname" = {"foo", "bar"}
"clist" ={"bar", "foo+2"}
```

you will get warnings about this if the parameters are used, and the evaluation will be NaN (not-a-number).

If "a" and "b" are already defined as global parameters and, say, b=a+1; then redefining "a" to a new value through cname and clist leads to the value for "b" being redefined (correctly).

You cannot override parameters used in the following parts of the model:

- **•** Mesh and geometry
- **•** Selections
- **•** Probes
- **•** Functions
- **•** Materials
- **•** Pairs
- **•** Solver sequences
- **•** Parameter-dependent lists

Also, the Parametric and Time Dependent solvers overrule any definition of solver constants.

Constants settings for a solver node do not carry over to postprocessing.

Some examples of when it can be useful to define constants for a solver:

- **•** When doing more advanced solver sequences, where constants need to be changed between calls (for example, in for-loops).
- **•** When you do not want to change the global definition of a parameter or when you cannot or do not want to use a Parametric Solver feature.

When you want to define auxiliary parameters that are part of the equations like CFLCMP or niterCMP and where the solver does not define these parameters.

