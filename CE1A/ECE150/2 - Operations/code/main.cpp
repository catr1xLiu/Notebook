#include <cmath>
#include <iostream>
#include <numbers>

int main()
{
        // Part1: Basic Operations
        int x{ 7 };
        float y{ 7.0 };
        std::cout << x + 2 << std::endl; // 9
        std::cout
                << x / 4 << "\t" << x % 4
                << std::endl; // 1   3 (integer division & remainder operation)
        std::cout << y / 4 << std::endl; // 1.75 (float / integer = float)

        std::cout << std::endl;

        // Part2: Self Operations
        x += 2;
        std::cout << x << std::endl;     // 9
        std::cout << (x++) << std::endl; // outputs 9, x = 10
        std::cout << (++x) << std::endl; // outputs 11, x = 11
        std::cout << x << std::endl;

        std::cout << std::endl;

        // Part3: Logical Operations
        bool a{ x == 11 };                        // if x equals to 11
        bool b{ x != 11 };                        // if x is not 11
        std::cout << a << std::endl;            // true
        std::cout << b << std::endl;            // false
        std::cout << (a && b) << std::endl;     // a and b = false
        std::cout << (a || false) << std::endl; // a or b = true
        std::cout << !a << std::endl;           // not a = false

        std::string s1{ "hello" };
        std::string s2{ "hello" };
        // in c++ we can directly compare strings using ==
        std::cout << (s2 == s1) << std::endl;

        std::cout << std::endl;

        // Part4: Conditional Operators
        x = a ? 25 : 20;             // 25 if a is true; 20 otherwise
        std::cout << x << std::endl; // 25

        std::cout << std::endl;

        // Part5: Math Operators with CMath
        // Basic Maths
        std::cout << std::abs(-4) << std::endl;    // |-4| = 4
        std::cout << std::round(5.4) << std::endl; // 5
        std::cout << std::round(6.5) << std::endl; // 7

        // Power and Roots
        std::cout << std::pow(2.0, 3.0) << std::endl; // 2^3 = 8
        std::cout << std::sqrt(2.0) << std::endl;     // sqrt(2) = 1.414...
        std::cout << std::cbrt(8.0) << std::endl;     // cubic root of 8 is 2

        // Trigonometry
        std::cout << std::sin(std::numbers::pi / 2.0) << std::endl;
        std::cout << std::atan2(1, 1) << std::endl;

        // Exponential and Logarithmic Functions
        std::cout << std::exp(1) << std::endl;        // e^1 = 2.718...
        std::cout << std::log(1) << std::endl;        // ln(1) = 0
        std::cout << std::log10(100.0f) << std::endl; // log_10(100) = 2.0;

        return 0;
}