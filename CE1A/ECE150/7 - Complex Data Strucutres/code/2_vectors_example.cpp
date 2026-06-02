#include<iostream>
#include<vector>

int main()
{
        // Initializing a vector
        std::vector<int> nums{ 1, 2, 3, 4, 5 };
        // Intializing an empty vector
        std::vector<int> nums(10); // intial length 10, filled with 0

        // Obtaining size (size_t preffered)
        size_t length{ nums.size() };

        // THIS IS WRONG!!!
        // narrowing conversion from size_t to int
        int len_wrong{ nums.size() };
        std::cout << len_wrong << std::endl;

        // Obtaining size as int (modern method)
        int len{ static_cast<int>(std::ssize(nums)) };

        // Iterating using index
        for (size_t i{ 0 }; i < nums.size(); i++) {
                std::cout << nums.at(i) << " ";
                // or nums[i]
        }
        std::cout << std::endl;

        // Append / Drop top last item
        nums.push_back(6);
        nums.pop_back();
        // Obtaining the last item
        std::cout << nums.back() << std::endl;

        // Resize the array, dropping items or fills remaining items with 0
        nums.resize(3);
        nums.resize(10);

        for (int i : nums) {
                std::cout << i << " ";
        }
        std::cout << std::endl;

        // Resize the array, dropping items
        nums[2] = 3;
        size_t t{ 2 };
        nums[t] = 3;

        // Clears the array
        nums.clear();

        // Reserve space in advance, not changing length
        // Compilers do this automatically most of the time
        nums.reserve(100);

        std::cout << nums.size() << std::endl;
}