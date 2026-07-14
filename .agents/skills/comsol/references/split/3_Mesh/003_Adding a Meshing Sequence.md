# *Adding a Meshing Sequence*

To add a new meshing sequence to a model object model, enter model.component(*<ctag>*).mesh().create(*<mtag>*,*<gtag>*); where mTag is the mesh's tag (an identifier of your choice) and gTag is the tag of the associated geometry. If you want to import a mesh, you must specify an empty geometry sequence; the geometry is then defined by the mesh.

![](_page_3_Picture_1.jpeg)

The syntax that includes the component level, such as model.component(*<ctag>*).mesh()... is the default and is used throughout this chapter. To use the earlier model.mesh()... syntax, clear the **Generate code using component syntax** checkbox on the **Application Builder** > **Methods** page in the **Preferences** window.

