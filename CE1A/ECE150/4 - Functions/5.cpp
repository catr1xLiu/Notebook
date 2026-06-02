// Part5: Function Templates
#include<iostream>

// Define a function template
// The template has an unknown type T
// The function compares the arguments with type T and returns the greater one
// And it will work regardless of what 
template <typename T>
T max(T a, T b)
{
        return (a > b) ? a : b;
}

int main()
{
        // Works with integer arguments
        std::cout << max(3, 4) << std::endl;

        // Works with double arguments
        std::cout << max(1.5, 1.7) << std::endl;

        // Works with char arguments
        std::cout << max('a', 'z') << std::endl;

        // Works with long arguments
        std::cout << max(5000000l, 30000000l) << std::endl;
}