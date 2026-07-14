# *Number and Types of Elements*

To determine the number of elements of a certain type, use

```
int model.component(<ctag>).mesh(<tag>).stat().getNumElem(type);
```

To get the number of elements of all types, use

```
int model.component(<ctag>).mesh(<tag>).stat().getNumElem();
```

To determine the element types, use

```
String[] model.component(<ctag>).mesh(<tag>).stat().getTypes();
```

If the current selection is not the entire geometry, only elements and types in the current selection is returned. You can also use the methods

```
int model.component(<ctag>).mesh(<tag>).getNumElem(String type);
int model.component(<ctag>).mesh(<tag>).getNumElem();
int[] model.component(<ctag>).mesh(<tag>).getGeomEntities(String type);
String[] model.component(<ctag>).mesh(<tag>).getTypes();
```

to obtain information about the entire mesh.

To check whether the mesh contains any second-order element, use

```
boolean model.component(<ctag>).mesh(<tag>).hasSecondOrderElements();
```

## *Quality of Elements*

COMSOL Multiphysics includes several different mesh quality measures. The absolute value of the mesh element quality is always between 0 and 1, where 0.0 represents a degenerated element and 1.0 represents the best possible element. A negative value means a contradiction to the COMSOL Multiphysics numbering convention for mesh

element vertices (see Mesh Element Numbering Conventions), and the element is then referred to as an *inverted element*. The following mesh quality measures are available:

- **•** The *skewness* (skewness), which is based on the mesh elements' equiangular skew.
- **•** The *maximum angle* (maxangle), which is based on the largest angle in the element. If no angle is larger than the largest angle of the corresponding optimal element, the quality is one; otherwise, the measure shows how much larger the angle is. This quality measure is insensitive to element anisotropy.
- **•** The *volume versus circumradius* (volcircum), which is the default quality measure, is based on the ratios of the inscribed and circumscribed circles' or spheres' radii for the simplex corresponding to each corner of the element. If the simplex cannot be clearly determined (an apex of the pyramid, for example), the corresponding corner is excluded from the consideration.
- **•** The *volume versus length* (vollength), which is based on a quotient of element edge lengths and element volume. This quality measure is primarily sensitive to anisotropy.
- **•** The *condition number* (condition), which is based on the element dimension divided by the condition number (in the Frobenius norm) of the matrix transforming the element to a reference element.
- **•** The *growth rate* (growth), which is based on the mesh elements' local (anisotropic) growth rate.
- **•** The *curved skewness* (curvedskewness), which is defined as the elementwise product of skewness and reldetjacmin, which is a measure of the deformation when generating the higher-order element.

There is also a *custom* quality measure (custom), which is based on a user-defined expression for the mesh element quality.

To retrieve the minimal quality, use

```
double model.component(<ctag>).mesh(<tag>).stat().getMinQuality(type);
  double model.component(<ctag>).mesh(<tag>).stat().getMinQuality();
To retrieve the mean quality, use
  double model.component(<ctag>).mesh(<tag>).stat().getMeanQuality(type);
  double model.component(<ctag>).mesh(<tag>).stat().getMeanQuality();
To calculate a distribution of qualities, use the getQualityDistr method.
  int[] model.component(<ctag>).mesh(<tag>).stat().getQualityDistr(type, <size>);
  int[] model.component(<ctag>).mesh(<tag>).stat().getQualityDistr(<size>);
```

The size parameter is a positive integer determining how detailed the distribution is and equals the size of the output array. The distribution can by used to plot a histogram of the element quality. For example, if size equals 10, the first entry in the returned array is the number of elements with quality less than 0.1, and the last entry is the number of elements with quality better than 0.9.

The following methods are available directly on the sequence and provide mesh quality statistics, using the volume versus circumradius quality measure, for the entire geometry:

```
double model.component(<ctag>).mesh(<tag>).getMinQuality(type);
double model.component(<ctag>).mesh(<tag>).getMinQuality();
double model.component(<ctag>).mesh(<tag>).getMeanQuality(type);
double model.component(<ctag>).mesh(<tag>).getMeanQuality();
int[] model.component(<ctag>).mesh(<tag>).getQualityDistr(type, <size>);
int[] model.component(<ctag>).mesh(<tag>).getQualityDistr(<size>);
```

The following methods are available for retrieving and specifying the mesh quality measure, respectively:

```
String model.component(<ctag>).mesh(<tag>).getQualityMeasure();
model.component(<ctag>).mesh(<tag>).setQualityMeasure(String measure);
```

To determine minimum element volume, area, or length of a certain type, use the method getMinVolume:

```
double model.component(<ctag>).mesh(<tag>).stat().getMinVolume(type);
double model.component(<ctag>).mesh(<tag>).stat().getMinVolume();
```

To determine maximum element volume, area, or length of a certain type, use the method getMaxVolume:

```
double model.component(<ctag>).mesh(<tag>).stat().getMaxVolume(type);
double model.component(<ctag>).mesh(<tag>).stat().getMaxVolume();
```

To determine the volume, area, or length of the mesh, use the method getVolume:

```
double model.component(<ctag>).mesh(<tag>).stat().getVolume(type);
double model.component(<ctag>).mesh(<tag>).stat().getVolume();
```

The following methods are available directly on the sequence and provide volume information about the entire geometry:

```
double model.component(<ctag>).mesh(<tag>).getMinVolume(type);
double model.component(<ctag>).mesh(<tag>).getMinVolume();
double model.component(<ctag>).mesh(<tag>).getMaxVolume(type);
double model.component(<ctag>).mesh(<tag>).getMaxVolume();
double model.component(<ctag>).mesh(<tag>).getVolume(type);
double model.component(<ctag>).mesh(<tag>).getVolume();
```

