# **SEE ALSO**

BndLayer, BndLayerProp, CornerRefinement

## *CornerRefinement*

Decrease element size at sharp corners.

## **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"CornerRefinement");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).vmesh(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag1>,"CornerRefinement");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).selection(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).
  set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature(<ftag1>).getType(property);
```

