# *MeshControlDomains*

Define mesh control domains.

### **SYNTAX**

```
model.component(<ctag>).geom(<tag>).create(<ftag>,"MeshControlDomains");
model.component(<ctag>).geom(<tag>).feature(<ftag>).selection(property);
model.component(<ctag>).geom(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).geom(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).geom(*<tag>*).create(*<ftag>*,"MeshControlDomains") to define mesh control domains.

Use model.component(*<ctag>*).geom(*<tag>*).feature(*<ftag>*).selection("input") to select the domains to include. The default selection is empty.

The feature creates a composite domain by removing all faces (in 3D) or edges (in 2D) between the selected domains and adjacent domains. The removed entities are kept for mesh control.

The following property is available:

TABLE 3-109: VALID PROPERTIES.

| NAME  | VALUE     | DEFAULT | DESCRIPTION      |
|-------|-----------|---------|------------------|
| input | Selection |         | Edges to ignore. |

### **SEE ALSO**

MeshControlFaces, MeshControlEdges

