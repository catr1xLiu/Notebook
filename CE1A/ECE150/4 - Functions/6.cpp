#include<iostream>
#include<functional>
// Part5: Anonymous Functions (Lambda Expressions)

int main() {
        // 1. Basic Lambda
        auto add = [](int a, int b)
                {
                        // a and b are parameters of the lambda
                        return a + b;
                };
        // This is equivellant to:
        std::function<int(int, int)> add2 = [](int a, int b)
                {
                        // a and b are parameters of the lambda
                        return a + b;
                };
        std::cout << add(5, 3) << std::endl; // output: 8

        auto broken_function = [](int a, int b) {
                if (a > b)
                        return a + b; // return int type
                else
                        // The lambda expression must have a fixed return type, so we must return int type here
                        // return false; // Error: return type "bool" conflicts with previously deduced type "int"
                        return a - b; // works
                };

        std::cout << std::endl << std::endl;


        // 2. Reading variables from surrounding environment
        int myVariable{ 5 };
        auto lambdaWithReadAccessToExternalVariables = [=]()
                {
                        // The [=] makes all external variables under main() READABLE inside the lambda function

                        // myVariable++; // ERROR: we cannot modify external values
                        std::cout << myVariable << std::endl; // outputs 5, the external variable myVariable is READABLE

                        // Now we can re-define myVariable as a local variable
                        int myVariable{ 10 };
                        myVariable++; // Works, because myVariable is now a local variable
                        std::cout << myVariable << std::endl; // output:11
                };
        lambdaWithReadAccessToExternalVariables();
        std::cout << std::endl << std::endl;


        // 3. Modifying variables from surrounding environment
        std::cout << "myVariable in scope main() (before) : " << myVariable << std::endl; // output: 5
        auto lambdaWithFullAccessToExternalVariables = [&]()
                {
                        // The [&] makes all external variables under main() FULLY ACCESSIBLE in this lambda function
                        // In the lambda function, we can READ/WRITE the external variables

                        std::cout << "myVariable inside lambda (Before): " << myVariable << std::endl; // output: 5
                        myVariable += 5; // Works, because we can READ/WRITE external variables in this case.
                        std::cout << "myVariable inside lambda (After): " << myVariable << std::endl; // output: 10
                };
        lambdaWithFullAccessToExternalVariables();
        std::cout << "myVariable in scope main() (after) : " << myVariable << std::endl; // output: 10

        std::cout << std::endl << std::endl;


        // 4. Accessing specific values from surrounding environment
        int x{ 10 }, y{ 20 };
        auto lambdaWithSpecificAccess = [x, &y]()
                {
                        // This lambda expression has:
                        //  1. READ access to external variable x
                        //  2. READ/WRITE access to external variable y

                        // x+= 10; // error, we CANNOT modify x
                        std::cout << x << std::endl; // output: 10

                        y += 10; // works, we can modify y
                        std::cout << y << std::endl; // output: 30
                };
        lambdaWithSpecificAccess();
        std::cout << y << std::endl; // output:30
}