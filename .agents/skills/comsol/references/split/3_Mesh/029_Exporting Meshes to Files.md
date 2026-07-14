# Exporting Meshes to Files

## *Exporting Mesh to a File*

To export a mesh to a file, enter

model.component(*<ctag>*).mesh(*<tag>*).export(*<filename>*);

where *<filename>* is a string or a file location URI used to identify a file version in a Model Manager database. The file can be any of the following formats.

TABLE 4-8: VALID FILE FORMATS.

| FILE FORMAT                | NOTE | FILE EXTENSIONS            |
|----------------------------|------|----------------------------|
| COMSOL Multiphysics Binary |      | .mphbin                    |
| COMSOL Multiphysics Text   |      | .mphtxt                    |
| NASTRAN file               |      | .nas, .bdf, .nastran, .dat |
| STL Binary (3D)            | 1    | .stl                       |
| STL Text (3D)              | 1    | .stl                       |
| Sectionwise                |      | .txt                       |
| PLY Binary (3D)            | 2    | .ply                       |
| PLY Text (3D)              | 2    | .ply                       |
| 3MF (3D)                   |      | .3mf                       |

<sup>1</sup> Use model.mesh(*<tag>*).export().set("stlformat",*<format>*) to specify the STL file format ("binary" or "text")

