# **DESCRIPTION**

```
model.frame().create(<tag>,<gtag>) creates a new frame and assigns it to geometry <gtag>.
```

model.frame(*<tag>*).coord(*<coordlist>*) defines *<coordlist>* as a list of independent variables. (Formerly sdim.)

model.frame(*<tag>*).coord(*<pos>*,*<coord>*) edits the coordinate at position *<pos>* in the coordinate list.

model.frame(*<tag>*).meshFrame() sets this frame to be the mesh frame. Each geometry requires exactly one mesh frame. The first one added becomes the mesh frame. When assigning one frame to be the mesh frame, this flag is cleared in the previous frame being the mesh frame.

model.frame(*<tag>*).geometryFrame() sets this frame to be the geometry frame. Each geometry requires exactly one geometry frame. The first one added becomes the geometry frame. When assigning one frame to be the geometry frame, this flag is cleared in the previous frame being the geometry frame.

model.frame(*<tag>*).materialFrame() sets this frame to be the material frame. Each geometry requires exactly one material frame. The first one added becomes the material frame. When assigning one frame to be the material frame, this flag is cleared in the previous frame being the material frame.

model.frame(*<tag>*).spatialFrame() sets this frame to be the spatial frame. Each geometry requires exactly one spatial frame. The first one added becomes the spatial frame. When assigning one frame to be the spatial frame, this flag is cleared in the previous frame being the spatial frame.

model.frame(*<tag>*).sshape().create(*<stag>*,*type*) creates a frame feature of the given type. Possible types are fixed (default), moving\_abs, moving\_rel, and moving\_expr.

model.frame(*<tag>*).sshape(*<stag>*).type(*type*) sets the type of the frame feature.

model.frame(*<tag>*).sshape(*<stag>*).sorder(*order*) sets the geometry shape function for *<stag>* to *order*.

model.frame(*<tag>*).sshape(*<stag>*).coorddof(*<dofs>*) sets the spatial coordinates for *<stag>* when the moving\_rel type is used.

model.frame(*<tag>*).sshape(*<stag>*).coorddof(*<pos>*,*<dof>*) edits the coordinate name at position *<pos>* in the degree of freedom list.

model.frame(*<tag>*).sshape(*<stag>*).refframe(*<ftag>*) sets the reference frame for *<stag>* when the moving\_rel type is used.

model.frame(*<tag>*).sshape(*<stag>*).coordexpr(*<exprs>*) sets the expressions for the mesh displacement for *<stag>*.

model.frame(*<tag>*).sshape(*<stag>*).coordexpr(*<pos>*,*<expr>*) edits the expression at position *<pos>* in the expression list.

model.frame(*<tag>*).sshape(*<stag>*).selection().named(*<seltag>*) assigns the frame feature to the named selection *<seltag>*.

model.frame(*<tag>*).sshape(*<stag>*).selection().set(...) defines a local selection that assigns the frame feature to geometric entities. For a complete list of methods available under selection(), see

model.selection(). All types of selections are supported except the global one and selections containing interior mesh boundaries.

model.frame(*<tag>*).coord() returns the coordinate names as a string array.

model.frame(*<tag>*).identifier() returns the frame's identifier as a string.

model.frame(*<tag>*).varNameSuffix() returns the variable name suffix as a string.

model.frame(*<tag>*).geom() returns the geometry name as a string.

model.frame(*<tag>*).isMeshFrame() returns true if this frame is the mesh frame.

model.frame(*<tag>*).isGeometryFrame() returns true if this frame is the geometry frame.

model.frame(*<tag>*).isMaterialFrame() returns true if this frame is the material frame.

```
model.frame(<tag>).isSpatialFrame() returns true if this frame is the spatial frame.
model.frame(<tag>).sshape(<stag>).type() returns the type as a string.
model.frame(<tag>).sshape(<stag>).sorder() returns the spatial approximation order as an integer.
model.frame(<tag>).sshape(<stag>).coorddof() returns the spatial coordinates as a string array.
model.frame(<tag>).sshape(<stag>).refframe() returns the reference frame as a string.
model.frame(<tag>).sshape(<stag>).coordexpr() returns the spatial coordinate expressions as a string 
array.
model.frame(<tag>).sshape(<stag>).selection().named() returns the named selection tag.
model.frame(<tag>).sshape(<stag>).selection().getType() returns domain information. For available 
methods, see model.selection().
SEE ALSO
model.shape()
model.func()
```

Add different types of functions.

#### **SYNTAX**

```
model.func().create(<tag>,<type>);
model.func(<tag>).create(<tag>,<type>);
model.func(<tag>).createPlot(<pgtag>)
model.func(<tag>).label(<label>)
model.func(<tag>).model(<mtag>)
model.func(<tag>).set(property,<value>);
model.func(<tag>).set("funcname",<funcname>)
model.func(<tag>).discardData()
model.func(<tag>).importData()
model.func(<tag>).refresh()
model.func(<tag>).image()
model.func(<tag>).run()
model.func(<tag>).model()
model.func(<tag>).getType(property);
model.func(<tag>).functionNames()
```

#### **DESCRIPTION**

model.func().create(*<tag>*,*<type>*) creates a new function of type *<type>* with the tag *<tag>*. The types can be one of the following strings: Analytic, Interpolation, Piecewise, GaussianPulse, Ramp, Rectangle, Step, Triangle, Wave, NormalDistribution, Random, External, MATLAB (requires LiveLink™ *for* MATLAB®), Elevation, Image, LeastSquares, GaussianProcess (requires the Uncertainty Quantification Module to create and train but not to use a created and trained function), PolynomialChaosExpansion (requires the Uncertainty Quantification Module to create and train but not to use a created and trained function), DNN, and PartialFractionFit. In addition, model.create(*<tag>*,"FunctionSwitch") creates a function switch. You can add other functions to a function switch:

```
model.func().create("sw1", "FunctionSwitch");
model.func("sw1").create("int1", "Interpolation");
model.func("sw1").create("an1", "Analytic");
model.func("sw1").create("rn1", "Random");
```

Use model.func("sw1").set("definecases", true); to instantiate all functions for all cases in a function sweep. By default, not all of them are instantiated.

model.func(*<tag>*).createPlot(*<pgtag>*) creates a plot group with the tag *pgtag* with a plot of the function. The method returns the plot group.

model.func(*<tag>*).label(*<label>*) sets a label for the function.

model.func(*<tag>*).model(*<mtag>*) sets the model component node of the function.

model.func(*<tag>*).set(*property*,*<value>*) sets the value of a property of the function. See the available properties for each type of function below.

model.func(*<tag>*).set("funcname",*<funcname>*) sets the operator name of the function. The default operator name is *<tag>*.

model.func(*<tag>*).model() returns the model component node tag.

model.func(*<tag>*).get*Type*(*property*) retrieves a value of a function property.

model.func(*<tag>*).importData() imports the file that the function references into the model. This is possible for interpolation, elevation, and image functions. The importData() method also works for some physics features.

model.func(*<tag>*).discardData() discards the data imported with importData(). This is possible for interpolation, elevation, and image functions. The discardData() method also works for some physics features.

model.func(*<tag>*).refresh() reevaluates the file for functions that read files (Elevation, Image, and Interpolation).

Use the model.func(<tag>).image() methods for plotting and exporting images showing plots of the functions. See Plotting and Exporting Images.

model.func(<tag).run() performs optimization or training for functions that need to process their input data before they can be evaluated (Least-Squares Fit, Gaussian Process, Polynomial Chaos Expansion, and DNN).

model.func(*<tag>*).functionNames() returns an array containing the function names that the function feature defines. Most functions always return an array of length one, but interpolation function features, for example, can define an arbitrary number of function names.

Function features can have associated problem features. To access the list of problem features for a function feature, use:

```
model.func(<tag>).problem();
```

To access a specific problem feature, use:

```
model.func(<tag>).problem(<problem_tag>);
```

![](_page_83_Picture_17.jpeg)

For functions on the component level, use the same syntax but add the component level, such as model.component(*<ctag>*).func().create(*<tag>*,*<type>*)

![](_page_83_Picture_19.jpeg)

When using a local table the interpolation function uses the funcname property to set the function name. When the data comes from a file or a result table, the name is specified in the funcs string matrix property. This is necessary because there can be more than one function.

What properties that are available depends on the type of function. The following function types are available:

