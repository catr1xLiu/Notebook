# *model.modelNode()*

Deprecated alias for model.component() for accessing model component nodes.

![](_page_133_Picture_8.jpeg)

This syntax is still used when you turn off the component syntax (clear the **Generate code using component syntax** checkbox on the **Application Builder>Methods** page in the **Preferences** window). Otherwise, the code that COMSOL Multiphysics creates uses model.component().create(*<tag>*) instead of model.modelNode().create(*<tag>*), and so on. See model.component().

