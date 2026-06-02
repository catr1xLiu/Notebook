// Part2: Local Variables, Global Variables & Static Local Variables
#include<iostream>

// Variables defined here are under global scope and accessible to any function
int globalCounter{ 0 };

void counterUp()
{
        // Variables defined inside a function are called local variables
        // They are only accessible within the function, and destroyed when the function returns
        int localCounter{ 0 };
        localCounter++;

        // However, if the local variable is made static, it is created before the program starts
        // And they will not be destroyed.
        static int staticLocalCounter = 0;
        staticLocalCounter++;

        // Global variables are accessible inside ALL functions
        globalCounter++;

        std::cout << "Local Counter: " << localCounter << "; ";
        std::cout << "Static Local Counter: " << staticLocalCounter << "; ";
        std::cout << "Global Counter: " << globalCounter << std::endl;
}

int main()
{
        for (int i = 0; i < 5; i++)
                counterUp();

        // Only the globally defined counter is accessbile here
        std::cout << "Global Counter in main(): " << globalCounter << std::endl;
}
