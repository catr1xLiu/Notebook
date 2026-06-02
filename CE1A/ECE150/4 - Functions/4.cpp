// Part4: Deleting Functions
#include<iostream>

// Define printInt function, which accepts an integer and prints it
void printInt(int x)
{
        std::cout << "The integer is: " << x << std::endl;
}

// Define printIntStrict, which does the identical thing
void printIntStrict(int x)
{
        std::cout << "The integer is: " << x << std::endl;
}

// This time, we also define the function for char and boolean, which will overload the function
// But instead of implementing these functions, we assign them to delete
void printIntStrict(char) = delete;
void printIntStrict(bool) = delete;

int main()
{
        printInt(1); // Works because 1 is an integer
        printInt('c'); // Works because char is automatically converted to int 
        printInt(true); // Works because boolean is automatically converted to int

        printIntStrict(1); // Works because 1 is an integer
        // printIntStrict('c'); // ERROR: The function is defined as delete
        // printIntStrict(false); // ERROR: The function is defined as delete
}
