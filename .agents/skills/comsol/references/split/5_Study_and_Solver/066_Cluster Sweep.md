# *Cluster Sweep*

Use the Cluster Sweep study step when you want to study to solve several models in parallel where each model has a different set of parameters.

## **SYNTAX**

```
model.study(stdname).create(fname, "ClusterSweep");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-112: PROPERTIES FOR STUDY SETTINGS.

| PROPERTY  | VALUE             | DEFAULT | DESCRIPTION                                                        |
|-----------|-------------------|---------|--------------------------------------------------------------------|
| plistarr  | Real matrix       |         | List of parameter values. One row of values per<br>parameter name. |
| pname     | Vector of strings |         | Parameter names.                                                   |
| punit     | Vector of strings |         | Parameter units.                                                   |
| sweeptype | filled   sparse   | sparse  | Sweep type.                                                        |

TABLE 6-113: PROPERTIES FOR OUTPUT WHILE SOLVING.

| PROPERTY      | VALUE               | DEFAULT | DESCRIPTION                                     |
|---------------|---------------------|---------|-------------------------------------------------|
| accumtable    | String              | new     | Accumulated probe table.                        |
| accumtableall | on   off            | on      | Use all probes for the accumulated probe table. |
| probes        | Vector of strings   |         | Probes to use when probesel=manual.             |
| probesel      | all   none   manual | all     | Probes to compute.                              |
| useaccumtable | on   off            | on      | Use an accumulated probe table.                 |

TABLE 6-114: PROPERTIES FOR BATCH SETTINGS.

| PROPERTY             | VALUE                                                     | DEFAULT        | DESCRIPTION                                                                           |
|----------------------|-----------------------------------------------------------|----------------|---------------------------------------------------------------------------------------|
| batchfile            | String                                                    | batchmodel.mph | Name of batch model file.                                                             |
| batchlic             | on   off                                                  |                | Use batch license.                                                                    |
| clearmesh            | on   off                                                  | on             | Clear meshes.                                                                         |
| clearsol             | on   off                                                  | on             | Clear solutions.                                                                      |
| clustertype          | general   whpc2008  <br>sge   slurm   pbs  <br>lsf   none |                | The type of cluster job.                                                              |
| extsolvergen         | on   off                                                  | off            | Generate solver sequence in external<br>process.                                      |
| hostfile             | String                                                    |                | Path to host file.                                                                    |
| mpiargs              | String                                                    |                | Additional MPI arguments.                                                             |
| mpibootstrap         | String                                                    |                | Name of bootstrap server.                                                             |
| mpipath              | String                                                    |                | Installation directory for MPI.                                                       |
| nn                   | Integer                                                   | 1              | Number of nodes.                                                                      |
| paramfilename        | on   index                                                | on             | Add parameter names and values or<br>shorter indices to the filename.                 |
| rundir               | String                                                    |                | The directory to store files used by the<br>batch job.                                |
| savefile             | on   off                                                  | off            | Output model to file.                                                                 |
| serverdir            | String                                                    |                | Server directory.                                                                     |
| specbatchdir         | on   off                                                  |                | Specify different directory for batch<br>process than used by the current<br>process. |
| specserverdir        | on   off                                                  | off            | Specify server directory path.                                                        |
| synchaccumprobetable | on   off                                                  | on             | Synchronize accumulated probe table.                                                  |
| synchsolutions       | on   off                                                  | off            | Synchronize solutions.                                                                |

TABLE 6-115: PROPERTIES FOR REMOTE AND CLOUD ACCESS.

| PROPERTY                | VALUE                       | DEFAULT | DESCRIPTION                                                   |
|-------------------------|-----------------------------|---------|---------------------------------------------------------------|
| filetransfercmd         | none   scp   user           | none    | Command transfer file.                                        |
| filetransferfromusercmd | String                      |         | Command to transfer files from remote<br>location.            |
| filetransfertousercmd   | String                      |         | Command to transfer files to remote location.                 |
| remote                  | on   off                    |         | Run on remote server.                                         |
| remotecmd               | none   ssh   user           |         | Command to use when invoking a command on<br>a remote server. |
| remotehosts             | String                      |         | List of remote hostnames.                                     |
| remoteos                | native   windows  <br>linux |         | OS used on remote hosts.                                      |
| remoteusercmd           | String                      |         | Command to use when invoking a command on<br>a remote server. |
| scpkey                  | String                      |         | SCP key file.                                                 |
| scppath                 | String                      |         | Directory where SCP resides.                                  |
| scpuser                 | String                      |         | Username used by SCP.                                         |
| scpusercmd              | String                      |         | Command for copying files to remote location.                 |

TABLE 6-115: PROPERTIES FOR REMOTE AND CLOUD ACCESS.

| PROPERTY    | VALUE              | DEFAULT | DESCRIPTION                            |
|-------------|--------------------|---------|----------------------------------------|
| sshcmd      | ssh   putty   user |         | SSH command.                           |
| sshkey      | String             |         | SSH key file.                          |
| sshpath     | String             |         | Directory where SSH resides.           |
| sshporthost | String             |         | Port host.                             |
| sshports    | String             |         | Ports that should be forwarded by SSH. |
| sshuser     | String             |         | Username used by SSH.                  |

TABLE 6-116: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                          |
|-------------|----------|---------|--------------------------------------|
| graphics    | on   off | off     | Use graphics.                        |
| maxalive    | Integer  |         | Alive time (seconds).                |
| maxallow    | Integer  | 1       | Maximum number of simultaneous jobs. |
| maxrestarts | Integer  |         | Maximum number of job restarts.      |

