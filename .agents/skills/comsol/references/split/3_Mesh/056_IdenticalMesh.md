# *IdenticalMesh*

Use this attribute to generate identical mesh on pairs of faces (3D) or edges.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"IdenticalMesh");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
```

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"IdenticalMesh") to generate identical mesh on pairs of faces or edges in meshes that are conforming with geometry.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag1>*).create(*<ftag>*,"IdenticalMesh") generate identical mesh on pairs of faces or edges in meshes that define their own geometric models. IdenticalMesh is then a local attribute to the feature *<ftag1>* that can be any of the types RemeshFaces, and RemeshEdges. For more information, see Geometric Model.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).selection(*property*).set() or model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag1>*).feature(*<ftag>*).*property*).set() to specify the geometric entity selection for the properties group1 and group2.

The following properties are available:

TABLE 4-58: FEATURE PROPERTIES DEFINED.

| PROPERTY  | VALUE     | DEFAULT | DESCRIPTION                                  |
|-----------|-----------|---------|----------------------------------------------|
| dimension | 1   2     | 2       | Entity level of the groups. Only used in 3D. |
| group1    | Selection |         | Selection first entity group.                |
| group2    | Selection |         | Selection second entity group.               |

## **SEE ALSO**

OnePointMap, TwoPointMap, EdgeMap, FreeTet, FreeTri, FreeQuad, RemeshFaces, RemeshDomains

## *Import*

Import mesh from a file, from another meshing sequence, from a geometry sequence, or from a Filter (Dataset) or Partition dataset. You can import a mesh from a COMSOL Multiphysics file and Sectionwise file. In 3D, you can also import meshes from 3MF, NASTRAN, PLY, STL, and VRML files. In 2D, you can also import meshes from NASTRAN (the third coordinate must then be the same for all mesh points) and COMSOL's native formats.

Use a Transform attribute to position, rotate, or scale an imported mesh.

#### **SYNTAX**

```
model.component(<ctag>).mesh(<tag>).create(<ftag>,"Import");
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).importData();
```

See set(), setIndex(), and Methods Associated to Set, SetIndex, and the Various Get Methods for more information.

#### **DESCRIPTION**

Use model.component(*<ctag>*).mesh(*<tag>*).create(*<ftag>*,"Import") to import a mesh into a meshing sequence that defines its own geometrical model. See the section Geometric Model for more information. If the sequence already contains a mesh, the imported mesh is added to the existing mesh.

Use model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).importData() to import the file again.

The following mesh formats are supported:

TABLE 4-1: SUPPORTED MESH FORMATS.

| FORMAT                          | FILE EXTENSION     |
|---------------------------------|--------------------|
| COMSOL Multiphysics text file   | .mphtxt            |
| COMSOL Multiphysics binary file | .mphbin            |
| NASTRAN file                    | .nas   .bdf   .dat |
| Sectionwise file                | .txt               |
| STL text file                   | .stl               |
| STL binary file                 | .stl               |
| PLY text file                   | .ply               |
| PLY binary file                 | .ply               |
| 3MF file                        | .3mf               |
| VRML file                       | .wrl   .vrml       |

The available properties are listed in the tables below. Table 4-2 lists properties common for many of the import sources:

TABLE 4-2: AVAILABLE PROPERTIES FOR THE MESH IMPORT.

| PROPERTY      | VALUES                                                                                                       | DEFAULT | DESCRIPTION                                                                                                                                                                                                 |
|---------------|--------------------------------------------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| source        | 3mf   file  <br>geom   sequence<br>  dataset  <br>nastran  <br>native   ply  <br>stl   vrml  <br>sectionwise | file    | Source for the import. The value file specifies any<br>supported file type. The value native specifies<br>COMSOL Multiphysics file import.                                                                  |
| facepartition | auto   minimal  <br>detectfaces  <br>manual                                                                  | auto    | Boundary partitioning algorithm. detectfaces is only<br>available in 3D, and manual is only available in 2D.<br>Available when source is native, nastran, stl,<br>sectionwise, ply, 3mf, vrml, and dataset. |
| filename      | String                                                                                                       |         | Specify the filename when source is file, native,<br>nastran, stl, sectionwise, ply, or 3mf.                                                                                                                |

The following tables list additional properties depending on which source property is used.

TABLE 4-3: ADDITIONAL PROPERTIES WHEN SOURCE IS NASTRAN.

| PROPERTY            | VALUES     | DEFAULT | DESCRIPTION                                                                                                                   |
|---------------------|------------|---------|-------------------------------------------------------------------------------------------------------------------------------|
| allowshellpartition | on   off   | on      | Specifies whether the boundary entities that are defined<br>based on the data in the file can be split into smaller<br>parts. |
| data                | all   mesh | all     | Specifies the data to import from the NASTRAN file.                                                                           |
| domelemnastran      | on   off   | on      | Specifies if domain elements are imported. Use when<br>source is nastran.                                                     |
| linearelem          | on   off   | off     | Specifies if the elements in are imported as linear<br>elements. Available in 2D and 3D.                                      |

TABLE 4-3: ADDITIONAL PROPERTIES WHEN SOURCE IS NASTRAN.

| PROPERTY      | VALUES   | DEFAULT | DESCRIPTION                                                                                                                           |
|---------------|----------|---------|---------------------------------------------------------------------------------------------------------------------------------------|
| materialsplit | on   off | on      | Specifies if material data in the NASTRAN file is used to<br>determine the domain partitioning of the domain<br>elements.             |
| selcreation   | on   off | on      | Specifies whether selections corresponding to the<br>groups of domain and boundary elements in the<br>NASTRAN file should be created. |

TABLE 4-4: ADDITIONAL PROPERTIES WHEN SOURCE IS 3MF, PLY, STL, OR VRML.

| PROPERTY     | VALUES                             | DEFAULT | DESCRIPTION                                                                                                            |
|--------------|------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------|
| createdom    | on   off                           | off     | Specify if to create domains for each (connected) finite<br>void region. Use when source is 3mf, ply, stl, or<br>vrml. |
| selectionstl | on   off                           | on      | Create boundary selections from an STL file.                                                                           |
| stltolabs    | Positive scalar                    | 1e-8    | Absolute tolerance for STL import, when stltoltype<br>is set to absolute.                                              |
| stltolrel    | Positive scalar,<br>1.0 or smaller | 1e-8    | Relative tolerance for STL import, when stltoltype is<br>set to relative.                                              |
| stltoltype   | auto   relative<br>  absolute      | auto    | STL file import tolerance type: automatic, relative, or<br>absolute.                                                   |
| mergepoints  | on   off                           | off     | Specify if to merge coinciding points. Use when source<br>is 3mf, ply, or vrml.                                        |
| toltype      | auto   relative<br>  absolute      | auto    | Specifies the type of tolerance to enter. Use when<br>mergepoints is on.                                               |
| reltol       | Positive scalar                    | 1e-8    | Relative tolerance for merging points. Use when<br>toltype is set to relative                                          |
| abstol       | Positive scalar                    | 1e-8    | Absolute tolerance for merging points. Use when<br>toltype is set to absolute.                                         |

TABLE 4-5: ADDITIONAL PROPERTIES WHEN SOURCE IS NATIVE, DATASET, OR SECTIONWISE.

| PROPERTY           | VALUES   | DEFAULT | DESCRIPTION                                                                                                       |
|--------------------|----------|---------|-------------------------------------------------------------------------------------------------------------------|
| dataset            | String   |         | Specify the tag of the dataset when source is dataset.                                                            |
| domelem            | on   off | on      | Specifies if domain elements are imported. Use when<br>source is native.                                          |
| domelemdataset     | on   off | off     | Specifies if domain elements are imported. Use when<br>source is dataset.                                         |
| domelemsectionwise | on   off | on      | Specifies if domain elements are imported. Use when<br>source is sectionwise.                                     |
| linearelem         | on   off | off     | Specifies if the elements in are imported as linear<br>elements. Available in 2D and 3D when source is<br>native. |
| selection          | on   off | on      | Import mesh selections when source is native or<br>dataset.                                                       |

TABLE 4-6: ADDITIONAL PROPERTIES WHEN SOURCE IS SEQUENCE.

| PROPERTY        | VALUES   | DEFAULT | DESCRIPTION                                                                                                                                                                             |
|-----------------|----------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| buildsource     | on   off |         | Specifies if source mesh is automatically rebuilt and<br>imported when source is sequence. Default is on<br>when sequence specifies a mesh part and off for other<br>meshing sequences. |
| domelemsequence | on   off | on      | Specifies if domain elements are imported. Use when<br>source is sequence.                                                                                                              |
| sequence        | String   |         | Specify tag of the meshing sequence when source is<br>sequence.                                                                                                                         |
| unmesheddom     | on   off | off     | Specifies if unmeshed domains are imported. Use when<br>source is sequence                                                                                                              |

TABLE 4-7: ADDITIONAL PROPERTIES WHEN SOURCE IS GEOM.

| PROPERTY  | VALUES                     | DEFAULT | DESCRIPTION                                                                                                                                 |
|-----------|----------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------|
| detail    | fine   normal  <br>coarse  | normal  | Specifies the level of detail to use when meshtype is<br>visualization.                                                                     |
| geom      | none   String              | none    | Specify tag of the geometry sequence when source is<br>geom.                                                                                |
| meshtype  | freetri  <br>visualization | freetri | Specifies the triangulation to use for the geometry<br>surfaces when source is geom.                                                        |
| meshsize  | 1-9                        | 5       | Specifies the predefined element size to use when<br>meshtype is freetri. 1 is the finest and 9 is the<br>coarsest predefined size setting. |
| narrowreg | on   off                   | on      | Specifies if narrow domain regions will be resolved by the<br>mesh when meshtype is freetri.                                                |
| resdetail | on   off                   | on      | Specifies if geometric details will be resolved by the mesh<br>when meshtype is freetri.                                                    |

*Properties for STL File Import*

The properties stltolabs, stltolrel, stltoltype, and selectionstl are only used for import of STL files. If selectionstl is active, the following tags are assigned to the created selections:

- **•** If a selection is named in the file, its tag is the name.
- **•** If it is unnamed, it gets the tag sel + the number of the unnamed selection (started with 1). If there is only one selection and it is unnamed, the tag is just sel.

The tags of the imported selections can also be obtained by calling the outputSelection() function on the mesh import feature.

The tag of the model selection becomes *<meshing sequence tag>*\_*<import node tag>*\_*<selection tag>*, such as mesh1\_imp1\_sel.

*Properties for Meshing Sequence Import*

The property buildsource is only used when source is sequence. If buildsource is active, the source sequence is always built and the current version of the source mesh is imported. This is required when running a parametric sweep that influences the source meshing sequence. If the property is deactivated, run the method importData() to manually build and reimport the source mesh sequence.

*Properties for NASTRAN File Import*

The properties linearelem, materialsplit, and data are only used for import of NASTRAN files. The properties selcreation and allowshellpartition are only used when materialsplit is on.

## *Additional Properties*

linearelem specifies if the elements in the NASTRAN or COMSOL Multiphysics file are imported as linear elements. If the value is on all imported elements are linear. Otherwise, the order of the imported elements is determined from the order of the elements in the file. The default value is off.

materialsplit determines if material data in the file is used (if available) to determine the domain partitioning of the domain elements. If the value is off all domain elements in the imported mesh belongs to the same domain if possible. The default value is off.

If you set facepartition to minimal, the operation keeps the original partition from the file (if any), adding minimal partitioning in order to satisfy topological requirements.

If you set facepartition to manual, you can use the following properties. If you set any of these properties without setting facepartition to manual, the operation automatically switches facepartition to manual.

TABLE 4-8: VALID PROPERTY/VALUE PAIRS FOR FACEPARTITION = MANUAL.

| PROPERTY     | VALUE    | DEFAULT     | DESCRIPTION                                                                                                                                |
|--------------|----------|-------------|--------------------------------------------------------------------------------------------------------------------------------------------|
| faceangle    | double   | 360 degrees | Maximum angle between any two boundary elements in the<br>same face.                                                                       |
| minareaplane | double   | 0.005       | Minimum relative area of face to be considered planar.                                                                                     |
| neighangle   | double   | 40 degrees  | Maximum angle between a boundary element and a neighbor<br>that causes the elements to be part of the same boundary<br>domain if possible. |
| planar       | on   off | on          | Detect planar faces.                                                                                                                       |
| planarangle  | double   | 0.6 degrees | Maximum angle between boundary element normal and a<br>neighbor that causes the element to be a part the planar face if<br>possible.       |

The following properties are available in 3D when facepartition is set to detectfaces:

TABLE 4-9: VALID PROPERTY/VALUE PAIRS FOR FACEPARTITION = DETECTFACES.

| PROPERTY            | VALUE                            | DEFAULT     | DESCRIPTION                                                                                                 |
|---------------------|----------------------------------|-------------|-------------------------------------------------------------------------------------------------------------|
| detectadjfillets    | on   off                         | on          | Whether to detect cylindrical faces adjacent to<br>the detected planar faces.                               |
| detectedgesplanar   | on   off                         | on          | Whether to detect planar edges.                                                                             |
| detectedgesstraight | on   off                         | on          | Whether to detect straight edges.                                                                           |
| detectfacesplanar   | on   off                         | on          | Whether to detect planar faces.                                                                             |
| edgemaxangle        | double                           | 60 degrees  | Maximum angle between an edge element and a<br>neighbor for the two elements to belong to the<br>same edge. |
| facemaxangle        | double                           | 40 degrees  | Maximum tolerated angle between neighboring<br>boundary elements in the same face.                          |
| minlengthtype       | auto  <br>relative  <br>absolute | auto        | Minimum edge length type: automatic, relative, or<br>absolute.                                              |
| minrellength        | double                           | 0.01        | Minimum relative edge length, relative to size of<br>geometry, if minlengthtype = relative.                 |
| minabslength        | double                           | 0           | Minimum absolute edge length, if<br>minlengthtype = absolute.                                               |
| planaredgeparam     | double                           | 0.5         | Parameter for planar edge detection (0–1).                                                                  |
| planarfacemaxangle  | double                           | 0.6 degrees | Maximum tolerated angle between neighboring<br>boundary elements in the same planar face.                   |

TABLE 4-9: VALID PROPERTY/VALUE PAIRS FOR FACEPARTITION = DETECTFACES.

| PROPERTY                  | VALUE  | DEFAULT | DESCRIPTION                                               |
|---------------------------|--------|---------|-----------------------------------------------------------|
| planarfaceminareafraction | double | 0.005   | Minimum relative area for a planar face to be<br>created. |
| straightedgeparam         | double | 0.5     | Parameter for straight edge detection (0–1).              |

The table below specifies the properties for selections imported when source is file, stl, or dataset.

TABLE 4-10: VALID PROPERTY/VALUE PAIRS WHEN SOURCE IS FILE, STL, OR DATASET.

| PROPERTY   | VALUE        | DEFAULT | DESCRIPTION                             |
|------------|--------------|---------|-----------------------------------------|
| outsel_dom | String array |         | Names of domain selections.             |
| outsel_bnd | String array |         | Names of boundary selections.           |
| outsel_edg | String array |         | Names of edge selections in 3D.         |
| outsel_pnt | String array |         | Names of point selections in 3D and 2D. |

Default values in the arrays are based on the names of the selections in the source. The length of the array can be determined by using

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).getStringArray(*property*).length;

If no selection of a certain dimension is imported, the length of the corresponding array is 0.

The values of the selection properties can be set using individual names accompanied by an index between 0 and length-1

```
model.component(<ctag>).mesh(<tag>).feature(<ftag>).setIndex(property,<nname>,<index>);
```

where *<nname>* is the new name for the selection on place *<index>* in the *property* array. An alternative is to set the entire string array at once

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).set(*property*,*<narray>*);

where *<narray>* is a new array of strings of correct length.

Values in each of the string arrays must be unique, while different string arrays may contain the same value. Values in the string arrays must be nonempty.

The table below specifies the supported NASTRAN bulk data entries.

TABLE 4-11: SUPPORTED NASTRAN BULK DATA ENTRIES.

| BULK DATA ENTRY |        |        |        |        |
|-----------------|--------|--------|--------|--------|
| CBAR            | CBEAM  | CORD2C | CQUAD4 | GRID   |
| CHEXA           | CORD2R | CQUAD8 | MAT1   | MAT10  |
| CORD1C          | CORD2S | CTETRA | PSHELL | PSOLID |
| CORD1R          | CPENTA | CTRIA3 | RBE2   | RBE3   |
| CORD1S          | CPYRAM | CTRIA6 |        |        |

The RBE entries (RBE2 and RBE3) define a fixed point and one or several dependent points (For RBE3, only the first set of dependent points is taken). Dependent points that are second-order points are ignored. A point selection is created for the fixed points of each RBE entry. In addition, a selection of each entity level may be created for each RBE entry in such a way that each mesh element, whose all first-order vertices are dependent points for the RBE entry, is part of the selection. If a dependent point selection associated with a RBE entry is not empty, the fixed point is also added to the selection.

The NASTRAN bulk data format uses reduced second-order elements; that is, the center node on quadrilateral mesh faces (quadNode) and the center node of hexahedral elements (hexNode) are missing. Importing a NASTRAN mesh with second-order elements, COMSOL Multiphysics interpolates the coordinates of these missing node

points from the surrounding node points using the following formulas: quadNode = 0.5\*quadEdgeNodes - 0.25\*quadCornerNodes, where quadEdgeNodes is the sum of the coordinates of the surrounding 4 edge nodes and quadCornerNodes is the sum of the coordinates of the surrounding 4 corner nodes, and hexNode = 0.25\*hexEdgeNodes-0.25\*hexCornerNodes, where hexEdgeNodes is the sum of the coordinates of the surrounding 12 edge nodes and hexCornerNodes is the sum of the coordinates of the surrounding 8 corner nodes.

![](_page_71_Picture_1.jpeg)

The Import feature does not handle NASTRAN files in free field format where the data fields are separated by blanks.

## **COMPATIBILITY**

The source property value stlvrml has been replaced by separate stl and vrml values in version 5.5. The value stlvrml is also accepted for backward compatibility. If a filename is given and it ends with .vrml, source is then set to vrml. Otherwise, source is set to stl.

The elemsplit property from earlier versions is no longer available from version 5.3.

For 3D meshing sequences, the setting manual of the property facepartition in the mesh Import feature, as well as all the properties associated with this setting, are deprecated as of COMSOL 5.1 and may be removed in a future version. In COMSOL 5.1, these properties are still available with unchanged behavior for backward compatibility.

#### **SEE ALSO**

Transform, Ball, Box, CreateVertices, DeleteEntities, DetectFaces, JoinEntities, LogicalExpression, Filter (Dataset), Partition

