
> [!quote] Background
> ## Q-Learning in RL

Q-Learning is a model-free <u><strong style="color:#dab1da">reinforcement learning</strong></u> algorithm that helps an agent learn how to make the best decisions by interacting with its environment. It relies on a trial-and-error process guided by feedback (rewards) to learn the optimal policy, without requiring a mathematical model of the environment itself.

The core idea is that the agent builds a <u><strong style="color:#dab1da">Q-table</strong></u>, which serves as a memory structure storing Q-values. Each Q-value estimates how beneficial it is to take a specific action in a given state in terms of expected future rewards. Over time, the Q-table evolves to reflect the best actions for each state.

#### <u>Temporal Difference (TD) Update</u>

The agent updates its Q-values iteratively using the Temporal Difference (TD) update rule, which is based on the Bellman Equation:

$$
Q(s, a) \leftarrow Q(s, a) + \alpha \left( R(s, a) + \gamma \max_{a'} Q(s', a') - Q(s, a) \right)
$$

| Symbol      | $s$           | $a$                       | $s'$                          | $R(s, a)$        | $\gamma$        | $\alpha$      | $\max_{a'} Q(s', a')$                       |
| :---------- | :------------ | :------------------------ | :---------------------------- | :--------------- | :-------------- | :------------ | :------------------------------------------ |
| **Meaning** | Current state | Action taken by the agent | Next state the agent moves to | Immediate reward | Discount factor | Learning rate | Maximum possible Q-value for the next state |

#### <u>Action Selection</u>

To navigate the environment, the agent typically uses an <u><strong style="color:#dab1da">epsilon-greedy policy</strong></u>, which balances finding new paths and leveraging known good paths:
* **Exploitation:** With probability $1 - \epsilon$, the agent picks the action with the highest Q-value given its current knowledge to maximize rewards.
* **Exploration:** With probability $\epsilon$, the agent picks a completely random action. This ensures the agent explores new possibilities to improve its decision-making over time.

#### <u>Algorithm Flow</u>

![[Q-Table RL|100%]]


> [!fact] Background
> ## Reason for one-shot generation


Both diffusion (DDIM/ DDPM) and flow-matching algorithm are essentially sampling methods to let model reconstruct data in multiple steps. 

But, for reinforcement learning, especially Q-learning, doing so so involves costly and unstable method **BPTT** (*back-prop through time*). 

So we need to distill our model to a one-shot generation process. 


## Flow Q-Learning 

Distills flow-based policy to **one-step** policy, which enables gradient tracing. Still samples from random noise. [Project Page](https://seohong.me/projects/fql/). 

![[FQL.png]]

**Critic**: Essentially a one-step policy, only used Flow-Based model to "constrain" the RL model. 


> [!info] Improved Method with mathematical justification
> ## One-Step Flow Q-Learning


> [!fact] Other Resources
> ## Benchmarks, Library and CodeBase
## OGBench

https://seohong.me/projects/ogbench/

## Flow Matching Library
(By meta)
https://github.com/facebookresearch/flow_matching


> [!info] Direct RL for Flow-Based Policy
> ## One-Step Flow Q-Learning

1. Flow-Based Policy for Online RL https://arxiv.org/abs/2506.12811
2. Gradient Formula for Flow-Based Policy https://arxiv.org/abs/2507.21053


## A2A Flow Matching


![[A2A Flow Matching.png|100%]]



$$v_\theta: [0,1] \times \mathbb{R}^d \rightarrow \mathbb{R}^d$$