#include <iostream>
#include <iterator>
#include <list>

int main()
{
        // Intialization
        std::list<int> myList{ 1, 2, 3 };

        // Append to back of the list
        myList.push_back(4); // { 1, 2, 3, 4 }
        // Append to start of the list
        myList.push_front(0); // { 0, 1, 2, 3, 4 }

        // Accessing first and last element
        std::cout << myList.front() << "\n";
        std::cout << myList.back() << "\n";

        // Iterate using reference to modify
        for (int &a : myList) {
                a++;
        }
        // Iterate using value to read
        for (int a : myList) {
                std::cout << a << " ";
        }
        std::cout << "\n";

        // Create an iterator, starting from the front
        auto it = myList.begin();
        // Pushing iterator forward
        std::advance(it, 2);

        // Accessing the value of iterator using de-reference operator
        std::cout << *it << "\n";

        myList.insert(it, 10); // Insert to (the front of) a specific position
        for (int i : myList) {
                std::cout << i << " ";
        }
        std::cout << "\n";
        std::cout << *it << "\n";

        // Getting new iterators at next or previous position
        it = std::next(it, 1);
        std::cout << *it << "\n";
        it = std::prev(it, 1);
        std::cout << *it << "\n";

        return 0;
}
