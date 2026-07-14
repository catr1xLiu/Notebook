# **EXAMPLES:**

GMRES with ILU as preconditioner:

```
Code for Use with Java
  SolverFeature solver = sol.feature(fname).create("iter1","Iterative");
  solver.set("solver","gmres");
```

```
solver.create("ilu","IncompleteLU");
Code for Use with MATLAB
  solver = sol.feature(fname).create('iter1','Iterative');
  solver.set('solver','gmres');
  solver.create('ilu','IncompleteLU');
Change the preconditioner to GMG/SORVector/SPOOLES:
Code for Use with Java
  solver.create("gmg","Multigrid");
  solver("gmg").set("solver","gmg");
  solver("gmg").feature("pr").create("p1","SORVector");
  solver("gmg").feature("po").create("p1","SORVector");
  SolverFeature csolver = solver("gmg").feature("csolver").create("c1","Direct");
  csolver.set("solver","spooles");
  csolver.set("errorchkd","on");
Code for Use with MATLAB
  solver.create('gmg','Multigrid');
  solver('gmg').set('solver','gmg');
  solver('gmg').feature('pr').create('p1','SORVector');
  solver('gmg').feature('po').create('p1','SORVector');
  csolver = solver('gmg').feature('csolver').create('c1','Direct');
  csolver.set('solver','spooles');
  csolver.set('errorchkd','on');
Use Conjugate Gradients instead of GMRES:
Code for Use with Java
  solver.set("solver","cg");
Code for Use with MATLAB
  solver.set('solver','cg');
Use the sparse approximate inverse (SAI) preconditioner using a sparsity pattern of SAI defined by a power of 3 of 
the system matrix:
Code for Use with Java
  model.sol("sol1").feature("t1").create("i1", "Iterative");
  model.sol("sol1").feature("t1").feature("i1").set("linsolver", "cg");
  model.sol("sol1").feature("t1").feature("i1").create("sai1", "SAI");
  model.sol("sol1").feature("t1").feature("i1").feature("sai1").set("saisymm", "on");
  model.sol("sol1").feature("t1").feature("i1").feature("sai1").
     set("saipattern","saipowa");
  model.sol("sol1").feature("t1").feature("i1").feature("sai1").set("saipowera", "3");
Code for Use with MATLAB
  iter = model.sol('sol1').feature('t1').create('i1', 'Iterative');
  iter.set('linsolver', 'cg');
  iter.create('sai1', 'SAI');
  iter.feature('sai1').set('saisymm', 'on');
  iter.feature('sai1').set('saipattern','saipowa');
  iter.feature('sai1').set('saipowera', '3');
```

## **THE PREFUN PROPERTY**

The prefun property for the solver (preconditioner) accepts a different set of values depending on the context. In the section below, its possible values and default value is listed for each preconditioner that supports it.

#### **DIRECT PROPERTIES**

TABLE 6-38: VALID DIRECT PROPERTIES (FOR ALL SOLVERS).

| PROPERTY        | VALUES                               | DEFAULT                       | DESCRIPTION                                                              |
|-----------------|--------------------------------------|-------------------------------|--------------------------------------------------------------------------|
| errorchk        | off   on   auto                      | auto                          | Check error estimate.                                                    |
| errorratiobound | nonnegative scalar                   | 0.5                           | Error ratio bound (typical values in the<br>range of 0–1).               |
| iterrefine      | on   off                             | on<br>off (eigenvalue solver) | Iterative refinement.                                                    |
| linsolver       | mumps   pardiso  <br>spooles   dense | mumps                         | Method to use.                                                           |
| maxrefinesteps  | nonnegative integer                  | 15                            | Maximum number of iterative refinement<br>steps.                         |
| nliniterrefine  | on   off                             | off                           | Use iterative refinement in nonlinear<br>solver.                         |
| prefun          | mumps   pardiso  <br>spooles   dense | mumps                         | Solver for preconditioner (MUMPS,<br>PARDISO, SPOOLES, or Dense Matrix). |
| rhob            | scalar > 1                           | 1                             | Factor in linear error estimate.                                         |

TABLE 6-39: OPTIONAL DIRECT PROPERTIES.

| PROPERTY         | VALUES                          | DEFAULT   | DESCRIPTION                                                                                             |
|------------------|---------------------------------|-----------|---------------------------------------------------------------------------------------------------------|
| clusterpardiso   | on   off                        | off       | Use Parallel Direct Sparse Solver for Clusters<br>(PARDISO).                                            |
| incore           | auto   manual                   | auto      | In-core memory method (PARDISO, MUMPS).                                                                 |
| internalmemusage | positive real                   | 3         | Internal memory usage factor (PARDISO,<br>MUMPS).                                                       |
| memfracooc       | scalar between 0 and 1          | 0.99      | Fraction of memory to store out of core.                                                                |
| minicmemory      | positive real                   | 512.0     | Minimum in-core memory in MB (PARDISO,<br>MUMPS).                                                       |
| mumpsalloc       | scalar at least 1               | 1.2       | MUMPS memory allocation factor (MUMPS).                                                                 |
| mumpsblr         | on   off                        | off       | Block low rank factorization (MUMPS).                                                                   |
| mumpsblrtol      | scalar between 0 and 1          | 1e-8      | Block low rank factorization tolerance (MUMPS).                                                         |
| mumpsblrtype     | normal   aggressive             | normal    | The compression type for the block low rank<br>factorization.                                           |
| mumpsreorder     | auto   amd   amf  <br>qamd   nd | auto      | Preordering algorithm (MUMPS).                                                                          |
| mumpsrreorder    | on   off                        | on        | Row preordering (MUMPS).                                                                                |
| ooc              | automatic   on   off            | automatic | Use out-of-core (PARDISO, MUMPS). The<br>automatic option switches to out-of-core<br>storage if needed. |
| oocmemory        | positive real                   | 512.0     | In-core memory in MB (PARDISO, MUMPS).                                                                  |
| pardmtsolve      | on   off                        | off       | Multithreaded forward and backward solve<br>(PARDISO).                                                  |
| pardreorder      | mmd   nd   ndmt                 | nd        | Preordering algorithm (PARDISO).                                                                        |
| pardrreorder     | on   off                        | on        | Row preordering algorithm (PARDISO).                                                                    |
| pardschedule     | auto   one   two                | auto      | Scheduling method (PARDISO).                                                                            |
| pivotenable      | on   off                        | on        | Use pivoting (MUMPS).                                                                                   |

TABLE 6-39: OPTIONAL DIRECT PROPERTIES.

| PROPERTY      | VALUES                 | DEFAULT | DESCRIPTION                                                                            |
|---------------|------------------------|---------|----------------------------------------------------------------------------------------|
| pivotperturb  | scalar between 0 and 1 | 1e-8    | Pivot perturbation threshold (PARDISO,<br>MUMPS).                                      |
| pivotrefines  | nonnegative integer    | 0       | Number of forced iterative refinements<br>(PARDISO, MUMPS).                            |
| pivotstrategy | on   off               | off     | Use 2-by-2 Bunch-Kaufman pivoting (on) or<br>1-by-1 diagonal pivoting (off) (PARDISO). |
| preorder      | mmd   nd   ms   bestof | nd      | Preordering algorithm (SPOOLES).                                                       |
| reusereorder  | true   false           | true    | Reuse preordering (PARDISO, MUMPS).                                                    |
| thresh        | scalar between 0 and 1 | 0.1     | Pivot threshold (MUMPS, SPOOLES).                                                      |
| usetotmemory  | scalar between 0 and 1 | 0.8     | Used fraction of total memory (PARDISO,<br>MUMPS).                                     |

#### **ITERATIVE PROPERTIES**

TABLE 6-40: VALID ITERATIVE PROPERTIES (FOR ALL SOLVERS).

| PROPERTY  | VALUES                                              | DEFAULT                      | DESCRIPTION                                                                                                                    |
|-----------|-----------------------------------------------------|------------------------------|--------------------------------------------------------------------------------------------------------------------------------|
| errorchk  | off   on   auto                                     | auto                         | Validate error estimate.                                                                                                       |
| linsolver | gmres   fgmres   bicgstab  <br>tfqmr   cg   precond | gmres, ilu<br>(precond)      | Method to use.                                                                                                                 |
| maxilinit | positive integer                                    | 100                          | Maximum number of intermediate<br>iteration for the iterative solver in<br>error checking. Available when<br>errorchk is auto. |
| maxlinit  | positive integer                                    | 10000<br>500 (coarse solver) | Maximum number of linear<br>iterations (when used with a<br>tolerance).                                                        |
| rhob      | scalar > 1                                          | 1                            | Factor in linear error estimate.                                                                                               |

TABLE 6-41: OPTIONAL ITERATIVE PROPERTIES.

| PROPERTY   | VALUES                 | DEFAULT                                                                                                                                                                          | DESCRIPTION                                                                                                                             |
|------------|------------------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|-----------------------------------------------------------------------------------------------------------------------------------------|
| approxscgs | true   false           | false                                                                                                                                                                            | Use approximate approximation, if<br>vankavarsactive is set to true<br>(SCGS).                                                          |
| droptol    | scalar between 0 and 1 | 0.01 when<br>used as<br>preconditioner;<br>1 when used as<br>presmoother,<br>postsmoother,<br>or coarse<br>solver; 0.001<br>for Hierarchical<br>LU and Sparse<br>Localized Schur | Drop tolerance (SPOOLES, Hierarchical<br>LU, Incomplete LU with tolerance<br>element dropping strategy, and Sparse<br>Localized Schur). |
| droptype   | tol   fill             | tol                                                                                                                                                                              | Element dropping strategy for<br>Incomplete LU (Tolerance, Fill ratio).                                                                 |
| eigk       | positive integer       | 25                                                                                                                                                                               | Number of approximate eigenvectors,<br>when gcrodr is set to true (GMRES).                                                              |

TABLE 6-41: OPTIONAL ITERATIVE PROPERTIES.

| PROPERTY      | VALUES                                 | DEFAULT                   | DESCRIPTION                                                                                                                                                                                    |
|---------------|----------------------------------------|---------------------------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| eigkrel       | scalar between 0 and 1                 | 0.5                       | Fraction of GMRES iterations when<br>gcrodrrel is set to true (GMRES).                                                                                                                         |
| elimtol       | scalar between 0 and 1                 | 1                         | Elimination tolerance (Hierarchical LU).                                                                                                                                                       |
| fillratio     | nonnegative integer                    | 1                         | Fill ratio (Incomplete LU with Fill ratio<br>element dropping strategy and SAI).                                                                                                               |
| gcrodr        | true   false                           | true                      | Use GCRO-DR for an adaptive<br>restarted GMRES solver (GMRES).                                                                                                                                 |
| gcrodrrel     | true   false                           | false                     | Use relative subspace size when gcrodr<br>is set to true (GMRES).                                                                                                                              |
| hybridcomp    | vector of strings                      |                           | Field/State components in step if<br>hybridvarspec=manual.                                                                                                                                     |
| hybridization | single   multi                         | single                    | Use a single preconditioner or multiple<br>preconditioner as a hybrid<br>preconditioner.                                                                                                       |
| hybridvar     | vector of strings                      |                           | Fields/States in step.                                                                                                                                                                         |
| hybridvarspec | all   manual                           | all                       | Include all components or specify which<br>manually.                                                                                                                                           |
| irestol       | scalar between 0 and 1                 | 0.01                      | Residual tolerance when prefuntype is<br>left (gmres, cg, bicgstab, tfqmr).                                                                                                                    |
| ilutdroptol   | scalar between 0 and 1                 | 0.01                      | Drop tolerance (ILUT).                                                                                                                                                                         |
| ilutfillratio | nonnegative integer                    | 1                         | Fill ratio (ILUT).                                                                                                                                                                             |
| iter          | nonnegative integer                    | 2 (1 for ILU and<br>ILUT) | Fixed number of iterations (when used<br>as preconditioner, smoother, or coarse<br>solver), for all iterative solvers except<br>direct preconditioner when iterm is set<br>to iter or itertol. |
| iterm         | tol   iter   itertol                   | iter                      | Termination technique (when<br>Incomplete LU, ILUT, or ILU0 are used<br>as coarse solver or Localized Schur or<br>Sparse Localized Schur are used as<br>Schur solver).                         |
| itol          | scalar between 0 and 1                 | 0.1                       | Relative tolerance when iterm is set to<br>tol or itertol.                                                                                                                                     |
| itrestart     | positive integer                       | 50                        | Number of iterations before restart<br>(gmres, fgmres).                                                                                                                                        |
| keepy         | auto   on   off                        | auto                      | Reuse the subspace when gcrodr is set<br>to true (GMRES).                                                                                                                                      |
| linesweeptype | ssor   sor   soru                      | ssor                      | The sweep type, which decides in which<br>order the blocks are looped through<br>(SCGS, SOR line, Vanka).                                                                                      |
| matrixformat  | auto   sparse   filled  <br>matrixfree | auto                      | Matrix format.                                                                                                                                                                                 |
| maxlinit      | positive integer                       | 10                        | Maximum number of iterations when<br>iterm is set to tol.                                                                                                                                      |
| nrkeepss      | positive integer                       | 5                         | Minimum number of restarts for<br>GCRO-DR, when keepy is set to auto.                                                                                                                          |
| prefun        | ilu   ilut   ilu0  <br>spooles         | ilu                       | Solver (preconditioner) for Incomplete<br>LU, ILUT (Intel MKL), ILU0 (Intel MKL),<br>or SPOOLES).                                                                                              |

TABLE 6-41: OPTIONAL ITERATIVE PROPERTIES.

| PROPERTY             | VALUES                               | DEFAULT                | DESCRIPTION                                                                                                                       |
|----------------------|--------------------------------------|------------------------|-----------------------------------------------------------------------------------------------------------------------------------|
| prefuntype           | auto (SAI only)   left  <br>right    | left (auto for<br>SAI) | Left or right preconditioning (gmres,<br>cg, bicgstab, tfqmr, SAI). For SAI, the<br>default preconditioning type is auto.         |
| relax                | scalar between 0 and 2               | 1                      | Relaxation factor (Jacobi, SOR-based<br>algorithms, ILU, ILUT, SAI, Vanka, and<br>Hierarchical LU).                               |
| respectpattern       | on   off                             | on                     | Respect the matrix pattern (ILU).                                                                                                 |
| reuselines           | on   off                             | on                     | Reuse lines of nodes (SOR line).                                                                                                  |
| reusepattern         | true   false                         | true                   | Reuse sparsity pattern (SCGS).                                                                                                    |
| reuseprolongators    | on   off                             | on                     | Reuse blocks of data (SCGS, SOR line,<br>Vanka).                                                                                  |
| saicolmaxfactor      | positive integer                     | 5                      | Limit the maximum number of nonzero<br>elements of each column in the SAI<br>preconditioner matrix.                               |
| saisymm              | auto   off   on  <br>hermitian       | auto                   | Symmetry characteristics of SAI method<br>corresponding to Automatic,<br>Nonsymmetric, Symmetric, and<br>Hermitian, respectively. |
| saipattern           | sysmat   saipowa                     | sysmat                 | Sparsity pattern of SAI defined by<br>system matrix or power of system<br>matrix.                                                 |
| saipowera            | positive integer                     | 2                      | Power of system matrix for SAI sparsity<br>pattern.                                                                               |
| scgsblocked          | true   false                         | true                   | Use a blocked version (SCGS).                                                                                                     |
| scgsdirectmaxsize    | positive integer                     | 150                    | Maximum size for direct stored<br>factorization, if scgssolv is approx.                                                           |
| scgsfilter           | true   false                         | true                   | Apply filter to lines (SCGS)                                                                                                      |
| scgsfilteraggressive | true   false                         | true                   | Use an efficient smoother when a filter<br>is applied to lines (SCGS),.                                                           |
| scgsfilteramglvls    | true   false                         | false                  | Apply filter to AMG levels only, if<br>scgsfilter is true (SCGS).                                                                 |
| scgsfilterelems      | true   false                         | true                   | Filter individual elements, if<br>scgsfilter is true (SCGS)                                                                       |
| scgslinefiltertype   | none   filterstart  <br>filterall    | filterstart            | Apply filter to elements: none, unique<br>start elements, or unique lines, if<br>scgsfilter is true (SCGS).                       |
| scgsmethod           | elements   lines  <br>lines_vertices | elements               | Method for SCGS: Mesh elements, Mesh<br>element lines, or Mesh element lines and<br>vertices (SCGS).                              |
| scgsmumpsminsize     | positive integer                     | 150                    | Maximum size for MUMPS factorization,<br>if scgssolv is approx.                                                                   |
| scgsrelax            | scalar between 0 and 2               | 1                      | Relaxation factor (SCGS).                                                                                                         |
| scgsrestart          | positive integer                     | 100                    | GMRES restart value (SCGS).                                                                                                       |
| scgsreusemeshdata    | true   false                         | true                   | Reuse mesh data (SCGS).                                                                                                           |
| scgssolv             | gmres   direct   stored<br>  approx  | gmres                  | Local block solver (SCGS).                                                                                                        |
| scgstol              | positive scalar                      | 0.02                   | GMRES tolerance (SCGS).                                                                                                           |

TABLE 6-41: OPTIONAL ITERATIVE PROPERTIES.

| PROPERTY           | VALUES                              | DEFAULT | DESCRIPTION                                                                                       |
|--------------------|-------------------------------------|---------|---------------------------------------------------------------------------------------------------|
| seconditer         | positive integer                    | 1       | Number of second iterations.                                                                      |
| sorblocked         | on   off                            | on      | Blocked SOR method.                                                                               |
| sorvecdof          | vector of strings                   |         | Vector element variables (SOR vector<br>and SOR gauge algorithms).                                |
| symmetric          | on   off                            | off     | Use symmetric form; ssor instead of sor,<br>and so forth. (SOR, SORVector,<br>SORGauge, SORLine). |
| thresh             | scalar between 0 and 1              | 1       | Pivot threshold (ILU).                                                                            |
| transpose          | on   off                            | off     | Use transposed form; soru instead of<br>sor and so forth. (SOR, SORVector,<br>SORGauge, SORLine). |
| usenlweights       | true   false                        | true    | Terminate using nonlinear scales<br>(GMRES with left preconditioning).                            |
| vankablocked       | on   off                            | on      | Blocked Vanka method.                                                                             |
| vankadirectmaxsize | positive integer                    | 150     | Maximum size for direct stored<br>factorization, if vankasolv is approx.                          |
| vankamumpsminsize  | positive integer                    | 150     | Maximum size for MUMPS factorization,<br>if vankasolv is approx.                                  |
| vankarelax         | scalar between 0 and 2              | 0.8     | Relaxation factor for Vanka update.                                                               |
| vankarestart       | positive integer                    | 100     | GMRES restart value (Vanka).                                                                      |
| vankasolv          | gmres   direct   stored<br>  approx | gmres   | Local block solver (Vanka).                                                                       |
| vankatol           | positive scalar                     | 0.02    | GMRES tolerance (Vanka).                                                                          |
| vankavars          | vector of strings                   | {}      | Lagrange multiplier variables (Vanka,<br>SCGS).                                                   |
| vankavarsactive    | true   false                        | false   | Use Vanka variables (SCGS).                                                                       |

The property divcleantol is used in the inequality |*TTb*| < divcleantol*·*|*b*| to ensure that the numerical divergence after divergence cleaning is small enough; see SOR Gauge in the *COMSOL Multiphysics Reference Manual*.

## **MULTIGRID PROPERTIES**

TABLE 6-42: VALID MULTIGRID PROPERTIES.

| PROPERTY      | VALUES               | DEFAULT                                                        | DESCRIPTION                                                                                           |
|---------------|----------------------|----------------------------------------------------------------|-------------------------------------------------------------------------------------------------------|
| gmglevels     | positive integer     | 1                                                              | Maximum number of geometric multigrid levels.                                                         |
| iter          | integer              | 2                                                              | Fixed number of iterations (when used as<br>preconditioner, smoother, or coarse solver).              |
| linsolver     | gmg   amg            | gmg                                                            | Method to use.                                                                                        |
| maxlinit      | positive integer     | 500                                                            | Maximum number of linear iterations (when used with a<br>tolerance).                                  |
| mgcycle       | v   w   f            | v                                                              | Cycle type.                                                                                           |
| mglevels      | positive integer     | 5                                                              | Maximum number of algebraic multigrid levels.                                                         |
| prefermatfree | true   false         | false                                                          | Prefer the free matrix format.                                                                        |
| prefun        | gmg   amg  <br>saamg | amg if used as<br>Krylov<br>preconditioner.<br>gmg, otherwise. | Solver for preconditioner (Geometric multigrid,<br>Algebraic multigrid, or Smoothed aggregation AMG). |
| rhob          | scalar > 1           | 1                                                              | Factor in linear error estimate.                                                                      |

TABLE 6-43: OPTIONAL MULTIGRID PROPERTIES.

| PROPERTY           | VALUES               | DEFAULT  | DESCRIPTION                                                                              |
|--------------------|----------------------|----------|------------------------------------------------------------------------------------------|
| agglevel           | positive integer     | 2        | Multigrid level to start smoothing at, if<br>aggmethod=manual (saamg).                   |
| aggmethod          | auto   manual        | auto     | Smoothing of prolongations if<br>usesmooth=on (saamg).                                   |
| amgauto            | integer from 1 to 10 | 3        | Quality of multigrid hierarchy (amg).                                                    |
| amgcompwise        | true   false         | true     | Construct prolongators<br>componentwise (amg).                                           |
| assemall           | on   off             | on       | Assemble on the order-lowered levels<br>when loweramg is on (amg and<br>saamg).          |
| coarseningmethod   | parallel   classic   | parallel | The coarsening method to use (amg).                                                      |
| compactaggregation | on   off             | off      | Use an aggregation algorithm that leads<br>to a less rapid coarsening (saamg).           |
| geomuse            | vector of strings    |          | Geometries for geometric multigrid<br>hierarchy.                                         |
| hybridization      | single   multi       | single   | Use a single preconditioner or multiple<br>preconditioner as a hybrid<br>preconditioner. |
| hybridvar          | vector of strings    |          | Fields/States in step.                                                                   |
| hybridvarspec      | all   manual         | all      | Include all components or specify<br>which manually.                                     |
| hybridcomp         | vector of strings    |          | Field/State components in step if<br>hybridvarspec=manual.                               |
| jacdamp            | positive scalar      | 2/3      | Jacobi damping factor if<br>usesmooth=on (saamg).                                        |
| kwslaplacemg       | on   off             | off      | Keep generated weak contribution.                                                        |
| loweramg           | on   off             | on       | Lower the element order first (any)<br>(amg and saamg).                                  |

TABLE 6-43: OPTIONAL MULTIGRID PROPERTIES.

| PROPERTY                  | VALUES                                                                              | DEFAULT | DESCRIPTION                                                                           |
|---------------------------|-------------------------------------------------------------------------------------|---------|---------------------------------------------------------------------------------------|
| massem                    | on   off                                                                            | on      | Assemble on multigrid levels (gmg).                                                   |
| maxcoarsedof              | positive integer                                                                    | 5000    | Maximum number of DOFs at coarsest<br>level (amg, saamg).                             |
| mcaseassem                | vector of strings                                                                   |         | Multigrid levels where assemble should<br>be performed (gmg,<br>mcasegen=manual).     |
| mcasegen                  | manual   all   any  <br>coarse   coarseorder<br>  refine   refineany  <br>refineall | any     | Hierarchy generation method (gmg).                                                    |
| mcaseuse                  | vector of strings                                                                   |         | Multigrid levels which should be used<br>(gmg, mcasegen=manual).                      |
| mindofthread              | positive integer                                                                    | 5000    | Minimum number of DOFs per thread<br>on multigrid levels (when prefun is<br>not gmg). |
| mkeep                     | on   off                                                                            | off     | Keep generated mesh cases (gmg).                                                      |
| nullspace                 | constant   rbm                                                                      |         | Null-space vectors: constant or rigid<br>body modes (saamg).                          |
| prolongatoronlystrongconn | on   off                                                                            | on      | Use a sparser prolongator to achieve<br>better performance per iteration<br>(amg).    |
| prolongatortruncation     | positive scalar                                                                     | 0.1     | Prolongator truncation factor (amg).                                                  |
| reuseprolongators         | on   off                                                                            | on      | Reuse prolongators when possible<br>(saamg).                                          |
| rmethod                   | regular   longest                                                                   | regular | Mesh refinement method (gmg).                                                         |
| saamgcompwise             | on   off                                                                            | off     | Construct the SAAMG prolongators<br>componentwise (saamg).                            |
| scale                     | vector of positive<br>numbers                                                       | 2       | Mesh scale factor (gmg).                                                              |
| strconn                   | positive scalar                                                                     | 0.01    | Strength of connection (saamg).                                                       |
| strconnamgp               | positive scalar                                                                     | 0.25    | Strength of connection (amg).                                                         |
| usefilter                 | on   off                                                                            | on      | Use filtering if usesmooth=on<br>(saamg).                                             |
| usesmooth                 | on   off                                                                            | on      | Use prolongation smoothing (saamg).                                                   |

The useaggressive property is no longer used from version 5.3. For the geometric multigrid solver/ preconditioners, the multigrid hierarchy is controlled in the following way (see also Multigrid in the *COMSOL Multiphysics Reference Manual*):

- **•** If mcasegen=all, any, or coarse, coarseorder, then the multigrid hierarchy is automatically constructed starting from the mesh and discretization set by the study. The number of multigrid levels generated is given in the property gmglevels. The method all and any first tries to lower the discretization order for the shape functions used, and secondly coarsens the mesh. The method all lowers the order (by one) if all used shape functions can be lowered. The method any lowers the order (by one) if at least one shape function can be lowered. The method coarse does not lower the order, it only coarsens the mesh. The method coarseorder both lowers the order (for any shape functions that can be lowered by one) and coarsen the mesh, at the same time.
- **•** If mcasegen=refine, refineany, or refineall then the multigrid hierarchy is automatically constructed by a combination of refining the mesh given by the study and changing the discretization. The number of multigrid

levels generated is given in the property gmglevels. The refinement method can be specified using the property rmethod. The originally selected mesh for the study is used, in the case of refining the mesh, in a multigridlevel and the finest multigrid level generated is used for the study (solved for). The generated multigrid levels are kept in the model and the mcasegen property is changed into manual. The method refine only refines the mesh and does not change the shape function order. The method refineany and refineall first tries to lower the order, and secondly refines the mesh. The method refineany constructs a multigrid level by lowering the order (by one) if at least on shape function can be lowered. The method refineall generates multigrid levels by lowering the order (by one) if all used shape function can be lowered.

**•** If mcasegen=manual, then the existing multigrid levels (children to the current study) can be used. The subset to use is selected by giving their tags to the mcaseuse property.

The construction of coarse level matrices is controlled by the property massem and mcaseassem. The first property controls if the matrices should be assembled for the automatically generated levels. If set to off, prolongation and restriction matrices are used to project the matrices from the top level in the hierarchy. The second property controls which multigrid levels that should use the assemble technique in the mcasegen=manual case.

When an iterative solver is used as preconditioner, smoother, or coarse solver, you can choose whether to solve using a tolerance or to perform a fixed number of iterations. When used as a coarse solver, the default is to solve using a tolerance. When used as a preconditioner or smoother, the default is to perform a fixed number of iterations. If both properties itol and iter are given, the program solves using a tolerance.

## **DOMAIN DECOMPOSITION PROPER TIES (SCHWARZ AND SCHUR)**

TABLE 6-44: VALID DOMAIN DECOMPOSITION PROPERTIES (SCHWARZ AND SCHUR).

| PROPERTY           | VALUE                     | DEFAULT    | DESCRIPTION                                                                                                                              |
|--------------------|---------------------------|------------|------------------------------------------------------------------------------------------------------------------------------------------|
| agglevel           | positive integer          | 2          | Multigrid level to start smoothing at, if<br>aggmethod =manual (aggregation)<br>(Schwarz only).                                          |
| aggmethod          | auto   manual             | auto       | Postpone prolongation smoothing<br>(aggregation) (Schwarz only).                                                                         |
| amgauto            | integer from 1 to 10      | 3          | Quality of multigrid hierarchy<br>(algebraic) (Schwarz only).                                                                            |
| amgauto            | integer from 1 to 10      | 3          | Quality of multigrid hierarchy<br>(algebraic) (Schwarz only).                                                                            |
| assemall           | on   off                  | on         | Assemble on the order-lowered levels<br>(algebraic, aggregation) if<br>loweramgdd is on (Schwarz only).                                  |
| compactaggregation | on   off                  | off        | Use an aggregation algorithm that leads<br>to a less rapid coarsening<br>(aggregation) (Schwarz only).                                   |
| ddreordermethod    | none   dissection   space | dissection | Element preordering method: none,<br>nested dissection, or using a space-filling<br>curve.                                               |
| ddvisualize        | Boolean                   | false      | Visualize domains in the domain<br>decomposition instead of the finite<br>element solution.                                              |
| domdofmax          | integer                   | 1          | Maximum number of nodes per<br>subdomain.                                                                                                |
| domgeom            | vector of strings         |            | Partition geometries.                                                                                                                    |
| domnodesmax        | integer                   | 100000     | Maximum number of DOFs per<br>subdomain.                                                                                                 |
| geomuse            | vector of strings         |            | Use coarse level in geometries (for<br>mcasegen=coarseorder   all   any  <br>coarse   refineall   refineany  <br>refine) (Schwarz only). |
| hybridcomp         | vector of strings         |            | Field/state components in step /<br>Preconditioner selection (for<br>hybridvarspec= manual).                                             |
| hybridization      | single   multi            | single     | Use a single preconditioner or multiple<br>preconditioner as a hybrid<br>preconditioner.                                                 |
| hybridvar          | vector of strings         |            | Fields/states in step / Preconditioner<br>variables (for hybridization=multi).                                                           |
| hybridvarspec      | all   manual              | all        | Include all components or specify which<br>manually (for hybridization=multi).                                                           |
| includeextradim    | Boolean                   | true       | Include extra dimensions (if used) in the<br>partitioning of domains for the domain<br>decomposition.                                    |
| iter               | integer                   | 1          | Number of iterations.                                                                                                                    |
| jacdamp            | positive scalar           | 2/3        | Jacobi damping factor (aggregation)<br>(Schwarz only).                                                                                   |

TABLE 6-44: VALID DOMAIN DECOMPOSITION PROPERTIES (SCHWARZ AND SCHUR).

| PROPERTY                | VALUE                                                                               | DEFAULT                   | DESCRIPTION                                                                                                                                 |
|-------------------------|-------------------------------------------------------------------------------------|---------------------------|---------------------------------------------------------------------------------------------------------------------------------------------|
| keepschur               | on   off                                                                            | on                        | Keep Schur complement matrices<br>(Schur only).                                                                                             |
| kwslaplacemg            | on   off                                                                            | off                       | Keep generated weak contribution.                                                                                                           |
| loweramgdd              | on   off                                                                            | on                        | Lower element order first (algebraic,<br>aggregation) (Schwarz only).                                                                       |
| massem                  | on   off                                                                            | on                        | Assemble on coarse level (for<br>mcasegen=coarseorder   all   any  <br>coarse   refineall   refineany  <br>refine   manual) (Schwarz only). |
| maxcoarsedof            | positive integer                                                                    | 5000                      | Maximum number of DOFs at coarsest<br>level (algebraic, aggregation) if<br>maxcoarsedofsactive is on (Schwarz<br>only).                     |
| maxcoarsedofs<br>active | on   off                                                                            | off                       | Enable setting the maximum number of<br>DOFs at coarsest level (Schwarz only).                                                              |
| mcasegen                | coarseorder   all   any  <br>coarse   refineall  <br>refineany   refine  <br>manual | any                       | Coarse level generation method<br>(Schwarz only).                                                                                           |
| mcaseuse                | vector of strings                                                                   |                           | Coarse level that should be used (for<br>mcasegen=manual) (Schwarz only).                                                                   |
| mglevels                | positive integer                                                                    | 5                         | Maximum number of algebraic multigrid<br>levels (algebraic, aggregation)<br>(Schwarz only).                                                 |
| mkeep                   | on   off                                                                            | on                        | Keep generated coarse level (for<br>mcasegen=all   any   coarse)<br>(Schwarz only).                                                         |
| ndom                    | integer                                                                             | 2 (Schwarz);<br>4 (Schur) | Minimum number of subdomains.                                                                                                               |
| overlap                 | integer                                                                             | 1                         | Additional overlap.                                                                                                                         |
| overlapmethod           | auto   matrix   mesh                                                                | auto                      | Overlap method (Schwarz only).                                                                                                              |
| prefermatfree           | on   off                                                                            | off                       | Automatically choose matrix free format<br>(Schwarz only).                                                                                  |
| prefun (Schur)          | ddschuradd   ddschurmul                                                             | ddchurmul                 | Domain decomposition solver (Additive<br>Schur/Multiplicative Schur), for Schur<br>methods.                                                 |
| prefun (Schwarz)        | ddadd   ddmul   ddhyb  <br>ddsym                                                    | ddmul                     | Domain decomposition solver (Additive<br>Schwarz/Multiplicative Schwarz/Hybrid<br>Schwarz/ Symmetric Schwarz), for<br>Schwarz methods.      |
| reuseprolongators       | on   off                                                                            | on                        | Reuse prolongators when possible<br>(aggregation) (Schwarz only).                                                                           |
| rmethod                 | longest   regular                                                                   | longest                   | Mesh refinement method (for<br>mcasegen=refineall   refineany  <br>refine) (Schwarz only).                                                  |
| scale                   | scalar > 0                                                                          | 2.0                       | Mesh coarsening factor (for<br>mcasegen=coarseorder   any   all  <br>coarse) (Schwarz only).                                                |
| strconn                 | positive scalar                                                                     | 0.01                      | Strength of connection (aggregation)<br>(Schwarz only).                                                                                     |

TABLE 6-44: VALID DOMAIN DECOMPOSITION PROPERTIES (SCHWARZ AND SCHUR).

| PROPERTY         | VALUE                                                 | DEFAULT | DESCRIPTION                                                                                                                                                      |
|------------------|-------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| useaggressive    | on   off                                              | on      | Use aggressive coarsening<br>(aggregation) (Schwarz only).                                                                                                       |
| usecoarse        | on   algebraic  <br>aggregation   nicolaides<br>  off | on      | Use coarse level: geometric (on),<br>algebraic multigrid (algebraic),<br>aggregations AMG (aggregation),<br>nicolaides (Schwarz only), or off<br>(Schwarz only). |
| usecoloring      | on   off                                              | on      | Use coloring (for prefun = ddmul  <br>ddsym) (Schwarz only).                                                                                                     |
| usefilter        | on   off                                              | on      | Use filtering (aggregation) (Schwarz<br>only).                                                                                                                   |
| userac           | auto   on   off                                       | auto    | Recompute and clear subdomain data.                                                                                                                              |
| useschurcoloring | on   off                                              | on      | Use coloring (for prefun =<br>ddschurmul) (Schur only).                                                                                                          |

```
Example Code for Use With Java
```

```
model.sol("sol1").feature("s1").create("i1", "Iterative");
model.sol("sol1").feature("s1").feature("i1").create("dd1","DomainDecomposition");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").feature("ds").
      create("mg1","Multigrid");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").set("prefun","ddadd");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").set("mcasegen","refine");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").set("domnodesmax","2");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").
      set("overlapmethod","mesh");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").set("ndom", "16");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").
      set("domgeom", new String[]{"geom1"});
model.sol("sol1").feature("s1").feature("i1").feature("dd1").feature("cs").
      feature("dDef").set("linsolver","pardiso");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").feature("ds").
      feature("mg1").set("gmglevels","5");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").
      set("hybridization","multi");
model.sol("sol1").feature("s1").feature("i1").feature("dd1").
      set("hybridcomp", new String[]{"comp1.u"});
```

#### **SOR PREFUN PROPERTY**

TABLE 6-45: SOR PREFUN PROPERTY.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                  |
|----------|-------------------|---------|------------------------------|
| prefun   | ssor   sor   soru | ssor    | Solver (SSOR, SOR, or SORU). |

## **SSOR GAUGE PREFUN PROPERTY**

TABLE 6-46: SSOR GAUGE PREFUN PROPERTY.

| PROPERTY | VALUE                               | DEFAULT                                                                                              | DESCRIPTION                                       |
|----------|-------------------------------------|------------------------------------------------------------------------------------------------------|---------------------------------------------------|
| prefun   | ssorgauge   sorgauge<br>  sorugauge | sorgauge when used as<br>presmoother; sorugauge<br>when used as postsmoother;<br>ssorgauge otherwise | Solver (SSOR gauge, SOR gauge, or<br>SORU gauge). |

#### **SOR VECTOR PREFUN PROPERTY**

TABLE 6-47: SOR VECTOR PREFUN PROPERTY.

| PROPERTY | VALUE                         | DEFAULT                                                                                     | DESCRIPTION                                          |
|----------|-------------------------------|---------------------------------------------------------------------------------------------|------------------------------------------------------|
| prefun   | ssorvec   sorvec  <br>soruvec | sorvec when used as presmoother;<br>soruvec when used as<br>postsmoother; ssorvec otherwise | Solver (SSOR vector, SOR vector,<br>or SORU vector). |

