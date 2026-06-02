#include<array>
#include<vector>
#include<iostream>

#define LENGTH 5
std::array<int, LENGTH> constructArray(int initial)
{
        std::array<int, LENGTH> arr{};
        for (int& i : arr) {
                i = initial;
        }
        return arr;
}

std::vector<int> constructVector(size_t size, int initial)
{
        std::vector<int> vec(size);
        for (int& i : vec) {
                i = initial;
        }
        return vec;
}

int findSum(const std::vector<int> vec)
{
        int result{ 0 };
        for (int i : vec) {
                result += i;
        }
        return result;
}

int findSum(const std::array<int, 5>& arr)
{
        int result{ 0 };
        for (size_t i{ 0 }; i < arr.size(); i++) {
                result += arr.at(i);
        }
        return result;
}

int main()
{
        std::vector<int> vec = constructVector(5, 10);
        std::array arr = constructArray(10);

        std::cout << findSum(vec) << std::endl;
        std::cout << findSum(arr) << std::endl;
}