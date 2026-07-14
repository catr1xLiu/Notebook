# *FromMesh*

Create geometry (deformed configuration) from a (deformed) mesh.

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).importData();
```

To create a geometry sequence from a deformed mesh, use the createDeformedConfig method on a solution dataset, see Solution. Such a geometry sequence contains a FromMesh feature. This feature has the following properties

TABLE 3-85: VALID PROPERTIES FOR FROMMESH.

| NAME         | VALUE            | DESCRIPTION                                                                                                                                      |
|--------------|------------------|--------------------------------------------------------------------------------------------------------------------------------------------------|
| solution     | String           | Tag of solver sequence to take the deformed mesh from, or<br>none.                                                                               |
| enableupdate | on   off   none  | Enable update of the deformed configuration using the<br>importData() method.                                                                    |
| outertype    | solnum   none    | If the solver used a parametric sweep, then outertype is<br>solnum. Only used if enableupdate is on.                                             |
| outersolnum  | integer          | The index of the outer solution to use. Only used if<br>outertype is solnum.                                                                     |
| solvertype   | solnum   none    | If you can choose among the solver's solution vectors using<br>a solution number, then solvertype is solnum. Only used<br>if enableupdate is on. |
| solnum       | integer   interp | The index of the solution vector to use. Only used if<br>solvertype is solnum.                                                                   |
| timeinterp   | on   off         | The timeinterp property is on if solnum is interp.                                                                                               |
| t            | double           | Time to interpolate solution at. Only used if timeinterp<br>is on.                                                                               |
| solnumdescr  | String           | Description of the chosen solution. Only used if<br>enableupdate is off.                                                                         |

These properties determine the solution from which the deformed mesh is taken. You should not change the properties solution, enableupdate, outertype, solvertype, timeinterp, or solnumdescr. Only change the properties outersolnum, solnum, and t (but only if enableupdate is on).

model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).importData() updates the geometry based on the current value of the solution in the feature's corresponding solver sequence.

