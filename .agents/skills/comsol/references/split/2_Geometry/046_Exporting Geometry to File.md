# Exporting Geometry to File

To export the finalized geometry to a file, enter

```
model.component(<ctag>).geom(<tag>).exportFinal(<filename>);
```

where *<filename>* is a string for a file system path or a file location URI referencing a file version in a Model Manager database.

To export selected geometry objects to a file, first select the objects to export using

```
model.component(<ctag>).geom(<tag>).export().selection().set(<objnames>);
```

Set the file format using

```
model.component(<ctag>).geom(<tag>).export().setType(<format>);
```

where *<format>* can be set to any of the type values in Table 3-26.

Check which file format is set using

```
String formatType = model.component(<ctag>).geom(<tag>).export().getType();
```

Export the file by entering

```
model.component(<ctag>).geom(<tag>).export(<filename>);
```

The file can be of any of the following formats:

TABLE 3-26: VALID FILE FORMATS.

| NOTE                                      | FILE EXTENSIONS | TYPE VALUE     |  |
|-------------------------------------------|-----------------|----------------|--|
|                                           | .mphbin         | nativebin      |  |
|                                           | .mphtxt         | nativeascii    |  |
| 1                                         | .x_b, .xmt_bin  | parasolidbin   |  |
| 1                                         | .x_t, .xmt_txt  | parasolidascii |  |
| 1                                         | .sab            | acisbin        |  |
| 1                                         | .sat            | acisascii      |  |
| 1                                         | .igs, .iges     | iges           |  |
| 1                                         | .step, .stp     | step           |  |
| STEP File (3D)<br>.stl<br>STL Binary (3D) |                 |                |  |
|                                           | .stl            | stlascii       |  |
|                                           | .dxf            | dxf            |  |
|                                           |                 |                |  |

This format requires a license for the CAD Import Module, Design Module, or a LiveLink product for a CAD package.

