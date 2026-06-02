#include<array>
#include<iostream>

int main()
{
        // Initializing an array
        std::array<int, 4> nums = { 1, 2, 3, 4 };

        // Accessing items
        std::cout << nums.at(2) << std::endl;
        // Modifying items
        nums[2] = 30;

        // Representing the length
        size_t l = nums.size();
        std::cout << l << std::endl;

        // Iterating using index-based for loop
        for (size_t i{ 0 }; i < nums.size(); i++) {
                std::cout << nums.at(i);
        }

        // Iterating using range-based for loop (for-each)
        for (int i : nums) {
                std::cout << i << std::endl;
        }

        // Or using range-based for loop with reference (avoid copying)
        for (const int& i : nums) {
                std::cout << i << std::endl;
        }

        int arr[4] = { 1, 2, 3, 4 };
        for (int& i : arr) {

        }
}