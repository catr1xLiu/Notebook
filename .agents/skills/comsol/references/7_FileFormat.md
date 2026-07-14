# File Formats

The following table shows the file types that COMSOL Multiphysics can read and write and provides pointers to documentation:

TABLE 9-1: FILE FORMATS SUMMARY.

| FILE FORMAT                                    | EXTENSION                | PRODUCT | READ | WRITE | DOCUMENTATION                                   |
|------------------------------------------------|--------------------------|---------|------|-------|-------------------------------------------------|
| COMSOL Model Files                             | mph                      | MPH     | Yes  | Yes   | N/A                                             |
| Model files for Java                           | java                     | MPH     | No   | Yes   | About the COMSOL Model File<br>Formats          |
| Compiled model files for Java<br>(class files) | class                    | MPH     | Yes  | No    | N/A                                             |
| Model files for MATLAB (M<br>files)            | m                        | LLML    | No   | Yes   | About the COMSOL Model File<br>Formats          |
| Native binary data files                       | mphbin                   | MPH     | Yes  | Yes   | Native Binary Data Files and Text Data<br>Files |
| Native text data files                         | mphtxt                   | MPH     | Yes  | Yes   | Native Binary Data Files and Text Data<br>Files |
| Materials                                      | xml                      | MPH     | Yes  | Yes   | Materials                                       |
| Spreadsheet file                               | txt                      | MPH     | Yes  | Yes   | Spreadsheet Data Format                         |
| Grid files                                     | txt                      | MPH     | Yes  | Yes   | Grid Data Format                                |
| Sectionwise files                              | txt                      | MPH     | Yes  | Yes   | Sectionwise Data Format                         |
| Continuous color tables                        |                          | MPH     | Yes  | No    | Continuous Color Tables                         |
| Discrete color tables                          |                          | MPH     | Yes  | No    | Discrete Color Tables                           |
| Color themes                                   |                          | MPH     | Yes  | No    | About Color Themes                              |
| Microsoft Excel® files                         | xlsx, xls,<br>xlsb, xlsm | LLEXCEL | Yes  | Yes   | Supported Microsoft Excel File Types            |

## Product keys:

**•** MPH: COMSOL Multiphysics

**•** LLML: COMSOL LiveLink™ *for* MATLAB® **•** LLEXCEL: COMSOL LiveLink™ *for* Excel®

# Data Formats

The data formats in COMSOL Multiphysics are used for exporting results data to file as well as representing input to interpolation functions in COMSOL. For all data formats, the exported file can contain a number of header rows starting with %, which contain information about the model and the exported data.

In this section:

- **•** Spreadsheet Data Format
- **•** Grid Data Format
- **•** Sectionwise Data Format

In the *COMSOL Multiphysics Reference Manual:*

![](_page_1_Picture_7.jpeg)

- **•** Examples of Spreadsheet, Sectionwise, and Grid File Formats
- **•** Exporting Data and Images

# *Spreadsheet Data Format*

This data format is used for importing unstructured data and exporting results data:

#### TABLE 9-2: DATA.

| SECTION | DESCRIPTION                     |
|---------|---------------------------------|
| Data    | Data values separated by spaces |

Each row of the file defines the coordinates and data values for the function in one point. A file used to define a function of three variables can begin as follows:

```
0 0 0.12 0.34
     0 1 0.52 1.50
     1 0 0.67 0.91
...
```

The first variable (input argument) appears in the first (leftmost) column, the second variable in the second column, the third variable in the third column, and the function values in the fourth (rightmost) column. The variables can be any function inputs. For space-dependent functions *f*(*x*, *y*, *z*) they are the *x*-, *y*-, and *z*-coordinates.

It is possible to define several functions in one file by providing more than one data column after the input variables (which, in many cases, are coordinates). When exporting several expressions to a file, COMSOL Multiphysics generates files with this structure.

![](_page_1_Picture_18.jpeg)

You can use the % character to indicate that a row contains comments and not data.

![](_page_2_Picture_1.jpeg)

The grid data format can only be used for import of data.

The following table shows the format for results data stored as grid points and corresponding data values:

TABLE 9-3: GRID, DATA.

| SECTION | NUMBER OF ROWS                                                                               | DESCRIPTION                                                                                                                          |
|---------|----------------------------------------------------------------------------------------------|--------------------------------------------------------------------------------------------------------------------------------------|
| % Grid  | 1–3                                                                                          | x grid points separated by spaces.<br>y grid points separated by spaces (optional).<br>z grid points separated by spaces (optional). |
| % Data  | Number of y grid points (2D) or number of y grid points<br>times number of z grid points (3) | Data values separated by spaces.                                                                                                     |

Each row contains values for different *x* grid points for fixed values of *y* and *z*. The rows first increase the *y* grid value and then the *z* grid value. The grid points can also represent another independent variable that the data values depend on. For example, the "grid points" can be temperature values and the data values the thermal conductivity at these temperatures.

![](_page_2_Picture_7.jpeg)

It is important to use a comment line starting with % to separate the grid points or other interpolation points and the data values that are associated with these coordinates or interpolation points.

It is possible to include more than one function in the file as long as a % Data header separates them one from the other.

In the *COMSOL Multiphysics Reference Manual:*

![](_page_2_Picture_11.jpeg)

- **•** Interpolation
- **•** Examples of Spreadsheet, Sectionwise, and Grid File Formats
- **•** Exporting Data and Images

![](_page_2_Picture_15.jpeg)

*Rock Fracture Flow*: Application Library path **COMSOL\_Multiphysics/Geophysics/rock\_fracture\_flow**

# *Sectionwise Data Format*

The following table shows the format for results data stored as node coordinates, elements, and corresponding data values:

TABLE 9-4: NODES, ELEMENTS, DATA.

| SECTION      | NO. COLUMNS    | DESCRIPTION                                                                                                                                                              |
|--------------|----------------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| %Coordinates | 1–3            | One to three columns containing x, y (optional), and z (optional)                                                                                                        |
| %Elements    | 3 (2D), 4 (3D) | Triangulation where each row contains the row indices of the points in the<br>Coordinates section that make up a single element — triangular in 2D,<br>tetrahedral in 3D |
| %Data        | 1              | Column of data values                                                                                                                                                    |

This format can also be used to import data for unstructured interpolation. It has the advantage over the Spreadsheet Data Format in that it also contains the exact mesh used to perform the interpolation.

![](_page_3_Picture_1.jpeg)

Duplicate values (that is, evaluations with the same coordinates and the same values of the evaluated expressions) are removed before the sectionwise data is exported to file.

In the *COMSOL Multiphysics Reference Manual:*

![](_page_3_Picture_4.jpeg)

- **•** Examples of Spreadsheet, Sectionwise, and Grid File Formats
- **•** Exporting Data and Images

# *Supported Microsoft Excel File Types*

If your license includes the LiveLink™ *for* Excel®, you can import data to COMSOL from files with the following Excel® formats:

- **•** For a client with Excel: Excel, Excel 97, Excel binary, and Excel macro
- **•** For a client without Excel: Excel and Excel macro

# Color Tables and Color Themes

# *About Color Tables*

Color table files are used when plotting. When COMSOL Multiphysics is loaded, it reads all files in the following directories:

- **•** data/colortables/ in the directory where COMSOL is installed.
- **•** The user settings directory .comsol/v6.3/colortables under your local home directory.

Most settings for colors are in the Default.txt file.

Files that adhere to the format specified in this section are made available as color tables, including any user-defined color table files that you have added.

In the examples below, a space is used as a separator in the color table files. You can also use a tab, comma, or semicolon as the separator.

In this section:

- **•** Continuous Color Tables
- **•** Discrete Color Tables

You can also add color tables to a model through the COMSOL API and in the COMSOL Desktop. See Custom Color Tables in this book and Custom Color Tables in the *COMSOL Multiphysics Reference Manual* for more information.

For information about available color tables, see Selecting Color Tables in the *COMSOL Multiphysics Reference Manual*.

# *Continuous Color Tables*

An example of a color table that defines a transition from blue to red:

```
% Continuous
0 0 1
1 0 0
```

Each line, from left to right, contains the red, green, and blue components (RGB) of a color. The components are floating-point values between 0 and 1. The table can contain an arbitrary number of colors.

Each color can contain an optional fourth component, which represents the length of the interval between the two colors. For *N* colors, there are *N* − 1 intervals. An example of a color table that defines a sharp transition from blue to magenta followed by a slow transition from magenta to red:

```
% Continuous
0 0 1 1
0.5 0 0.5 10
1 0 0
```

# *Discrete Color Tables*

An example of a color table for which the lower half of the legend is blue and the upper half is red:

```
% Discrete
0 0 1
1 0 0
```

Each color can contain an optional fourth component, the length of the interval occupied by that color. For *N* colors, there are *N* lengths. An example of a color table that defines a small blue interval, a long green interval, and a medium red interval:

```
% Discrete
0 0 1 1
0 1 0 10
1 0 0 5
```

# *About Color Themes*

Color themes can be used to change the look of the COMSOL Desktop and to color selections in the **Graphics** window for easier identification of different parts of the model geometry. You can access and store color theme files in the following locations:

- **•** data/colors (similar to data/colortables; for predefined color themes).
- **•** .comsol/v63/colors (for user-defined color themes).

It is recommended to use one of the existing color themes, which are designed to consider clashes between theme colors and selection colors. It is up to you to make sure the colors work well together if you modify an existing color theme or add your own.

The COMSOL Multiphysics software will use the default theme color for any color not read successfully from the color theme file, so you do not need to define all colors. Likewise, if a theme used in a model is not available in the data/colorthemes folder, you visually get the default theme.

The color theme files contain three sections.

- **•** The first section, Graphics colors, defines all the colors used by selections and contains keys for each color, similar to the preferences file. This section contains the theme colors that can be used for geometry coloring. This section can contain an arbitrary number of colors, which will cycle automatically. The colors are defined using RGB data in the range of 0–255.
- **•** The second section, Theme colors, defines the selection theme colors.
- **•** The third section, Graph cycle colors, contains colors for graph plots.

For a user-defined color theme, you can add a section called Palette first in the file, where you can define colors to use in one of the other sections. For example,

```
% Palette
MyColor=100 120 130
% Graphics colors
key=MyColor
```

The color MyColor, defined under Palette, is then used as the color for a key under Graphics colors.

The names of the theme files will appear in the theme-selection lists in the COMSOL Desktop.

Below you find an example file for a custom color theme with suggested names:

# % Graphics colors default\_surface=200 200 200 default\_line=0 0 0 selected\_surface=140 140 242 selected\_line=0 0 255 hover\_surface=255 120 120 100 hover\_line=255, 60, 60, 120 hover\_surface\_simple=242 140 140 hover\_line\_simple=255 0 0

```
hover_selected_surface=190 250 190 100
hover_selected_line=100 250 100 120
hover_selected_surface_simple=140 242 140
hover_selected_line_simple=0 153 0
feature_selection1_surface=250 222 87
feature_selection1_line=188 106 0
feature_selection2_surface=255 148 255
feature_selection2_line=155 58 165
feature_selection3_surface=247 147 30
feature_selection3_line=227 127 10
feature_selection4_surface=140 98 57
feature_selection4_line=120 78 37
% Theme colors
Red=255 0 0
Green=0 255 0
Blue=0 0 255
Yellow=255 255 0
Cyan=0 255 255
Magenta=255 0 255
Chartreuse=127 255 0
Azure=0 127 255
Rose=255 0 127
Orange=255 127 0
Spring green=0 255 127
Violet=127 0 255
Harlequin=63 255 0
Cerulean=0 63 255
Crimson=255 0 63
Lime=207 255 0
Capri=0 191 255
Cerise=255 0 191
Vermilion=255 63 0
Erin=0 255 63
Ultramarine=63 0 255
Amber=255 191 0
Aquamarine=0 255 191
Purple=191 0 255
% Graph cycle colors
% Range maxRGB
R1 G1 B1
R2 G2 B2
R3 G3 B3
...
```

where *R1*, *G1*, and *B1* are the RGB (red, green, and blue) values for the first color; *R2*, *G2*, and *B2* are the RGB values for the second color; and so on. The range on the first row of that section is the maximum value for an RGB component (*maxRGB* is an integer value). That row is optional; it defaults to 255 if not set.

It is possible to skip giving colors a name in the theme section, in which case they will be displayed as **Color 1**, **Color 2**, and so on. The syntax of the second section would then be:

```
255 191 0
0 255 191
191 0 255
...
```

These names only appear in the Linux and macOS version of the COMSOL Desktop, where the colors are displayed in a list. They do not appear in the Windows version.

The simple suffix in the selection color names means that the color is used for software rendering, as well as for OpenGL when **Optimize for** is set to **Performance** on the **Graphics** page in the **Preferences** window (and possibly also in some other instances when some OpenGL requirements fail).

# Materials

# *The Model XML-File Format*

Materials can be imported and exported using a Model XML-file format, which you can save and open as XML files with the .xml extension.

A typical Model XML-file can look like this:

```
<?xml version="1.0" encoding="UTF-8"?>
<archive>
 <model>
 <material>
 <label label="AC/DC library (History XML)"/>
 </material>
 <material tag="ndfeb_bmn_35" type="Common" component="">
 <propertyGroup tag="RemanentFluxDensity" descr="Remanent flux density">
 <func tag="int1" oper="Interpolation">
 <set name="funcname" value="Br"/>
 <set name="table" value="{{'293.15','1.220'},{'353.15','1.13'}}"/>
 <set name="extrap" value="linear"/>
 <set name="fununit" value="{'T'}"/>
 <set name="argunit" value="{'K'}"/>
 </func>
 <set name="murec" value="{'1.05','0','0','0','1.05','0','0','0','1.05'}"/>
 <set name="normBr" value="Br(T)"/>
 <addInput quantity="temperature"/>
 </propertyGroup>
 <label label="BMN-35"/>
 <set name="family" value="chrome"/>
 <propertyGroup tag="def">
 <set name="thermalconductivity" value="{'9.0[W/(m*K)]','0','0','0','9.0[W/
                                    (m*K)]','0','0','0','9.0[W/(m*K)]'}"/>
 <set name="density" value="7.55[g/cm^3]"/>
 <set name="heatcapacity" value="440[J/(kg*K)]"/>
 <set name="electricconductivity" value="{'1/1.50[uohm*m]','0','0','0','1/
                                     1.50[uohm*m]','0','0','0','1/1.50[uohm*m]'}"/>
 <set name="relpermittivity" value="{'1','0','0','0','1','0','0','0','1'}"/>
 </propertyGroup>
 </material>
 <!-- Node groups are added last and are used as categories in the material library -->
 <nodeGroup tag="bomatec_magnetic_materials" type="GlobalDefinitions">
 <!-- A type change is necessary to only allow materials -->
 <set name="type" value="material"/>
 <!-- This is a subcategory of the top-level category -->
 <feature tag="ndfeb">
 <label label="NdFeB"/>
 <!-- These elements adds the material to the group -->
 <add tag="ndfeb_bmn_35"/>
 <add tag="ndfeb_bmn_38"/>
 </feature>
 </nodeGroup>
 </model>
</archive>
```

Each element represents a method in Java, and the element attributes represents arguments to the methods. Below are some more details about parts of this example. The statement

```
<material>
 <label label="AC/DC library (History XML)"/>
</material>
```

accesses the material list of the model object and sets the label of that list to the value of the label attribute. When you use a material element with attributes it refers to a material instead, see the following example:

<material tag="ndfeb\_bmn\_35" type="Common" component="">

During import, this element first creates a material of type Common. The tag and component attributes are not strictly enforced during import because the import decides their values depending to what list you import the materials to. The given tag can be occupied by another material, and the component is specified by the target. The content of the material element defines what property groups and functions the material contains. The propertyGroup element and the func element work in the same way as the material element — they represent new entities under the entity created by the parent element.

The propertyGroup element contains a lot of elements named set and addInput. The set element represents setting the value of a material property, where the name attribute is the name of the property and the value attribute is its value. Tensor-valued properties use curly braces to specify tensors. Here the syntax follows the standards that COMSOL Multiphysics uses in its API. If you give one value to a 3-by-3 tensor property it will become an isotropic tensor. Similarly, a value of length 3 is a diagonal tensor, and a value of length 6 represents a symmetric tensor. Give 9 values (as in the example above) to specify a full anisotropic tensor. The convention to use a vector of values to a tensor is something that the COMSOL Multiphysics software uses for property groups and also settings in physics features and multiphysics couplings. Other matrix-style values, such as the interpolation table for the func element, use a matrix specification using two levels of curly braces. The addInput element adds a model input to the material, and it expects a valid physical quantity ID for its quantity attribute.

The material element also supports a few set elements. Typically for the appearance settings such as the one named family in the example above.

See the following sections for tables that list all supported material types and settings; property groups and material properties; physical quantities for model inputs; and functions and settings.

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

# Supported Property Groups and Material Properties

The following table includes all supported property groups and material properties with their property group, property name, size, and SI unit:

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY         | PROPERTY GROUP<br>(API NAME)      | PROPERTY GROUP (DESCRIPTION)              | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                       | SIZE | UNIT                                         |
|------------------|-----------------------------------|-------------------------------------------|--------------------|-------------------------------------------------|------|----------------------------------------------|
| Electrochemistry | ElectrodePotential                | Equilibrium potential                     | Eeq                | Equilibrium potential                           | lxl  | V                                            |
| Electrochemistry | ElectrodePotential                | Equilibrium potential                     | dEeqdT             | Temperature derivative of equilibrium potential | lxl  | V/K                                          |
| Electrochemistry | ElectrodePotential                | Equilibrium potential                     | cEeqref            | Reference concentration                         | lxl  | mol/m <sup>3</sup>                           |
| Electrochemistry | OperationalSOC                    | Operational electrode state-of-charge     | socmax             | Maximum<br>electrode<br>state-of-charge         | lxl  | I                                            |
| Electrochemistry | OperationalSOC                    | Operational electrode state-of-charge     | socmin             | Minimum<br>electrode<br>state-of-charge         | lxl  | I                                            |
| Electrochemistry | ElectrolyteConductivity           | Electrolyte conductivity                  | sigmal             | Electrolyte conductivity                        | 3×3  | S/m                                          |
| Electrochemistry | ElectrolyteSaltConcentra tion     | Electrolyte salt concentration            | cElsalt            | Electrolyte salt concentration                  | lxl  | mol/m <sup>3</sup>                           |
| Electrochemistry | linearizedRes                     | Linearized resistivity                    | rho0               | Reference resistivity                           | lxl  | ohm·m                                        |
| Electrochemistry | linearizedRes                     | Linearized resistivity                    | alpha              | Resistivity temperature coefficient             | lxl  | I/K                                          |
| Electrochemistry | linearizedRes                     | Linearized resistivity                    | Tref               | Reference temperature                           | lxl  | K                                            |
| Electrochemistry | SpeciesProperties                 | Species properties                        | transpNum          | Transport number                                | lxl  | I                                            |
| Electrochemistry | SpeciesProperties                 | Species properties                        | fcl                | Activity dependence                             | lxl  | I                                            |
| Electrochemistry | ic                                | Intercalation strain                      | dvol               | Volumetric strain                               | lxl  | I                                            |
| Electrochemistry | LocalCurrentDensity               | Local current density                     | ilocmat            | Local current density expression                | lxl  | A/m <sup>2</sup>                             |
| Electrochemistry | PolymerElectrolyteWate rTransport | Polymer<br>electrolyte<br>water transport | alpha              | Water<br>transport<br>coefficient               | lxl  | s·mol <sup>2</sup> /<br>(kg·m <sup>3</sup> ) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                  | PROPERTY GROUP<br>(API NAME)                 | PROPERTY GROUP (DESCRIPTION)                                 | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                       | SIZE | UNIT                        |
|---------------------------|----------------------------------------------|--------------------------------------------------------------|--------------------|-------------------------------------------------|------|-----------------------------|
| Electrochemistry          | PolymerElectrolyteWate rTransport            | Polymer<br>electrolyte<br>water transport                    | xi                 | Electroosmotic coefficient                      | lxl  | I                           |
| Electrochemistry          | MembraneCrossover                            | Membrane<br>crossover                                        | Psi_H2             | Permeation coefficient                          | lxl  | s·mol/<br>kg                |
| Electrochemistry          | MembraneCrossover                            | Membrane<br>crossover                                        | Psi_O2             | Permeation coefficient                          | lxl  | s·mol/<br>kg                |
| Electrochemistry          | MembraneCrossover                            | Membrane<br>crossover                                        | Psi_N2             | Permeation coefficient                          | lxl  | s·mol/<br>kg                |
| Electrochemistry          | PolymerElectrolyteWate rAbsorptionDesorption | Polymer<br>electrolyte<br>water<br>absorption-<br>desorption | k_abs_dsp          | Absorption-<br>desorption<br>rate constant      | lxl  | mol/<br>(m <sup>2</sup> ·s) |
| Geometric<br>properties   | shell                                        | Shell                                                        | lth                | Thickness                                       | lxl  | m                           |
| Geometric<br>properties   | shell                                        | Shell                                                        | Irot               | Rotation                                        | lxl  | rad                         |
| Geometric<br>properties   | shell                                        | Shell                                                        | Ine                | Mesh elements                                   | lxl  | I                           |
| Electromagnetic<br>models | linzRes                                      | Linearized resistivity                                       | rho0               | Reference resistivity                           | lxl  | ohm·m                       |
| Electromagnetic<br>models | linzRes                                      | Linearized resistivity                                       | alpha              | Resistivity temperature coefficient             | lxl  | I/K                         |
| Electromagnetic<br>models | linzRes                                      | Linearized resistivity                                       | Tref               | Reference temperature                           | lxl  | K                           |
| Electromagnetic<br>models | LossTangent                                  | Loss tangent, loss angle                                     | delta              | Loss tangent, loss angle                        | lxl  | rad                         |
| Electromagnetic<br>models | LossTangent                                  | Loss tangent,<br>loss angle                                  | epsilonPrim        | Relative<br>permittivity<br>(real part)         | 3x3  | I                           |
| Electromagnetic<br>models | LossTangentDF                                | Loss tangent,<br>dissipation<br>factor                       | tanDelta           | Loss tangent,<br>dissipation<br>factor          | lxl  | I                           |
| Electromagnetic<br>models | LossTangentDF                                | Loss tangent,<br>dissipation<br>factor                       | epsilonPrim        | Relative<br>permittivity<br>(real part)         | 3x3  | I                           |
| Electromagnetic<br>models | DielectricLoss                               | Dielectric<br>losses                                         | epsilonBis         | Relative<br>permittivity<br>(imaginary<br>part) | 3x3  | I                           |
| Electromagnetic<br>models | DielectricLoss                               | Dielectric<br>losses                                         | epsilonPrim        | Relative permittivity (real part)               | 3×3  | I                           |
| Electromagnetic<br>models | DielectricLoss                               | Dielectric<br>losses                                         | eta_epsilon        | Dielectric loss factor                          | 3x3  | I                           |
| Electromagnetic<br>models | RefractiveIndex                              | Refractive index                                             | n                  | Refractive index, real part                     | 3x3  | I                           |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                  | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP (DESCRIPTION) | PROPERTY (NAME) | PROPERTY (DESCRIPTION)                          | SIZE | UNIT                                    |
|---------------------------|------------------------------|------------------------------|-----------------|-------------------------------------------------|------|-----------------------------------------|
| Electromagnetic<br>models | RefractiveIndex              | Refractive index             | ki              | Refractive index, imaginary part                | 3×3  | I                                       |
| Electromagnetic<br>models | MagneticLosses               | Magnetic losses              | murPrim         | Relative permeability (real part)               | lxl  | I                                       |
| Electromagnetic<br>models | MagneticLosses               | Magnetic losses              | murBis          | Relative<br>permeability<br>(imaginary<br>part) | lxl  | I                                       |
| Electromagnetic<br>models | HBCurve                      | H-B curve                    | normH           | Magnetic field norm                             | lxl  | A/m                                     |
| Electromagnetic<br>models | EffectiveHBCurve             | Effective H-B curve          | normHeff        | Effective<br>magnetic field<br>norm             | lxl  | A/m                                     |
| Electromagnetic models    | BHCurve                      | B-H curve                    | normB           | Magnetic flux density norm                      | lxl  | Т                                       |
| Electromagnetic models    | BHCurve                      | B-H curve                    | normH           | Magnetic field norm                             | lxl  | A/m                                     |
| Electromagnetic<br>models | BHCurve                      | B-H curve                    | Wpm             | Magnetic coenergy density                       | lxl  | J/m <sup>3</sup>                        |
| Electromagnetic<br>models | EffectiveBHCurve             | Effective B-H curve          | normBeff        | Effective<br>magnetic flux<br>density norm      | lxl  | Т                                       |
| Electromagnetic<br>models | EffectiveBHCurve             | Effective B-H curve          | normHeff        | Effective<br>magnetic field<br>norm             | lxl  | A/m                                     |
| Electromagnetic<br>models | RemanentFluxDensity          | Remanent flux density        | murec           | Recoil permeability                             | 3x3  | 1                                       |
| Electromagnetic<br>models | RemanentFluxDensity          | Remanent flux density        | normBr          | Remanent flux density norm                      | lxl  | Т                                       |
| Electromagnetic models    | BHsCurve                     | B-Hs curve                   | normB           | Magnetic flux density norm                      | lxl  | Т                                       |
| Electromagnetic<br>models | BHsCurve                     | B-Hs curve                   | normHs          | Shifted<br>magnetic field<br>norm               | lxl  | A/m                                     |
| Electromagnetic models    | BHsCurve                     | B-Hs curve                   | Hc              | Coercive<br>magnetic field                      | lxl  | A/m                                     |
| Electromagnetic<br>models | BHsCurve                     | B-Hs curve                   | Wpm             | Magnetic<br>coenergy<br>density                 | lxl  | J/m <sup>3</sup>                        |
| Electromagnetic models    | EJCurve                      | E-J<br>characteristic        | normE           | Electric field norm                             | lxl  | V/m                                     |
| Piezoresistive<br>models  | PiezoresistanceForm          | Piezoresistance<br>form      | Pil             | Piezoresistive coupling matrix, Voigt notation  | 6×6  | m <sup>4</sup> /<br>(s·A <sup>2</sup> ) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                  | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)          | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                | SIZE | UNIT |
|-----------------------------------------------------------|------------------------------|------------------------------------------|--------------------|----------------------------------------------------------|------|------|
| Piezoresistive<br>models                                  | ElastoresistanceForm         | Elastoresistance<br>form                 | ml                 | Elastoresistive<br>coupling<br>matrix, Voigt<br>notation | 6x6  | ?*m  |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | MsJA               | Saturation<br>magnetization                              | 3x3  | A/m  |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | aJA                | Domain wall<br>density                                   | 3x3  | A/m  |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | kJA                | Pinning loss                                             | 3x3  | A/m  |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | cJA                | Magnetization<br>reversibility                           | 3x3  | 1    |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | alphaJA            | Interdomain<br>coupling                                  | 3x3  | 1    |
| Electromagnetic<br>models                                 | PMHBCurve                    | Permanent<br>magnet shifted<br>H-B curve | normHs             | Shifted<br>magnetic field<br>norm                        | 1x1  | A/m  |
| Electromagnetic<br>models                                 | PMBHCurve                    | Permanent<br>magnet shifted<br>B-H curve | normBpm            | Magnetic flux<br>density norm                            | 1x1  | T    |
| Electromagnetic<br>models                                 | Hc                           | Coercive<br>magnetic field               | Hc                 | Coercive<br>magnetic field                               | 1x1  | A/m  |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelCauchy        | Cauchy                                   | ODcca              | Cauchy<br>dispersion<br>coefficients                     | 3x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelCauchy        | Cauchy                                   | Trefcca            | Reference<br>temperature                                 | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelCauchy        | Cauchy                                   | Prefcca            | Reference<br>pressure                                    | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelConrad<br>y   | Conrady                                  | ODcra              | Conrady<br>dispersion<br>coefficients                    | 3x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelConrad<br>y   | Conrady                                  | Trefcra            | Reference<br>temperature                                 | 1x1  | K    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                  | PROPERTY GROUP<br>(API NAME)         | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                        | SIZE | UNIT |
|-----------------------------------------------------------|--------------------------------------|---------------------------------|--------------------|--------------------------------------------------|------|------|
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelConrad<br>y           | Conrady                         | Prefcra            | Reference<br>pressure                            | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelHerzbe<br>rger        | Herzberger                      | ODhza              | Herzberger<br>dispersion<br>coefficients         | 5x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelHerzbe<br>rger        | Herzberger                      | Trefhza            | Reference<br>temperature                         | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelHerzbe<br>rger        | Herzberger                      | Prefhza            | Reference<br>pressure                            | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottS<br>tandard    | Schott                          | ODsca              | Schott<br>dispersion<br>coefficients             | 6x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottS<br>tandard    | Schott                          | Trefsca            | Reference<br>temperature                         | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottS<br>tandard    | Schott                          | Prefsca            | Reference<br>pressure                            | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottE<br>xtended    | Schott<br>extended              | ODscb              | Schott<br>extended<br>dispersion<br>coefficients | 9x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottE<br>xtended    | Schott<br>extended              | Trefscb            | Reference<br>temperature                         | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottE<br>xtended    | Schott<br>extended              | Prefscb            | Reference<br>pressure                            | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSellmei<br>erStandard | Sellmeier                       | ODsma              | Sellmeier<br>dispersion<br>coefficients          | 6x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSellmei<br>erStandard | Sellmeier                       | Trefsma            | Reference<br>temperature                         | 1x1  | K    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                       | PROPERTY GROUP<br>(API NAME)                         | PROPERTY GROUP<br>(DESCRIPTION)                        | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                           | SIZE | UNIT |
|----------------------------------------------------------------|------------------------------------------------------|--------------------------------------------------------|--------------------|---------------------------------------------------------------------|------|------|
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erStandard                 | Sellmeier                                              | Prefsma            | Reference<br>pressure                                               | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified1                | Sellmeier<br>modified, type 1                          | ODsmb              | Sellmeier<br>modified, type<br>1 dispersion<br>coefficients         | 6x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified1                | Sellmeier<br>modified, type 1                          | Trefsmb            | Reference<br>temperature                                            | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified1                | Sellmeier<br>modified, type 1                          | Prefsmb            | Reference<br>pressure                                               | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified2                | Sellmeier<br>modified, type 2                          | ODsmc              | Sellmeier<br>modified, type<br>2 dispersion<br>coefficients         | 5x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified2                | Sellmeier<br>modified, type 2                          | Trefsmc            | Reference<br>temperature                                            | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified2                | Sellmeier<br>modified, type 2                          | Prefsmc            | Reference<br>pressure                                               | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelTemper<br>atureDependentSellmeie<br>r | Temperature<br>dependent<br>Sellmeier                  | ODtds              | Temperature<br>dependent<br>Sellmeier<br>dispersion<br>coefficients | 30x1 | 1    |
| Electromagnetic<br>models/Thermo<br>optic dispersion<br>models | ThermoOpticDispersion<br>ModelSchott                 | Schott thermo<br>optic                                 | TOsco              | Schott<br>thermo-optic<br>dispersion<br>coefficients                | 6x1  | 1    |
| Electromagnetic<br>models/Thermo<br>optic dispersion<br>models | ThermoOpticDispersion<br>ModelSchott                 | Schott thermo<br>optic                                 | Trefsco            | Reference<br>temperature                                            | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>attenuation<br>models     | AttenuationCoefficient                               | Attenuation<br>coefficient                             | alphaI             | Attenuation<br>coefficient                                          | 1x1  | 1/m  |
| Electromagnetic<br>models/Optical<br>attenuation<br>models     | InternalTransmittance2                               | Internal<br>transmittance, 2<br>mm sample<br>thickness | taui2              | Internal<br>transmittance,<br>2 mm sample<br>thickness              | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)                         | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                               | SIZE | UNIT |
|------------------------------------------------------------|------------------------------|---------------------------------------------------------|--------------------|---------------------------------------------------------|------|------|
| Electromagnetic<br>models/Optical<br>attenuation<br>models | InternalTransmittance5       | Internal<br>transmittance, 5<br>mm sample<br>thickness  | taui5              | Internal<br>transmittance,<br>5 mm sample<br>thickness  | 1x1  | 1    |
| Electromagnetic<br>models/Optical<br>attenuation<br>models | InternalTransmittance10      | Internal<br>transmittance,<br>10 mm sample<br>thickness | taui10             | Internal<br>transmittance,<br>10 mm sample<br>thickness | 1x1  | 1    |
| Electromagnetic<br>models/Optical<br>attenuation<br>models | InternalTransmittance25      | Internal<br>transmittance,<br>25 mm sample<br>thickness | taui25             | Internal<br>transmittance,<br>25 mm sample<br>thickness | 1x1  | 1    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | An_jr              | Jain-Roulston<br>coefficient (n<br>type), A             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Bn_jr              | Jain-Roulston<br>coefficient (n<br>type), B             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Cn_jr              | Jain-Roulston<br>coefficient (n<br>type), C             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Ap_jr              | Jain-Roulston<br>coefficient (p<br>type), A             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Bp_jr              | Jain-Roulston<br>coefficient (p<br>type), B             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Cp_jr              | Jain-Roulston<br>coefficient (p<br>type), C             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Nref_jr            | Band-gap<br>narrowing<br>reference<br>concentration     | 1x1  | 1/m3 |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | alpha_jr           | Conduction<br>band fraction                             | 1x1  | 1    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | SlotboomModel                | Slotboom<br>model                                       | Eref_sb            | Band-gap<br>narrowing<br>reference<br>energy            | 1x1  | V    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                           | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)        | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                           | SIZE | UNIT     |
|----------------------------------------------------|------------------------------|----------------------------------------|--------------------|-----------------------------------------------------|------|----------|
| Semiconductors/<br>Band-gap<br>narrowing<br>models | SlotboomModel                | Slotboom<br>model                      | Nref_sb            | Band-gap<br>narrowing<br>reference<br>concentration | 1x1  | 1/m3     |
| Semiconductors/<br>Band-gap<br>narrowing<br>models | SlotboomModel                | Slotboom<br>model                      | alpha_sb           | Conduction<br>band fraction                         | 1x1  | 1        |
| Semiconductors/<br>Generation<br>Recombination     | SRH                          | Shockley-Read<br>Hall<br>recombination | taun               | Electron<br>lifetime, SRH                           | 1x1  | s        |
| Semiconductors/<br>Generation<br>Recombination     | SRH                          | Shockley-Read<br>Hall<br>recombination | taup               | Hole lifetime,<br>SRH                               | 1x1  | s        |
| Semiconductors/<br>Generation<br>Recombination     | Direct                       | Direct<br>recombination                | C                  | Direct<br>recombination<br>factor                   | 1x1  | m3/s     |
| Semiconductors/<br>Generation<br>Recombination     | Auger                        | Auger<br>recombination                 | Cn                 | Auger<br>recombination<br>factor,<br>electrons      | 1x1  | m6<br>/s |
| Semiconductors/<br>Generation<br>Recombination     | Auger                        | Auger<br>recombination                 | Cp                 | Auger<br>recombination<br>factor, holes             | 1x1  | m6<br>/s |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | an                 | a factor,<br>electrons,<br>impact<br>ionization     | 1x1  | 1/V      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | ap                 | a factor, holes,<br>impact<br>ionization            | 1x1  | 1/V      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | bn                 | b factor,<br>electrons,<br>impact<br>ionization     | 1x1  | V/m      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | bp                 | b factor, holes,<br>impact<br>ionization            | 1x1  | V/m      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | cnii               | c factor,<br>electrons,<br>impact<br>ionization     | 1x1  | 1/K      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | cpii               | c factor, holes,<br>impact<br>ionization            | 1x1  | 1/K      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | dn                 | d factor,<br>electrons,<br>impact<br>ionization     | 1x1  | 1/K      |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)                | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                                                     | SIZE | UNIT             |
|------------------------------------------------|------------------------------|------------------------------------------------|--------------------|-----------------------------------------------------------------------------------------------|------|------------------|
| Semiconductors/<br>Generation<br>Recombination | ImpactIonization             | Impact<br>ionization                           | dp                 | d factor, holes,<br>impact<br>ionization                                                      | 1x1  | 1/K              |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | Eg0                | Band gap                                                                                      | 1x1  | V                |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | chi0               | Electron<br>affinity                                                                          | 1x1  | V                |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | Nv                 | Effective<br>density of<br>states, valence<br>band                                            | 1x1  | 1/m3             |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | Nc                 | Effective<br>density of<br>states,<br>conduction<br>band                                      | 1x1  | 1/m3             |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | mun                | Electron<br>mobility                                                                          | 1x1  | m2/<br>(V·s)     |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | mup                | Hole mobility                                                                                 | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | meDG               | Electron<br>effective mass,<br>density<br>gradient                                            | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | mhDG               | Hole effective<br>mass, density<br>gradient                                                   | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | meOx               | Electron<br>effective mass,<br>density<br>gradient, for<br>penetration<br>depth in<br>barrier | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | mhOx               | Hole effective<br>mass, density<br>gradient, for<br>penetration<br>depth in<br>barrier        | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | meOxStar           | Electron<br>effective mass,<br>density<br>gradient, for<br>flux into<br>barrier               | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | mhOxStar           | Hole effective<br>mass, density<br>gradient, for<br>flux into<br>barrier                      | 3x3  | kg               |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                           | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME)    | PROPERTY<br>(DESCRIPTION)                          | SIZE | UNIT             |
|------------------------------------|------------------------------|---------------------------------|-----------------------|----------------------------------------------------|------|------------------|
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | mun0_pl               | Electron<br>mobility<br>reference                  | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | mup0_pl               | Hole mobility<br>reference                         | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | alphan_pl             | Electron<br>exponent                               | 1x1  | 1                |
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | alphap_pl             | Hole exponent                                      | 1x1  | 1                |
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | Tref_pl               | Reference<br>temperature                           | 1x1  | K                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | mun0_ref_a<br>rora    | Electron<br>mobility<br>reference                  | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | mup0_ref_a<br>rora    | Hole mobility<br>reference                         | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | mun_min_r<br>ef_arora | Electron<br>mobility<br>reference<br>minimum       | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | mup_min_r<br>ef_arora | Hole mobility<br>reference<br>minimum              | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | Nn0_ref_ar<br>ora     | Electron<br>reference<br>impurity<br>concentration | 1x1  | 1/m3             |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | Np0_ref_ar<br>ora     | Hole reference<br>impurity<br>concentration        | 1x1  | 1/m3             |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | alpha0_aror<br>a      | Alpha<br>coefficient                               | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | beta1_arora           | Mobility<br>reference<br>minimum<br>exponent       | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | beta2_arora           | Mobility<br>reference<br>exponent                  | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | beta3_arora           | Impurity<br>concentration<br>reference<br>exponent | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | beta4_arora           | Alpha<br>coefficient<br>exponent                   | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | Tref_arora            | Reference<br>temperature                           | 1x1  | K                |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                           | PROPERTY GROUP<br>(API NAME)     | PROPERTY GROUP<br>(DESCRIPTION)       | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT             |
|------------------------------------|----------------------------------|---------------------------------------|--------------------|------------------------------------------------|------|------------------|
| Semiconductors/<br>Mobility models | FletcherMobilityModel            | Fletcher<br>mobility model            | F1_fl              | Fletcher<br>mobility<br>coefficient 1          | 1x1  | 1/<br>(V·m·s)    |
| Semiconductors/<br>Mobility models | FletcherMobilityModel            | Fletcher<br>mobility model            | F2_fl              | Fletcher<br>mobility<br>coefficient 2          | 1x1  | 1/m2             |
| Semiconductors/<br>Mobility models | FletcherMobilityModel            | Fletcher<br>mobility model            | Tref_fl            | Reference<br>temperature                       | 1x1  | K                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | alphan0_ct         | Electron alpha<br>coefficient                  | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | alphap0_ct         | Hole alpha<br>coefficient                      | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | vn0_ct             | Electron<br>saturation<br>velocity             | 1x1  | m/s              |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | vp0_ct             | Hole<br>saturation<br>velocity                 | 1x1  | m/s              |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | betan1_ct          | Electron alpha<br>exponent                     | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | betap1_ct          | Hole alpha<br>exponent                         | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | betan2_ct          | Electron<br>velocity<br>saturation<br>exponent | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | betap2_ct          | Hole velocity<br>saturation<br>exponent        | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | Tref_ct            | Reference<br>temperature                       | 1x1  | K                |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | deltan_ls          | Electron delta<br>coefficient                  | 1x1  | V/s              |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | deltap_ls          | Hole delta<br>coefficient                      | 1x1  | V/s              |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | mun1_ls            | Electron<br>mobility<br>reference 1            | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | mup1_ls            | Hole mobility<br>reference 1                   | 1x1  | m2<br>/<br>(V·s) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                           | PROPERTY GROUP<br>(API NAME)     | PROPERTY GROUP<br>(DESCRIPTION)       | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                             | SIZE | UNIT             |
|------------------------------------|----------------------------------|---------------------------------------|--------------------|-----------------------------------------------------------------------|------|------------------|
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | mun2_ls            | Electron<br>mobility<br>reference 2                                   | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | mup2_ls            | Hole mobility<br>reference 2                                          | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | alphan_ls          | Electron alpha<br>coefficient                                         | 1x1  | 1                |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | alphap_ls          | Hole alpha<br>coefficient                                             | 1x1  | 1                |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | Tref_ls            | Reference<br>temperature                                              | 1x1  | K                |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | Eref_ls            | Electric field<br>reference                                           | 1x1  | V/m              |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | Nref_ls            | Doping<br>concentration<br>reference                                  | 1x1  | 1/m3             |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | T_ref_kl           | Reference<br>temperature                                              | 1x1  | K                |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | mu_e_max_<br>kl    | Klaassen max<br>electron<br>mobility                                  | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | mu_h_max_<br>kl    | Klaassen max<br>hole mobility                                         | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | mu_e_min_<br>kl    | Klaassen min<br>electron<br>mobility                                  | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | mu_h_min_<br>kl    | Klaassen min<br>hole mobility                                         | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | theta_e_kl         | Klaassen lattice<br>mobility<br>electron<br>exponent                  | 1x1  | 1                |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | theta_h_kl         | Klaassen lattice<br>mobility hole<br>exponent                         | 1x1  | 1                |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | alpha_e_1_k<br>l   | Klaassen<br>dopant and<br>carrier<br>mobility<br>electron<br>exponent | 1x1  | 1                |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                           | PROPERTY GROUP<br>(API NAME)     | PROPERTY GROUP<br>(DESCRIPTION)    | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                           | SIZE | UNIT |
|------------------------------------|----------------------------------|------------------------------------|--------------------|---------------------------------------------------------------------|------|------|
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | alpha_h_1_<br>kl   | Klaassen<br>dopant and<br>carrier<br>mobility hole<br>exponent      | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_ref_e_1_<br>kl   | Klaassen<br>electron<br>reference<br>density                        | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_ref_h_1_<br>kl   | Klaassen hole<br>reference<br>density                               | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | c_D_kl             | Klaassen<br>cluster<br>function donor<br>coefficient                | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | c_A_kl             | Klaassen<br>cluster<br>function<br>acceptor<br>coefficient          | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_ref_D_kl         | Klaassen<br>cluster<br>function donor<br>reference<br>density       | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_ref_A_kl         | Klaassen<br>cluster<br>function<br>acceptor<br>reference<br>density | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | f_BH_kl            | Klaassen P<br>parameter BH<br>weight                                | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | f_CW_kl            | Klaassen P<br>parameter<br>CW weight                                | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_BH_kl            | Klaassen P<br>parameter BH<br>prefactor                             | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | P_CW_kl            | Klaassen P<br>parameter<br>CW prefactor                             | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | s_1_kl             | Klaassen 1st s<br>parameter                                         | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | s_2_kl             | Klaassen 2nd s<br>parameter                                         | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | s_3_kl             | Klaassen 3rd s<br>parameter                                         | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME)     | PROPERTY GROUP<br>(DESCRIPTION)           | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT |
|------------------------------------------------|----------------------------------|-------------------------------------------|--------------------|------------------------------------------------|------|------|
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | s_4_kl             | Klaassen 4th s<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | s_5_kl             | Klaassen 5th s<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | s_6_kl             | Klaassen 6th s<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | s_7_kl             | Klaassen 7th s<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_1_kl             | Klaassen 1st r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_2_kl             | Klaassen 2nd r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_3_kl             | Klaassen 3rd r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_4_kl             | Klaassen 4th r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_5_kl             | Klaassen 5th r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_6_kl             | Klaassen 6th r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | m_e_kl             | Klaassen<br>electron<br>mobility mass          | 1x1  | kg   |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | m_h_kl             | Klaassen hole<br>mobility mass                 | 1x1  | kg   |
| Equilibrium<br>discharge                       | RadiationHeatTransfer            | Radiation heat<br>transfer                | Qrad               | Total<br>volumetric<br>emission<br>coefficient | 1x1  | W/m3 |
| Solid mechanics/<br>Linear elastic<br>material | Enu                              | Young's<br>modulus and<br>Poisson's ratio | E                  | Young's<br>modulus                             | 1x1  | Pa   |
| Solid mechanics/<br>Linear elastic<br>material | Enu                              | Young's<br>modulus and<br>Poisson's ratio | nu                 | Poisson's ratio                                | 1x1  | 1    |
| Solid mechanics/<br>Linear elastic<br>material | Lame                             | Lamé<br>parameters                        | lambLame           | Lamé<br>parameter λ                            | 1x1  | N/m2 |
| Solid mechanics/<br>Linear elastic<br>material | Lame                             | Lamé<br>parameters                        | muLame             | Lamé<br>parameter μ                            | 1x1  | N/m2 |
| Solid mechanics/<br>Linear elastic<br>material | KG                               | Bulk modulus<br>and shear<br>modulus      | K                  | Bulk modulus                                   | 1x1  | N/m2 |
| Solid mechanics/<br>Linear elastic<br>material | KG                               | Bulk modulus<br>and shear<br>modulus      | G                  | Shear modulus                                  | 1x1  | N/m2 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)         | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                       | SIZE | UNIT           |
|------------------------------------------------|------------------------------|-----------------------------------------|--------------------|-------------------------------------------------|------|----------------|
| Solid mechanics/<br>Linear elastic<br>material | EG                           | Young's<br>modulus and<br>shear modulus | E                  | Young's<br>modulus                              | 1x1  | Pa             |
| Solid mechanics/<br>Linear elastic<br>material | EG                           | Young's<br>modulus and<br>shear modulus | G                  | Shear modulus                                   | 1x1  | N/m2           |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | DA                 | Extensional<br>stiffness matrix                 | 3x3  | N/m            |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | DB                 | Bending<br>extensional<br>stiffness matrix      | 3x3  | N              |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | DD                 | Bending<br>stiffness matrix                     | 3x3  | N·m            |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | DAs                | Shear stiffness<br>matrix                       | 2x2  | N/m            |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | I0                 | Translational<br>inertia                        | 1x1  | kg/m2          |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | I1                 | Rotational<br>translational<br>inertia matrix   | 3x3  | kg/m           |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | I2                 | Rotational<br>inertia matrix                    | 3x3  | kg             |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | eta_DA             | Loss factor for<br>stiffness matrix<br>DA       | 3x3  | 1              |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | eta_DB             | Loss factor for<br>stiffness matrix<br>DB       | 3x3  | 1              |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | eta_DD             | Loss factor for<br>stiffness matrix<br>DD       | 3x3  | 1              |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | eta_DAs            | Loss factor for<br>stiffness matrix<br>DAs      | 2x2  | 1              |
| Solid mechanics/<br>Linear elastic<br>material | Dabd                         | Effective<br>flexibility<br>matrices    | Da                 | Extensional<br>flexibility<br>matrix            | 3x3  | s2/kg          |
| Solid mechanics/<br>Linear elastic<br>material | Dabd                         | Effective<br>flexibility<br>matrices    | Db                 | Bending<br>extensional<br>flexibility<br>matrix | 3x3  | s2/<br>(kg·m)  |
| Solid mechanics/<br>Linear elastic<br>material | Dabd                         | Effective<br>flexibility<br>matrices    | Dd                 | Bending<br>flexibility<br>matrix                | 3x3  | s2/<br>(kg·m2) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)           | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                          | SIZE | UNIT  |
|------------------------------------------------|------------------------------|-------------------------------------------|--------------------|--------------------------------------------------------------------|------|-------|
| Solid mechanics/<br>Linear elastic<br>material | Dabd                         | Effective<br>flexibility<br>matrices      | Das                | Shear flexibility<br>matrix                                        | 2x2  | s2/kg |
| Solid mechanics/<br>Linear elastic<br>material | CpCs                         | Pressure-wave<br>and shear-wave<br>speeds | cp                 | Pressure-wave<br>speed                                             | 1x1  | m/s   |
| Solid mechanics/<br>Linear elastic<br>material | CpCs                         | Pressure-wave<br>and shear-wave<br>speeds | cs                 | Shear-wave<br>speed                                                | 1x1  | m/s   |
| Solid mechanics/<br>Linear elastic<br>material | Cubic                        | Cubic                                     | c11                | Elasticity<br>constant c11                                         | 1x1  | Pa    |
| Solid mechanics/<br>Linear elastic<br>material | Cubic                        | Cubic                                     | c12                | Elasticity<br>constant c12                                         | 1x1  | Pa    |
| Solid mechanics/<br>Linear elastic<br>material | Cubic                        | Cubic                                     | c44                | Elasticity<br>constant c44                                         | 1x1  | Pa    |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | Evector            | Young's<br>modulus                                                 | 3x1  | Pa    |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | nuvector           | Poisson's ratio                                                    | 3x1  | 1     |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | Gvector            | Shear modulus                                                      | 3x1  | N/m2  |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | eta_Evector        | Loss factor for<br>orthotropic<br>Young's<br>modulus               | 3x1  | 1     |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | eta_Gvecto<br>r    | Loss factor for<br>orthotropic<br>shear modulus                    | 3x1  | 1     |
| Solid mechanics/<br>Linear elastic<br>material | OrthotropicVoGrp             | Orthotropic,<br>Voigt notation            | GvectorVo          | Shear modulus,<br>Voigt notation                                   | 3x1  | N/m2  |
| Solid mechanics/<br>Linear elastic<br>material | OrthotropicVoGrp             | Orthotropic,<br>Voigt notation            | eta_Gvecto<br>rVo  | Loss factor for<br>orthotropic<br>shear modulus,<br>Voigt notation | 3x1  | 1     |
| Solid mechanics/<br>Elastoplastic<br>Material  | ElastoplasticModel           | Elastoplastic<br>material model           | sigmags            | Initial yield<br>stress                                            | 1x1  | Pa    |
| Solid mechanics/<br>Elastoplastic<br>Material  | ElastoplasticModel           | Elastoplastic<br>material model           | Et                 | Isotropic<br>tangent<br>modulus                                    | 1x1  | Pa    |
| Solid mechanics/<br>Elastoplastic<br>Material  | ElastoplasticModel           | Elastoplastic<br>material model           | Ek                 | Kinematic<br>tangent<br>modulus                                    | 1x1  | Pa    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                      | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP (DESCRIPTION)    | PROPERTY<br>(NAME)   | PROPERTY (DESCRIPTION)                         | SIZE | UNIT                                            |
|-----------------------------------------------|------------------------------|---------------------------------|----------------------|------------------------------------------------|------|-------------------------------------------------|
| Solid mechanics/<br>Elastoplastic<br>Material | ElastoplasticModel           | Elastoplastic<br>material model | sigmagh              | Hardening function                             | lxl  | Pa                                              |
| Solid mechanics/<br>Elastoplastic<br>Material | ElastoplasticModel           | Elastoplastic<br>material model | Hillcoefficie<br>nts | Hill's coefficients                            | 6x1  | m <sup>2</sup> ·s <sup>4</sup> /kg <sup>2</sup> |
| Solid mechanics/<br>Elastoplastic<br>Material | ElastoplasticModel           | Elastoplastic<br>material model | ys                   | Initial tensile<br>and shear yield<br>stresses | 6xI  | N/m <sup>2</sup>                                |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | sigmags              | Initial yield<br>stress                        | lxl  | Pa                                              |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | sigmah               | Hardening function                             | lxl  | Pa                                              |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | alphaShima           | Shima-Oyane<br>alpha<br>parameter              | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | gammaShim<br>a       | Shima-Oyane<br>gamma<br>parameter              | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | mShima               | Shima-Oyane<br>m parameter                     | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic material model      | nH                   | Hardening exponent                             | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic material model      | Et                   | Isotropic<br>tangent<br>modulus                | lxl  | Pa                                              |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | k_lud                | Strength coefficient                           | lxl  | Pa                                              |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | fO                   | Initial void<br>volume<br>fraction             | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic material model      | qIGTN                | Tvergaard correction coefficient q l           | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | q2GTN                | Tvergaard correction coefficient q2            | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic material model      | q3GTN                | Tvergaard correction coefficient q3            | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | fc                   | Critical void volume fraction                  | lxl  | I                                               |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                         | SIZE | UNIT |
|----------------------------------------------|------------------------------|---------------------------------|--------------------|---------------------------------------------------|------|------|
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | ff                 | Failure void<br>volume<br>fraction                | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | fmax               | Maximum void<br>volume<br>fraction                | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | fn                 | Void volume<br>fraction of<br>nucleating<br>voids | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | snn                | Standard<br>deviation for<br>void nucleation      | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | enn                | Mean strain for<br>void nucleation                | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | kw                 | Void growth<br>rate parameter                     | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | cohesion           | Cohesion                                          | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | internalphi        | Angle of<br>internal<br>friction                  | 1x1  | rad  |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | psid               | Dilatation<br>angle                               | 1x1  | rad  |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | Kiso               | Isotropic<br>hardening<br>modulus                 | 1x1  | N/m2 |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | epvolmax           | Maximum<br>plastic<br>volumetric<br>strain        | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | Rcap               | Ellipse aspect<br>ratio                           | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | DruckerPrager                | Drucker-Prager                  | alphaDruck<br>er   | Drucker<br>Prager alpha<br>coefficient            | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | DruckerPrager                | Drucker-Prager                  | kDrucker           | Drucker<br>Prager k<br>coefficient                | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | MatsuokaNakai                | Matsuoka-Nakai                  | muMatsuok<br>a     | Matsuoka<br>Nakai mu<br>coefficient               | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | LadeDuncan                   | Lade-Duncan                     | kLade              | Lade-Duncan k<br>coefficient                      | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)              | SIZE | UNIT |
|----------------------------------------------|------------------------------|---------------------------------|--------------------|----------------------------------------|------|------|
| Solid mechanics/<br>Geomechanics<br>material | Ottosen                      | Ottosen                         | aOttosen           | Ottosen a<br>parameter                 | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | Ottosen                      | Ottosen                         | bOttosen           | Ottosen b<br>parameter                 | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | Ottosen                      | Ottosen                         | k1Ottosen          | Size factor                            | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | Ottosen                      | Ottosen                         | k2Ottosen          | Shape factor                           | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | mHB                | Hoek-Brown<br>m parameter              | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | sHB                | Hoek-Brown s<br>parameter              | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | GSI                | Geological<br>strength index           | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | Dfactor            | Disturbance<br>factor                  | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | miHB               | Intact rock<br>parameter               | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | YieldStressParameters        | Yield stress<br>parameters      | sigmaut            | Tensile<br>strength                    | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | YieldStressParameters        | Yield stress<br>parameters      | sigmauc            | Compressive<br>strength                | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | YieldStressParameters        | Yield stress<br>parameters      | sigmabc            | Biaxial<br>compressive<br>strength     | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | CamClayModel                 | Cam-Clay                        | kappaSwelli<br>ng  | Swelling index                         | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | CamClayModel                 | Cam-Clay                        | lambdaCom<br>p     | Compression<br>index                   | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | CamClayModel                 | Cam-Clay                        | evoidref           | Void ratio at<br>reference<br>pressure | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | CamClayModel                 | Cam-Clay                        | evoid0             | Initial void<br>ratio                  | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME)   | PROPERTY GROUP<br>(DESCRIPTION)                          | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                         | SIZE | UNIT                                            |
|------------------------------------------------|--------------------------------|----------------------------------------------------------|--------------------|-------------------------------------------------------------------|------|-------------------------------------------------|
| Solid mechanics/<br>Geomechanics<br>material   | CamClayModel                   | Cam-Clay                                                 | M                  | Slope of critical state line                                      | lxl  | I                                               |
| Solid mechanics/<br>Linear elastic<br>material | Anisotropic                    | Anisotropic                                              | D                  | Elasticity<br>matrix                                              | 6×6  | Pa                                              |
| Solid mechanics/<br>Linear elastic<br>material | Anisotropic                    | Anisotropic                                              | eta_D              | Loss factor for elasticity matrix D                               | 6x6  | I                                               |
| Solid mechanics/<br>Strength limits            | AnisotropicStrengthPara meters | Anisotropic strength parameters, Voigt notation          | F_f                | Fourth rank<br>tensor, Voigt<br>notation                          | 6×6  | m <sup>2</sup> ·s <sup>4</sup> /kg <sup>2</sup> |
| Solid mechanics/<br>Strength limits            | AnisotropicStrengthPara meters | Anisotropic strength parameters, Voigt notation          | F_s                | Second rank<br>tensor, Voigt<br>notation                          | 6x1  | I/Pa                                            |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | sigmats            | Tensile<br>strengths                                              | 3×1  | Pa                                              |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | sigmacs            | Compressive strengths                                             | 3×1  | Pa                                              |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | sigmass            | Shear<br>strengths                                                | 3×I  | Pa                                              |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | sigma I D          | Linear<br>degradation<br>stress                                   | lxl  | N/m <sup>2</sup>                                |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | epsilontl          | Ultimate<br>tensile strain in<br>longitudinal<br>direction        | lxl  | I                                               |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic<br>strength<br>parameters,<br>Voigt notation | epsilonc l         | Ultimate<br>compressive<br>strain in<br>longitudinal<br>direction | lxl  | I                                               |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic<br>strength<br>parameters,<br>Voigt notation | EfI                | Young's<br>modulus of<br>fiber in<br>longitudinal<br>direction    | lxl  | Pa                                              |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | nufl2              | In-plane<br>Poisson's ratio<br>of fiber                           | lxl  | I                                               |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME)      | PROPERTY GROUP<br>(DESCRIPTION)                          | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                    | SIZE | UNIT |
|------------------------------------------------|-----------------------------------|----------------------------------------------------------|--------------------|--------------------------------------------------------------|------|------|
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar<br>ameters | Orthotropic<br>strength<br>parameters,<br>Voigt notation | sigmati22          | In situ<br>transverse<br>tensile<br>strength                 | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar<br>ameters | Orthotropic<br>strength<br>parameters,<br>Voigt notation | sigmasi12          | In situ in-plane<br>shear strength                           | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | IsotropicStrengthParame<br>ters   | Isotropic<br>strength<br>parameters                      | sigmat             | Tensile<br>strength                                          | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | IsotropicStrengthParame<br>ters   | Isotropic<br>strength<br>parameters                      | sigmac             | Compressive<br>strength                                      | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | IsotropicStrengthParame<br>ters   | Isotropic<br>strength<br>parameters                      | sigmabc            | Biaxial<br>compressive<br>strength                           | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | OrthotropicStrainParam<br>eters   | Orthotropic<br>ultimate strains,<br>Voigt notation       | epsilonts          | Ultimate<br>tensile strains                                  | 3x1  | 1    |
| Solid mechanics/<br>Strength limits            | OrthotropicStrainParam<br>eters   | Orthotropic<br>ultimate strains,<br>Voigt notation       | epsiloncs          | Ultimate<br>compressive<br>strains                           | 3x1  | 1    |
| Solid mechanics/<br>Strength limits            | OrthotropicStrainParam<br>eters   | Orthotropic<br>ultimate strains,<br>Voigt notation       | gammass            | Ultimate shear<br>strains                                    | 3x1  | 1    |
| Solid mechanics/<br>Strength limits            | IsotropicStrainParamete<br>rs     | Isotropic<br>ultimate strains                            | epsilont           | Ultimate<br>tensile strain                                   | 1x1  | 1    |
| Solid mechanics/<br>Strength limits            | IsotropicStrainParamete<br>rs     | Isotropic<br>ultimate strains                            | epsilonc           | Ultimate<br>compressive<br>strain                            | 1x1  | 1    |
| Solid mechanics/<br>Linear elastic<br>material | AnisotropicVoGrp                  | Anisotropic,<br>Voigt notation                           | DVo                | Elasticity<br>matrix, Voigt<br>notation                      | 6x6  | Pa   |
| Solid mechanics/<br>Linear elastic<br>material | AnisotropicVoGrp                  | Anisotropic,<br>Voigt notation                           | eta_DVo            | Loss factor for<br>elasticity<br>matrix D, Voigt<br>notation | 6x6  | 1    |
| Solid mechanics                                | ViscoelasticModel                 | Linear<br>viscoelastic<br>material                       | Gv                 | Shear modulus                                                | 1x1  | N/m2 |
| Solid mechanics                                | ViscoelasticModel                 | Linear<br>viscoelastic<br>material                       | K                  | Bulk modulus                                                 | 1x1  | N/m2 |
| Piezoelectric<br>models                        | StressCharge                      | Stress-charge<br>form                                    | cE                 | Elasticity<br>matrix, Voigt<br>notation                      | 6x6  | Pa   |
| Piezoelectric<br>models                        | StressCharge                      | Stress-charge<br>form                                    | eES                | Coupling<br>matrix, Voigt<br>notation                        | 3x6  | C/m2 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT |
|----------------------------------------------|------------------------------|---------------------------------|--------------------|------------------------------------------------|------|------|
| Piezoelectric<br>models                      | StressCharge                 | Stress-charge<br>form           | epsilonrS          | Relative<br>permittivity                       | 3x3  | 1    |
| Piezoelectric<br>models                      | StressCharge                 | Stress-charge<br>form           | eta_cE             | Loss factor for<br>elasticity<br>matrix cE     | 6x6  | 1    |
| Piezoelectric<br>models                      | StressCharge                 | Stress-charge<br>form           | eta_eES            | Loss factor for<br>coupling<br>matrix eES      | 3x6  | 1    |
| Piezoelectric<br>models                      | StressCharge                 | Stress-charge<br>form           | eta_epsilon<br>S   | Loss factor for<br>electric<br>permittivity ?S | 3x3  | 1    |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | sE                 | Compliance<br>matrix, Voigt<br>notation        | 6x6  | 1/Pa |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | dET                | Coupling<br>matrix, Voigt<br>notation          | 3x6  | C/N  |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | epsilonrT          | Relative<br>permittivity                       | 3x3  | 1    |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | eta_sE             | Loss factor for<br>compliance<br>matrix sE     | 6x6  | 1    |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | eta_dET            | Loss factor for<br>coupling<br>matrix dET      | 3x6  | 1    |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | eta_epsilon<br>T   | Loss factor for<br>electric<br>permittivity ?T | 3x3  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material | Gent                         | Gent                            | muG                | Macroscopic<br>shear modulus                   | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Gent                         | Gent                            | jmG                | Model<br>parameter                             | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C10                | Model<br>parameters                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C01                | Model<br>parameters                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C11                | Model<br>parameters                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C20                | Model<br>parameters                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C02                | Model<br>parameters                            | 1x1  | Pa   |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                  | SIZE | UNIT |
|----------------------------------------------|------------------------------|---------------------------------|--------------------|--------------------------------------------|------|------|
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C21                | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C12                | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C30                | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C03                | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Murnaghan                    | Murnaghan                       | l                  | Murnaghan<br>third-order<br>elastic moduli | 1x1  | N/m2 |
| Solid mechanics/<br>Hyperelastic<br>material | Murnaghan                    | Murnaghan                       | m                  | Murnaghan<br>third-order<br>elastic moduli | 1x1  | N/m2 |
| Solid mechanics/<br>Hyperelastic<br>material | Murnaghan                    | Murnaghan                       | n                  | Murnaghan<br>third-order<br>elastic moduli | 1x1  | N/m2 |
| Solid mechanics/<br>Hyperelastic<br>material | ArrudaBoyce                  | Arruda-Boyce                    | Nseg               | Number of<br>segments                      | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material | ArrudaBoyce                  | Arruda-Boyce                    | mu0                | Macroscopic<br>shear modulus               | 1x1  | N/m2 |
| Solid mechanics/<br>Hyperelastic<br>material | Varga                        | Varga                           | c1VA               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Varga                        | Varga                           | c2VA               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Yeoh                         | Yeoh                            | c1YE               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Yeoh                         | Yeoh                            | c2YE               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Yeoh                         | Yeoh                            | c3YE               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | BlatzKo                      | Blatz-Ko                        | phiBK              | Model<br>parameters                        | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material | BlatzKo                      | Blatz-Ko                        | betaBK             | Model<br>parameters                        | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                | SIZE | UNIT |
|------------------------------------------------------------|------------------------------|---------------------------------|--------------------|----------------------------------------------------------|------|------|
| Solid mechanics/<br>Hyperelastic<br>material               | BlatzKo                      | Blatz-Ko                        | muBK               | Shear modulus                                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material               | Gao                          | Gao                             | aG                 | Model<br>parameters                                      | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material               | Gao                          | Gao                             | nG                 | Model<br>parameters                                      | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | E50Ref             | Reference<br>stiffness for<br>primary<br>loading         | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | EurRef             | Reference<br>stiffness for<br>unloading and<br>reloading | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | evoid0             | Initial void<br>ratio                                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | mH                 | Stress<br>exponent                                       | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | Kc                 | Bulk modulus<br>in compression                           | 1x1  | N/m2 |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | evoidm             | Maximum void<br>ratio                                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | Rcap               | Ellipse aspect<br>ratio                                  | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | K0nc               | Coefficient of<br>earth pressure<br>at rest              | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | rsc                | Swelling to<br>compression<br>ratio                      | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | kappaSwelli<br>ng  | Swelling index                                           | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                | SIZE | UNIT |
|------------------------------------------------------------|------------------------------|---------------------------------|--------------------|----------------------------------------------------------|------|------|
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | kappaSwelli<br>ngs | Swelling index<br>for changes in<br>suction              | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | lambdaCom<br>p0    | Compression<br>index at<br>saturation                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | lambdaCom<br>pss   | Compression<br>index for<br>changes in<br>suction        | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | evoidref0          | Void ratio at<br>reference<br>pressure and<br>saturation | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | evoid0             | Initial void<br>ratio                                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | M                  | Slope of<br>critical state<br>line                       | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | wB                 | Weight<br>parameter                                      | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | mB                 | Soil stiffness<br>parameter                              | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | bB                 | Plastic<br>potential<br>smoothing<br>parameter           | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | sy0                | Initial yield<br>value for<br>suction                    | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | kB                 | Tension to<br>suction ratio                              | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay          | kappaSwelli<br>ngS | Swelling index<br>for structured<br>clay                 | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)   | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                          | SIZE | UNIT |
|------------------------------------------------------------|------------------------------|-----------------------------------|--------------------|--------------------------------------------------------------------|------|------|
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | lambdaCom<br>pS    | Compression<br>index for<br>destructured<br>clay                   | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | evoidrefS          | Void ratio at<br>reference<br>pressure for<br>destructured<br>clay | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | evoid0             | Initial void<br>ratio                                              | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | M                  | Slope of<br>critical state<br>line                                 | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | dvS                | Destructuring<br>index for<br>volumetric<br>deformation            | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | dsS                | Destructuring<br>index for shear<br>deformation                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | Deltaei            | Additional void<br>ratio at initial<br>yielding                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | pbi                | Initial structure<br>strength                                      | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | zetaS              | Plastic<br>potential shape<br>parameter                            | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | epdevc             | Critical<br>equivalent<br>deviatoric<br>plastic strain             | 1x1  | 1    |
| Solid mechanics                                            | GeneralStressStrain          | General stress<br>strain relation | S                  | Second Piola<br>Kirchhoff<br>stress                                | 3x3  | N/m2 |
| Solid mechanics                                            | PoroelasticModel             | Poroelastic<br>material           | alphaB             | Biot-Willis<br>coefficient                                         | 1x1  | 1    |
| Solid mechanics                                            | ThermalExpansion             | Thermal<br>expansion              | alphatan           | Tangent<br>coefficient of<br>thermal<br>expansion                  | 3x3  | 1/K  |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                 | SIZE | UNIT      |
|----------------------------|------------------------------|---------------------------------|--------------------|-----------------------------------------------------------|------|-----------|
| Solid mechanics            | ThermalExpansion             | Thermal<br>expansion            | dL                 | Thermal strain                                            | 3x3  | 1         |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | Psat               | Saturation<br>polarization                                | 1x1  | C/m2      |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | chie0              | Initial electric<br>susceptibility                        | 3x3  | 1         |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | lambdase           | Saturation<br>electrostrictio<br>n                        | 1x1  | 1         |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | kJAe               | Pinning loss                                              | 3x3  | V/m       |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | cJAe               | Polarization<br>reversibility                             | 3x3  | 1         |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | alphaJAe           | Interdomain<br>coupling                                   | 3x3  | m/F       |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | aJAe               | Domain wall<br>density                                    | 3x3  | V/m       |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | Qe                 | Electrostrictive<br>coupling<br>matrix                    | 6x6  | m4<br>/C2 |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | QVe                | Electrostrictive<br>coupling<br>matrix, Voigt<br>notation | 6x6  | m4/C2     |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | Ms                 | Saturation<br>magnetization                               | 1x1  | A/m       |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | chi0               | Initial magnetic<br>susceptibility                        | 3x3  | 1         |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | lambdas            | Saturation<br>magnetostricti<br>on                        | 1x1  | 1         |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | lambda100          | Magnetostricti<br>on constants                            | 1x1  | 1         |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | lambda111          | Magnetostricti<br>on constants                            | 1x1  | 1         |
| Magnetostrictive<br>models | StressMagnetization          | Stress<br>magnetization<br>form | cH                 | Elasticity<br>matrix, Voigt<br>notation                   | 6x6  | Pa        |
| Magnetostrictive<br>models | StressMagnetization          | Stress<br>magnetization<br>form | eta_cH             | Loss factor for<br>elasticity<br>matrix cH                | 6x6  | 1         |
| Magnetostrictive<br>models | StressMagnetization          | Stress<br>magnetization<br>form | eHS                | Piezomagnetic<br>coupling<br>matrix, Voigt<br>notation    | 3x6  | T         |
| Magnetostrictive<br>models | StressMagnetization          | Stress<br>magnetization<br>form | murS               | Relative<br>permeability                                  | 3x3  | 1         |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                              | SIZE | UNIT    |
|----------------------------|------------------------------|---------------------------------|--------------------|--------------------------------------------------------|------|---------|
| Magnetostrictive<br>models | StrainMagnetization          | Strain<br>magnetization<br>form | sH                 | Compliance<br>matrix, Voigt<br>notation                | 6x6  | 1/Pa    |
| Magnetostrictive<br>models | StrainMagnetization          | Strain<br>magnetization<br>form | eta_sH             | Loss factor for<br>compliance<br>matrix sH             | 6x6  | 1       |
| Magnetostrictive<br>models | StrainMagnetization          | Strain<br>magnetization<br>form | dHT                | Piezomagnetic<br>coupling<br>matrix, Voigt<br>notation | 3x6  | m/A     |
| Magnetostrictive<br>models | StrainMagnetization          | Strain<br>magnetization<br>form | murT               | Relative<br>permeability                               | 3x3  | 1       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | K_eff              | Effective bulk<br>modulus                              | 1x1  | Pa      |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | Rf                 | Flow resistivity                                       | 1x1  | Pa·s/m2 |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | Lth                | Thermal<br>characteristic<br>length                    | 1x1  | m       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | Lv                 | Viscous<br>characteristic<br>length                    | 1x1  | m       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | tau                | Tortuosity<br>factor                                   | 1x1  | 1       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | tau0               | Static viscous<br>tortuosity                           | 1x1  | 1       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | taup0_th           | Static thermal<br>tortuosity                           | 1x1  | 1       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | kp0_th             | Static thermal<br>permeability                         | 1x1  | m2      |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | Hr                 | Hydraulic<br>radius of pores                           | 1x1  | m       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | K_inf              | Bulk modulus<br>infinite<br>frequency limit            | 1x1  | Pa      |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | rho_inf            | Density infinite<br>frequency limit                    | 1x1  | kg/m3   |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | tau_ent            | Entropy-mode<br>relaxation time                        | 1x1  | s       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | tau_vor            | Vorticity-mode<br>relaxation time                      | 1x1  | s       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | K_f                | Fluid bulk<br>modulus                                  | 1x1  | Pa      |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | K_gr               | Grain bulk<br>modulus                                  | 1x1  | Pa      |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                        | PROPERTY GROUP<br>(API NAME)              | PROPERTY GROUP<br>(DESCRIPTION)           | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                             | SIZE | UNIT     |
|---------------------------------|-------------------------------------------|-------------------------------------------|--------------------|-------------------------------------------------------|------|----------|
| Acoustics                       | PoroacousticsModel                        | Poroacoustics<br>model                    | Ks                 | Bulk modulus<br>of skeleton<br>material               | 1x1  | Pa       |
| Acoustics                       | PoroacousticsModel                        | Poroacoustics<br>model                    | s_m                | Median pore<br>size                                   | 1x1  | m        |
| Acoustics                       | PoroacousticsModel                        | Poroacoustics<br>model                    | sigma_s            | Standard<br>deviation in<br>pore size<br>distribution | 1x1  | 1        |
| Acoustics                       | NonlinearModel                            | Nonlinear<br>model                        | BA                 | Parameter of<br>nonlinearity                          | 1x1  | 1        |
| Acoustics                       | AttenuationDissipationM<br>odel           | Attenuation and<br>dissipation<br>model   | delta_diff         | Sound<br>diffusivity                                  | 1x1  | m2<br>/s |
| Acoustics                       | AnisotropicAcousticsMo<br>del             | Anisotropic<br>acoustics model            | rho_eff            | Effective<br>density                                  | 3x3  | kg/m3    |
| Acoustics                       | AnisotropicAcousticsMo<br>del             | Anisotropic<br>acoustics model            | K_eff              | Effective bulk<br>modulus                             | 1x1  | Pa       |
| External material<br>parameters | comcomsolgeneralStress<br>Strain          | General stress<br>strain relation         | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolgeneralStress<br>Strain          | General stress<br>strain relation         | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolgeneralStress<br>Deformation     | General stress<br>deformation<br>relation | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolgeneralStress<br>Deformation     | General stress<br>deformation<br>relation | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolinelasticResid<br>ualStrain      | Inelastic<br>residual strain              | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolinelasticResid<br>ualStrain      | Inelastic<br>residual strain              | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolinelasticResid<br>ualDeformation | Inelastic<br>residual<br>deformation      | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolinelasticResid<br>ualDeformation | Inelastic<br>residual<br>deformation      | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolgeneralHBRe<br>lation            | General H(B)<br>relation                  | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolgeneralHBRe<br>lation            | General H(B)<br>relation                  | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolgeneralBHRe<br>lation            | General B(H)<br>relation                  | par                | Material model<br>parameters                          | 1x1  |          |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                           | PROPERTY GROUP<br>(API NAME)                   | PROPERTY GROUP<br>(DESCRIPTION)              | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                         | SIZE | UNIT  |
|----------------------------------------------------|------------------------------------------------|----------------------------------------------|--------------------|---------------------------------------------------|------|-------|
| External material<br>parameters                    | comcomsolgeneralBHRe<br>lation                 | General B(H)<br>relation                     | args               | Extra library<br>function string<br>arguments     | 1x1  |       |
| External material<br>parameters                    | comcomsolpolyumodlag<br>rangian                | Lagrangian<br>interface to<br>PolyUMod       | par                | Material model<br>parameters                      | 1x1  |       |
| External material<br>parameters                    | comcomsolpolyumodlag<br>rangian                | Lagrangian<br>interface to<br>PolyUMod       | args               | Extra library<br>function string<br>arguments     | 1x1  |       |
| External material<br>parameters                    | comcomsolelasticSolid                          | Elastic stress<br>strain relation            | E                  | Young's<br>modulus                                | 1x1  | Pa    |
| External material<br>parameters                    | comcomsolelasticSolid                          | Elastic stress<br>strain relation            | nu                 | Poisson's ratio                                   | 1x1  | 1     |
| Solid mechanics/<br>Hyperelastic<br>material       | HolzapfelGasserOgden                           | Holzapfel<br>Gasser-Ogden                    | k1HGO              | Fiber stiffness                                   | 1x1  | Pa    |
| Solid mechanics/<br>Hyperelastic<br>material       | HolzapfelGasserOgden                           | Holzapfel<br>Gasser-Ogden                    | k2HGO              | Model<br>parameter                                | 1x1  | 1     |
| Solid mechanics/<br>Hyperelastic<br>material       | HolzapfelGasserOgden                           | Holzapfel<br>Gasser-Ogden                    | k3HGO              | Fiber<br>dispersion                               | 1x1  | 1     |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionAustenite  | Thermal<br>expansion,<br>austenite phase     | alpha_A            | Coefficient of<br>thermal<br>expansion            | 3x3  | 1/K   |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionAustenite  | Thermal<br>expansion,<br>austenite phase     | alphatan_A         | Tangent<br>coefficient of<br>thermal<br>expansion | 3x3  | 1/K   |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionAustenite  | Thermal<br>expansion,<br>austenite phase     | dL_A               | Thermal strain                                    | 3x3  | 1     |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionMartensite | Thermal<br>expansion,<br>martensite<br>phase | alpha_M            | Coefficient of<br>thermal<br>expansion            | 3x3  | 1/K   |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionMartensite | Thermal<br>expansion,<br>martensite<br>phase | alphatan_M         | Tangent<br>coefficient of<br>thermal<br>expansion | 3x3  | 1/K   |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionMartensite | Thermal<br>expansion,<br>martensite<br>phase | dL_M               | Thermal strain                                    | 3x3  | 1     |
| Solid mechanics/<br>Viscoplastic<br>Material       | Anand                                          | Anand<br>viscoplasticity                     | A_ana              | Viscoplastic<br>rate coefficient                  | 1x1  | 1/s   |
| Solid mechanics/<br>Viscoplastic<br>Material       | Anand                                          | Anand<br>viscoplasticity                     | Q_ana              | Activation<br>energy                              | 1x1  | J/mol |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)  | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                              | SIZE | UNIT |
|----------------------------------------------|------------------------------|----------------------------------|--------------------|--------------------------------------------------------|------|------|
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | xi_ana             | Stress<br>multiplier                                   | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | m_ana              | Stress<br>sensitivity                                  | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | ssat_ana           | Deformation<br>resistance<br>saturation<br>coefficient | 1x1  | N/m2 |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | sa_init            | Deformation<br>resistance<br>initial value             | 1x1  | N/m2 |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | h0_ana             | Hardening<br>coefficient                               | 1x1  | N/m2 |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | a_ana              | Hardening<br>sensitivity                               | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | n_ana              | Deformation<br>resistance<br>sensitivity               | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | ChabocheViscoplasticity      | Chaboche<br>viscoplasticity      | A_cha              | Viscoplastic<br>rate coefficient                       | 1x1  | 1/s  |
| Solid mechanics/<br>Viscoplastic<br>Material | ChabocheViscoplasticity      | Chaboche<br>viscoplasticity      | sigRef_cha         | Reference<br>stress                                    | 1x1  | N/m2 |
| Solid mechanics/<br>Viscoplastic<br>Material | ChabocheViscoplasticity      | Chaboche<br>viscoplasticity      | n_cha              | Stress<br>exponent                                     | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | Perzyna                      | Perzyna<br>viscoplasticity       | A_per              | Viscoplastic<br>rate coefficient                       | 1x1  | 1/s  |
| Solid mechanics/<br>Viscoplastic<br>Material | Perzyna                      | Perzyna<br>viscoplasticity       | sigRef_per         | Reference<br>stress                                    | 1x1  | N/m2 |
| Solid mechanics/<br>Creep material           | Norton                       | Norton                           | A_nor              | Creep rate<br>coefficient                              | 1x1  | 1/s  |
| Solid mechanics/<br>Creep material           | Norton                       | Norton                           | sigRef_nor         | Reference<br>stress                                    | 1x1  | N/m2 |
| Solid mechanics/<br>Creep material           | Norton                       | Norton                           | n_nor              | Stress<br>exponent                                     | 1x1  | 1    |
| Solid mechanics/<br>Creep material           | Garofalo                     | Garofalo<br>(hyperbolic<br>sine) | A_gar              | Creep rate<br>coefficient                              | 1x1  | 1/s  |
| Solid mechanics/<br>Creep material           | Garofalo                     | Garofalo<br>(hyperbolic<br>sine) | sigRef_gar         | Reference<br>stress                                    | 1x1  | N/m2 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME)    | PROPERTY GROUP<br>(DESCRIPTION)  | PROPERTY<br>(NAME)   | PROPERTY<br>(DESCRIPTION)        | SIZE | UNIT          |
|----------------------------------------------|---------------------------------|----------------------------------|----------------------|----------------------------------|------|---------------|
| Solid mechanics/<br>Creep material           | Garofalo                        | Garofalo<br>(hyperbolic<br>sine) | n_gar                | Stress<br>exponent               | 1x1  | 1             |
| Solid mechanics/<br>Creep material           | NabarroHerring                  | Nabarro<br>Herring               | D_nav                | Volume<br>diffusivity            | 1x1  | m2<br>/s      |
| Solid mechanics/<br>Creep material           | NabarroHerring                  | Nabarro<br>Herring               | b_nav                | Burgers vector                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | NabarroHerring                  | Nabarro<br>Herring               | dg_nav               | Grain diameter                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | Coble                           | Coble                            | D_cob                | Grain<br>boundary<br>diffusivity | 1x1  | m2<br>/s      |
| Solid mechanics/<br>Creep material           | Coble                           | Coble                            | b_cob                | Burgers vector                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | Coble                           | Coble                            | dg_cob               | Grain diameter                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | Weertman                        | Weertman                         | D_wee                | Diffusivity                      | 1x1  | m2<br>/s      |
| Solid mechanics/<br>Creep material           | Weertman                        | Weertman                         | b_wee                | Burgers vector                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | Weertman                        | Weertman                         | n_wee                | Stress<br>exponent               | 1x1  | 1             |
| Solid mechanics/<br>Creep material           | Weertman                        | Weertman                         | sigRef_wee           | Reference<br>stress              | 1x1  | N/m2          |
| Solid mechanics/<br>Creep material           | Hillcoefficients                | Hill's<br>coefficients           | Hillcoefficie<br>nts | Hill's<br>coefficients           | 6x1  | m2·s4/<br>kg2 |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityFung             | Fung                             | AFung                | Coefficient<br>matrix            | 6x6  | 1             |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityFung             | Fung                             | cFung                | Fung<br>parameter c              | 1x1  | Pa            |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityDelfino          | Delfino                          | aDelf                | Model<br>parameters              | 1x1  | Pa            |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityDelfino          | Delfino                          | bDelf                | Model<br>parameters              | 1x1  | 1             |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityExtended<br>Tube | Extended tube                    | GcET                 | Model<br>parameters              | 1x1  | Pa            |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityExtended<br>Tube | Extended tube                    | GeET                 | Model<br>parameters              | 1x1  | Pa            |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityExtended<br>Tube | Extended tube                    | alphaET              | Model<br>parameters              | 1x1  | 1             |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                | PROPERTY GROUP<br>(API NAME)    | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                   | SIZE | UNIT |
|---------------------------------------------------------|---------------------------------|---------------------------------|--------------------|---------------------------------------------|------|------|
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityExtended<br>Tube | Extended tube                   | betaET             | Model<br>parameters                         | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityVanDer<br>Waals  | van der Waals                   | muW                | Shear modulus                               | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityVanDer<br>Waals  | van der Waals                   | lambdaW            | Maximum<br>chain stretch                    | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityVanDer<br>Waals  | van der Waals                   | alphaW             | Chain network<br>interaction                | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityVanDer<br>Waals  | van der Waals                   | betaW              | Weight                                      | 1x1  | 1    |
| Solid mechanics/<br>Fatigue Behavior                    | fatigueGeneral                  | General                         | sigmae             | Endurance<br>limit                          | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material           | elastoplasticRambergOs<br>good  | Ramberg<br>Osgood               | K_ROcyclic         | Cyclic<br>hardening<br>coefficient          | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material           | elastoplasticRambergOs<br>good  | Ramberg<br>Osgood               | n_ROcyclic         | Cyclic<br>hardening<br>exponent             | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainCoffinManso<br>n   | Coffin-Manson                   | epsilonf_C<br>M    | Fatigue<br>ductility<br>coefficient         | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainCoffinManso<br>n   | Coffin-Manson                   | c_CM               | Fatigue<br>ductility<br>exponent            | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainCoffinManso<br>n   | Coffin-Manson                   | gammaf_C<br>M      | Shear fatigue<br>ductility<br>coefficient   | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainCoffinManso<br>n   | Coffin-Manson                   | cgamma_C<br>M      | Shear fatigue<br>ductility<br>exponent      | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainWangBrown          | Wang-Brown                      | S_WB               | Normal strain<br>sensitivity<br>coefficient | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainFatemiSocie        | Fatemi-Socie                    | k_FS               | Normal stress<br>sensitivity<br>coefficient | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                | PROPERTY GROUP<br>(API NAME)  | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                           | SIZE | UNIT |
|---------------------------------------------------------|-------------------------------|---------------------------------|--------------------|-----------------------------------------------------|------|------|
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressBasquin          | Basquin                         | sigmaf_Basq<br>uin | Fatigue<br>strength<br>coefficient                  | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressBasquin          | Basquin                         | b_Basquin          | Fatigue<br>strength<br>exponent                     | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressBasquin          | Basquin                         | tauf_Basqui<br>n   | Shear fatigue<br>strength<br>coefficient            | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressBasquin          | Basquin                         | bgamma_Ba<br>squin | Shear fatigue<br>strength<br>exponent               | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressFindley          | Findley                         | k_Findley          | Normal stress<br>sensitivity<br>coefficient         | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressFindley          | Findley                         | f_Findley          | Limit factor                                        | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressMatake           | Matake                          | k_Matake           | Normal stress<br>sensitivity<br>coefficient         | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressMatake           | Matake                          | f_Matake           | Limit factor                                        | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressNormalStre<br>ss | Normal stress                   | f_NormalSt<br>ress | Limit factor                                        | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressDangVan          | Dang Van                        | a_DangVan          | Hydrostatic<br>stress<br>sensitivity<br>coefficient | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressDangVan          | Dang Van                        | b_DangVan          | Limit factor                                        | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based | fatigueEnergyMorrow           | Morrow                          | Wf_Morro<br>w      | Fatigue energy<br>coefficient                       | 1x1  | J/m3 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                    | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                     | SIZE | UNIT |
|-------------------------------------------------------------|------------------------------|---------------------------------|--------------------|-----------------------------------------------|------|------|
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyMorrow          | Morrow                          | m_Morrow           | Fatigue energy<br>exponent                    | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | K1_Darvea<br>ux    | Crack<br>initiation<br>energy<br>coefficient  | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | k2_Darveau<br>x    | Crack<br>initiation<br>energy<br>exponent     | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | K3_Darvea<br>ux    | Crack<br>propagation<br>energy<br>coefficient | 1x1  | m    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | k4_Darveau<br>x    | Crack<br>propagation<br>energy<br>exponent    | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | Wref_Darv<br>eaux  | Reference<br>energy density                   | 1x1  | J/m3 |
| Solid mechanics/<br>Fatigue<br>Behavior/Fatigue<br>Behavior | fatigueApproximateSN         | Approximate S<br>N curve        | sigmat             | Transition<br>stress                          | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Fatigue<br>Behavior | fatigueApproximateSN         | Approximate S<br>N curve        | Nt                 | Transition life                               | 1x1  |      |
| Solid mechanics/<br>Fatigue<br>Behavior/Fatigue<br>Behavior | fatigueApproximateSN         | Approximate S<br>N curve        | Ne                 | Endurance life                                | 1x1  |      |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | sigRef             | Reference<br>stress                           | 1x1  | N/m2 |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | eRef               | Reference<br>strain                           | 1x1  | 1    |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | gammaRef           | Reference<br>shear strain                     | 1x1  | 1    |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | n_stress           | Stress<br>exponent                            | 1x1  | 1    |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | n_strain           | Strain<br>exponent                            | 1x1  | 1    |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | Kt                 | Bulk modulus<br>in tension                    | 1x1  | N/m2 |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | Kc                 | Bulk modulus<br>in compression                | 1x1  | N/m2 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                      | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)           | SIZE | UNIT |
|-----------------------------------------------|------------------------------|---------------------------------|--------------------|-------------------------------------|------|------|
| Solid mechanics                               | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | q_ult              | Ultimate<br>deviatoric<br>stress    | 1x1  | N/m2 |
| Solid mechanics                               | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | e_ult              | Ultimate strain                     | 1x1  | 1    |
| Solid mechanics                               | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | sax                | Uniaxial stress<br>function         | 1x1  | N/m2 |
| Solid mechanics                               | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | tau                | Shear stress<br>function            | 1x1  | N/m2 |
| Solid mechanics/<br>Elastoplastic<br>Material | Ludwik                       | Ludwik                          | k_lud              | Strength<br>coefficient             | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | Ludwik                       | Ludwik                          | n_lud              | Hardening<br>exponent               | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | Voce                         | Voce                            | sigma_voc          | Saturation flow<br>stress           | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | Voce                         | Voce                            | beta_voc           | Saturation<br>exponent              | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | Swift                        | Swift                           | e0_swi             | Reference<br>strain                 | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | Swift                        | Swift                           | n_swi              | Hardening<br>exponent               | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | HockettSherby                | Hockett-Sherby                  | sigma_hoc          | Steady-state<br>flow stress         | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | HockettSherby                | Hockett-Sherby                  | m_hoc              | Saturation<br>coefficient           | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | HockettSherby                | Hockett-Sherby                  | n_hoc              | Saturation<br>exponent              | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | ArmstrongFrederick           | Armstrong<br>Frederick          | Ck                 | Kinematic<br>hardening<br>modulus   | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | ArmstrongFrederick           | Armstrong<br>Frederick          | gammak             | Kinematic<br>hardening<br>parameter | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | Chaboche                     | Chaboche                        | Ck0_cha            | Kinematic<br>hardening<br>modulus   | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | JohnsonCook                  | Johnson-Cook                    | k_jcook            | Strength<br>coefficient             | 1x1  | Pa   |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                           | PROPERTY GROUP<br>(API NAME)   | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT     |
|----------------------------------------------------|--------------------------------|---------------------------------|--------------------|------------------------------------------------|------|----------|
| Solid mechanics/<br>Elastoplastic<br>Material      | JohnsonCook                    | Johnson-Cook                    | n_jcook            | Hardening<br>exponent                          | 1x1  | 1        |
| Solid mechanics/<br>Elastoplastic<br>Material      | JohnsonCook                    | Johnson-Cook                    | C_jcook            | Strain rate<br>strength<br>coefficient         | 1x1  | 1        |
| Solid mechanics/<br>Elastoplastic<br>Material      | JohnsonCook                    | Johnson-Cook                    | epet0_jcook        | Reference<br>strain rate                       | 1x1  | 1/s      |
| Solid mechanics/<br>Elastoplastic<br>Material      | JohnsonCook                    | Johnson-Cook                    | m_jcook            | Temperature<br>exponent                        | 1x1  |          |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyAust<br>enite  | Austenite phase                 | E_A                | Young's<br>modulus                             | 1x1  | Pa       |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyAust<br>enite  | Austenite phase                 | Cp_A               | Heat capacity<br>at constant<br>pressure       | 1x1  | J/(kg·K) |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyMart<br>ensite | Martensite<br>phase             | E_M                | Young's<br>modulus                             | 1x1  | Pa       |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyMart<br>ensite | Martensite<br>phase             | Cp_M               | Heat capacity<br>at constant<br>pressure       | 1x1  | J/(kg·K) |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | T0                 | Shape memory<br>alloy reference<br>temperature | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | TMs                | Martensite<br>start<br>temperature             | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | TMf                | Martensite<br>finish<br>temperature            | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | TAs                | Austenite start<br>temperature                 | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | TAf                | Austenite<br>finish<br>temperature             | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | CM                 | Slope of<br>martensite<br>limit curve          | 1x1  | Pa/K     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | CA                 | Slope of<br>austenite limit<br>curve           | 1x1  | Pa/K     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | etrmaxLago<br>udas | Maximum<br>transformation<br>strain            | 1x1  | 1        |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                           | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME)  | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT     |
|----------------------------------------------------|------------------------------|---------------------------------|---------------------|------------------------------------------------|------|----------|
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                | Lagoudas model                  | sigmaStar           | Calibration<br>stress level                    | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | sMs                 | Martensite<br>start stress                     | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | sMf                 | Martensite<br>finish stress                    | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | sAs                 | Austenite start<br>stress                      | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | sAf                 | Austenite<br>finish stress                     | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | Tstress             | Measurement<br>temperature                     | 1x1  |          |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasExponentialLaw       | Lagoudas,<br>exponential law    | etrmin              | Initial<br>maximum<br>transformation<br>strain | 1x1  | 1        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasExponentialLaw       | Lagoudas,<br>exponential law    | etrsat              | Ultimate<br>transformation<br>strain           | 1x1  | 1        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasExponentialLaw       | Lagoudas,<br>exponential law    | scrit               | Critical stress                                | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasExponentialLaw       | Lagoudas,<br>exponential law    | kcrit               | Saturation<br>exponent                         | 1x1  | 1/Pa     |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | TStar               | Reference<br>temperature                       | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | beta                | Slope of limit<br>curve                        | 1x1  | Pa/K     |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | etrmaxAuri<br>cchio | Maximum<br>transformation<br>strain            | 1x1  | 1        |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | sig0_SA             | Elastic domain<br>radius                       | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | Hk                  | Hardening<br>modulus                           | 1x1  | N/m2     |
| Gas models                                         | idealGas                     | Ideal gas                       | Rs                  | Specific gas<br>constant                       | 1x1  | J/(kg·K) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                  | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)            | SIZE | UNIT |
|-------------------------------------------|------------------------------|---------------------------------|--------------------|--------------------------------------|------|------|
| Fluid flow/<br>Inelastic Non<br>Newtonian | PowerLaw                     | Power law                       | m_pow              | Fluid<br>consistency<br>coefficient  | 1x1  | Pa·s |
| Fluid flow/<br>Inelastic Non<br>Newtonian | PowerLaw                     | Power law                       | n_pow              | Flow behavior<br>index               | 1x1  | 1    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | mu0                | Zero shear<br>rate viscosity         | 1x1  | Pa·s |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | mu_inf             | Infinite shear<br>rate viscosity     | 1x1  | Pa·s |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | lam_car            | Relaxation<br>time                   | 1x1  | s    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | n_car              | Power index                          | 1x1  | 1    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | a_car              | Transition<br>parameter              | 1x1  | 1    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Ellis                        | Ellis model                     | tau_half           | Shear stress<br>parameter            | 1x1  | N/m2 |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Ellis                        | Ellis model                     | a_e                | Power<br>parameter                   | 1x1  | 1    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | DeKee                        | DeKee model                     | lam_DK             | Relaxation<br>time                   | 1x1  | s    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | DeKee                        | DeKee model                     | mu_DK              | Shear rate<br>viscosity<br>parameter | 1x1  | Pa·s |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Cross                        | Cross model                     | tau_tr             | Critical stress                      | 1x1  | N/m2 |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Viscoplastic                 | Viscoplastic                    | tau_y              | Yield stress                         | 1x1  | N/m2 |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Viscoplastic                 | Viscoplastic                    | mu_p               | Plastic<br>viscosity                 | 1x1  | Pa·s |

The following table lists all supported physical quantities for use as model inputs with their category, base name, and SI unit:

TABLE 9-7: SUPPORTED PHYSICAL QUANTITIES FOR MODEL INPUTS.

| API NAME                        | DESCRIPTION                                         | CATEGORY         | BASE NAME | UNIT            |
|---------------------------------|-----------------------------------------------------|------------------|-----------|-----------------|
| numberdensityacceptor           | Acceptor concentration                              | Transport        | Na        | 1/m3            |
| angularfrequency                | Angular frequency                                   | General          | omega     | 1/s             |
| catalyticactivity               | Catalytic activity                                  | Transport        | a         | mol/s           |
| charge                          | Charge                                              | Electromagnetics | Q         | C               |
| inelasticpowerloss              | Collisional power loss                              | Transport        | Sen       | W/m3            |
| concentration                   | Concentration                                       | General          | c         | mol/m3          |
| massconcentration               | Concentration                                       | Transport        | cm        | kg/m3           |
| conversion                      | Conversion                                          | Transport        | cr        | 1               |
| correctedpressure               | Corrected pressure                                  | Transport        | pc        | Pa              |
| correctedvelocity               | Corrected velocity field                            | Transport        | uc        | m/s             |
| current                         | Current                                             | General          | I         | A               |
| currentdensity                  | Current density                                     | Electromagnetics | J         | A/m2            |
| currentsource                   | Current source                                      | Electromagnetics | Qj        | A/m3            |
| depth                           | Depth                                               | Acoustics        | D         | m               |
| dispersedphasevolumefraction    | Dispersed phase volume fraction                     | Transport        | phid      | 1               |
| displacement                    | Displacement                                        | General          | u_d       | m               |
| numberdensitydonor              | Donor concentration                                 | Transport        | Nd        | 1/m3            |
| downsidetemperature             | Downside temperature                                | Hidden           | Td        | K               |
| effectivegasdensity             | Effective gas density                               | Transport        | rhogeff   | kg/m3           |
| elasticshearstrain              | Elastic shear strain                                | Solid mechanics  | esh       | 1               |
| uniaxialstrain                  | Elastic uniaxial strain                             | Solid mechanics  | eax       | 1               |
| displacementfield               | Electric displacement field                         | Electromagnetics | Df        | C/m2            |
| electricfield                   | Electric field                                      | Electromagnetics | E         | V/m             |
| electricpotential               | Electric potential                                  | Electromagnetics | V         | V               |
| electrolyteconductivity         | Electrolyte conductivity                            | Hidden           | sigmal    | S/m             |
| electricpotentialionicphase     | Electrolyte potential                               | Hidden           | phil      | V               |
| electrondensity                 | Electron density                                    | Transport        | ne        | 1/m3            |
| electronenergydensity           | Electron energy density                             | Transport        | en        | kg/(m·s3<br>·A) |
| energy                          | Energy                                              | General          | Ene       | J               |
| energydensity                   | Energy density                                      | Electromagnetics | W         | Pa              |
| effectiveplasticstrain          | Equivalent plastic strain                           | Solid mechanics  | epe       | 1               |
| effectiveplasticstraininmatrix  | Equivalent plastic strain in the<br>matrix material | Solid mechanics  | epm       | 1               |
| effectiveplasticstrainrate      | Equivalent plastic strain rate                      | Solid mechanics  | epet      | 1/s             |
| effectiveviscoplasticstrain     | Equivalent viscoplastic strain                      | Solid mechanics  | evpe      | 1               |
| effectiveviscoplasticstrainrate | Equivalent viscoplastic strain rate                 | Solid mechanics  | evpet     | 1/s             |
| fluidconductance                | Fluid conductance                                   | Transport        | Rb        | 1/s             |
| forcedensity                    | Force density                                       | Transport        | f         | N/m3            |

TABLE 9-7: SUPPORTED PHYSICAL QUANTITIES FOR MODEL INPUTS.

| API NAME                     | DESCRIPTION                          | CATEGORY         | BASE NAME | UNIT         |
|------------------------------|--------------------------------------|------------------|-----------|--------------|
| frequency                    | Frequency                            | General          | freq      | 1/s          |
| generalizedchemicalpotential | Generalized chemical potential       | Transport        | eta       | Pa           |
| henrysconstant               | Henry's constant                     | Transport        | kh        | J/mol        |
| hydraulicconductivity        | Hydraulic conductivity               | Transport        | K         | m/s          |
| initialelectrondensity       | Initial electron density             | Transport        | neinit    | 1/m3         |
| heatflux                     | Inward heat flux                     | Transport        | q0        | W/m2         |
| kinematicviscosity           | Kinematic viscosity                  | Transport        | nu        | m2<br>/s     |
| length                       | Length                               | General          | l         | m            |
| levelsetvariable             | Level set variable                   | Transport        | phils     | 1            |
| linecharge                   | Line charge                          | Electromagnetics | Ql        | C/m          |
| linecurrentsource            | Line current source                  | Electromagnetics | Qjl       | A/m          |
| logelectrondensity           | Log of electron density              | Transport        | Ne        | 1            |
| logelectronenergydensity     | Log of electron energy density       | Transport        | En        | 1            |
| luminousintensity            | Luminous intensity                   | General          | li        | cd           |
| magneticfield                | Magnetic field                       | Electromagnetics | H         | A/m          |
| magneticfluxdensity          | Magnetic flux density                | Electromagnetics | B         | T            |
| massfraction                 | Mass fraction                        | Transport        | w         | 1            |
| masssource                   | Mass source                          | Transport        | Qm        | kg/(m3·s)    |
| meanelectronenergy           | Mean electron energy                 | Transport        | ebar      | V            |
| energyperamount              | Molar enthalpy                       | Transport        | h         | J/mol        |
| molarsurfaceflux             | Molar flux                           | Transport        | Ns        | mol/(m·s)    |
| molarvolume                  | Molar volume                         | Transport        | Vmol      | m3/mol       |
| normalelectroncurrentdensity | Normal electron current density      | Electromagnetics | nFe       | A/m2         |
| normalioncurrentdensity      | Normal ion current density           | Electromagnetics | nF        | A/m2         |
| numberdensity                | Number density                       | Transport        | nd        | 1/m3         |
| phasefieldhelpvariable       | Phase field help variable            | Transport        | psi       | 1            |
| phasefieldvariable           | Phase field variable                 | Transport        | phipf     | 1            |
| pointcurrentsource           | Point current source                 | Electromagnetics | I0        | A            |
| powerflow                    | Power flow                           | Electromagnetics | pFlow     | W/m2         |
| practicalsalinity            | Practical salinity                   | Acoustics        | Spr       | 1            |
| pressure                     | Pressure                             | General          | pA        | Pa           |
| heatproduction               | Production/absorption<br>coefficient | Transport        | qs        | W/(m3<br>·K) |
| reducedelectricfield         | Reduced electric field               | Transport        | EN        | V·m2         |
| reduceddiffusivity           | Reduced electron diffusivity         | Transport        | DeN       | 1/(m·s)      |
| reducedmobility              | Reduced electron mobility            | Transport        | muN       | 1/(V·m·s)    |
| relativehumidity             | Relative humidity                    | General          | phi       | 1            |
| salinity                     | Salinity                             | Acoustics        | Sp        | 1            |
| energyflux                   | Secondary emission energy flux       | Transport        | seflux    | V/(m2·s)     |
| particleflux                 | Secondary emission flux              | Transport        | sflux     | 1/(m2·s)     |
| solidangle                   | Solid angle                          | General          | sr        | 1            |

TABLE 9-7: SUPPORTED PHYSICAL QUANTITIES FOR MODEL INPUTS.

| API NAME                      | DESCRIPTION                               | CATEGORY         | BASE NAME | UNIT         |
|-------------------------------|-------------------------------------------|------------------|-----------|--------------|
| spacechargedensity            | Space charge density                      | Electromagnetics | rhoq      | C/m3         |
| specificenergy                | Specific energy                           | Transport        | es        | J/kg         |
| slipvelocity                  | Squared slip velocity                     | Transport        | slipvel   | J/kg         |
| surfacechargedensity          | Surface charge density                    | Electromagnetics | rhoqs     | C/m2         |
| surfacecurrentdensity         | Surface current density                   | Electromagnetics | Js        | A/m          |
| surfacemagneticcurrentdensity | Surface magnetic current density          | Electromagnetics | Jms       | V/m          |
| surfaceconcentration          | Surface site concentration                | Transport        | gamma     | mol/m2       |
| temperature                   | Temperature                               | General          | T         | K            |
| timechangeinpressurehead      | Time change in pressure head              | Transport        | dHpdt     | m/s          |
| turbulentdissipationrate      | Turbulent dissipation rate                | Transport        | ep        | W/kg         |
| turbulentkinematicviscosity   | Undamped turbulent kinematic<br>viscosity | Transport        | nutilde   | m2/s         |
| upsidetemperature             | Upside temperature                        | Hidden           | Tu        | K            |
| velocity                      | Velocity                                  | General          | u         | m/s          |
| volumefraction                | Volume fraction                           | Transport        | Vf        | 1            |
| strainreferencetemperature    | Volume reference temperature              | General          | Tempref   | K            |
| volumetricheatcapacity        | Volumetric heat capacity                  | Transport        | Cvol      | J/(m3<br>·K) |

# *Supported Functions and Settings*

The following table includes the supported functions and settings with their data type and feature ID:

TABLE 9-8: SUPPORTED FUNCTIONS AND SETTINGS.

| SETTING       | DESCRIPTION                                      | TYPE         | FEATURE ID    | FEATURE<br>DESCRIPTION |
|---------------|--------------------------------------------------|--------------|---------------|------------------------|
| argders       | Arguments                                        | StringMatrix | Analytic      | Analytic               |
| args          | Arguments                                        | StringArray  | Analytic      | Analytic               |
| argunit       | Arguments                                        | StringArray  | Analytic      | Analytic               |
| complex       | May produce complex output for real<br>arguments | Boolean      | Analytic      | Analytic               |
| dermethod     | Derivatives                                      | String       | Analytic      | Analytic               |
| expr          | Expression                                       | String       | Analytic      | Analytic               |
| fununit       | Function                                         | String       | Analytic      | Analytic               |
| periodic      | Make periodic                                    | String       | Analytic      | Analytic               |
| periodiclower | Lower limit                                      | Double       | Analytic      | Analytic               |
| periodicupper | Upper limit                                      | Double       | Analytic      | Analytic               |
| plotargs      | Arguments                                        | StringMatrix | Analytic      | Analytic               |
| plotaxis      | Argument                                         | BooleanArray | Analytic      | Analytic               |
| argunit       | Argument                                         | StringArray  | Interpolation | Interpolation          |
| defineinv     | Define inverse function                          | String       | Interpolation | Interpolation          |
| defineprimfun | Define primitive function                        | String       | Interpolation | Interpolation          |
| definerandom  | Define random function                           | String       | Interpolation | Interpolation          |
| defvars       | Use spatial coordinates as arguments             | String       | Interpolation | Interpolation          |
| dseparator    | Decimal separator                                | String       | Interpolation | Interpolation          |

TABLE 9-8: SUPPORTED FUNCTIONS AND SETTINGS.

| SETTING        | DESCRIPTION                     | TYPE         | FEATURE ID    | FEATURE<br>DESCRIPTION |
|----------------|---------------------------------|--------------|---------------|------------------------|
| exportfilename | Export…                         | None         | Interpolation | Interpolation          |
| extrap         | Extrapolation                   | String       | Interpolation | Interpolation          |
| extrapvalue    | Value outside range             | Double       | Interpolation | Interpolation          |
| filename       | Filename                        | File         | Interpolation | Interpolation          |
| frame          | Frame                           | String       | Interpolation | Interpolation          |
| funcinvname    | Inverse function name           | String       | Interpolation | Interpolation          |
| funcname       | Function name                   | String       | Interpolation | Interpolation          |
| funcs          | Functions                       | StringMatrix | Interpolation | Interpolation          |
| fununit        | Function                        | StringArray  | Interpolation | Interpolation          |
| importeddim    | Dimension                       | String       | Interpolation | Interpolation          |
| importedname   | Filename                        | String       | Interpolation | Interpolation          |
| importedstruct | Data type                       | String       | Interpolation | Interpolation          |
| interp         | Interpolation                   | String       | Interpolation | Interpolation          |
| leftend        | Lower limit                     | Double       | Interpolation | Interpolation          |
| nargs          | Number of arguments             | Int          | Interpolation | Interpolation          |
| plotinv        | Plot the inverse function       | Boolean      | Interpolation | Interpolation          |
| primfunname    | Primitive function name         | String       | Interpolation | Interpolation          |
| randomname     | Random function name            | String       | Interpolation | Interpolation          |
| randomnargs    | Number of arguments             | Int          | Interpolation | Interpolation          |
| randomrange    | Range                           | String       | Interpolation | Interpolation          |
| range          | Range                           | String       | Interpolation | Interpolation          |
| resultTable    | Table from                      | String       | Interpolation | Interpolation          |
| rightend       | Upper limit                     | Double       | Interpolation | Interpolation          |
| scaledata      | Internal scaling of data points | String       | Interpolation | Interpolation          |
| sheet          | Sheet                           | String       | Interpolation | Interpolation          |
| source         | Data source                     | String       | Interpolation | Interpolation          |
| struct         | Data format                     | String       | Interpolation | Interpolation          |
| table          | Function values                 | StringMatrix | Interpolation | Interpolation          |
| arg            | Argument                        | String       | Piecewise     | Piecewise              |
| argunit        | Arguments                       | String       | Piecewise     | Piecewise              |
| extrap         | Extrapolation                   | String       | Piecewise     | Piecewise              |
| extrapvalue    | Value outside range             | Double       | Piecewise     | Piecewise              |
| fununit        | Function                        | String       | Piecewise     | Piecewise              |
| pieces         | Intervals                       | StringMatrix | Piecewise     | Piecewise              |
| smooth         | Smoothing                       | String       | Piecewise     | Piecewise              |
| smoothends     | Smooth at endpoints             | Boolean      | Piecewise     | Piecewise              |
| smoothzone     | Size of transition zone         | Double       | Piecewise     | Piecewise              |
| zonelengthtype | Transition zone                 | String       | Piecewise     | Piecewise              |

# Native Binary Data Files and Text Data Files

A COMSOL Multiphysics native data file is used to store COMSOL data. This file format is suitable for exchange of mesh or CAD data between COMSOL Multiphysics and other software systems. It is possible to save a COMSOL Multiphysics native data file in a native text data file format, using the extension .mphtxt, or in a native binary data file format, using the extension .mphbin. The file formats contain the same data in the same order.

# In this section:

- **•** File Structure
- **•** Objects
- **•** Terminology
- **•** Text File Format
- **•** Binary File Format

# *File Structure*

The COMSOL Multiphysics native data file format has a global version number, so that it is possible to revise the whole structure. The first entry in each file is the file format, indicated by two integers. The first integer is the major file version and the second is referred to as the minor file version. For the current version, the first two entries in a file is 0 1.

The following sections describe the file structure of the supported version.

## **FILE VERSION 0.1**

After the file version, the file contains three groups of data:

- **•** A number of *tags* stored as strings, which are used so that objects can refer to each other.
- **•** A number of *types*, which are strings that can be used in serializing the object. The types are currently not used by the COMSOL Multiphysics software.
- **•** *Objects*, where each object starts with the header 0 0 1, followed by a string that defines which type of object that follows.

**Example** When using model.mesh(<tag>).export(<filename>) or **Mesh** > **Export to File** to save a COMSOL mesh, the tag equals the variable name (m1), the type is set to obj (but this is not used), and the file contains the serialization of the mesh object, including point coordinates and element data of the mesh. In this case, the file also contains a selection object. See some of the entries in Serializable Classes for more examples of COMSOL Multiphysics native text data file content.

```
# Created by COMSOL Multiphysics.
# Major & minor version
0 1
2 # number of tags
# Tags
5 mesh1
10 mesh1_sel1
2 # number of types
# Types
3 obj
3 obj
# --------- Object 0 ----------
```

```
0 0 1
4 Mesh # class
4 # version
3 # sdim
782 # number of mesh vertices
0 # lowest mesh vertex index
# Mesh vertex coordinates
-0.70710678118654791 -0.70710678118654768 0
-0.83146885388289216 -0.55556976368981836 0
…
…
# --------- Object 1 ----------
0 0 1
9 Selection # class
0 # Version
5 Fluid # Label
5 mesh1 # Geometry/mesh tag
3 # Dimension
1 # Number of entities
# Entities
1
```

# *Objects*

The objects section contains the serialization data for each serialized object, instantiated from a serializable class. The serialization of each object start with a version number. With this version number, the serialization can be revised in future versions while maintaining backward compatibility.

The following section describes the format of the supported version:

#### **OBJECT VERSION 0**

The following table contains the fields of the objects:

| DATA TYPE    | VARIABLE | DESCRIPTION                             |
|--------------|----------|-----------------------------------------|
| Integer      |          | Version.                                |
| Integer      |          | Not used.                               |
| Integer      | type     | Serialization type, 1 for Serializable. |
| Serializable | obj      | If type equals 1, this field follows.   |

Serialization type 1 indicates that the following field is a subtype to Serializable.

# *Terminology*

The following data types are used in the serialization:

- **•** *Boolean* refers to an 8-bit signed character which must be 0 or 1.
- **•** *Character* refers to an 8-bit signed character.
- **•** *Integer* refers to a 32-bit signed integer.
- **•** *Double* refers to a 64-bit double.

Matrices are stored in row-major order. In this documentation brackets are used to indicate a matrix. Hence, integer[3][4] means that 12 integers representing a matrix are stored in the file. The first four entries correspond to the integers in the first row of the matrix, and so on.

# *Text File Format*

COMSOL Multiphysics text file, using the file extension .mphtxt, are text files where values are stored as text separated by whitespace characters.

## Lexical conventions:

- **•** Strings are serialized as the length of the string followed by a space and then the characters of the string, for example, "6 COMSOL". This is the only place where whitespace matters.
- **•** The software ignores everything following a # on a line except when reading a string. This makes it possible to store comments in the file.

# *Binary File Format*

COMSOL Multiphysics binary file, using the extension .mphbin, are binary files with the following data representation:

- **•** Integers and doubles are stored in little-endian byte order.
- **•** Strings are stored as the length of the string (integer) followed by the characters of the string (integers).

# Serializable Classes

In this section:

| •<br>BezierCurve |  |
|------------------|--|
|------------------|--|

- **•** BezierSurf
- **•** BezierTri
- **•** BSplineCurve
- **•** BSplineSurf
- **•** Ellipse
- **•** Geom1
- **•** Geom2
- **•** Geom3
- **•** GeomCurve

- **•** GeomSurf
- **•** Mesh
- **•** MeshCurve
- **•** MeshSurf
- **•** PolChain
- **•** Selection
- **•** Serializable
- **•** Straight
- **•** Transform

The Serializable class is the base type, and all other types are subtypes of Serializable or of its subtypes.

![](_page_60_Picture_22.jpeg)

In the **Fields** sections for each type below, the fields appear in the table in the exact order that they must appear in the data files.

The **Variable** column lists the internal variables used in the descriptions of data types and in the definitions of what the class implements.

![](_page_60_Picture_25.jpeg)

The serialization of a subtype of Serializable begins with Serializable's serialization; that is, it begins with the type ID string. The type ID strings are the same as the headers of the following sections.

For an example of the serialization format — specifically, of a file containing a 3D mesh with tetrahedral and prism elements — see mesh\_example\_4.mphtxt in \models\COMSOL\_Multiphysics\Meshing\_Tutorials.

![](_page_60_Picture_28.jpeg)

For geometry types, you can import and export older versions of the serializable classes.

*BezierCurve*

**CURRENT VERSION**

1

**SUBTYPE OF**

GeomCurve

| ENTITY/OBJECT  | VARIABLE | DESCRIPTION                                                                                                                                                                                                |
|----------------|----------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| integer        |          | Version.                                                                                                                                                                                                   |
| integer        | d        | Space dimension.                                                                                                                                                                                           |
| Boolean        |          | I if the curve is rational, 0 if the curve is polynomial (nonrational).                                                                                                                                    |
| integer        | р        | Degree.                                                                                                                                                                                                    |
| double[p+1][k] | Pw       | The control points. If the curve is rational, then the points are given in homogeneous coordinates and $k = d+1$ . If the curve is polynomial, the points are given in Cartesian coordinates and $k = d$ . |

#### DESCRIPTION

A rational Bézier curve is a parameterized curve of the form

$$\mathbf{C}(t) = \frac{\sum_{i=0}^{p} \mathbf{P}_i w_i B_i^p(t)}{\sum_{i=0}^{p} w_i B_i^p(t)} \quad , 0 \leq t \leq 1$$

where the functions

$$B_i^p(t) = \binom{p}{i} t^i (1-t)^{p-i}$$

are the Bernstein basis functions of degree p,  $P_i = (x_1, ..., x_d)$  are the control points in the d-dimensional space, and  $w_i$  are the weights, which should always be positive real numbers to get a properly defined rational Bézier curve. A rational Bézier curve has a direction defined by the parameter t. The homogeneous control points Pw[i] used in the serialization of a rational curve have the components:

$$\begin{aligned} \text{Pw[i][k]} &= \omega_i P_{i,\,k}, \, 0 \leq k < d \\ &\text{Pw[i][d]} &= \omega_i \end{aligned}$$

A polynomial curve has all weights equal to 1.

## EXAMPLE

The following example illustrates a Bézier curve:

- 11 BezierCurve # class
- 1 # version
- 3 # sdim
- 1 # rational?
- 2 # degree
- # homogeneous control points
- -0.70710678118654757 -0.70710678118654757 0 0.70710678118654757
- 0 -1 0 1

## SEE ALSO

**BSplineCurve** 

#### **CURRENT VERSION**

#### SUBTYPE OF

GeomSurf

## FIELDS

| ENTITY/OBJECT       | VARIABLE | DESCRIPTION                                                                                                                                                                                                                                                       |
|---------------------|----------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| integer             |          | Version.                                                                                                                                                                                                                                                          |
| Boolean             |          | I if the surface is rational, 0 if it is polynomial (nonrational).                                                                                                                                                                                                |
| integer             | р        | Degree in the first parameter.                                                                                                                                                                                                                                    |
| integer             | q        | Degree in the second parameter.                                                                                                                                                                                                                                   |
| double[q+1][p+1][k] | Pw       | The surface control points. If the surface is rational, these are given in homogeneous coordinates and $k=4$ . If the surface is polynomial, these are given in Cartesian coordinates and $k=3$ . The value of p must be greater than or equal to the value of q. |

#### DESCRIPTION

A rectangular rational Bézier surface of degree p-by-q is described by

$$\mathbf{S}(s,t) = \frac{\sum_{i=0}^{p} \sum_{j=0}^{q} \mathbf{P}_{i,j} w_{i,j} B_{i}^{p}(s) B_{j}^{q}(t)}{\sum_{i=0}^{p} \sum_{j=0}^{q} w_{i,j} B_{i}^{p}(s) B_{j}^{q}(t)}, \ 0 \leq s, t \leq 1 \ ,$$

where  $B_i^p$  and  $B_i^q$  are the Bernstein basis functions of degree p and q, respectively, as described in the entry of BezierCurve. This surface description is called rectangular because the parameter domain is rectangular; that is, the two parameters s and t can vary freely in given intervals. The homogeneous control points Pw[j][i] used in the serialization of a rational surface have the components:

$$\begin{aligned} \text{Pw[j][i][k]} &= \omega_{i,j} P_{i,j,\,k}, \, 0 \leq k < 3 \\ &\text{Pw[j][i][d]} &= \omega_{i,\,j} \end{aligned}$$

A polynomial surface has all weights equal to 1.

#### SEE ALSO

BSplineSurf, BezierTri

BezierTri

#### **CURRENT VERSION**

## SUBTYPE OF

GeomSurf

The class is defined by the following fields:

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                          |
|---------------|----------|--------------------------------------|
| integer       |          | Version.                             |
| double[3][3]  | P        | Control points P[0], P[1], and P[2]. |

# DESCRIPTION

This type represents a triangular planar surface through three control points, defined as

$$S(s,t) = (1-s-t)P_0 + sP_1 + tP_2$$

where

$$\begin{cases} 0 \le s, t \\ s + t \le 1 \end{cases}$$

## SEE ALSO

BezierSurf

BSplineCurve

# CURRENT VERSIONS

## SUBTYPE OF

GeomCurve

#### FIELDS

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                                                                                                                                                                                   |  |  |
|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|--|--|
| integer       |          | Version.                                                                                                                                                                                                                                                      |  |  |
| integer       | d        | Space dimension.                                                                                                                                                                                                                                              |  |  |
| Boolean       |          | I if the curve is rational, 0 if the curve is polynomial (nonrational).                                                                                                                                                                                       |  |  |
| Boolean       |          | I if the curve is periodic, 0 if it is not periodic.                                                                                                                                                                                                          |  |  |
| integer       | p        | Degree.                                                                                                                                                                                                                                                       |  |  |
| integer       | m        | Length of knot vector.                                                                                                                                                                                                                                        |  |  |
| double[m]     | U        | Knot vector.                                                                                                                                                                                                                                                  |  |  |
| double[n][k]  | Pw       | The control points of the curve. The number of control points, n, is given by $n=m-p-1$ . If the curve is rational, these are given in homogeneous coordinates and $k=d+1$ . If the curve is polynomial, these are given in Cartesian coordinates and $k=d$ . |  |  |

# DESCRIPTION

The BSplineCurve describes a general spline curve using B-spline basis functions. Splines on this form are often referred to as B-splines.

A pth-degree spline curve is defined by

$$\mathbf{C}(u) = \frac{\sum_{i=0}^{n} N_i^p(u) w_i \mathbf{P}_i}{\sum_{i=0}^{n} N_i^p(u) w_i} , a \le u \le b$$

where  $\mathbf{P}_i$  are the control points., the  $w_i$  are the weights, and the  $N_i^p$  are the pth degree B-spline basis functions defined in the nonperiodic and nonuniform knot vector

$$U = \{a, ..., a, u_{n+1}, ..., u_{m-n-1}, b, ..., b\}$$

For  $N_i^p(u)$ , the following definition is used:

$$\begin{split} N_i^0(u) &= \left\{ \begin{array}{l} 1 \ u_i \leq u < u_{i+1} \\ 0 \ \ \text{otherwise} \end{array} \right. \\ N_i^p(u) &= \frac{u - u_i}{u_{i+p} - u_i} N_i^{p-1}(u) + \frac{u_{i+p+1} - u}{u_{i+p+1} - u_{i+1}} N_{i+1}^{p-1}(u) \end{split}$$

For nonrational B-splines, all weights are equal to 1 and the curve can be expressed as

$$\mathbf{C}(u) = \sum_{i=0}^{n} N_{i}^{p}(u) \mathbf{P}_{i}, a \le u \le b$$

The homogeneous control points Pw[i] used in the serialization of a rational curve have the components:

$$\begin{aligned} \text{Pw[i][k]} &= \omega_i P_{i,\,k}, \, 0 \leq k < d \\ &\text{Pw[i][d]} &= \omega_i \end{aligned}$$

A polynomial curve has all weights equal to 1.

## EXAMPLE

```
12 BSplineCurve # class
2 # version
3 # sdim
0 # rational?
0 # periodic?
3 # degree
# knot vector
800001111
# control points
1 0.3333333333333333 0
1 0.666666666666666 0.3333333333333333
1 1 1
```

## SEE ALSO

BezierCurve

## **CURRENT VERSION**

#### SUBTYPE OF

GeomSurf

## FIELDS

| ENTITY/OBJECT     | VARIABLE | DESCRIPTION                                                                                                                                                                                                                                                                                               |
|-------------------|----------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| integer           |          | Version.                                                                                                                                                                                                                                                                                                  |
| Boolean           |          | I if the surface is rational, 0 if the surface is polynomial (nonrational).                                                                                                                                                                                                                               |
| integer           | p        | Degree in first parameter.                                                                                                                                                                                                                                                                                |
| integer           | q        | Degree in second parameter.                                                                                                                                                                                                                                                                               |
| Boolean           |          | I if the surface is periodic in the first parameter; 0 otherwise.                                                                                                                                                                                                                                         |
| Boolean           |          | I if the surface is periodic in the second parameter; 0 otherwise.                                                                                                                                                                                                                                        |
| integer           | m1       | Length of first knot vector.                                                                                                                                                                                                                                                                              |
| double[m1]        | U        | First knot vector.                                                                                                                                                                                                                                                                                        |
| integer           | m2       | Length of second knot vector.                                                                                                                                                                                                                                                                             |
| double[m2]        | V        | Second knot vector.                                                                                                                                                                                                                                                                                       |
| double[n2][n1][k] | Pw       | The control points of the surface. The number of control points, n1 and n2, are given by n1 = m1 - p - 1 and n2 = m2 - q - 1. If the surface is rational these are given in homogeneous coordinates and $k = d + 1$ . If the surface is polynomial these are given in Cartesian coordinates and $k = d$ . |

## DESCRIPTION

The generalization of B-spline curves to surfaces is a tensor product surfaces given by

$$\mathbf{S}(s,t) = \frac{\sum\limits_{i=0}^{n1}\sum\limits_{j=0}^{n2}\mathbf{P}_{i,j}w_{i,j}N_{i}^{p(s)}N_{j}^{q(t)}}{\sum\limits_{i=0}^{n1}\sum\limits_{j=0}^{n2}w_{i,j}N_{i}^{p(s)}N_{j}^{q(t)}}$$

For  $N_i^p$ , the following definition is used:

$$\begin{split} N_i^0(u) &= \left\{ \begin{array}{l} 1 \ u_i \leq u < u_{i+1} \\ 0 \quad \text{otherwise} \end{array} \right. \\ N_i^p(u) &= \frac{u - u_i}{u_{i+p} - u_i} N_i^{p-1}(u) + \frac{u_{i+p+1} - u}{u_{i+p+1} - u_{i+1}} N_{i+1}^{p-1}(u) \end{split}$$

The homogeneous control points Pw[j][i] used in the serialization of a rational surface have the components:

$$\begin{split} \mathrm{Pw[j][i][k]} &= \omega_{i,j} P_{i,j,\,k}, \, 0 \leq k < 3 \\ & \mathrm{Pw[j][i][d]} = \omega_{i\,\,j} \end{split}$$

A polynomial surface has all weights equal to 1.

### **SEE ALSO**

BezierSurf

# *Ellipse*

#### **CURRENT VERSION**

1

#### **SUBTYPE OF**

GeomCurve

#### **FIELDS**

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                  |
|---------------|----------|--------------------------------------------------------------|
| integer       |          | Version.                                                     |
| integer       | d        | Space dimension.                                             |
| Transform     |          | Transformation class. Only present if d = 3.                 |
| double[d]     | center   | Centerpoint.                                                 |
| Boolean       |          | 1 if clockwise rotation; 0 otherwise. Only present if d = 2. |
| double[d]     | normal   | Normal vector. Only present if d = 3.                        |
| double[d]     | M        | Major axis.                                                  |
| double        | rat      | Ratio of minor axis length to major axis length.             |
| double        | offset   | Parameter at the end of major axis.                          |

#### **DESCRIPTION**

This curve defines an ellipse in the two or three dimensional space.

In 2D, an ellipse is defined by a centerpoint center, a vector defining the major axis M of the ellipse (including the magnitude of the major axis), the radius ratio of the minor axis length to the major axis length rat, the direction of the ellipse, and the parameter offset at the major axis offset.

In 3D, an ellipse is defined by a centerpoint center, a unit vector normal to the plane of the ellipse normal, a vector defining the major axis of the ellipse M (including the magnitude of the major axis), the radius ratio, and the parameter offset at the major axis offset. The direction of the ellipse is defined by the right-hand rule using the normal vector.

An ellipse is a closed curve that has a period of 2π. It is parameterized as:

```
point = center + M cos(t - offset) + N sin(t - offset)
```

where M and N are the major and minor axes, respectively.

# *Geom1*

#### **CURRENT VERSION**

2

#### **SUBTYPE OF**

Serializable

| ENTITY/OBJECT  | VARIABLE | DESCRIPTION                                                                                                  |
|----------------|----------|--------------------------------------------------------------------------------------------------------------|
| integer        |          | Version.                                                                                                     |
| integer        | type     | Object type: 0 for a point object, 1 for a curve object, 2 for a solid object, and -1<br>for a mixed object. |
| Boolean        |          | 1 if void regions are labeled; 0 otherwise.                                                                  |
| double         |          | Relative geometry tolerance.                                                                                 |
| integer        | nv       | Number of vertices.                                                                                          |
| double[nv]     | vtx      | Vector of vertex coordinates.                                                                                |
| integer[nv][2] | ud       | Matrix of integers giving domains on upside and downside of each vertex.                                     |
| integer        | na       | Number of attributes.                                                                                        |
| Attributes[na] |          | Attributes. The Attribute type is undocumented because it is only used internally.                           |

#### **DESCRIPTION**

The Geom1 type represents a geometry object in 1D that is not an assembly. The geometry object must not be self-intersecting.

### **EXAMPLE**

A solid 1D object (an interval):

```
# Major & minor version
0 1
1 # number of tags
# Tags
5 geom1
1 # number of types
# Types
3 obj
0 0 1
5 Geom1 # class
2 # version
1 # type
1 # voidsLabeled
1e-010 # gtol
3 # number of vertices
# Vertex coordinates
0
1
3
# Vertex up/down
1 0
2 1
0 2
```

# *Geom2*

#### **CURRENT VERSION**

2

#### **SUBTYPE OF**

Serializable

| ENTITY/OBJECT  | VARIABLE | DESCRIPTION                                                                                                  |
|----------------|----------|--------------------------------------------------------------------------------------------------------------|
| integer        |          | Version.                                                                                                     |
| integer        |          | Object type: 0 for a point object, 1 for a curve object, 2 for a solid object,<br>and -1 for a mixed object. |
| Boolean        |          | 1 if void regions are labeled; 0 otherwise.                                                                  |
| double         |          | Relative geometry tolerance.                                                                                 |
| double         |          | Relative resolution tolerance.                                                                               |
| integer        | nv       | Number of vertices.                                                                                          |
| VertexData[nv] | vertex   | Matrix of vertex data.                                                                                       |
| integer        | ne       | Number of edges.                                                                                             |
| EdgeData[ne]   | edge     | Matrix of edge data.                                                                                         |
| integer        | nc       | Number of curves.                                                                                            |
| integer        | na       | Number of attributes.                                                                                        |
| Attribute[na]  |          | Attributes. The Attribute type is undocumented because it is only used<br>internally.                        |

In the table above, the entity types are defined as follows:

## *VertexData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                              |
|---------------|----------|----------------------------------------------------------------------------------------------------------|
| double[2]     |          | Coordinates of the vertex.                                                                               |
| int           |          | The domain number if the vertex is isolated. If the vertex is not isolated this<br>value is unspecified. |
| double        |          | Relative tolerance of the vertex.                                                                        |

## *EdgeData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                                         |
|---------------|----------|---------------------------------------------------------------------------------------------------------------------|
| int[2]        |          | Start and end vertex of the edge, respectively (1-based).                                                           |
| double[2]     |          | Parameter values of the two vertices.                                                                               |
| int[2]        |          | The left and right domain number of the edge, respectively.                                                         |
| int           |          | Signed index of the underlying curve (1-based). The sign indicates the<br>direction of the edge relative the curve. |
| double        |          | Relative tolerance of the edge.                                                                                     |

## **DESCRIPTION**

The Geom2 type represents a geometry object in 2D that is not an assembly and is not virtual. The geometry object must not be self-intersecting.

# **EXAMPLE**

A straight line in 2D:

- # Major & minor version
- 0 1
- 1 # number of tags
- # Tags
- 3 ls1
- 1 # number of types
- # Types

```
3 obj
# --------- Object 0 ----------
0 0 1
5 Geom2 # class
2 # version
1 # type
1 # voidsLabeled
1e-10 # gtol
0.0001 # resTol
2 # number of vertices
# Vertices
# X Y dom tol
0 0 -1 NAN
1 1.5 -1 NAN
1 # number of edges
# Edges
# vtx1 vtx2 s1 s2 up down curve tol
1 2 0 1 0 0 1 NAN
1 # number of curves
# Curves
# Curve 1
11 BezierCurve # class
1 # version
2 # sdim
0 # rational?
1 # degree
# homogeneous control points
0 0
1 1.5
# Attributes
0 # nof attributes
```

# *Geom3*

#### **CURRENT VERSION**

3

# **SUBTYPE OF**

Serializable

| DATA TYPE            | VARIABLE | DESCRIPTION                                                                                                                          |
|----------------------|----------|--------------------------------------------------------------------------------------------------------------------------------------|
| integer              |          | Version.                                                                                                                             |
| integer              | type     | Object type: 0 for a point object, 1 for a curve object, 2 for a surface<br>object, 3 for a solid object, and -1 for a mixed object. |
| Boolean              |          | 1 if void regions are labeled; 0 otherwise.                                                                                          |
| double               |          | Relative geometry tolerance.                                                                                                         |
| double               |          | Relative resolution tolerance.                                                                                                       |
| integer              | nv       | Number of vertices.                                                                                                                  |
| VertexData[nv]       | vertex   | Matrix of vertex data.                                                                                                               |
| integer              | npv      | Number of parameter vertices.                                                                                                        |
| ParamVertexData[npv] | pvertex  | Matrix of parameter vertex data.                                                                                                     |
| integer              | ne       | Number of edges.                                                                                                                     |
| EdgeData[ne]         | edge     | Matrix of edge data.                                                                                                                 |
| integer              | npe      | Number of parameter edges.                                                                                                           |
| ParamEdgeData[npe]   | pedge    | Matrix of parameter edge data.                                                                                                       |
| integer              | nf       | Number of faces.                                                                                                                     |
| FaceData[nf]         | face     | Matrix of face data.                                                                                                                 |
| integer              | nc       | Number of curves.                                                                                                                    |
| GeomCurve[nc]        | curves   | Vector of curves.                                                                                                                    |
| integer              | ns       | Number of surfaces.                                                                                                                  |
| GeomSurf[ns]         | surfaces | Vector of surfaces.                                                                                                                  |
| integer              | npc      | Number of parameter curves.                                                                                                          |
| GeomCurve[npc]       | pcurves  | Vector of parameter curves.                                                                                                          |
| integer              | na       | Number of attributes.                                                                                                                |
| Attributes[na]       |          | Attributes. The Attribute type is undocumented because it is only<br>used internally.                                                |

In the table above, the entity types are defined as follows:

## *VertexData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                              |
|---------------|----------|----------------------------------------------------------------------------------------------------------|
| double[3]     |          | Coordinates of the vertex.                                                                               |
| int           |          | The domain number if the vertex is isolated. If the vertex is not isolated this<br>value is unspecified. |
| double        |          | Relative tolerance of the vertex.                                                                        |

# *ParamVertexData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                        |
|---------------|----------|------------------------------------|
| int           |          | Vertex index (1-based).            |
| double[2]     |          | Parameter values in the surface.   |
| int           |          | Face index (1-based).              |
| int           |          | Surface index (1-based).           |
| double        |          | Relative tolerance for the vertex. |

## *EdgeData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                                                                       |
|---------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------|
| int[2]        |          | Start and end vertex of the edge, respectively (1-based).                                                                                         |
| double[2]     |          | Parameter values of the start and end vertices.                                                                                                   |
| int           |          | Index of a domain if the edge is not adjacent to a face, and is unspecified<br>otherwise.                                                         |
| int           |          | Signed index of the underlying curve (1-based). The sign indicates the<br>direction of the edge relative to the curve. Is 0 if there is no curve. |
| double        |          | Relative tolerance of the edge.                                                                                                                   |

# *ParamEdgeData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                                                                            |
|---------------|----------|------------------------------------------------------------------------------------------------------------------------|
| int           |          | Index of the corresponding 3D edge (1-based).                                                                          |
| int[2]        |          | Indices of the start and end parameter vertices (1-based index in the vector<br>of ParamVertexData).                   |
| double[2]     |          | Parameter values of the start and end vertices.                                                                        |
| int[2]        |          | Indices of the left and right faces, respectively (1-based). This is 0 if there is<br>no face.                         |
| int           |          | Signed index of the underlying parameter curve. The sign indicates the<br>direction of the edge relative to the curve. |
| int           |          | Index of the surface (1-based).                                                                                        |
| double        |          | Relative tolerance of the edge.                                                                                        |

## *FaceData*

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                               |
|---------------|----------|-------------------------------------------|
| int[2]        |          | The up and down domain index of the face. |
| int           |          | Surface index of the face (1-based).      |
| double        |          | Relative tolerance of the edge.           |

## **DESCRIPTION**

The Geom3 type represents a geometry object in 3D represented using the COMSOL kernel that is not an assembly and is not virtual. The geometry object must not be self-intersecting.

*GeomCurve*

#### **SUBTYPE OF**

Serializable

## **DESCRIPTION**

GeomCurve is the abstract base type for all curve types. It has no fields (except for the type ID from Serializable).

*GeomSurf*

## **SUBTYPE OF**

Serializable

## **DESCRIPTION**

GeomSurf is the abstract base type for all surface types. It has no fields (except for the type ID from Serializable).

*Mesh*

#### **CURRENT VERSION**

4

## **SUBTYPE OF**

Serializable

#### **FIELDS**

| ENTITY/OBJECT    | VARIABLE | DESCRIPTION                                                                     |
|------------------|----------|---------------------------------------------------------------------------------|
| integer          |          | Version.                                                                        |
| integer          | d        | Space dimension (if equal to 0 no more fields).                                 |
| integer          | np       | Number of mesh vertices.                                                        |
| integer          |          | Lowest mesh vertex index.                                                       |
| double[d][np]    | p        | Mesh points.                                                                    |
| integer          | nt       | Number of element types (equals the number of repeats of the following fields). |
| string           |          | Element type.                                                                   |
| integer          | nep      | Number of vertices per element.                                                 |
| integer          | ne       | Number of elements.                                                             |
| integer[ne][nep] | elem     | Matrix of point indices for each element.                                       |
| integer          | ndom     | Number of geometric entity values.                                              |
| integer[ndom]    | dom      | Vector of geometric entity labels for each element.                             |

## **DESCRIPTION**

The geometric entity numbering for points, edges, and boundaries must start from 0 and the geometric entity numbering for domains must start from 1 when defining a mesh through a COMSOL Multiphysics mesh file.

For information about the local mesh numbering for the mesh element type in COMSOL Multiphysics, see Mesh Element Numbering Conventions.

#### **EXAMPLE**

The following displays a mesh with triangular elements on a unit square. Neither point nor edge elements are present.

```
# Major & minor version
0 1
1 # number of tags
# Tags
5 mesh1
1 # number of types
# Types
3 obj
# --------- Object 0 ----------
0 0 1
4 Mesh # class
4 # version
2 # sdim
4 # number of mesh vertices
0 # lowest mesh vertex index
# Mesh vertex coordinates
0 1
0 0
1 1
1 0
1 # number of element types
# Type #0
3 tri # type name
3 # number of vertices per element
2 # number of elements
# Elements
0 1 2
3 2 1
2 # number of geometric entity indices
# Geometric entity indices
1
1
```

# *MeshCurve*

# **CURRENT VERSION**

1

## **SUBTYPE OF**

GeomCurve

| ENTITY/OBJECT   | VARIABLE | DESCRIPTION                                              |
|-----------------|----------|----------------------------------------------------------|
| integer         |          | Version.                                                 |
| integer         | d        | Space dimension.                                         |
| integer         | np       | Number of interpolation points.                          |
| double[np][d+1] | P        | Coordinates and parameters for each interpolation point. |
| BSplineCurve    |          | Interpolating curve.                                     |

In the matrix *P*, the first *d* values of each row are the coordinates for the point and the (*d*+1):th value is the parameter.

#### **DESCRIPTION**

A MeshCurve represents a cubic spline interpolation curve through given interpolation points. The corresponding parameter values are also given as an increasing sequence of numbers.

## **SEE ALSO**

BSplineCurve

*MeshSurf*

#### **CURRENT VERSIONS**

1

## **SUBCLASS OF**

GeomSurf

## **FIELDS**

| ENTITY/OBJECT   | VARIABLE | DESCRIPTION                                                     |
|-----------------|----------|-----------------------------------------------------------------|
| integer         |          | Version.                                                        |
| integer         | nv       | Number of mesh vertices.                                        |
| double[nv][5]   | p        | Coordinates and parameters for each mesh vertex.                |
| integer         | nt       | Number of mesh triangles.                                       |
| integers[nt][3] | elem     | Matrix of (0-based) mesh vertex indices for each mesh triangle. |

# **DESCRIPTION**

A MeshSurf represents a continuously differentiable surface formed by using piecewise quadratic interpolation on a surface mesh. The surface mesh is given by a set of mesh vertices and a matrix elem defining the triangle connectivity. The surface parameter values of each mesh vertex is also given. For each mesh triangle, a quadratic interpolation is used on each of the four subtriangles.

## **SEE ALSO**

Mesh

# *PolChain*

# **CURRENT VERSION**

1

#### **SUBTYPE OF**

GeomCurve

#### **FIELDS**

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                        |
|---------------|----------|------------------------------------|
| integer       |          | Version.                           |
| integer       | np       | Number of polygon points.          |
| double[np][2] | pol      | Coordinates of the polygon points. |

## **DESCRIPTION**

A PolChain represents a polygon in 2D with a parameter interval [*i*/(np-1), (*i*+1)/(np-1)] on the *i*th polygon segment. Using np > 2 is not recommended because it gives a curve with tangent discontinuities.

## **SEE ALSO**

MeshCurve

*Selection*

#### **CURRENT VERSION**

0

#### **SUBTYPE OF**

Serializable

#### **FIELDS**

| ENTITY/OBJECT | DESCRIPTION                                                                                                                       |  |  |
|---------------|-----------------------------------------------------------------------------------------------------------------------------------|--|--|
| integer       | Version.                                                                                                                          |  |  |
| string        | Selection label. The string is encoded in UTF-8.                                                                                  |  |  |
| string        | Tag of corresponding object (mesh) in file.                                                                                       |  |  |
| integer       | Dimension of selection (0: vertex; 1: edge; 2: face; 3: domain in 3D).                                                            |  |  |
| integer       | Number of entities.                                                                                                               |  |  |
| integer[]     | The indices of the entities for the selection. The integers specify the 0-based indices of the entities<br>(1-based for domains). |  |  |

# **DESCRIPTION**

Selections can appear in files containing a mesh. Each selection refers to a set of entities that needs to be defined by the mesh in the file.

## **EXAMPLE**

The following example displays a domain selection in 3D named Fluid, specifying domains 1 and 3:

```
0 # Version
5 Fluid # Label
5 mesh1 # Geometry/mesh tag
3 # Dimension
2 # Number of entities
# Entities
1
3
```

| ENTITY/OBJECT | VARIABLE | DESCRIPTION              |
|---------------|----------|--------------------------|
| String        |          | Type ID for the subtype. |

The subtypes have additional fields.

## **DESCRIPTION**

Serializable is the abstract base type for all other types.

*Straight*

#### **CURRENT VERSION**

1

#### **SUBTYPE OF**

GeomCurve

## **FIELDS**

| ENTITY/OBJECT | VARIABLE | DESCRIPTION                                                       |
|---------------|----------|-------------------------------------------------------------------|
| integer       |          | Version.                                                          |
| integer       | d        | Space dimension.                                                  |
| double[d]     | root     | The point on the line which corresponds to the parameter value 0. |
| double[d]     | dir      | The direction in vector of the line.                              |
| double        | pscale   | Parameter scale.                                                  |

# **DESCRIPTION**

This curve defines an infinite straight line in the two-dimensional or three-dimensional space. It is represented by a point and a unit vector specifying the direction. A straight also has a scale factor for the parameterization, so that the parameter values can be made invariant under transformation.

A straight line is an open curve that is not periodic. It is parameterized as:

```
pos = root + u*pscale*dir
```

where u is the parameter.

*Transform*

# **CURRENT VERSION**

0

| ENTITY/OBJECT     | VARIABLE | DESCRIPTION                                                                                                  |  |
|-------------------|----------|--------------------------------------------------------------------------------------------------------------|--|
| integer           |          | Version.                                                                                                     |  |
| integer           | d        | Space dimension.                                                                                             |  |
| Boolean           |          | I if transformation is a unit transformation; 0 otherwise. If the value is $I$ , no more fields are present. |  |
| double [d+1][d+1] | M        | Values in transformation matrix.                                                                             |  |
| Boolean           |          | I if determinant is positive; 0 otherwise.                                                                   |  |
| Boolean           |          | I if matrix is isotropic; 0 otherwise.                                                                       |  |

## DESCRIPTION

The transformation class is defined by the transformation matrix, which operates as a premultiplier on column vectors containing homogeneous coordinates thus

$$\begin{bmatrix} x' \ y' \ z' \ s' \end{bmatrix} = M \cdot \begin{bmatrix} x \ y \ z \ s \end{bmatrix}'$$

where the conventional 3D coordinates are

$$\frac{x}{s} \frac{y}{s} \frac{z}{s}$$

The matrix thus consists of

$$\left[\begin{array}{ccc} T_x \ \mathbf{R} & T_y \ T_z \ 0 \ 0 \ 0 & S \end{array}\right]$$

where **R** is a nonsingular transformation matrix, containing the rotation, reflection, nonuniform scaling, and shearing components; T is a translation vector; and S is a global scaling factor greater than zero.

# Example of the Serialization Format

To illustrate the use of the serialization format, the following example shows how to create a planar surface object with one face:

## A PLANAR SURFACE OBJECT WITH ONE FACE

```
# Major & minor version
1 # number of tags
# Tags
3 fin
1 # number of types
# Types
3 obj
# ----- Object 0 -----
0 0 1
5 Geom3 # class
3 # version
```

```
2 # type
1 # voidsLabeled
1e-10 # gtol
0.0001 # resTol
4 # number of vertices
# Vertices
# X Y Z dom tol
0 0 0 -1 NAN
0 1 0 -1 NAN
2 0 0 -1 NAN
2 1 0 -1 NAN
4 # number of parameter vertices
# Parameter vertices
# vtx s t fac surf tol
1 0.25 0.25 -1 1 NAN
2 0.25 0.375 -1 1 NAN
3 0.5 0.25 -1 1 NAN
4 0.5 0.375 -1 1 NAN
4 # number of edges
# Edges
# vtx1 vtx2 s1 s2 dom curve tol
2 1 1 0 -1 -4 NAN
1 3 1 0 -1 -1 NAN
4 2 1 0 -1 -3 NAN
3 4 1 0 -1 -2 NAN
4 # number of parameter edges
# Parameter edges
# edg v1 v2 s1 s2 up down pcurve surf tol
1 2 1 0 1 1 0 1 1 NAN
2 1 3 0 1 1 0 2 1 NAN
3 4 2 0 1 1 0 3 1 NAN
4 3 4 0 1 1 0 4 1 NAN
1 # number of faces
# Faces
# up down surf tol
0 0 1 NAN
4 # number of curves
# Curves
# Curve 1
11 BezierCurve # class
1 # version
3 # sdim
0 # rational?
1 # degree
# control points
2 0 0
0 0 0
# Curve 2
11 BezierCurve # class
1 # version
3 # sdim
0 # rational?
1 # degree
# control points
2 1 0
2 0 0
```

```
# Curve 3
11 BezierCurve # class
1 # version
3 # sdim
0 # rational?
1 # degree
# control points
0 1 0
2 1 0
# Curve 4
11 BezierCurve # class
1 # version
3 # sdim
0 # rational?
1 # degree
# control points
0 0 0
0 1 0
1 # number of surfaces
# Surfaces
# Surface 1
9 BezierTri # class
1 # version
# control points
-2 -2 0
6 -2 0
-2 6 0
4 # number of parameter curves
# Parameter curves
# Parameter curve 1
11 BezierCurve # class
1 # version
2 # sdim
0 # rational?
1 # degree
# control points
0.25 0.375
0.25 0.25
# Parameter curve 2
11 BezierCurve # class
1 # version
2 # sdim
0 # rational?
1 # degree
# control points
0.25 0.25
0.5 0.25
# Parameter curve 3
11 BezierCurve # class
1 # version
2 # sdim
0 # rational?
1 # degree
# control points
0.5 0.375
```

0.25 0.375

- # Parameter curve 4
- 11 BezierCurve # class
- 1 # version
- 2 # sdim
- 0 # rational?
- 1 # degree
- # control points
- 0.5 0.25
- 0.5 0.375
- # Attributes
- 0 # nof attributes