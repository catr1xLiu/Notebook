# Research Proposal 2: Spatial Grounding using NeMO

I am attempting to write a research proposal, aiming for a 4-6-month small-team project with a niche contribution. Should make a strong workshop submission so we have a safe net, and aim for a full conference submission in the end.

Abstract

We are working on an agent-commanded manipulation system like RPent. https://arxiv.org/html/2607.08448v5. We seek to improve performance using 6-DoF spatial grounding and object labelling. We focus on the performance improvement on models and programmatic tools brought by these features.

Core Idea

Generalization has always been the key challenge to robotics learning methods. And the community has developed a variety of benchmarks to challenge that. The primary recognition is that the variety of task in mainstream robot benchmarks is introduced by the variety of objects. But looking at the abstract movements that the robot do, there are just a few elementary actions making up all the complex tasks, with “Pick-and-Place” taking more than half.

Humans learn about elementary operations at about 5-years-old, that’s when we know how to grab an object, how to put an object on top of another, how to wipe an object using a tool, and how to pour liquid. From then on, we don’t need demonstrations to learn to do most tasks; we can just read the manual and perform elementary tasks in order.

In the proposed framework, the operator first guides the robot to “learn” an object: scan it to create a Neural representation (Finding NeMO: A Geometry-Aware Representation of Template Views for Few-Shot Perception) and (one or more) relative poses (EEF -> OBJ) that can hold the object tight. This is explicitly not zero-shot, but it takes less than a minute and can be fully automated.

During inference, the VLM planner no longer outputs using the object name. Since the object could have been unseen to the VLA and affect its performance. Instead, we use object tokens and marker tokens to specify the motion “place <obj1> on top of <obj2>”; “move <obj1> to right above <mark1>”.

Ofcourse, objects alone don’t fully represent spatial action. We introduce markers, or virtual positions that VLM marks. The marking tool essentially projects a pixel in the camera image (i,j) in to real world coordinate (x,y,z) using depth. A normal camera observation doesn’t distinguish marked objects, but it’s also possible to augment it with an object segmentation result. All of these are fed to the VLA as conditions.

Additional Work

In addition, we can implement much more powerful functions using classic controllers.

RPent’s instruction set is basic:

```
{"action": "move_to",     "xyz": [<x>,<y>,<z>], ...}
{"action": "move_pose",   "xyz": [<x>,<y>,<z>], "pose": <orientation>, ...}
{"action": "rotate_wrist","target_yaw": <float>, ...}
{"action": "rotate_pitch","target_pitch": <float>, ...}
{"action": "set_gripper", "gripper": <open|close>, ...}
{"action": "release",     ...}
{"action": "navigate_to", "xy": [<x>,<y>], ...}
{"action": "move_base",   "forward": <float>, "lateral": <float>, "turn": <float>, ...}
{"action": "vla_act",     "prompt": <str>, "max_chunks": <int>,
                          "stop": <predicate>}
```

Proposed additional tools:

```python
# Perception
def depth_map(camera_name:str, max_distance_m = 0.8, t=0) -> Image:
    "Depth map for reference, t=0 is current frame, t=-n is n*dt before now"
def image(camera_name:str, t=0, virtual_markers=True, object_6dof_position=True, def object_segmentation=False) -> Image:
    "Image for reference, markers are optional and may assist understanding"
def project(camera_name:str, pixel:tuple[int,int]) -> Vector3D:

# Movements
def grab(obj: ObjectID) -> ActionResultCode:
 """
 Grab an object; outcomes are:
  - Object not in view
  - Unknown Object ID
  - Claw already holding object
  - Attempt to grab, failed (please check image)
  - Success
 """
def halt_beside(obj:ObjectID, ref:Object|Marker|Pose3D, preposition:Left|Right|Behind|OnTop) -> ResultCode:
 """
 Move an object alongside to another object or a marker.
 Must be called after grabbing the object.
 The bounding box of a known object at a known orientation (EEF * EEF_To_OBJ) is computable from its nerual representation, which accurately defines "beside"
 """

def move_along(waypoints:list[Marker|Pose3D], smooth_curve=False) -> ResultCode:
 """
 Moves along (no matter whether holding object or not) a desired trajectory.
 """

def path_find(eef_radius_m:float, obstacles_pose_and_size: list[tuple[Pose3D, float]], goal: Marker|Pose3D) -> ResultCode:
 """
 Path-find to a goal position, avoiding obstacles along the way. 
 Each obstacle is defined as a sphere of center and radius. 
 EEF is considered a sphere; the robot arm has a built-in shape.
 """

# VLA Action
def vla_act(prompt:str, tiemout_s:float) -> ResultCode:
 ...

# State and Memory
type ObjectID=int
def time_stamp() -> int:
 ...
def object_in_claw() -> ObjectID | None:
 ...

def eef_pose() -> Pose3D:
 ...
```

## Limiting the Scope and Framing the Contribution

The full pipeline proposed above is impossible for a small team with limited time. The major blocker is VLA; it is known to take hundreds of episodes to make a vanilla pi0.5 start working in a new real-world environment, on the exact set of tasks that it is trained on. For the proposed fine-tuning, we are teaching it a few things at a time:

* Interpret spatial tokens as objects in the camera view.
* imagined positions
* Utilize 6-Dof Object Pose for better spatial accuracy.
* Generalize these capabilities to any unseen object.

The first three take 5000+ episodes of demonstrations. The last one probably never converges.

However, if we focus solely on the effectiveness of the 6-Dof spatial grounding, we can quantify its advantage with any visuomotor policy model. I lean strongly towards a language-free model because they converge smuch faster. Our establishment earlier is that a limited amount of those “elementary operations” is needed to complete complex tasks.

That ofcourse leaves my initial moltivation an open question: can this advantage convert to improvement in VLA generalizability, that ultiamately depends on whether today’s model is powerful enough. But we will never claim we achieved VLA generalizability; we simply show our method is a valuable direction.

As for the additional tools that we can implement, they simply provide a more robust baseline for VLM-planner-to-VLA-executor pipelines. It challenges these systems: is the VLA is coordinating with the VLM effectively, or has the VLM become powerful enough to do all the heavy lifting alone, and the VLA loses to a classical planner?
