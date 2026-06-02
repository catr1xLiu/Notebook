#include<iostream>
#include<vector>
#include<string>

int main() 
{
    std::vector<std::string> msg{"Hello", "World"};

    for (std::string &word : msg) 
    {
        std::cout << word << " "; // The red dot shows a breaking point
    }

    std::cout<<std::endl;

    return 0;
}
