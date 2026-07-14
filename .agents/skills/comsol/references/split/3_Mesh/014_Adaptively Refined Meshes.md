# Adaptively Refined Meshes

A meshing sequence can represent an adaptively refined mesh controlled by an Adaption study feature. The following method is available to return the tag of the study and study feature with adaptation that controls the meshing sequence:

```
model.component(<ctag>).mesh(<tag>).adaptationStudyFeature();
```

If no such study exists, this method returns an empty string.

To specify the study feature with adaptation that controls the meshing sequence, use

```
model.component(<ctag>).mesh(<tag>).adaptationStudyFeature(<studytag>)
```

where *<studytag>* is a path of tags to the Adaptation study feature. Use an empty string to disable study control.

