# *Introduction*

In the COMSOL Desktop, you create one or more *studies*, each with one or more *study steps* to compute the solution to a model. The studies generate a solver sequence with the solvers and other solver features that correspond to the study steps in the study.

Study and Study Step Types in the *COMSOL Multiphysics Reference Manual*.

## **CREATING A STUDY AND ADDING STUDY STEP**

The following commands create a study std1 and adds a Stationary study step to that study:

```
model.study().create("std1");
model.study("std1").create("stat", "Stationary");
```

## **RUNNING (COMPUTING) A STUDY**

To run a study, use

```
model.study(<tag>).run();
```

The run() command corresponds to clicking **Compute** on a **Study** node in the COMSOL Desktop.

#### **CREATING A REFERENCE TO A STUDY STEP**

You can also create a reference to an existing study step from a solver sequence:

```
model.sol("sol1").create("st1", "StudyStep");
model.sol("sol1").feature("st1").set("study", "std1");
model.sol("sol1").feature("st1").set("studystep", "stat");
```

## **ATTACHING A STUDY**

It is also possible to attach a study for making a solver sequence or batch feature part of the study sequence:

```
model.sol("sol1").attach("std1");
```

The attach() operation implies calling study(*<tag>*)(see below). You can only have one solver sequence attached to each study but you can have multiple batch features.

#### **ASSOCIATING A SOLVER SEQUENCE WITH A STUDY**

You can associate a solver sequence with a study using the following syntax:

```
model.sol("sol1").study("std1");
```

In contrast, attach() (see above) also makes the solver sequence part of the study sequence.

#### **MAIN STUDY FEATURE SETTINGS**

TABLE 6-86: METHODS FOR THE MAIN STUDY FEATURE SETTINGS.

| METHOD                           | DESCRIPTION                                                                            |
|----------------------------------|----------------------------------------------------------------------------------------|
| isGenConv()                      | True if convergence plots should be generated.                                         |
| isGenIntermediatePlots()         | True if plots for intermediate Stored Solution nodes should be<br>generated.           |
| isGenPlots()                     | True if default results plots should be generated.                                     |
| isPlotUndefVals()                | True if plots should be generated showing locations of undefined<br>values.            |
| isStoreSolution()                | True if a Store Solution node should be generated for each<br>intermediate study step. |
| setGenConv(boolean)              | Set to true if convergence plots should be generated.                                  |
| setGenIntermediatePlots(boolean) | Set to true to generate plots for intermediate Store Solution nodes.                   |
| setGenPlots(boolean)             | Set to true if default results plots should be generated.                              |
| setPlotUndefVals(boolean)        | Set to true to generate plots showing the location of undefined values.                |
| setStoreCompleteHistory(boolean) | Set to true to store the complete solver history.                                      |
| setStoreSolution(boolean)        | Set to true to generate a Store Solution node for each intermediate<br>study step.     |

For example, use

model.study("std1").setGenConv(true);

to generate convergence plots when computing the solution.

## **COMMON STUDY STEP PROPERTIES**

The following table explains properties available for all study steps defining equations:

TABLE 6-87: PHYSICS AND VARIABLES SELECTION

| PROPERTY         | VALUE      | DEFAULT | DESCRIPTION                                                                                                                                  |
|------------------|------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------|
| activate         | String Map |         | Choose physics interfaces and other features<br>to solve for. Allowed keys are                                                               |
|                  |            |         | •<br>A physics interface tag                                                                                                                 |
|                  |            |         | •<br>frame: followed by a Frame entity tag                                                                                                   |
|                  |            |         | •<br>rom: followed by a ReducedModel entity<br>tag                                                                                           |
|                  |            |         | •<br>A component tag followed by :shape<br>controlling shape optimization in the<br>component                                                |
|                  |            |         | •<br>A component tag followed by :topopt<br>controlling topology optimization in the<br>component                                            |
|                  |            |         | Allowed values are on or off. Default depends<br>on the key.                                                                                 |
| activateCoupling | String Map |         | Choose coupling features to solve for. Allowed<br>keys are MultiphysicsCoupling entity tags.<br>Allowed values are on or off. Default is on. |

TABLE 6-87: PHYSICS AND VARIABLES SELECTION

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                               |
|---------------------------|-----------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| activaterom               | String Map      |         | Choose reduced-order model output variables<br>to solve for. Allowed keys are ReducedModel<br>entity tags. Allowed values are on or off.<br>Default is off.                                                                                                               |
| disabledcommon            | Reference Array |         | CommonFeature entities disabled when<br>useadvanceddisable is on. Not all types can be<br>disabled.                                                                                                                                                                       |
| disabledcoordinatesystems | Reference Array |         | Coordinate system features disabled when<br>useadvanceddisable is on. Only types<br>representing PMLs, infinite elements and<br>absorbing layers can be disabled.                                                                                                         |
| disabledcoupling          | Reference Array |         | MultiphysicsCoupling entities disabled<br>when useadvanceddisable is on.                                                                                                                                                                                                  |
| disabledpair              | Reference Array |         | Pair entities disabled useadvanceddisable is<br>on.                                                                                                                                                                                                                       |
| disabledphysics           | Reference Array |         | Physics interfaces and features disabled when<br>useadvanceddisable is on. Allowed<br>reference tags are:                                                                                                                                                                 |
|                           |                 |         | •<br>A physics interface tag                                                                                                                                                                                                                                              |
|                           |                 |         | •<br>A path to a physics feature of the form<br>phys_tag/feature_tag/                                                                                                                                                                                                     |
| disabledreduced           | Reference Array |         | Reduced-order model features disabled when<br>useadvanceddisable is on.                                                                                                                                                                                                   |
| disabledvariables         | Reference Array |         | Variables entities disabled when<br>useadvanceddisable is on.                                                                                                                                                                                                             |
| disableFrameControl       | Reference Array |         | Entities which should not control any frame<br>when useadvanceddisable is on. Allowed<br>reference tags are:                                                                                                                                                              |
|                           |                 |         | •<br>A physics interface tag                                                                                                                                                                                                                                              |
|                           |                 |         | •<br>frame: followed by a Frame entity tag                                                                                                                                                                                                                                |
|                           |                 |         | •<br>A component tag followed by :shape                                                                                                                                                                                                                                   |
|                           |                 |         | controlling shape optimization in the                                                                                                                                                                                                                                     |
|                           |                 |         | component                                                                                                                                                                                                                                                                 |
| discretization            | String Map      |         | Select discretization for physics interfaces.<br>Allowed keys are the same as in activate.<br>Allowed values are physics (also default) and<br>tags of any Discretization feature belonging to<br>the key entity.                                                         |
| equationform              | String Map      |         | Override study step equation form for physics<br>interfaces. Allowed keys are the same as in<br>activate. Allowed values are physics (also<br>default if the physics allows setting equation<br>form) and any equation form allowed by the<br>physics interface settings. |

TABLE 6-87: PHYSICS AND VARIABLES SELECTION

| PROPERTY              | VALUE      | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                       |
|-----------------------|------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| equationform_freq     | String Map |         | Specify frequency to use for a physics interface<br>when its equation form is set to a<br>frequency-domain type using the<br>equationform property. Allowed keys are the<br>same as in activate. Allowed values are<br>parameter expressions. The default is the same<br>as the default in the physics interface settings.                                                                                        |
| equationform_freq_src | String Map |         | Specify whether an equation-based physics<br>interface should define time derivatives using<br>the main frequency of a frequency-domain<br>study step or a specific frequency given in<br>equationform_freq. Allowed values are<br>fromSolver (the default) and userdef.                                                                                                                                          |
| reconstructors        | String Map |         | Choose a reduced-order model to reconstruct<br>dependent variables in a physics interface not<br>solved for. Allowed keys are tags of physics<br>interfaces not solved for and for which there<br>exists at least one reconstructing<br>reduced-order model. Allowed values are none<br>(also default) and tags of ReducedModel<br>entities capable of reconstructing the key<br>interface's dependent variables. |
| useadvanceddisable    | on   off   | off     | Enable advanced frame control and disabling of<br>model entities.                                                                                                                                                                                                                                                                                                                                                 |

#### **PROPERTIES OF SPECIFIC STUDY STEP TYPES**

The following table lists the major study steps with links to documentation of available properties for each study step:

- **•** Batch
- **•** Batch Sweep
- **•** Bidirectionally Coupled Particle Tracing
- **•** Bidirectionally Coupled Ray Tracing
- **•** Cluster Computing
- **•** Cluster Sweep
- **•** Eigenfrequency
- **•** Eigenvalue
- **•** Stationary Then Eigenfrequency
- **•** Frequency Domain and Frequency-Domain Perturbation
- **•** Frequency to Time FFT

- **•** Function Sweep
- **•** Material Sweep
- **•** Model Reduction
- **•** Multigrid Level
- **•** Parametric Sweep
- **•** Ray Tracing
- **•** Sensitivity
- **•** Stationary
- **•** Surrogate Model Training
- **•** Time Dependent
- **•** Time Discrete
- **•** Time to Frequency FFT

