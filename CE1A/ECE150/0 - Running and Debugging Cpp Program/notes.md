# 1 - Running and Debugging C++ Programs
Using VSCode + clang/gcc

## Installing & Configuring the compiler/debugger
- For MacOS (with Clang):
    [Using VSCode with Clang on MacOS](https://code.visualstudio.com/docs/cpp/config-clang-mac)
    
    **Note**: *Sometimes vscode complies your source code as C instead of C++.* 
    In that case, change `/usr/bin/clang` to `/usr/bin/clang++` in the configuration file to ensure the C++ Standard Library is linked correctly.
- For Windows (Using MinGW-w64):
    [Using VSCode with g++ on Windows](https://code.visualstudio.com/docs/cpp/config-mingw)

## Compile & Run Code
1. Press the play button in the top right corner of the editor. ![alt text](images/1.png)
        

## Debugging
1. Set a breakpoint by clicking on the empty space on the left of a line ![alt text](images/2.png)
    You should see a red dot on the left.
    ![alt text](images/3.png)

2. From the drop-down next to the play button, select `Debug C/C++ File`. ![alt text](images/1.png)

3. Highlight shows where the code is executing at the moment. ![alt text](images/4.png)

4. Check the variables on the left side ![alt text](images/5.png)

5. On the debugging control panel, use the `Step` button (or Press F10) to step through the code line by line. ![alt text](images/6.png)
    
    Use the `Continue` button (or Press F5) to jump to the next breakpoint. 
    ![alt text](images/6.2.png)


6. Clicking the `+` icon under `watch` and enter an expression to watch ![alt text](images/7.png)
    and you should see how the value of the expression changes as we step through the code. 