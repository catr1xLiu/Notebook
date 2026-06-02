#include <iostream>
#include<string>

int main()
{
        std::string name{ "john" };

        int l{ std::ssize(name) };

        std::cout << l << std::endl;
}