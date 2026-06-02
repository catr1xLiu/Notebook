// g++ ./*.cpp -o main
#include<iostream>
#include "growth.h"
#include "circle.h"

int calls{ 0 }; // global variable

// Define myFunction in global namespace
void myFunction() {
        std::cout << "Global" << std::endl;
        calls++;
}

namespace MyNameSpace
{
        // Define myFunction under MyNameSpace
        void myFunction() {
                std::cout << "MyNameSpace" << std::endl;
                ::calls++; // access to class in global namespace
        }

        void myFunctionGlobal() {
                std::cout << "MyNameSpace\t";
                ::myFunction(); // call to myFunction in global namespace
                ::calls++; // access to class in global namespace
        }
}


int main()
{
        myFunction(); // output: Global
        MyNameSpace::myFunction(); // output: MyNameSpace
        MyNameSpace::myFunctionGlobal(); // output: MyNameSpace   Global
        std::cout << "Calls: " << calls << std::endl; // output: 4

        // Calling to functions under the namespce MyMathUtils
        // These functions are defined in multiple source files
        std::cout << MyMathUtils::circumference(1.0) << std::endl;
        std::cout << MyMathUtils::growth(2) << std::endl;

        // We can copy namespaces
        namespace MathUtils = MyMathUtils;
        std::cout << MathUtils::circumference(2.0) << std::endl;
}