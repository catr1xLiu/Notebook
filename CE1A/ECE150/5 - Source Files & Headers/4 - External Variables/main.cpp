#include<iostream>
#include "support.h"

// Tell the compiler that there is a variable globalCounter defined elsewhere
extern int globalCounter;

int main()
{
        globalCounter++;
        counterUp();
        std::cout << globalCounter << std::endl; // output: 2

        return 0;
}