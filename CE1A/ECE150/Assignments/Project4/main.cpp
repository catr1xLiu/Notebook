#include "p_4_header.hpp"

#include <cassert>
#include <cstddef>
#include <cstring>
#include <fstream>
#include <iostream>

constexpr std::size_t WIDTH{20};

void task1_test();
void task2_test();
void task3_test();
void task4_test();
void task5_6_7_test();
void task8_test();
void task9_test();

/// @brief This main is used for testing. Feel free to modify the contents.
/// @remark This file is replaced with a testing main when you submit your
/// project.
int main() {
    task1_test();
    task2_test();
    task3_test();
    task4_test();
    task5_6_7_test();
    task8_test();
    task9_test();

    char** test_words{};          // empty word array
    std::size_t num_test_words{}; // number of words (will be modified when
                                  // a file is read)

    // populate the word array, and update the number of words
    read_words_from_file("test_words.txt", test_words, num_test_words, WIDTH);

    // deallocate
    free_word_array(test_words);

    return 0;
}

void task1_test() {
    std::cout << "<-- Test Cases for Task1 -->" << std::endl;
    const char* test_word = "character";
    std::cout << "Length of " << test_word << " is " << strlen(test_word) << std::endl;
}

void task2_test() {
    std::cout << "<-- Test Cases for Task2 -->" << std::endl;

    // Test 1: Equal strings
    std::cout << "Test 1 - Equal strings: compare(\"hello\", \"hello\") = " << compare("hello", "hello") << std::endl;

    // Test 2: str1 < str2
    std::cout << "Test 2 - str1 < str2: compare(\"apple\", \"banana\") = " << compare("apple", "banana") << std::endl;

    // Test 3: str1 > str2
    std::cout << "Test 3 - str1 > str2: compare(\"zebra\", \"apple\") = " << compare("zebra", "apple") << std::endl;

    // Test 4: Prefix comparison
    std::cout << "Test 4 - Prefix: compare(\"cat\", \"catfish\") = " << compare("cat", "catfish") << std::endl;

    // Test 5: Empty string
    std::cout << "Test 5 - Empty string: compare(\"\", \"hello\") = " << compare("", "hello") << std::endl;
}

void task3_test() {
    std::cout << "<-- Test Cases for Task 3 -->" << std::endl;
    char original_word[WIDTH]{"original"};

    // Test case1: equal length
    const char* word1{"birthday"};
    assign(original_word, word1);
    std::cout << "After replacement 1: " << original_word << std::endl;

    // Test case2: longer length
    const char* word2{"entertainment"};
    assign(original_word, word2);
    std::cout << "After replacement 2: " << original_word << std::endl;

    // Test case3: shorter lenth
    const char* word3{"cat"};
    assign(original_word, word3);
    std::cout << "After replacement 3: " << original_word << std::endl;
}

void task4_test() {
    std::cout << "<-- Test Cases for Task4 -->" << std::endl;
    // Hey copilot help me write test cases for distance function
    const char* word1 = "kitten";
    const char* word2 = "sitting";
    std::cout << "Distance between " << word1 << " and " << word2 << " is " << distance(word1, word2) << std::endl;

    // Some more test cases please, copilot
    const char* word3 = "flaw";
    const char* word4 = "lawn";

    std::cout << "Distance between " << word3 << " and " << word4 << " is " << distance(word3, word4) << std::endl;

    const char* word5 = "intention";
    const char* word6 = "execution";

    std::cout << "Distance between " << word5 << " and " << word6 << " is " << distance(word5, word6) << std::endl;

    // Expected output: 3, 2, 5
}

void print_array(char* array[], std::size_t cap) {
    std::cout << "{ ";
    for (std::size_t i{0}; i < cap; i++) {
        std::cout << array[i] << " ";
    }
    std::cout << "}" << std::endl;
}

void task5_6_7_test() {
    std::cout << "<-- Test Cases for Task5, 6 and 7 -->" << std::endl;

    char apple[WIDTH + 1] = "apple";
    char banana[WIDTH + 1] = "banana";
    char date[WIDTH + 1] = "date";
    char cat[WIDTH + 1] = "cat";
    char friend_str[WIDTH + 1] = "friend";
    char mouse[WIDTH + 1] = "mouse";
    char file[WIDTH + 1] = "file";
    char zebra[WIDTH + 1] = "zebra";
    char word[WIDTH + 1] = "word";
    char jungle[WIDTH + 1] = "jungle";

    char* words[] = {apple, banana, date, cat, friend_str, mouse, file, zebra, word, jungle};

    // Test 1: Unsorted array
    std::cout << "Test1 - Array with first two items sorted: is_sorted = " << is_sorted(words, 10) << std::endl;

    // Test 2: Sorting array
    insertion_sort(words, 10);
    std::cout << "Sorted Array: ";
    print_array(words, 10);
    std::cout << "Test 2 - Sorted array: is_sorted = " << is_sorted(words, 10) << std::endl;

    // Test 3: Single element
    char* single_array[] = {"hello"};
    std::cout << "Test 3 - Single element: is_sorted([\"hello\"], 1) = " << is_sorted(single_array, 1) << std::endl;

    // Test 4: Two elements sorted
    char* two_sorted[] = {"apple", "banana"};
    std::cout << "Test 4 - Two elements sorted: is_sorted([\"apple\", "
                 "\"banana\"], 2) = "
              << is_sorted(two_sorted, 2) << std::endl;

    // Test 5: All same strings
    char* same_array[] = {"hello", "hello", "hello"};
    std::cout << "Test 5 - All same strings: is_sorted([\"hello\", "
                 "\"hello\", \"hello\"], 3) = "
              << is_sorted(same_array, 3) << std::endl;
}

void task8_test() {
    std::cout << "<-- Test Cases for Task 8 -->" << std::endl;

    char word1[WIDTH + 1]{"apple"};
    char word2[WIDTH + 1]{"apple"};
    char word3[WIDTH + 1]{"banna"};
    char word4[WIDTH + 1]{"cherry"};
    char word5[WIDTH + 1]{"cherry"};

    char* words[] = {word1, word2, word3, word4, word5};

    std::size_t cap = remove_duplicates(words, 5);
    print_array(words, cap);
}

void task9_test() {
    std::cout << "<-- Test Cases for Task 9 -->" << std::endl;

    char apple[WIDTH + 1] = "apple";
    char banana[WIDTH + 1] = "banana";
    char date[WIDTH + 1] = "date";
    char cat[WIDTH + 1] = "cat";
    char friend_str[WIDTH + 1] = "friend";
    char mouse[WIDTH + 1] = "mouse";
    char file[WIDTH + 1] = "file";
    char zebra[WIDTH + 1] = "zebra";
    char word[WIDTH + 1] = "word";
    char jungle[WIDTH + 1] = "jungle";

    char* words[] = {apple, banana, date, cat, friend_str, mouse, file, zebra, word, jungle};

    std::cout << "words = ";
    print_array(words, 10);
    const char word1[WIDTH + 1] = "friend";
    std::cout << "find(friend) = " << find(words, 10, word1) << std::endl;

    const char word2[WIDTH + 1] = "french";
    std::cout << "find(french) = " << find(words, 10, word2) << std::endl;

    const char word3[WIDTH + 1] = "jungle";
    std::cout << "find(jungle) = " << find(words, 10, word3) << std::endl;

    const char word4[WIDTH + 1] = "fire";
    std::cout << "find(fire) = " << find(words, 10, word4) << std::endl;
}

/// @brief Reads words from a text file, allocates and populates a word array,
/// and modifies the number of words
/// @remark You will need to understand how memory is allocated in order to
/// delete memory in free_word_array
/// @param filename the name of the file to be opened
/// @param word_array given a word array pointer, allocates the word array
/// @param num_words updates (pass by reference) the number of words found in
/// the file
/// @param width the maximum number of letters in a word
void read_words_from_file(char const* filename, char**& word_array, std::size_t& num_words, std::size_t width) {

    // Attempt to open the file
    std::ifstream file{filename};
    if (!file.is_open()) {
        std::cout << "[ERROR] " << filename << " not found or could not open file" << std::endl;
    }
    assert(file.is_open());

    // Read the number of words from the first line of the file
    file >> num_words;

    // Ignore the newline '\n' character after the number
    file.ignore();

    /// Allocate memory and initialize the word array
    word_array = new char* [num_words] {};               // pointers to individual words
    word_array[0] = new char[num_words * (width + 1)]{}; // contiguous list of all words

    for (std::size_t k{1}; k < num_words; ++k) { // connect the individual word pointers
        word_array[k] = word_array[k - 1] + width + 1;
    }

    // Read from the file into the word array
    for (std::size_t k{0}; k < num_words; ++k) {
        file >> word_array[k];
    }

    file.close();
}
