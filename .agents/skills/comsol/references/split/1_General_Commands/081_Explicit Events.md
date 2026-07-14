# *Explicit Events*

Explicit events triggers on a predefined timing.

model.solverEvent(*<tag>*).start(expr) sets the start time for an explicit event.

model.solverEvent(*<tag>*).period(expr) sets the period for an explicit event. After the start time, the event then triggers after each period.

#### *Implicit Events*

Implicit events trigger when a condition goes from false to true.

model.solverEvent(*<tag>*).condition(expr) sets the condition for an implicit event.

## *Event Sequences*

You can also add event sequences to specify a sequence of events that will take place in the order that you add them. Event sequences simplify the setup of a sequence of events by automatically defining explicit and implicit events. The individual steps in the sequence are defined using sequence member subnodes:

```
model.solverEvent().feature(<estag>).create<tag>,SequenceMember);
```

For a sequence member you can set the property endConditionOptions to logicalExpression and then provide a logical expression using the condition property that is true when it evaluates to something that is >0, or set the property endConditionOptions to duration and then provide a time duration using the duration property to control for how long a step runs.

