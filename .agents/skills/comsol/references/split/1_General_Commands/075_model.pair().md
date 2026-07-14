# *model.pair()*

Create and define identity pairs, contact pairs, and sector symmetry pairs for assemble geometries.

#### **SYNTAX**

```
model.component(<ctag>).pair().create(<tag>,type,<gtag>);
model.component(<ctag>).pair(<tag>).type(type);
model.component(<ctag>).pair(<tag>).type();
model.component(<ctag>).pair(<tag>).pairName(<pname>);
model.component(<ctag>).pair(<tag>).pairName();
model.component(<ctag>).pair(<tag>).source().selMethod;
model.component(<ctag>).pair(<tag>).source().named(<seltag>);
model.component(<ctag>).pair(<tag>).source().named();
model.component(<ctag>).pair(<tag>).destination().selMethod;
model.component(<ctag>).pair(<tag>).destination().named(<seltag>);
model.component(<ctag>).pair(<tag>).destination().named();
model.component(<ctag>).pair(<tag>).swap();
model.component(<ctag>).pair(<tag>).manualFrame(manual);
model.component(<ctag>).pair(<tag>).manualFrame();
model.component(<ctag>).pair(<tag>).srcFrame(<frame>);
model.component(<ctag>).pair(<tag>).srcFrame();
model.component(<ctag>).pair(<tag>).dstFrame(<frame>);
model.component(<ctag>).pair(<tag>).dstFrame();
model.component(<ctag>).pair(<tag>).hasAutoSelection();
model.component(<ctag>).pair(<tag>).manualSelection(manual);
model.component(<ctag>).pair(<tag>).manualSelection();
model.component(<ctag>).pair(<tag>).searchMethod(method);
model.component(<ctag>).pair(<tag>).searchMethod();
model.component(<ctag>).pair(<tag>).manualDist(manual);
model.component(<ctag>).pair(<tag>).manualDist();
model.component(<ctag>).pair(<tag>).searchDist(<dist>);
model.component(<ctag>).pair(<tag>).searchDist();
model.component(<ctag>).pair(<tag>).opName(src2dst);
model.component(<ctag>).pair(<tag>).mphOpName(src2dst);
model.component(<ctag>).pair(<tag>).gapName(src2dst);
model.component(<ctag>).pair(<tag>).extTol(tol);
model.component(<ctag>).pair(<tag>).manualSectorSymmetry(boolean);
model.component(<ctag>).pair(<tag>).nSector(integer);
model.component(<ctag>).pair(<tag>).basePoint(string[]);
model.component(<ctag>).pair(<tag>).axis(string[]);
model.component(<ctag>).pair(<tag>).active(boolean);
model.component(<ctag>).pair(<tag>).isActive();
model.component(<ctag>).pair().remove(<tag>);
```

Not all of the syntaxes above are available for all pair types. See the following section for more information.

