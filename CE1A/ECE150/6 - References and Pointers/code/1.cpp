#include<iostream>
#include<string>

template <typename T>
std::string catogory(T&)
{
        // T& is a LValue reference
        return "LValue";
}
template <typename T>
std::string catogory(T&&)
{
        // T&& is an RValue reference
        return "RValue";
}

// An example function
int myFunction() { return 0; }

int main()
{
        // L Values are objects that can appear on the left-hand side of an assignment.
        // They occupy an identifiable memory location.
        // Examples: variables, item in a list, item in an array...

        // R Values are temporary values or literals that can only appear on the right-hand side of an assignment.
        // Examples: constants, expressions, literals, function return values...

        std::cout << "Catagory of 5: " << catogory(5) << std::endl; // RValue (literal)
        std::cout << "Catagory of myFunction(): " << catogory(myFunction()) << std::endl; // RValue (Return value of function)

        int x{ 0 };
        std::cout << "Catagory of x: " << catogory(x) << std::endl; // LValue (variable)
        std::cout << "Catagory of (x * 3 + 5): " << catogory(x * 3 + 5) << std::endl; // RValue (expression)
        std::cout << "Catagory of (++x): " << catogory(++x) << std::endl; // LValue (++x means increase x, and then use the value of x)
        std::cout << "Catagory of (x++): " << catogory(x++) << std::endl; // RValue (x++ means use the value of x, then increase x)

        std::cout << "Catagory of std::string{\"Hello\"}: " << catogory(std::string{ "Hello" }) << std::endl; // RValue
        std::cout << "Catagory of \"Hello\": " << catogory("Hello") << std::endl; // LValue (C-Style strings are weired, don't use them)
}