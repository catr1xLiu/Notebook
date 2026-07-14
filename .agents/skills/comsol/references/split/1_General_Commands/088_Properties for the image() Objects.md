# *Properties for the image() Objects*

The following properties are available for the export of images:

TABLE 2-148: EXPORT PROPERTIES.

| PROPERTY        | VALUE                               | DEFAULT | DESCRIPTION                                                                                          |
|-----------------|-------------------------------------|---------|------------------------------------------------------------------------------------------------------|
| antialias       | on   off                            | on*     | Enable or disable antialiasing.                                                                      |
| axes1d          | on   off                            | on*     | If options1d is on; enable/disable display of the<br>coordinate axes in 1D.                          |
| axes2d          | on   off                            | on*     | If options2d is on; enable/disable display of the<br>coordinate axes in 2D.                          |
| axisorientation | on   off                            | on*     | If options is on: enable or disable display of the axis<br>orientation indicator. Used for 3D plots. |
| background      | current  <br>color  <br>transparent | color*  | The background color.                                                                                |

TABLE 2-148: EXPORT PROPERTIES.

| PROPERTY     | VALUE                                                                                 | DEFAULT    | DESCRIPTION                                                                                                                                                                                                                                                                                                                             |
|--------------|---------------------------------------------------------------------------------------|------------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| bmpfilename  | String                                                                                |            | The name of the output file if imagetype is bmp.                                                                                                                                                                                                                                                                                        |
| customcolor  | double array                                                                          | {1, 1, 1}* | If background is color: the red, green, and blue<br>components of the background color.                                                                                                                                                                                                                                                 |
| epsfilename  | String                                                                                |            | The name of the output file if imagetype is eps.                                                                                                                                                                                                                                                                                        |
| fontsize     | integer                                                                               | 9*         | The font size.                                                                                                                                                                                                                                                                                                                          |
| giffilename  | String                                                                                |            | The name of the output file if imagetype is gif.                                                                                                                                                                                                                                                                                        |
| grid         | on   off                                                                              | on*        | If options is on: enable or disable display of the<br>coordinate grid. Used for 3D plots.                                                                                                                                                                                                                                               |
| height       | integer                                                                               | 480 px*    | The height of the image.                                                                                                                                                                                                                                                                                                                |
| lockratio    | on   off                                                                              | off*       | If on, the aspect ratio of the image is preserved when the<br>width or the height is changed.                                                                                                                                                                                                                                           |
| imagetype    | bmp   eps  <br>jpeg   png  <br>tiff   gif                                             | png*       | The type of image to export. eps can only be used for 1D<br>plots.                                                                                                                                                                                                                                                                      |
| jpegfilename | String                                                                                |            | The name of the output file if imagetype is jpeg.                                                                                                                                                                                                                                                                                       |
| legend1d     | on   off                                                                              | on*        | If options1d is on: enable or disable display of the<br>legend in 1D.                                                                                                                                                                                                                                                                   |
| legend2d     | on   off                                                                              | on*        | If options2d is on: enable or disable display of the<br>legend in 2D.                                                                                                                                                                                                                                                                   |
| legend3d     | on   off                                                                              | on*        | If options3d is on: enable or disable display of the<br>legend in 3D.                                                                                                                                                                                                                                                                   |
| logo1d       | on   off                                                                              | on*        | If options1d is on: enable or disable display of the logo<br>in 1D.                                                                                                                                                                                                                                                                     |
| logo2d       | on   off                                                                              | on*        | If options2d is on: enable or disable display of the logo<br>in 2D.                                                                                                                                                                                                                                                                     |
| logo3d       | on   off                                                                              | on*        | If options3d is on: enable or disable display of the logo<br>in 3D.                                                                                                                                                                                                                                                                     |
| options1d    | on   off                                                                              | off*       | Enable or disable optional components of the image in<br>1D.                                                                                                                                                                                                                                                                            |
| options2d    | on   off                                                                              | off*       | Enable or disable optional components of the image in<br>2D.                                                                                                                                                                                                                                                                            |
| options3d    | on   off                                                                              | off*       | Enable or disable optional components of the image in<br>3D.                                                                                                                                                                                                                                                                            |
| pngfilename  | String                                                                                |            | The name of the output file if imagetype is png.                                                                                                                                                                                                                                                                                        |
| resolution   | integer                                                                               | 480 px*    | Tthe image resolution in dots per inch.                                                                                                                                                                                                                                                                                                 |
| size         | current   web<br>print  <br>presentation<br>  custom   any<br>custom size<br>settings | current*   | How to specify the size and resolution of the image. The<br>value current gives a 800-by-600 image with the<br>resolution 96 dots per inch. The values manualweb and<br>manualprint let you give a size and resolution suitable<br>for the web or printing, respectively, but also let you<br>specify the size and resolution manually. |
| tifffilename | String                                                                                |            | The name of the output file if imagetype is tiff.                                                                                                                                                                                                                                                                                       |
| title1d      | on   off                                                                              | on*        | If options1d is on: enable or disable display of the title in<br>1D.                                                                                                                                                                                                                                                                    |
| title2d      | on   off                                                                              | on*        | If options2d is on: enable or disable display of the title in<br>2D.                                                                                                                                                                                                                                                                    |

TABLE 2-148: EXPORT PROPERTIES.

| PROPERTY | VALUE        | DEFAULT | DESCRIPTION                                                          |
|----------|--------------|---------|----------------------------------------------------------------------|
| title3d  | on   off     | on*     | If options3d is on: enable or disable display of the title in<br>3D. |
| unit     | px   mm   in | px*     | The unit for the dimensions of the image.                            |
| width    | integer      | 480 px* | The width of the image when size is manualweb.                       |

<sup>\*</sup> When making an image export, the value of the image feature doing the export will be stored and used as the default value when creating a new image feature. The image feature is created the first time the image() method is called.

The following properties are related to plotting of images:

TABLE 2-149: PROPERTIES FOR PLOTTING.

| PROPERTY    | VALUE               | DEFAULT | DESCRIPTION                                                                                                             |
|-------------|---------------------|---------|-------------------------------------------------------------------------------------------------------------------------|
| window      | new   window<br>tag | new     | The window to plot in. The window tags must be of the<br>form windowN, where N is an integer (for example,<br>window3). |
| windowtitle | String              | Plot N  | The window's title. The default is Plot N, where N is<br>taken from the window tag.                                     |

The following properties are used for both export and plotting of images:

TABLE 2-150: PROPERTIES FOR EXPORT AND PLOTTING.

| PROPERTY        | VALUE                                           | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                |
|-----------------|-------------------------------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| renderwireframe | on   off   fromview                             | on      | Whether to use wireframe rendering for the<br>geometry. The value fromview specifies that the view<br>controls the rendering. The other values override the<br>view setting. This property is only available in 3D and<br>only for the features that plot a selection. This<br>excludes geometries, meshes, and functions. |
| view            | auto   view tag                                 | auto    | The view settings to use when displaying this image.<br>auto indicates that the view is selected automatically<br>and will be the current view for the geometry being<br>displayed.                                                                                                                                        |
| zoomextents     | on   off                                        | on      | Whether to zoom the image to its extents. This<br>property is only available for image objects displaying<br>a geometry or mesh.                                                                                                                                                                                           |
| zooming         | nozooming  <br>zoomextents  <br>zoomtoselection | px*     | How to zoom the image. This property is available for<br>all image objects except for those displaying a<br>geometry, mesh, or function.                                                                                                                                                                                   |
| zoomlevel       | integer (in the range<br>from -15 to 15)        | 0       | The number of zoom-in (if positive) or zoom-out (if<br>negative) action steps to perform after zooming or<br>zoomextents has been applied.                                                                                                                                                                                 |

The tables below contain properties that are available for image() objects attached to a certain parent type.

The following property is used when attached to a geometry object:

TABLE 2-151: GEOMETRY PROPERTY.

| PROPERTY      | VALUE                  | DEFAULT  | DESCRIPTION                                   |
|---------------|------------------------|----------|-----------------------------------------------|
| showmaterial  | on   off  <br>fromview | fromview | Enable or disable material color and texture. |
| showselection | on   off  <br>fromview | fromview | Enable or disable material color and texture. |

The only difference for the showmaterial and showselection properties for the geometry is that the values are taken from the view by default- They are off by default for all other features (such as probes and physics features).

The following property is used when attached to a pair object:

TABLE 2-152: PAIR PROPERTY.

| PROPERTY  | VALUE                                  | DEFAULT   | DESCRIPTION                                                                                                               |
|-----------|----------------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------|
| selection | srcanddst  <br>source  <br>destination | srcanddst | Whether to display the source and destination selection,<br>only the source selection, or only the destination selection. |

The following property is used when attached to a physics feature or multiphysics coupling object:

TABLE 2-153: PHYSICS FEATURE OR MULTIPHYSICS COUPLING PROPERTY.

| PROPERTY  | VALUE                    | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                      |
|-----------|--------------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selection | main  <br>selection name | main    | Which selection to display. Some physics features and<br>multiphysics couplings have multiple selections. The value<br>main corresponds to the selection retrieved by calling<br>selection() on the physics feature or coupling, and the<br>other values are the names to obtain a selection using<br>selection( <name>).</name> |

The following property is used when attached to a nonlocal coupling object:

TABLE 2-154: PAIR PROPERTY.

| PROPERTY  | VALUE                                    | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                                                   |
|-----------|------------------------------------------|-----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| selection | srcanddst  <br>source  <br>destination   | srcanddst | A property with these values is available for the Boundary<br>Similarity, Edge Map, and Point Map nonlocal coupling<br>features. Whether to display the source and destination<br>selection, only the source selection, or only the destination<br>selection. |
| selection | source  <br>srcvertices  <br>dstvertices | source    | A property with these values is available for the Linear<br>Extrusion and Linear Projection nonlocal coupling features.<br>Whether to display the source selection, the source<br>vertices selection, or the destination vertices selection.                  |

