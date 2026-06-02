#include<string>
// Define a namespace to hold constants

namespace constants
{
        // We can define global constants in header files directly
        // Once again, we must use the inline expression to allow multiple files to use this constants
        // (Otherwise, ODR violation will occur).
        inline constexpr double pi{ 3.14159 };
        inline constexpr double gravity{ 9.8 };
}