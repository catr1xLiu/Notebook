/// @author ECE150
/// @include Your project_4.cpp file should contain the include #include
/// "p_4_header.hpp"
/// @include Your project_4.cpp file, this file, and main.cpp should all be the
/// the same directory
/// @remarks This file conatins the function declarations for project_4
/// @remarks To compile this file use the following:
/// @remarks g++ -std=c++17 project_4.cpp main.cpp -o p4.exe
/// @remarks   g++            This is the call to the compiler (replace with
/// clang or clang++ on mac)
/// @remarks   -std=c++17     This asks the compiler to use the 17 version of
/// c++ (allows initialization using {})
/// @remarks   [.cpp files]   As implementation is split between files both are
/// required to compile a full executable
/// @remarks   -o p4.exe      (Optional) Name the resulting executable p4.exe
/// (the default is a.out or a.exe)

// The #ifndef prevents multiple declarations
// - If included a second time ECE150_PROJECT_4 will be defined
// - and all code until the #endif will be excluded.
// - Both project_4.cpp and main.cpp are expected to include this file
#ifndef ECE150_PROJECT_4
#define ECE150_PROJECT_4

#include <algorithm>
#include <cassert>
#include <iostream>

// Function declarations for functions expected in main.cpp
int main();
void read_words_from_file( // 2.10
    char const* filename,
    char**& work_array,
    std::size_t& numwords,
    std::size_t max_length);

// Function declarations for functions expected in project_4.cpp
std::size_t length(char const* a);                                      // 2.1
int compare(char const* str1, char const* str2);                        // 2.2
void assign(char* str1, char const* str2);                              // 2.3
unsigned int distance(char const* str1, char const* str2);              // 2.4
std::size_t is_sorted(char* array[], std::size_t capacity);             // 2.5
void insert(char* array[], std::size_t capacity);                       // 2.6
void insertion_sort(char* array[], std::size_t capacity);               // 2.7
std::size_t remove_duplicates(char* array[], std::size_t capacity);     // 2.8
std::size_t find(char* array[], std::size_t capacity, char const* str); // 2.9
void free_word_array(char** word_array);                                // 2.11

#endif
