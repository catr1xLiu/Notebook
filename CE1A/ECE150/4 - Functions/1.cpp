// Part1: Function Arguments, Default Arguments & Return Types
#include<iostream>

// Define a function with arguments a and b, and integer return type
int add(int a, int b) // arguments a and b
{
        return a + b; // return value
}

// Define a function with arguments base with default value 10, and exp with default 1, and integer return type
int integerPow(int base = 10, int exp = 1)
{
        int result{ 1 };
        for (int i = 0; i < exp; i++)
                result *= base;

        return result; // return value
}

// Define a function that executes something, but does not have returning values
void doSomething()
{
        std::cout << "Something" << std::endl;
}

int main() {
        std::cout << add(2, 3) << std::endl; // Call to function, specifying arugments

        std::cout << integerPow(2, 3) << std::endl; // Specifying both arguments

        std::cout << integerPow(2) << std::endl; // specifying the first arugment, leaving the second as default

        std::cout << integerPow(); // Use default value for both arguments

        doSomething();
}

