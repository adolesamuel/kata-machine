import 'dart:math';

void main() {
  final s = "babad";

  Solution sol = Solution();

  final result = sol.longestPalindrome(s);

  print(result);
}

//n2
class Solution {
  String longestPalindrome(String s) {
    String result = '';
    int resLen = 0;

    int l = 0;
    int r = 0;

    for (int i = 0; i < s.length; ++i) {
      //odd length
      l = i;
      r = i;
      while (l >= 0 && r < s.length && s[l] == s[r]) {
        result = resLen > r - l + 1 ? result : s.substring(l, r + 1);
        resLen = max(resLen, r - l + 1);

        l -= 1;
        r += 1;
      }

      //Even length
      l = i;
      r = i + 1;
      while (l >= 0 && r < s.length && s[l] == s[r]) {
        result = resLen > r - l + 1 ? result : s.substring(l, r + 1);
        resLen = max(resLen, r - l + 1);
        l -= 1;
        r += 1;
      }
    }

    return result;
  }
}
