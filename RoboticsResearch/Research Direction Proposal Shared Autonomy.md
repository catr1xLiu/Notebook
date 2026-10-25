# High-fidelity Digital Twin as Bridge for Human Verdicts in Shared Autonomy 

## Moltivation

Modern visuomotor policies perform well in generalist robot benchmarks, but are imperfect in ambiguous real-world situations. 
We wish to explore a shared-autonomy approach: the model communicates its indeterminacy to the operator, who then provides a verdict, which the model obediently executes. 
The core is designing an effective human-model interface to communicate and enforcing the command.

![](./drawings/Shared%20Autonomy%20Overview.png)

We propose: use a high-fidelity physics simulation to iteratively imagine the execution of a plan, and do so for multiple plausible alternatives; have the human select the preffered plan; guide the policy to execute the plan using flow-model impainting; The method is mostly inference-time, with policy fine-tuning only required for complex environments.

## Background

### Generative Policies

Visuomotor policies [insert academic fluff]. 
However, they are known to struggle under ambiguous situations, especially for situations not covered in the training test.

Most generative policies work by gradually constructing actions from noise, which means they are multi-modal: given the exact same observation, starting from different random noise yields different actions. 
This property allows us to sample multiple feasible solutions in parallel.

MARS Policy (Jia et al., 2026) takes a step further:
![alt text](./media/mars%20multimodelity.png)

### High-fidelity Digital Twinning

Physics simulation in robotics [insert academic fluff]. 
It is common practice in industry settings to create a simulated twin for testing; in fact, most deployments already have.

Creating a high-fidelity physics simulation has become increasingly convenient; RoboSimStudio (Chen et al., 2026) presents the possibility of having a coding agent automate this process based on a few phone shots of the actual environment.

### World Models

[Insert academic fluff]

### 3D Object Localization using Computer Vision

[Insert Description]

## Method

### Setting

The robot is deployed in a known, structured production environment. Most of the scene is pre-defined, but the robot needs to interact with some unseen objects. The task is accuracy-demanding, and even minor errors could have consequences, so we cannot rely on flawless execution by learned policies. Such settings are most commonly found in factories, hospitals, and laboratories.


<p align="center">
  <img src="./media/Use%20Case%20Factory.png" width="49%">
  <img src="./media/Use%20Case%20Lab.png" width="49%">
</p>

- **Assumption 1:** The production scene is mostly structured, and a mostly rigid body + limited object deformation simulation provides a reasonable approximation of the real world.
- **Assumption 2:** The trained policy is able to autonomously achieve most of the steps in the task, but certain situations remain challenging for the policy to resolve. The ambiguity in these situations can be reduced by swapping the model for a more powerful one, but can never be resolved completely.
- **Assumption 3:** A human operator with rich experience posses higher-level task contexts, and is superior to the policy in decision making. However, overwatching is preffered to pure teleoperation since the worker might be remote, possibily supervising multiple robots, possibly has other tasks to handle.

### Policy Overview
![](./drawings/Shared%20Autonomy%20Sim%20Handling.png)

### Advancing the Execution Plan 

![](./drawings/Shared%20Autonomy%20Proposal%20Arch.png)

### Inpainting Guidance for model diffusion


## Experiment Design


## Open Questions


### Handling of Chaotic Scene

In **Assumption 3**, we limit our scope for the current stage to a structured, mostly rigid environment with a few known deformable items. Moving beyond that, we have more chaotic scenes that, for example, involves puring of liquid or disaddemble of objects - scenes that are hard to model accurately with a physics engine.

![](./drawings/Shared%20Autonomy%20Future%20Work.png)
