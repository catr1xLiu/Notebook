# *The Model XML-File Format*

Materials can be imported and exported using a Model XML-file format, which you can save and open as XML files with the .xml extension.

A typical Model XML-file can look like this:

```
<?xml version="1.0" encoding="UTF-8"?>
<archive>
 <model>
 <material>
 <label label="AC/DC library (History XML)"/>
 </material>
 <material tag="ndfeb_bmn_35" type="Common" component="">
 <propertyGroup tag="RemanentFluxDensity" descr="Remanent flux density">
 <func tag="int1" oper="Interpolation">
 <set name="funcname" value="Br"/>
 <set name="table" value="{{'293.15','1.220'},{'353.15','1.13'}}"/>
 <set name="extrap" value="linear"/>
 <set name="fununit" value="{'T'}"/>
 <set name="argunit" value="{'K'}"/>
 </func>
 <set name="murec" value="{'1.05','0','0','0','1.05','0','0','0','1.05'}"/>
 <set name="normBr" value="Br(T)"/>
 <addInput quantity="temperature"/>
 </propertyGroup>
 <label label="BMN-35"/>
 <set name="family" value="chrome"/>
 <propertyGroup tag="def">
 <set name="thermalconductivity" value="{'9.0[W/(m*K)]','0','0','0','9.0[W/
                                    (m*K)]','0','0','0','9.0[W/(m*K)]'}"/>
 <set name="density" value="7.55[g/cm^3]"/>
 <set name="heatcapacity" value="440[J/(kg*K)]"/>
 <set name="electricconductivity" value="{'1/1.50[uohm*m]','0','0','0','1/
                                     1.50[uohm*m]','0','0','0','1/1.50[uohm*m]'}"/>
 <set name="relpermittivity" value="{'1','0','0','0','1','0','0','0','1'}"/>
 </propertyGroup>
 </material>
 <!-- Node groups are added last and are used as categories in the material library -->
 <nodeGroup tag="bomatec_magnetic_materials" type="GlobalDefinitions">
 <!-- A type change is necessary to only allow materials -->
 <set name="type" value="material"/>
 <!-- This is a subcategory of the top-level category -->
 <feature tag="ndfeb">
 <label label="NdFeB"/>
 <!-- These elements adds the material to the group -->
 <add tag="ndfeb_bmn_35"/>
 <add tag="ndfeb_bmn_38"/>
 </feature>
 </nodeGroup>
 </model>
</archive>
```

Each element represents a method in Java, and the element attributes represents arguments to the methods. Below are some more details about parts of this example. The statement

```
<material>
 <label label="AC/DC library (History XML)"/>
</material>
```

accesses the material list of the model object and sets the label of that list to the value of the label attribute. When you use a material element with attributes it refers to a material instead, see the following example:

<material tag="ndfeb\_bmn\_35" type="Common" component="">

During import, this element first creates a material of type Common. The tag and component attributes are not strictly enforced during import because the import decides their values depending to what list you import the materials to. The given tag can be occupied by another material, and the component is specified by the target. The content of the material element defines what property groups and functions the material contains. The propertyGroup element and the func element work in the same way as the material element — they represent new entities under the entity created by the parent element.

The propertyGroup element contains a lot of elements named set and addInput. The set element represents setting the value of a material property, where the name attribute is the name of the property and the value attribute is its value. Tensor-valued properties use curly braces to specify tensors. Here the syntax follows the standards that COMSOL Multiphysics uses in its API. If you give one value to a 3-by-3 tensor property it will become an isotropic tensor. Similarly, a value of length 3 is a diagonal tensor, and a value of length 6 represents a symmetric tensor. Give 9 values (as in the example above) to specify a full anisotropic tensor. The convention to use a vector of values to a tensor is something that the COMSOL Multiphysics software uses for property groups and also settings in physics features and multiphysics couplings. Other matrix-style values, such as the interpolation table for the func element, use a matrix specification using two levels of curly braces. The addInput element adds a model input to the material, and it expects a valid physical quantity ID for its quantity attribute.

The material element also supports a few set elements. Typically for the appearance settings such as the one named family in the example above.

See the following sections for tables that list all supported material types and settings; property groups and material properties; physical quantities for model inputs; and functions and settings.

