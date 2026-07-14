# **SYNTAX**

```
model.component(<ctag>).massProp().create(<tag>,"MassProperties");
model.component(<ctag>).massProp(<tag>).selection();
model.component(<ctag>).massProp(<tag>).set(<pname>,<expr>);
model.component(<ctag>).massProp(<tag>).image();
model.component(<ctag>).massProp(<tag>).create(<mctag>, "MassContributions");
model.component(<ctag>).massProp(<tag>).feature(<mctag>).selection()
model.component(<ctag>).massProp(<tag>).feature(<mctag>).set(<pname>,<expr>);
```

#### **DESCRIPTION**

*Creating Mass Properties and Providing Geometry Source Selections*

model.component(*<ctag>*).massProp().create(*<tag>*,"MassProperties") creates a mass properties object that computes variables for mass properties such as total mass and the center of mass.

model.component(*<ctag>*).massProp(*<tag>*).selection().set(...) defines a local selection that assigns the mass properties to geometric entities that act as sources. For a complete list of methods available under selection(), see model.selection().

*Specifying Density and Mass Properties*

You can specify the density to be taken from a physics. For example,

```
model.component(<ctag>).massProp(<tag>).set("densitySource", "fromSpecifiedPhysics")
model.component(<ctag>).massProp(<tag>).feature("mc1").set("physics", "solid");
```

takes the density from the Solid Mechanics interface solid.

You can also specify a user-defined density. For example, to specify the density to be 1107 kg/m3, use

```
model.component(<ctag>).massProp(<tag>).set("densitySource", "userDefined");
model.component(<ctag>).massProp(<tag>).set("expr","1107[kg/m^3]");
```

To create variables for the center of mass and to not create variables for the moment of inertia:

```
model.component(<ctag>).massProp(<tag>).set("createCenterOfMass","on");
model.component(<ctag>).massProp(<tag>).set("createMomentOfInertia","off");
```

*Adding a Mass Contribution*

You can add mass contributions from other parts of the geometry (an adjacent boundary, for example) by creating a mass contribution:

```
model.component(<ctag>).massProp(<tag>).create("mc1","MassContributions");
model.component(<ctag>).massProp(<tag>).feature("mc1").set("expr", "3");
```

For the mass contributions, you can specify source selections and define the density in the same way as for the mass properties.

*Properties and Variables for massProp*

The massProp feature accepts the following properties:

TABLE 2-102: MASSPROP PROPERTIES.

| NAME                   | VALUE                                | DEFAULT     | DESCRIPTION                                                                               |
|------------------------|--------------------------------------|-------------|-------------------------------------------------------------------------------------------|
| createCenterOfMass     | on   off                             | on          | Create center of mass variables.                                                          |
| createMass             | on   off                             | on          | Create mass variable.                                                                     |
| createMassContribution | on   off                             | on          | Add a mass contribution.                                                                  |
| createMomentOfInertia  | on   off                             | on          | Create moment of inertia variables.                                                       |
| createPrincipalInertia | on   off                             | on          | Create principal moment of inertia<br>variables.                                          |
| createVolume           | on   off                             | on          | Create volume variable.                                                                   |
| densitySource          | fromSpecifiedPhysics <br>userDefined | userDefined | Source for the density values.                                                            |
| expr                   | String                               |             | User-defined density expression.                                                          |
| includeLowerPh         | on   off                             | on          | Include adjacent entities of lower<br>dimension for density values taken<br>from physics. |
| densityFrame           | frame                                | Material    | The frame to which the user-defined<br>density refers.                                    |

TABLE 2-102: MASSPROP PROPERTIES.

| NAME        | VALUE | DEFAULT          | DESCRIPTION                                |
|-------------|-------|------------------|--------------------------------------------|
| intorder    | 4     | Positive integer | Integration order.                         |
| outputFrame | frame | Material         | Integration frame for output<br>variables. |

The created variables for different mass properties have the following default names:

- **•** mass1.mass and mass1.volume for the mass and volume, respectively.
- **•** mass1.CM*X*, and so on, for the coordinates of the center of mass.
- **•** mass1.I*XY*, and so on, for the components of the moment of inertia.
- **•** mass1.Ip*1*, and so on, for the moment of inertia principal values.
- **•** mass1.Ip*1X*, and so on, for the moment of inertia principal directions.

