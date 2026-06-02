#include<iostream>

// global constants defined at the head of the code
#define pi 3.1415

int main()
{
        // Part1: Variable Define & Initialize
        int a; // define variable (traditional)
        std::cout << a << std::endl; // output: -157204304
        int b = 10; // define and assign value (traditional)
        std::cout << b << std::endl;

        int c{ 7 }; // direct-list-initialization (modern)
        std::cout << c << std::endl;

        int d{}; // define variable (modern)
        std::cout << d << std::endl; //output: 0

        unsigned int ui{ 5 };
        std::cout << ui + 1 << std::endl;
        std::cout << ui - 6 << std::endl; // 4294967295

        // Part2: Basic IOStream
        std::cout << "Please Enter a Number: ";
        std::cin >> d; // standard input
        // Entering 123a will become 123
        // Entering a123 will become 0 (extraction fails)
        // Entering 5.6 will become 5 (integer part)


        // Part2: Float, Double & Long
        float x = 1.0f;
        float y = 1.234e5;
        double z = 3.5;
        long l = 114514;
        long double ld = 10e21;

        double n = 1.0 / 0.0; // positive infinity
        double m = -1.0 / 0.0; // negative infinity
        double p = 0.0 / 0.0; // NaN
        std::cout << n << std::endl;
        std::cout << m << std::endl;
        std::cout << p << std::endl;

        // Part4: Char, String and Constants
        char ch{ 'a' };
        std::string s{ "hello" }; // Use std strings instead of C-Style strings because their better
        std::cout << ch << std::endl;
        std::cout << s << std::endl;
        s = "abc"; // std strings have variable length
        // Define multiple constants in a line
        // Note that these two constants are actually variables evaluated in runtime
        const int num1{ b }, num2{ c };

        // To force the constant to be static, use constexpr
        constexpr double gravity{ 9.8 }; // Valid because 9.8 is fundamental constant
        constexpr double someConstant{ gravity * pi }; // valid because gravity is constexpr and pi is pre-defined global constant
        std::cout << someConstant << std::endl;
        // constexpr double someVar {x} // Compiler error because x is initialized in runtime 


        // Part5: Object sizes
        std::cout << "Size of an integer: " << sizeof(a) << std::endl;
        std::cout << "Size of a float: " << sizeof(x) << std::endl;
        std::cout << "Size of a double: " << sizeof(z) << std::endl;
        std::cout << "Size of a long: " << sizeof(l) << std::endl;
        std::cout << "Size of a long double: " << sizeof(ld) << std::endl;
        std::cout << "Size of a char: " << sizeof(ch) << std::endl;
        std::cout << "Memory Size of string s: " << sizeof(s) << std::endl;
        std::cout << "Length of string s: " << s.size() << std::endl;

        return 0;
}
