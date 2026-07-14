# *Model Reduction*

Use a Model Reduction study step to perform simulations with reduced models or to produce reduced models.

A Model reduction study step will involve the following settings

- **1** Selecting the model reduction method to apply.
- **2** If applicable: Selecting the training data (Select or generate Study and Study step reference).
- **3** Defining the unreduced (source) model (Study and Study step reference).
- **4** If applicable: Defining the objective function representing a quality measure to minimize.
- **5** Selecting to create or update an instance of the reduced model under reduced models for online use.
- **6** If applicable: Specifying if the reduced model should be capable of reconstruction.
- **7** Defining reduced-model control inputs.
- **8** Defining reduced-model outputs.

## **SYNTAX**

```
model.study(stdname).create(fname,"ModelReduction");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step for model reduction. The following general and common properties are available.

TABLE 6-142: GENERAL AND COMMON PROPERTIES FOR MODEL REDUCTION.

| PROPERTY           | VALUE                    | DEFAULT | DESCRIPTION                                                                                                             |
|--------------------|--------------------------|---------|-------------------------------------------------------------------------------------------------------------------------|
| awefunc            | String array             |         | Error expressions, if<br>reducedModelType is awe.                                                                       |
| awefuncdesc        | String array             |         | Description of the error variables, if<br>reducedModelType is awe.                                                      |
| awefuncscale       | String array             |         | Scale of the error variables, if<br>reducedModelType is awe.                                                            |
| awefuncunit        | String array             |         | Unit of the error functions, if<br>reducedModelType is awe.                                                             |
| awefuncuse         | String array             |         | Error expressions, if<br>reducedModelType is awe.                                                                       |
| awevar             | String array             |         | Model error/output variables, if<br>reducedModelType is awe.                                                            |
| initval            | String array             |         | Values for the model control inputs used<br>for the simulation using the modal solver,<br>if reducedModelType is modal. |
| reducedModelType   | modal   awe  <br>pod     | modal   | Model reduction method to use.                                                                                          |
| romdata            | String                   | new     | Tag of the target container for the<br>reduced model (new for a new reduced<br>model).                                  |
| romReconstruct     | true   false             | true    | Enable reconstruction in the produced<br>reduced model.                                                                 |
| pname              | String array             |         | Model parameter names to use as model<br>control input variables, if<br>reducedModelType is modal.                      |
| podtrainingsol     | String                   |         | Solution selection, if<br>reducedModelType is pod.                                                                      |
| qoidescr           | String array             |         | Descriptions for user-defined output<br>expressions, if reducedModelType is<br>modal.                                   |
| qoiexpr            | String array             |         | Global expressions defining outputs, if<br>reducedModelType is modal.                                                   |
| qoiname            | String array             |         | Variable names for outputs, if<br>reducedModelType is modal.                                                            |
| qoiunit            | String array             |         | Units for user-defined output<br>expressions, if reducedModelType is<br>modal.                                          |
| rtol               | double                   | 0.1     | Relative tolerance for adaptation, if<br>reducedModelType is awe                                                        |
| soltypemat         | true   false             | false   | Store reduced matrices in the modal<br>solver solution, if reducedModelType is<br>modal.                                |
| soltypeonline      | on   off                 | on      | Create a reduced model.                                                                                                 |
| trainingStepConstr | String (auto or<br>none) | auto    | Study step for constraint modes, if<br>reducedModelType is pod.                                                         |

TABLE 6-142: GENERAL AND COMMON PROPERTIES FOR MODEL REDUCTION.

| PROPERTY                        | VALUE        | DEFAULT | DESCRIPTION                                                                            |
|---------------------------------|--------------|---------|----------------------------------------------------------------------------------------|
| trainingStudyConstr             | String       | none    | Training study for constraint modes, if<br>reducedModelType is pod.                    |
| truncationrtol                  | double       | 0.01    | The relative truncation tolerance, if<br>reducedModelType is awe or pod.               |
| unreducedModelStepAWE           | String       | none    | Frequency domain study step, if<br>reducedModelType is awe.                            |
| unreducedModelStepPOD           | String       | none    | Frequency domain study step, if<br>reducedModelType is pod.                            |
| unreducedModelStudyAWE          | String       | none    | Study containing at least one compatible<br>study step, if reducedModelType is<br>awe. |
| unreducedModelStudyPOD          | String       | none    | Study containing at least one compatible<br>study step, if reducedModelType is<br>pod. |
| useExtraResultsCompileEquations | true   false | false   | Use extra Compile Equations for Results.                                               |

For the modal model reduction method, the following methods are available.

TABLE 6-143: PROPERTIES FOR MODAL MODEL REDUCTION.

| PROPERTY            | VALUE                 | DEFAULT | DESCRIPTION                                                                                                         |
|---------------------|-----------------------|---------|---------------------------------------------------------------------------------------------------------------------|
| trainingStep        | String (auto or none) | auto    | Study step compatible with the chosen model<br>reduction method used to produce the basis of<br>the reduced method. |
| trainingStudy       | String                | none    | Study containing a study step compatible with<br>training data for the chosen method.                               |
| unreducedModelStep  | String                | none    | Study step compatible with the chosen model<br>reduction method used to define the model to<br>reduced.             |
| unreducedModelStudy | String                | none    | Study containing a study step for reduction<br>compatible with the chosen method.                                   |

The following properties are available for a time-dependent unreduced study (an unreducedModelStep).

TABLE 6-144: PROPERTIES FOR A TIME-DEPENDENT UNREDUCED STUDY.

| PROPERTY          | VALUE        | DEFAULT        | DESCRIPTION                                         |
|-------------------|--------------|----------------|-----------------------------------------------------|
| romSolveTransient | on   off     | off            | Reduced-model simulation using the modal solver.    |
| tlist             | double array | range(0,0.1,1) | Time list for the simulation with the modal solver. |

The following properties are available for a frequency-dependent unreduced study (an unreducedModelStep).

TABLE 6-145: PROPERTIES FOR A FREQUENCY-DEPENDENT UNREDUCED STUDY.

| PROPERTY          | VALUE        | DEFAULT | DESCRIPTION                                                                                                                                                                  |
|-------------------|--------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| romSolveFrequency | on   off     | off     | Reduced-model simulation using the modal solver.                                                                                                                             |
| plist             | double array |         | Frequency list for the simulation with the modal<br>solver. The first frequency is used as the<br>linearization frequency for the second-order<br>expansion of the matrices. |

