# **ERRORS**

If an error occurs when building a feature, the build stops, and the feature before the failing feature becomes current. The failing feature gets an *error feature* appended, which contains the error message. To access the error message, enter

```
String msg = model.component(<ctag>).geom(<tag>).feature(<ftag>).message();
```

To access the error feature, its message and detailed message, enter

```
String msg = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   problem("error").getString("message");
String det = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   problem("error").getString("details");
```

## **WARNINGS**

After a successful build, a feature can get warning features appended, which contain warning messages. To access the first warning message, enter

```
String msg = model.component(<ctag>).geom(<tag>).feature(<ftag>).message();
```

To access the warning features, their messages and detailed messages, enter

```
String msg = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   problem(<wtag>).getString("message");
String det = model.component(<ctag>).geom(<tag>).feature(<ftag>).
   problem(<wtag>).getString("details");
```

where *<wtag>* is warning1, warning2, and so on.

#### **RETRIEVING INFORMATION ABOUT THE LATEST BUILD**

The following methods are available to retrieve the information specific to the build of a geometry feature.

To see the COMSOL version number (and architecture) used for the latest build of the feature *<ftag>*, use

```
String version = model.component(<ctag>).geom(<tag>).feature(<ftag>).
buildComsolVersion();
```

To get access to the date and time of the last time a feature was built, enter

```
String date = model.component(<ctag>).geom(<tag>).feature(<ftag>).buildDate();
```

The methods above return empty strings if the feature has not yet been built. Use

```
int time = model.component(<ctag>).geom(<tag>).feature(<ftag>).buildTime();
```

to get the time (in seconds) it took to build the feature the last time it was built. In case the feature has not been built, it will return -1.

