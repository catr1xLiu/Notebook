# Geometry Object Information

You can get the geometry object named *<objname>* via

model.component(*<ctag>*).geom(*<tag>*).obj(*<objname>*)

![](_page_23_Picture_3.jpeg)

Accessing Geometry Object Names

The geometry itself,

model.component(*<ctag>*).geom(*<tag>*)

works as an object, namely the final geometry resulting from the sequence. To get information about these objects, you can apply the methods described in this section.

![](_page_23_Picture_8.jpeg)

A geometry part does not have a finalized geometry, so these methods are not applicable for geometry parts. See Creating and Using Geometry Parts for information about applicable methods when working with geometry parts.

