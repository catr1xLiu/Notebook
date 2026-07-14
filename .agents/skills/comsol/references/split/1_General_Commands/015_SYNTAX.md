# **SYNTAX**

This section describes general methods that handle the environment for the model object. It also describes methods for the client/server machinery.

```
import com.comsol.model.*;
import com.comsol.model.util.*;
```

The import statements above make all model and model utility methods available.

ModelUtil.create(*<tag>*): The create method creates a model with tag *<tag>*. Returns a reference to the model. If there is already a model with this tag the previous model is removed.

ModelUtil.remove(*<tag>*): The remove method removes the model tagged *<tag>*.

ModelUtil.clear(): The clear method removes all models.

ModelUtil.tags(): The tags method obtains the current list of model tags.

ModelUtil.model(*<tag>*): The model method returns a reference to the model tagged *<tag>*.

ModelUtil.closeWindow(*<windowtag>*): The closeWindow method closes the window tagged *<windowtag>*.

ModelUtil.closeWindows(): The closeWindows method closes all windows on the server.

ModelUtil.createUnique(<*prefix>*): The createUnique method creates a model with a unique tag that begins with the prefix <*prefix>*.

ModelUtil.getComsolVersion(): The getComsolVersion method returns the current COMSOL Multiphysics version as a string.

ModelUtil.getOpenGeometryKernel(): The getOpenGeometryKernel method returns the geometry kernel to use when opening models. Valid values are model for the geometry kernel used by the model file, and comsol to convert the geometry to the COMSOL kernel.

ModelUtil.getDefaultGeometryKernel(): The getDefaultGeometryKernel method returns the default geometry kernel in new models. Valid values are comsol for the COMSOL kernel and cadps for the CAD kernel (Parasolid kernel). The CAD kernel requires the CAD Import Module.

ModelUtil.setOpenGeometryKernel(*<openkernel>*): The setOpenGeometryKernel method specifies the geometry kernel to use when opening models. Valid values are model for the geometry kernel used by the model file, and comsol to convert the geometry to the COMSOL kernel.

ModelUtil.setDefaultGeometryKernel(*<defaultkernel>*): The setDefaultGeometryKernel method specifies the default geometry kernel to use in new models with the string *<defaultkernel>*. Valid values are comsol for the COMSOL kernel and cadps for the CAD kernel (Parasolid kernel). The CAD kernel requires the CAD Import Module.

ModelUtil.getEntityPath(*<entity>*,*<divider>*): The getEntityPath method creates the path from the root of the model object for the given entity *<entity>*. *<divider>* specifies a divider to use between entities in path.

ModelUtil.load(*<tag>*,*<modelLocation>*): The load method loads a model from a model location *<modelLocation>*, which can be the absolute path of a file on the file system or a model location URI identifying a model version in a Model Manager database and names it *<tag>*. Loading a model file from a directory on the file system sets the model directory. The model directory is used for saving files on the file system if you do not provide an absolute path to the file. The model directory is the directory where the model is saved. If the model has not been saved there is no model directory, you can get the model directory from a saved model using model.getFilePath.

ModelUtil.loadCopy(*<tag>*,*<filename>*): The loadCopy method loads a copy of a model from a file *<filename>* in the client's file system and names it *<tag>*. The loadCopy method is the same as load except that the loaded model is not associated with the file, so model.save() does not work. You have to specify the filename the first time you save it again.

ModelUtil.loadOnServer(*<tag>*,*<filename>*): The loadOnServer method works like ModelUtil.load except that the filename is a path on the server computer. The client does not have to have access to the file.

ModelUtil.loadProtected(*<tag>*,*<filename>*,*<password>*): The loadProtected method works like ModelUtil.load but with password protection.

ModelUtil.loadProtectedOnServer(*<tag>*,*<filename>*,*<password>*): The loadProtectedOnServer method works like ModelUtil.loadOnServer but with password protection.

ModelUtil.loadRecovery(*<tag>*,*<foldername>*): The loadRecovery method loads a model from a recovery directory or folder structure in the client's file system and names it *<tag>*.

ModelUtil.showPlots(bool): The showPlots method applies when connected to a graphics server, and ModelUtil.showPlots(false) will disable plotting. It will not close any existing plot windows. Use ModelUtil.closeWindow(*<tag>*) or ModelUtil.closeWindows() to do that.

ModelUtil.showProgress(bool): The showProgress method with a boolean input turns on or off showing of progress in a window or on a file when running lengthy tasks when connected to a server. The return value is a boolean value that is true if showing progress is possible.

ModelUtil.showProgress(*<filename>*): The showProgress method with a filename input turns on logging of progress to the file *<filename>* in the client's file system. If *<filename>* is *null* progress is logged to the standard output.

ModelUtil.initStandalone(bool): The initStandalone method initializes the environment for using the COMSOL API in model files for Java®. You should *not* use this command from the LiveLink™ *for* MATLAB®. Set the argument to true if support for plotting in a GUI using Java Swing widgets should be available.

ModelUtil.initStandalone(bool,*<guiToolkit>*) allows to specify that support for using a given Java GUI toolkit should be available. The optional *<guiToolkit>* parameter can have the values "swing" or "swt" telling that Swing widgets or widgets from the Standard Widget Toolkit (SWT) can be used.

ModelUtil.getPreference(*<prefsName>*): The getPreference method returns the value of a preference.

ModelUtil.setPreference(*<prefsName>*, *<value>*): The setPreference method sets the value of a preference.

ModelUtil.listPreferences(): The listPreferences method returns a string with a listing of the preferences names and their descriptions.

ModelUtil.loadPreferences(): The loadPreferences method loads the preferences from file. Use this in model files for Java, which do not load the preferences at launch time.

ModelUtil.savePreferences(): The savePreferences method saves the preferences to file.

![](_page_15_Picture_9.jpeg)

The preferences are also saved when you close the **Preferences** window and when you exit COMSOL Desktop. When you run a thin client, preferences are saved when you call ModelUtil.disconnect() (see Client-Server Commands below).

ModelUtil.uniquetag(String prefix): The uniquetag method returns a unique model tag with a prefix that the tag should begin as an input argument.

ModelUtil.modelsUsedByOtherClients(): The modelsUsedByOtherClients method returns the tags of models used by other clients.

ModelUtil.blockOtherClients(boolean blockOtherClients), which blocks other clients from a server. This command is only meaningful when there are multiple clients connected to the server. Calling ModelUtil.blockOtherClients(true) will block other clients. The blocking is lifted when clients requesting the block call ModelUtil.blockOtherClients(false) or when it disconnects from the server.

