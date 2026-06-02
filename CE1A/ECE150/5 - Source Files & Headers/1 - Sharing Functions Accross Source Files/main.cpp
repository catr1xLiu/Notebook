// Compile this file using g++ ./*.cpp -o main
#include<iostream>

// Declare a function with two integer arguments and an integer return type
// The function is NOT implemented, which means that compiling this file will result in link error
int myFunction(int x, int y);

int main()
{
        // We can use the function because: 
        //  1. It is DECLARED in this file 
        //  2. It is IMPLEMENTED in myFunction.cpp
        std::cout << myFunction(2, 3) << std::endl;
}