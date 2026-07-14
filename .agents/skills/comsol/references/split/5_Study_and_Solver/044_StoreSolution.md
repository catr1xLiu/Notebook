# *StoreSolution*

A placeholder for a solver sequence that is used to store a computed solution.

#### **SYNTAX**

```
model.sol(sname).create(fname,"StoreSolution")
model.sol(sname).feature(fname).getString("sol")
```

## **DESCRIPTION**

The store solution feature stores a reference to a computed solution. Use the sol property to find out the name of the referenced solution.

TABLE 6-72: VALID STORESOLUTION PROPERTY.

| PROPERTY | VALUE  | DEFAULT           | DESCRIPTION                                       |
|----------|--------|-------------------|---------------------------------------------------|
| sol      | String | A solver sequence | Name of solver sequence that stores the solution. |

In the case of a parametric sweep you can use the StoreSolution features to find the solutions created during the sweep. You first find out the solver sequence that holds the stored solutions

```
model.batch(pname).feature(fname).getString('psol')
```

where pname is the name of the parametric sweep feature that ran and fname is the name of the solution feature that stored the solutions. Use

```
model.sol(sname).feature().tags()
to find out the tags of the stored solutions. Use
  model.sol(sname).feature(fname).getString('sol')
to find the solver sequence for a parameter. Use
  model.sol(sname).getParamNames()
and
  model.sol(sname).getParamVals()
to find the parameter values that created the solution object.
```

