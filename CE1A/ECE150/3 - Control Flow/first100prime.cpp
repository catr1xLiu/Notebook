#include<iostream>

int main()
{
        // Find the first 100 prime numbers
        constexpr int GOAL_PRIME_NUMBER_COUNT = 100;
        int primeNumbersFound{ 0 }, currentNumber{ 2 };
        bool flag{};

        do // Main loop
        {
                flag = false;
                // For loop to examine all integers from 2 to n
                for (int i = 2; i < currentNumber; i++)
                {
                        if (currentNumber % i == 0)
                        {
                                flag = true;
                                break;
                        }
                }
                if (!flag)
                {
                        std::cout << currentNumber << std::endl;
                        primeNumbersFound++;
                }

                currentNumber++;

        } while (primeNumbersFound < 100); // Define the condition to continue the loop
}