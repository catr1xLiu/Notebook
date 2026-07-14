# *Exporting to an STL File*

An alternative way of setting the STL file formats is to use

```
model.component(<ctag>).geom(<tag>).export().setSTLFormat(<format>);
```

where *<format>* is string with only two allowed values: binary and text. The methods setType(*<format>*) and setSTLFormat(*<format>*) will set the correct value for the other, so you only need to use one of them.

Use the following methods to select domains or boundaries to export:

```
model.component(<ctag>).geom(<tag>).export().selection().init(<edim>);
  model.component(<ctag>).geom(<tag>).export().selection().set(<objnames>, <entlst>);
Use the following methods to select objects to export:
  model.component(<ctag>).geom(<tag>).export().selection().init();
  model.component(<ctag>).geom(<tag>).export().selection().set(<objnames>);
Finish the export by using the following line
  model.component(<ctag>).geom(<tag>).export(<filename>);
```

