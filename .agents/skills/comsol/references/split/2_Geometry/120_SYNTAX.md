# **SYNTAX**

*Partition*

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"Partition");
model.component(<ctag>).geom(<tag>).feature().selection(property);
model.component(<ctag>).geom(<tag>).feature().set(property,<value>);
model.component(<ctag>).geom(<tag>).feature().getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).setAttribute(attribute,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getAttribute(attribute);
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

## **DESCRIPTION**

The Partition Boolean operation partitions each input object using a set of tool objects or (in 3D only) a work plane. That is, within the input object new boundaries, edges, and vertices are created that come from the tools or the work plane.

The following properties are available:

| PROPERTY      | VALUE               | DEFAULT                                | DESCRIPTION                                   |
|---------------|---------------------|----------------------------------------|-----------------------------------------------|
| absrepairtol  | double              | geom( <tag>).<br/>absRepairTol()</tag> | Absolute repair tolerance.                    |
| contributeto  | String              | none                                   | Tag of cumulative selection to contribute to. |
| input         | Selection           | empty                                  | Objects to partition.                         |
| keepinput     | on   off            | off                                    | Keep input objects.                           |
| keeptool      | on   off            | off                                    | Keep tool objects.                            |
| partitionwith | objects   workplane | objects                                | Partition with tool objects or a work plane.  |

| PROPERTY      | VALUE                                      | DEFAULT                                 | DESCRIPTION                                                                                                                                                                                                                                   |
|---------------|--------------------------------------------|-----------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| propagatesel  | on   off                                   | on                                      | Propagate selections from input objects to<br>resulting objects.                                                                                                                                                                              |
| repairtol     | double                                     | geom( <tag>).<br/>repairTol()</tag>     | Relative repair tolerance, relative to size of<br>union of inputs.                                                                                                                                                                            |
| repairtoltype | auto   relative  <br>absolute              | geom( <tag>).<br/>repairTolType()</tag> | Repair tolerance type: automatic, relative, or<br>absolute.                                                                                                                                                                                   |
| selresult     | on   off                                   | off                                     | Create selections of all resulting objects.                                                                                                                                                                                                   |
| selresultshow | all   obj   dom   bnd  <br>edg   pnt   off | dom                                     | Show selections, if selresult is on, in<br>physics, materials, and so on; in part<br>instances; or in 3D from a plane geometry.<br>obj is not available in a component's<br>geometry. dom, bnd, and edg are not<br>available in all features. |
| tool          | Selection                                  | empty                                   | Tool objects.                                                                                                                                                                                                                                 |
| workplane     | String                                     |                                         | Work plane to partition with.                                                                                                                                                                                                                 |

For information about the selresult and contributeto properties, see Selections of Geometric Entities.

The following attributes are available:

TABLE 3-130: VALID ATTRIBUTES

| NAME         | VALUE                 | DEFAULT | DESCRIPTION                                                                                                                                                                    |
|--------------|-----------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| construction | on   off  <br>inherit | inherit | Designate the resulting objects as<br>construction geometry. Use inherit to set<br>the construction geometry attribute only if<br>all input objects are construction geometry. |

