#include <iostream>
#include <string>
#include <vector>

class Person {
public:
        Person(std::string first, std::string last, int age)
                // Use : to initialize vairables is the standard way
                : firstName(first), lastName(last), age(age) {
                std::cout << "Things to execute during construction..." << std::endl;
        }

        Person() = delete; // Remove default constructer

        // member method
        void printName() const { // const tells compiler the function won't modify anything
                std::cout << "Name: "
                        // Use this -> to refer to private variables
                        << this->firstName << " "
                        << this->lastName << std::endl;
        }

        // member method that modifies age
        void increaseAge(int years) {
                this->age += years;
        }

        // Static utility function
        static void utilFunction() {
                std::cout << "Utility Function" << std::endl;
        }

        // Destructor, any cleanup code goes here
        ~Person() {
                std::cout << "Person destructor called for " << this->firstName << " " << this->lastName << std::endl;
        }

private:
        // Variables determined at initialization should be constant
        const std::string firstName;
        const std::string lastName;
        // Variables that can be modified
        int age = 0;
};

// This function would increase the age of the person by 'years'
// We always pass objects by reference to avoid copying
void growAge(Person& person, int years) {
        person.increaseAge(years);
}

// This function would print the name of a const Person
// Since we don't want to modify the person, we use a const reference
void printPersonAge(const Person& person) {
        // We can only call const methods on const objects
        person.printName();
}

int main() {
        Person p("Bill", "Gates", 19); // Creates an instant
        p.printName(); // Call member function

        Person* p2 = new Person("Simon", "Says", 24);
        p2->printName(); // Call function on pointer
        growAge(*p2, 5);

        delete p2; // Manually call destructor for pointer
        p2 = nullptr; // Set pointer to null after deletion

        return 0; // Exits main and calls destructor for p
}