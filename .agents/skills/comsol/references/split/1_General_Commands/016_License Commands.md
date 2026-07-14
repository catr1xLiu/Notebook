# *License Commands*

ModelUtil provides functionality to check availability for and control the checkout of COMSOL product licenses.

ModelUtil.hasProduct(String... *product*): The hasProduct method checks if the current license allows to run the specified COMSOL products given as the input (as an array of strings).

ModelUtil.hasProductForFile(String *file*): The hasProductForFile method checks if the current license allows the specified COMSOL products needed to use that COMSOL MPH file.

ModelUtil.hasProductForFileonServer(String *file*): The hasProductForFileonServer method is similar to hasProductForFile but checks if the license allows the specified COMSOL products needed for a file on the server.

ModelUtil.checkoutLicense(String... *product*): The checkoutLicense method checks out licenses for the COMSOL products given as the input (as an array of strings).

ModelUtil.checkoutLicenseForFile(String *file*): The checkoutLicenseForFile method checks out the licenses needed to use that COMSOL MPH file.

ModelUtil.checkoutLicenseForFileonServer(String *file*): The checkoutLicenseForFileonServer method is similar to checkoutLicenseForFile but checks out the licenses needed to use that COMSOL MPH file on the server.

The following table lists the available products for which licenses can be checked for availability and checked out using the names in the **Name** column:

| PRODUCT                              | NAME                    |  |  |
|--------------------------------------|-------------------------|--|--|
| AC/DC Module                         | ACDC                    |  |  |
| Acoustics Module                     | ACOUSTICS               |  |  |
| Battery Design Module                | BATTERYDESIGN           |  |  |
| CAD Import Module                    | CADIMPORT, CADREADER    |  |  |
| CFD Module                           | CFD                     |  |  |
| Chemical Reaction Engineering Module | CHEM                    |  |  |
| Cluster computing functionality      | CLUSTERNODE             |  |  |
| Composite Materials Module           | COMPOSITEMATERIALS      |  |  |
| Corrosion Module                     | CORROSION               |  |  |
| Design Module                        | DESIGN                  |  |  |
| ECAD Import Module                   | ECADIMPORT              |  |  |
| Electric Discharge Module            | ELECTRICDISCHARGE       |  |  |
| Electrochemistry Module              | ELECTROCHEMISTRY        |  |  |
| Electrodeposition Module             | ELECTRODEPOSITION       |  |  |
| Fatigue Module                       | FATIGUE                 |  |  |
| File Import for CATIA V5             | CATIA5                  |  |  |
| Fuel Cell & Electrolyzer Module      | FUELCELLANDELECTROLYZER |  |  |
| Geomechanics Module                  | GEOMECHANICS            |  |  |
| Heat Transfer Module                 | HEATTRANSFER            |  |  |
| Liquid & Gas Properties Module       | LIQUIDANDGASPROPERTIES  |  |  |
| LiveLink™ for AutoCAD®               | LLAUTOCAD               |  |  |
| LiveLink™ for PTC® Creo® Parametric™ | LLCREOPARAMETRIC        |  |  |
| LiveLink™ for Excel®                 | LLEXCEL                 |  |  |
| LiveLink™ for Inventor®              | LLINVENTOR              |  |  |
| LiveLink™ for MATLAB®                | LLMATLAB                |  |  |
| LiveLink™ for Revit®                 | LLREVIT                 |  |  |
| LiveLink™ for Solid Edge®            | LLSOLIDEDGE             |  |  |
| LiveLink™ for SOLIDWORKS®            | LLSOLIDWORKS            |  |  |
| MEMS Module                          | MEMS                    |  |  |
| Microfluidics Module                 | MICROFLUIDICS           |  |  |
| Mixer Module                         | MIXER                   |  |  |
| Molecular Flow Module                | MOLECULARFLOW           |  |  |

| PRODUCT                               | NAME                     |
|---------------------------------------|--------------------------|
| Multibody Dynamics Module             | MULTIBODYDYNAMICS        |
| Nonlinear Structural Materials Module | NONLINEARSTRUCTMATERIALS |
| Optimization Module                   | OPTIMIZATION             |
| Particle Tracing Module               | PARTICLETRACING          |
| Pipe Flow Module                      | PIPEFLOW                 |
| Plasma Module                         | PLASMA                   |
| Polymer Flow Module                   | POLYMERFLOW              |
| Ray Optics Module                     | RAYOPTICS                |
| RF Module                             | RF                       |
| Rotordynamics Module                  | ROTORDYNAMICS            |
| Semiconductor Module                  | SEMICONDUCTOR            |
| Structural Mechanics Module           | STRUCTURALMECHANICS      |
| Subsurface Flow Module                | SUBSURFACEFLOW           |
| Uncertainty Quantification Module.    | UQ                       |
| Wave Optics Module                    | WAVEOPTICS               |

#### *Client-Server Commands*

ModelUtil provides functionality to control COMSOL client-server options. You can connect/disconnect and control connections from multiple clients to a server using, for example, the connect and disconnect methods.

ModelUtil.connect() connects to a COMSOL server (COMSOL Multiphysics server or COMSOL Server™). The COMSOL command arguments -Dcs.host=*<host>* and -Dcs.port=<*port>* can provide the hostname and port number. In case those are not provided, and the both client and server access the same file system, the host and port can be automatically transferred.

ModelUtil.connect(*<host>*,*<port>*) connects to a COMSOL server. The arguments *<host>* and *<port>* provide the hostname (a string) and port number (an integer) for the COMSOL server.

ModelUtil.connect(*<host>*,*<port>*,*<user>*,*<password>*) connects to a COMSOL server. The arguments *<host>*, *<port>*, *<user>* and *<password>* provide the hostname (a string), port number (an integer), user (a string), and password (a string) for the COMSOL server.

ModelUtil.connect(*<host>*,*<port>*,*<encryption>*) and

ModelUtil.connect(*<host>*,*<port>*,*<encryption>*,*<user>*,*<password>*) connects to a COMSOL server using encryption. With the boolean *<encryption>* set to false, it uses the ws WebSocket URI scheme; when set to true, it uses the secure wss (SSL) WebSocket URI scheme.

ModelUtil.disconnect() disconnects from a COMSOL server.

ModelUtil.setServerBusyHandler(*<ServerBusyHandler>*): Use the setServerBusyHandler method to register a ServerBusyHandler. Several clients can be connected to the same server, but only one client at a time can ask the server to perform an operation. The default behavior when attempting to call the server when it is busy is to issue an exception. By registering a ServerBusyHandler it is possible to make the client wait until the server is free again, and to set a time-out for how long to wait.

ServerBusyHandler is a class which controls how long a client waits for a busy server to become free again. It also has hooks to perform any action on the client side before starting to wait and just after stopping to wait. Implement a subclass in Java to ServerBusyHandler to change the default behavior.

ServerBusyHandler() creates a server-busy handler that waits for the server to be free without any time-out.

ServerBusyHandler(*<timeOut>*) creates a server-busy handler that waits for the server to be free. The time to wait, *<timeOut>*, is given in milliseconds.

postWaitForServer(*<boolean>*) is a hook to perform any action right after waiting for the server to become free.

preWaitForServer(*<host>*, *<username>*) is a hook to perform any action before beginning to wait for the server to become free. The inputs are the hostname and username as strings.

ModelUtil.setModelChangedHandler(<ModelChangedHandler>): The setModelChangedHandler method registers a handler of changes to models made by other clients. If any other client changes any model in use by this client, the model change handler is notified.

ModelChangedHandler is an interface for handling updates of the client when another client has modified any models in use by this client. Implement the interface in Java to change the default behavior.

handleModelChangeOnServer(*<modelChangeInfo>*) is called when another client has changed any models in use by this client. The ModelChangedHandler interface includes the boolean method

triggeredByChangesFromThisClient(). It has a default implementation returning false. In this case, the method handleModelChangeOnServer(*<modelChangeInfo>*) is only called when another client changes the model. If triggeredByChangesFromThisClient() returns true then

handleModelChangeOnServer(*<modelChangeInfo>*) is also called when the client registering the ModelChangedHandler changes the model.

ModelChangeInfo is a class with information about changes to models by other clients.

getModelTags() returns the tags of the models that have changed.

*The scanModel Method*

The scanModel method is an advanced tool that scans the raw data of a model file for a certain node type and collects the tag and label of all nodes that it finds. See Scanning Models for more information.

