# *Vectorized Selections of Geometric Entities*

For all selections of geometric entities, you can use the add method in a way that the following example demonstrates:

```
model.view("view1").hideObjects("hide1").add(new String[]{"arr1(2,1,1)", "arr1(3,1,1)"}, 
new int[][]{{1, 2, 3, 4, 5, 6}, {1, 2, 3, 4});
```

This code adds all given entities for each object to the selection. In the same way, you can use vectorized calls to the set and remove methods.

