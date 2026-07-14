# *Reinitialization*

When an event is triggered, any degree of freedom can be reinitialized. This typically means that they get a new value. You specify these values with a reinitialization method, reinit(...), which has the same syntax as model.init(...) .

model.solverEvent(*<tag>*).reinit().create(*<tag>*) adds a new reinit feature to the event. In most cases you only need one, but you need more when you have reinitialization conditions on several geometric entity levels, for example on a global selection and a domain selection.

*Event State Variables*

An event needs state variables in most cases. There are discrete states and indicator states. Discrete states are just ODE states that only change during reinitialization, and can only have a zero-valued equation (or no equation). The indicator states are needed for implicit events and are ODE states with nonzero equations.

model.ode().create(*<tag>*).type(*<ode type>*) creates a new global equation that contains event state variables if you set the ode type to discrete for discrete states and quadrature for indicator states.

model.ode(*<tag>*).state(*<states>*) adds a new discrete states to the global equation.

model.ode(*<tag>*).ode(*<state>,*"sin(2\*pi\*t)") adds a new indicator state and its right-hand side to the global equation. The left-hand side of the equation is the state variable, so the full equation for the indicator state becomes nojac(sin(2\*pi\*t))-*<state>*.

model.solverEvent(<tag>).useConsistentInit(isConsistent) controls how consistency is enforced after reinitialization. If isConsistent = 0 for all of the triggered events, then consistency will not be enforced after reinitialization. If isConsistent = 1 for at least one of the triggered events and Time.consistent = bweuler (see Table 6-74), then consistency is enforced using an artificial step with the backward Euler method. See About the Reinitialization Process in the *COMSOL Reference Manual* for additional details. The solver log indicates whether and how consistency has been enforced after each reinitialization.

#### **EXAMPLE**

Example of an idealized bouncing ball using implicit events.

```
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.study().create("std1");
  model.study("std1").create("time1", "Transient");
  model.study("std1").feature("time1").set("tlist", "0 10");
  model.study("std1").feature("time1").set("rtol", 1e-6);// Nondiscrete states
  model.ode().create("ode1");
  model.ode("ode1").ode("y", "-2*y-ytt");
  model.init().create("ode1");
  model.init("ode1").selection().global();
  model.init("ode1").set("y", "1");
  // Discrete states
  model.ode().create("ode2").type("quadrature");
  model.ode("ode2").ode("z1", "y");
  // Implicit event
  model.solverEvent().create("impl1", "Implicit");
  model.solverEvent("impl1").condition("!(z1>=0)");
  model.solverEvent("impl1").reinit().create("reinit");
  model.solverEvent("impl1").reinit("reinit").selection().global();
  model.solverEvent("impl1").reinit("reinit").set("y", "y");
  // Bounce reverts velocity
  model.solverEvent("impl1").reinit("reinit").set("yt", "-yt");
  model.sol().create("sol1");
  model.sol("sol1").createAutoSequence("std1");
  // Special solver settings for events
  model.sol("sol1").feature("t1").set("tout", "tsteps");
  model.sol("sol1").feature("t1").set("atolglobal", "1e-6");
  model.sol("sol1").feature("t1").set("initialstepbdfactive", "on");
  model.sol("sol1").feature("t1").set("initialstepbdf", "1e-6");
  model.sol("sol1").feature("t1").set("eventtol", "2e-6");
  model.sol("sol1").feature("t1").set("ewtrescale", "off");
  model.sol("sol1").runAll();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.study.create('std1');
```

```
model.study('std1').create('time1', 'Transient');
  model.study('std1').feature('time1').set('tlist', '0 10');
  model.study('std1').feature('time1').set('rtol', 1e-6);
  % Nondiscrete states
  model.ode.create('ode1');
  model.ode('ode1').ode('y', '-2*y-ytt');
  model.init.create('ode1');
  model.init('ode1').selection().global();
  model.init('ode1').set('y', '1');
  % Discrete states
  model.ode.create('ode2').type('quadrature');
  model.ode('ode2').ode('z1', 'y');
  % Implicit event
  model.solverEvent.create('impl1', 'Implicit');
  model.solverEvent('impl1').condition('!(z1>=0)');
  model.solverEvent('impl1').reinit().create('reinit');
  model.solverEvent('impl1').reinit('reinit').selection().global();
  model.solverEvent('impl1').reinit('reinit').set('y', 'y');
  % Bounce reverts velocity
  model.solverEvent('impl1').reinit('reinit').set('yt', '-yt');
  model.sol().create('sol1');
  model.sol('sol1').createAutoSequence('std1');
  % Special solver settings for events
  model.sol('sol1').feature('t1').set('tout', 'tsteps');
  model.sol('sol1').feature('t1').set('atolglobal', '1e-6');
  model.sol('sol1').feature('t1').set('initialstepbdfactive', 'on');
  model.sol('sol1').feature('t1').set('initialstepbdf', '1e-6');
  model.sol('sol1').feature('t1').set('eventtol', '2e-6');
  model.sol('sol1').feature('t1').set('ewtrescale', 'off');
  model.sol('sol1').runAll;
SEE ALSO
model.ode(), model.init()
model.study()
```

Create and define studies.

#### **SYNTAX**

```
model.study().create(<tag>);
model.study(<tag>).create(<ftag>,type);
model.study(<tag>).feature().move(<ftag>,position);
model.study(<tag>).run([<createPlots>])
model.study(<tag>).runNoGen()
model.study(<tag>).createAutoSequences(type)
model.study(<tag>).showAutoSequences(type);
model.study(<tag>).getSolverSequences(type);
model.study(<tag>).isGenConv();
model.study(<tag>).isGenIntermediatePlots();
model.study(<tag>).isGenPlots();
model.study(<tag>).isPlotUndefVals();
model.study(<tag>).isStoreSolution();
model.study(<tag>).setEntry(…);
model.study(<tag>).setGenConv(boolean);
model.study(<tag>).setGenIntermediatePlots(boolean);
model.study(<tag>).setGenPlots(boolean);
model.study(<tag>).setPlotUndefVals(boolean);
model.study(<tag>).setStoreSolution(boolean);
model.study(<tag>).feature(<ftag>).loadFile(filePath);
model.study(<tag>).feature(<ftag>).saveFile(filePath);
step = model.study(<tag>).feature(<ftag>);
step.discardData();
step.discretization(<physpath>,<discr>);
step.exportData(<filePath>);
step.importData(<filePath>);
step.loadFile(<filePath>);
step.mesh(<geom>,<mesh>);
step.refresh();
step.saveFile(<filePath>);
step.setSolveFor(<entityPath>,boolean)
step.type();
step.discretization(<physpath>);
step.mesh(<geom>);
step.solveFor(<entityPath>);
step.mglevel.create(<mglevel>);
step.mglevel(<mglevel>).mesh(<geom>,<mesh>);
step.mglevel(<mglevel>).discretization(<physpath>,<discr>);
step.mglevel(<mglevel>).mesh(<geom>);
step.mglevel(<mglevel>).discretization(<physpath>);
```

## **DESCRIPTION**

model.study stores a list of studies, each of which consists of a number of study steps. Each study step, in turn, defines a solver-ready problem. This means that a study step can be turned into an extended mesh, and a basic solver (Stationary, Time, Eigenvalue, Modal, AWE, or Optimization) can be applied, resulting in a solution object.

The central property of a study step is its *study type*, which on one hand controls the equations generated by physics interfaces, and on the other hand triggers automatic selection of a suitable solver. Another important property of a study step is which mesh to use (for each geometry in the model). Other fundamental simulation parameters can also be found among the study step settings, like the time span for a Time Dependent study type and frequency range for a Frequency Domain study type.

Under a study step, you can add *multigrid levels*. The parent node still defines the problem to be solved (for example, the study type and the mesh). Therefore, the added multigrid levels must necessarily be coarser than the parent study step.

Most physics features and also some other parts of the model object (for example, expression features) must support a step member, which (in analogy to the spatial selection) controls for which study steps the feature is active. In many ways, the study selection can be seen as a fourth, discrete, dimension.

The *StudyList* is the list of studies in a model. For instance, model.study("std1") gives the study with tag std1.

model.study().create(*<tag>*) creates a new study sequence.

model.study(<*tag>*).run() computes the study. The run method can take an additional boolean input argument createPlots, which, when set to true, generates the corresponding default plots when computing a solution.

model.study(<*tag>*).runNoGen() runs the attached solver sequence without regenerating it.

model.study(<*tag>*).createAutoSequences(*type*) creates an attached solver sequence or job using default solver settings if the solver sequence has not been edited. This command is similar to **Compute** in the COMSOL Desktop. The argument *type* is one of all, jobs, or sol, corresponding to creating both jobs and solver sequences or one of them.

model.study(<*tag>*).showAutoSequences(*type*) generates a new attached solver sequence or job using default solver settings. This command is similar to **Show Default Solver** in the COMSOL Desktop; that is, it always creates unedited solver sequences. See createAutoSequences above for information about the *type* argument.

model.study(<*tag>*).getSolverSequences(*type*) returns a list of tags for solver sequences (see model.sol()) connected to this study. The *type* argument is one of SolverSequence, CopySolution, ParametricStore, Stored, Parametric, None, or All.

model.study(<tag>).setGenConv(boolean) controls the generation of convergence plots. Use model.study(<tag>).isGenConv() to check if convergence plots will be generated.

model.study(<tag>).setGenIntermediatePlots(boolean) controls the generation of default plots for intermediate solutions. Use model.study(<tag>).isGenIntermediatePlots() to check if plots will be generated for intermediate solutions.

model.study(<tag>).setGenPlots(boolean) controls the generation of default plot for the final solution after the last step in a study sequence. Use model.study(<tag>).isGenPlots() to check if plots will be generated for the final solution.

model.study(*<tag>*).setPlotUndefVals(*boolean*) controls the creation of a plot that indicates the location of undefined values such as Inf and NaN. Use model.study(<tag>).isPlotUndefVals() to check if plots of undefined values will be generated.

model.study(<*tag>*).setStoreSolution(*boolean*) inserts a Solution Store node between each study step in a multistep study if set to true. If set to false, Solution Store nodes are only inserted in certain cases. Use model.study(<*tag>*).isStoreSolution() to check if a Solution Store node is inserted between each study step (it then returns true).

model.study(*<tag>*).create(*<ftag>*,*type*) creates a new study step of the given type within the specified sequence. The set of allowed values should be limited to study types supported by at least one physics interface present in the model (Stationary, Time, Frequency, and Eigenvalue should always be allowed).

model.study(*<tag>*).feature().move(*<ftag>*,*position*) moves the feature *<ftag>* to the zero indexed position *<position>* in the list.

The following two lines sets the outputs to store from a study to the selections with tags sel1 and sel2:

```
model.study(<tag>).setEntry("outputmap", "solid", "selection");
model.study(<tag>).setEntry("outputselectionmap", "solid", "sel1;sel2");
```

See setEntry() for more information about how it works.

boolean model.study(<tag>).feature(<ftag>).loadFile(String *filePath*) and boolean model.study(<tag>).feature(<ftag>).SaveFile(String *filePath*) both work if the type of feature is a Parametric Sweep and then loads or saves information concerning either All Combinations or Specified Combinations. These methods return false if the type of feature is not a Parametric Sweep. They also return false if the operation is not successful.

step = model.study(*<tag>*).feature(*<ftag>*) obtains a reference to a specified study step.

step.discardData() discards any experimental data imported into a Parameter Estimation study step.

step.discretization(*<phys>*,*<discr>*) assigns discretization for a physics interface. The string *<phys>* is the tag of a physics interface. The string *<discr>* is a tag of a discretization feature under a physics mode or the string physics to use the discretization settings in the physics interface itself.

step.exportData(*<filePath>*) exports any experimental data previously imported to a Parameter Estimation study step to the specified file.

step.importData(*<filePath>*) imports experimental data into a Parameter Estimation study step from the specified *<filePath>*.

step.loadFile(*<filePath>*) loads parameter values from the specified *<filePath>* into a Parametric Sweep study step.

step.mesh(*<geom>*,*<mesh>*) specifies which mesh to use for geometry *<geom>* in the model.

step.refresh() refreshes, that is, reloads, any experimental data files used by a Parameter Estimation study step.

step.saveFile(*<filePath>*) saves parameter values from a Parametric Sweep study step to *<filePath>*.

step.setSolveFor(*<entityPath>*,*solve*) controls whether degrees of freedom defined by the specified entity will be solved for in the study step. When *solve* is set to false, the degrees of freedom will not be solved for; when set to true, they will be solved for only if the entity can generate equations for the study-step type. The correct *<entityPath>* argument corresponding to a model entity is given by *<entity>*.resolveModelPath().

step.type() returns the study type.

step.discretization(*<phys>*) returns the tag of the discretization feature under a physics interface with tag *<phys>* that specifies the shape functions to use for the physics interface in this study step, or the string physics to indicate that the discretization settings in the physics interface itself are used.

step.mesh(*<geom>*) returns the tag of the mesh to be used in geometry *<geom>* in this study step.

step.solveFor(*<entityPath>*) returns true if degrees of freedom defined by the specified entity will be solved for in the study step. The return value accounts for both the state of the activate property and whether the entity allows the study step type. The correct *<entityPath>* argument corresponding to a model entity is given by *<entity>*.resolveModelPath().

step.mglevel.create(*<mglevel>*) adds a (coarser) multigrid level to a study.

step.mglevel(*<mglevel>*).mesh(*<geom>*,*<mesh>*) specifies a mesh for the multigrid level. The set of allowed values must, in addition to the actual meshes, include an option "from parent". This should be the default choice and indicates that the multigrid level uses the same mesh as the parent study.

step.mglevel(*<mglevel>*).discretization(*<physpath>*,*<discr>*) assigns discretization for a multigrid level. The string *<physpath>* is the path of a physics interface. The string *<discr>* is a tag of a discretization feature under a physics mode. The default *<discr>* the physics interface tag. It can be changed to the tag of a discretization node under a physics interface.

step.mesh(*<geom>*) returns the mesh selected for the given geometry.

step.mglevel(*<mglevel>*).mesh(*<geom>*) returns the mesh for the selected multigrid level and geometry.

step.mglevel(*<mglevel>*).discretization(*<discpath>*) returns activation status of a discretization feature.

#### **EXAMPLE**

The following code sets up a study sequence to analyze the influence of structural deformation on a waveguide with a numerical port boundary condition. It consists of three steps: stationary structural mechanics followed by an eigenvalue study for the port and finally a wave propagation problem solved with manual multigrid levels (to get nested meshes).

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1", 3);
  model.component("comp1").geom("geom1").create("blk1", "Block");
  model.component("comp1").geom().run();
  model.component("comp1").mesh().create("mesh1", "geom1");
  model.component("comp1").mesh().create("mesh2", "geom1");
  model.component("comp1").mesh().create("mesh3", "geom1");
  model.physics().create("rfw1", "ElectromagneticWaves", "geom1");
  model.study().create("seq1");
  Study s1 = model.study("seq1");
  s1.create("struct","Stationary");
  s1.feature("struct").mesh("geom1","mesh1");
  s1.create("port","BoundaryModeAnalysis");
  s1.feature("port").set("PortName","port1");
  s1.feature("port").mesh("geom1","mesh2");
  s1.create("wave","Frequency");
  s1.feature("wave").mesh("geom1","mesh2");
  s1.feature("wave").mglevel().create("mgl1");
  s1.feature("wave").mglevel().create("mgl2");
  s1.feature("wave").mglevel("mgl2").mesh("geom1","mesh3");
  model.physics("rfw1").create("mgl1","Discretization");
  model.physics("rfw1").feature("mgl1").set("order","1");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1', 3);
  model.component('comp1').geom('geom1').create('blk1', 'Block');
  model.component('comp1').geom.run;
  model.component('comp1').mesh.create('mesh1', 'geom1');
  model.component('comp1').mesh.create('mesh2', 'geom1');
  model.component('comp1').mesh.create('mesh3', 'geom1');
  model.physics.create('rfw1', 'ElectromagneticWaves', 'geom1');
  model.study.create('seq1');
  s1 = model.study('seq1');
  s1.create('struct','Stationary');
  s1.feature('struct').mesh('geom1','mesh1');
  s1.create('port','BoundaryModeAnalysis');
  s1.feature('port').set('PortName','port1');
  s1.feature('port').mesh('geom1','mesh2');
  s1.create('wave','Frequency');
  s1.feature('wave').mesh('geom1','mesh2');
```

```
s1.feature('wave').mglevel.create('mgl1');
s1.feature('wave').mglevel.create('mgl2');
s1.feature('wave').mglevel('mgl2').mesh('geom1','mesh3');
model.physics('rfw1').create('mgl1','Discretization');
model.physics('rfw1').feature('mgl1').set('order','1');
```

In this case, the only settings that must be applied in the study members of other features are the ones relating to multigrid levels. The physics interfaces' equation form is by default set to automatic, which means that they respond suitably to the study type each time an extended mesh (xmesh) is created.

## **SEE ALSO**

```
model.batch(), model.physics(), model.sol()
model.thermodynamics()
```

Create constants and functions interfacing to a thermodynamics property package.

#### **SYNTAX**

Creating a thermodynamics property package feature.

```
model.thermodynamics().create(<ptag>,"PropertyPackage");
```

Setting and getting properties in a thermodynamics property package feature:

```
model.thermodynamics().feature(<ptag>).set(<prop>,<value>);
model.thermodynamics().feature(<ptag>).getString(<prop>);
```

TABLE 2-134: PROPERTIES SUPPORTED BY A THERMODYNAMICS PROPERTY PACKAGE.

| NAME            | TYPE   | DESCRIPTION                                                                 |  |  |
|-----------------|--------|-----------------------------------------------------------------------------|--|--|
| manager_id      | String | Thermodynamics manager ID.                                                  |  |  |
| manager_version | String | Thermodynamics manager version.                                             |  |  |
| package_id      | String | Thermodynamics package ID.                                                  |  |  |
| package_desc    | String | Thermodynamics package description. Only for display in the user interface. |  |  |

```
model.thermodynamics().feature(<ptag>).storePersistenceData();
```

Calling this method after a property package feature has been created, and manager\_id and package\_id have been set, stores information about how the thermodynamics package was created in the COMSOL model. If the model is later opened on a computer with the thermodynamics manager installed but without the property package, this information can be used to create the required property package.

```
model.thermodynamics().feature(<ptag>).create(<ftag>, <type>);
```

Creates a thermodynamics constant, function, or flash calculation feature. Possible types are CompoundConstant, TemperatureDependentProperty, PressureDependentProperty, OnePhaseProperty, TwoPhaseProperty, and FlashCalculationProperty.

```
model.thermodynamics().feature(<ptag>).feature(<ftag>).set(<prop>,<value>);
model.thermodynamics().feature(<ptag>).feature(<ftag>).getString(<prop>);
model.thermodynamics().feature(<ptag>).feature(<ftag>).getStringArray(<prop>);
model.thermodynamics().feature(<ptag>).feature(<ftag>).getStringMatrix(<prop>);
```

Set and get properties in a thermodynamics constant, function, or flash calculation feature.

TABLE 2-135: PROPERTIES SUPPORTED BY ALL THERMODYNAMICS CONSTANT, FUNCTION, AND FLASH CALCULATION FEATURES.

| NAME       | TYPE   | DESCRIPTION                                                                           |
|------------|--------|---------------------------------------------------------------------------------------|
| prop_basis | String | Basis ("mass" or "mole") for evaluated properties. Only relevant for some properties. |

## *Thermodynamics Constant Features*

The thermodynamics constant features are features with the type "CompoundConstant", and are used to define constants that get their value from a thermodynamics package.

TABLE 2-136: PROPERTIES SUPPORTED BY THERMODYNAMICS CONSTANT FEATURES.

| NAME     | TYPE   | DESCRIPTION                                                                                                                                                                                                   |  |  |  |
|----------|--------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|--|--|
| funcname | String | Name of constant; that is, a variable name that can be used in expressions.                                                                                                                                   |  |  |  |
| compound | String | Identifier for compound in the thermodynamics property package.                                                                                                                                               |  |  |  |
| property | String | Identifier for property in the thermodynamics property package.                                                                                                                                               |  |  |  |
| value    | String | Numerical value of constant. This value is only displayed in the user interface. When the<br>constant is evaluated in an expression, the value is obtained by calling the thermodynamics<br>property package. |  |  |  |

#### *Thermodynamics Function Features*

A thermodynamics function feature defines a function that can be used to evaluate properties that depend, for example, on temperature or pressure. Different types are TemperatureDependentProperty, PressureDependentProperty, OnePhaseProperty, and TwoPhaseProperty.

TABLE 2-137: PROPERTIES SUPPORTED BY THERMODYNAMICS FUNCTION FEATURES.

| NAME        | TYPE          | DESCRIPTION                                                                                                                         |  |
|-------------|---------------|-------------------------------------------------------------------------------------------------------------------------------------|--|
| funcname    | String        | Name of function.                                                                                                                   |  |
| derivatives | String array  | Names of partial derivatives of function.                                                                                           |  |
| compounds   | String array  | Identifiers for compounds in the thermodynamics property package.                                                                   |  |
| comp_basis  | String        | Basis ("mass" or "mole") for amounts of compounds. Only relevant for functions of<br>type "OnePhaseProperty" or "TwoPhaseProperty." |  |
| property    | String        | Identifier for the property to evaluate in the thermodynamics property package.                                                     |  |
| phase       | String        | Identifier for phase in the thermodynamics property package. Only for features of<br>type "OnePhaseProperty."                       |  |
| phase1      | String        | Identifier for first phase in the thermodynamics property package. Only for features of<br>type "TwoPhaseProperty."                 |  |
| phase2      | String        | Identifier for second phase in the thermodynamics property package. Only for<br>features of type "TwoPhaseProperty."                |  |
| args        | String matrix | Names, units, and descriptions for the function arguments. Only for display in the<br>user interface.                               |  |
| unit        | String        | Unit of the function. Only for display in the user interface.                                                                       |  |

Functions of type TemperatureDependentProperty and PressureDependentProperty have a single argument, which is the temperature or pressure, respectively.

Functions of type OnePhaseProperty have temperature and pressure as their first two arguments. If there is more than one compound, there are additional arguments for the fraction of each compound.

Functions of type TwoPhaseProperty have temperature and pressure as their first two arguments. If there is more than one compound, there are additional arguments for the fraction of each compound in each phase.

## *Thermodynamics Flash Calculation Features*

Thermodynamics flash calculation features are used as an interface for flash calculations, which take amounts of different compounds and two conditions (for example, temperature and pressure) as input and compute the fraction of each compound that is present in each phase.

TABLE 2-138: PROPERTIES SUPPORTED BY THERMODYNAMICS FLASH CALCULATION FEATURES.

| NAME        | TYPE          | DESCRIPTION                                                                                                                                                                     |  |
|-------------|---------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|
| compounds   | String array  | Identifiers for compounds in the thermodynamics property package.                                                                                                               |  |
| cond1       | String        | First flash condition.                                                                                                                                                          |  |
| cond2       | String        | Second flash condition.                                                                                                                                                         |  |
| temperature | String        | Name of function evaluating the temperature (if temperature is not one of the flash<br>conditions).                                                                             |  |
| pressure    | String        | Name of function evaluating the pressure (if pressure is not one of the flash<br>conditions).                                                                                   |  |
| inphase     | String        | Base name for functions evaluating presence of each phase. Function names for each<br>phase are formed by appending _ <phase> to the base name.</phase>                         |  |
| amounts     | String        | Base name for functions evaluating amount of each phase. Function names for each<br>phase are formed by appending _ <phase> to the base name.</phase>                           |  |
| composition | String        | Base name for functions evaluating fraction of each compound in each phase. Function<br>names are formed by appending _ <phase>_<compound> to the base name.</compound></phase> |  |
| soltype     | String        | Solution type ("undefined", "normal," or "retrograde").                                                                                                                         |  |
| args        | String matrix | Names, units, and descriptions for the function arguments. Only for display in the user<br>interface.                                                                           |  |
| phases      | String array  | Names of all phases. Only for display in the user interface. The phases used in the flash<br>calculation are determined by the thermodynamics property package.                 |  |

Each flash calculation feature defines a number of functions. All of the functions take the values of two flash conditions as their first two arguments, followed by arguments for the total amount of each compound.

