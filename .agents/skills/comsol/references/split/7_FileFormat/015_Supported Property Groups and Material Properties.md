# Supported Property Groups and Material Properties

The following table includes all supported property groups and material properties with their property group, property name, size, and SI unit:

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY         | PROPERTY GROUP<br>(API NAME)      | PROPERTY GROUP (DESCRIPTION)              | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                       | SIZE | UNIT                                         |
|------------------|-----------------------------------|-------------------------------------------|--------------------|-------------------------------------------------|------|----------------------------------------------|
| Electrochemistry | ElectrodePotential                | Equilibrium potential                     | Eeq                | Equilibrium potential                           | lxl  | V                                            |
| Electrochemistry | ElectrodePotential                | Equilibrium potential                     | dEeqdT             | Temperature derivative of equilibrium potential | lxl  | V/K                                          |
| Electrochemistry | ElectrodePotential                | Equilibrium potential                     | cEeqref            | Reference concentration                         | lxl  | mol/m <sup>3</sup>                           |
| Electrochemistry | OperationalSOC                    | Operational electrode state-of-charge     | socmax             | Maximum<br>electrode<br>state-of-charge         | lxl  | I                                            |
| Electrochemistry | OperationalSOC                    | Operational electrode state-of-charge     | socmin             | Minimum<br>electrode<br>state-of-charge         | lxl  | I                                            |
| Electrochemistry | ElectrolyteConductivity           | Electrolyte conductivity                  | sigmal             | Electrolyte conductivity                        | 3×3  | S/m                                          |
| Electrochemistry | ElectrolyteSaltConcentra tion     | Electrolyte salt concentration            | cElsalt            | Electrolyte salt concentration                  | lxl  | mol/m <sup>3</sup>                           |
| Electrochemistry | linearizedRes                     | Linearized resistivity                    | rho0               | Reference resistivity                           | lxl  | ohm·m                                        |
| Electrochemistry | linearizedRes                     | Linearized resistivity                    | alpha              | Resistivity temperature coefficient             | lxl  | I/K                                          |
| Electrochemistry | linearizedRes                     | Linearized resistivity                    | Tref               | Reference temperature                           | lxl  | K                                            |
| Electrochemistry | SpeciesProperties                 | Species properties                        | transpNum          | Transport number                                | lxl  | I                                            |
| Electrochemistry | SpeciesProperties                 | Species properties                        | fcl                | Activity dependence                             | lxl  | I                                            |
| Electrochemistry | ic                                | Intercalation strain                      | dvol               | Volumetric strain                               | lxl  | I                                            |
| Electrochemistry | LocalCurrentDensity               | Local current density                     | ilocmat            | Local current density expression                | lxl  | A/m <sup>2</sup>                             |
| Electrochemistry | PolymerElectrolyteWate rTransport | Polymer<br>electrolyte<br>water transport | alpha              | Water<br>transport<br>coefficient               | lxl  | s·mol <sup>2</sup> /<br>(kg·m <sup>3</sup> ) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                  | PROPERTY GROUP<br>(API NAME)                 | PROPERTY GROUP (DESCRIPTION)                                 | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                       | SIZE | UNIT                        |
|---------------------------|----------------------------------------------|--------------------------------------------------------------|--------------------|-------------------------------------------------|------|-----------------------------|
| Electrochemistry          | PolymerElectrolyteWate rTransport            | Polymer<br>electrolyte<br>water transport                    | xi                 | Electroosmotic coefficient                      | lxl  | I                           |
| Electrochemistry          | MembraneCrossover                            | Membrane<br>crossover                                        | Psi_H2             | Permeation coefficient                          | lxl  | s·mol/<br>kg                |
| Electrochemistry          | MembraneCrossover                            | Membrane<br>crossover                                        | Psi_O2             | Permeation coefficient                          | lxl  | s·mol/<br>kg                |
| Electrochemistry          | MembraneCrossover                            | Membrane<br>crossover                                        | Psi_N2             | Permeation coefficient                          | lxl  | s·mol/<br>kg                |
| Electrochemistry          | PolymerElectrolyteWate rAbsorptionDesorption | Polymer<br>electrolyte<br>water<br>absorption-<br>desorption | k_abs_dsp          | Absorption-<br>desorption<br>rate constant      | lxl  | mol/<br>(m <sup>2</sup> ·s) |
| Geometric<br>properties   | shell                                        | Shell                                                        | lth                | Thickness                                       | lxl  | m                           |
| Geometric<br>properties   | shell                                        | Shell                                                        | Irot               | Rotation                                        | lxl  | rad                         |
| Geometric<br>properties   | shell                                        | Shell                                                        | Ine                | Mesh elements                                   | lxl  | I                           |
| Electromagnetic<br>models | linzRes                                      | Linearized resistivity                                       | rho0               | Reference resistivity                           | lxl  | ohm·m                       |
| Electromagnetic<br>models | linzRes                                      | Linearized resistivity                                       | alpha              | Resistivity temperature coefficient             | lxl  | I/K                         |
| Electromagnetic<br>models | linzRes                                      | Linearized resistivity                                       | Tref               | Reference temperature                           | lxl  | K                           |
| Electromagnetic<br>models | LossTangent                                  | Loss tangent, loss angle                                     | delta              | Loss tangent, loss angle                        | lxl  | rad                         |
| Electromagnetic<br>models | LossTangent                                  | Loss tangent,<br>loss angle                                  | epsilonPrim        | Relative<br>permittivity<br>(real part)         | 3x3  | I                           |
| Electromagnetic<br>models | LossTangentDF                                | Loss tangent,<br>dissipation<br>factor                       | tanDelta           | Loss tangent,<br>dissipation<br>factor          | lxl  | I                           |
| Electromagnetic<br>models | LossTangentDF                                | Loss tangent,<br>dissipation<br>factor                       | epsilonPrim        | Relative<br>permittivity<br>(real part)         | 3x3  | I                           |
| Electromagnetic<br>models | DielectricLoss                               | Dielectric<br>losses                                         | epsilonBis         | Relative<br>permittivity<br>(imaginary<br>part) | 3x3  | I                           |
| Electromagnetic<br>models | DielectricLoss                               | Dielectric<br>losses                                         | epsilonPrim        | Relative permittivity (real part)               | 3×3  | I                           |
| Electromagnetic<br>models | DielectricLoss                               | Dielectric<br>losses                                         | eta_epsilon        | Dielectric loss factor                          | 3x3  | I                           |
| Electromagnetic<br>models | RefractiveIndex                              | Refractive index                                             | n                  | Refractive index, real part                     | 3x3  | I                           |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                  | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP (DESCRIPTION) | PROPERTY (NAME) | PROPERTY (DESCRIPTION)                          | SIZE | UNIT                                    |
|---------------------------|------------------------------|------------------------------|-----------------|-------------------------------------------------|------|-----------------------------------------|
| Electromagnetic<br>models | RefractiveIndex              | Refractive index             | ki              | Refractive index, imaginary part                | 3×3  | I                                       |
| Electromagnetic<br>models | MagneticLosses               | Magnetic losses              | murPrim         | Relative permeability (real part)               | lxl  | I                                       |
| Electromagnetic<br>models | MagneticLosses               | Magnetic losses              | murBis          | Relative<br>permeability<br>(imaginary<br>part) | lxl  | I                                       |
| Electromagnetic<br>models | HBCurve                      | H-B curve                    | normH           | Magnetic field norm                             | lxl  | A/m                                     |
| Electromagnetic<br>models | EffectiveHBCurve             | Effective H-B curve          | normHeff        | Effective<br>magnetic field<br>norm             | lxl  | A/m                                     |
| Electromagnetic models    | BHCurve                      | B-H curve                    | normB           | Magnetic flux density norm                      | lxl  | Т                                       |
| Electromagnetic models    | BHCurve                      | B-H curve                    | normH           | Magnetic field norm                             | lxl  | A/m                                     |
| Electromagnetic<br>models | BHCurve                      | B-H curve                    | Wpm             | Magnetic coenergy density                       | lxl  | J/m <sup>3</sup>                        |
| Electromagnetic<br>models | EffectiveBHCurve             | Effective B-H curve          | normBeff        | Effective<br>magnetic flux<br>density norm      | lxl  | Т                                       |
| Electromagnetic<br>models | EffectiveBHCurve             | Effective B-H curve          | normHeff        | Effective<br>magnetic field<br>norm             | lxl  | A/m                                     |
| Electromagnetic<br>models | RemanentFluxDensity          | Remanent flux density        | murec           | Recoil permeability                             | 3x3  | 1                                       |
| Electromagnetic<br>models | RemanentFluxDensity          | Remanent flux density        | normBr          | Remanent flux density norm                      | lxl  | Т                                       |
| Electromagnetic models    | BHsCurve                     | B-Hs curve                   | normB           | Magnetic flux density norm                      | lxl  | Т                                       |
| Electromagnetic<br>models | BHsCurve                     | B-Hs curve                   | normHs          | Shifted<br>magnetic field<br>norm               | lxl  | A/m                                     |
| Electromagnetic models    | BHsCurve                     | B-Hs curve                   | Hc              | Coercive<br>magnetic field                      | lxl  | A/m                                     |
| Electromagnetic<br>models | BHsCurve                     | B-Hs curve                   | Wpm             | Magnetic<br>coenergy<br>density                 | lxl  | J/m <sup>3</sup>                        |
| Electromagnetic models    | EJCurve                      | E-J<br>characteristic        | normE           | Electric field norm                             | lxl  | V/m                                     |
| Piezoresistive<br>models  | PiezoresistanceForm          | Piezoresistance<br>form      | Pil             | Piezoresistive coupling matrix, Voigt notation  | 6×6  | m <sup>4</sup> /<br>(s·A <sup>2</sup> ) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                  | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)          | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                | SIZE | UNIT |
|-----------------------------------------------------------|------------------------------|------------------------------------------|--------------------|----------------------------------------------------------|------|------|
| Piezoresistive<br>models                                  | ElastoresistanceForm         | Elastoresistance<br>form                 | ml                 | Elastoresistive<br>coupling<br>matrix, Voigt<br>notation | 6x6  | ?*m  |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | MsJA               | Saturation<br>magnetization                              | 3x3  | A/m  |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | aJA                | Domain wall<br>density                                   | 3x3  | A/m  |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | kJA                | Pinning loss                                             | 3x3  | A/m  |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | cJA                | Magnetization<br>reversibility                           | 3x3  | 1    |
| Electromagnetic<br>models                                 | JilesAtherton                | Jiles–Atherton<br>model<br>parameters    | alphaJA            | Interdomain<br>coupling                                  | 3x3  | 1    |
| Electromagnetic<br>models                                 | PMHBCurve                    | Permanent<br>magnet shifted<br>H-B curve | normHs             | Shifted<br>magnetic field<br>norm                        | 1x1  | A/m  |
| Electromagnetic<br>models                                 | PMBHCurve                    | Permanent<br>magnet shifted<br>B-H curve | normBpm            | Magnetic flux<br>density norm                            | 1x1  | T    |
| Electromagnetic<br>models                                 | Hc                           | Coercive<br>magnetic field               | Hc                 | Coercive<br>magnetic field                               | 1x1  | A/m  |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelCauchy        | Cauchy                                   | ODcca              | Cauchy<br>dispersion<br>coefficients                     | 3x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelCauchy        | Cauchy                                   | Trefcca            | Reference<br>temperature                                 | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelCauchy        | Cauchy                                   | Prefcca            | Reference<br>pressure                                    | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelConrad<br>y   | Conrady                                  | ODcra              | Conrady<br>dispersion<br>coefficients                    | 3x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelConrad<br>y   | Conrady                                  | Trefcra            | Reference<br>temperature                                 | 1x1  | K    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                  | PROPERTY GROUP<br>(API NAME)         | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                        | SIZE | UNIT |
|-----------------------------------------------------------|--------------------------------------|---------------------------------|--------------------|--------------------------------------------------|------|------|
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelConrad<br>y           | Conrady                         | Prefcra            | Reference<br>pressure                            | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelHerzbe<br>rger        | Herzberger                      | ODhza              | Herzberger<br>dispersion<br>coefficients         | 5x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelHerzbe<br>rger        | Herzberger                      | Trefhza            | Reference<br>temperature                         | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelHerzbe<br>rger        | Herzberger                      | Prefhza            | Reference<br>pressure                            | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottS<br>tandard    | Schott                          | ODsca              | Schott<br>dispersion<br>coefficients             | 6x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottS<br>tandard    | Schott                          | Trefsca            | Reference<br>temperature                         | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottS<br>tandard    | Schott                          | Prefsca            | Reference<br>pressure                            | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottE<br>xtended    | Schott<br>extended              | ODscb              | Schott<br>extended<br>dispersion<br>coefficients | 9x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottE<br>xtended    | Schott<br>extended              | Trefscb            | Reference<br>temperature                         | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSchottE<br>xtended    | Schott<br>extended              | Prefscb            | Reference<br>pressure                            | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSellmei<br>erStandard | Sellmeier                       | ODsma              | Sellmeier<br>dispersion<br>coefficients          | 6x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models | DispersionModelSellmei<br>erStandard | Sellmeier                       | Trefsma            | Reference<br>temperature                         | 1x1  | K    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                       | PROPERTY GROUP<br>(API NAME)                         | PROPERTY GROUP<br>(DESCRIPTION)                        | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                           | SIZE | UNIT |
|----------------------------------------------------------------|------------------------------------------------------|--------------------------------------------------------|--------------------|---------------------------------------------------------------------|------|------|
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erStandard                 | Sellmeier                                              | Prefsma            | Reference<br>pressure                                               | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified1                | Sellmeier<br>modified, type 1                          | ODsmb              | Sellmeier<br>modified, type<br>1 dispersion<br>coefficients         | 6x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified1                | Sellmeier<br>modified, type 1                          | Trefsmb            | Reference<br>temperature                                            | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified1                | Sellmeier<br>modified, type 1                          | Prefsmb            | Reference<br>pressure                                               | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified2                | Sellmeier<br>modified, type 2                          | ODsmc              | Sellmeier<br>modified, type<br>2 dispersion<br>coefficients         | 5x1  | 1    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified2                | Sellmeier<br>modified, type 2                          | Trefsmc            | Reference<br>temperature                                            | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelSellmei<br>erModified2                | Sellmeier<br>modified, type 2                          | Prefsmc            | Reference<br>pressure                                               | 1x1  | Pa   |
| Electromagnetic<br>models/Optical<br>dispersion<br>models      | DispersionModelTemper<br>atureDependentSellmeie<br>r | Temperature<br>dependent<br>Sellmeier                  | ODtds              | Temperature<br>dependent<br>Sellmeier<br>dispersion<br>coefficients | 30x1 | 1    |
| Electromagnetic<br>models/Thermo<br>optic dispersion<br>models | ThermoOpticDispersion<br>ModelSchott                 | Schott thermo<br>optic                                 | TOsco              | Schott<br>thermo-optic<br>dispersion<br>coefficients                | 6x1  | 1    |
| Electromagnetic<br>models/Thermo<br>optic dispersion<br>models | ThermoOpticDispersion<br>ModelSchott                 | Schott thermo<br>optic                                 | Trefsco            | Reference<br>temperature                                            | 1x1  | K    |
| Electromagnetic<br>models/Optical<br>attenuation<br>models     | AttenuationCoefficient                               | Attenuation<br>coefficient                             | alphaI             | Attenuation<br>coefficient                                          | 1x1  | 1/m  |
| Electromagnetic<br>models/Optical<br>attenuation<br>models     | InternalTransmittance2                               | Internal<br>transmittance, 2<br>mm sample<br>thickness | taui2              | Internal<br>transmittance,<br>2 mm sample<br>thickness              | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)                         | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                               | SIZE | UNIT |
|------------------------------------------------------------|------------------------------|---------------------------------------------------------|--------------------|---------------------------------------------------------|------|------|
| Electromagnetic<br>models/Optical<br>attenuation<br>models | InternalTransmittance5       | Internal<br>transmittance, 5<br>mm sample<br>thickness  | taui5              | Internal<br>transmittance,<br>5 mm sample<br>thickness  | 1x1  | 1    |
| Electromagnetic<br>models/Optical<br>attenuation<br>models | InternalTransmittance10      | Internal<br>transmittance,<br>10 mm sample<br>thickness | taui10             | Internal<br>transmittance,<br>10 mm sample<br>thickness | 1x1  | 1    |
| Electromagnetic<br>models/Optical<br>attenuation<br>models | InternalTransmittance25      | Internal<br>transmittance,<br>25 mm sample<br>thickness | taui25             | Internal<br>transmittance,<br>25 mm sample<br>thickness | 1x1  | 1    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | An_jr              | Jain-Roulston<br>coefficient (n<br>type), A             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Bn_jr              | Jain-Roulston<br>coefficient (n<br>type), B             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Cn_jr              | Jain-Roulston<br>coefficient (n<br>type), C             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Ap_jr              | Jain-Roulston<br>coefficient (p<br>type), A             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Bp_jr              | Jain-Roulston<br>coefficient (p<br>type), B             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Cp_jr              | Jain-Roulston<br>coefficient (p<br>type), C             | 1x1  | V    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | Nref_jr            | Band-gap<br>narrowing<br>reference<br>concentration     | 1x1  | 1/m3 |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | JainRoulstonModel            | Jain-Roulston<br>model                                  | alpha_jr           | Conduction<br>band fraction                             | 1x1  | 1    |
| Semiconductors/<br>Band-gap<br>narrowing<br>models         | SlotboomModel                | Slotboom<br>model                                       | Eref_sb            | Band-gap<br>narrowing<br>reference<br>energy            | 1x1  | V    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                           | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)        | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                           | SIZE | UNIT     |
|----------------------------------------------------|------------------------------|----------------------------------------|--------------------|-----------------------------------------------------|------|----------|
| Semiconductors/<br>Band-gap<br>narrowing<br>models | SlotboomModel                | Slotboom<br>model                      | Nref_sb            | Band-gap<br>narrowing<br>reference<br>concentration | 1x1  | 1/m3     |
| Semiconductors/<br>Band-gap<br>narrowing<br>models | SlotboomModel                | Slotboom<br>model                      | alpha_sb           | Conduction<br>band fraction                         | 1x1  | 1        |
| Semiconductors/<br>Generation<br>Recombination     | SRH                          | Shockley-Read<br>Hall<br>recombination | taun               | Electron<br>lifetime, SRH                           | 1x1  | s        |
| Semiconductors/<br>Generation<br>Recombination     | SRH                          | Shockley-Read<br>Hall<br>recombination | taup               | Hole lifetime,<br>SRH                               | 1x1  | s        |
| Semiconductors/<br>Generation<br>Recombination     | Direct                       | Direct<br>recombination                | C                  | Direct<br>recombination<br>factor                   | 1x1  | m3/s     |
| Semiconductors/<br>Generation<br>Recombination     | Auger                        | Auger<br>recombination                 | Cn                 | Auger<br>recombination<br>factor,<br>electrons      | 1x1  | m6<br>/s |
| Semiconductors/<br>Generation<br>Recombination     | Auger                        | Auger<br>recombination                 | Cp                 | Auger<br>recombination<br>factor, holes             | 1x1  | m6<br>/s |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | an                 | a factor,<br>electrons,<br>impact<br>ionization     | 1x1  | 1/V      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | ap                 | a factor, holes,<br>impact<br>ionization            | 1x1  | 1/V      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | bn                 | b factor,<br>electrons,<br>impact<br>ionization     | 1x1  | V/m      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | bp                 | b factor, holes,<br>impact<br>ionization            | 1x1  | V/m      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | cnii               | c factor,<br>electrons,<br>impact<br>ionization     | 1x1  | 1/K      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | cpii               | c factor, holes,<br>impact<br>ionization            | 1x1  | 1/K      |
| Semiconductors/<br>Generation<br>Recombination     | ImpactIonization             | Impact<br>ionization                   | dn                 | d factor,<br>electrons,<br>impact<br>ionization     | 1x1  | 1/K      |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)                | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                                                     | SIZE | UNIT             |
|------------------------------------------------|------------------------------|------------------------------------------------|--------------------|-----------------------------------------------------------------------------------------------|------|------------------|
| Semiconductors/<br>Generation<br>Recombination | ImpactIonization             | Impact<br>ionization                           | dp                 | d factor, holes,<br>impact<br>ionization                                                      | 1x1  | 1/K              |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | Eg0                | Band gap                                                                                      | 1x1  | V                |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | chi0               | Electron<br>affinity                                                                          | 1x1  | V                |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | Nv                 | Effective<br>density of<br>states, valence<br>band                                            | 1x1  | 1/m3             |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | Nc                 | Effective<br>density of<br>states,<br>conduction<br>band                                      | 1x1  | 1/m3             |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | mun                | Electron<br>mobility                                                                          | 1x1  | m2/<br>(V·s)     |
| Semiconductors                                 | SemicondMaterial             | Semiconductor<br>material                      | mup                | Hole mobility                                                                                 | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | meDG               | Electron<br>effective mass,<br>density<br>gradient                                            | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | mhDG               | Hole effective<br>mass, density<br>gradient                                                   | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | meOx               | Electron<br>effective mass,<br>density<br>gradient, for<br>penetration<br>depth in<br>barrier | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | mhOx               | Hole effective<br>mass, density<br>gradient, for<br>penetration<br>depth in<br>barrier        | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | meOxStar           | Electron<br>effective mass,<br>density<br>gradient, for<br>flux into<br>barrier               | 3x3  | kg               |
| Semiconductors                                 | SemicondMaterialDG           | Semiconductor<br>material,<br>density-gradient | mhOxStar           | Hole effective<br>mass, density<br>gradient, for<br>flux into<br>barrier                      | 3x3  | kg               |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                           | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME)    | PROPERTY<br>(DESCRIPTION)                          | SIZE | UNIT             |
|------------------------------------|------------------------------|---------------------------------|-----------------------|----------------------------------------------------|------|------------------|
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | mun0_pl               | Electron<br>mobility<br>reference                  | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | mup0_pl               | Hole mobility<br>reference                         | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | alphan_pl             | Electron<br>exponent                               | 1x1  | 1                |
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | alphap_pl             | Hole exponent                                      | 1x1  | 1                |
| Semiconductors/<br>Mobility models | PowerLawMobilityModel        | Power law<br>mobility model     | Tref_pl               | Reference<br>temperature                           | 1x1  | K                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | mun0_ref_a<br>rora    | Electron<br>mobility<br>reference                  | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | mup0_ref_a<br>rora    | Hole mobility<br>reference                         | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | mun_min_r<br>ef_arora | Electron<br>mobility<br>reference<br>minimum       | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | mup_min_r<br>ef_arora | Hole mobility<br>reference<br>minimum              | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | Nn0_ref_ar<br>ora     | Electron<br>reference<br>impurity<br>concentration | 1x1  | 1/m3             |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | Np0_ref_ar<br>ora     | Hole reference<br>impurity<br>concentration        | 1x1  | 1/m3             |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | alpha0_aror<br>a      | Alpha<br>coefficient                               | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | beta1_arora           | Mobility<br>reference<br>minimum<br>exponent       | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | beta2_arora           | Mobility<br>reference<br>exponent                  | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | beta3_arora           | Impurity<br>concentration<br>reference<br>exponent | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | beta4_arora           | Alpha<br>coefficient<br>exponent                   | 1x1  | 1                |
| Semiconductors/<br>Mobility models | AroraMobilityModel           | Arora mobility<br>model         | Tref_arora            | Reference<br>temperature                           | 1x1  | K                |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                           | PROPERTY GROUP<br>(API NAME)     | PROPERTY GROUP<br>(DESCRIPTION)       | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT             |
|------------------------------------|----------------------------------|---------------------------------------|--------------------|------------------------------------------------|------|------------------|
| Semiconductors/<br>Mobility models | FletcherMobilityModel            | Fletcher<br>mobility model            | F1_fl              | Fletcher<br>mobility<br>coefficient 1          | 1x1  | 1/<br>(V·m·s)    |
| Semiconductors/<br>Mobility models | FletcherMobilityModel            | Fletcher<br>mobility model            | F2_fl              | Fletcher<br>mobility<br>coefficient 2          | 1x1  | 1/m2             |
| Semiconductors/<br>Mobility models | FletcherMobilityModel            | Fletcher<br>mobility model            | Tref_fl            | Reference<br>temperature                       | 1x1  | K                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | alphan0_ct         | Electron alpha<br>coefficient                  | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | alphap0_ct         | Hole alpha<br>coefficient                      | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | vn0_ct             | Electron<br>saturation<br>velocity             | 1x1  | m/s              |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | vp0_ct             | Hole<br>saturation<br>velocity                 | 1x1  | m/s              |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | betan1_ct          | Electron alpha<br>exponent                     | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | betap1_ct          | Hole alpha<br>exponent                         | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | betan2_ct          | Electron<br>velocity<br>saturation<br>exponent | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | betap2_ct          | Hole velocity<br>saturation<br>exponent        | 1x1  | 1                |
| Semiconductors/<br>Mobility models | CaugheyThomasMobility<br>Model   | Caughey<br>Thomas<br>mobility model   | Tref_ct            | Reference<br>temperature                       | 1x1  | K                |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | deltan_ls          | Electron delta<br>coefficient                  | 1x1  | V/s              |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | deltap_ls          | Hole delta<br>coefficient                      | 1x1  | V/s              |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | mun1_ls            | Electron<br>mobility<br>reference 1            | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | mup1_ls            | Hole mobility<br>reference 1                   | 1x1  | m2<br>/<br>(V·s) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                           | PROPERTY GROUP<br>(API NAME)     | PROPERTY GROUP<br>(DESCRIPTION)       | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                             | SIZE | UNIT             |
|------------------------------------|----------------------------------|---------------------------------------|--------------------|-----------------------------------------------------------------------|------|------------------|
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | mun2_ls            | Electron<br>mobility<br>reference 2                                   | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | mup2_ls            | Hole mobility<br>reference 2                                          | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | alphan_ls          | Electron alpha<br>coefficient                                         | 1x1  | 1                |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | alphap_ls          | Hole alpha<br>coefficient                                             | 1x1  | 1                |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | Tref_ls            | Reference<br>temperature                                              | 1x1  | K                |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | Eref_ls            | Electric field<br>reference                                           | 1x1  | V/m              |
| Semiconductors/<br>Mobility models | LombardiSurfaceMobility<br>Model | Lombardi<br>surface mobility<br>model | Nref_ls            | Doping<br>concentration<br>reference                                  | 1x1  | 1/m3             |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | T_ref_kl           | Reference<br>temperature                                              | 1x1  | K                |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | mu_e_max_<br>kl    | Klaassen max<br>electron<br>mobility                                  | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | mu_h_max_<br>kl    | Klaassen max<br>hole mobility                                         | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | mu_e_min_<br>kl    | Klaassen min<br>electron<br>mobility                                  | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | mu_h_min_<br>kl    | Klaassen min<br>hole mobility                                         | 1x1  | m2<br>/<br>(V·s) |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | theta_e_kl         | Klaassen lattice<br>mobility<br>electron<br>exponent                  | 1x1  | 1                |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | theta_h_kl         | Klaassen lattice<br>mobility hole<br>exponent                         | 1x1  | 1                |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model    | alpha_e_1_k<br>l   | Klaassen<br>dopant and<br>carrier<br>mobility<br>electron<br>exponent | 1x1  | 1                |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                           | PROPERTY GROUP<br>(API NAME)     | PROPERTY GROUP<br>(DESCRIPTION)    | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                           | SIZE | UNIT |
|------------------------------------|----------------------------------|------------------------------------|--------------------|---------------------------------------------------------------------|------|------|
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | alpha_h_1_<br>kl   | Klaassen<br>dopant and<br>carrier<br>mobility hole<br>exponent      | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_ref_e_1_<br>kl   | Klaassen<br>electron<br>reference<br>density                        | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_ref_h_1_<br>kl   | Klaassen hole<br>reference<br>density                               | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | c_D_kl             | Klaassen<br>cluster<br>function donor<br>coefficient                | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | c_A_kl             | Klaassen<br>cluster<br>function<br>acceptor<br>coefficient          | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_ref_D_kl         | Klaassen<br>cluster<br>function donor<br>reference<br>density       | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_ref_A_kl         | Klaassen<br>cluster<br>function<br>acceptor<br>reference<br>density | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | f_BH_kl            | Klaassen P<br>parameter BH<br>weight                                | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | f_CW_kl            | Klaassen P<br>parameter<br>CW weight                                | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | N_BH_kl            | Klaassen P<br>parameter BH<br>prefactor                             | 1x1  | 1/m3 |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | P_CW_kl            | Klaassen P<br>parameter<br>CW prefactor                             | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | s_1_kl             | Klaassen 1st s<br>parameter                                         | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | s_2_kl             | Klaassen 2nd s<br>parameter                                         | 1x1  | 1    |
| Semiconductors/<br>Mobility models | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model | s_3_kl             | Klaassen 3rd s<br>parameter                                         | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME)     | PROPERTY GROUP<br>(DESCRIPTION)           | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT |
|------------------------------------------------|----------------------------------|-------------------------------------------|--------------------|------------------------------------------------|------|------|
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | s_4_kl             | Klaassen 4th s<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | s_5_kl             | Klaassen 5th s<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | s_6_kl             | Klaassen 6th s<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | s_7_kl             | Klaassen 7th s<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_1_kl             | Klaassen 1st r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_2_kl             | Klaassen 2nd r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_3_kl             | Klaassen 3rd r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_4_kl             | Klaassen 4th r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_5_kl             | Klaassen 5th r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | r_6_kl             | Klaassen 6th r<br>parameter                    | 1x1  | 1    |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | m_e_kl             | Klaassen<br>electron<br>mobility mass          | 1x1  | kg   |
| Semiconductors/<br>Mobility models             | KlaassenUnifiedMobility<br>Model | Klaassen unified<br>mobility model        | m_h_kl             | Klaassen hole<br>mobility mass                 | 1x1  | kg   |
| Equilibrium<br>discharge                       | RadiationHeatTransfer            | Radiation heat<br>transfer                | Qrad               | Total<br>volumetric<br>emission<br>coefficient | 1x1  | W/m3 |
| Solid mechanics/<br>Linear elastic<br>material | Enu                              | Young's<br>modulus and<br>Poisson's ratio | E                  | Young's<br>modulus                             | 1x1  | Pa   |
| Solid mechanics/<br>Linear elastic<br>material | Enu                              | Young's<br>modulus and<br>Poisson's ratio | nu                 | Poisson's ratio                                | 1x1  | 1    |
| Solid mechanics/<br>Linear elastic<br>material | Lame                             | Lamé<br>parameters                        | lambLame           | Lamé<br>parameter λ                            | 1x1  | N/m2 |
| Solid mechanics/<br>Linear elastic<br>material | Lame                             | Lamé<br>parameters                        | muLame             | Lamé<br>parameter μ                            | 1x1  | N/m2 |
| Solid mechanics/<br>Linear elastic<br>material | KG                               | Bulk modulus<br>and shear<br>modulus      | K                  | Bulk modulus                                   | 1x1  | N/m2 |
| Solid mechanics/<br>Linear elastic<br>material | KG                               | Bulk modulus<br>and shear<br>modulus      | G                  | Shear modulus                                  | 1x1  | N/m2 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)         | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                       | SIZE | UNIT           |
|------------------------------------------------|------------------------------|-----------------------------------------|--------------------|-------------------------------------------------|------|----------------|
| Solid mechanics/<br>Linear elastic<br>material | EG                           | Young's<br>modulus and<br>shear modulus | E                  | Young's<br>modulus                              | 1x1  | Pa             |
| Solid mechanics/<br>Linear elastic<br>material | EG                           | Young's<br>modulus and<br>shear modulus | G                  | Shear modulus                                   | 1x1  | N/m2           |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | DA                 | Extensional<br>stiffness matrix                 | 3x3  | N/m            |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | DB                 | Bending<br>extensional<br>stiffness matrix      | 3x3  | N              |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | DD                 | Bending<br>stiffness matrix                     | 3x3  | N·m            |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | DAs                | Shear stiffness<br>matrix                       | 2x2  | N/m            |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | I0                 | Translational<br>inertia                        | 1x1  | kg/m2          |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | I1                 | Rotational<br>translational<br>inertia matrix   | 3x3  | kg/m           |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | I2                 | Rotational<br>inertia matrix                    | 3x3  | kg             |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | eta_DA             | Loss factor for<br>stiffness matrix<br>DA       | 3x3  | 1              |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | eta_DB             | Loss factor for<br>stiffness matrix<br>DB       | 3x3  | 1              |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | eta_DD             | Loss factor for<br>stiffness matrix<br>DD       | 3x3  | 1              |
| Solid mechanics/<br>Linear elastic<br>material | DABD                         | Effective<br>stiffness<br>matrices      | eta_DAs            | Loss factor for<br>stiffness matrix<br>DAs      | 2x2  | 1              |
| Solid mechanics/<br>Linear elastic<br>material | Dabd                         | Effective<br>flexibility<br>matrices    | Da                 | Extensional<br>flexibility<br>matrix            | 3x3  | s2/kg          |
| Solid mechanics/<br>Linear elastic<br>material | Dabd                         | Effective<br>flexibility<br>matrices    | Db                 | Bending<br>extensional<br>flexibility<br>matrix | 3x3  | s2/<br>(kg·m)  |
| Solid mechanics/<br>Linear elastic<br>material | Dabd                         | Effective<br>flexibility<br>matrices    | Dd                 | Bending<br>flexibility<br>matrix                | 3x3  | s2/<br>(kg·m2) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)           | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                          | SIZE | UNIT  |
|------------------------------------------------|------------------------------|-------------------------------------------|--------------------|--------------------------------------------------------------------|------|-------|
| Solid mechanics/<br>Linear elastic<br>material | Dabd                         | Effective<br>flexibility<br>matrices      | Das                | Shear flexibility<br>matrix                                        | 2x2  | s2/kg |
| Solid mechanics/<br>Linear elastic<br>material | CpCs                         | Pressure-wave<br>and shear-wave<br>speeds | cp                 | Pressure-wave<br>speed                                             | 1x1  | m/s   |
| Solid mechanics/<br>Linear elastic<br>material | CpCs                         | Pressure-wave<br>and shear-wave<br>speeds | cs                 | Shear-wave<br>speed                                                | 1x1  | m/s   |
| Solid mechanics/<br>Linear elastic<br>material | Cubic                        | Cubic                                     | c11                | Elasticity<br>constant c11                                         | 1x1  | Pa    |
| Solid mechanics/<br>Linear elastic<br>material | Cubic                        | Cubic                                     | c12                | Elasticity<br>constant c12                                         | 1x1  | Pa    |
| Solid mechanics/<br>Linear elastic<br>material | Cubic                        | Cubic                                     | c44                | Elasticity<br>constant c44                                         | 1x1  | Pa    |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | Evector            | Young's<br>modulus                                                 | 3x1  | Pa    |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | nuvector           | Poisson's ratio                                                    | 3x1  | 1     |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | Gvector            | Shear modulus                                                      | 3x1  | N/m2  |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | eta_Evector        | Loss factor for<br>orthotropic<br>Young's<br>modulus               | 3x1  | 1     |
| Solid mechanics/<br>Linear elastic<br>material | Orthotropic                  | Orthotropic                               | eta_Gvecto<br>r    | Loss factor for<br>orthotropic<br>shear modulus                    | 3x1  | 1     |
| Solid mechanics/<br>Linear elastic<br>material | OrthotropicVoGrp             | Orthotropic,<br>Voigt notation            | GvectorVo          | Shear modulus,<br>Voigt notation                                   | 3x1  | N/m2  |
| Solid mechanics/<br>Linear elastic<br>material | OrthotropicVoGrp             | Orthotropic,<br>Voigt notation            | eta_Gvecto<br>rVo  | Loss factor for<br>orthotropic<br>shear modulus,<br>Voigt notation | 3x1  | 1     |
| Solid mechanics/<br>Elastoplastic<br>Material  | ElastoplasticModel           | Elastoplastic<br>material model           | sigmags            | Initial yield<br>stress                                            | 1x1  | Pa    |
| Solid mechanics/<br>Elastoplastic<br>Material  | ElastoplasticModel           | Elastoplastic<br>material model           | Et                 | Isotropic<br>tangent<br>modulus                                    | 1x1  | Pa    |
| Solid mechanics/<br>Elastoplastic<br>Material  | ElastoplasticModel           | Elastoplastic<br>material model           | Ek                 | Kinematic<br>tangent<br>modulus                                    | 1x1  | Pa    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                      | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP (DESCRIPTION)    | PROPERTY<br>(NAME)   | PROPERTY (DESCRIPTION)                         | SIZE | UNIT                                            |
|-----------------------------------------------|------------------------------|---------------------------------|----------------------|------------------------------------------------|------|-------------------------------------------------|
| Solid mechanics/<br>Elastoplastic<br>Material | ElastoplasticModel           | Elastoplastic<br>material model | sigmagh              | Hardening function                             | lxl  | Pa                                              |
| Solid mechanics/<br>Elastoplastic<br>Material | ElastoplasticModel           | Elastoplastic<br>material model | Hillcoefficie<br>nts | Hill's coefficients                            | 6x1  | m <sup>2</sup> ·s <sup>4</sup> /kg <sup>2</sup> |
| Solid mechanics/<br>Elastoplastic<br>Material | ElastoplasticModel           | Elastoplastic<br>material model | ys                   | Initial tensile<br>and shear yield<br>stresses | 6xI  | N/m <sup>2</sup>                                |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | sigmags              | Initial yield<br>stress                        | lxl  | Pa                                              |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | sigmah               | Hardening function                             | lxl  | Pa                                              |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | alphaShima           | Shima-Oyane<br>alpha<br>parameter              | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | gammaShim<br>a       | Shima-Oyane<br>gamma<br>parameter              | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | mShima               | Shima-Oyane<br>m parameter                     | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic material model      | nH                   | Hardening exponent                             | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic material model      | Et                   | Isotropic<br>tangent<br>modulus                | lxl  | Pa                                              |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | k_lud                | Strength coefficient                           | lxl  | Pa                                              |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | fO                   | Initial void<br>volume<br>fraction             | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic material model      | qIGTN                | Tvergaard correction coefficient q l           | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | q2GTN                | Tvergaard correction coefficient q2            | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic material model      | q3GTN                | Tvergaard correction coefficient q3            | lxl  | I                                               |
| Solid mechanics/<br>Poroplastic<br>Material   | PoroplasticModel             | Poroplastic<br>material model   | fc                   | Critical void volume fraction                  | lxl  | I                                               |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                         | SIZE | UNIT |
|----------------------------------------------|------------------------------|---------------------------------|--------------------|---------------------------------------------------|------|------|
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | ff                 | Failure void<br>volume<br>fraction                | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | fmax               | Maximum void<br>volume<br>fraction                | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | fn                 | Void volume<br>fraction of<br>nucleating<br>voids | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | snn                | Standard<br>deviation for<br>void nucleation      | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | enn                | Mean strain for<br>void nucleation                | 1x1  | 1    |
| Solid mechanics/<br>Poroplastic<br>Material  | PoroplasticModel             | Poroplastic<br>material model   | kw                 | Void growth<br>rate parameter                     | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | cohesion           | Cohesion                                          | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | internalphi        | Angle of<br>internal<br>friction                  | 1x1  | rad  |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | psid               | Dilatation<br>angle                               | 1x1  | rad  |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | Kiso               | Isotropic<br>hardening<br>modulus                 | 1x1  | N/m2 |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | epvolmax           | Maximum<br>plastic<br>volumetric<br>strain        | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | MohrCoulomb                  | Mohr-Coulomb                    | Rcap               | Ellipse aspect<br>ratio                           | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | DruckerPrager                | Drucker-Prager                  | alphaDruck<br>er   | Drucker<br>Prager alpha<br>coefficient            | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | DruckerPrager                | Drucker-Prager                  | kDrucker           | Drucker<br>Prager k<br>coefficient                | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | MatsuokaNakai                | Matsuoka-Nakai                  | muMatsuok<br>a     | Matsuoka<br>Nakai mu<br>coefficient               | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | LadeDuncan                   | Lade-Duncan                     | kLade              | Lade-Duncan k<br>coefficient                      | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)              | SIZE | UNIT |
|----------------------------------------------|------------------------------|---------------------------------|--------------------|----------------------------------------|------|------|
| Solid mechanics/<br>Geomechanics<br>material | Ottosen                      | Ottosen                         | aOttosen           | Ottosen a<br>parameter                 | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | Ottosen                      | Ottosen                         | bOttosen           | Ottosen b<br>parameter                 | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | Ottosen                      | Ottosen                         | k1Ottosen          | Size factor                            | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | Ottosen                      | Ottosen                         | k2Ottosen          | Shape factor                           | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | mHB                | Hoek-Brown<br>m parameter              | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | sHB                | Hoek-Brown s<br>parameter              | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | GSI                | Geological<br>strength index           | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | Dfactor            | Disturbance<br>factor                  | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | HoekBrown                    | Hoek Brown                      | miHB               | Intact rock<br>parameter               | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | YieldStressParameters        | Yield stress<br>parameters      | sigmaut            | Tensile<br>strength                    | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | YieldStressParameters        | Yield stress<br>parameters      | sigmauc            | Compressive<br>strength                | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | YieldStressParameters        | Yield stress<br>parameters      | sigmabc            | Biaxial<br>compressive<br>strength     | 1x1  | Pa   |
| Solid mechanics/<br>Geomechanics<br>material | CamClayModel                 | Cam-Clay                        | kappaSwelli<br>ng  | Swelling index                         | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | CamClayModel                 | Cam-Clay                        | lambdaCom<br>p     | Compression<br>index                   | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | CamClayModel                 | Cam-Clay                        | evoidref           | Void ratio at<br>reference<br>pressure | 1x1  | 1    |
| Solid mechanics/<br>Geomechanics<br>material | CamClayModel                 | Cam-Clay                        | evoid0             | Initial void<br>ratio                  | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME)   | PROPERTY GROUP<br>(DESCRIPTION)                          | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                         | SIZE | UNIT                                            |
|------------------------------------------------|--------------------------------|----------------------------------------------------------|--------------------|-------------------------------------------------------------------|------|-------------------------------------------------|
| Solid mechanics/<br>Geomechanics<br>material   | CamClayModel                   | Cam-Clay                                                 | M                  | Slope of critical state line                                      | lxl  | I                                               |
| Solid mechanics/<br>Linear elastic<br>material | Anisotropic                    | Anisotropic                                              | D                  | Elasticity<br>matrix                                              | 6×6  | Pa                                              |
| Solid mechanics/<br>Linear elastic<br>material | Anisotropic                    | Anisotropic                                              | eta_D              | Loss factor for elasticity matrix D                               | 6x6  | I                                               |
| Solid mechanics/<br>Strength limits            | AnisotropicStrengthPara meters | Anisotropic strength parameters, Voigt notation          | F_f                | Fourth rank<br>tensor, Voigt<br>notation                          | 6×6  | m <sup>2</sup> ·s <sup>4</sup> /kg <sup>2</sup> |
| Solid mechanics/<br>Strength limits            | AnisotropicStrengthPara meters | Anisotropic strength parameters, Voigt notation          | F_s                | Second rank<br>tensor, Voigt<br>notation                          | 6x1  | I/Pa                                            |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | sigmats            | Tensile<br>strengths                                              | 3×1  | Pa                                              |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | sigmacs            | Compressive strengths                                             | 3×1  | Pa                                              |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | sigmass            | Shear<br>strengths                                                | 3×I  | Pa                                              |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | sigma I D          | Linear<br>degradation<br>stress                                   | lxl  | N/m <sup>2</sup>                                |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | epsilontl          | Ultimate<br>tensile strain in<br>longitudinal<br>direction        | lxl  | I                                               |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic<br>strength<br>parameters,<br>Voigt notation | epsilonc l         | Ultimate<br>compressive<br>strain in<br>longitudinal<br>direction | lxl  | I                                               |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic<br>strength<br>parameters,<br>Voigt notation | EfI                | Young's<br>modulus of<br>fiber in<br>longitudinal<br>direction    | lxl  | Pa                                              |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar ameters | Orthotropic strength parameters, Voigt notation          | nufl2              | In-plane<br>Poisson's ratio<br>of fiber                           | lxl  | I                                               |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                       | PROPERTY GROUP<br>(API NAME)      | PROPERTY GROUP<br>(DESCRIPTION)                          | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                    | SIZE | UNIT |
|------------------------------------------------|-----------------------------------|----------------------------------------------------------|--------------------|--------------------------------------------------------------|------|------|
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar<br>ameters | Orthotropic<br>strength<br>parameters,<br>Voigt notation | sigmati22          | In situ<br>transverse<br>tensile<br>strength                 | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | OrthotropicStrengthPar<br>ameters | Orthotropic<br>strength<br>parameters,<br>Voigt notation | sigmasi12          | In situ in-plane<br>shear strength                           | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | IsotropicStrengthParame<br>ters   | Isotropic<br>strength<br>parameters                      | sigmat             | Tensile<br>strength                                          | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | IsotropicStrengthParame<br>ters   | Isotropic<br>strength<br>parameters                      | sigmac             | Compressive<br>strength                                      | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | IsotropicStrengthParame<br>ters   | Isotropic<br>strength<br>parameters                      | sigmabc            | Biaxial<br>compressive<br>strength                           | 1x1  | Pa   |
| Solid mechanics/<br>Strength limits            | OrthotropicStrainParam<br>eters   | Orthotropic<br>ultimate strains,<br>Voigt notation       | epsilonts          | Ultimate<br>tensile strains                                  | 3x1  | 1    |
| Solid mechanics/<br>Strength limits            | OrthotropicStrainParam<br>eters   | Orthotropic<br>ultimate strains,<br>Voigt notation       | epsiloncs          | Ultimate<br>compressive<br>strains                           | 3x1  | 1    |
| Solid mechanics/<br>Strength limits            | OrthotropicStrainParam<br>eters   | Orthotropic<br>ultimate strains,<br>Voigt notation       | gammass            | Ultimate shear<br>strains                                    | 3x1  | 1    |
| Solid mechanics/<br>Strength limits            | IsotropicStrainParamete<br>rs     | Isotropic<br>ultimate strains                            | epsilont           | Ultimate<br>tensile strain                                   | 1x1  | 1    |
| Solid mechanics/<br>Strength limits            | IsotropicStrainParamete<br>rs     | Isotropic<br>ultimate strains                            | epsilonc           | Ultimate<br>compressive<br>strain                            | 1x1  | 1    |
| Solid mechanics/<br>Linear elastic<br>material | AnisotropicVoGrp                  | Anisotropic,<br>Voigt notation                           | DVo                | Elasticity<br>matrix, Voigt<br>notation                      | 6x6  | Pa   |
| Solid mechanics/<br>Linear elastic<br>material | AnisotropicVoGrp                  | Anisotropic,<br>Voigt notation                           | eta_DVo            | Loss factor for<br>elasticity<br>matrix D, Voigt<br>notation | 6x6  | 1    |
| Solid mechanics                                | ViscoelasticModel                 | Linear<br>viscoelastic<br>material                       | Gv                 | Shear modulus                                                | 1x1  | N/m2 |
| Solid mechanics                                | ViscoelasticModel                 | Linear<br>viscoelastic<br>material                       | K                  | Bulk modulus                                                 | 1x1  | N/m2 |
| Piezoelectric<br>models                        | StressCharge                      | Stress-charge<br>form                                    | cE                 | Elasticity<br>matrix, Voigt<br>notation                      | 6x6  | Pa   |
| Piezoelectric<br>models                        | StressCharge                      | Stress-charge<br>form                                    | eES                | Coupling<br>matrix, Voigt<br>notation                        | 3x6  | C/m2 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT |
|----------------------------------------------|------------------------------|---------------------------------|--------------------|------------------------------------------------|------|------|
| Piezoelectric<br>models                      | StressCharge                 | Stress-charge<br>form           | epsilonrS          | Relative<br>permittivity                       | 3x3  | 1    |
| Piezoelectric<br>models                      | StressCharge                 | Stress-charge<br>form           | eta_cE             | Loss factor for<br>elasticity<br>matrix cE     | 6x6  | 1    |
| Piezoelectric<br>models                      | StressCharge                 | Stress-charge<br>form           | eta_eES            | Loss factor for<br>coupling<br>matrix eES      | 3x6  | 1    |
| Piezoelectric<br>models                      | StressCharge                 | Stress-charge<br>form           | eta_epsilon<br>S   | Loss factor for<br>electric<br>permittivity ?S | 3x3  | 1    |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | sE                 | Compliance<br>matrix, Voigt<br>notation        | 6x6  | 1/Pa |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | dET                | Coupling<br>matrix, Voigt<br>notation          | 3x6  | C/N  |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | epsilonrT          | Relative<br>permittivity                       | 3x3  | 1    |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | eta_sE             | Loss factor for<br>compliance<br>matrix sE     | 6x6  | 1    |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | eta_dET            | Loss factor for<br>coupling<br>matrix dET      | 3x6  | 1    |
| Piezoelectric<br>models                      | StrainCharge                 | Strain-charge<br>form           | eta_epsilon<br>T   | Loss factor for<br>electric<br>permittivity ?T | 3x3  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material | Gent                         | Gent                            | muG                | Macroscopic<br>shear modulus                   | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Gent                         | Gent                            | jmG                | Model<br>parameter                             | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C10                | Model<br>parameters                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C01                | Model<br>parameters                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C11                | Model<br>parameters                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C20                | Model<br>parameters                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C02                | Model<br>parameters                            | 1x1  | Pa   |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                  | SIZE | UNIT |
|----------------------------------------------|------------------------------|---------------------------------|--------------------|--------------------------------------------|------|------|
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C21                | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C12                | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C30                | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | MooneyRivlin                 | Mooney-Rivlin                   | C03                | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Murnaghan                    | Murnaghan                       | l                  | Murnaghan<br>third-order<br>elastic moduli | 1x1  | N/m2 |
| Solid mechanics/<br>Hyperelastic<br>material | Murnaghan                    | Murnaghan                       | m                  | Murnaghan<br>third-order<br>elastic moduli | 1x1  | N/m2 |
| Solid mechanics/<br>Hyperelastic<br>material | Murnaghan                    | Murnaghan                       | n                  | Murnaghan<br>third-order<br>elastic moduli | 1x1  | N/m2 |
| Solid mechanics/<br>Hyperelastic<br>material | ArrudaBoyce                  | Arruda-Boyce                    | Nseg               | Number of<br>segments                      | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material | ArrudaBoyce                  | Arruda-Boyce                    | mu0                | Macroscopic<br>shear modulus               | 1x1  | N/m2 |
| Solid mechanics/<br>Hyperelastic<br>material | Varga                        | Varga                           | c1VA               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Varga                        | Varga                           | c2VA               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Yeoh                         | Yeoh                            | c1YE               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Yeoh                         | Yeoh                            | c2YE               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | Yeoh                         | Yeoh                            | c3YE               | Model<br>parameters                        | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material | BlatzKo                      | Blatz-Ko                        | phiBK              | Model<br>parameters                        | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material | BlatzKo                      | Blatz-Ko                        | betaBK             | Model<br>parameters                        | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                | SIZE | UNIT |
|------------------------------------------------------------|------------------------------|---------------------------------|--------------------|----------------------------------------------------------|------|------|
| Solid mechanics/<br>Hyperelastic<br>material               | BlatzKo                      | Blatz-Ko                        | muBK               | Shear modulus                                            | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material               | Gao                          | Gao                             | aG                 | Model<br>parameters                                      | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material               | Gao                          | Gao                             | nG                 | Model<br>parameters                                      | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | E50Ref             | Reference<br>stiffness for<br>primary<br>loading         | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | EurRef             | Reference<br>stiffness for<br>unloading and<br>reloading | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | evoid0             | Initial void<br>ratio                                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | mH                 | Stress<br>exponent                                       | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | Kc                 | Bulk modulus<br>in compression                           | 1x1  | N/m2 |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | evoidm             | Maximum void<br>ratio                                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | Rcap               | Ellipse aspect<br>ratio                                  | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | K0nc               | Coefficient of<br>earth pressure<br>at rest              | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | HardeningSoilModel           | Hardening Soil                  | rsc                | Swelling to<br>compression<br>ratio                      | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | kappaSwelli<br>ng  | Swelling index                                           | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                | SIZE | UNIT |
|------------------------------------------------------------|------------------------------|---------------------------------|--------------------|----------------------------------------------------------|------|------|
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | kappaSwelli<br>ngs | Swelling index<br>for changes in<br>suction              | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | lambdaCom<br>p0    | Compression<br>index at<br>saturation                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | lambdaCom<br>pss   | Compression<br>index for<br>changes in<br>suction        | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | evoidref0          | Void ratio at<br>reference<br>pressure and<br>saturation | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | evoid0             | Initial void<br>ratio                                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | M                  | Slope of<br>critical state<br>line                       | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | wB                 | Weight<br>parameter                                      | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | mB                 | Soil stiffness<br>parameter                              | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | bB                 | Plastic<br>potential<br>smoothing<br>parameter           | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | sy0                | Initial yield<br>value for<br>suction                    | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | BarcelonaBasicModel          | Barcelona Basic                 | kB                 | Tension to<br>suction ratio                              | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay          | kappaSwelli<br>ngS | Swelling index<br>for structured<br>clay                 | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)   | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                          | SIZE | UNIT |
|------------------------------------------------------------|------------------------------|-----------------------------------|--------------------|--------------------------------------------------------------------|------|------|
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | lambdaCom<br>pS    | Compression<br>index for<br>destructured<br>clay                   | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | evoidrefS          | Void ratio at<br>reference<br>pressure for<br>destructured<br>clay | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | evoid0             | Initial void<br>ratio                                              | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | M                  | Slope of<br>critical state<br>line                                 | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | dvS                | Destructuring<br>index for<br>volumetric<br>deformation            | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | dsS                | Destructuring<br>index for shear<br>deformation                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | Deltaei            | Additional void<br>ratio at initial<br>yielding                    | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | pbi                | Initial structure<br>strength                                      | 1x1  | Pa   |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | zetaS              | Plastic<br>potential shape<br>parameter                            | 1x1  | 1    |
| Solid mechanics/<br>Nonlinear<br>elastoplastic<br>material | StructuredCamClayMod<br>el   | Structured<br>Cam-Clay            | epdevc             | Critical<br>equivalent<br>deviatoric<br>plastic strain             | 1x1  | 1    |
| Solid mechanics                                            | GeneralStressStrain          | General stress<br>strain relation | S                  | Second Piola<br>Kirchhoff<br>stress                                | 3x3  | N/m2 |
| Solid mechanics                                            | PoroelasticModel             | Poroelastic<br>material           | alphaB             | Biot-Willis<br>coefficient                                         | 1x1  | 1    |
| Solid mechanics                                            | ThermalExpansion             | Thermal<br>expansion              | alphatan           | Tangent<br>coefficient of<br>thermal<br>expansion                  | 3x3  | 1/K  |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                                 | SIZE | UNIT      |
|----------------------------|------------------------------|---------------------------------|--------------------|-----------------------------------------------------------|------|-----------|
| Solid mechanics            | ThermalExpansion             | Thermal<br>expansion            | dL                 | Thermal strain                                            | 3x3  | 1         |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | Psat               | Saturation<br>polarization                                | 1x1  | C/m2      |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | chie0              | Initial electric<br>susceptibility                        | 3x3  | 1         |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | lambdase           | Saturation<br>electrostrictio<br>n                        | 1x1  | 1         |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | kJAe               | Pinning loss                                              | 3x3  | V/m       |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | cJAe               | Polarization<br>reversibility                             | 3x3  | 1         |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | alphaJAe           | Interdomain<br>coupling                                   | 3x3  | m/F       |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | aJAe               | Domain wall<br>density                                    | 3x3  | V/m       |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | Qe                 | Electrostrictive<br>coupling<br>matrix                    | 6x6  | m4<br>/C2 |
| Piezoelectric<br>models    | Ferroelectric                | Ferroelectric                   | QVe                | Electrostrictive<br>coupling<br>matrix, Voigt<br>notation | 6x6  | m4/C2     |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | Ms                 | Saturation<br>magnetization                               | 1x1  | A/m       |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | chi0               | Initial magnetic<br>susceptibility                        | 3x3  | 1         |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | lambdas            | Saturation<br>magnetostricti<br>on                        | 1x1  | 1         |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | lambda100          | Magnetostricti<br>on constants                            | 1x1  | 1         |
| Magnetostrictive<br>models | Magnetostrictive             | Magnetostrictiv<br>e            | lambda111          | Magnetostricti<br>on constants                            | 1x1  | 1         |
| Magnetostrictive<br>models | StressMagnetization          | Stress<br>magnetization<br>form | cH                 | Elasticity<br>matrix, Voigt<br>notation                   | 6x6  | Pa        |
| Magnetostrictive<br>models | StressMagnetization          | Stress<br>magnetization<br>form | eta_cH             | Loss factor for<br>elasticity<br>matrix cH                | 6x6  | 1         |
| Magnetostrictive<br>models | StressMagnetization          | Stress<br>magnetization<br>form | eHS                | Piezomagnetic<br>coupling<br>matrix, Voigt<br>notation    | 3x6  | T         |
| Magnetostrictive<br>models | StressMagnetization          | Stress<br>magnetization<br>form | murS               | Relative<br>permeability                                  | 3x3  | 1         |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                   | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                              | SIZE | UNIT    |
|----------------------------|------------------------------|---------------------------------|--------------------|--------------------------------------------------------|------|---------|
| Magnetostrictive<br>models | StrainMagnetization          | Strain<br>magnetization<br>form | sH                 | Compliance<br>matrix, Voigt<br>notation                | 6x6  | 1/Pa    |
| Magnetostrictive<br>models | StrainMagnetization          | Strain<br>magnetization<br>form | eta_sH             | Loss factor for<br>compliance<br>matrix sH             | 6x6  | 1       |
| Magnetostrictive<br>models | StrainMagnetization          | Strain<br>magnetization<br>form | dHT                | Piezomagnetic<br>coupling<br>matrix, Voigt<br>notation | 3x6  | m/A     |
| Magnetostrictive<br>models | StrainMagnetization          | Strain<br>magnetization<br>form | murT               | Relative<br>permeability                               | 3x3  | 1       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | K_eff              | Effective bulk<br>modulus                              | 1x1  | Pa      |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | Rf                 | Flow resistivity                                       | 1x1  | Pa·s/m2 |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | Lth                | Thermal<br>characteristic<br>length                    | 1x1  | m       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | Lv                 | Viscous<br>characteristic<br>length                    | 1x1  | m       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | tau                | Tortuosity<br>factor                                   | 1x1  | 1       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | tau0               | Static viscous<br>tortuosity                           | 1x1  | 1       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | taup0_th           | Static thermal<br>tortuosity                           | 1x1  | 1       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | kp0_th             | Static thermal<br>permeability                         | 1x1  | m2      |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | Hr                 | Hydraulic<br>radius of pores                           | 1x1  | m       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | K_inf              | Bulk modulus<br>infinite<br>frequency limit            | 1x1  | Pa      |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | rho_inf            | Density infinite<br>frequency limit                    | 1x1  | kg/m3   |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | tau_ent            | Entropy-mode<br>relaxation time                        | 1x1  | s       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | tau_vor            | Vorticity-mode<br>relaxation time                      | 1x1  | s       |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | K_f                | Fluid bulk<br>modulus                                  | 1x1  | Pa      |
| Acoustics                  | PoroacousticsModel           | Poroacoustics<br>model          | K_gr               | Grain bulk<br>modulus                                  | 1x1  | Pa      |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                        | PROPERTY GROUP<br>(API NAME)              | PROPERTY GROUP<br>(DESCRIPTION)           | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                             | SIZE | UNIT     |
|---------------------------------|-------------------------------------------|-------------------------------------------|--------------------|-------------------------------------------------------|------|----------|
| Acoustics                       | PoroacousticsModel                        | Poroacoustics<br>model                    | Ks                 | Bulk modulus<br>of skeleton<br>material               | 1x1  | Pa       |
| Acoustics                       | PoroacousticsModel                        | Poroacoustics<br>model                    | s_m                | Median pore<br>size                                   | 1x1  | m        |
| Acoustics                       | PoroacousticsModel                        | Poroacoustics<br>model                    | sigma_s            | Standard<br>deviation in<br>pore size<br>distribution | 1x1  | 1        |
| Acoustics                       | NonlinearModel                            | Nonlinear<br>model                        | BA                 | Parameter of<br>nonlinearity                          | 1x1  | 1        |
| Acoustics                       | AttenuationDissipationM<br>odel           | Attenuation and<br>dissipation<br>model   | delta_diff         | Sound<br>diffusivity                                  | 1x1  | m2<br>/s |
| Acoustics                       | AnisotropicAcousticsMo<br>del             | Anisotropic<br>acoustics model            | rho_eff            | Effective<br>density                                  | 3x3  | kg/m3    |
| Acoustics                       | AnisotropicAcousticsMo<br>del             | Anisotropic<br>acoustics model            | K_eff              | Effective bulk<br>modulus                             | 1x1  | Pa       |
| External material<br>parameters | comcomsolgeneralStress<br>Strain          | General stress<br>strain relation         | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolgeneralStress<br>Strain          | General stress<br>strain relation         | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolgeneralStress<br>Deformation     | General stress<br>deformation<br>relation | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolgeneralStress<br>Deformation     | General stress<br>deformation<br>relation | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolinelasticResid<br>ualStrain      | Inelastic<br>residual strain              | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolinelasticResid<br>ualStrain      | Inelastic<br>residual strain              | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolinelasticResid<br>ualDeformation | Inelastic<br>residual<br>deformation      | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolinelasticResid<br>ualDeformation | Inelastic<br>residual<br>deformation      | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolgeneralHBRe<br>lation            | General H(B)<br>relation                  | par                | Material model<br>parameters                          | 1x1  |          |
| External material<br>parameters | comcomsolgeneralHBRe<br>lation            | General H(B)<br>relation                  | args               | Extra library<br>function string<br>arguments         | 1x1  |          |
| External material<br>parameters | comcomsolgeneralBHRe<br>lation            | General B(H)<br>relation                  | par                | Material model<br>parameters                          | 1x1  |          |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                           | PROPERTY GROUP<br>(API NAME)                   | PROPERTY GROUP<br>(DESCRIPTION)              | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                         | SIZE | UNIT  |
|----------------------------------------------------|------------------------------------------------|----------------------------------------------|--------------------|---------------------------------------------------|------|-------|
| External material<br>parameters                    | comcomsolgeneralBHRe<br>lation                 | General B(H)<br>relation                     | args               | Extra library<br>function string<br>arguments     | 1x1  |       |
| External material<br>parameters                    | comcomsolpolyumodlag<br>rangian                | Lagrangian<br>interface to<br>PolyUMod       | par                | Material model<br>parameters                      | 1x1  |       |
| External material<br>parameters                    | comcomsolpolyumodlag<br>rangian                | Lagrangian<br>interface to<br>PolyUMod       | args               | Extra library<br>function string<br>arguments     | 1x1  |       |
| External material<br>parameters                    | comcomsolelasticSolid                          | Elastic stress<br>strain relation            | E                  | Young's<br>modulus                                | 1x1  | Pa    |
| External material<br>parameters                    | comcomsolelasticSolid                          | Elastic stress<br>strain relation            | nu                 | Poisson's ratio                                   | 1x1  | 1     |
| Solid mechanics/<br>Hyperelastic<br>material       | HolzapfelGasserOgden                           | Holzapfel<br>Gasser-Ogden                    | k1HGO              | Fiber stiffness                                   | 1x1  | Pa    |
| Solid mechanics/<br>Hyperelastic<br>material       | HolzapfelGasserOgden                           | Holzapfel<br>Gasser-Ogden                    | k2HGO              | Model<br>parameter                                | 1x1  | 1     |
| Solid mechanics/<br>Hyperelastic<br>material       | HolzapfelGasserOgden                           | Holzapfel<br>Gasser-Ogden                    | k3HGO              | Fiber<br>dispersion                               | 1x1  | 1     |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionAustenite  | Thermal<br>expansion,<br>austenite phase     | alpha_A            | Coefficient of<br>thermal<br>expansion            | 3x3  | 1/K   |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionAustenite  | Thermal<br>expansion,<br>austenite phase     | alphatan_A         | Tangent<br>coefficient of<br>thermal<br>expansion | 3x3  | 1/K   |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionAustenite  | Thermal<br>expansion,<br>austenite phase     | dL_A               | Thermal strain                                    | 3x3  | 1     |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionMartensite | Thermal<br>expansion,<br>martensite<br>phase | alpha_M            | Coefficient of<br>thermal<br>expansion            | 3x3  | 1/K   |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionMartensite | Thermal<br>expansion,<br>martensite<br>phase | alphatan_M         | Tangent<br>coefficient of<br>thermal<br>expansion | 3x3  | 1/K   |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyTher<br>malExpansionMartensite | Thermal<br>expansion,<br>martensite<br>phase | dL_M               | Thermal strain                                    | 3x3  | 1     |
| Solid mechanics/<br>Viscoplastic<br>Material       | Anand                                          | Anand<br>viscoplasticity                     | A_ana              | Viscoplastic<br>rate coefficient                  | 1x1  | 1/s   |
| Solid mechanics/<br>Viscoplastic<br>Material       | Anand                                          | Anand<br>viscoplasticity                     | Q_ana              | Activation<br>energy                              | 1x1  | J/mol |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION)  | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                              | SIZE | UNIT |
|----------------------------------------------|------------------------------|----------------------------------|--------------------|--------------------------------------------------------|------|------|
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | xi_ana             | Stress<br>multiplier                                   | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | m_ana              | Stress<br>sensitivity                                  | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | ssat_ana           | Deformation<br>resistance<br>saturation<br>coefficient | 1x1  | N/m2 |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | sa_init            | Deformation<br>resistance<br>initial value             | 1x1  | N/m2 |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | h0_ana             | Hardening<br>coefficient                               | 1x1  | N/m2 |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | a_ana              | Hardening<br>sensitivity                               | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | Anand                        | Anand<br>viscoplasticity         | n_ana              | Deformation<br>resistance<br>sensitivity               | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | ChabocheViscoplasticity      | Chaboche<br>viscoplasticity      | A_cha              | Viscoplastic<br>rate coefficient                       | 1x1  | 1/s  |
| Solid mechanics/<br>Viscoplastic<br>Material | ChabocheViscoplasticity      | Chaboche<br>viscoplasticity      | sigRef_cha         | Reference<br>stress                                    | 1x1  | N/m2 |
| Solid mechanics/<br>Viscoplastic<br>Material | ChabocheViscoplasticity      | Chaboche<br>viscoplasticity      | n_cha              | Stress<br>exponent                                     | 1x1  | 1    |
| Solid mechanics/<br>Viscoplastic<br>Material | Perzyna                      | Perzyna<br>viscoplasticity       | A_per              | Viscoplastic<br>rate coefficient                       | 1x1  | 1/s  |
| Solid mechanics/<br>Viscoplastic<br>Material | Perzyna                      | Perzyna<br>viscoplasticity       | sigRef_per         | Reference<br>stress                                    | 1x1  | N/m2 |
| Solid mechanics/<br>Creep material           | Norton                       | Norton                           | A_nor              | Creep rate<br>coefficient                              | 1x1  | 1/s  |
| Solid mechanics/<br>Creep material           | Norton                       | Norton                           | sigRef_nor         | Reference<br>stress                                    | 1x1  | N/m2 |
| Solid mechanics/<br>Creep material           | Norton                       | Norton                           | n_nor              | Stress<br>exponent                                     | 1x1  | 1    |
| Solid mechanics/<br>Creep material           | Garofalo                     | Garofalo<br>(hyperbolic<br>sine) | A_gar              | Creep rate<br>coefficient                              | 1x1  | 1/s  |
| Solid mechanics/<br>Creep material           | Garofalo                     | Garofalo<br>(hyperbolic<br>sine) | sigRef_gar         | Reference<br>stress                                    | 1x1  | N/m2 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                     | PROPERTY GROUP<br>(API NAME)    | PROPERTY GROUP<br>(DESCRIPTION)  | PROPERTY<br>(NAME)   | PROPERTY<br>(DESCRIPTION)        | SIZE | UNIT          |
|----------------------------------------------|---------------------------------|----------------------------------|----------------------|----------------------------------|------|---------------|
| Solid mechanics/<br>Creep material           | Garofalo                        | Garofalo<br>(hyperbolic<br>sine) | n_gar                | Stress<br>exponent               | 1x1  | 1             |
| Solid mechanics/<br>Creep material           | NabarroHerring                  | Nabarro<br>Herring               | D_nav                | Volume<br>diffusivity            | 1x1  | m2<br>/s      |
| Solid mechanics/<br>Creep material           | NabarroHerring                  | Nabarro<br>Herring               | b_nav                | Burgers vector                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | NabarroHerring                  | Nabarro<br>Herring               | dg_nav               | Grain diameter                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | Coble                           | Coble                            | D_cob                | Grain<br>boundary<br>diffusivity | 1x1  | m2<br>/s      |
| Solid mechanics/<br>Creep material           | Coble                           | Coble                            | b_cob                | Burgers vector                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | Coble                           | Coble                            | dg_cob               | Grain diameter                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | Weertman                        | Weertman                         | D_wee                | Diffusivity                      | 1x1  | m2<br>/s      |
| Solid mechanics/<br>Creep material           | Weertman                        | Weertman                         | b_wee                | Burgers vector                   | 1x1  | m             |
| Solid mechanics/<br>Creep material           | Weertman                        | Weertman                         | n_wee                | Stress<br>exponent               | 1x1  | 1             |
| Solid mechanics/<br>Creep material           | Weertman                        | Weertman                         | sigRef_wee           | Reference<br>stress              | 1x1  | N/m2          |
| Solid mechanics/<br>Creep material           | Hillcoefficients                | Hill's<br>coefficients           | Hillcoefficie<br>nts | Hill's<br>coefficients           | 6x1  | m2·s4/<br>kg2 |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityFung             | Fung                             | AFung                | Coefficient<br>matrix            | 6x6  | 1             |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityFung             | Fung                             | cFung                | Fung<br>parameter c              | 1x1  | Pa            |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityDelfino          | Delfino                          | aDelf                | Model<br>parameters              | 1x1  | Pa            |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityDelfino          | Delfino                          | bDelf                | Model<br>parameters              | 1x1  | 1             |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityExtended<br>Tube | Extended tube                    | GcET                 | Model<br>parameters              | 1x1  | Pa            |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityExtended<br>Tube | Extended tube                    | GeET                 | Model<br>parameters              | 1x1  | Pa            |
| Solid mechanics/<br>Hyperelastic<br>material | HyperelasticityExtended<br>Tube | Extended tube                    | alphaET              | Model<br>parameters              | 1x1  | 1             |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                | PROPERTY GROUP<br>(API NAME)    | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                   | SIZE | UNIT |
|---------------------------------------------------------|---------------------------------|---------------------------------|--------------------|---------------------------------------------|------|------|
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityExtended<br>Tube | Extended tube                   | betaET             | Model<br>parameters                         | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityVanDer<br>Waals  | van der Waals                   | muW                | Shear modulus                               | 1x1  | Pa   |
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityVanDer<br>Waals  | van der Waals                   | lambdaW            | Maximum<br>chain stretch                    | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityVanDer<br>Waals  | van der Waals                   | alphaW             | Chain network<br>interaction                | 1x1  | 1    |
| Solid mechanics/<br>Hyperelastic<br>material            | HyperelasticityVanDer<br>Waals  | van der Waals                   | betaW              | Weight                                      | 1x1  | 1    |
| Solid mechanics/<br>Fatigue Behavior                    | fatigueGeneral                  | General                         | sigmae             | Endurance<br>limit                          | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material           | elastoplasticRambergOs<br>good  | Ramberg<br>Osgood               | K_ROcyclic         | Cyclic<br>hardening<br>coefficient          | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material           | elastoplasticRambergOs<br>good  | Ramberg<br>Osgood               | n_ROcyclic         | Cyclic<br>hardening<br>exponent             | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainCoffinManso<br>n   | Coffin-Manson                   | epsilonf_C<br>M    | Fatigue<br>ductility<br>coefficient         | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainCoffinManso<br>n   | Coffin-Manson                   | c_CM               | Fatigue<br>ductility<br>exponent            | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainCoffinManso<br>n   | Coffin-Manson                   | gammaf_C<br>M      | Shear fatigue<br>ductility<br>coefficient   | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainCoffinManso<br>n   | Coffin-Manson                   | cgamma_C<br>M      | Shear fatigue<br>ductility<br>exponent      | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainWangBrown          | Wang-Brown                      | S_WB               | Normal strain<br>sensitivity<br>coefficient | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Strain<br>Based | fatigueStrainFatemiSocie        | Fatemi-Socie                    | k_FS               | Normal stress<br>sensitivity<br>coefficient | 1x1  | 1    |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                | PROPERTY GROUP<br>(API NAME)  | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                           | SIZE | UNIT |
|---------------------------------------------------------|-------------------------------|---------------------------------|--------------------|-----------------------------------------------------|------|------|
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressBasquin          | Basquin                         | sigmaf_Basq<br>uin | Fatigue<br>strength<br>coefficient                  | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressBasquin          | Basquin                         | b_Basquin          | Fatigue<br>strength<br>exponent                     | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressBasquin          | Basquin                         | tauf_Basqui<br>n   | Shear fatigue<br>strength<br>coefficient            | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressBasquin          | Basquin                         | bgamma_Ba<br>squin | Shear fatigue<br>strength<br>exponent               | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressFindley          | Findley                         | k_Findley          | Normal stress<br>sensitivity<br>coefficient         | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressFindley          | Findley                         | f_Findley          | Limit factor                                        | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressMatake           | Matake                          | k_Matake           | Normal stress<br>sensitivity<br>coefficient         | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressMatake           | Matake                          | f_Matake           | Limit factor                                        | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressNormalStre<br>ss | Normal stress                   | f_NormalSt<br>ress | Limit factor                                        | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressDangVan          | Dang Van                        | a_DangVan          | Hydrostatic<br>stress<br>sensitivity<br>coefficient | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Stress<br>Based | fatigueStressDangVan          | Dang Van                        | b_DangVan          | Limit factor                                        | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based | fatigueEnergyMorrow           | Morrow                          | Wf_Morro<br>w      | Fatigue energy<br>coefficient                       | 1x1  | J/m3 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                                    | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                     | SIZE | UNIT |
|-------------------------------------------------------------|------------------------------|---------------------------------|--------------------|-----------------------------------------------|------|------|
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyMorrow          | Morrow                          | m_Morrow           | Fatigue energy<br>exponent                    | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | K1_Darvea<br>ux    | Crack<br>initiation<br>energy<br>coefficient  | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | k2_Darveau<br>x    | Crack<br>initiation<br>energy<br>exponent     | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | K3_Darvea<br>ux    | Crack<br>propagation<br>energy<br>coefficient | 1x1  | m    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | k4_Darveau<br>x    | Crack<br>propagation<br>energy<br>exponent    | 1x1  | 1    |
| Solid mechanics/<br>Fatigue<br>Behavior/Energy<br>Based     | fatigueEnergyDarveaux        | Darveaux                        | Wref_Darv<br>eaux  | Reference<br>energy density                   | 1x1  | J/m3 |
| Solid mechanics/<br>Fatigue<br>Behavior/Fatigue<br>Behavior | fatigueApproximateSN         | Approximate S<br>N curve        | sigmat             | Transition<br>stress                          | 1x1  | Pa   |
| Solid mechanics/<br>Fatigue<br>Behavior/Fatigue<br>Behavior | fatigueApproximateSN         | Approximate S<br>N curve        | Nt                 | Transition life                               | 1x1  |      |
| Solid mechanics/<br>Fatigue<br>Behavior/Fatigue<br>Behavior | fatigueApproximateSN         | Approximate S<br>N curve        | Ne                 | Endurance life                                | 1x1  |      |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | sigRef             | Reference<br>stress                           | 1x1  | N/m2 |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | eRef               | Reference<br>strain                           | 1x1  | 1    |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | gammaRef           | Reference<br>shear strain                     | 1x1  | 1    |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | n_stress           | Stress<br>exponent                            | 1x1  | 1    |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | n_strain           | Strain<br>exponent                            | 1x1  | 1    |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | Kt                 | Bulk modulus<br>in tension                    | 1x1  | N/m2 |
| Solid mechanics                                             | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | Kc                 | Bulk modulus<br>in compression                | 1x1  | N/m2 |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                      | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)           | SIZE | UNIT |
|-----------------------------------------------|------------------------------|---------------------------------|--------------------|-------------------------------------|------|------|
| Solid mechanics                               | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | q_ult              | Ultimate<br>deviatoric<br>stress    | 1x1  | N/m2 |
| Solid mechanics                               | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | e_ult              | Ultimate strain                     | 1x1  | 1    |
| Solid mechanics                               | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | sax                | Uniaxial stress<br>function         | 1x1  | N/m2 |
| Solid mechanics                               | NonlinearElasticMaterial     | Nonlinear<br>elastic material   | tau                | Shear stress<br>function            | 1x1  | N/m2 |
| Solid mechanics/<br>Elastoplastic<br>Material | Ludwik                       | Ludwik                          | k_lud              | Strength<br>coefficient             | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | Ludwik                       | Ludwik                          | n_lud              | Hardening<br>exponent               | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | Voce                         | Voce                            | sigma_voc          | Saturation flow<br>stress           | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | Voce                         | Voce                            | beta_voc           | Saturation<br>exponent              | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | Swift                        | Swift                           | e0_swi             | Reference<br>strain                 | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | Swift                        | Swift                           | n_swi              | Hardening<br>exponent               | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | HockettSherby                | Hockett-Sherby                  | sigma_hoc          | Steady-state<br>flow stress         | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | HockettSherby                | Hockett-Sherby                  | m_hoc              | Saturation<br>coefficient           | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | HockettSherby                | Hockett-Sherby                  | n_hoc              | Saturation<br>exponent              | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | ArmstrongFrederick           | Armstrong<br>Frederick          | Ck                 | Kinematic<br>hardening<br>modulus   | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | ArmstrongFrederick           | Armstrong<br>Frederick          | gammak             | Kinematic<br>hardening<br>parameter | 1x1  | 1    |
| Solid mechanics/<br>Elastoplastic<br>Material | Chaboche                     | Chaboche                        | Ck0_cha            | Kinematic<br>hardening<br>modulus   | 1x1  | Pa   |
| Solid mechanics/<br>Elastoplastic<br>Material | JohnsonCook                  | Johnson-Cook                    | k_jcook            | Strength<br>coefficient             | 1x1  | Pa   |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                           | PROPERTY GROUP<br>(API NAME)   | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT     |
|----------------------------------------------------|--------------------------------|---------------------------------|--------------------|------------------------------------------------|------|----------|
| Solid mechanics/<br>Elastoplastic<br>Material      | JohnsonCook                    | Johnson-Cook                    | n_jcook            | Hardening<br>exponent                          | 1x1  | 1        |
| Solid mechanics/<br>Elastoplastic<br>Material      | JohnsonCook                    | Johnson-Cook                    | C_jcook            | Strain rate<br>strength<br>coefficient         | 1x1  | 1        |
| Solid mechanics/<br>Elastoplastic<br>Material      | JohnsonCook                    | Johnson-Cook                    | epet0_jcook        | Reference<br>strain rate                       | 1x1  | 1/s      |
| Solid mechanics/<br>Elastoplastic<br>Material      | JohnsonCook                    | Johnson-Cook                    | m_jcook            | Temperature<br>exponent                        | 1x1  |          |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyAust<br>enite  | Austenite phase                 | E_A                | Young's<br>modulus                             | 1x1  | Pa       |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyAust<br>enite  | Austenite phase                 | Cp_A               | Heat capacity<br>at constant<br>pressure       | 1x1  | J/(kg·K) |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyMart<br>ensite | Martensite<br>phase             | E_M                | Young's<br>modulus                             | 1x1  | Pa       |
| Solid mechanics/<br>Shape memory<br>alloy material | ShapeMemoryAlloyMart<br>ensite | Martensite<br>phase             | Cp_M               | Heat capacity<br>at constant<br>pressure       | 1x1  | J/(kg·K) |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | T0                 | Shape memory<br>alloy reference<br>temperature | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | TMs                | Martensite<br>start<br>temperature             | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | TMf                | Martensite<br>finish<br>temperature            | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | TAs                | Austenite start<br>temperature                 | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | TAf                | Austenite<br>finish<br>temperature             | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | CM                 | Slope of<br>martensite<br>limit curve          | 1x1  | Pa/K     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | CA                 | Slope of<br>austenite limit<br>curve           | 1x1  | Pa/K     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                  | Lagoudas model                  | etrmaxLago<br>udas | Maximum<br>transformation<br>strain            | 1x1  | 1        |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                           | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME)  | PROPERTY<br>(DESCRIPTION)                      | SIZE | UNIT     |
|----------------------------------------------------|------------------------------|---------------------------------|---------------------|------------------------------------------------|------|----------|
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModel                | Lagoudas model                  | sigmaStar           | Calibration<br>stress level                    | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | sMs                 | Martensite<br>start stress                     | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | sMf                 | Martensite<br>finish stress                    | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | sAs                 | Austenite start<br>stress                      | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | sAf                 | Austenite<br>finish stress                     | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasModelStress          | Lagoudas<br>model, stress       | Tstress             | Measurement<br>temperature                     | 1x1  |          |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasExponentialLaw       | Lagoudas,<br>exponential law    | etrmin              | Initial<br>maximum<br>transformation<br>strain | 1x1  | 1        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasExponentialLaw       | Lagoudas,<br>exponential law    | etrsat              | Ultimate<br>transformation<br>strain           | 1x1  | 1        |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasExponentialLaw       | Lagoudas,<br>exponential law    | scrit               | Critical stress                                | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | LagoudasExponentialLaw       | Lagoudas,<br>exponential law    | kcrit               | Saturation<br>exponent                         | 1x1  | 1/Pa     |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | TStar               | Reference<br>temperature                       | 1x1  | K        |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | beta                | Slope of limit<br>curve                        | 1x1  | Pa/K     |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | etrmaxAuri<br>cchio | Maximum<br>transformation<br>strain            | 1x1  | 1        |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | sig0_SA             | Elastic domain<br>radius                       | 1x1  | N/m2     |
| Solid mechanics/<br>Shape memory<br>alloy material | SouzaAuricchioModel          | Souza<br>Auricchio<br>model     | Hk                  | Hardening<br>modulus                           | 1x1  | N/m2     |
| Gas models                                         | idealGas                     | Ideal gas                       | Rs                  | Specific gas<br>constant                       | 1x1  | J/(kg·K) |

TABLE 9-6: SUPPORTED PROPERTY GROUPS AND MATERIAL PROPERTIES.

| CATEGORY                                  | PROPERTY GROUP<br>(API NAME) | PROPERTY GROUP<br>(DESCRIPTION) | PROPERTY<br>(NAME) | PROPERTY<br>(DESCRIPTION)            | SIZE | UNIT |
|-------------------------------------------|------------------------------|---------------------------------|--------------------|--------------------------------------|------|------|
| Fluid flow/<br>Inelastic Non<br>Newtonian | PowerLaw                     | Power law                       | m_pow              | Fluid<br>consistency<br>coefficient  | 1x1  | Pa·s |
| Fluid flow/<br>Inelastic Non<br>Newtonian | PowerLaw                     | Power law                       | n_pow              | Flow behavior<br>index               | 1x1  | 1    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | mu0                | Zero shear<br>rate viscosity         | 1x1  | Pa·s |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | mu_inf             | Infinite shear<br>rate viscosity     | 1x1  | Pa·s |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | lam_car            | Relaxation<br>time                   | 1x1  | s    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | n_car              | Power index                          | 1x1  | 1    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Carreau                      | Carreau model                   | a_car              | Transition<br>parameter              | 1x1  | 1    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Ellis                        | Ellis model                     | tau_half           | Shear stress<br>parameter            | 1x1  | N/m2 |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Ellis                        | Ellis model                     | a_e                | Power<br>parameter                   | 1x1  | 1    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | DeKee                        | DeKee model                     | lam_DK             | Relaxation<br>time                   | 1x1  | s    |
| Fluid flow/<br>Inelastic Non<br>Newtonian | DeKee                        | DeKee model                     | mu_DK              | Shear rate<br>viscosity<br>parameter | 1x1  | Pa·s |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Cross                        | Cross model                     | tau_tr             | Critical stress                      | 1x1  | N/m2 |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Viscoplastic                 | Viscoplastic                    | tau_y              | Yield stress                         | 1x1  | N/m2 |
| Fluid flow/<br>Inelastic Non<br>Newtonian | Viscoplastic                 | Viscoplastic                    | mu_p               | Plastic<br>viscosity                 | 1x1  | Pa·s |

The following table lists all supported physical quantities for use as model inputs with their category, base name, and SI unit:

TABLE 9-7: SUPPORTED PHYSICAL QUANTITIES FOR MODEL INPUTS.

| API NAME                        | DESCRIPTION                                         | CATEGORY         | BASE NAME | UNIT            |
|---------------------------------|-----------------------------------------------------|------------------|-----------|-----------------|
| numberdensityacceptor           | Acceptor concentration                              | Transport        | Na        | 1/m3            |
| angularfrequency                | Angular frequency                                   | General          | omega     | 1/s             |
| catalyticactivity               | Catalytic activity                                  | Transport        | a         | mol/s           |
| charge                          | Charge                                              | Electromagnetics | Q         | C               |
| inelasticpowerloss              | Collisional power loss                              | Transport        | Sen       | W/m3            |
| concentration                   | Concentration                                       | General          | c         | mol/m3          |
| massconcentration               | Concentration                                       | Transport        | cm        | kg/m3           |
| conversion                      | Conversion                                          | Transport        | cr        | 1               |
| correctedpressure               | Corrected pressure                                  | Transport        | pc        | Pa              |
| correctedvelocity               | Corrected velocity field                            | Transport        | uc        | m/s             |
| current                         | Current                                             | General          | I         | A               |
| currentdensity                  | Current density                                     | Electromagnetics | J         | A/m2            |
| currentsource                   | Current source                                      | Electromagnetics | Qj        | A/m3            |
| depth                           | Depth                                               | Acoustics        | D         | m               |
| dispersedphasevolumefraction    | Dispersed phase volume fraction                     | Transport        | phid      | 1               |
| displacement                    | Displacement                                        | General          | u_d       | m               |
| numberdensitydonor              | Donor concentration                                 | Transport        | Nd        | 1/m3            |
| downsidetemperature             | Downside temperature                                | Hidden           | Td        | K               |
| effectivegasdensity             | Effective gas density                               | Transport        | rhogeff   | kg/m3           |
| elasticshearstrain              | Elastic shear strain                                | Solid mechanics  | esh       | 1               |
| uniaxialstrain                  | Elastic uniaxial strain                             | Solid mechanics  | eax       | 1               |
| displacementfield               | Electric displacement field                         | Electromagnetics | Df        | C/m2            |
| electricfield                   | Electric field                                      | Electromagnetics | E         | V/m             |
| electricpotential               | Electric potential                                  | Electromagnetics | V         | V               |
| electrolyteconductivity         | Electrolyte conductivity                            | Hidden           | sigmal    | S/m             |
| electricpotentialionicphase     | Electrolyte potential                               | Hidden           | phil      | V               |
| electrondensity                 | Electron density                                    | Transport        | ne        | 1/m3            |
| electronenergydensity           | Electron energy density                             | Transport        | en        | kg/(m·s3<br>·A) |
| energy                          | Energy                                              | General          | Ene       | J               |
| energydensity                   | Energy density                                      | Electromagnetics | W         | Pa              |
| effectiveplasticstrain          | Equivalent plastic strain                           | Solid mechanics  | epe       | 1               |
| effectiveplasticstraininmatrix  | Equivalent plastic strain in the<br>matrix material | Solid mechanics  | epm       | 1               |
| effectiveplasticstrainrate      | Equivalent plastic strain rate                      | Solid mechanics  | epet      | 1/s             |
| effectiveviscoplasticstrain     | Equivalent viscoplastic strain                      | Solid mechanics  | evpe      | 1               |
| effectiveviscoplasticstrainrate | Equivalent viscoplastic strain rate                 | Solid mechanics  | evpet     | 1/s             |
| fluidconductance                | Fluid conductance                                   | Transport        | Rb        | 1/s             |
| forcedensity                    | Force density                                       | Transport        | f         | N/m3            |

TABLE 9-7: SUPPORTED PHYSICAL QUANTITIES FOR MODEL INPUTS.

| API NAME                     | DESCRIPTION                          | CATEGORY         | BASE NAME | UNIT         |
|------------------------------|--------------------------------------|------------------|-----------|--------------|
| frequency                    | Frequency                            | General          | freq      | 1/s          |
| generalizedchemicalpotential | Generalized chemical potential       | Transport        | eta       | Pa           |
| henrysconstant               | Henry's constant                     | Transport        | kh        | J/mol        |
| hydraulicconductivity        | Hydraulic conductivity               | Transport        | K         | m/s          |
| initialelectrondensity       | Initial electron density             | Transport        | neinit    | 1/m3         |
| heatflux                     | Inward heat flux                     | Transport        | q0        | W/m2         |
| kinematicviscosity           | Kinematic viscosity                  | Transport        | nu        | m2<br>/s     |
| length                       | Length                               | General          | l         | m            |
| levelsetvariable             | Level set variable                   | Transport        | phils     | 1            |
| linecharge                   | Line charge                          | Electromagnetics | Ql        | C/m          |
| linecurrentsource            | Line current source                  | Electromagnetics | Qjl       | A/m          |
| logelectrondensity           | Log of electron density              | Transport        | Ne        | 1            |
| logelectronenergydensity     | Log of electron energy density       | Transport        | En        | 1            |
| luminousintensity            | Luminous intensity                   | General          | li        | cd           |
| magneticfield                | Magnetic field                       | Electromagnetics | H         | A/m          |
| magneticfluxdensity          | Magnetic flux density                | Electromagnetics | B         | T            |
| massfraction                 | Mass fraction                        | Transport        | w         | 1            |
| masssource                   | Mass source                          | Transport        | Qm        | kg/(m3·s)    |
| meanelectronenergy           | Mean electron energy                 | Transport        | ebar      | V            |
| energyperamount              | Molar enthalpy                       | Transport        | h         | J/mol        |
| molarsurfaceflux             | Molar flux                           | Transport        | Ns        | mol/(m·s)    |
| molarvolume                  | Molar volume                         | Transport        | Vmol      | m3/mol       |
| normalelectroncurrentdensity | Normal electron current density      | Electromagnetics | nFe       | A/m2         |
| normalioncurrentdensity      | Normal ion current density           | Electromagnetics | nF        | A/m2         |
| numberdensity                | Number density                       | Transport        | nd        | 1/m3         |
| phasefieldhelpvariable       | Phase field help variable            | Transport        | psi       | 1            |
| phasefieldvariable           | Phase field variable                 | Transport        | phipf     | 1            |
| pointcurrentsource           | Point current source                 | Electromagnetics | I0        | A            |
| powerflow                    | Power flow                           | Electromagnetics | pFlow     | W/m2         |
| practicalsalinity            | Practical salinity                   | Acoustics        | Spr       | 1            |
| pressure                     | Pressure                             | General          | pA        | Pa           |
| heatproduction               | Production/absorption<br>coefficient | Transport        | qs        | W/(m3<br>·K) |
| reducedelectricfield         | Reduced electric field               | Transport        | EN        | V·m2         |
| reduceddiffusivity           | Reduced electron diffusivity         | Transport        | DeN       | 1/(m·s)      |
| reducedmobility              | Reduced electron mobility            | Transport        | muN       | 1/(V·m·s)    |
| relativehumidity             | Relative humidity                    | General          | phi       | 1            |
| salinity                     | Salinity                             | Acoustics        | Sp        | 1            |
| energyflux                   | Secondary emission energy flux       | Transport        | seflux    | V/(m2·s)     |
| particleflux                 | Secondary emission flux              | Transport        | sflux     | 1/(m2·s)     |
| solidangle                   | Solid angle                          | General          | sr        | 1            |

TABLE 9-7: SUPPORTED PHYSICAL QUANTITIES FOR MODEL INPUTS.

| API NAME                      | DESCRIPTION                               | CATEGORY         | BASE NAME | UNIT         |
|-------------------------------|-------------------------------------------|------------------|-----------|--------------|
| spacechargedensity            | Space charge density                      | Electromagnetics | rhoq      | C/m3         |
| specificenergy                | Specific energy                           | Transport        | es        | J/kg         |
| slipvelocity                  | Squared slip velocity                     | Transport        | slipvel   | J/kg         |
| surfacechargedensity          | Surface charge density                    | Electromagnetics | rhoqs     | C/m2         |
| surfacecurrentdensity         | Surface current density                   | Electromagnetics | Js        | A/m          |
| surfacemagneticcurrentdensity | Surface magnetic current density          | Electromagnetics | Jms       | V/m          |
| surfaceconcentration          | Surface site concentration                | Transport        | gamma     | mol/m2       |
| temperature                   | Temperature                               | General          | T         | K            |
| timechangeinpressurehead      | Time change in pressure head              | Transport        | dHpdt     | m/s          |
| turbulentdissipationrate      | Turbulent dissipation rate                | Transport        | ep        | W/kg         |
| turbulentkinematicviscosity   | Undamped turbulent kinematic<br>viscosity | Transport        | nutilde   | m2/s         |
| upsidetemperature             | Upside temperature                        | Hidden           | Tu        | K            |
| velocity                      | Velocity                                  | General          | u         | m/s          |
| volumefraction                | Volume fraction                           | Transport        | Vf        | 1            |
| strainreferencetemperature    | Volume reference temperature              | General          | Tempref   | K            |
| volumetricheatcapacity        | Volumetric heat capacity                  | Transport        | Cvol      | J/(m3<br>·K) |

