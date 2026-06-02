#include<iostream>
#include<cmath>

/**
 * Finds the highest degree of the polynomial
 */
int highest_degree(double a, double b, double c)
{
  if (a != 0)
    return 2;
  if (b != 0)
    return 1;
  return 0;
}

void print_coefficient(double coef)
{
  if (coef == -1.0)
    std::cout << "-";
  else if (coef != 1.0 && coef!= 0.0)
    std::cout << coef;
}

/**
* Prints the polynomial in expanded form 
*/
void print_expanded_form(double a, double b, double c)
{
  // Print a 
  print_coefficient(a);

  // Print x^2
  if (a != 0.0)
    std::cout << "x^2";
  
  // Print b
  bool isFirstTerm { a==0 };
  // For positive b, only print + sign if it is the first term 
  if (b > 0.0)
    std::cout << (isFirstTerm ? "" : " + ");
  // For negative b, print - sign with appropriate spacing
  else if (b < 0.0)
    std::cout << (isFirstTerm ? "-" : " - ");
  // Now we can remove the sign of b
  b = std::abs(b);
  if (b != 0.0 && b != 1.0)
    std::cout << b;

  // Print x
  if (b != 0.0)
    std::cout << "x";

  // Print c
  isFirstTerm = a==0 && b==0;
  // Similar Approach as above
  if (c > 0.0)
    std::cout << (isFirstTerm ? "" : " + ");
  else if (c < 0.0)
    std::cout << (isFirstTerm ? "-" : " - ");
  c = std::abs(c);
  // If c is not zero or if it is the only term 
  if (c!=0.0 || isFirstTerm)
    std::cout << c;

  std::cout << std::endl;
}

/**
* Prints the factored form of the polynomial 
* Assumption: the polynomial has a highest degree of 2
*/
void print_factored_form(double a, double b, double c)
{
  double delta = b * b - 4 * a * c;
  // Special case where there is no root for the polynomial
  if (delta < 0.0)
  {
    std::cout << "<-- Cannot factor polynomial because it has no real roots. -->" << std::endl;
    return;
  }

  // Output coefficient a first since we always want it 
  print_coefficient(a);


  // Special case where there is only one root
  if (delta == 0.0)
  {
    double root = -b / (2*a); 

    // Special case where root = 0 
    if (root == 0.0)
    {
      std::cout << "x^2" << std::endl;
      return;
    }

    // Output bracket and x
    std::cout << "(x";
    // Output +- root
    std::cout << (root > 0 ? " - " : " + ");
    std::cout << std::abs(root) << ")^2" << std::endl;
    return;
  }

  // Now, we know there are two roots
  double root1{ (-b - std::sqrt(delta)) / (2*a) }, root2{ (-b + std::sqrt(delta)) / (2*a) };
  // Special case where one of the roots is zero
  // We always move the zero root to the front for easier formatting
  if (root2 == 0.0)
    std::swap(root1, root2);
  if (root1 == 0.0)
  {
    std::cout << "x";
  } else 
  {
    std::cout << "(x";
    std::cout << (root1 > 0 ? " - " : " + ");
    std::cout << std::abs(root1) << ")";
  }

  // Now output the second root 
  std::cout << "(x";
  std::cout << (root2 > 0 ? " - " : " + ");
  std::cout << std::abs(root2) << ")" << std::endl;
}

void print_vortex_form(double a, double b, double c)
{
  double h { -b / (2*a) };
  double k { a*h*h + b*h + c };

  // First, print coefficient 
  print_coefficient(a);

  // Special case where h = 0 
  if (h == 0)
  {
    std::cout << "x^2";
  } else 
  {
    std::cout << "(x^2";
    std::cout << (h > 0 ? " - " : " + ") << std::abs(h);
    std::cout << ")";
  }

  if (k != 0)
    std::cout << (k > 0 ? " + " : " - ") << std::abs(k);

  std::cout << std::endl;
}

int main()
{
  std::cout << "Please Enter the coefficients of the polynomial \"ax^2 + bx + c\" " << std::endl;
  double a{}, b{}, c{};
  std::cout << "Enter coefficient 'a': ";
  std::cin >> a;
  std::cout << "Enter coefficient 'b': ";
  std::cin >> b;
  std::cout << "Enter coefficient 'c': ";
  std::cin >> c;

  int deg{ highest_degree(a, b, c) };

  std::cout << "Degree: " << deg << std::endl;

  std::cout << "Expanded Form: ";
  print_expanded_form(a, b, c);
  if (deg == 2)
  {
    std::cout << "Factored Form: ";
    print_factored_form(a, b, c);
    std::cout << "Vortex Form: ";
    print_vortex_form(a, b, c);
  }
}
