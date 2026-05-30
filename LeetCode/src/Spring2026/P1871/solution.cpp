#include<string>
#include<vector>
#include<iostream>
#include<algorithm>

class Solution {
public:
    bool canReach(std::string s, int minJump, int maxJump) {
       std::vector<bool> reachable(s.length());
       reachable[0] = true;
       for (int i {0}; i < s.length(); i++) {
         if (s.at(i) == '1') continue;
         for (int j{std::max(0, i-maxJump)}; j <= i-minJump && (!reachable[i]); j++)
           reachable[i] = reachable[i] || reachable[j];
       }
       return reachable[s.length()-1]; 
    }
};

int main() {
  Solution solution{};
  std::string s1{"011010"};
  std::string s2{"01101110"};
  std::cout<<solution.canReach(s1, 2, 3) << "\n";
  std::cout<<solution.canReach(s2, 2, 3) << "\n";
  return 0;
}
