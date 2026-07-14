# *Solution Creation*

TABLE 6-14: SOLUTION CREATION METHODS, REAL PART.

| METHOD                 | OUTPUT TYPE |
|------------------------|-------------|
| setU(double[])         |             |
| setU(int,double[])     |             |
| setPNames(String[])    |             |
| setPVals(double[])     |             |
| setPVals(int,double[]) |             |
| createSolution()       |             |

- **•** model.sol(*<tag>*).setU(*<vals>*) sets the real part of the solution vector to *<vals>*.
- **•** model.sol(*<tag>*).setU(*<solnum>*,*<vals>*) sets the real part of solution vector *<solnum>*, to *<vals>*.
- **•** model.sol(*<tag>*).setPNames(*<pnames>*) sets parameter names of the solution vectors to *<pnames>*.
- **•** model.sol(*<tag>*).setPVals(*<vals>*) sets the parameter values to *<vals>*.
- **•** model.sol(*<tag>*).setPVals(*<solnum>*,*<vals>*) sets the parameter values *<solnum>* to *<vals>*.
- **•** model.sol(*<tag>*).createSolution() creates solutions based on the input from the vectors previously set. The solution is created at this stage. Afterward the user input is cleared. If a created solution is used before this function is run the result is unpredictable.

TABLE 6-15: SOLUTION CREATION METHODS, IMAGINARY PART.

| METHOD                 | OUTPUT TYPE |
|------------------------|-------------|
| setUImag(double[])     |             |
| setUImag(int,double[]) |             |

TABLE 6-15: SOLUTION CREATION METHODS, IMAGINARY PART.

| METHOD                     | OUTPUT TYPE |
|----------------------------|-------------|
| setPValsImag(double[])     |             |
| setPValsImag(int,double[]) |             |

**•** model.sol(*<tag>*).setUImag(*<solnum>*,*<vals>*) sets the imaginary part of solution vector *<solnum>* to *<vals>* (and similarly for the other Imag methods).

TABLE 6-16: SOLUTION CREATION METHODS, REAL PART.

| METHOD                          | OUTPUT TYPE |
|---------------------------------|-------------|
| setUBlock(double[],int)         |             |
| setUBlock(int,double[],int)     |             |
| setUBImaglock(double[],int)     |             |
| setUImagBlock(int,double[],int) |             |
| setUDotBlock(double[],int)      |             |
| setUDotBlock(int,double[],int)  |             |
| setUImagBlock(double[],int)     |             |
| setUImagBlock(int,double[],int) |             |

**•** model.sol(*<tag>*).setUBlock(*<solnum>*,*<vals>,<start>*) sets the real part of solution vector *<solnum>*, the subarray from position *<start>* to position *<start>*+*<vals>.length*-1 to *<vals>* (and similarly for the other Imag methods).

