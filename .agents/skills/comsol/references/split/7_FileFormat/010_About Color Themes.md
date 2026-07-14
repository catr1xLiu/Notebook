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

