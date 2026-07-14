# Getting Started

#### In this section:

- **•** The Model Object
- **•** Compiling a Model File for Java®
- **•** The Model File for Java
- **•** Running a Compiled Model File for Java from the Desktop
- **•** Running a Compiled Model File as a Batch Job from the Desktop
- **•** Running a Compiled Model File with the COMSOL Batch Command
- **•** Getting the COMSOL Installation Path from the Windows Registry
- **•** Setting up Eclipse for Compiling and Running a Java® File

### *The Model Object*

In the COMSOL API you access models through the *model object*, which contains all algorithms and data structures for a COMSOL model. The COMSOL Desktop also uses the model object to represent your model. This means that the model object and the COMSOL Desktop behavior are virtually identical.

You use *methods* to create, modify, and access your model. The model object provides a large number of methods, including methods for setting up and running *sequences of operations* to create geometry, meshes, and for solving your model. The methods are structured in a tree-like way, much similar to the nodes in the model tree in the *Model Builder* window on the COMSOL Desktop. The top-level methods just return references that support further methods. At a certain level the methods perform actions, such as adding data to the model object, performing computations, or returning data.

You must have a basic understanding of the Java® programming language in order to fully appreciate how to work with the model object. However, the Application Builder includes tools like code recording, auto-completion, and predefined code templates that make it easier to create methods.

## *Compiling a Model File for Java*®

![](_page_2_Picture_15.jpeg)

With the COMSOL Compiler™, you can compile applications created using the Application Builder into standalone, runnable apps. See the Application Builder documentation for more information.

First make sure that COMSOL Multiphysics is installed. See the *COMSOL Multiphysics Installation Guide* for more information if required.

To test compiling a model files for Java, load feeder\_clamp.mph from the COMSOL Multiphysics Application Library into the COMSOL Desktop.

You can learn most of the syntax for creating a model using the COMSOL API by first creating a model using the COMSOL Desktop and then saving the model as an application file for Java.

To open the **Application Libraries** window ( ):

![](_page_3_Picture_2.jpeg)

button in the toolbar.

- compressed, you sometimes find it under **Layout** > **Windows**. **•** You can also customize the Quick Access Toolbar and then click the **Application Libraries** ( )
- **•** From the **File** menu select **Application Libraries**.

![](_page_3_Picture_6.jpeg)

To open the **Application Libraries** window ( ):

![](_page_3_Picture_8.jpeg)

**•** From the **File** or **Windows** menu select **Application Libraries**.

In the Application Libraries tree, expand **COMSOL Multiphysics** and then **Structural Mechanics**. Select the **feeder\_clamp** model, then click the **Open** button to open it. To get a Java file to compile, choose **Save As** from the **File** menu and choose **Model file for Java (\*.java)** as the file type. It is suggested that you save the file as feeder\_clamp.java in your home directory.

```
To compile feeder_clamp.java, enter
  <COMSOL path>\bin\win64\comsolcompile feeder_clamp.java
on Windows and
  <COMSOL path>/bin/comsol compile feeder_clamp.java
on Linux and macOS, where <COMSOL path> is the COMSOL installation directory.
```

### *The Model File for Java*

The model file for Java has the following structure:

```
import com.comsol.model.*;
import com.comsol.model.util.*;
public class feeder_clamp {
  public static void main(String[] args) {
    run();
  }
  public static Model run() {
    Model model = ModelUtil.create("Model");
    ...
    return model;
  }
}
```

Any model that you create in the COMSOL Desktop can be saved as a model file for Java.

![](_page_4_Picture_1.jpeg)

When you compile a model file for Java into a class file and run it, COMSOL runs exactly those instructions that are included in the model file for Java. When opening an MPH-file and saving it as a Java file only those sequences that have been explicitly run are run in the Java file. But saving it as a model file for Java, the file does not contain a runAll command for the solver sequence. To run a solver sequence, add a line similar to model.sol("sol1").runAll(); (where sol1 is the tag for the solver to run) at the bottom of the Java file, above the line that contains return model;.

### *Running a Compiled Model File for Java from the Desktop*

Select **Open** on the **File** menu. In the **Open** dialog, next to the **File name** field, select **Compiled Model File for Java (\*.class)**. Click **Open**. The file is run and appears as the model in the COMSOL Desktop.

### *Running a Compiled Model File as a Batch Job from the Desktop*

Right-click **Job Sequences** in a study and add a study. In the added study, right-click and add **External Class** under **Other**. Then right-click the batch sequence and select **Compute**.

Runs the main function of a compiled class with the system property cs.currentmodel set to the tag of the model calling the class. Thus you can retrieve the current model using the steps:

```
import java.io.*;
tag = System.getProperty("cs.currentmodel");
model = ModelUtil.model(tag);
```

### *Running a Compiled Model File with the COMSOL Batch Command*

To run the file, enter

```
<COMSOL path>\bin\win64\comsolbatch -inputfile feeder_clamp.class
on Windows, or enter
  <COMSOL path>/bin/comsol batch -inputfile feeder_clamp.class
on Linux and Mac, where <COMSOL path> is the COMSOL Multiphysics installation directory.
```

## *Getting the COMSOL Installation Path from the Windows Registry*

If you want to have your application find your COMSOL Multiphysics installation automatically, you can have your application examine the registry key

```
HKEY_LOCAL_MACHINE\SOFTWARE\COMSOL\COMSOL63\
```

The value name COMSOLROOT contains the installation path.

## *Setting up Eclipse for Compiling and Running a Java*® *File*

Instead of using the COMSOL commands for compiling and running a Java® file that uses the COMSOL API one can use an Integrated Development Environment for doing these tasks. Using Eclipse makes it easier to write the Java code because Eclipse has built-in support for code completion and syntax highlighting. Furthermore, the debugger that comes as a part of Eclipse can be used to run the code line by line to verify the function of the code

and check for any programming errors. Eclipse is free and can be downloaded from [www.eclipse.org.](https://www.eclipse.org) To set up Eclipse for running an exported Java file, perform the following actions in Eclipse:

- **1** Create a new Java Project and click **Next**.
- **2** Go to the **Libraries** tab, select the **Classpath** entry, and click **Add External JARs**. Add all JAR files placed in the plugins directory under the COMSOL installation directory (typically C:\Program Files\COMSOL\COMSOL63\Multiphysics). This allows Eclipse to find the definitions of the classes used by the COMSOL API and to run the code in client/server mode. Click **Finish**.
- **3** Drag and drop your exported Java file the src folder of your Eclipse project.
- **4** Add this line to the beginning of the main method ModelUtil.initStandalone(false);

The argument should be false for programs that do not use graphics and true for applications that do.

- **5** To run your Java program, you can create a Run Configuration in Eclipse. You do this from **Run Configurations** on the **Run** menu in Eclipse. There, select the **Environment** tab and then click the **New** button. In the **New Environment Variable** dialog, add the following variables; then click **OK**:
  - **-** On Windows, use the **Name** PATH (on Windows) and enter the following text in **Value**: <comsolinstalldir>/lib/win64, where <comsolinstalldir> is the directory where COMSOL Multiphysics is installed.
  - **-** On Linux, use the **Name** LD\_LIBRARY\_PATH and enter the following text in **Value**: <comsolinstalldir>/ lib/glnxa64:<comsolinstalldir>/lib/glnxa64/gcc:<comsolinstalldir>/ext/graphicsmagick/ glnxa64:<comsolinstalldir>/ext/cadimport/glnxa64, where <comsolinstalldir> is the directory where COMSOL Multiphysics is installed. Also add the variable with the **Name** LD\_PRELOAD and enter the **Value** <comsolinstalldir>/java/glnxa64/jre/lib/amd64/libjsig.so. If the operating system is set to use a comma as the decimal separator, add a variable with the **Name** LC\_ALL and the **Value** set to C to enforce the COMSOL software to use a period as the decimal separator.
  - **-** On macOS, use the **Name** DYLD\_LIBRARY\_PATH and enter the following text in **Value**: <comsolinstalldir>/ lib/maci64:<comsolinstalldir>/ext/graphicsmagick/maci64:<comsolinstalldir>/ext/ cadimport/maci64, where <comsolinstalldir> is the directory where COMSOL Multiphysics is installed. Click **Apply**.
- **6** The Java program can now be started in either Run or Debug mode from Eclipse. The Java program is run as a single process where the COMSOL libraries are being loaded as requested. This is the preferred way of running normal, small model files.
- **7** For large simulation where the application itself has to hold many megabytes in memory in addition to the memory requirement of COMSOL, it can be beneficial to run in client-server mode. To do so, open the Java file in the editor and go to the main method. Now you have to remove the line added in step 4 and add two new lines that control the connection to the COMSOL server from your own program. The main method needs to look like this:

```
public static void main(String[] args) {
    ModelUtil.connect("localhost", 2036);
    run();
    ModelUtil.disconnect();
}
```

When you have edited the main method you must save the file. Eclipse automatically compiles the file.

- **8** You also need to call System.exit(0) at the end of the Java program to terminate the process.
- **9** To run the code you must first start the COMSOL server. When the server has started note the port number that is written in the console. If this number does not match the number written in the call to ModelUtil.connect you have to edit this call and save the file again.

The Java program can now be started in either Run or Debug mode from Eclipse. Notice that the COMSOL server window responds by writing that a connection has been set up when your application starts.

