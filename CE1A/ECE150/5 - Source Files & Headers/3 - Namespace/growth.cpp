#include "growth.h"

namespace MyMathUtils
{
        // implement the function defined in circle.h
        double growth(int time)
        {
                double ans{ 1.0 };
                for (int i = 0; i < time; i++)
                        ans *= e;
                return ans;
        }
}