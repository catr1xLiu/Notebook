# Working with a Geometry Sequence

This section describes how to construct geometries using Java® methods. A *geometry* is defined by a *geometry sequence* consisting of *geometry features*. Each feature generates a set of *output geometry objects* when you *build* the feature. An *operation feature* takes previously generated geometry objects as input and usually deletes them. You can create named selections by adding *selection features*. Each geometry sequence in 1D ends with a Finalize feature that forms a single output object by uniting all existing geometry objects. A geometry sequence in 2D or 3D also contains a Finalize feature, but in 2D and 3D it is possible to add features corresponding to *virtual operations* after the Finalize feature (see Virtual Operations for more information). The output object of the last feature of a sequence is referred to as the *finalized geometry*. The finalized geometry is used for meshing and physics modeling.

In 3D, you can also add work planes (see Work Planes for more information), where you can add 2D geometry sequences that build 2D geometries that you can use to embed, extrude, and revolve in the 3D geometry.

![](_page_7_Picture_3.jpeg)

