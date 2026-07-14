# *Exporting Mesh to a NASTRAN*® *File*

To specify the dimensions of the elements to export, to choose to include or exclude the geometric entity information, or to set the file field format or element order, enter

<sup>2</sup> Use model.mesh(*<tag>*).export().set("plyformat",*<format>*) to specify the PLY file format ("binary" or "text")

model.component(*<ctag>*).mesh(*<tag>*).export().set(*<property>,<value>*);

The following table lists the available properties:

TABLE 4-9: AVAILABLE NASTRAN MESH EXPORT PROPERTIES AND THEIR VALID VALUES.

| PROPERTY         | VALUE                | DEFAULT | DESCRIPTION                                                                         |
|------------------|----------------------|---------|-------------------------------------------------------------------------------------|
| solidelem        | on   off             | on      | Specify if domain elements are exported.                                            |
| shellelem        | on   off             | off     | Specify if boundary elements are exported (3D only).                                |
| geominfo_nastran | on   off             | on      | Specify if geometric entity information for each<br>element is exported.            |
| fieldformat      | small   large   free | large   | Specify file field format.                                                          |
| nastranquadratic | on   off             | on      | Specify if elements are exported as linear or<br>second-order (quadratic) elements. |

## *Exporting Mesh to a Sectionwise Format*

To specify the geometric entity level for the sectionwise format, use

model.component(*<ctag>*).mesh(*<tag>*).export().set(*<property>,<value>*);

The following table lists the available property:

TABLE 4-10: AVAILABLE COMSOL SECTIONWISE MESH EXPORT PROPERTY AND ITS VALID VALUES.

| PROPERTY | VALUE                    | DEFAULT | DESCRIPTION                        |
|----------|--------------------------|---------|------------------------------------|
| level    | domain   boundary   edge | domain  | Specify the geometry entity level. |

## *Exporting Mesh to a 3MF Format*

To specify the 3MF data to export on the 3MF format, use

model.component(*<ctag>*).mesh(*<tag>*).export().set(*<property>,<value>*);

The following table lists the available property:

TABLE 4-11: AVAILABLE 3MF MESH EXPORT PROPERTY AND ITS VALID VALUES.

| PROPERTY | VALUE             | DEFAULT  | DESCRIPTION                    |
|----------|-------------------|----------|--------------------------------|
| 3mfdata  | domain   boundary | boundary | Specify if the data to export. |

