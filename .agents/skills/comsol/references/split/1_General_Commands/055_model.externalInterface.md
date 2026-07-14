# *model.externalInterface*

Create an external interface for cosimulation with Simulink, for example.

#### **SYNTAX**

```
model.externalInterface().create(<tag>,<type>);
model.externalInterface(<tag>).set(<property>,<value>);
model.externalInterface(<tag>).run();
```

## **DESCRIPTION**

model.externalInterface().create(<tag>,<*type>*) creates an extra dimension feature of the given type. The supported type is SimulinkCosimulation for a cosimulation with Simulink.

model.externalInterface(*<tag>*).set(*<property>*,*<value>*) specifies properties relevant for the selected external interface type.

model.externalInterface(*<tag>*).run() exports a file from the external interface.

