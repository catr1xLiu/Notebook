#include "p_4_header.hpp"

#include <algorithm>
#include <cassert>

/**
 * @brief Calculates the length of a string
 * @param a the constant char array, terminated by '\0'
 * @return the length
 * */
std::size_t length(const char* a) {
    // Use a recursive algorithm for simplicity
    return *a == '\0' ? 0 : length(a + 1) + 1;
}

/**
 * @brief Compares which two strings occurs in the dictionary first
 * @param str1 the first string
 * @param str2 the second string
 * @return -1 if str1 occurs before str2, 1 if str2 occurs before str1, 0 if the
 * two strings are equal
 * */
int compare(const char* str1, const char* str2) {
    // If both strings are ended
    // They are equal (we've already compared previous digit)
    if (*str1 == '\0' && *str2 == '\0')
        return 0;

    // The first digit that is different tells us which word comes first
    if (*str1 < *str2)
        return -1;
    if (*str1 > *str2)
        return 1;

    // If the current digit is equal, move to next using recurssion
    return compare(str1 + 1, str2 + 1);
}

/**
 * @brief Copies the value of a string to another
 * @param str1 the target string, with sufficient memory allocated
 * @param str2 the source string terminated by '\0'
 * */
void assign(char* str1, const char* str2) {
    // Copy the current digit
    *str1 = *str2;

    // Terminates when str2 terminates
    if (*str2 != '\0') {
        // Move the next digit using recurssion
        assign(str1 + 1, str2 + 1);
    }
}

/**
 * @brief Finds the distance between str1 and str2
 * @param str1 the first string, teminated by '\0'
 * @param str2 the second strin, terminated by '\0'
 * @return the minimum amount of EDITS (insertion, deletion or modification)
 * needed to turn str1 to str2
 * */
unsigned int distance(const char* str1, const char* str2) {
    // Find the length of the two strings
    const std::size_t len1{length(str1)}, len2{length(str2)};

    // If equal, distance is 0
    if (compare(str1, str2) == 0)
        return 0;

    // dis[i][j] is the distance between the substrings str1+i and str2+j
    // Note for i = len1 or j = len2, we think of that is the distance
    // between "" and a substring of str2 or str1
    int dis[len1 + 1][len2 + 1];

    // First, the distance between an empty string and
    // a string with lenght n is n (all insertions)
    for (int i = 0; i <= len1; i++) {
        dis[i][len2] = len1 - i;
    }
    for (int j = 0; j <= len2; j++) {
        dis[len1][j] = len2 - j;
    }

    for (std::size_t i = len1; (i--) > 0;) {
        for (std::size_t j = len2; (j--) > 0;) {
            // If str1[i] = str2[j], no modification needed
            // So, by simply doing nothing,
            // we can achives a distance dis[i+1][j+1]
            if (str1[i] == str2[j]) {
                dis[i][j] = dis[i + 1][j + 1];
                continue;
            }

            // Otherwise, we can perform the following EDITs:

            // EDIT1: we modify str1[i] to str2[j]
            // This achives a distance dis[i+1][j+1],
            // as we can skip str1[i] and str2[j]
            // 1 is added to the result (one EDIT performed)
            const int dis_modified{dis[i + 1][j + 1] + 1};

            // EDIT2: we insert str2[j] after str1[i]
            // This achives a distance dis[i][j+1],
            // as we can skip str2[j]
            // Similarly, 1 is added to the result
            const int dis_inserted{dis[i][j + 1] + 1};

            // EDIT3: we delete str1[i]
            // This achives a distance dis[i+1][j],
            // as we can removed str1[j]
            // Similarly, 1 is added to the result
            const int dis_deleted{dis[i + 1][j] + 1};

            // We take the MINIMUM of the
            // distance after every possible operation
            dis[i][j] = std::min(std::min(dis_modified, dis_inserted), dis_deleted);
        }
    }

    return dis[0][0];
}

/**
 * @param array an array of string, each string terminated by '\0'
 * @param capcity the capcity of the array
 * @return until what index is the string array sorted, capcity if the entire
 * array is sorted
 * */
std::size_t is_sorted(char** array, std::size_t capacity) {
    for (std::size_t i{1}; i < capacity; i++) {
        if (compare(array[i], array[i - 1]) < 0)
            return i;
    }
    return capacity;
}

/**
 * @brief inserts the last string in the array to appropriate position
 * @param array the array of strings, each string terminated by '\0'
 * @param capcity the capcity of (part of) the string array that we have to deal
 * with
 * */
void insert(char* array[], std::size_t capacity) {
    // Step1, create a copy of the string that we are operating
    char str[21];
    assign(str, array[capacity - 1]);
    std::size_t move_to{capacity - 1};
    for (std::size_t i{0}; i < capacity; i++) {
        if (compare(str, array[i]) < 0) {
            // if str occurs before array[i]
            move_to = i; // Move it before array[i]
            break;
        }
    }

    // Perform the move-to action
    // Shift the string forward
    for (std::size_t i{capacity - 1}; i > move_to; i--) {
        // Replace every digit with the one before it
        assign(array[i], array[i - 1]);
    }
    // Place the targeted string
    assign(array[move_to], str);
}

/**
 * @brief sort the string array in dictionary order using insertion sort
 * */
void insertion_sort(char* array[], std::size_t capacity) {
    for (std::size_t i = 2; i <= capacity; i++) {
        insert(array, i);
    }
}

/**
 * @breif Removes duplicated entries in a string array
 * @param array the string array, sorted, each string terminated with '\0'
 * @param capcity the capcity of array[]
 * @return the amount of unique entries
 * */
std::size_t remove_duplicates(char* array[], std::size_t capacity) {
    const char* nullstr = "";
    std::size_t to{1};
    for (std::size_t from{1}; from < capacity; from++) {
        if (compare(array[from - 1], array[from]) != 0) {
            assign(array[to++], array[from]);
        }
    }

    return to;
}

std::size_t find(char* array[], std::size_t capacity, const char* str) {
    std::size_t result{0};
    for (std::size_t i{0}; i < capacity; i++) {
        if (distance(str, array[i]) < distance(str, array[result])) {
            result = i;
        }
    }

    return result;
}

void free_word_array(char* word_array[]) {
    delete[] word_array[0];
    delete[] word_array;
}
