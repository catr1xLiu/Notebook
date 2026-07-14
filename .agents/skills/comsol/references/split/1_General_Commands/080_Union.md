# *Union*

Selection defined by the union of a set of selections.

TABLE 2-128: UNION SELECTION PROPERTIES.

| NAME      | VALUE         | DEFAULT | DESCRIPTION                      |
|-----------|---------------|---------|----------------------------------|
| entitydim | 0   1   2   3 | sdim    | Dimension of entities to select. |
| input     | String array  | {}      | Selections to add.               |

#### *Intersection*

Selection defined by the intersection of a set of selections.

TABLE 2-129: INTERSECTION SELECTION PROPERTIES.

| NAME        | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|-------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color       | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |

TABLE 2-129: INTERSECTION SELECTION PROPERTIES.

| NAME         | VALUE         | DEFAULT | DESCRIPTION                      |
|--------------|---------------|---------|----------------------------------|
| groupcontang | on   off      | off     | Continuous tangent mode.         |
| entitydim    | 0   1   2   3 | sdim    | Dimension of entities to select. |
| input        | String[]      | {}      | Selections to intersect.         |

#### *Difference*

Selection defined by the difference between two sets of selections.

TABLE 2-130: DIFFERENCE SELECTION PROPERTIES.

| NAME         | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| groupcontang | on   off                                                                                    | off                           | Continuous tangent mode.                                                                                                                              |
| entitydim    | 0   1   2   3                                                                               | sdim                          | Dimension of entities to select.                                                                                                                      |
| add          | String[]                                                                                    | {}                            | Selections to add.                                                                                                                                    |
| subtract     | String[]                                                                                    | {}                            | Selections to subtract.                                                                                                                               |

#### *Complement*

Selection defined by the complement of a set of selections.

TABLE 2-131: COMPLEMENT SELECTION PROPERTIES.

| NAME         | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                 |
| groupcontang | on   off                                                                                    | off                           | Continuous tangent mode.                                                                                                                              |
| entitydim    | 0   1   2   3                                                                               | sdim                          | Dimension of entities to select.                                                                                                                      |
| input        | String[]                                                                                    | {}                            | Selections to invert.                                                                                                                                 |

## *Adjacent*

Selection of entities that are adjacent to entities in another selection.

TABLE 2-132: ADJACENT SELECTION PROPERTIES.

| NAME         | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                           |
|--------------|---------------------------------------------------------------------------------------------|-------------------------------|-------------------------------------------------------------------------------------------------------------------------------------------------------|
| color        | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property. |
| customcolor  | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to<br>custom.                                                                                              |
| groupcontang | on   off                                                                                    | off                           | Continuous tangent mode                                                                                                                               |
| entitydim    | 0   1   2   3                                                                               | sdim                          | Dimension of entities to select.                                                                                                                      |
| input        | String[]                                                                                    | {}                            | Input selections.                                                                                                                                     |

TABLE 2-132: ADJACENT SELECTION PROPERTIES.

| NAME      | VALUE         | DEFAULT | DESCRIPTION                        |
|-----------|---------------|---------|------------------------------------|
| outputdim | 0   1   2   3 | sdim-1  | Dimension of output entities.      |
| exterior  | on   off      | on      | Include exterior boundaries/edges. |
| interior  | on   off      | off     | Include interior boundaries/edges. |

*LogicalExpression*

Selection defined by a logical expression in terms of other named selections.

TABLE 2-133: LOGICAL EXPRESSION SELECTION PROPERTIES.

| NAME        | VALUE                                                                                       | DEFAULT                       | DESCRIPTION                                                                                                                                                  |
|-------------|---------------------------------------------------------------------------------------------|-------------------------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------|
| color       | none   custom  <br>integer between 1<br>and the number<br>of colors in the<br>current theme | none                          | The color of the selection, either given as an integer<br>indicating a color in the color theme, or as a custom<br>color in the customcolor property.        |
| customcolor | RGB-triplet                                                                                 | Next available<br>theme color | The color to use. Active when color is set to custom.                                                                                                        |
| entitydim   | 0   1   2   3                                                                               | sdim                          | Dimension of entities to select.                                                                                                                             |
| expression  | String                                                                                      |                               | The logical expression to use. It can contain parentheses<br>and the   , &&, and ! Boolean operators, operating on<br>the tags of existing named selections. |

## **EXAMPLES**

Define the selection equ1 as the domain of a rectangle and the selection bnd1 as the boundary of the rectangle.

```
Code for Use with Java
```

```
Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("geom1",2);
  model.component("comp1").geom("geom1").create("f1","Rectangle");
  model.component("comp1").geom("geom1").run("f1");
  model.component("comp1").selection().create("equ1").geom(2);
  model.component("comp1").selection("equ1").all();
  model.component("comp1").selection().create("bnd1").geom(1);
  model.component("comp1").selection("bnd1").all();
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1',2);
  model.component('comp1').geom('geom1').create('f1','Rectangle');
  model.component('comp1').geom('geom1').run('f1');
  model.component('comp1').selection.create('equ1').geom(2);
  model.component('comp1').selection('equ1').all;
  model.component('comp1').selection.create('bnd1').geom(1);
  model.component('comp1').selection('bnd1').all;
The (outer) boundaries for the model can be set with the following selection:
```

*Code for Use with Java*

```
Model model = ModelUtil.create("Model");
model.component().create("comp1");
model.component("comp1").geom().create("geom1",2);
model.component("comp1").geom("geom1").create("r1","Rectangle");
model.component("comp1").selection().create("outer").
      geom("geom1",2,1,new String[]{"exterior"});
model.component("comp1").selection("outer").all();
```

```
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('geom1',2);
  model.component('comp1').geom('geom1').create('r1','Rectangle');
  model.component('comp1').selection.create('outer').geom('geom1',2,1,{'exterior'});
  model.component('comp1').selection('outer').all;
Create a selection for all boundaries of a block intersecting a ball with radius 0.5 and center (1,1,1):
Code for Use with Java
  Model model = ModelUtil.create("Model");
  model.component().create("comp1");
  model.component("comp1").geom().create("g1",3).create("blk1","Block");
  model.component("comp1").geom("g1").run();
  model.component("comp1").selection().create("ball1", "Ball");
  model.component("comp1").selection("ball1").set("entitydim", "2");
  model.component("comp1").selection("ball1").set("posx", "1");
  model.component("comp1").selection("ball1").set("posy", "1");
  model.component("comp1").selection("ball1").set("posz", "1");
  model.component("comp1").selection("ball1").set("r", "0.5");
Code for Use with MATLAB
  model = ModelUtil.create('Model');
  model.component.create('comp1');
  model.component('comp1').geom.create('g1',3).create('blk1','Block');
  model.component('comp1').geom('g1').run;
  model.component('comp1').selection.create('ball1', 'Ball');
  model.component('comp1').selection('ball1').set('entitydim', '2');
  model.component('comp1').selection('ball1').set('posx', '1');
  model.component('comp1').selection('ball1').set('posy', '1');
  model.component('comp1').selection('ball1').set('posz', '1');
  model.component('comp1').selection('ball1').set('r', '0.5');
Create a selection of all edges adjacent to the boundaries in the ball selection:
Code for Use with Java
  model.component("comp1").selection().create("adj1", "Adjacent");
  model.component("comp1").selection("adj1").set("entitydim", "2");
  model.component("comp1").selection("adj1").set("outputdim", "1");
  model.component("comp1").selection("adj1").set("input", new String[]{"ball1"});
Code for Use with MATLAB
  model.component('comp1').selection.create('adj1', 'Adjacent');
  model.component('comp1').selection('adj1').set('entitydim', '2');
  model.component('comp1').selection('adj1').set('outputdim', '1');
  model.component('comp1').selection('adj1').set('input', {'ball1'});
SEE ALSO
Selections
model.shape()
```

Create and define shape functions for the field variables' elements.

#### **SYNTAX**

```
model.shape().create(<tag>,<frame>);
model.shape(<tag>).elementSet(<condition>);
model.shape(<tag>).frame(<ftag>);
model.shape(<tag>).create(<ftag>,<func>);
model.shape(<tag>).feature(<ftag>).set(property,<value>);
model.shape(<tag>).slits().named(<seltag>);
model.shape(<tag>).slits().set(...);
model.shape(<tag>).upFlux(<varName>);
model.shape(<tag>).downFlux(<varName>);
model.shape(<tag>).domainFlux(<expressions>,<frame>);
model.shape(<tag>).elementSet();
model.shape(<tag>).frame();
model.shape(<tag>).feature(<ftag>).shape();
model.shape(<tag>).feature(<ftag>).getType(<property>);
model.shape(<tag>).fieldVariable();
model.shape(<tag>).slits().named();
model.shape(<tag>).slits().getType();
model.shape(<tag>).upFlux();
model.shape(<tag>).downFlux();
```

## **DESCRIPTION**

model.shape(*<tag>*) returns a shape function.

model.shape().create(*<tag>*,*<frame>*) creates a shape function with tag *<tag>* and assigns the frame *<frame>* to it.

model.shape(*<tag>*).frame(*<ftag>*) assigns frame *<ftag>* to the shape function. See model.frame() for a discussion on the default frame.

model.shape(*<tag>*).create(*<ftag>*,*<func>*) creates a shape feature with the shape function expression func. func can be a shape function name (shlag, for example) or a shape function with arguments (shlag(2,u), for example). The latter is interpreted as an assignment of some property values.

model.shape(*<tag>*).feature(*<ftag>*).set(*property*,*<value>*) sets a property for the shape function. Of the data types listed in Table 2-4, the ones supported are those for integers, strings, and string arrays. Which ones are applicable differs for each property.

model.shape(*<tag>*).selection().named(*<seltag>*) assigns the shape function to the named selection *<seltag>*.

model.shape(*<tag>*).selection().set(...) defines a local selection that assigns the shape function to geometric entities. For a complete list of methods available under selection(), see Selections.

model.shape(<tag>).upFlux(<varName>) and model.shape(<tag>).downFlux(<varName>) set the names of the up and down boundary flux variables. model.shape(<tag>).domainFlux(<expressions>,<frame>) sets expressions for the domain flux in a given frame. This is required to make the boundary flux variables produce accurate results. Only Lagrange shape functions support boundary flux variables.

```
model.shape(<tag>).frame() returns the frame tag as a string.
```

model.shape(*<tag>*).feature(*<ftag>*).shape() returns the shape function expression as a string.

model.shape(*<tag>*).feature(*<ftag>*).get*Type*(*property*) returns a property value. For available data types, see get\* and Selection Access Methods.

model.shape(*<tag>*).fieldVariable() returns the field variables which the shape functions define.

model.shape(*<tag>*).selection().named() returns the selection tag as a string.

model.shape(*<tag>*).elementSet(*<condition>*) sets the element set condition to the given string. The condition should be an expression containing *element set variables* (defined in model.elementSet()) and the logical operators &&, ||, and !. The shape function is defined only on the mesh elements for which the condition is true (nonzero).

model.shape(*<tag>*).elementSet() returns the element set condition. An empty string means no condition.

model.shape(*<tag>*).selection().get*Type*() returns domain information. For available methods, see model.selection().

model.shape(*<tag>*).slits() returns a selection used to generate a slit on the shape. Works exactly as selections.

model.shape(<tag>).upFlux() and model.shape(<tag>).downFlux() return the names of the up and down flux variables (an empty string if the variable names have not been set.)

## **EXAMPLE**

Define the shape function shlag(2,"u"):

```
Code for Use with Java
  model.shape().create("shu","f");
  model.shape("shu").create("f1","shlag");
  model.shape("shu").feature("f1").set("order",2);
  model.shape("shu").feature("f1").set("basename","u");
  model.shape("shu").selection().named("equ1");
Code for Use with MATLAB
  model.shape.create('shu','f');
  model.shape('shu').create('f1','shlag');
  model.shape('shu').feature('f1').set('order',2);
  model.shape('shu').feature('f1').set('basename','u');
  model.shape('shu').selection.named('equ1');
```

See also Shape Functions and Element Types for information and syntax examples for all shape functions (element types).

## **SEE ALSO**

model.coeff(), model.intRule(), model.weak() and the Elements and Shape Function Programming chapter.

*model.sol()*

Solver sequences.

![](_page_177_Picture_13.jpeg)

Solvers and Study Steps

#### **SYNTAX**

```
model.sol().create(<tag>)
model.sol().create(<tag>,<studytag>)
model.sol().create(<tag>,<studytag>,<varstag>)
model.sol().remove(<tag>)
model.sol(<tag>).create(<ftag>,<oper>)
model.sol(<tag>).feature().remove(<ftag>)
model.sol(<tag>).feature(<ftag>).create(<f2tag>,<oper>)
model.sol(<tag>).feature(<ftag>).set(property,<value>)
model.sol(<tag>).attach(<stag>)
model.sol(<tag>).isAttached()
model.sol(<tag>).detach(<stag>)
model.sol(<tag>).study(<stag>)
model.sol(<tag>).clearSolutionData()
model.sol(<tag>).copySolution(<ctag>)
model.sol(<tag>).createAutoSequence(<stag>)
model.sol(<tag>).createSolution()
model.sol(<tag>).updateSolution()
model.sol(<tag>).updateSolution()
model.sol(<tag>).adaptationStudyFeature()
model.sol(<tag>).adaptationStudyFeature(<stag>)
model.sol(<tag>).getDefaultSolnum()
model.sol(<tag>).setClusterStorage
model.sol(<tag>).getClusterStorage
model.sol(<tag>).isEmpty()
model.sol(<tag>).isInitialized()
model.sol(<tag>).run(<ftag>,[<createPlots>])
model.sol(<tag>).runFrom(<ftag>,[<createPlots>])
model.sol(<tag>).runFromTo(<ftagstart>,<ftagstop>,[<createPlots>])
model.sol(<tag>).runAll([<createPlots>])
model.sol(<tag>).run()
model.sol(<tag>).continueRun()
```

#### **DESCRIPTION**

model.sol().create(*<tag>*) adds a solver sequence to the model.

model.sol().create(*<tag>*,*<studytag>*) adds a solver sequence to the model. The constructor adds one feature of the type StudyStep to the solver sequence with the tag *<studytag>*. This StudyStep feature is connected to a study step (see model.study()).

model.sol().create(*<tag>*,*<studytag>*,*<varstag>*) adds a solver sequence to the model. The constructor adds one feature of the type StudyStep with the tag *<studytag>* and one feature of the type Variables with the tag *<varstag>* to the solver sequence.

model.sol().remove(*<tag>*) removes a solver sequence from the model.

model.sol(*<tag>*).create(*<ftag>*,*<oper>*) creates a solver feature. Each solver feature is a solver operation.

model.sol(*<tag>*).feature().remove(*<ftag>*) removes the solver feature *<ftag>*.

model.sol(*<tag>*).feature(*<ftag>*).set(*property*,*<value>*) sets the property *property* for the feature *<ftag>*.

model.sol(*<tag>*).attach(*<stag>*) attaches a solver sequence with tag *<tag>* to a study with tag *<stag>*, which makes it visible under that study. You can use attach to make a solver sequence part of the study sequence. Using model.sol(*<tag>*).study(*<stag>*), on the other hand, only associates a solver sequence with a study. The attach() operation implies calling study(*<tag>*). You can only have one solver sequence attached to each study (but you can have multiple batch features).

model.sol(<tag>).isAttached() returns true if the solver sequence with tag *<tag>* is attached to a study.

model.sol(*<tag>*).detach(*<stag>*) detaches a solver sequence with tag *<tag>* from study with tag *<stag>*.

model.sol(*<tag>*).clearSolutionData() clears computed solution data associated with the solver sequence *<tag>*. Solution selection settings and settings in results features associated with the solution are not modified.

model.sol(<tag>).getDefaultSolnum() returns which solnum the call getU() returns (compare with getU(*<solnum>*); see Solution Data).

model.sol(*<tag>*).setClusterStorage(*<value>*) sets the solution storage format used on clusters. Use the *<value>* "all" to store the solution on all cluster nodes and the *<value>* "single" to store the solution only on a single cluster node.

model.sol(*<tag>*).getClusterStorage() returns "all" if the solution is stored on all cluster nodes and "single" if the solution is only stored a single cluster node.

model.sol(*<tag>*).copySolution(*<ctag>*) copies the solution data associated with the solver sequence *<tag>* to a new solver sequence *<ctag>*. The features are not copied.

model.sol(*<tag>*).createAutoSequence(*<stag>*) creates a solver sequence of features automatically from the study *<stag>*. The sequence of study steps are used as input to the sequence generation algorithm but also the physics used in the study steps are used to automatically adopt the solver settings.

model.sol(*<tag>*).createSolution() creates a solution object from one or more set operations (setU(…), …), see Solution Creation for details.

model.sol(*<tag>*).updateSolution() updates a solution data associated with the solver sequence to make it consistent with the current model.

model.sol(*<tag>*).adaptationStudyFeature() returns the path to the study feature with adaptation that controls this sequence or empty string if none. model.sol(*<tag>*).adaptationStudyFeature(*<ftag>*) sets the study feature with adaptation, *<ftag>*, that controls the solver sequence *<tag>*. Use an empty string to disable study control.

model.sol(*<tag>*).isEmpty() is true if there is no solution data or if all solution data has been cleared.

model.sol(*<tag>*).isInitialized() is true if the solution is a valid (initialized) object. Even if the solution has been cleared, isInitialized is true (use isEmpty to check for cleared solution data).

model.sol(*<tag>*).run(*<ftag>*) runs the features for a solver sequence up to and including the feature *<ftag>*. It corresponds to clicking **Compute** on the solver sequence feature node in the COMSOL Desktop.

model.sol(*<tag>*).runFrom(*<ftag>*) runs the features for a solver sequence from and including the feature *<ftag>*.

model.sol(*<tag>*).runFromTo(*<ftagstart>,<ftagstop>*) runs the features for a solver sequence from and including the feature *<ftagstart>* to and including the feature *<ftagstop>*.

model.sol(*<tag>*).runAll() and model.sol(*<tag>*).run() run all the features for a solver sequence.

All the run, runFrom, runFromTo, and runAll methods can take an additional boolean input argument createPlots, which, when set to true, generates the corresponding default plots when computing a solution.

model.sol(*<tag>*).continueRun() continues to run a solver sequence.

#### **EXAMPLES**

Assume that a study st1 represents one stationary study step with the tag stat1 for some equations.

```
Code for Use with Java
  model.sol().create("s","step1","vars1");
  model.sol("s").feature("step1").set("study","st1");
```

```
model.sol("s").feature("step1").set("studystep","stat1");
  model.sol("s").create("solver1","Stationary");
Code for Use with MATLAB
  model.sol.create('s','step1','vars1');
  model.sol('s').feature('step1').set('study','st1');
  model.sol('s').feature('step1').set('studystep','stat1');
  model.sol('s').create('solver1','Stationary');
```

Assume that a second study step with frequency response is added to the study with tag freq1 and that you want to make a frequency sweep from 10 to 1000 using the parametric solver and the solution above as the linearization point (bias solution).

```
Code for Use with Java
  model.sol("s").create("step2","StudyStep");
  model.sol("s").feature("step2").set("study","st1");
  model.sol("s").feature("step2").set("studystep","freq1");
  model.sol("s").create("vars2","Variables");
  SolverFeature s2 = (SolverFeature) model.sol("s").create("solver2","Stationary");
  s2.set("nonlin","linper"); // (*)
  s2.set("linpmethod","sol");
  s2.set("linpsol", "s");
  s2.set("storelinpoint", "on");
  s2.create("par","Parametric");
  s2.feature("par").set("pname","freq");
  s2.feature("par").set("plist",new double[]{10,1000});
  s2.runAll();
Code for Use with MATLAB
  model.sol('s').create('step2','StudyStep');
  model.sol('s').feature('step2').set('study','st1');
  model.sol('s').feature('step2').set('studystep','freq1');
  model.sol('s').create('vars2','Variables');
  s2 = model.sol('s').create('solver2','Stationary');
  s2.set('nonlin','linper'); // (*)
  s2.set('linpmethod','sol');
  s2.set('linpsol', 's');
  s2.set('storelinpoint', 'on');
  s2.create('par','Parametric');
  s2.feature('par').set('pname','freq');
  s2.feature('par').set('plist',[10,1000]);
  s2.runAll;
```

At this point the solution s is associated to the study step freq1 (but it depends indirectly on the bias study step stat1 as well).

(\*) Uses the small-signal study functionality, which makes it possible to access also the linearization point for postprocessing together with the small-signal solution. Here it is assumed that the bias problem and the small-signal problem can be set up independently for the two study steps.

## **COMPATIBILITY**

```
From version 5.3a, the method
```

```
model.sol(<tag>).clearSolution()
```

is deprecated and replaced by the method

```
model.sol(<tag>).clearSolutionData()
```

since clearSolutionData generally works as expected, while clearSolution clears settings unexpectedly.

## **SEE ALSO**

```
model.study()
```

Create and define events for the solver.

#### **SYNTAX**

```
model.solverEvent().create(<tag>,evtype);
model.solverEvent(<tag>).start(expr);
model.solverEvent(<tag>).start();
model.solverEvent(<tag>).period(expr);
model.solverEvent(<tag>).period();
model.solverEvent(<tag>).condition(expr);
model.solverEvent(<tag>).condition();
model.solverEvent(<tag>).reinit();
model.solverEvent(<tag>).reinit().create(<tag>);
model.solverEvent(<tag>).reinit(<tag>).set(<var>,expr);
model.solverEvent(<tag>).useConsistentInit(isConsistent);
```

#### **DESCRIPTION**

Create events and control event settings. There are two types of events; Explicit and Implicit.

model.solverEvent().create(*<tag>*,*evtype*) creates a new event of type *evtype*, either Explicit and Implicit.

There are also *event sequences*, which you create using the *evtype* set as EventSequence to which you can add *sequence members*. See Event Sequences.

