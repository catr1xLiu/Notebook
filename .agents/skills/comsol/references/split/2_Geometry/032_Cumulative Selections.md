# *Cumulative Selections*

```
To create a cumulative selection tagged <seltag>, use
```

To make a geometry feature contribute its selection to a cumulative selection, use

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).set("contributeto",<seltag>);
```

model.component(*<ctag>*).geom(*<tag>*).selection().create(*<seltag>*,"CumulativeSelection");

To remove the contribution of a geometry feature to a cumulative selection, use

```
model.component(<ctag>).geom(<tag>).feature(<ftag>).set("contributeto","none");
```

To control whether the cumulative selection is available outside the geometry sequence, use

```
model.component(<ctag>).geom(<tag>).selection(<seltag>).show(<boolean>);
```

To query whether the cumulative selection is available outside the geometry sequence, use

```
boolean show = model.component(<ctag>).geom(<tag>).selection(<seltag>).show();
```

