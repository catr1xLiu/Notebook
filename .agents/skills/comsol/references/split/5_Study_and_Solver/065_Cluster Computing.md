# *Cluster Computing*

Use the Cluster Computing study step when you want to submit COMSOL Multiphysics batch jobs to a job scheduler that in turn runs the batch job on a second computer or cluster.

#### **SYNTAX**

```
model.study(stdname).create(fname, "ClusterComputing");
model.study(stdname).feature(fname).set(pname,value);
```

## **DESCRIPTION**

Study step.

The following properties are available.

TABLE 6-108: PROPERTIES FOR CLUSTER COMPUTING SETTINGS.

| PROPERTY     | VALUE                                                     | DEFAULT        | DESCRIPTION                                      |
|--------------|-----------------------------------------------------------|----------------|--------------------------------------------------|
| batchfile    | String                                                    | batchmodel.mph | Name of batch model file.                        |
| batchlic     | on   off                                                  |                | Use batch license.                               |
| clustertype  | general   whpc2008  <br>sge   slurm   pbs  <br>lsf   none |                | The type of cluster job.                         |
| extsolvergen | on   off                                                  | off            | Generate solver sequence in external<br>process. |

TABLE 6-108: PROPERTIES FOR CLUSTER COMPUTING SETTINGS.

| PROPERTY      | VALUE    | DEFAULT | DESCRIPTION                                                                               |
|---------------|----------|---------|-------------------------------------------------------------------------------------------|
| hostfile      | String   |         | Path to host file.                                                                        |
| mpiargs       | String   |         | Additional MPI arguments.                                                                 |
| mpibootstrap  | String   |         | Name of bootstrap server.                                                                 |
| mpipath       | String   |         | Installation directory for MPI.                                                           |
| nn            | Integer  | 1       | Number of nodes.                                                                          |
| rundir        | String   |         | The directory to store files used by the<br>batch job.                                    |
| schedargs     | String   |         | Additional scheduler arguments                                                            |
| scheduler     | String   |         | The scheduler for the batch job, if<br>clustertype is whpc2008, slurm, or<br>pbs, or lsf. |
| serverdir     | String   |         | Server directory.                                                                         |
| sgequeue      | String   |         | The name for the cluster queue, if<br>clustertype is sge, slurm, pbs, or<br>lsf.          |
| specbatchdir  | on   off |         | Specify different directory for batch<br>process than used by the current<br>process.     |
| specserverdir | on   off | off     | Specify server directory path.                                                            |
| user          | String   |         | User account for submitting the job if<br>clustertype is whpc2008, slurm,<br>pbs, or lsf. |

#### TABLE 6-109: PROPERTY FOR CLUSTER SETTINGS.

| PROPERTY | VALUE    | DEFAULT | DESCRIPTION                  |
|----------|----------|---------|------------------------------|
| pdistrib | on   off | off     | Distribute parametric sweep. |

#### TABLE 6-110: PROPERTIES FOR REMOTE AND CLOUD ACCESS.

| PROPERTY                | VALUE                             | DEFAULT | DESCRIPTION                                                                              |
|-------------------------|-----------------------------------|---------|------------------------------------------------------------------------------------------|
| filecmd                 | String                            |         | File for commands when remotecmd is file.                                                |
| filetransfercmd         | none   scp   file  <br>user       | none    | Command transfer file.                                                                   |
| filetransferfrom        | String                            |         | List of files to transfer from the other<br>computer after the batch jobs have finished. |
| filetransferfromusercmd | String                            |         | Command to transfer files from remote<br>location.                                       |
| filetransferto          | String                            |         | List of files to transfer to the other computer<br>before running the batch job.         |
| filetransfertousercmd   | String                            |         | Command to transfer files to remote location.                                            |
| remote                  | on   off                          |         | Run on remote server.                                                                    |
| remotecmd               | none   ssh   file  <br>mpi   user |         | Command to use when invoking a command on<br>a remote server.                            |
| remotehosts             | String                            |         | List of remote hostnames.                                                                |
| remoteos                | native   windows  <br>linux       |         | Command transfer file.                                                                   |
| remoteusercmd           | String                            |         | Command to use when invoking a command on<br>a remote server.                            |
| scpkey                  | String                            |         | SCP key file.                                                                            |

TABLE 6-110: PROPERTIES FOR REMOTE AND CLOUD ACCESS.

| PROPERTY    | VALUE              | DEFAULT | DESCRIPTION                                   |
|-------------|--------------------|---------|-----------------------------------------------|
| scppath     | String             |         | Directory where SCP resides.                  |
| scpuser     | String             |         | Username used by SCP.                         |
| scpusercmd  | String             |         | Command for copying files to remote location. |
| sshcmd      | ssh   putty   user |         | SSH command.                                  |
| sshkey      | String             |         | SSH key file.                                 |
| sshpath     | String             |         | Directory where SSH resides.                  |
| sshporthost | String             |         | Port host.                                    |
| sshports    | String             |         | Ports that should be forwarded by SSH.        |
| sshuser     | String             |         | Username used by SSH.                         |

TABLE 6-111: PROPERTIES FOR STUDY EXTENSIONS.

| PROPERTY    | VALUE    | DEFAULT | DESCRIPTION                          |
|-------------|----------|---------|--------------------------------------|
| graphics    | on   off | off     | Use graphics.                        |
| maxalive    | Integer  |         | Alive time (seconds).                |
| maxallow    | Integer  | 1       | Maximum number of simultaneous jobs. |
| maxrestarts | Integer  |         | Maximum number of job restarts.      |

