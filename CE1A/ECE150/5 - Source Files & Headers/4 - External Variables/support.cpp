#include "support.h"

// defines the globalCounter variable, which can be accessed from other source files
int globalCounter{ 0 };
void counterUp()
{
        globalCounter++;
}