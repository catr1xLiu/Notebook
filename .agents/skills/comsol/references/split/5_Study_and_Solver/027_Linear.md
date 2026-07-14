# *Linear*

Handle linear system solvers with three different attribute features: Direct, Iterative, and Multigrid.

#### **SYNTAX**

```
sol.feature(fname).create(lname,"Direct")
sol.feature(fname).feature(lname).set(pname,value)
sol.feature(fname).create(lname,"Iterative")
sol.feature(fname).feature(lname).set(pname,value)
sol.feature(fname).feature(lname).create(pcname,PType);
sol.feature(fname).feature(lname).feature(pcname).set(pname,value)
sol.feature(fname).feature(lname).create(pname,"Multigrid")
sol.feature(fname).feature(lname).feature(pname).feature("pr").create(prename,SType)
sol.feature(fname).feature(lname).feature(pname).feature("po").create(postname,SType)
sol.feature(fname).feature(lname).feature(pname).feature("cs").create(cname,CType)
sol.feature(fname).feature(lname).feature(pname).feature("pr").feature(prename).
  set(pname,value)
sol.feature(fname).feature(lname).feature(pname).feature("po").feature(postname).
  set(pname,value)
sol.feature(fname).feature(lname).feature(pname).feature("cs").feature(cname).
  set(pname,value)
```

*PType* is any of the allowed preconditioner feature types. These types are Direct preconditioner, Multigrid, Domain decomposition, SCGS, SOR, SOR Gauge, SOR Vector, Vanka, SOR Line, AMS, Auxiliary-Space AMG, Incomplete LU, Krylov, and Block Navier–Stokes. *SType* is any of the allowed smoother types. These are the same as the *PType* except Domain decomposition, Multigrid, AMS, and Auxiliary-Space AMG. *CType* is any of the allowed coarse grid solver types: Direct and all types listed for *PType*.

*Presmoother, AMG Presmoother, Postsmoother, AMG Postsmoother, Coarse Solver, AMG Coarse Solver, SchurSolver, SchurSourceSolver, PressureSolver, and VelocitySolver*

Specify the Presmoother and AMG Presmoother, Postsmoother and AMG Postsmoother, Coarse Solver and AMG Coarse Solver, Schur Solver, Schur Source Solver, Pressure Solver, and Velocity Solver via feature("pr"), feature("po"), feature("cs"), feature("sso"), feature("ssso"), feature("ps"), and feature("vs"), respectively. These features are for administrative purposes only and do not contain any settings themselves.

#### **DESCRIPTION**

Three attribute features for linear system solvers.

