#include<string>
#include<cmath>
#include<iostream>
#include<sstream>
#include<optional>
#include <utility>

/**
* Determine the degree of the polynomial
*/
int degree(double a, double b, double c)
{
  if (a != 0)
    return 2;
  if (b != 0)
    return 1;
  return 0;
}

std::string to_str(double num)
{
  std::ostringstream stream {};
  stream << num;
  return stream.str();
}

/**
 * Formats a given term in a polynomial to a proper expression 
 * So that it can join to be larger expressions 
 * @param expr the expression of the term (without coefficient)
 * @param coefficient the coefficient of the term 
 * @param isFirstTerm whether the term is the first NON-ZERO term in the expression 
 * */
std::string formatTerm(std::string expr, double coefficient, bool isFirstTerm)
{
  // Look at the extreme case where coef = 0
  if (coefficient == 0)
  {
    // if it is the constant term, and it is the first non-zero term, write 0
    if (expr.empty() && isFirstTerm) 
      return "0";
    return ""; // Otherwise, leave empty
  }

  std::string result {};
  // Now let's process the sign
  if (coefficient < 0)
  {
    // Looking at the case of negative coefficient
    // A minus sign always occurs before the expression
    result += isFirstTerm ? "-" : " - ";
  } else
  {
    // Looking at the case of positive coefficient
    // Only append plus sign if this is not the first term 
    result += isFirstTerm ? "" : " + ";
  } 
  
  // Now, let's add the Coefficient
  // Sign of coefficient is removed here since it is already added above
  coefficient = std::abs(coefficient);
  // Add the coefficient to the result if it is not 1
  // Or if we are dealing with the constant term
  if (coefficient != 1.0 || expr.empty())
    result += to_str(coefficient);

  // Finally, the expression 
  result += expr;

  return result;
}

/** 
* Find the expanded form of the epxression
*/
std::string expandedForm(double a, double b, double c) 
{
  std::string result {};
  result += formatTerm("x^2", a, true);
  result += formatTerm("x", b, a == 0);
  result += formatTerm("", c, b == 0 && a == 0);
  
  return result;
}

std::string linearPolynomialFactored(double b, double c)
{
  // Consider extreme case where b = 0
  if (b == 0.0)
    return formatTerm("", c, true);
  // Consider the extreme case where c = 0 
  if (c == 0.0)
    return formatTerm("x", b, true);

  std::string coefficient = b == 1.0 ? "" : to_str(b);
  std::string insideBracket = "x" + formatTerm("", c, false);
  return coefficient + "(" + insideBracket + ")";
}

/**
 * Tries to factor a quadratic polynomial.
 * @return an optional string representing the factored expression, if exists
 * */
std::optional<std::string> factoredForm(double a, double b, double c)
{
  // When the equation is linear, use a seperate function to factor 
  if (degree(a, b, c) < 2)
    return linearPolynomialFactored(b, c);
  

  // Delta = b^2 - 4ac
  double delta = b * b - 4 * a * c;
  // Consider the extreme case where delta < 0, there are no real roots
  if (delta < 0)
    return std::nullopt;

  // When delta = 0, there is only one root:
  if (delta == 0.0)
  {
    double root{ -b/(2*a) };
    // Special case root is zero 
    if (root == 0.0)
      return formatTerm("x^2", a, true);
    // Format (x-root) form 
    std::string insideBracket{ "x" + formatTerm("", -root, false) };
    return formatTerm("(" + insideBracket + ")^2", a, true);
  }

  // When delta > 0, there are two roots:
  double root1{ (-b+sqrt(delta)) / (2*a) }, root2{ (-b-sqrt(delta)) / (2*a) };
  
  // Special case where one of the root is zero
  // Always move the zero root to the form for easier formatting 
  if (root2 == 0.0)
    std::swap(root1, root2);
  std::string bracket2{ "(x" + formatTerm("", -root2, false) + ")" };
  if (root1 == 0.0)
  {
     return formatTerm("x", a, true) + bracket2;
  }

  std::string bracket1{ "(x" + formatTerm("", -root1, false) + ")" };
  return formatTerm(bracket2 + bracket1, a, true);
}

/** 
* Formats a quadratic polynomial to vertex form a(x-h) + k 
* Handles linear / constant polynomial properly
* @param an optional string representing the polynomial in vortex form, if the expression is a quadratic
*/
std::optional<std::string> vortexForm(double a, double b, double c)
{
  if (degree(a, b, c) != 2)
    return std::nullopt;

  double h{ -b / (2*a) };
  double k{ a * h*h + b*h + c };

  std::string k_str{ formatTerm("", k, false) };

  // Special case where h = 0 
  if (h == 0)
    return formatTerm("x^2", a, true) + k_str; 


  std::string insideBracket{ "x" + formatTerm("", -h, false) };
  
  return formatTerm("(" + insideBracket + ")^2", a, true) + k_str;
}

int main() 
{
  double a{}, b{}, c{};
  std::cout << "Please enter the coefficients of the quadratic polynomial \"ax^2 + bx + c\" " << std::endl;
  std::cout << "Enter coefficient 'a': ";
  std::cin >> a;
  std::cout << "Enter coefficient 'b': ";
  std::cin >> b;
  std::cout << "Enter coefficient 'c': ";
  std::cin >> c;

  std::cout << "Degree of the polynomial: " << degree(a, b, c) << std::endl;
  std::cout << "Expanded Form: " << expandedForm(a, b, c) << std::endl;

  std::optional<std::string> factored = factoredForm(a, b, c);
  if (factored.has_value())
    std::cout << "Factored Form: " << factored.value() << std::endl;
  else 
    std::cout << "<-- Cannot factor formula since it has no real roots -->" << std::endl;

  std::optional<std::string> vortex = vortexForm(a, b, c);
  if (vortex.has_value())
    std::cout << "Vortex Form: " << vortex.value() << std::endl;
  else 
    std::cout << "<-- Cannot turn linear / constant polynomial to vortex form -->" << std::endl;
  return 0;
}
