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

