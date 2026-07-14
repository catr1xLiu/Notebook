# **ABOUT ASSIGNING VALUES TO PROPERTIES**

Even if a property is numeric, it is also possible to use a string or string array. The strings can contain expressions defined in terms of parameters defined in **Global Definitions** > **Parameters**. See Table 2-4 under set() below for examples of syntaxes for assignment methods.

#### **ABOUT FILE PATHS**

In general, the file paths in methods for saving and opening files, for example, are client paths (on the client computer's file system). They can also be item version location URIs used to identify a model or file version in a Model Manager database. The exceptions are methods that explicitly performs an operation on the server, such as ModelUtil.loadOnServer(), which takes a server path as its argument.

The syntax that includes the component level, such as

![](_page_2_Picture_2.jpeg)

model.component(*<ctag>*).geom(*<tag>*)... is the default and is used throughout this chapter for parts of the model object that are stored inside a model component. To use the earlier model.geom(*<tag>*)... syntax, clear the **Generate code using component syntax** checkbox on the **Application Builder** > **Methods** page in the **Preferences** window. You can also run existing scripts without this syntax.

