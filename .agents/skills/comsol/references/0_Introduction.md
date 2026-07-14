# About the COMSOL API

You can use the COMSOL API to develop custom applications based on COMSOL. The easiest way to create such applications is by using the Application Builder available with the COMSOL software.

You can run Java class files with COMSOL API-based applications in different ways:

- **•** In the Application Builder as part of methods that you add using the Method Editor in the Application Builder's development environment (see also the *Application Programming Guide*).
- **•** From the COMSOL Desktop®. A model created using a class file appears automatically in the Desktop.
- **•** From a batch sequence in a study.
- **•** Using the comsol batch command.

You can create model methods for use with the Model Builder tree when creating and running COMSOL Multiphysics models in the COMSOL Desktop. The COMSOL Desktop also includes a Shell window, from which you can run COMSOL API commands.

The LiveLink™ *for* MATLAB® operates using the COMSOL API and additional utility M-file functions. See the *LiveLink™ for MATLAB* ®*User's Guide* for additional information.

Code examples for the individual API functions in this guide show what the code looks like when using Java® and when using the LiveLink™ *for* MATLAB®.

## *Additional COMSOL API Documentation*

You find additional COMSOL API documentation for specialized API commands, which is available with the Model Manager and with corresponding COMSOL products, in the following COMSOL documents:

- **•** The *Model Manager Reference Manual*.
- **•** The *CAD Import Module User's Guide*.
- **•** The *Design Module User's Guide*.
- **•** The *ECAD Import Module User's Guide*.
- **•** The CAD LiveLink™ products' *User's Guides*.

### *Where Do I Find More Information?*

A number of online resources have more information about COMSOL, including licensing and technical information. The electronic documentation, topic-based (or context-based) help, and the Application Libraries are all accessed through the COMSOL Desktop.

![](_page_0_Picture_19.jpeg)

If you are reading the documentation as a PDF file on your computer, the blue links do not work to open an application or content referenced in a different guide. However, if you are using the Help system in COMSOL Multiphysics, these links work to open other modules, application examples, and documentation sets.

#### **CONTACTING COMS OL BY EMAIL**

For general product information, contact COMSOL at info@comsol.com.

#### **COMSOL ACCESS AN D TECHNICAL SUPPORT**

To receive technical support from COMSOL for the COMSOL products, please contact your local COMSOL representative or send your questions to support@comsol.com. An automatic notification and a case number will be sent to you by email. You can also access technical support, software updates, license information, and other resources by registering for a COMSOL Access account.

#### **COMSOL ONLINE RESOURCES**

| COMSOL website             | www.comsol.com                         |
|----------------------------|----------------------------------------|
| Contact COMSOL             | www.comsol.com/contact                 |
| COMSOL Access              | www.comsol.com/access                  |
| Support Center             | www.comsol.com/support                 |
| Product Download           | www.comsol.com/product-download        |
| Product Updates            | www.comsol.com/product-update          |
| COMSOL Blog                | www.comsol.com/blogs                   |
| Discussion Forum           | www.comsol.com/forum                   |
| Events                     | www.comsol.com/events                  |
| COMSOL Application Gallery | www.comsol.com/models                  |
| COMSOL Video Gallery       | www.comsol.com/videos                  |
| Learning Center            | www.comsol.com/support/learning-center |
| Support Knowledge Base     | www.comsol.com/support/knowledgebase   |

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

# General Commands

This chapter contains reference information about general commands for creating and modifying the main parts of the model object and for creating general-purpose functionality in a model, such as functions, variables, units, coordinate systems, nonlocal couplings, and reports and presentations. It also contains information about image generation and about errors and warnings. In this chapter:

- **•** About General Commands
- **•** Plotting and Exporting Images
- **•** Errors and Warnings

# About General Commands

### *Overview of General-Purpose Commands*

The following table contains the available general-purpose commands and methods:

TABLE 2-1: GENERAL COMMANDS GROUPED BY FUNCTION.

| FUNCTION                                       | PURPOSE                                                              |
|------------------------------------------------|----------------------------------------------------------------------|
| get* and Selection Access Methods              | Access objects of the basic data types                               |
| set()                                          | Assign objects of the basic data types                               |
| setEntry()                                     | Set vector property value at specified entry                         |
| setIndex()                                     | Assign objects at indices of the basic data types                    |
| hasTag()                                       | Check if a feature has a certain tag.                                |
| Selections                                     | Selections                                                           |
| ModelUtil                                      | Model object utility methods                                         |
| model                                          | Model object                                                         |
| model.attr()                                   | Model entity list methods                                            |
| model.attr( <tag>)</tag>                       | Model entity methods                                                 |
| model.batch()                                  | Batch jobs                                                           |
| model.bem()                                    | Boundary elements (BEM)                                              |
| model.coeff()                                  | Coefficient form equations                                           |
| model.colorTheme(),<br>model.imageColorTheme() | Color themes, See Color Themes.                                      |
| model.common()                                 | Common definition nodes in components                                |
| model.component()                              | Model component nodes                                                |
| model.constr()                                 | Constraints                                                          |
| model.coordSystem()                            | Coordinate systems, PMLs, infinite elements, and absorbing<br>layers |
| model.cpl()                                    | Nonlocal couplings                                                   |
| model.elem()                                   | Elements                                                             |
| model.elementSet()                             | Mesh element sets                                                    |
| model.extraDim()                               | Extra dimensions                                                     |
| model.field()                                  | Fields                                                               |
| model.form()                                   | Settings forms                                                       |
| model.frame()                                  | Frames                                                               |
| model.func()                                   | Functions                                                            |
| model.geom()                                   | Geometry sequences                                                   |
| model.group()                                  | Load groups and constraint groups                                    |
| model.init()                                   | Initial values                                                       |
| model.intRule()                                | Integration orders                                                   |
| model.massProp()                               | Mass properties                                                      |
| model.material()                               | Materials                                                            |
| model.mesh()                                   | Meshing sequences                                                    |
| model.methodCall()                             | Model methods                                                        |