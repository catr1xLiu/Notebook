# **TIME ADAPTATION**

The TimeAdaption algorithm solves a sequence of problems on a sequence of adapted meshes. The first mesh, the base mesh, is obtained from the meshing sequence. The new adapted mesh is obtained by evaluating the mesh element error indicator, selecting a set of elements based on the element pick function, and then finally refining these elements. The solution to the problem on the previous mesh is then mapped to the new mesh and time integration continues until the next mesh adaptation takes place. The time of mesh adaptation can be determined manually or automatically.

The time adaptive solver works in one geometry at a time. You specify the name of the geometry sequence in the property timeadapgeom. The solver only supports simplex meshes, and if the base mesh is not simplex it can be converted by using the property convertmesh.

The length of the time interval using a fixed adapted spatial mesh can be controlled manually or automatically by the property tauto. If the time integrator runs into problems the computation is restarted at the beginning of the previous time interval. The length of the new interval is reduced to a fraction of the current interval length. This fraction is specified by the property rf. In the tauto=manual case the time interval length is given by property tfrac; if tauto=automatic the property tfracauto controls the initial interval length. For both cases the shortest possible interval length is given by the property minti.

If the property tauto is set to automatic the TimeAdaption algorithm tries to determine the length of the time interval according to the requested fraction of maximum refinement. The fraction is given by the value of the property elfrac. A value of zero means no refinement of the base mesh and a value of one means refinement everywhere with the maximum number of refinements (set through property ngenlocal). The algorithm strives to assume the given value of elfrac by controlling the size of the time interval. The shortening and lengthening of the interval is determined by the interval reduction and growth factors. These are the properties rf and gf, respectively.

The error indicator is specified using the property eefunctime. A solution on the coarse base mesh is computed in the next time interval and the error indicator is evaluated at the points given by property samplepts. In this way a new adapted mesh appropriate for the next time interval can be generated and the computation on this new mesh is then started. The sample points must be specified as a number between 0 and 1 because they are interpreted as being relative to the time interval under consideration. Entering a scalar value of 0.5 means that the error indicator is evaluated at the midpoint of the interval.

After each mesh adaptation the time integration is restarted and you can control the time stepping by the Time type analogous properties consistentrestart and initialsteprestart.

## **COMPATIBILITY**

The property ngenlocal in versions prior to 5.5 has been renamed to maxrefinement.

