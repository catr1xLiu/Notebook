#include<iostream>

int main()
{
        int myInteger{ 1 }, anotherInteger{ 20 }; // Declares two normal integer variables
        int& referenceToMyInteger{ myInteger }; // Declares an LValue reference to myInteger

        std::cout << myInteger << ", " << referenceToMyInteger << std::endl; // 1, 1

        myInteger++; // Modify the original variable
        std::cout << myInteger << ", " << referenceToMyInteger << std::endl; // 2, 2

        referenceToMyInteger++; // Modify the variable through reference
        std::cout << myInteger << ", " << referenceToMyInteger << std::endl; // 3, 3

        myInteger = 10; // Re-assign the value of the orginal variable
        std::cout << myInteger << ", " << referenceToMyInteger << std::endl; // 10, 10

        referenceToMyInteger = anotherInteger; // Re-assigning the reference only changes the value of the original variable
        std::cout << myInteger << ", " << referenceToMyInteger;  // 20, 20
        // This means that once a reference is initialized, it is final. (We cannot make it refer to another variable)


        const int myConstant{ 10 };
        // int& invalidReferenceToConstant {myConstant}; // Compiler Error: Cannot assign constant lvalues to non-constant reference
        const int& referenceToMyConstant{ myConstant };

        std::cout << myConstant << ", " << referenceToMyConstant << std::endl; // 10, 10

        // referenceToMyConstant = 12; // Compiler Error: Cannot assign to variable with const-qualified type 'const int'

        char c{ 'a' };
        // int& invalidIntegerReferenceToChar{c}; // compiler error
        const int& integerReferenceToChar{ c }; // c is casted to a temporary integer
        std::cout << integerReferenceToChar << std::endl; // Output: 97
        c = 'b';
        std::cout << integerReferenceToChar << std::endl; // Output: 97 (this reference binded to the temporary integer)ß

        return 0;
}