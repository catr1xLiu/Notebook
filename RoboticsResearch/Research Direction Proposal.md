
## Subjects of Interest
According to previous discussion, the topics that that ARC project should focus on are (going from highest to lowest priority):
- **Imitation learning** using Visuomotor Policy
- **Force Sensing & Controlling** capabilities of the model
- **Shared Control** with human operator
- (Optional) **Intent Prediction** for either 
	a. Human operator or
	b. Human co-worker in operation zone

Force sensing is most related to *KIMM project*. 

## A Possible Direction

I am imagining a three-stage exploration subject covering the three other topics in order:

![[ARC Exploration Direction|100%]]

1. **Data collection & Initial Model Training:** Training a visuomotor policy based on expert demo.
2. **Shared Autonomy Control:** Hand over some portion of the task to the autonomous policy, keeping operator in the loop for the difficult part. ==How much the policy takes over and how shared control is managed, we should discuss it further.== Testing data will be collected.
3. **Human Intent Prediction:** Using collected Step-2 data, we **may** be able to train a Human-Intent Prediction model to infer human operation from clues like:
	- *Eye-tracking* 
	- *Rough controller movements*
	- *Minor facial expressions*


## Possibilities of Shared Control Management

Recent literature on visuomotor policy frequently mentions the concept of multi-modality. Given a single robot state, most generative models could produce a set of different robot action, while some other methods produces action deterministically 

Models that produce multiple plausible responds include:
- Diffusion Models
- Noise-to-Action Flow-Matching Models
- some Action Chunking Models
Models that yield only one solution include:
- early Behavior Cloning Models
- Action-to-Action Flow-Matching Model
- distilled one-shot Flow-Matching Model

![[RoboticsResearch/media/mars-concept.png]]

Some latest models, however, have the ability to dynamic switch on multi-modality. The source here is MARS policy:
- It behaves as deterministic model most of the time, gaining the inference performance advantage
- Only where multiple solution exists, it behave as generative policy. 

Intuitively, the model is trained to be aware how uncertain the solution is. With proper programming, we can sample the potential solutions.

![[Selective Shared Autonomy|100%]]

In the context of shared autonomy, this can 