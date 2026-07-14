# *ParameterCheck*

Check the values of parameters.

#### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"ParameterCheck");
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
```

## **DESCRIPTION**

Use model.component(*<ctag>*).geom(<tag>).create(<ftag>,"ParameterCheck") to check parameter values and issue an error if the check condition is fulfilled (being nonzero); for example, the condition r>30[mm] results in an error is the value of parameter r is larger than 30 mm. The following properties are available:

TABLE 3-119: VALID PROPERTY/VALUE PAIRS FOR PARAMETERCHECK.

| PROPERTY    | VALUE              | DEFAULT      | DESCRIPTION                                                                                                            |
|-------------|--------------------|--------------|------------------------------------------------------------------------------------------------------------------------|
| condition   | double             | 1            | The condition that checks some value of the parameters.<br>The error appears if the value of the condition is nonzero. |
| message     | string             | empty string | The error or warning message that is displayed if<br>condition is fulfilled.                                           |
| messagetype | error  <br>warning | error        | Specifies if to display an error or warning message if<br>condition is fulfilled.                                      |

