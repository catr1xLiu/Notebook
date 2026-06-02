
> [!abstract] Appendix
> 
> # In & Out Parameters Summary

---
> [!quote] Concept
> 
> #### Parameter Direction Categories

Parameters can be categorized by their intended usage:

**Input parameters (in):** Data flows from caller to function. Function reads but doesn't modify. Use `const` to enforce this.

**Output parameters (out):** Data flows from function to caller. Function writes a value that caller receives. Use non-const reference.

**Input-output parameters (in-out):** Data flows both directions. Function reads the initial value and modifies it. Use non-const reference.

```cpp
// Input: pass by value (fundamental) or const ref (class types)
void printSquare(int x) { std::cout << x * x; }
void display(const std::string& text) { std::cout << text; }

// Output: pass by non-const reference
bool getData(int& result) {
    if (/* success */) {
        result = 42;
        return true;
    }
    return false;
}

// Input-output: pass by non-const reference
void transform(std::string& data) {
    data = toUpperCase(data);  // Modifies in place
}
```

> [!hint] Best Practice
> 
> #### Choosing the Right Approach

**General guidelines:**

- **Prefer return values** for single outputs (clearest and safest)
- **Use output parameters** only when returning multiple values
- **Consider `std::tuple` or custom struct** for multiple returns (often clearer than output parameters)
- **Document parameter intent** clearly in comments or function names

```cpp
// ✓ Preferred: Single return value
int calculate(int x, int y) {
    return x * y + y;
}

// ✓ Good: Multiple outputs via out parameters
bool getMinMax(const std::vector<int>& data, int& min, int& max) {
    if (data.empty()) return false;
    min = *std::min_element(data.begin(), data.end());
    max = *std::max_element(data.begin(), data.end());
    return true;
}

// ✓ Better: Multiple outputs via tuple (C++17)
std::optional<std::pair<int, int>> getMinMax(const std::vector<int>& data) {
    if (data.empty()) return std::nullopt;
    int min = *std::min_element(data.begin(), data.end());
    int max = *std::max_element(data.begin(), data.end());
    return std::make_pair(min, max);
}

// ✓ Best: Multiple outputs via struct (most readable)
struct MinMaxResult {
    int min;
    int max;
};

std::optional<MinMaxResult> getMinMax(const std::vector<int>& data) {
    if (data.empty()) return std::nullopt;
    return MinMaxResult{
        *std::min_element(data.begin(), data.end()),
        *std::max_element(data.begin(), data.end())
    };
}
```

> [!fact] Important
> 
> #### Naming Conventions

Use clear names to indicate parameter direction:

```cpp
// Clear input parameters
void calculate(const std::vector<int>& inputData);
void process(std::string_view sourceText);

// Clear output parameters (prefix with 'out')
bool compute(int input, int& outResult);
void split(const std::string& text, std::vector<std::string>& outTokens);

// Clear in-out parameters (prefix with 'inout' or use descriptive names)
void modify(std::string& inoutData);
void accumulate(int newValue, int& runningTotal);
```