#include<iostream>

// Include the header file
#include "myFunction.h"

int main()
{
        // We can use the function because: 
        //  1. The function is DECLARED in myFunction.h
        //  2. myFunction.h is INCLUDED in main.cpp
        //  2. The function is IMPLEMENTED in myFunction.cpp
        std::cout << myFunction(2, 3) << std::endl;
}