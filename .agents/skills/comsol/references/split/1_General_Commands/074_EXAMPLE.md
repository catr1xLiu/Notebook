# **EXAMPLE**

Define a global equations with the variables *u* and *w*, the ODEs *ut* + 1 = 0 and *vt* + 1 = 0, where the subscript *t* indicates the derivative with respect to time. Also define a weak expression test(*u*)·*v*.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.ode().create("ode1");
  model.ode("ode1").ode("u","ut+1");
  model.ode("ode1").ode("v","vt-1");
  model.ode("ode1").weak(new String[]{"test(u)*v"});
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.ode.create('ode1');
  model.ode('ode1').ode('u','ut+1');
  model.ode('ode1').ode('v','vt-1');
  model.ode('ode1').weak({'test(u)*v'});
SEE ALSO
model.init(), model.solverEvent()
```

Optimization interface.

#### **SYNTAX**

```
model.opt().objective().create(<tag>,type)
model.opt().objective(<tag>).set(property,<value>)
model.opt().constr().create(<tag>)
model.opt().constr(<tag>).etc
model.opt().gconstr().create(<tag>)
model.opt().gconstr(<tag>).constr(<constrExpr>)
model.opt().gconstr(<tag>).lbound(<lboundExpr>)
model.opt().gconstr(<tag>).ubound(<uboundExpr>)
```

## **DESCRIPTION**

The purpose of model.opt is to manage information relating to optimization and sensitivity analysis. Most of the fields under model.opt are read and interpreted directly by the optimization and sensitivity solvers. They never affect the result of other solvers.

model.opt().objective().create(*<tag>*,*type*) adds an objective function of the specified type. The supported types are Global and LeastSquares.

model.opt().objective(*<tag>*).set(property,*<value>*) sets an objective function property. Objective functions of type Global support the single property expr, which takes a globally defined expression as value. Allowed properties for objectives of type LeastSquares are described below.

model.opt().objective(*<tag>*).selection().named(*<seltag>*) assigns the objective function to the named selection *<seltag>*.

model.opt().objective(*<tag>*).selection().set(...) defines a local selection that assigns the objective function to geometric entities. For a complete list of methods available under selection(), see model.selection(). Only objective functions of type LeastSquares require a selection. See further below.

model.opt().constr().create(*<tag>*) adds a pointwise (mesh-based) constraint on the control variables. The syntax is shared with model.constr() with the exception that the ctype parameter expects values constr, lbound, and ubound for constraint, lower bound, and upper bound, respectively.

model.opt().gconstr().create(*<tag>*) registers a global constraint with the optimization solvers. Such constraints consist of a globally available expression, which can depend both on optimization variables and on the forward PDE solution, together with likewise global expressions for lower and upper bound.

```
model.opt().gconstr(<tag>).constr(<constrExpr>) specifies a global constraint expression.
```

```
model.opt().gconstr(<tag>).lbound(<lboundExpr>) sets lower bound for the constraint.
```

model.opt().gconstr(*<tag>*).ubound(*<lboundExpr>*) sets upper bound for the constraint.

Least-squares objective functions are specified in terms of measured values, stored on file, together with information about how corresponding expressions can be evaluated for the current control variable values. An overview of the allowed properties is given in the table below.

TABLE 2-107: PROPERTIES FOR OBJECTIVE FUNCTION TYPE LEASTSQUARES.

| PROPERTY           | VALUE        | DESCRIPTION                             |
|--------------------|--------------|-----------------------------------------|
| filename           | String       | Full path of the measurement data file. |
| paramnames         | String array | Parameters used in the experiment.      |
| paramexprs         | String array | Values of the given parameters.         |
| columntypes        | String array | List of column type indicators.         |
| columnexprsweights | String array | Column contribution weights.            |
| columnexprs        | String array | Measurement expressions.                |

In principle, you must specify the following for each measured value:

- **•** To which experiment the value belongs and parameters for that experiment
- **•** Which expression to evaluate
- **•** Where the expression must be evaluated
- **•** For which time or parameter value the evaluation must be performed

Each *experiment* corresponds to a solution of the forward problem with a given set of parameter values. In practice, measurements for each experiment must be stored in a separate file, and specified as a separate LeastSquares objective feature where you give the full path of the measurement data file in the filename property. Parameters specified in the paramnames property are given the values specified using paramexprs property during the forward solution. One forward solution is performed for each unique set of parameter names and values.

The required measurement data file format is row- and column-oriented. Entries on each row must be separated by commas or semicolons, while rows are separated by line feeds. Use the columntypes property to specify the content of each column, in the order that they appear in the data file, according to the following table:

TABLE 2-108: ALLOWED COLUMN TYPES.

| TYPE  | COLUMN CONTENTS                |
|-------|--------------------------------|
| time  | Actual measurement times       |
| param | Actual parameter values        |
| coord | Actual measurement coordinates |
| value | Measured values                |
| none  | Ignored column                 |

Columns of type time are only allowed for transient problems. The measurements on the same row are assumed to be made at the specified time. Forward model values are interpolated to the given times. There must only be one column of type time, and it requires no further parameters.

Columns of type param contain parameter values for which the measurements on the same row have been made, and for which the forward problem must be solved. A data file can contain multiple parameter columns. Corresponding parameter names must be given in the columnnames property.

Columns of type coord contain global coordinates where the measurements on the same row have been made. The coordinate columns must be coupled to a coordinate variable by specifying the coordinate variable name in the columnnames property for the given column and the frame tag spatial, material, mesh, or geometry in the

columnexprs property. For example, in a 3D model, you need three columns of type coord with columnnames entries x, y, and z, respectively.

A value column contains measured data. For each value column, a corresponding expression to be evaluated must be specified in the columnexprs property. Entries in value columns are interpreted as real numbers when possible. Anything else, including for example hash marks (#) and the literal strings nan, Nan, NaN, and NAN is interpreted as an illegal value which is excluded from the least squares objective function evaluation. A weight for the objective contribution from a column, multiplying the squared difference between the measured value and the expression, can be specified as a positive globally expression that can be evaluated using the columnexprsweights property. To exclude a measurement from a comma-separated file, you can also simply leave a value column empty.

Columns of type none can be used to exclude columns from the data file.

Coordinates are interpreted as global in the context of the objective feature's selection. This means that the value column expressions are evaluated at the points within the selection that best match the given coordinates. If the interpolation fails for some point because its coordinates lie too far outside the selection, the corresponding value is ignored.

