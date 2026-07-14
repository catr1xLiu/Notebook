# *Advanced Settings for DXF Files in 2D*

Set the curve representation for DXF export using

```
model.component(<ctag>).geom(<tag>).export().setDxfCurveRep(<rep>);
 where <rep> is set to exact, approxspline, or polygon.
```

Get the curve representation for DXF export using the following method. The method returns a string value.

```
model.component(<ctag>).geom(<tag>).export().getDxfCurveRep();
```

Use the below method to set the approximation detail for the DXF export.

```
model.component(<ctag>).geom(<tag>).export().setDxfApproxDetail(<detail>);
```

where *<detail>* is graphics, coarse, normal, or fine. This is used when getDxfCurveRep() is approxspline or polygon.

Get approximation detail for DXF export. The method returns a string value.

```
model.component(<ctag>).geom(<tag>).export().getDxfApproxDetail();
```

Set how to handle edges surrounding domains using the following method

```
model.component(<ctag>).geom(<tag>).export().setDxfDomainHandling(<handling>);
```

where *<handling>* is set to edgesdomainwise or intedgesonce.

Get domain handling for DXF export. The method returns a string value.

```
model.component(<ctag>).geom(<tag>).export().getDxfDomainHandling();
```

