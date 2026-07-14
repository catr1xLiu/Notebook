# **DESCRIPTION**

model.ode(*<tag>*) returns a global equation (or an ODE or a DAE) with tag *<tag>*.

```
model.ode().create(<tag>) creates a global equation with tag <tag>.
model.ode(<tag>).create(<tag>,<fname>) creates an ODE field with tag <tag> with the field name <fname>.
model.ode(<tag>).state(<statelist>) sets the states of the global equation tagged <tag> according to the 
list <statelist>.
model.ode(<tag>).state(<pos>,<state>) edits the state at position <pos> in the state vector for the global 
equation <tag>.
model.ode(<tag>).ode(<state>,<equation>) sets the equation for the state <state>. If the state variable has 
not previously been added using model.ode(<tag>).state(<statelist>) then <state> is appended to the list 
of state variables.
model.ode(<tag>).descr(<state>,<descr>) sets the description for the state <state>.
model.ode(<tag>).weak(<wlist>) set weak equations. <wlist> is a list of weak expressions.
model.ode(<tag>).weak(<pos>,<wexpr>) sets the weak expression at position <pos> in the list of weak 
expressions.
model.ode(<tag>).field(<fname>) sets the ODE field name.
model.ode(<tag>).field() returns the ODE field name as a string.
model.ode(<tag>).state() returns the state variables as a string array.
model.ode(<tag>).ode(<state>) returns the global equation for the state variable <state> as a string.
model.ode(<tag>).descr(<state>) returns the description of the state variable <state> as a string.
model.ode(<tag>).weak() returns the weak equations as a string vector of weak expressions.
```

model.ode(*<tag>*).discrete(true) specifies that the global equation contains event states.

model.ode(*<tag>*).valueType(*prop*) specifies value type as real or complex when splitting of complex variables in real and imaginary parts has been turned on.

model.ode(*<tag>*).valueType() returns the value type.

