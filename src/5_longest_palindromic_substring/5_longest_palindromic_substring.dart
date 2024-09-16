void main() {
  final s = "babad";

  Solution sol = Solution();

  final result = sol.longestPalindrome(s);

  print(result);
}

class Solution {
  String longestPalindrome(String s) {
    String question = s;
    String result = '';

    for (int l = 0, r = 0; r < s.length; ++r) {
      bool isPalin =
          question.substring(l, r + 1) == reverse(question.substring(l, r + 1));

      if (isPalin) {
        if (result.length < question.substring(l, r + 1).length) {
          result = question.substring(l, r + 1);
        }
      } else {
        if (r == s.length - 1) {
          l++;
          r = l;
        }
      }
    }

    return result;
  }
}

String reverse(String s) {
  return s.split('').reversed.join();
}
