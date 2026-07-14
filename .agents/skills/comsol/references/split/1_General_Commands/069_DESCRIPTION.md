# **DESCRIPTION**

A material is a collection of property groups, where each property group defines a set of material properties, material functions, and model inputs that can be used to define a temperature-dependent material property, for example. A property group usually defines properties used by a particular material model to compute a fundamental quantity. A material property can either be a visible output property or a local parameter. The output property is visible for physics interfaces; local properties are only visible inside the property group. If two property groups define the same output property, the last property group determines the value of the output property. The material function is used by the property group to calculate a property or parameter value as a function of other variables, usually model inputs. The model input is a quantity that the material model recognizes as an input variable (temperature, for example). The actual variable that represents the model input is not known until the model is solved, and it can also be different between physics interfaces.

There are two types of property groups, user-defined and specialized. When a material is created, there is always one default user-defined property group present. To this property group it is possible to add output properties from a predefined list of quantities. These quantities are recognized by all physics interfaces as material properties — for example, thermal conductivity, electric conductivity, and density. The full list is presented in the physics interface for the default property group. The specialized property groups are built in and usually define few output properties that only some physics interfaces can access. These output properties are not necessarily part of the allowed properties for the default property group. An example of such a specialized group is the refractive index material model, which defines the real and imaginary part of the refractive index as output properties. These properties can only be accessed by the Electromagnetic Waves interface.

model.component(*<ctag>*).material().create(*<tag>*) creates a new material for the model component with the tag *<ctag>*.

model.component(*<ctag>*).material().create(*<tag>*,"Common") also creates a new material for the model component with the tag *<ctag>*.

model.component(*<ctag>*).material().create(*<tag>*,"Switch") creates a material switch for the model component with the tag *<ctag>*. You can add materials to the material switch:

```
model.component(<ctag>).material().create("sw1", "Switch", "");
model.component(<ctag>).material("sw1").feature().create("mat1", "Common", "");
model.component(<ctag>).material("sw1").feature().create("mat2", "Common", "");
```

model.component(*<ctag>*).material().create(*<tag>*,"Link") creates a material link for the model component with the tag *<ctag>*.

model.component(*<ctag>*).material().create(*<ptag>*,"PorousMedia") also creates a new local porous material for the model component with the tag *<ctag>*. Use model.component(*<ctag>*).

material(*<ptag>*).feature().create(*<subtag>*,*<subfeaturename>*,*<ctag>*); where *<subfeaturename>* is one of "Fluid", "Pellet", "Solid", or "ImFluid" to add a subfeature to the porous material feature representing a fluid, pellet, solid, or immobile fluid, respectively.

model.component(*<ctag>*).material().create(*<tag>*,"External") creates an external material that sets up an interface between a physics feature and functions in an external shared library (a DLL, .so, or .dylib file.). For an external material,

model.component(*<ctag>*).material(*<tag>*).set("path",*<path to external material file>*) sets the path to the external shared library. Also, use model.material(*<tag>*).set("threadSafe", "off")if the DLL is not thread safe (default is, "on"; that is, the DLL is thread safe).

model.material().create(*<tag>*,*<type>*) creates a global material, material switch, or material link.

model.component(*<ctag>*).material(*<tag>*).info(*<itag>*) returns an information item for a material.

model.component(*<ctag>*).material(*<tag>*).input() returns the list of model inputs.

For model.component(*<ctag>*).material(*<tag>*).insert(), see Inserting Materials.

model.component(*<ctag>*).material(*<tag>*).materialType("solid") or

model.component(*<ctag>*).material(*<tag>*).materialType("nonSolid")sets the material type to a solid or a nonsolid (that is, fluid or liquid) material, respectively.

model.component(*<ctag>*).material(*<tag>*).propertyGroup(*<mtag>*) gets the property group named *<mtag>* for the material.

model.component(*<ctag>*).material(*<tag>*).selection() returns the selection of the material. The selection determines which geometry the material belongs to.

model.component(*<ctag>*).material(*<tag>*).set("family",*<appearance>*) sets the appearance to a family of materials (as strings; "water", for example): air, aluminum, brick, concrete, copper, defaultmaterial, defaultplot, gold, iron, lead, magnesium, plastic, steel, titanium, water, as a few of the available material types, or custom. You can set a "color" property for plastic, defaultplot, and some other material types. With custom you can set these additional parameters for the appearance:

TABLE 2-103: PROPERTIES FOR CUSTOM APPEARANCE OF MATERIALS.

| PROPERTY              | VALUE                               | DEFAULT | DESCRIPTION                                                                                                                                                     |
|-----------------------|-------------------------------------|---------|-----------------------------------------------------------------------------------------------------------------------------------------------------------------|
| alpha                 | double                              | 1       | Diffuse and ambient color opacity.                                                                                                                              |
| ambient               | string[] (a color<br>or custom)     | custom  | Ambient light color.                                                                                                                                            |
| anisotropy            | double (0–1)                        | 0       | Add anisotropic specular highlighting.                                                                                                                          |
| anisotropyaxis        | string array of<br>length 3.        | 0,0,1   | The axis for the anisotropy.                                                                                                                                    |
| clearcoat             | double (0–1)                        | 0.15    | Clear coat for Cook–Torrance lighting model.                                                                                                                    |
| colornoise            | true   false                        | false   | Add an additional color to the appearance using<br>noise.                                                                                                       |
| colornoisebrush       | 0 1 2 3 4 5 6 7                     | 0       | No brush lines (0); brush lines around x, y, and z<br>(1, 2, 3, respectively); brush lines along x, y, and z<br>(4, 5, 6, respectively), if colornoise is true. |
| colornoisefrequency   | double                              | 1       | Additional color noise frequency, if colornoise<br>is true.                                                                                                     |
| colornoisenormalscale | double                              | 0       | Normal vector noise scale for the added color, if<br>colornoise is true.                                                                                        |
| colornoisescale       | double                              | 0       | Additional color noise scale, if colornoise is<br>true.                                                                                                         |
| colornoisetype        | 0 or 1                              | 0       | White noise (0) or simplex noise (1), if<br>colornoise is true.                                                                                                 |
| customambient         | double[]                            |         | RGB values for a custom ambient color.                                                                                                                          |
| customdiffuse         | double[]                            |         | RGB values for a custom diffuse color.                                                                                                                          |
| customspecular        | double[]                            |         | RGB values for a custom specular color.                                                                                                                         |
| diffuse               | string[] (a color<br>or custom)     | custom  | Diffuse light color.                                                                                                                                            |
| diffusewrap           | double (0–1)                        | 0.27    | Diffuse wrap for Cook–Torrance lighting model.                                                                                                                  |
| flipanisotropy        | true   false                        | false   | Flip the anisotropy for anisotropic specular<br>highlighting.                                                                                                   |
| fresnel               | double (0–1)                        | 0       | Reflectance at normal incidence for Cook<br>Torrance.                                                                                                           |
| lighting              | phong  <br>cooktorrance  <br>simple | phong   | Lighting model.                                                                                                                                                 |
| metallic              | double (0–1)                        | 0.1     | Metallic surface for Cook–Torrance lighting<br>model.                                                                                                           |
| noise                 | true   false                        | false   | Add noise to the appearance.                                                                                                                                    |
| noisecolor            | string[] (a color<br>or custom)     | custom  | The color for an additional color, if colornoise<br>is true.                                                                                                    |
| noisecolorblend       | double (0–1)                        | 0       | The color blend, if colornoise is true.                                                                                                                         |
| noisefreq             | double                              | 1       | Normal vector noise frequency.                                                                                                                                  |
| noisescale            | double                              | 0       | Normal vector noise scale.                                                                                                                                      |

TABLE 2-103: PROPERTIES FOR CUSTOM APPEARANCE OF MATERIALS.

| PROPERTY         | VALUE                           | DEFAULT | DESCRIPTION                                                                                                                              |
|------------------|---------------------------------|---------|------------------------------------------------------------------------------------------------------------------------------------------|
| normalnoisebrush | 0 1 2 3 4 5 6 7                 | 0       | No brush lines (0); brush lines around x, y, and z<br>(1, 2, 3, respectively); brush lines along x, y, and z<br>(4, 5, 6, respectively). |
| normalnoisetype  | 0 or 1                          | 0       | White noise (0) or simplex noise (1).                                                                                                    |
| pearl            | double (0–1)                    | 0.015   | Pearl surface for Cook-Torrance lighting model.                                                                                          |
| reflectance      | double (0–1)                    | 0       | Reflectance for Cook-Torrance lighting model.                                                                                            |
| roughness        | double (0–1)                    | 0.45    | Surface roughness for Cook-Torrance lighting<br>model.                                                                                   |
| shininess        | double                          | 64      | Specular exponent for Blinn-Phong lighting<br>model.                                                                                     |
| specular         | string[] (a color<br>or custom) | custom  | Specular light color.                                                                                                                    |

model.component(*<ctag>*).material().move(*<tag>*,*<position>*) moves the material *<tag>* to the zeroindexed position *<position>* in the list.

For a material link, model.component(*<ctag>*).material(*<tag>*).set("link",*<linktag>*); creates a material link from a component to the global material with the tag in *<linktag>*. For example,

```
model.component("comp1")).material().create("matlnk1", "Link");
model.material("matlnk1").set("link", "mat1");
```

creates a material link in the component comp1 and then links it to the global material mat1. The material link can also have a selection; for example, model.material("matlnk1").selection().all();.

## *Importing Materials*

You can import materials as global materials and as materials in a component.

To import global materials as mat1, mat2, and mat3 from myfile.xml, for example:

```
String[][] result = model.material().insert("myfile.xml",
           new String[]{"mat1", "mat2", "mat3"});
```

To import the same materials to the component comp1:

```
String[][] result = model.component("comp1").material().insert("myfile.xml",
           new String[]{"mat1", "mat2", "mat3"});
```

The insert method inserts materials from an MPH- or XML-file into the material list and returns the result of the operation as a double string array of length 3. The first array contains messages from the insert operation, the second array contains paths to the inserted objects, and the third array contains paths to the inserted references. An inserted reference is an object that an inserted object refers to and is not necessarily contained by any of the inserted objects. There can only be inserted references when importing from an MPH-file. The first parameter is the filename, and the second is the tags of the materials to insert. For protected MPH-files, you can supply a password as an optional third parameter.

See Materials in *The COMSOL File Formats* chapter for information about the XML-file format for materials that you can import and export.

## *Property Groups*

The following syntax examples describe the methods available for property groups added to a material (not available for material switches or material links).

mm = model.component(*<ctag>*).material(*<tag>*).propertyGroup().create(*<tag>*,*<descr>*) creates a new property group and stores it in the variable mm.

To define a method to set an output property of a material, use the following syntax (in this example you specify a density for the basic property group def):

```
model.component(<ctag>).material("mat1").propertyGroup("def").
set("density", String[] arg);
```

where arg is the string value to be defined. For a list of available physical property names (such as density), see Table 2-104.

mm.addInput(*<quantity>*) adds a new model input to the property group of the given quantity.

mm.descr(*<pname>*,*<descr>*) adds the description *<descr>* to the local material property with the name *<pname>*.

mm.func(*<ftag>*) returns the function object named *<ftag>*. For information about how to add and modify functions, see model.func().

mm.getMixingRule(*<pname>*) returns the mixing rule for the given material property.

mm.getPropertyInfo(*<pname>*) returns the property info (references, temperature conditions, and so on) for the given material property.

mm.getString(*<pname>*) returns the string value of the given property. If it is a vector or matrix quantity, the first value is returned.

mm.getStringArray(*<pname>*) returns the string array value of the given property. Matrix values are returned in a column-wise order.

mm.getValueType(*<pname>*)returns the main data type that a property can return. The data types are: String, StringArray, and StringMatrix.

mm.hasParam(*<pname>*) returns true if the property is defined by the property group.

mm.info(*<itag>*) returns the information object for the property group.

mm.isOutput(<*pname>*) returns true if the given local material parameter is an output property. For user-defined property groups the method returns true for all predefined material properties known to all physics interfaces. For the specialized property groups, it can also return true for other properties.

mm.param() returns a list of all parameters stored in the property group.

mm.removeInput(*<quantity>*) removes the given quantity from the list of model inputs.

mm.set(*<pname>*,*<expr>*) sets the expression for the given property. The expression can use local names for the properties, parameters, and model inputs. For vector and matrix properties, the expression can be string arrays of varying size. Isotropic matrices only require one element or a string, diagonal matrices require three elements, and so forth. Vectors always require three elements.

mm.setMixingRule(*<pname>*,*<mixRule>*) sets the mixing rule for the given material property.

mm.setPropertyInfo(*<pname>*,*<info>*) sets the property info (references, temperature conditions, and so on) for the given material property.

mm.size(*<pname>*) returns the size of the stored property, which usually is 1-by-1, 3-by-1, or 3-by-3, but other sizes are supported.

model.component(*<ctag>*).material(*<tag>*).propertyGroup() returns a list of all property groups in the material.

model.component(*<ctag>*).material(*<tag>*).propertyGroup(*<tag>*).info().create(*<tag>*,*<descr>*) creates a new information object that can contain detailed information about this property group. This could, for example, be used by the Material Library to define the Phase/Condition and Orientation/Condition fields.

mm.info(<itag>).title(*<title>*) sets the title of the information object.

mm.info(*<itag>*).title() returns the title.

mm.info(*<itag>*).body(*<body>*) sets the body text of the information object.

mm.info(*<itag>*).body() returns the body text.

![](_page_122_Picture_5.jpeg)

The term *material model* is sometimes used instead of *property group* in some contexts. The graphical user interface uses the term property group.

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| PHYSICAL QUANTITY                   | NAME                           |
|-------------------------------------|--------------------------------|
| Absorbed dose                       | absorbeddose                   |
| Absorption coefficient              | absorption                     |
| Acceleration                        | acceleration                   |
| Activation energy                   | activationenergy               |
| Angular acceleration                | angularacceleration            |
| Angular frequency                   | angularfrequency               |
| Area                                | area                           |
| Bulk viscosity                      | bulkviscosity                  |
| Capacitance                         | capacitance                    |
| Catalytic activity                  | catalyticactivity              |
| Characteristic acoustic impedance   | acousticimpedance              |
| Charge                              | charge                         |
| Coefficient of hygroscopic swelling | hygroscopicswellingcoefficient |
| Coefficient of thermal expansion    | thermalexpansioncoefficient    |
| Collisional power loss              | inelasticpowerloss             |
| Compliance                          | compliance                     |
| Compressibility of fluid            | compressibility                |
| Concentration                       | massconcentration              |
| Concentration                       | concentration                  |
| Conductance                         | conductance                    |
| Corrected pressure                  | correctedpressure              |
| Corrected velocity field            | correctedvelocity              |
| Current                             | current                        |
| Current density                     | currentdensity                 |
| Current source                      | currentsource                  |
| Damping constant per unit area      | dampingconstantperarea         |
| Damping constant per unit length    | dampingconstantperlength       |
| Damping constant per unit volume    | dampingconstantpervolume       |
| Density                             | density                        |
| Diffusion coefficient               | diffusion                      |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES. |                              |
|---------------------------------------------|------------------------------|
| PHYSICAL QUANTITY                           | NAME                         |
| Dimensionless                               | dimensionless                |
| Dipole moment                               | dipolemoment                 |
| Dispersed phase volume fraction             | dispersedphasevolumefraction |
| Displacement field                          | displacement                 |
| Displacement of shell normals               | dimensionless_displacement   |
| Dose equivalent                             | doseequivalent               |
| Dynamic viscosity                           | dynamicviscosity             |
| EEDF                                        | eedf                         |
| Edge load                                   | edgeload                     |
| Effective gas density                       | effectivegasdensity          |
| Effective plastic strain                    | effectiveplasticstrain       |
| Elasticity                                  | elasticity                   |
| Elastoresistive coupling                    | couplingelastoresistive      |
| Electric displacement field                 | displacementfield            |
| Electric field                              | electricfield                |
| Electric permittivity                       | permittivity                 |
| Electric potential                          | electricpotential            |
| Electric conductivity                       | electricconductivity         |
| Electrolyte conductivity                    | electrolyteconductivity      |
| Electrolyte potential                       | electricpotentialionicphase  |
| Electron density                            | electrondensity              |
| Electron energy density                     | electronenergydensity        |
| Electron mobility                           | electronmobility             |
| Energy                                      | energy                       |
| Energy density                              | energydensity                |
| Entropy                                     | entropydensity               |
| External free energy                        | externalfreeenergy           |
| Extinction coefficient                      | extinctioncoefficient        |
| Face load                                   | faceload                     |
| Flow rate out from source per unit length   | areapertime                  |
| Flow resistivity                            | pressuretimeperarea          |
| Fluid conductance                           | fluidconductance             |
| Force density                               | forcedensity                 |
| Force load                                  | force                        |
| Force potential                             | forcepotential               |
| Fowler-Nordheim coefficient                 | fowlernordheimcoefficient    |
| Frequency                                   | frequency                    |
| Frequency factor                            | frequencyfactor              |
| Head                                        | head                         |
| Heat capacity at constant pressure (molar)  | molarheatcapacity            |
| Heat capacity at constant pressure          | heatcapacity                 |
|                                             |                              |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| PHYSICAL QUANTITY<br>Heat source  | NAME<br>powerdensity          |
|-----------------------------------|-------------------------------|
| Heat transfer coefficient         | heattransfercoefficient       |
| Henry's constant                  | henrysconstant                |
| Hydraulic conductivity            | hydraulicconductivity         |
| Inductance                        | inductance                    |
|                                   |                               |
| Initial curvature                 | planeangleperlength           |
| Initial electron density          | initialelectrondensity        |
| Intensity (RMS)                   | intensity                     |
| Inward heat flux                  | heatflux                      |
| Isotropic structural loss factor  | lossfactor                    |
| Kinematic viscosity               | kinematicviscosity            |
| Length                            | length                        |
| Level set variable                | levelsetvariable              |
| Line charge                       | linecharge                    |
| Line current source               | linecurrentsource             |
| Log mass fraction                 | logmassfraction               |
| Log of electron density           | logelectrondensity            |
| Log of electron energy density    | logelectronenergydensity      |
| Logarithmic ratio                 | logarithmicratio              |
| Logarithmic ratio per unit length | logarithmicratioperunitlength |
| Luminous intensity                | luminousintensity             |
| Magnetic field                    | magneticfield                 |
| Magnetic flux                     | magneticflux                  |
| Magnetic flux density             | magneticfluxdensity           |
| Magnetic permeability             | permeability                  |
| Magnetic scalar potential         | magneticscalarpotential       |
| Magnetic vector potential         | magneticvectorpotential       |
| Mass                              | mass                          |
| Mass flow                         | massflow                      |
| Mass flux                         | massflux                      |
| Mass fraction                     | massfraction                  |
| Mass per unit area                | massperarea                   |
| Mass per unit length              | massperlength                 |
| Mass source                       | masssource                    |
| Mass transfer coefficient         | masstransfercoefficient       |
| Mean electron energy              | meanelectronenergy            |
| Mean flow velocity potential      | meanflowvelocitypotential     |
| Mean molar mass                   | molarmass                     |
| Molar enthalpy                    | energyperamount               |
| Molar flux                        | molarflux                     |
| Molar surface flux                | molarsurfaceflux              |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES. |                                      |
|---------------------------------------------|--------------------------------------|
| PHYSICAL QUANTITY                           | NAME                                 |
| Molar volume                                | molarvolume                          |
| Moment body load                            | torquepervol                         |
| Moment edge load                            | torqueperlength                      |
| Moment face load                            | torqueperarea                        |
| Natural logarithmic ratio                   | naturallogarithmicratio              |
| Natural logarithmic ratio per unit length   | naturallogarithmicratioperunitlength |
| Normal electron current density             | normalelectroncurrentdensity         |
| Normal ion current density                  | normalioncurrentdensity              |
| Number density                              | numberdensity                        |
| Particle momentum                           | momentum                             |
| Particle position                           | position                             |
| Permeability                                | hydraulicpermeability                |
| Phase field help variable                   | phasefieldhelpvariable               |
| Phase field variable                        | phasefieldvariable                   |
| Piezoelectric coupling d (strain-charge)    | couplingstraincharge                 |
| Piezoelectric coupling e (stress-charge)    | couplingstresscharge                 |
| Piezoresistive coupling                     | couplingpiezoresistive               |
| Plane angle                                 | planeangle                           |
| Point current source                        | pointcurrentsource                   |
| Poiseuille coefficient                      | poiseuillecoefficient                |
| Poisson's ratio                             | poissonsratio                        |
| Porosity                                    | porosity                             |
| Power                                       | power                                |
| Power flow                                  | powerflow                            |
| Power per unit charge                       | powerpercharge                       |
| Power per unit length                       | powerpermeter                        |
| Power per unit mass                         | powerpermass                         |
| Pressure                                    | pressure                             |
| Production rate                             | productionrate                       |
| Production/absorption coefficient           | heatproduction                       |
| Radiative intensity                         | radiativeintensity                   |
| Radioactivity                               | radioactivity                        |
| Ratio of specific heats                     | ratioofspecificheat                  |
| Reaction rate                               | reactionrate                         |
| Reciprocal area                             | reciprocalarea                       |
| Reciprocal initial interface distance       | reciprocallength_i                   |
| Reciprocal wall distance                    | reciprocallength                     |
| Recombination rate (domain)                 | recombinationratedomain              |
| Reduced electric field                      | reducedelectricfield                 |
| Reduced electron diffusivity                | reduceddiffusivity                   |
| Reduced electron mobility                   | reducedmobility                      |
|                                             |                                      |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES. |                               |
|---------------------------------------------|-------------------------------|
| PHYSICAL QUANTITY                           | NAME                          |
| Relative permeability                       | relpermeability               |
| Relative permittivity                       | relpermittivity               |
| Resistance                                  | resistance                    |
| Resistivity                                 | resistivity                   |
| Scattering coefficient                      | scattering                    |
| Secondary emission energy flux              | energyflux                    |
| Secondary emission flux                     | particleflux                  |
| Seebeck coefficient                         | seebeckcoefficient            |
| Solid angle                                 | solidangle                    |
| Space charge density                        | spacechargedensity            |
| Specific dissipation rate                   | specificdissipationrate       |
| Specific energy                             | specificenergy                |
| Speed of sound                              | soundspeed                    |
| Spring constant per unit area               | springconstantperarea         |
| Spring constant per unit length             | springconstantperlength       |
| Spring constant per unit volume             | springconstantpervolume       |
| Squared slip velocity                       | slipvelocity                  |
| Storage                                     | storage                       |
| Strain energy per unit area                 | energydensityperarea          |
| Strain energy per unit length               | energydensityperlength        |
| Strain reference temperature                | strainreferencetemperature    |
| Stress tensor                               | stress                        |
| Substance                                   | substance                     |
| Surface capacitance                         | surfacecapacitance            |
| Surface charge density                      | surfacechargedensity          |
| Surface current density                     | surfacecurrentdensity         |
| Surface electric conductivity               | surfaceconductivity           |
| Surface emissivity                          | emissivity                    |
| Surface energy density                      | surfaceenergydensity          |
| Surface magnetic current density            | surfacemagneticcurrentdensity |
| Surface resistance                          | surfaceresistance             |
| Surface site concentration                  | surfaceconcentration          |
| Surface tension coefficient                 | surfacetensioncoefficient     |
| Temperature                                 | temperature                   |
| Thermal conductivity                        | thermalconductivity           |
| Time                                        | time                          |
| Time change in pressure head                | timechangeinpressurehead      |
| Torque                                      | torque                        |
| Total damping constant                      | dampingconstant               |
| Total spring constant                       | springconstant                |
|                                             |                               |

TABLE 2-104: AVAILABLE PHYSICAL QUANTITIES.

| PHYSICAL QUANTITY                      | NAME                        |
|----------------------------------------|-----------------------------|
| Trap density distribution (domain)     | trapdensitydomain           |
| Turbulent dissipation rate             | turbulentdissipationrate    |
| Turbulent kinetic energy               | turbulentkineticenergy      |
| Undamped turbulent kinematic viscosity | turbulentkinematicviscosity |
| Velocity field                         | velocity                    |
| Velocity potential                     | velocitypotential           |
| Volume                                 | volume                      |
| Volume fraction                        | volumefraction              |
| Volume per time                        | volumepertime               |
| Volumetric heat capacity               | volumetricheatcapacity      |
| Wave number                            | wavenumber                  |
| Wavelength                             | wavelength                  |
| Young's modulus                        | youngsmodulus               |

#### **SEE ALSO**

model.func(), model.physics()

*model.mesh()*

Meshing sequences.

![](_page_127_Picture_6.jpeg)

See the Mesh section for more information.

#### **SYNTAX**

```
model.component(<ctag>).mesh().create(<tag>,<gtag>);
model.component(<ctag>).mesh().remove(<tag>);
model.component(<ctag>).mesh(<tag>).create(<ftag>,operation);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).create(<ftag2>,operation);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).feature().meshMethod
model.component(<ctag>).mesh(<tag>).current(<ftag>);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).active(boolean);
model.component(<ctag>).mesh(<tag>).feature(<ftag>).isActive();
model.component(<ctag>).mesh(<tag>).feature().move(<ftag>,<position>);
model.component(<ctag>).mesh(<tag>).feature().remove(<ftag>);
model.component(<ctag>).mesh(<tag>).feature().image();
model.component(<ctag>).mesh(<tag>).clearMesh();
model.component(<ctag>).mesh(<tag>).geom();
model.component(<ctag>).mesh(<tag>).image();
model.component(<ctag>).mesh(<tag>).run(<ftag>);
model.component(<ctag>).mesh(<tag>).run();
model.component(<ctag>).mesh().run();
model.component(<ctag>).mesh(<tag>).current();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).status();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).message();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).componentSelection();
model.component(<ctag>).mesh(<tag>).feature(<ftag>).outputSelection();
model.component(<ctag>).mesh(<tag>).meshGetMethod
model.component(<ctag>).mesh(<tag>).data().meshModificationMethod
model.component(<ctag>).mesh(<tag>).stat().meshStatisticsMethod
model.component(<ctag>).mesh(<tag>).measure().measurementMethod
model.component(<ctag>).mesh(<tag>).export(<filename>);
DESCRIPTION
Creating and Deleting a Meshing Sequence
model.component(<ctag>).mesh().create(<tag>,<gtag>) creates a meshing sequence (or just mesh) for the 
geometry sequence <gtag> and assigns it the tag <tag>.
model.component(<ctag>).mesh().remove(<tag>) removes the meshing sequence <tag>.
Creating, Editing, and Deleting Features
model.component(<ctag>).mesh(<tag>).create(<ftag>,operation) adds a feature <ftag> of type 
operation to the meshing sequence <tag>, after the current feature.
model.component(<ctag>).mesh(<tag>).feature(<ftag>).set(property,<value>) sets the property 
property defined for the feature <ftag> to the value <value>. All data types listed in Table 2-4 are supported; 
the applicable data types differ between the properties. String expressions can use parameters from model.param().
model.component(<ctag>).mesh(<tag>).feature(<ftag>).getType(property) returns the value of a 
property in the feature <ftag>.
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection().selMethod manages the 
selection of the feature <ftag>. The available selection methods are described in Selection Methods.
model.component(<ctag>).mesh(<tag>).feature(<ftag>).selection(property).selMethod
manipulates the selection of the property property. The available selection methods are described in Selection
```

Methods.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).feature()*.meshMethod* manages the entity list for the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).current(*<ftag>*) sets the current feature to be *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).active(false) disables the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).active(true) enables the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).isActive() returns true if the feature *<ftag>* is enabled, and false otherwise.

model.component(*<ctag>*).mesh(<*tag*>).feature(<*ftag*>)).

getAllowedPropertyValues(property) returns the set of allowed values for a property if the set is a finite set of strings; otherwise, it returns null.

model.component(*<ctag>*).mesh(*<tag>*).feature().move(*<ftag>,<position>*) moves the feature *<ftag>* to the zero indexed position *<position>* in the sequence.

model.component(*<ctag>*).mesh(*<tag>*).feature().remove(*<ftag>*) removes the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).clearMesh() removes all features from the sequence and clears the mesh.

## *Building Features*

After each build operation, the current feature is set as the last of features that were built. The mesh is updated to be the mesh generated by these features.

model.component(*<ctag>*).mesh(*<tag>*).run(*<ftag>*) builds all features up to (and including) the feature *<ftag>*.

model.component(*<ctag>*).mesh(*<tag>*).run() builds all features.

model.component(*<ctag>*).mesh().run() builds all meshing sequences.

#### *Getting Build Status*

String fTag = model.component(*<ctag>*).mesh(*<tag>*).current() returns the tag of the current feature. If the current state is before the first feature, the empty string "" is returned.

String status = model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).status() returns the status of the feature *<ftag>*. The status is built, warning, needs\_rebuild, edited, or error.

String msg = model.component(*<ctag>*).mesh(*<tag>*).feature(*<ftag>*).message() returns the warning/error message of the feature *<ftag>*.

