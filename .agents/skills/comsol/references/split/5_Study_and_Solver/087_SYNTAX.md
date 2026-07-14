# **SYNTAX**

```
model.study(stdname).create(fname, "TimeToFreqFFT");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-187: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY       | VALUE                                                                                 | DEFAULT  | DESCRIPTION                                                                                                                                        |
|----------------|---------------------------------------------------------------------------------------|----------|----------------------------------------------------------------------------------------------------------------------------------------------------|
| fftendtime     | Real scalar                                                                           | 1.0      | End time for the time interval.                                                                                                                    |
| fftinputmethod | sol   init                                                                            | sol      | Prescribe the input values using a solution or an<br>initial expression.                                                                           |
| fftinputpstudy | String                                                                                | current  | Study that defines input values for the FFT<br>study step.                                                                                         |
| fftmaxfreq     | Real scalar                                                                           | 10       | Maximum output frequency.                                                                                                                          |
| fftrealstore   | on   off                                                                              | on       | Do not store negative frequencies for real<br>input.                                                                                               |
| fftscaling     | cont   discrete                                                                       | cont     | Use a discrete or continuous scaling for the<br>Fourier transform.                                                                                 |
| fftstarttime   | Real scalar                                                                           | 0.0      | Start time for the time interval.                                                                                                                  |
| fftwinalpha    | Real scalar                                                                           | 0.5      | Window parameter for a Tukey window.                                                                                                               |
| fftwincenterfw | Real scalar                                                                           | 0.5      | Window center for a Gaussian window<br>function.                                                                                                   |
| fftwincutoff   | Real scalar                                                                           | 1        | Cutoff fraction for window function in [0, 1].                                                                                                     |
| fftwindev      | Real scalar                                                                           | 1        | Standard deviation for a Gaussian window<br>function.                                                                                              |
| fftwindowfw    | on   off                                                                              | off      | Use window function.                                                                                                                               |
| fftwinexpr     | String                                                                                | 1        | Expression for window function (when set to<br>fromexpr). Can be expressed in terms of t,<br>freq, niterFFTin, and niterFFTout (if<br>applicable). |
| fftwinmaxfw    | Real scalar                                                                           | 1        | Maximum (end) value for window.                                                                                                                    |
| fftwinminfw    | Real scalar                                                                           | 0        | Minimum (start) value for window.                                                                                                                  |
| fftwintypefw   | fromexpr   cutoff  <br>rectangle   gauss  <br>hamming   hanning  <br>blackman   tukey | fromexpr | Method for window function.                                                                                                                        |
| punit          | String                                                                                | Hz       | Frequency unit.                                                                                                                                    |
| tunit          | String                                                                                | s        | Time unit.                                                                                                                                         |

TABLE 6-188: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY                  | VALUE           | DEFAULT | DESCRIPTION                          |
|---------------------------|-----------------|---------|--------------------------------------|
| activate                  | String Map      |         | See Physics and Variables Selection. |
| activateCoupling          | String Map      |         | See Physics and Variables Selection. |
| activaterom               | String Map      |         | See Physics and Variables Selection. |
| disabledcommon            | Reference Array |         | See Physics and Variables Selection. |
| disabledcoordinatesystems | Reference Array |         | See Physics and Variables Selection. |
| disabledcoupling          | Reference Array |         | See Physics and Variables Selection. |
| disabledpair              | Reference Array |         | See Physics and Variables Selection. |
| disabledphysics           | Reference Array |         | See Physics and Variables Selection. |
| disabledreduced           | Reference Array |         | See Physics and Variables Selection. |
| disabledvariables         | Reference Array |         | See Physics and Variables Selection. |
| disableFrameControl       | Reference Array |         | See Physics and Variables Selection. |

TABLE 6-188: PROPERTIES FOR PHYSICS AND VARIABLES SELECTION.

| PROPERTY              | VALUE      | DEFAULT | DESCRIPTION                          |
|-----------------------|------------|---------|--------------------------------------|
| discretization        | String Map |         | See Physics and Variables Selection. |
| equationform          | String Map |         | See Physics and Variables Selection. |
| equationform_freq     | String Map |         | See Physics and Variables Selection. |
| equationform_freq_src | String Map |         | See Physics and Variables Selection. |
| reconstructors        | String Map |         | See Physics and Variables Selection. |
| useadvanceddisable    | on   off   | off     | See Physics and Variables Selection. |

TABLE 6-189: PROPERTIES FOR VALUES OF DEPENDENT VARIABLES.

| PROPERTY           | VALUE                                                                               | DEFAULT | DESCRIPTION                                                                                                                                                            |
|--------------------|-------------------------------------------------------------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| notlistsolnum      | Vector of integers                                                                  | [1]     | Indices to selected solutions for values for<br>variables not solved for.                                                                                              |
| notmanualsolnum    | Vector of integers                                                                  | [1]     | Indices to solutions for values for variables not<br>solved for.                                                                                                       |
| notsolmethod       | init   sol                                                                          | init    | Method for values for variables not solved for.                                                                                                                        |
| notsolnum          | auto   all   first  <br>last   from_list  <br>interp   manual  <br>positive integer | auto    | Solution selection for values for variables not<br>solved for.                                                                                                         |
| notstudy           | String                                                                              |         | Reference to study or "zero" for zero<br>solution.                                                                                                                     |
| nott               | String                                                                              |         | Specify time for interpolated solution of values<br>for variables not solved for.                                                                                      |
| outputInterface    | The interfaces to use<br>as key                                                     |         | An output property (read only) for the physics<br>interfaces in the output. It can be used as keys<br>while setting the outputmap and<br>outputselectionmap.           |
| outputmap          | String Map                                                                          |         | See Store in Output for possible options and<br>defaults (this property corresponds to the<br>Output column). Possible values are physics,<br>all, none, or selection. |
| outputselectionmap | String Map                                                                          |         | An array of semicolon-separated strings of the<br>output selections (specified with tags).                                                                             |

See setEntry() for information about setting the values for a property that uses a String Map. If you use the set(*pname*,*value*) method, you have to provide all alternating property name and property value pairs.

TABLE 6-190: PROPERTY FOR MESH SELECTION.

| PROPERTY | VALUE             | DEFAULT | DESCRIPTION                                                                                                                                                                                                                      |
|----------|-------------------|---------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| mesh     | Vector of strings |         | Select meshes for geometries. The length of the<br>vector is two times the number of geometries.<br>Example value when two geometries geom1<br>and geom2 are available is: new<br>String[]{"geom1","mesh1","geom2",<br>"mesh2"}. |

