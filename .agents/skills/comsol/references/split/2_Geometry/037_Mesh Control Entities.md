# *Mesh Control Entities*

Sometimes it is desirable to use certain geometric entities only when constructing the mesh. For example, you can add a curve inside a domain to control mesh element size there. If you mark this curve as a *mesh control entity*, it is not included in the geometry used when defining the physics. An advantage is that the final mesh need not respect this curve exactly; it is used only to control element size. You can use the keepformesh property of the Composite and Ignore features described above to define mesh control entities. Alternatively, you can use the MeshControlDomains, MeshControlVertices, MeshControlEdges, or MeshControlFaces features.

