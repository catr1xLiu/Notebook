# *Discrete Color Tables*

An example of a color table for which the lower half of the legend is blue and the upper half is red:

```
% Discrete
0 0 1
1 0 0
```

Each color can contain an optional fourth component, the length of the interval occupied by that color. For *N* colors, there are *N* lengths. An example of a color table that defines a small blue interval, a long green interval, and a medium red interval:

```
% Discrete
0 0 1 1
0 1 0 10
1 0 0 5
```

