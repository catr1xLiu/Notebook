#include <iostream>
#include <string>
#include <vector>

class Person {
public:
        Person(const std::string& first, const std::string& last, int age)
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

        virtual void printInfo() const {
                printName();
                std::cout << "Age: " << this->age << std::endl;
        }

        // Virtual methods allows child classes to override the function
        // This enables polymorphism, which allows us to call the appropriate method based on the actual object type
        virtual void type() {
                std::cout << "I am a person" << std::endl;
        }

        // For classes with sub-class, we always use a virtual destructor for proper cleanup of derived classes
        virtual ~Person() {
                std::cout << "Person destructor actions..." << std::endl;
        }

private:
        // Variables determined at initialization should be constant
        const std::string firstName;
        const std::string lastName;

protected:
        // Variables accessible by child classses
        int age = 0;
};

// An class that is derrived from Person
// Has all the features of Person and with other additional features
class Employee : public Person { // public inhertiance gives access to public functions of Person
public:
        Employee(const std::string& first, const std::string& last, int age, const std::string& department, int salary) : Person(first, last, age), department(department), salary(salary) {
                std::cout << "Employee constructor actions..." << std::endl;
        }

        void type() override { // override keyword indicates we are overriding a virtual method
                std::cout << "I am an employee" << std::endl;
        }

        void addSkill(const std::string& skill) {
                this->skills.push_back(skill);
        }

        void listSkills() const {
                std::cout << "Skills: ";
                for (const auto& skill : this->skills) {
                        std::cout << skill << " ";
                }
                std::cout << std::endl;
        }

        void printInfo() const override {
                Person::printInfo(); // Call base class method
                std::cout << "Department: " << this->department << std::endl;
                std::cout << "Salary: " << this->salary << std::endl;
                this->listSkills();
        }

        ~Employee() override {
                std::cout << "Employee destructor actions..." << std::endl;
                // Base class destructor will be called automatically after derived class destructor
        }

private:
        std::string department;
        int salary;
        std::vector<std::string> skills;
};


void utilFunction(const Employee& e) {
        e.printInfo();
}


int main() {
        Person p("Sam", "Liu", 19); // Creates an instant
        p.printName(); // Call member function

        Person* p2 = new Person("Simon", "Says", 24);
        p2->printName(); // Call function on pointer

        Employee* e = new Employee("John", "Doe", 26, "1", 100); // Create Employee instant
        e->printInfo(); // Call Employee member function
        e->printName(); // Since Employee is publically inhertied from Person, we can call Person member function

        e->type(); // Calls the overridden method in Employee
        // Call member functions unique to Employee
        e->addSkill("C++");
        e->addSkill("Python");
        e->listSkills();
        std::cout << "----" << std::endl;

        // If we have multiple persons in a vector
        std::vector<Person*> people; // We always use pointers to achieve polymorphism
        people.push_back(&p);
        people.push_back(p2);
        people.push_back(e); // Employee is a Person, so we can add it to the vector

        for (const auto& personPtr : people) {
                personPtr->type(); // Calls the appropriate type() method based on the actual object type
        }

        delete p2; // Clean up dynamically allocated memory
        delete e;  // Clean up dynamically allocated memory
        people.clear(); // Clear pointer vector to avoid dangling pointers

        std::cout << "----" << std::endl;

        return 0; // End of main calls destructors for stack allocated objects
}