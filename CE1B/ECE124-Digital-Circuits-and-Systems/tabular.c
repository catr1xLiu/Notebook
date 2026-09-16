#include<stdio.h>
#include<stddef.h>
#include<stdbit.h>

int main() 
{
    uint8_t a = 0b00001111;
    int a_1_count = stdc_count_ones(a);
    printf("1 counts in a: %d \n", a_1_count);
}
