# **SYNTAX**

model is a model object that you can create, for example, using ModelUtil.create(*<tag>*).

model.baseSystem(*<system>*): The baseSystem methods sets the unit system for the entire model to the given system. The default is the SI system, which has the tag SI. Other supported unit systems are bft (British engineering units), cgs, mpa, emu, esu, fps, ips, and psi.

model.clearThumbnail(): The clearThumbnail method clears the model thumbnail image.

model.dateModified(): The dateModified method returns the modification date of the model.

Use model.description(*description*) and description = model.description() to set and retrieve the model's description.

model.disableUpdates(): The disableUpdates method returns the current status of the disable state for the model object.

model.disableUpdates(boolean) Temporarily disables and reenables the update of variables in entities that automatically generates other entities (for example, physics or coordSystem). Disable updates to speed up the evaluation of long execution sequences. Leaving this flag disabled can cause strange side effects during modeling. For example, some parameter values in a feature of a physics interface might not be valid until an update has been made. The model inputs are such parameters, which end with the suffix \_src. Trying to set a value to any of these parameters with updates disabled might give an error message. Other effects are that the generated variables are

unknown to the unit evaluator and equation view readings can be incomplete. When the disabled state goes from true to false, the program performs a full update of the variables, so the model is in a fully functional state.

Use model.excludeComputedDataInMph(boolean exclude) to control whether to exclude the built, computed, and plotted data when saving model files. Use model.excludeComputedDataInMph() to return the current value.

Use model.excludeComputedDataInDrafts(boolean exclude) to control whether to exclude built, computed, and plotted data when saving the model as a draft version to a database. Use model.excludeComputedDataInDrafts() to return whether to exclude such data when saving the model as a draft version to a database.

Use model.excludeComputedDataInRegular(boolean exclude) to control whether to exclude built, computed, and plotted data when saving the model as a regular version to a database. Use model.excludeComputedDataInRegular() to return whether to exclude such data when saving the model as a regular version to a database.

model.fontFamily(*<family>*): The fontFamily method sets the font family to be used in plots. The font default is always available. If using Windows, most system fonts can also be used.

model.fontSize(*<size>*): The fontSize method sets the font size to be used in plots.

model.getComsolVersion(): The getComsolVersion method returns the COMSOL Multiphysics version used to save the model or the current version if the model has never been saved. There is also a ModelUtil.getComsolVersion() method, which returns the current version as a string.

model.getFilePath() returns the absolute path of the model or an empty string if the model has not been saved or if the model is loaded from a database.

model.getLastComputationTime(String *time\_format*): The getLastComputationTime method returns the last computation time for the model or application as a string. Use model.getLastComputationTime() to get the time measured in ms, which you can then use as an input to model.setLastComputationTime. Other supported time formats are "hr:min:sec", "h:min:s", and "detailed", which returns the time in seconds and also includes more readable units for longer times.

model.getUsedProducts(): The getUsedProducts method returns the products that this model uses.

model.isReadOnly(): The isReadOnly method returns whether the file where the model is saved is read-only and cannot be overwritten or not. The file can be read-only for two reasons:

- **•** The COMSOL process does not have permission to write to the file.
- **•** On Windows, the file can be locked by another COMSOL instance.

If the model has not been saved, this method returns false.

model.lastModifiedBy(): The lastModifiedBy method returns the last user to modify the model.

model.location(): The location method returns a string that contains the location of the saved model. For a model saved on the file system, the value is the absolute path of the model file. For a model saved in a Model Manager database, the return value is the model's database location URI. If the model has never been saved, the location method returns null. The return value of the location method is what can be provided as-is to, for example, ModelUtil.load(String *tag*, String *modelLocation*) to load a model from either the file system or a database.

model.locationUri(): The locationUri method returns a database location URI for the save location of the model. If the model has never been saved, the location method returns null.

model.modelPath(*<path>*): The modelPath method sets the model path. The model path is used for reading files required by the model, if no path is provided to the file. *<path>* is a list of directories separated by semicolon. When reading an external file, COMSOL Multiphysics attempts to find a file in the following locations:

- **1** The absolute path as given in the filename. If the path given in the filename is relative, it is resolved relative to the following directories.
- **2** The model directory, if provided.
- **3** If searching for a geometry part, the user part libraries. These are given by the preference property geometry.library.userpartlibraries.
- **4** If searching for a geometry part, the COMSOL Multiphysics installation's parts directory.
- **5** The directories defined by model.modelPath (ordered and semicolon separated).
- **6** The directories in the cs.path setting (ordered and semicolon separated).
- **7** The current directory, which is given by the Java system property user.dir and is the directory where you launch COMSOL Multiphysics, unless you have changed the value of user.dir.

The model directory is used for saving and exporting files if you do not provide an absolute path to the file.

model.modelPath() returns the path *<path>* set in a call to model.modelPath(*<path>*).

model.resetLabelsToDefault() resets all node labels to their default values.

model.save(*<filename>*). The save method saves the model as a multiphysics model file in *<filename>*. If you do not provide a path, the model is saved in the directory from where you have launched COMSOL Multiphysics or is automatically saved, if loaded from a database, as a draft version to that database.

model.save(*<filename>*,*<type>*) saves the multiphysics model in *<filename>*. If the type is java, a model file for use with Java® is saved. If the type is m, this command saves a model file as an M-file for use with the LiveLink™ *for* MATLAB®. If the type is vba, this command saves a model file as a VBA-file for use with VBA (Visual Basic for Applications) in Microsoft Excel®.

model.save(*<path>*,*<saveCopy>*) saves a copy of the model, if the boolean argument *<saveCopy>* is true. If it is set to false, this call results in a normal save operation. When saving as a copy, the location of that copy is not remembered, so the previous location for saving models is retained.

model.setLastComputationTime(long *time*): The setLastComputationTime method sets the last computation time for the model or application as the measured computation time (in ms) that you provide as the input.

model.setThumbnail(*<image\_filename>*): The setThumbnail method imports the image file at the given path and sets it as the model's thumbnail image.

Use model.title(*title*) and title = model.title() to set and retrieve the model's title.

*Methods for Compact History*

model.hist().complete(bool) enables or disables history logging for methods where the arguments typically are very large objects. This setting affects some methods of model.sol("sol"). All methods with a name beginning with setU are affected by the model.hist().complete(bool) setting. The default for the completeness is false. The compact history operation is not affected by the completeness setting.

model.hist().isComplete() returns true if history logging is enabled for methods where the arguments typically are very large objects.

model.hist().disable() Disables logging of top-level API calls to the history. Use this method sparingly; the default is that the history is logged.

model.hist().enable() Removes the most recent disabling of top-level API calls to the history. Calling enable() can be viewed as removing an entry from a stack of disabled records; logging only occurs if the stack is empty. If you call disable() twice, you then have to call enable() twice to enable history generation.

model.resetHist(): Compact History. The resetHist() method reconstructs the model history from scratch to generate a compacted model's Java- or M-file history (that is, creating a compact history). If the model has errors or invalid property values, the method fails and the old history is kept.

## **SEE ALSO**

```
model.modelNode(), model.unitSystem()
```

*model.attr()*

Model entity list methods such as copying, duplicating, clearing, and removing model entities.

#### **SYNTAX**

model.*attr*() returns a *model entity list*. The string *attr* denotes a method name for accessing the model entity list.

model.*attr*().clear() removes all tagged model entities.

model.*attr*().copy(*<tag>*,*<copytag>*) creates a new model entity with the tag *<tag>*, which is a copy of the model entity with the tag *<copytag>*. The *<copytag>* should be combination of tags separated by slashes to uniquely identify the entity. For example, pg1/surf1/htgh1 identifies

model.result("pg1").feature("surf1").feature("htgh1"). How to interpret the combined tag depends on the context. The difference between duplicate and copy is that copy can use a source anywhere in the model, whereas duplicate requires that the source is in the same list. Not all model entities support the copy operation. The difference between copy and copyTo is that copyTo copies the entity to a specific position in the list, whereas copy copies to a default position in the list. Not all model entities support the copyTo operation.

model.*attr*().copy(*<tag>*,*<copytag>*,*<modeltag>*) creates a copy and assigns it to the model *<modeltag>*.

model.*attr*().copyTo(*<tag>*,*<copytag>*,*<insertafter>*) creates a copy and inserts it in the list after the entity with tag *<insertafter>*. If *<insertafter>* is an empty string, the entity is inserted first in the list. Not all model entities support the copyTo operation.

model.*attr*().duplicate(*<tag>*,*<copytag>*) creates a new model entity with the tag *<tag>* which is a duplicate of the model entity with tag *<copytag>*. Not all model entities support the duplicate operation.

model.*attr*().duplicateTo(*<tag>*,*<copytag>*, *<insertafter>*) creates a new model entity and inserts it in the list after the entity with tag *<insertafter>*. If *<insertafter>* is an empty string, the entity is inserted first in the list. Not all model entities support the duplicateTo operation.

model.*attr*().get(*<tag>*). The get method returns the entity with tag *<tag>* from the entity list model.*attr*().

model.*attr*().remove(*<tag>*). The remove method removes the model entity with tag *<tag>*.

model.*attr*().size(). The size method returns the number of model entities.

model.*attr*().tags(). The tags method returns a string array with the tags of all model entities.

model.*attr*().uniquetag(*<tag>*). The uniquetag method returns a unique tag in the list context.

#### **SEE ALSO**

model

Model entity methods for adding and accessing name, tag, version, comments, date created, and the author information for a model entity.

#### **SYNTAX**

model.*attr*(*<tag>*) returns a *model entity* with tag *<tag>*. The string *attr* denotes a method name for accessing a model entity with tag *<tag>*.

model.*attr*(*<tag>*).active(*bool*) makes the entity with tag *<tag>* active or inactive.

model.*attr*(*<tag>*).author() returns the author of the entity.

model.*attr*(*<tag>*).author(*<author>*) sets the author of the entity.

model.*attr*(*<tag>*).comments() returns the comments of the entity.

model.*attr*(*<tag>*).comments(*<comments>*) sets the comments of the entity.

model.*attr*(*<tag>*).dateCreated() returns the creation date of the entity.

model.*attr*(*<tag>*).isActive() returns true if the entity with tag *<tag>* is active.

model.*attr*(*<tag>*).label() returns the label of the entity.

model.*attr*(*<tag>*).label(*<label>*) sets the label of the model entity. The label is an arbitrary nonempty string.

model.*attr*(*<tag>*).resetAuthor(*<author>*) sets the author of the entity and all its children. In particular, when used on the model itself, the method sets the author on all model entities of the model.

model.*attr*(*<tag>*).tag() returns the tag of the entity.

model.*attr*(*<tag>*).tag(*<newtag>*) assigns the new tag *<newtag>* to the entity *<tag>*.

model.*attr*(*<tag>*).timeCreated() and model.*attr*(*<tag>*).timeModified() return the creation time of the entity and the time when the entity was last modified, respectively. The times are reported in milliseconds since January 1, 1970, 00:00:00 GMT.

model.*attr*(*<tag>*).version(*<version>*) sets the version of the entity. The version is a user-defined string.

model.*attr*(*<tag>*).version() returns the version of the entity.

model.*attr*(*<tag>*).help() and model.*attr*(*<tag>*).help(*string*), where *string* is the name of a type within the model object, return a query URL string for looking up HTML documentation help text for the model entity of the given type using a COMSOL Documentation server running either locally or online at doc.comsol.com.

model.*attr*(*<tag>*).docMarker() and model.*attr*(*<tag>*).docMarker(*string*), where *string* is the name of a type within the model object, return the topic key for the model entity of the given type to use as the argument to the public static method com.comsol.doc.client.DocRemoteClient.*showHelp*(String) of the COMSOL Documentation application, which shows documentation with the help of a COMSOL Documentation server. If the COMSOL Documentation application is closed, it will automatically relaunch the next time you call the *showHelp*(String) method. If desired, it is possible to close a COMSOL Documentation application launched in this way programmatically by calling the method com.comsol.doc.client.DocRemoteClient.*shutdown*().

#### **SEE ALSO**

model

Create batch jobs.

#### **SYNTAX**

*Jobs*

model.batch().create(*<tag>*,*jobtype*); creates a batch job tagged *<tag>* of type *jobtype*, where *jobtype* is Parametric, Batch, or Cluster.

model.batch().remove(*<tag>*) removes a batch job.

model.batch().size() returns number of batch jobs.

model.batch().tags() returns the tags of the batch jobs.

model.batch(*<tag>*).attach(*<stag>*) attaches a batch job with tag *<tag>* to a study with tag *<stag>*, which makes it visible under that study.

model.batch(*<tag>*).create(*<jtag>*,*<oper>*) creates a batch job sequence.

model.batch(*<tag>*).detach(*<stag>*) detaches a batch job from a study with tag <stag>.

model.batch(*<tag>*).remove(*<ttag>*) removes the task.

model.batch(*<tag>*).run() runs the batch job. The run method can take an additional boolean input argument createPlots, which, when set to true, generates the corresponding default plots when computing a solution.

model.batch(*<tag>*).set(*jprop*,*<jvalue>*) sets the property *jprop* to the value *<jvalue>*.

model.batch(*<tag>*).study(*<stag>*) assigns a batch job to a study tag *<stag>*.

model.batch(*<tag>*).study() returns the study tag of batch job with tag *<tag>*.

*Batch Job Properties*

The Parametric job type has the following properties:

| PROPERTY      | VALUE        | DEFAULT | DESCRIPTION                                                     |  |
|---------------|--------------|---------|-----------------------------------------------------------------|--|
| accumtable    | String       | new     | Accumulated probe table.                                        |  |
| accumtableall | on   off     | off     | Use all probes for the accumulated probe table.                 |  |
| control       | String       | user    | Controlling study.                                              |  |
| param         | String array |         | Name of parameter and its value (output).                       |  |
| pdistrib      | on   off     | off     | Distributed (in parallel) the parameter values.                 |  |
| pname         | String array |         | Parameter name(s) to vary.                                      |  |
| plist         | String array |         | Parameter values.                                               |  |
| plot          | on   off     | off     | Update a plot group while solving.                              |  |
| plotgroup     | String       | default | Update this plot group while solving.                           |  |
| pwork         | int          | 1       | Limit for the number of work groups.                            |  |
| pworkactive   | on   off     | off     | Use a limit for the number of work groups.                      |  |
| stopcond      | String       |         | A stop condition expression.                                    |  |
| err           | on   off     | off     | Stop sweep if error.                                            |  |
| error         | String array |         | The logged error.                                               |  |
| errignore     | true   false | false   | Allow the sequence to continue even if an error is encountered. |  |
| useaccumtable | on   off     | off     | Produce an accumulated probe table while solving.               |  |

The Optimization job type sets its property through the Optimization study node, which has the following properties:

| PROPERTY          | VALUE                                                   | DEFAULT      | DESCRIPTION                                                                                                                                         |
|-------------------|---------------------------------------------------------|--------------|-----------------------------------------------------------------------------------------------------------------------------------------------------|
| optobj            | String                                                  |              | Objective function to be optimized.                                                                                                                 |
| descr             | String                                                  |              | Description of optimization objective function.                                                                                                     |
| objectivetype     | minimization  <br>maximization                          | minimization | Sets whether the objective should be minimized or<br>maximized.                                                                                     |
| objectivesolution | auto   first  <br>last   sum   min<br>  max             | auto         | Determines how the objective should be evaluated<br>for studies with more than one available PDE<br>solution, for example, time-dependent problems. |
| pname             | String array                                            |              | Names of control parameters.                                                                                                                        |
| initval           | String array                                            |              | Initial values for control parameters.                                                                                                              |
| lbound            | String array                                            |              | Lower bounds on control parameters.                                                                                                                 |
| ubound            | String array                                            |              | Upper bounds on control parameters.                                                                                                                 |
| optsolver         | coordsearch  <br>montecarlo  <br>neldermead  <br>bobyqa | neldermead   | Optimization solver.                                                                                                                                |
| useseed           | on   off                                                | off          | Use random seed for Monte Carlo solver.                                                                                                             |
| randseed          | int                                                     | 0            | Random seed for Monte Carlo solver.                                                                                                                 |
| nsolvemax         | int                                                     | 1000         | Maximum number of objective evaluations.                                                                                                            |
| opttol            | double                                                  | 1e-2         | Optimization tolerance.                                                                                                                             |
| useobjtable       | on   off                                                | off          | Produce a table with all objective evaluations.                                                                                                     |
| objtable          | String                                                  | new          | Reference to table with objective evaluations.                                                                                                      |
| convinfo          | off   on  <br>detailed                                  | on           | Detail of log messages from optimization solver.                                                                                                    |

The Batch job type has the following properties:

| PROPERTY   | VALUE                                                                                                                                  | DEFAULT           | DESCRIPTION                                                                   |
|------------|----------------------------------------------------------------------------------------------------------------------------------------|-------------------|-------------------------------------------------------------------------------|
| control    | String                                                                                                                                 | user              | Name of controlling study.                                                    |
| np         | integer                                                                                                                                | auto              | Number of cores to use.                                                       |
| graphics   | on   off                                                                                                                               | off               | Enable graphics.                                                              |
| maxallow   | integer                                                                                                                                | 1                 | Maximum allowed number of batch jobs to start<br>simultaneously.              |
| maxrestart | integer                                                                                                                                | 0                 | Maximum number of restarts before a batch job is<br>failed.                   |
| maxalive   | integer                                                                                                                                | 300               | Maximum number of seconds before the batch job<br>must say it is running.     |
| starttime  | now   0   1   2<br>  3   4   5   6  <br>7   8   9   10  <br>11   12   13  <br>14   15   16  <br>17   18   19  <br>20   21   22  <br>23 | now               | The time, as an hour for a 24-hour clock, when the<br>batch job should start. |
| batchdir   | String                                                                                                                                 | Home<br>directory | The directory to store files used by the batch job.                           |
| client     | on   off                                                                                                                               | off               | Run the batch job as client.                                                  |

| PROPERTY             | VALUE                  | DEFAULT                             | DESCRIPTION                                                                                  |
|----------------------|------------------------|-------------------------------------|----------------------------------------------------------------------------------------------|
| port                 | integer                | 2036                                | The host port number.                                                                        |
| host                 | String                 | localhost                           | Name of host.                                                                                |
| batchfile            | String                 | batchmodel<br>.mph                  | Name of batch model file.                                                                    |
| clear                | on   off               | on                                  | Clear the previous model file.                                                               |
| clearmesh            | on   off               | off                                 | Clear meshes before saving model.                                                            |
| clearsolution        | on   off               | off                                 | Clear solutions before saving model.                                                         |
| savefile             | on   off               | on                                  | Save model after run.                                                                        |
| specbatchdir         | on   off               | off                                 | Specify different directory for batch process than used<br>by the current process.           |
| rundir               | String                 | Home<br>directory                   | The directory used by the batch job when specbatchdir<br>is on.                              |
| speccomsoldir        | on   off               | off                                 | Specify different directory for the COMSOL<br>installation than used by the current process. |
| comsoldir            | String                 | COMSOL<br>installation<br>directory | The COMSOL installation directory used by the batch<br>job when speccomsoldir is on.         |
| synchsolutions       | on   off               | off                                 | Synchronize solutions after batch job finishes.                                              |
| synchaccumprobetable | on   off               | off                                 | Synchronize accumulated probe tables after batch job<br>finishes.                            |
| probesel             | all   none  <br>manual | all                                 | The probes to compute.                                                                       |
| probes               | String array           |                                     | Probes to compute.                                                                           |
| useaccumtable        | on   off               | off                                 | Use the accumulated probe table.                                                             |
| accumtable           | String                 | new                                 | Name of table to use.                                                                        |
| accumtableall        | on   off               | on                                  | Use all probes.                                                                              |
| client               | on   off               | off                                 | Run as client.                                                                               |
| host                 | String                 | localhost                           | Name of server.                                                                              |
| port                 | integer                |                                     | Server port number.                                                                          |

The Cluster job type has the following properties:

| PROPERTY                | VALUE                                                    | DEFAULT | DESCRIPTION                                               |
|-------------------------|----------------------------------------------------------|---------|-----------------------------------------------------------|
| batch                   | String                                                   |         | Tag of batch job to run.                                  |
| clustertype             | general   whpc2008  <br>wccs2003   sge  <br>slurm   none | general | The type of cluster job.                                  |
| control                 | String                                                   | user    | Name of controlling study.                                |
| corespernode            | integer                                                  | 0       | Minimum number of cores per node on<br>whpc2008.          |
| exclusive               | on   off                                                 | on      | Demand exclusive right to nodes on<br>whpc2008 and SLURM. |
| filetransfercmd         | none   scp   user                                        | none    | Command to transfer files.                                |
| filetransferfromusercmd | String                                                   |         | Command to transfer files from remote<br>location.        |
| filetransfertousercmd   | String                                                   |         | Command to transfer files to remote<br>location.          |
| hostfile                | String                                                   |         | Path to hostfile.                                         |

| PROPERTY      | VALUE                                                          | DEFAULT   | DESCRIPTION                                                              |
|---------------|----------------------------------------------------------------|-----------|--------------------------------------------------------------------------|
| memorypernode | integer                                                        | 0         | Minimum amount of memory per node on<br>whpc2008 and SLURM.              |
| mpd           | on   off                                                       | off       | If an mpd is running on the computer or<br>not.                          |
| mpiargs       | String                                                         |           | Additional MPI arguments.                                                |
| mpibootstrap  | String                                                         |           | Name of bootstrap server.                                                |
| mpirsh        | String                                                         |           | Path to rsh or ssh.                                                      |
| nn            | integer                                                        | 1         | Number of processes to start.                                            |
| nodegran      | node   socket  core                                            | node      | Node granularity on whpc2008.                                            |
| nodegroup     | String                                                         |           | Name of Named selection of Compute<br>nodes in whpc2008.                 |
| perhost       | integer                                                        | 1         | Number of processes / host.                                              |
| postcmd       | String                                                         |           | DOS/Linux command to execute after the<br>batch job finished.            |
| precmd        | String                                                         |           | DOS/Linux command to execute prior to<br>the batch job.                  |
| priority      | Highest  <br>AboveNormal   Normal<br>  BelowNormal  <br>Lowest | Normal    | Priority of job on wccs2003 and<br>whpc2008.                             |
| remote        | on   off                                                       | off       | Run on remote server.                                                    |
| remotecmd     | none   ssh   user                                              | none      | Command to use when invoking a<br>command on a remote server.            |
| remotehosts   | String                                                         |           | List of remote hostnames.                                                |
| remoteos      | native   windows  <br>linux                                    | native    | OS used on remote hosts.                                                 |
| remoteusercmd | String                                                         |           | Command to run on remote server.                                         |
| reqnodes      | String array                                                   |           | Requested nodes on wccs2003,<br>whpc2008, and SLURM.                     |
| runtime       | DD:HH:MM   Infinite                                            | Infinite  | Maximum time to run before stopping on<br>wccs2003, whpc2008, and SLURM. |
| schedargs     | String                                                         |           | Additional scheduler arguments.                                          |
| scheduler     | String                                                         | localhost | Name of the scheduler on wccs2003,<br>whpc2008, and SLURM.               |
| scpargs       | String                                                         |           | Additional SCP arguments.                                                |
| scpcmd        | scp   putty   user                                             | scp       | SCP command.                                                             |
| scpkey        | String                                                         |           | SCP key file.                                                            |
| scppath       | String                                                         |           | Directory where SCP resides.                                             |
| scpuser       | String                                                         |           | Username used by SCP.                                                    |
| scpusercmd    | String                                                         |           | Command for copying files to remote<br>location.                         |
| sgegran       | host   slot   manual                                           | host      | Node granularity on SGE.                                                 |
| sgenn         | integer                                                        | 1         | Number of slots in SGE.                                                  |
| sgepriority   | integer                                                        | 0         | Priority of job on SGE and SLURM.                                        |
| sgequeue      | String                                                         |           | Name of SGE and SLURM queue.                                             |
| sshargs       | String                                                         |           | Additional SSH arguments.                                                |

| PROPERTY    | VALUE              | DEFAULT | DESCRIPTION                                   |
|-------------|--------------------|---------|-----------------------------------------------|
| sshcmd      | ssh   putty   user | ssh     | SSH command.                                  |
| sshkey      | String             |         | SSH key file.                                 |
| sshpath     | String             |         | Directory where SSH resides.                  |
| sshporthost | String             |         | Port host.                                    |
| sshports    | String             |         | Ports that should be forwarded by SSH.        |
| sshuser     | String             |         | Username used by SSH.                         |
| sshusercmd  | String             |         | User-defined SSH command.                     |
| user        | String             |         | Username on wccs2003, whpc2008, and<br>SLURM. |

#### *Tasks*

model.batch(*<tag>*).create(*<ttag>*,*tasktype*); creates a task of type *tasktype* tagged *<ttag>*. Find options for *tasktype* in Table 2-5 below.

TABLE 2-5: BATCH TASK TYPE OPTIONS.

| TASK TYPE        | DESCRIPTION                                                                                                                            |  |  |  |
|------------------|----------------------------------------------------------------------------------------------------------------------------------------|--|--|--|
| Geomseq          | A geometry sequence to build.                                                                                                          |  |  |  |
| Meshseq          | A meshing sequence to build.                                                                                                           |  |  |  |
| Solutionseq      | A solver sequence to compute.                                                                                                          |  |  |  |
| Jobseq           | A job sequence to run.                                                                                                                 |  |  |  |
| Postseq          | A post sequence to run.                                                                                                                |  |  |  |
| Evalnumericalseq | A numerical results seq (derived value) to run (replaced Numericalseq).                                                                |  |  |  |
| Numericalseq     | A numerical results seq to run (deprecated).                                                                                           |  |  |  |
| Exportseq        | An export sequence to run.                                                                                                             |  |  |  |
| Save             | Saves the state of the model at this point in the job sequence.                                                                        |  |  |  |
| Class            | Runs the main function of a compiled class with the system property cs.currentmodel set to<br>the name of the model calling the class. |  |  |  |
| Data             | Created by batch jobs to store external process information.                                                                           |  |  |  |

## *Task Type Properties*

model.batch(*<tag>*).feature(*<ttag>*).set(*ttprop*,*<tpvalue>*) sets the task type property *ttprop* to the value *<tpvalue>*.

Task type properties can have the values listed in Table 2-6.

TABLE 2-6: TASK TYPE PROPERTY VALUES.

| PROPERTY   | VALUE        | DEFAULT | DESCRIPTION                                            |  |
|------------|--------------|---------|--------------------------------------------------------|--|
| clear      | on   off     | on      | Clear the currently stored data.                       |  |
| filename   | String       |         | Name of file to store or open.                         |  |
| openfile   | String array | none    | Name of file that was saved.                           |  |
| param      | String array |         | Name of parameter and its value.                       |  |
| files      | String array |         | Name of files for each parameter.                      |  |
| input      | String array |         | Input to class file.                                   |  |
| seq        | String       | all     | Name of sequence to run.                               |  |
| num        | String array |         | Name of numerical result feature that generated value. |  |
| paramvalue | String array |         | Computed numerical result.                             |  |

TABLE 2-6: TASK TYPE PROPERTY VALUES.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                                        |  |
|----------|----------|---------|----------------------------------------------------|--|
| store    | on   off | off     | Copy solution.                                     |  |
| psol     | String   | none    | Tag of solver sequence where solutions are stored. |  |

*The Data Task Type*

The Data task type contains child nodes with process information of type Process; see Table 2-7.

TABLE 2-7: DATA CHILD NODES.

| TASKTYPE | DESCRIPTION                                   |
|----------|-----------------------------------------------|
| Process  | Contains information about running processes. |

model.batch(*<tag>*).feature(*<ttag>*).feature(*<ptag>*).set(*ptype*,*<pvalue>*) sets the property *ptype* to the value *<pvalue>*. *ptype* can have the values listed in Table 2-8

TABLE 2-8: PTYPE PROPERTY VALUES.

| PROPERTY  | VALUE                                                | DEFAULT | DESCRIPTION                                    |
|-----------|------------------------------------------------------|---------|------------------------------------------------|
| cmd       | String                                               |         | The command that started the external process. |
| filename  | String                                               |         | Name of file where model is stored.            |
| operation | update   progress   cancel   stop<br>  clear   rerun | update  | Name of operation to perform on the process.   |
| status    | String                                               |         | Current status of the process.                 |

#### **EXAMPLE**

Create a parametric sweep over a geometry sequence that creates a batch job that runs a parametric sweep that runs a solver.

*Code for Use with Java*

```
model.batch().create("sweep1","Parametric");
model.batch("sweep1").set("pname","a");
model.batch("sweep1").set("plist",new double[]{1,2});
model.batch("sweep1").create("sol","Solutionseq");
model.batch("sweep1").feature("sol").set("seq","sol3");
model.batch().create("batch1","Batch");
model.batch("batch1").create("task","Jobseq");
model.batch("batch1").feature("task").set("seq","sweep1");
model.batch().create("sweep2","Parametric");
model.batch("sweep2").set("pname","b");
model.batch("sweep2").set("plist",new double[]{1,2,3});
model.batch("sweep2").create("gtask","Geomseq");
model.batch("sweep2").feature("gtask").set("seq","geom1");
model.batch("sweep2").create("task","Jobseq");
model.batch("sweep2").feature("task").set("seq","batch1");
model.batch("sweep2").run();
```

Determine the parameter names and values from a parametric sweep that has already been run.

```
model.batch(pname).feature(fname).getString("psol")
```

where pname is the name of the parametric sweep feature that ran and fname is the name of the solution feature that stored the solutions. Use

```
model.sol(sname).feature().tags()
to find out the tags of the stored solutions. Use
  model.sol(sname).feature(fname).getString("sol")
to find the solver sequence for a parameter. Use
  model.sol(sname).getParamNames()
```

```
and
```

```
model.sol(sname).getParamVals()
Code for Use with MATLAB
  model.batch.create('sweep1','Parametric');
  model.batch('sweep1').set('pname','a');
  model.batch('sweep1').set('plist',[1,2]);
  model.batch('sweep1').create('sol','Solutionseq');
  model.batch('sweep1').feature('sol').set('seq','sol3');
  model.batch.create('batch1','Batch');
  model.batch('batch1').create('task','Jobseq');
  model.batch('batch1').feature('task').set('seq','sweep1');
  model.batch.create('sweep2','Parametric');
  model.batch('sweep2').set('pname','b');
  model.batch('sweep2').set('plist',[1,2,3]);
  model.batch('sweep2').create('gtask','Geomseq');
  model.batch('sweep2').feature('gtask').set('seq','geom1');
  model.batch('sweep2').create('task','Jobseq');
  model.batch('sweep2').feature('task').set('seq','batch1');
  model.batch('sweep2').run;
Determine the parameter names and values from a parametric sweep that has already been run.
  model.batch(pname).feature(fname).getString('psol')
where pname is the name of the parametric sweep feature that ran and fname is the name of the solution feature 
that stored the solutions. Use
  model.sol(sname).feature().tags
to find out the tags of the stored solutions. Use
  model.sol(sname).feature(fname).getString('sol')
to find the solver sequence for a parameter. Use
  model.sol(sname).getParamNames
and
  model.sol(sname).getParamVals
SEE ALSO
model.sol(), model.study()
model.bem()
```

Create a boundary element (BEM) model.

