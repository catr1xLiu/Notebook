
This note covers the fundamentals of autonomous racing systems and existing methods from the literature. 

# High-Level System Architecture

We divide the pipeline of an autonomous racing system to five components:
![[1 - System Components|100%]]

- Sensors: *captures data from the real world / simulation environment*
- Perception: *Creates a solutions for mapping, localization or object detection based on sensor data*
- **Planning**: *Computes / predicts the local / global optimal trajectory*
- **Control**: *Directs the vehicle to follow the trajectory*

We will focus on the **planning** and **control** part in this review.

# Defining The Problem Scope

We define the scope of autonomous racing system to its operating environment - a standard racetrack. 

![[2 - Racetrack Environment|100%]]
We realize that, for **planning** and **control**, the fundamental problems are:
- **Minimizing**: We need to find the best path throughout the track yielding minimum lap-time
- **Shifts from Desired States**: Unavoidably, the vehicle will drift away from our desired output, and we will need to adjust correspondingly
- **Handling Limit**: 
- **Obstacles and Opponents**:

![[3 - Fundamental Problems|100%]]
# Data through the Pipeline



## Global Planning

- Optimization using complex methods https://www.tandfonline.com/doi/full/10.1080/00423114.2019.1704804
- **Oldest and Most Used**: https://github.com/alexliniger/MPCC/tree/master 
- **Modern Most Used**: TUM's optimization codebase https://github.com/TUMFTM/global_racetrajectory_optimization 
- **Dymos**: Racecar example https://github.com/OpenMDAO/dymos/tree/master/dymos/examples/racecar 
## Dynamic Re-planning
- **Oldest and Most Used**: https://github.com/alexliniger/MPCC/tree/master 
- TMU's optimization codebase https://github.com/TUMRT/online_3D_racing_line_planning 
- **Online Optimization Backend**: https://github.com/acados/acados 

