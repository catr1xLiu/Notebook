# *Supported Material Types and Settings*

TABLE 9-5: SUPPORTED MATERIAL TYPES AND SETTINGS.

The following table includes the supported material types and settings with their data type and feature ID:

| SETTING               | DESCRIPTION                     | TYPE        | FEATURE ID | FEATURE<br>DESCRIPTION |
|-----------------------|---------------------------------|-------------|------------|------------------------|
| alpha                 | Opacity                         | Double      |            | Applies to all ID:s    |
| ambient               | Ambient color                   | String      |            | Applies to all ID:s    |
| basis                 | Custom basis for brush<br>lines | String      |            | Applies to all ID:s    |
| basisx                | xm-axis                         | DoubleArray |            | Applies to all ID:s    |
| basisy                | ym-axis                         | DoubleArray |            | Applies to all ID:s    |
| callCleanup           | Call cleanup()                  | Boolean     | External   | External material      |
| callInit              | Call init()                     | Boolean     | External   | External material      |
| clearcoat             | Clear coat                      | Double      |            | Applies to all ID:s    |
| color                 | Color                           | String      |            | Applies to all ID:s    |
| colornoise            | Additional color                | String      |            | Applies to all ID:s    |
| colornoisebrush       | Brush lines                     | String      |            | Applies to all ID:s    |
| colornoisefrequency   | Noise frequency                 | Double      |            | Applies to all ID:s    |
| colornoisenormalscale | Normal vector noise<br>scale    | Double      |            | Applies to all ID:s    |
| colornoisescale       | Noise scale                     | Double      |            | Applies to all ID:s    |

TABLE 9-5: SUPPORTED MATERIAL TYPES AND SETTINGS.

| SETTING               | DESCRIPTION                               | TYPE         | FEATURE ID          | FEATURE<br>DESCRIPTION   |
|-----------------------|-------------------------------------------|--------------|---------------------|--------------------------|
| colornoisetype        | Noise type                                | String       |                     | Applies to all ID:s      |
| complex               | Pass arguments as<br>complex              | Boolean      | External            | External material        |
| customambient         | Custom color                              | DoubleArray  |                     | Applies to all ID:s      |
| customcolor           | Custom color                              | DoubleArray  |                     | Applies to all ID:s      |
| customdiffuse         | Custom color                              | DoubleArray  |                     | Applies to all ID:s      |
| customnoisecolor      | Custom color                              | DoubleArray  |                     | Applies to all ID:s      |
| customspecular        | Custom color                              | DoubleArray  |                     | Applies to all ID:s      |
| diffuse               | Diffuse color                             | String       |                     | Applies to all ID:s      |
| diffusewrap           | Diffuse wrap                              | Double       |                     | Applies to all ID:s      |
| equation              |                                           | String       | PorousMedia         | Porous material          |
| errorMessage          | Return error, warning,<br>and log details | Boolean      | External            | External material        |
| errorMessageSize      | Maximum error<br>message length           | Int          | External            | External material        |
| family                | Material type                             | String       |                     | Applies to all ID:s      |
| filenameglnxa64       | Filename                                  | File         | External            | External material        |
| filenameglnxarm64     | Filename                                  | File         | External            | External material        |
| filenamemacarm64      | Filename                                  | File         | External            | External material        |
| filenamemaci64        | Filename                                  | File         | External            | External material        |
| filenamewin64         | Filename                                  | File         | External            | External material        |
| fresnel               | Reflectance at normal<br>incidence        | Double       |                     | Applies to all ID:s      |
| importednameglnxa64   | Filename                                  | String       | External            | External material        |
| importednameglnxarm64 | Filename                                  | String       | External            | External material        |
| importednamemacarm64  | Filename                                  | String       | External            | External material        |
| importednamemaci64    | Filename                                  | String       | External            | External material        |
| importednamewin64     | Filename                                  | String       | External            | External material        |
| info                  | Material information                      | StringMatrix | Common              | Material                 |
| info                  | Material information                      | StringMatrix | External            | External material        |
| info                  | Material information                      | StringMatrix | LayeredMaterial     | Layered material         |
| intname               | Interface                                 | StringArray  | LayeredMaterial     | Layered material         |
| intname_D             | Label                                     | String       | SingleLayerMaterial | Single layer material    |
| intname_U             | Label                                     | String       | SingleLayerMaterial | Single layer material    |
| layername             | Label                                     | String       | SingleLayerMaterial | Single layer material    |
| layername             | Layer                                     | StringArray  | LayeredMaterial     | Layered material         |
| lighting              | Lighting model                            | String       |                     | Applies to all ID:s      |
| link                  | Material                                  | String       | Link                | Material link            |
| link                  | Material                                  | String       | TopologyLink        | Topology link            |
| link                  | Material                                  | String       | SingleLayerMaterial | Single layer material    |
| link                  | Material                                  | String       | LayeredMaterialLink | Layered material<br>link |

TABLE 9-5: SUPPORTED MATERIAL TYPES AND SETTINGS.

| SETTING          | DESCRIPTION                      | TYPE        | FEATURE ID           | FEATURE<br>DESCRIPTION    |
|------------------|----------------------------------|-------------|----------------------|---------------------------|
| link             | Material                         | StringArray | LayeredMaterial      | Layered material          |
| linkBase         | Material                         | String      | SingleLayerMaterial  | Single layer material     |
| linkBase         | Material                         | String      | LayeredMaterialLink  | Layered material<br>link  |
| linkBase         | Material                         | String      | LayeredMaterialStack | Layered material<br>stack |
| linkBase         | Material                         | String      | PorousMedia          | Porous material           |
| matLink_int      | Material                         | StringArray | LayeredMaterial      | Layered material          |
| matLink_int_D    | Material                         | String      | SingleLayerMaterial  | Single layer material     |
| matLink_int_U    | Material                         | String      | SingleLayerMaterial  | Single layer material     |
| merge            | Merge middle layers              | Boolean     | LayeredMaterialLink  | Layered material<br>link  |
| merge            | Merge middle layers              | Boolean     | LayeredMaterialStack | Layered material<br>stack |
| meshPoints       | Mesh elements                    | Double      | SingleLayerMaterial  | Single layer material     |
| meshPoints       | Mesh elements                    | DoubleArray | LayeredMaterial      | Layered material          |
| metallic         | Metallic                         | Double      |                      | Applies to all ID:s       |
| middlePlane      | Position                         | String      | Common               | Material                  |
| middlePlane      | Position                         | String      | SingleLayerMaterial  | Single layer material     |
| middlePlane      | Position                         | String      | LayeredMaterialLink  | Layered material<br>link  |
| middlePlane      | Position                         | String      | LayeredMaterialStack | Layered material<br>stack |
| mirror           | Mirror in                        | String      | LayeredMaterialLink  | Layered material<br>link  |
| mirror           | Mirror in                        | String      | LayeredMaterialStack | Layered material<br>stack |
| noise            | Normal mapping                   | String      |                      | Applies to all ID:s       |
| noisecolor       | Color                            | String      |                      | Applies to all ID:s       |
| noisecolorblend  | Color blend                      | Double      |                      | Applies to all ID:s       |
| noisefreq        | Normal vector noise<br>frequency | Double      |                      | Applies to all ID:s       |
| noisescale       | Normal vector noise<br>scale     | Double      |                      | Applies to all ID:s       |
| normalnoisebrush | Brush lines                      | String      |                      | Applies to all ID:s       |
| normalnoisetype  | Noise type                       | String      |                      | Applies to all ID:s       |
| offset           | Relative midsurface<br>offset    | Double      | Common               | Material                  |
| offset           | Relative midsurface<br>offset    | Double      | SingleLayerMaterial  | Single layer material     |
| offset           | Relative midsurface<br>offset    | Double      | LayeredMaterialLink  | Layered material<br>link  |
| offset           | Relative midsurface<br>offset    | Double      | LayeredMaterialStack | Layered material<br>stack |

TABLE 9-5: SUPPORTED MATERIAL TYPES AND SETTINGS.

| SETTING                 | DESCRIPTION                               | TYPE         | FEATURE ID           | FEATURE<br>DESCRIPTION    |
|-------------------------|-------------------------------------------|--------------|----------------------|---------------------------|
| orientDist              | Distance between the<br>orientation lines | Double       | LayeredMaterial      | Layered material          |
| orientDist              | Distance between the<br>orientation lines | Double       | LayeredMaterialLink  | Layered material<br>link  |
| orientDist              | Distance between the<br>orientation lines | Double       | LayeredMaterialStack | Layered material<br>stack |
| orientation             | Orientation/variation                     | String       | Common               | Material                  |
| orientation             | Orientation/variation                     | String       | External             | External material         |
| orientation             | Orientation/variation                     | String       | LayeredMaterial      | Layered material          |
| origin                  | Origin                                    | DoubleArray  |                      | Applies to all ID:s       |
| outputQuantities        | Output quantities                         | StringMatrix | External             | External material         |
| pearl                   | Pearl                                     | Double       |                      | Applies to all ID:s       |
| phase                   | Phase                                     | String       | Common               | Material                  |
| phase                   | Phase                                     | String       | External             | External material         |
| phase                   | Phase                                     | String       | LayeredMaterial      | Layered material          |
| porosity                | Porosity                                  | String       | PorousMedia          | Porous material           |
| position                | Position                                  | StringArray  | LayeredMaterial      | Layered material          |
| reflectance             | Reflectance                               | Double       |                      | Applies to all ID:s       |
| repeated                | Number of repeats                         | Double       | LayeredMaterialLink  | Layered material<br>link  |
| repeated                | Number of repeats                         | Double       | LayeredMaterialStack | Layered material<br>stack |
| requiredInputQuantities | Required input<br>quantities              | StringMatrix | External             | External material         |
| rotation                | Rotation (deg)                            | DoubleArray  | LayeredMaterial      | Layered material          |
| rotation                | Rotation                                  | Double       | SingleLayerMaterial  | Single layer material     |
| roughness               | Surface roughness                         | Double       |                      | Applies to all ID:s       |
| shininess               | Specular exponent                         | Double       |                      | Applies to all ID:s       |
| showLabels              | Shows labels in cross<br>section plot     | Boolean      | Common               | Material                  |
| showLabels              | Shows labels in cross<br>section plot     | Boolean      | LayeredMaterial      | Layered material          |
| showLabels              | Shows labels in cross<br>section plot     | Boolean      | SingleLayerMaterial  | Single layer material     |
| showLabels              | Shows labels in cross<br>section plot     | Boolean      | LayeredMaterialLink  | Layered material<br>link  |
| showLabels              | Shows labels in cross<br>section plot     | Boolean      | LayeredMaterialStack | Layered material<br>stack |
| socket                  | Interface type                            | String       | External             | External material         |
| solidInfo               | Porosity                                  | StringMatrix | PorousMedia          | Porous material           |
| specifybasisy           | Specify ym-axis                           | String       |                      | Applies to all ID:s       |
| specular                | Specular color                            | String       |                      | Applies to all ID:s       |
| stack                   | Stack member                              | String       | Common               | Material                  |
| stack                   | Stack member                              | String       | SingleLayerMaterial  | Single layer material     |

TABLE 9-5: SUPPORTED MATERIAL TYPES AND SETTINGS.

| SETTING        | DESCRIPTION                                                               | TYPE         | FEATURE ID           | FEATURE<br>DESCRIPTION    |
|----------------|---------------------------------------------------------------------------|--------------|----------------------|---------------------------|
| stack          | Stack member                                                              | String       | LayeredMaterialLink  | Layered material<br>link  |
| stack          | Stack member                                                              | String       | LayeredMaterialStack | Layered material<br>stack |
| stackAlign     | Automatic alignment<br>when the selected stack<br>member is not available | Boolean      | Common               | Material                  |
| stackAlign     | Automatic alignment<br>when the selected stack<br>member is not available | Boolean      | SingleLayerMaterial  | Single layer material     |
| stackAlign     | Automatic alignment<br>when the selected stack<br>member is not available | Boolean      | LayeredMaterialLink  | Layered material<br>link  |
| stackAlign     | Automatic alignment<br>when the selected stack<br>member is not available | Boolean      | LayeredMaterialStack | Layered material<br>stack |
| stackInfo      | Stack zone definition                                                     | StringMatrix | LayeredMaterialStack | Layered material<br>stack |
| stateInit      | Initial state values                                                      | StringArray  | External             | External material         |
| stateName      | State base name                                                           | StringArray  | External             | External material         |
| sys            | Coordinate system                                                         | String       | Common               | Material                  |
| sys            | Coordinate system                                                         | String       | SingleLayerMaterial  | Single layer material     |
| sys            | Coordinate system                                                         | String       | LayeredMaterialLink  | Layered material<br>link  |
| sys            | Coordinate system                                                         | String       | LayeredMaterialStack | Layered material<br>stack |
| thickness      | Thickness                                                                 | Double       | Common               | Material                  |
| thickness      | Thickness                                                                 | Double       | SingleLayerMaterial  | Single layer material     |
| thickness      | Thickness                                                                 | DoubleArray  | LayeredMaterial      | Layered material          |
| thicknessScale | Scale                                                                     | String       | LayeredMaterialLink  | Layered material<br>link  |
| thicknessScale | Scale                                                                     | String       | LayeredMaterialStack | Layered material<br>stack |
| threadSafe     | Thread safe                                                               | Boolean      | External             | External material         |
| topologySource | Topology source                                                           | String       | TopologyLink         | Topology link             |
| transform      | Transform                                                                 | String       | LayeredMaterialLink  | Layered material<br>link  |
| transform      | Transform                                                                 | String       | LayeredMaterialStack | Layered material<br>stack |
| widthRatio     | Thickness-to-width<br>ratio                                               | Double       | Common               | Material                  |
| widthRatio     | Thickness-to-width<br>ratio                                               | Double       | LayeredMaterial      | Layered material          |
| widthRatio     | Thickness-to-width<br>ratio                                               | Double       | SingleLayerMaterial  | Single layer material     |

TABLE 9-5: SUPPORTED MATERIAL TYPES AND SETTINGS.

| SETTING    | DESCRIPTION              | ТҮРЕ   | FEATURE ID           | FEATURE<br>DESCRIPTION |
|------------|--------------------------|--------|----------------------|------------------------|
| widthRatio | Thickness-to-width ratio | Double | LayeredMaterialLink  | Layered material link  |
| widthRatio | Thickness-to-width ratio | Double | LayeredMaterialStack | Layered material stack |

