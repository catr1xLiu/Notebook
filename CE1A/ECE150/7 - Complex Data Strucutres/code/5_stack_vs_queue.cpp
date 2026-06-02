#include <iostream>
#include <queue>
#include <stack>

int main()
{
        std::queue<int> q;

        q.push(1);
        q.push(2);
        q.push(3);
        q.push(4);

        // Take objects out of queue one by one
        // First-in, Last-out rule
        while (!q.empty()) {
                std::cout << q.front() << " ";
                q.pop();
        }
        std::cout << "\n";

        std::stack<int> s;
        s.push(10);
        s.push(20);
        s.push(30);
        while (!s.empty()) {
                std::cout << s.top() << " ";
                s.pop();
        }
        std::cout << "\n";
}
