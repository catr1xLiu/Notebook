// The "inline" keyword makes a promise to the compiler: 
// "This definition may appear in multiple files, but it is the same everywhere. "
// "When you link the program, just pick one definition and discard the rest."

// This is essential for defining, because this function might be included in different cpp files

inline int myUtilFunction(int x)
{
        return x + 1;
}