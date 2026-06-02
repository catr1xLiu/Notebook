// Part3: Function Overloading


// Define function add() with two integer arguments and integer return type
int add(int a, int b)
{
        return a + b;
}

// Define the same function add(), this time with double arguments and integer return type
double add(double a, double b)
{
        return a + b;
}

// Define the same function add() with only one integer argument
double add(int a)
{
        return add(1, a);
}