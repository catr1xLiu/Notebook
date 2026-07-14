# *Block Versions*

Since the amount of available Java memory might be limited, there are block versions of the mesh setters and getters, which sets or gets a subset of the data. The getters take a *position* argument, which specifies the first item to get, and a *number* argument, which specifies the number of items to get. The setters takes only the position argument; the number of items is determined by the size of the provided data. When working with the setters, remember that it is more efficient to set the data at the last position first, since sufficient space is then allocated directly and no copying and reallocation is needed.

```
double[][] model.component(<ctag>).mesh(<tag>).getVertex(int position, int number);
int[][] model.component(<ctag>).mesh(<tag>).getElem(String type, int position, int number);
int[] model.component(<ctag>).mesh(<tag>).getElemEntity(String type, int position,
            int number);
model.component(<ctag>).mesh(<tag>).data().setVertex(double[][], int position);
model.component(<ctag>).mesh(<tag>).data().setElem(String type, int position, int[][]);
model.component(<ctag>).mesh(<tag>).data().setElemEntity(String type, int[], int position);
double[][] model.component(<ctag>).mesh(<tag>).data().getVertex(int position, int number);
int[][] model.component(<ctag>).mesh(<tag>).data().getElem(String type, int position,
            int number);
int[] model.component(<ctag>).mesh(<tag>).data().getElemEntity(String type, int position,
            int number);
```

The (local) numbering of the corners of a mesh element is defined according to the following.

Edge element (edg) as a first-order element (left) and a second-order element (right):

![](_page_22_Picture_3.jpeg)

Triangular element (tri) as a first-order element (left) and a second-order element (right):

![](_page_22_Picture_5.jpeg)

Quadrilateral element (quad) as a first-order element (left) and a second-order element (right):

![](_page_22_Picture_7.jpeg)

Tetrahedral element (tet) as a first-order element (left) and a second-order element (right):

![](_page_22_Picture_9.jpeg)

![](_page_22_Picture_10.jpeg)

Pyramid element (pyr) as a first-order element (left) and a second-order element (right):

![](_page_23_Figure_1.jpeg)

![](_page_23_Figure_2.jpeg)

Prism element (prism) as a first-order element (left) and a second-order element (right):

![](_page_23_Figure_4.jpeg)

![](_page_23_Figure_5.jpeg)

Hexahedral element (hex) as a first-order element (left) and a second-order element (right):

![](_page_23_Figure_7.jpeg)

![](_page_23_Figure_8.jpeg)

