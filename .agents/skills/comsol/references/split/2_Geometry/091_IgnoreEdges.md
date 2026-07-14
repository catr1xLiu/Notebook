# *IgnoreEdges*

Ignore edges by removing selected edges that are isolated, adjacent to precisely two faces, or between two domains.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"IgnoreEdges");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

