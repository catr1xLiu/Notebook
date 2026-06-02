#include<iostream>
#include<cassert>

void line(unsigned int n, unsigned int i)
{
  for (unsigned int j = 0; j < n-i; j++)
    std::cout << " ";
  for (unsigned int j = 0; j < 1 + i*2; j++)
    std::cout << "*";
  std::cout << std::endl;
}

void pattern(unsigned int n)
{
  for (unsigned i = n; i > 0; i--)
  {
    line(n, i);
  }
  for (unsigned int i = 0; i <= n; i++)
  {
    line(n, i);
  }
}

unsigned int exp10(unsigned int m)
{
  unsigned int result = 1;
  for (unsigned int i = 0; i < m; i++)
    result *= 10;
  return result;
}

unsigned int log10(unsigned int n)
{
  for (unsigned int m = 0; m < 10; m++)
    if (exp10(m) > n)
      return m-1;
  return 9;
}

unsigned int count(unsigned int n, unsigned int bit)
{
  assert(bit == 1 || bit == 0);

  unsigned int ones_count = 0;
  while (n != 0)
  {
    ones_count += n % 2;
    n /= 2;
  }

  return bit == 1 ? ones_count : 32-ones_count;
}

unsigned int shift_right(unsigned int n, unsigned int byte)
{
  return n >> (byte * 8);
}

unsigned int shift_left(unsigned int n, unsigned int byte)
{
  return n << (byte * 8);

}

unsigned int swap_bytes(unsigned int n, unsigned int b0, unsigned int b1)
{
  assert(0 <= b0 && b0 <= 3 && 0 <= b1 && b1 <= 3);

  unsigned int num_b0{ shift_right(shift_left(n, 3-b0), 3) };
  unsigned int num_b1{ shift_right(shift_left(n, 3-b1), 3) };

  std::cout << std::hex << num_b0 << " " << std::hex << num_b1 << std::endl;

  n -= shift_left(num_b0, b0) + shift_left(num_b1, b1);
  n += shift_left(num_b0, b1) + shift_left(num_b1, b0);

  return n;
}

int main_() 
{
  for (int i = 0; i < 5; i++)
  {
    pattern(i);
    std::cout<<std::endl<<std::endl;
  }
  std::cout << log10(101U) << std::endl;
  std::cout << log10(147483649U) << std::endl;

  std::cout << count(0x03020100U, 1) << std::endl;
  std::cout << count(0x03020100U, 0) << std::endl;

  std::cout << std::hex << swap_bytes(0x6f1b5a04U, 1, 3) << std::endl;

  return 0;
}
