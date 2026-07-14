# *Wave*

Use a *wave* function to generate a wave-shaped function (waveform). The wave shape can be a sawtooth, sine wave, square wave, or triangle wave.

TABLE 2-90: WAVE PROPERTIES.

| NAME      | VALUE  | DEFAULT | DESCRIPTION                                                  |
|-----------|--------|---------|--------------------------------------------------------------|
| amplitude | String | 1       | The amplitude for the function.                              |
| baseline  | String | 0       | The baseline for the function.                               |
| delay     | String | 2*2*pi  | The delay in the modulation, if modul is set to<br>gaussian. |

TABLE 2-90: WAVE PROPERTIES.

| NAME       | VALUE                                  | DEFAULT      | DESCRIPTION                                                                                                                                                                                                                                                   |
|------------|----------------------------------------|--------------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| dutycycle  | String                                 | 0.5          | The duty cycle of the function (a value between 0 and<br>1). Available for Square functions (as the fraction of a<br>period that the function has the high value) and for<br>Triangle functions (as the fraction of a period that the<br>function is rising). |
| funcname   | String                                 | The tag name | The name of the function.                                                                                                                                                                                                                                     |
| modul      | none   gaussian                        | none         | No modulation or Gaussian modulation, if type is<br>set to sine.                                                                                                                                                                                              |
| ncontder   | 1 or 2                                 | 2            | The number of continuous derivatives if smoothing is<br>enabled.                                                                                                                                                                                              |
| period     | String                                 | 2*pi         | The period.                                                                                                                                                                                                                                                   |
| phase      | String                                 | 0            | The phase.                                                                                                                                                                                                                                                    |
| sigma      | String                                 | 0.5/(2*pi)   | The standard deviation for the modulation, if modul<br>is set to gaussian.                                                                                                                                                                                    |
| smooth     | boolean                                | true         | Smooth the transitions. (Only used for wave forms<br>with discontinuous function values or derivatives.)                                                                                                                                                      |
| smoothzone | String                                 | 0.1          | The size of smoothing zone on both sides of the<br>transitions.                                                                                                                                                                                               |
| type       | sawtooth   sine  <br>square   triangle | sine         | The type of waveform.                                                                                                                                                                                                                                         |

*NormalDistribution*

Generate a *normal distribution* function.

TABLE 2-91: NORMAL DISTRIBUTION PROPERTIES.

| NAME           | VALUE               | DEFAULT                    | DESCRIPTION                                     |
|----------------|---------------------|----------------------------|-------------------------------------------------|
| cumfuncname    | String              | The tag name +<br>_cum     | The name of the cumulative function.            |
| funcname       | String              | The tag name               | The name of the function.                       |
| invcumfuncname | String              | The tag name +<br>_cum_inv | The name of the quantile function.              |
| mean           | double              | 0                          | The mean of the function.                       |
| nargs          | positive<br>integer | 1                          | The number of arguments to the random function. |
| randomname     | String              | rn_ + the tag<br>name      | The name of the random function.                |
| seed           | positive<br>integer |                            | A seed for the random function.                 |
| seedactive     | boolean             | false                      | Use a custom random seed?                       |
| sigma          | double              | 1                          | The standard deviation of the function.         |

#### *Random*

Generate a *random* function. The random function can have a uniform or normal distribution.

TABLE 2-92: RANDOM PROPERTIES.

| NAME     | VALUE   | DEFAULT      | DESCRIPTION               |
|----------|---------|--------------|---------------------------|
| funcname | String  | The tag name | The name of the function. |
| mean     | String  | 0            | The average value.        |
| nargs    | integer | 1            | The number of arguments.  |

TABLE 2-92: RANDOM PROPERTIES.

| NAME         | VALUE                   | DEFAULT                            | DESCRIPTION                                  |
|--------------|-------------------------|------------------------------------|----------------------------------------------|
| normalsigma  | String                  | 1                                  | The standard deviation if type is Normal.    |
| seed         | String                  | Unique for each<br>random function | Random seed, if seedtype is set to manual.   |
| seedactive   | boolean                 | false                              | If true, the random seed will be used.       |
| seedtype     | manual  <br>currenttime | manual                             | The random seed type, if seedactive is true. |
| type         | uniform  <br>normal     | uniform                            | The distribution type.                       |
| uniformrange | String                  | 1                                  | The range if type is Uniform.                |

## *External*

Generate an *external* function that interfaces to other external functions written in the C language.

TABLE 2-93: EXTERNAL PROPERTIES.

| NAME  | VALUE            | DEFAULT | DESCRIPTION                                                                      |
|-------|------------------|---------|----------------------------------------------------------------------------------|
| ders  | Nx3 string array |         | (function name, argument, partial derivative) triplets.                          |
| funcs | String array     |         | The functions defined by the library.                                            |
| init  | String           |         | The string that is sent to the library when the function feature is initialized. |
| path  | String           |         | The path to the shared library that defines the functions.                       |

An external function is a function defined in a shared library written by the user. The shared library must define the following three functions with C linkage:

- **•** int init(const char \*str) is called when the function is initialized with the string from the **Initialization data** field. It returns a nonzero value in case of success and zero in case of failure. This function might be called several times; it is always called before solving a model that uses the function.
- **•** int eval(const char \*func, int nArgs, const double \*\*inReal, const double \*\*inImag, int blockSize, double \*outReal, double \*outImag) is called for elementwise evaluation of the function func called with nArgs arguments of length blockSize. The array inReal contains the real parts of the arguments; it has length nArgs, and each element has length blockSize.
  - If the arguments are all-real, then inImag is null; otherwise, it contains the imaginary parts of the arguments. If the function evaluation is successful, 1 is returned if it resulted in an all-real array and 2 is returned if it resulted in a complex array. The function should return 0 in case of error. In case of a real result, the function values should be written to the array outReal. In case of a complex result, the real parts of the function should be written to outReal and the imaginary parts to outImag. The outReal and outImag arrays both have length blockSize. All matrices are allocated and deallocated by COMSOL.
- **•** const char \*getLastError() returns the last error that has occurred. A null or empty string is returned if no error has occurred. Calling init() or eval() must set the last error string to "" or null. All memory allocation of this string is handled by the shared library. There is no localization of the error messages.

If you are using Microsoft Visual Studio to compile your library, you can declare the functions as \_\_declspec(dllexport) to export them from the DLL.

An example of a library that defines a function called extsinc that computes the sinc function (sin(*x*)/*x*):

```
#include <math.h>
#include <stdlib.h>
#include <string.h>
#ifdef _MSC_VER
#define EXPORT __declspec(dllexport)
#else
```

```
#define EXPORT
#endif
static const char *error = NULL;
EXPORT int init(const char *str) {
  return 1;
}
EXPORT const char * getLastError() {
  return error;
}
EXPORT int eval(const char *func,
                               int nArgs,
                               const double **inReal,
                               const double **inImag,
                               int blockSize,
                               double *outReal,
                               double *outImag) {
  if (strcmp("extsinc", func) == 0) {
    if (nArgs != 1) {
      error = "One argument expected";
      return 0;
    }
    for (int i = 0; i < blockSize; i++) {
      double x = inReal[0][i];
      outReal[i] = (x == 0) ? 1 : sin(x) / x;
    }
    return 1;
  }
  else {
    error = "Unknown function";
    return 0;
  }
}
```

To compile this function into a library, place it in ext.c and proceed as follows depending on platform:

![](_page_91_Picture_2.jpeg)

See <https://www.comsol.com/system-requirements>for information about supported compiler versions.

- **•** 64-bit Windows with Microsoft Visual Studio:
  - **-** Start Microsoft Visual Studio > Visual Studio Tools > Visual Studio x64 Win64 Command Prompt (2010) from the Windows Start Menu.
  - **-** cd to the directory that contains ext.c.
  - **-** cl /MT /c ext.c
  - **-** link /OUT:ext.dll /DLL ext.obj
- **•** 64-bit Linux with Intel Compiler:
  - **-** cd to the directory that contains ext.c.
  - **-** icc -fPIC -c ext.c
  - **-** icc -shared -fPIC -Wl,-z -Wl,defs -o ext.so ext.o -ldl

- **•** 64-bit Mac with Intel Compiler:
  - **-** cd to the directory that contains ext.c.
  - **-** icc -fPIC -c ext.c
  - **-** icc -dynamiclib -fPIC -o ext.dylib ext.o

For other compilers, refer to the compiler's documentation for instructions how to compile and create a shared library.

## *MATLAB*

Declare use of function in *MATLAB*. This requires the LiveLink™ *for* MATLAB®.

TABLE 2-94: MATLAB PROPERTIES.

| NAME  | VALUE            | DEFAULT | DESCRIPTION                                             |
|-------|------------------|---------|---------------------------------------------------------|
| ders  | Nx3 string array |         | (function name, argument, partial derivative) triplets. |
| funcs | String array     |         | The functions defined by MATLAB.                        |

#### *Elevation*

Generate an *elevation* function by importing geospatial elevation data from digital elevation models (DEM files).

TABLE 2-95: ELEVATION PROPERTIES.

| NAME        | VALUE                                | DEFAULT      | DESCRIPTION                                 |
|-------------|--------------------------------------|--------------|---------------------------------------------|
| extrap      | const   interior  <br>linear   value | const        | The extrapolation method.                   |
| extrapvalue | double                               | 0            | The extrapolation value if extrap is value. |
| filename    | String                               |              | The name of the DEM file.                   |
| funcname    | String                               | The tag name | The name of the function.                   |
| interp      | neighbor   linear                    | linear       | The interpolation method.                   |

#### *Image*

Generate an *image* function from a BMP, GIF, JPEG, PNG, or TIFF file.

TABLE 2-96: IMAGE PROPERTIES.

| NAME        | VALUE                                | DEFAULT | DESCRIPTION                                                                                     |
|-------------|--------------------------------------|---------|-------------------------------------------------------------------------------------------------|
| argunit     | String                               |         | The unit of the function arguments.                                                             |
| clipmaxx    | double                               | 1000    | If clipping is manual: The maximum pixel x-coordinate<br>that is kept.                          |
| clipminx    | double                               | 0       | If clipping is manual: The minimum pixel x-coordinate<br>that is kept.                          |
| clipmaxy    | double                               | 1000    | If clipping is manual: The maximum pixel y-coordinate<br>that is kept.                          |
| clipminy    | double                               | 0       | If clipping is manual: The minimum pixel y-coordinate<br>that is kept.                          |
| clipping    | none   manual                        | none    | The clipping method.                                                                            |
| extrap      | const   interior  <br>linear   value | const   | The extrapolation method.                                                                       |
| extrapvalue | double                               | 0       | The extrapolation value if extrap is value.                                                     |
| fununit     | String                               |         | The unit of the function value.                                                                 |
| filename    | String                               |         | The name of the DEM file.                                                                       |
| flipx       | boolean                              | false   | If inplace is false: Whether to flip the image horizontally<br>when mapping it to the xy-plane. |

TABLE 2-96: IMAGE PROPERTIES.

| NAME       | VALUE              | DEFAULT      | DESCRIPTION                                                                                                                    |
|------------|--------------------|--------------|--------------------------------------------------------------------------------------------------------------------------------|
| flipy      | boolean            | false        | If inplace is false: Whether to flip the image vertically<br>when mapping it to the xy-plane.                                  |
| funcname   | String             | The tag name | The name of the function.                                                                                                      |
| inplace    | boolean            | false        | If true, the image is mapped to the xy-plane without<br>scaling; 1 length unit corresponds to 1 pixel.                         |
| interp     | neighbor   linear  | linear       | The interpolation method.                                                                                                      |
| manualexpr | String             | (r+g+b)/3    | If scaling is manual: The scaling function expressed in<br>terms of the red (r), green (g), and blue (b) pixel<br>intensities. |
| scaling    | automatic   manual | automatic    | The method used for computing function values from<br>pixel colors.                                                            |
| xmax       | double             | 1            | If inplace is false: The maximum x-coordinate of the<br>region to which the image is mapped.                                   |
| xmin       | double             | 0            | If inplace is false: The minimum x-coordinate of the<br>region to which the image is mapped.                                   |
| ymax       | double             | 1            | If inplace is false: The maximum y-coordinate of the<br>region to which the image is mapped.                                   |
| ymin       | double             | 0            | If inplace is false: The minimum y-coordinate of the<br>region to which the image is mapped.                                   |

#### *LeastSquares*

Create a function based on a least-squares fit of the function's input data to a parameterized function.

TABLE 2-97: LEAST SQUARES PROPERTIES.

| NAME        | VALUE         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                           |
|-------------|---------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| args        | string array  | {}      | The argument names for the defined<br>function(s), as an array of alternating column<br>names from the input data and argument<br>names. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array. |
| columnType  | string array  | {}      | Defines the types of columns in the input<br>data, as an array of alternative column<br>names and column types. Valid column types<br>are none, arg, and value. See also the<br>description of the args property.                                     |
| dseparator  | point   comma | point   | Decimal separator in input data file, when<br>source is set to file.                                                                                                                                                                                  |
| exprs       | string array  | {}      | The expression for the defined function(s),<br>as an array of alternating column names<br>from the input data and expressions. Using<br>the setEntry, getEntryKeys,<br>getEntryKeyIndex methods makes it<br>easier to work with this array.           |
| filecolumns | integer       | 0       | Number of columns in the input data. This<br>property is updated automatically when<br>input data properties are changed.                                                                                                                             |

TABLE 2-97: LEAST SQUARES PROPERTIES.

| NAME        | VALUE                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                   |
|-------------|-------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| fileheaders | string array                  | {}      | Custom column names to be displayed in<br>the column settings table. This property is<br>updated automatically when file input data<br>properties are changed. Column header<br>names are taken from the last line in the file<br>that starts with a '%' character. The line is<br>split on "<br>" (double space), tab character,<br>and comma character, and each part is used<br>as one custom column name. |
| filename    | string                        |         | The file that contains the data if source is<br>file.                                                                                                                                                                                                                                                                                                                                                         |
| lbound      | double                        |         | The lower bound for parameters, if used.<br>Set using setIndex.                                                                                                                                                                                                                                                                                                                                               |
| ubound      | double                        |         | The upper bound for parameters, if used.<br>Set using setIndex.                                                                                                                                                                                                                                                                                                                                               |
| unit        | string array                  | {}      | The units for the arguments and function<br>values, as an array of alternating column<br>names from the input data and unit<br>expressions. See also the description of the<br>args property.                                                                                                                                                                                                                 |
| pname       | string                        |         | Parameter name, set using setIndex.                                                                                                                                                                                                                                                                                                                                                                           |
| plist       | double                        |         | Parameter value, set using setIndex.                                                                                                                                                                                                                                                                                                                                                                          |
| resultTable | string                        |         | The results table that contains the data if<br>source is resultTable.                                                                                                                                                                                                                                                                                                                                         |
| scale       | double                        | 1       | Scale for parameters, set using setIndex.                                                                                                                                                                                                                                                                                                                                                                     |
| source      | file   table  <br>resultTable | file    | Specifies whether the data is read from a<br>file, specified in a table, or taken from a<br>results table.                                                                                                                                                                                                                                                                                                    |
| table       | Nx2 String<br>array           | Empty   | Contains the argument/function value pairs<br>if the source is table.                                                                                                                                                                                                                                                                                                                                         |
| unit        | string array                  | {}      | The units for the arguments and function<br>values, as an array of alternating column<br>names from the input data and unit<br>expressions. See also the description of the<br>args property.                                                                                                                                                                                                                 |

## *GaussianProcess*

Generate a Gaussian process regression (Kriging) function. Creating or training a Gaussian process function requires the Uncertainty Quantification Module. Using an already created and trained Gaussian process function does not require the Uncertainty Quantification Module.

TABLE 2-98: GAUSSIAN PROCESS PROPERTIES.

| NAME         | VALUE                               | DEFAULT  | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                   |
|--------------|-------------------------------------|----------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| args         | string array                        | {}       | The argument names for the defined<br>function(s), as an array of alternating column<br>names from the input data and argument<br>names. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array.                                                                                                                                                         |
| columnType   | string array                        | {}       | Defines the types of columns in the input<br>data, as an array of alternative column<br>names and column types. Valid column types<br>are none, arg, and value. See also the<br>description of the args property.                                                                                                                                                                                             |
| covfunction  | se   matern32<br>  matern52  <br>nn | matern32 | Type of covariance function to use in the<br>Gaussian process regression. Use se for<br>Squared exponential, matern32 for Matérn<br>3/2, matern52 for Matérn 5/2 and nn for<br>Single-layer neural network.                                                                                                                                                                                                   |
| definestddev | boolean                             | false    | If true, the related error estimation<br>function(s) are made available.                                                                                                                                                                                                                                                                                                                                      |
| descr        | string array                        | {}       | The description for each function argument<br>and function value, as an array of alternating<br>function arguments or values and their<br>descriptions. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array.                                                                                                                                          |
| dseparator   | point   comma                       | point    | Decimal separator in input data file, when<br>source is set to file.                                                                                                                                                                                                                                                                                                                                          |
| filecolumns  | integer                             | 0        | Number of columns in the input data. This<br>property is updated automatically when<br>input data properties are changed.                                                                                                                                                                                                                                                                                     |
| fileheaders  | string array                        | {}       | Custom column names to be displayed in<br>the column settings table. This property is<br>updated automatically when file input data<br>properties are changed. Column header<br>names are taken from the last line in the file<br>that starts with a '%' character. The line is<br>split on "<br>" (double space), tab character,<br>and comma character, and each part is used<br>as one custom column name. |
| filename     | string                              |          | The file that contains the data if source is<br>file.                                                                                                                                                                                                                                                                                                                                                         |
| fraction     | double                              | 0.1      | The fraction of input data to set aside for<br>validation of the trained function(s). Used<br>when validation is one of random,<br>fraction, last.                                                                                                                                                                                                                                                            |

TABLE 2-98: GAUSSIAN PROCESS PROPERTIES.

| NAME                       | VALUE                            | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                    |
|----------------------------|----------------------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| funcs                      | string array                     | {}        | The names of the defined function(s), as an<br>array of alternating column names from the<br>input data and function names. See also the<br>description of the args property.                                                                                                                                                                                                                                  |
| ignorenaninf               | boolean                          | false     | If true, causes lines in the training data that<br>contain any NaN or Inf values to be ignored.<br>If false, NaN and Inf values are treated as<br>an error.                                                                                                                                                                                                                                                    |
| lastinternalseed           | nonnegative<br>integer           | 1014      | Random number seed used for training the<br>function(s). Used when useseed is manual.                                                                                                                                                                                                                                                                                                                          |
| lastinternalseedtest       | nonnegative<br>integer           | 108714    | Random number seed used for validation of<br>the trained function(s). Used when<br>validation is random and useseedtest<br>is manual.                                                                                                                                                                                                                                                                          |
| manualrestarthypergpnumber | positive integer                 | 10        | Number of restart points for training. Use<br>more restart points to increase the chance<br>to find the global optimum during training.<br>Used when restarthypergp is manual.                                                                                                                                                                                                                                 |
| maxmatsize                 | positive integer                 | 2000      | Maximum number of allowed training data<br>points. More data points require more<br>memory and longer training time.                                                                                                                                                                                                                                                                                           |
| meanfunction               | const  <br>linear  <br>quadratic | const     | Defines the overall trend of the trained<br>function(s).                                                                                                                                                                                                                                                                                                                                                       |
| plotargs                   | N-by-3 array                     |           | Contains one row for each function<br>argument. Each row contains the argument<br>name, the lower limit for plotting, and the<br>upper limit for plotting.                                                                                                                                                                                                                                                     |
| plotaxis                   | boolean array                    | {}        | Contains one value for each function<br>argument. A false value means that the<br>corresponding function argument will be<br>constant when plotting. The constant value<br>is taken from the lower limit value in the<br>plotargs property. Constant arguments<br>do no use an axis in the plot. Up to 3 axes<br>are supported when plotting. Specify using<br>setIndex("plotaxis", false, 2), for<br>example. |
| plotfixedvalue             | double array                     | {}        | Contains one value for each function<br>argument. For arguments that do not have<br>an axis in the plot (see plotaxis), this<br>property specifies the fixed value to use in<br>the plot.                                                                                                                                                                                                                      |
| plotfuncname               | string                           |           | The name of the function whose value<br>should be plotted.                                                                                                                                                                                                                                                                                                                                                     |
| restarthypergp             | automatic  <br>manual            | automatic | Controls how the number of restart points<br>during training is determined. If automatic,<br>the number is calculated from the number<br>of function arguments. If manual, the<br>number is given by the<br>manualrestarthypergpnumber property.                                                                                                                                                               |

TABLE 2-98: GAUSSIAN PROCESS PROPERTIES.

| NAME           | VALUE                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                 |
|----------------|-------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| resultTable    | string                        |         | The results table that contains the data if<br>source is resultTable.                                                                                                                                                                                                       |
| source         | file  <br>resultTable         | file    | Specifies whether the data is read from a file<br>or taken from a results table.                                                                                                                                                                                            |
| stddevsuffix   | string                        | _stddev | Function name suffix to add to error<br>estimation functions. Used when<br>definestddev is true.                                                                                                                                                                            |
| testerrortable | none   new  <br>results table | none    | If validation is not none, specifies the<br>table where verification error summary is<br>stored. Use none to not generate the table<br>data. Use new to create a new table for the<br>data. Use a results table tag to store the<br>data in an existing table.              |
| testtable      | none   new  <br>results table | new     | If validation is not none, specifies the<br>table where detailed verification error<br>information is stored. Use none to not<br>generate the table data. Use new to create a<br>new table for the data. Use a results table<br>tag to store the data in an existing table. |
| unit           | string array                  | {}      | The units for the arguments and function<br>values, as an array of alternating column<br>names from the input data and unit<br>expressions. See also the description of the<br>args property.                                                                               |
| useseed        | manual  <br>currenttime       | manual  | Specifies how the random seed for training<br>is determined. If manual, the seed is given<br>by the lastinternalseed property. If<br>currenttime, the seed is computed from<br>the current time when training is started.                                                   |
| useseedtest    | manual  <br>currenttime       | manual  | Specifies how the random seed for<br>validation is determined. If manual, the<br>seed is given by the<br>lastinternalseedtest property. If<br>currenttime, the seed is computed from<br>the current time when training is started.                                          |

TABLE 2-98: GAUSSIAN PROCESS PROPERTIES.

| NAME            | VALUE                                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                          |
|-----------------|-----------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| validation      | none   random<br>  fraction  <br>last   table | none    | Specifies what data to use for validation of<br>the trained function(s).<br>none: No validation is performed.<br>random: Use a random sample of the input<br>data and exclude the corresponding values<br>from the training data. The size of the<br>sample is fraction times the number of<br>input data points.<br>fraction: Use every 1/fraction values<br>from the input data and exclude the<br>corresponding values from the training data.<br>last: Use the last part of the input data and<br>exclude the corresponding values from the<br>training data. The size of the last part is<br>fraction times the number of input data<br>points. |
|                 |                                               |         | table: Use a results table as validation data.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       |
| validationtable | string                                        |         | The results table to take validation data<br>from. Used when validation is table.                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |

Changes in the following properties take effect without retraining the function: definestddev, stddevsuffix, funcs, plotargs, and unit.

The *Uncertainty Quantification Module User's Guide* explains the theory behind Gaussian process regression. See Surrogate Models — Gaussian Process.

#### *PolynomialChaosExpansion*

Generate a *polynomial chaos expansion (PCE)* function. Creating or training a PCE function requires the Uncertainty Quantification Module. Using an already created and trained PCE function does not require the Uncertainty Quantification Module.

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME       | VALUE        | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                          |
|------------|--------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| args       | string array | {}      | The argument names for the defined<br>function(s), as an array of alternating column<br>names from the input data and argument<br>names. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array.                |
| columnType | string array | {}      | Defines the types of columns in the input<br>data, as an array of alternative column<br>names and column types. Valid column types<br>are none, arg, and value. See also the<br>description of the args property.                                                    |
| descr      | string array | {}      | The description for each function argument<br>and function value, as an array of alternating<br>function arguments or values and their<br>descriptions. Using the setEntry,<br>getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this<br>array. |

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME                  | VALUE                  | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                 |
|-----------------------|------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| distributionselection | string array           | {}      | Defines the probability distributions for the<br>function arguments, as an array of<br>alternative column names and distribution<br>types. Valid distribution types are uniform,<br>normal, lognormal, gamma, beta,<br>weibull, and gumbel. See also the<br>description of the args property.                                                                                                               |
| dseparator            | point   comma          | point   | Decimal separator in input data file, when<br>source is set to file.                                                                                                                                                                                                                                                                                                                                        |
| filecolumns           | integer                | 0       | Number of columns in the input data. This<br>property is updated automatically when<br>input data properties are changed.                                                                                                                                                                                                                                                                                   |
| fileheaders           | string array           | {}      | Custom column names to be displayed in<br>the column settings table. This property is<br>updated automatically when file input data<br>properties are changed. Column header<br>names are taken from the last line in the file<br>that starts with a '%' character. The line is<br>split on "<br>" (double space), tab character<br>and comma character and each part is used<br>as one custom column name. |
| filename              | string                 |         | The file that contains the data if source is<br>file.                                                                                                                                                                                                                                                                                                                                                       |
| fraction              | double                 | 0.1     | The fraction of input data to set aside for<br>validation of the trained function(s). Used<br>when validation is one of random,<br>fraction, last.                                                                                                                                                                                                                                                          |
| funcs                 | string array           | {}      | The names of the defined function(s), as an<br>array of alternating column names from the<br>input data and function names. See also the<br>description of the args property.                                                                                                                                                                                                                               |
| ignorenaninf          | boolean                | false   | If true, causes lines in the training data that<br>contain any NaN or Inf values to be ignored.<br>If false, NaN and Inf values are treated as<br>an error.                                                                                                                                                                                                                                                 |
| lastinternalseedtest  | nonnegative<br>integer | 108714  | Random number seed used for validation of<br>the trained function(s). Used when<br>validation is random and useseedtest<br>is manual.                                                                                                                                                                                                                                                                       |
| lboundselection       | string array           | {}      | Defines how the lower bounds of the valid<br>range for the function arguments are<br>determined, as an array of alternative<br>column names and CDF (cumulative<br>distribution function) values. Valid CDF<br>values are 0.3, 0.1, 0.01, 0.001, 1e-4,<br>1e-5, 1e-6, 1e-7, and manual. Not used if<br>distributionselection is uniform or<br>beta. See also the description of the args<br>property.       |
| maxmatsize            | positive integer       | 2000    | Maximum number of allowed training data<br>points. More data points require more<br>memory and longer training time.                                                                                                                                                                                                                                                                                        |

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME           | VALUE               | DEFAULT   | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                    |
|----------------|---------------------|-----------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| outofrange     | warning  <br>cancel | warning   | Decides how to handle out-of-range and<br>extrapolated training data. If outofrange is<br>cancel, the training is canceled. If<br>outofrange is warning, the training<br>continues, but a warning is added under the<br>function feature. In either case, details about<br>the problematic training data points are<br>logged in the log window.                                                               |
| pcesettings    | auto   manual       | automatic | If pcesettings is set to auto, the training<br>will automatically determine the required<br>polynomial degree needed to obtain suitable<br>accuracy. If pcesettings is set to manual,<br>the maximum polynomial degree is<br>determined by the polydegreespce and<br>qnorm settings.                                                                                                                           |
| plotargs       | N-by-3 array        |           | Contains one row for each function<br>argument. Each row contains the argument<br>name, the lower limit for plotting, and the<br>upper limit for plotting.                                                                                                                                                                                                                                                     |
| plotaxis       | boolean array       | {}        | Contains one value for each function<br>argument. A false value means that the<br>corresponding function argument will be<br>constant when plotting. The constant value<br>is taken from the lower limit value in the<br>plotargs property. Constant arguments<br>do no use an axis in the plot. Up to 3 axes<br>are supported when plotting. Specify using<br>setIndex("plotaxis", false, 2), for<br>example. |
| plotfixedvalue | double array        | {}        | Contains one value for each function<br>argument. For arguments that do not have<br>an axis in the plot (see plotaxis), this<br>property specifies the fixed value to use in<br>the plot.                                                                                                                                                                                                                      |
| plotfuncname   | string              |           | The name of the function whose value<br>should be plotted.                                                                                                                                                                                                                                                                                                                                                     |
| polydegreespce | positive integer    | 30        | The maximum polynomial degree to use<br>when pcesettings is set to manual. See<br>also the Uncertainty Quantification Module<br>User's Guide.                                                                                                                                                                                                                                                                  |
| qnorm          | double              | 0.5       | Controls the hyperbolic truncation of<br>polynomial terms used for functions having<br>more than one argument. Only used when<br>pcesettings is set to manual. See also<br>the Uncertainty Quantification Module<br>User's Guide.                                                                                                                                                                              |
| s1selection    | string array        | {}        | Defines the first probability distribution<br>parameter for the function arguments as an<br>array of alternative column names and<br>distribution parameters. Not used if<br>distributionselection is set to<br>uniform. See also the description of the<br>args property.                                                                                                                                     |

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME            | VALUE                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                         |
|-----------------|-------------------------------|---------|---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| s2selection     | string array                  | {}      | Defines the second probability distribution<br>parameter for the function arguments as an<br>array of alternative column names and<br>distribution parameters. Not used if<br>distributionselection is set to<br>uniform. See also the description of the<br>args property.                                                                                                                                         |
| source          | file  <br>resultTable         | file    | Specifies whether the data is read from a file<br>or taken from a results table.                                                                                                                                                                                                                                                                                                                                    |
| surrogatetol    | double                        | 1e-3    | The tolerance used when deciding the<br>required polynomial degree of the trained<br>function. See also the Uncertainty<br>Quantification Module User's Guide.                                                                                                                                                                                                                                                      |
| testerrortable  | none   new  <br>results table | none    | If validation is not none, specifies the<br>table where verification error summary is<br>stored. Use none to not generate the table<br>data. Use new to create a new table for the<br>data. Use a results table tag to store the<br>data in an existing table.                                                                                                                                                      |
| testtable       | none   new  <br>results table | new     | If validation is not none, specifies the<br>table where detailed verification error<br>information is stored. Use none to not<br>generate the table data. Use new to create a<br>new table for the data. Use a results table<br>tag to store the data in an existing table.                                                                                                                                         |
| uboundselection | string array                  | {}      | Defines the upper bound of the valid input<br>range for the function arguments as an array<br>of alternative column names and upper<br>bounds. Only relevant if<br>distributionselection is set to<br>uniform or beta, or if ucdfselection is<br>set to manual. See also the description of<br>the args property.                                                                                                   |
| ucdfselection   | string array                  | {}      | Defines how the upper bounds of the valid<br>range for the function arguments are<br>determined as an array of alternative<br>column names and CDF (cumulative<br>distribution function) values. Valid CDF<br>values are 0.7, 0.9, 0.99, 0.999, 1-1e-4,<br>1-1e-5, 1-1e-6, 1-1e-7, and manual.<br>Not used if distributionselection is<br>set to uniform or beta. See also the<br>description of the args property. |
| unit            | string array                  | {}      | The units for the arguments and function<br>values, as an array of alternating column<br>names from the input data and unit<br>expressions. See also the description of the<br>args property.                                                                                                                                                                                                                       |

TABLE 2-99: POLYNOMIAL CHAOS EXPANSION PROPERTIES.

| NAME            | VALUE                       | DEFAULT | DESCRIPTION                                                                                                                                                                                                                        |
|-----------------|-----------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| useseedtest     | manual  <br>currenttime     | manual  | Specifies how the random seed for<br>validation is determined. If manual, the<br>seed is given by the<br>lastinternalseedtest property. If<br>currenttime, the seed is computed from<br>the current time when training is started. |
| validation      | none   random<br>  fraction | none    | Specifies what data to use for validation of<br>the trained function(s).                                                                                                                                                           |
|                 | last   table                |         | none: No validation is performed.                                                                                                                                                                                                  |
|                 |                             |         | random: Use a random sample of the input<br>data and exclude the corresponding values<br>from the training data. The size of the<br>sample is fraction times the number of<br>input data points.                                   |
|                 |                             |         | fraction: Use every 1/fraction values<br>from the input data and exclude the<br>corresponding values from the training data.                                                                                                       |
|                 |                             |         | last: Use the last part of the input data and<br>exclude the corresponding values from the<br>training data. The size of the last part is<br>fraction times the number of input data<br>points.                                    |
|                 |                             |         | table: Use a results table as validation data.                                                                                                                                                                                     |
| validationtable | string                      |         | The results table to take validation data<br>from. Used when validation is table.                                                                                                                                                  |

Changes in the following properties take effect without retraining the function: funcs, plotargs, unit.

The *Uncertainty Quantification Module User's Guide* explains the theory behind PCE. See Surrogate Models — Polynomial Chaos Expansion.

## *DNN*

Generate a *deep neural network* (DNN) function. A DNN function provides training and validation using a deep neural network (DNN) for use with surrogate model training, for example. Deep neural networks form a class of machine learning algorithms similar to the artificial neural network and aims to mimic the information processing of the brain.

TABLE 2-100: DEEP NEURAL NET PROPERTIES.

| NAME       | VALUE                                                                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                     |
|------------|-------------------------------------------------------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| activation | array of the<br>following values:<br>tanh   none  <br>relu   elu  <br>sigmoid | {tanh}  | The activation function for the layers.                                                                                                                                                                                                         |
| args       | string array                                                                  | {}      | The argument names for the defined function(s),<br>as an array of alternating column names from the<br>input data and argument names. Using the<br>setEntry, getEntryKeys, getEntryKeyIndex<br>methods makes it easier to work with this array. |
| batchsize  | positive integer                                                              | 512     | The batch size for the DNN training.                                                                                                                                                                                                            |

TABLE 2-100: DEEP NEURAL NET PROPERTIES.

| NAME              | VALUE                         | DEFAULT | DESCRIPTION                                                                                                                                                                                                                                                                                                                                                                                                 |
|-------------------|-------------------------------|---------|-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| descr             | string array                  | {}      | The description for each function argument and<br>function value, as an array of alternating function<br>arguments or values and their descriptions. Using<br>the setEntry, getEntryKeys,<br>getEntryKeyIndex methods makes it easier to<br>work with this array.                                                                                                                                           |
| epochs            | integer                       | 1000    | The number of epochs to train for. In each epoch<br>all input data is processed once.                                                                                                                                                                                                                                                                                                                       |
| filename          | string                        |         | The full filename of the data source, when source<br>is set to file.                                                                                                                                                                                                                                                                                                                                        |
| fraction          | scalar, 0–1                   | 0.1     | The validation data fraction.                                                                                                                                                                                                                                                                                                                                                                               |
| gputraining       | boolean                       | false   | Use a supported GPU for accelerated DNN<br>training.                                                                                                                                                                                                                                                                                                                                                        |
| ignorenaninf      | boolean                       | true    | Ignore data points that are NaN or Inf.                                                                                                                                                                                                                                                                                                                                                                     |
| layertype         | array of dense                | {dense} | The type of layer in the DNN.                                                                                                                                                                                                                                                                                                                                                                               |
| lr                | positive scalar               | 1e-3    | The learning rate for the training.                                                                                                                                                                                                                                                                                                                                                                         |
| loss              | mse   mae                     | mse     | The loss function; root-mean-square error or a<br>mean absolute error.                                                                                                                                                                                                                                                                                                                                      |
| momentum          | nonnegative scalar            | 0       | The momentum, if optmethod is set to sgd.                                                                                                                                                                                                                                                                                                                                                                   |
| optmethod         | adam   sgd                    | adam    | Training optimization method: Adam or a<br>stochastic gradient descent (SGD) method                                                                                                                                                                                                                                                                                                                         |
| outfeatures       | array of positive<br>integers | {1}     | The number of output features from a layer.                                                                                                                                                                                                                                                                                                                                                                 |
| plotargs          | N-by-3 array                  |         | Contains one row for each function argument.<br>Each row contains the argument name, the lower<br>limit for plotting, and the upper limit for plotting.                                                                                                                                                                                                                                                     |
| plotaxis          | boolean array                 | {}      | Contains one value for each function argument. A<br>false value means that the corresponding function<br>argument will be constant when plotting. The<br>constant value is taken from the lower limit value<br>in the plotargs property. Constant arguments<br>do no use an axis in the plot. Up to 3 axes are<br>supported when plotting. Specify using<br>setIndex("plotaxis", false, 2), for<br>example. |
| plotfixedvalue    | double array                  | {}      | Contains one value for each function argument.<br>For arguments that do not have an axis in the plot<br>(see plotaxis), this property specifies the fixed<br>value to use in the plot.                                                                                                                                                                                                                      |
| resultTable       | result table tag              |         | The result table to use as source, if source is set<br>to resultTable.                                                                                                                                                                                                                                                                                                                                      |
| rndseed           | double                        | 0       | The random seed for training, if useseed is set to<br>manual.                                                                                                                                                                                                                                                                                                                                               |
| rndseedvalidation | double                        | 0       | The random seed for validation, if<br>useseedvalidation is set to manual.                                                                                                                                                                                                                                                                                                                                   |
| source            | file  <br>resultTable         | file    | Specify whether the data source is read from a file<br>or taken from a results table.                                                                                                                                                                                                                                                                                                                       |

TABLE 2-100: DEEP NEURAL NET PROPERTIES.

| NAME              | VALUE                                  | DEFAULT | DESCRIPTION                                                                                                                                                                                                        |
|-------------------|----------------------------------------|---------|--------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| useseed           | manual  <br>currenttime                | manual  | Specifies how the random seed for training is<br>determined. If manual, the seed is given by the<br>rndseed property. If currenttime, the seed is<br>computed from the current time when training is<br>started.   |
| useseedvalidation | manual  <br>currenttime                | manual  | Specifies how the random seed for validation is<br>determined. If manual, the seed is given by the<br>rndseed property. If currenttime, the seed is<br>computed from the current time when training is<br>started. |
| validation        | random  <br>fraction   last<br>  table | random  | The validation data: random sample of data values,<br>every N:th data value, last part of data values, or<br>taken from a separate table.                                                                          |
| validationtable   | table tag (string)                     |         | The tag of the table used as validation data, if<br>validation is set to table.                                                                                                                                    |
| weightdecay       | double                                 | 0       | Nonnegative number to penalize complexity by<br>adding the squares of all the parameters to the loss<br>function.                                                                                                  |

*PartialFractionFit*

Create an *partial fraction fit* function.

TABLE 2-101: PARTIAL FRACTION FIT PROPERTIES.

| NAME          | VALUE                   | DEFAULT      | DESCRIPTION                                                                                                      |
|---------------|-------------------------|--------------|------------------------------------------------------------------------------------------------------------------|
| asymterm      | double                  | 0            | Asymptotic term for the poles and residues.                                                                      |
| dseparator    | point   comma           | point        | Decimal separator in the data file, when source is set<br>to file.                                               |
| froissart     | boolean                 | false        | Automatically detect and remove Froissart doubles.                                                               |
| funcname      | String                  | The tag name | The name of the function.                                                                                        |
| iter          | positive integer        | 3            | The maximum number of iterations for the partial<br>fraction fit, if stopcondition is set to iter or<br>itertol. |
| source        | file  <br>resultTable   | file         | Specify whether the data source is read from a file or<br>taken from a results table.                            |
| stopcondition | tol   iter  <br>itertol | tol          | Stop condition: tolerance, iterations, or iterations or<br>tolerance.                                            |
| threshold     | double                  | 1e-3         | The threshold for the detection of Froissart doubles, if<br>froissart is set to true.                            |
| tol           | double                  | 1e-3         | The tolerance for the partial fraction fit, if<br>stopcondition is set to tol or itertol.                        |

#### **COMPATIBILITY**

For the Wave function, the freq property with a default value of 1 in previous versions of COMSOL Multiphysicshas been replaced by period with a default value of 2π in version 6.0.

## **SEE ALSO**

model.material()

