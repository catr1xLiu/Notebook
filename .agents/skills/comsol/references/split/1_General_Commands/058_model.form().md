# *model.form()*

Create settings forms for use in the Model Builder.

#### **SYNTAX**

```
model.form().create(<tag>,<fname>);
model.form(<tag>).update();
```

#### **DESCRIPTION**

model.form().create(*<tag>*,*<fname>*) creates a new form instance using the Application Builder Form Feature with the tag *<fname>*.

model.form(*<tag>*).update() updates the Settings Form instance *<tag>* with the current definition of the Application Builder Form Feature it references.

To change the value of an input field in a settings form you can change the value of the source data tied to the input field and let the data binding update the value of the input field.

#### **SEE ALSO**

```
model.methodCall()
```

```
model.frame()
```

Create and define properties for different types of frames: spatial frames, material frames, mesh frames, and geometry frames.

#### **SYNTAX**

```
model.frame().create(<tag>,<gtag>);
model.frame(<tag>).coord(<coordlist>);
model.frame(<tag>).coord(<pos>,<coord>);
model.frame(<tag>).meshFrame();
model.frame(<tag>).materialFrame();
model.frame(<tag>).geometryFrame();
model.frame(<tag>).spatialFrame();
model.frame(<tag>).sshape.create(<stag>,type);
model.frame(<tag>).sshape(<stag>).type(type);
model.frame(<tag>).sshape(<stag>).sorder(order);
model.frame(<tag>).sshape(<stag>).coorddof(<dofs>);
model.frame(<tag>).sshape(<stag>).coorddof(<pos>,<dof>);
model.frame(<tag>).sshape(<stag>).refframe(<ftag>);
model.frame(<tag>).sshape(<stag>).coordexpr(<exprs>);
model.frame(<tag>).sshape(<stag>).coordexpr(<pos>,<expr>);
model.frame(<tag>).coord();
model.frame(<tag>).identifier();
model.frame(<tag>).varNameSuffix();
model.frame(<tag>).geom();
model.frame(<tag>).isMeshFrame();
model.frame(<tag>).isGeometryFrame();
model.frame(<tag>).isMaterialFrame();
model.frame(<tag>).isSpatialFrame();
model.frame(<tag>).sshape(<stag>).type();
model.frame(<tag>).sshape(<stag>).sorder();
model.frame(<tag>).sshape(<stag>).coorddof();
model.frame(<tag>).sshape(<stag>).refframe();
model.frame(<tag>).sshape(<stag>).coordexpr();
```

