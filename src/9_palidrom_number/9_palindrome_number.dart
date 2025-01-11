class Solution {
  //It solves the problem but is a shortcut.
  bool isPalindromeShort(int x) {
    if (x < 0) return false;
    final value = x.toString();

    final reversed = value.split('').reversed.join('');

    return value == reversed;
  }

  bool isPalindromeTwoPointers(int x) {
    if (x < 0) return false;

    String str = x.toString();

    int left = 0;
    int right = str.length - 1;

    while (left < right) {
      if (str[left] != str[right]) {
        return false;
      }
      left++;
      right--;
    }

    return true;
  }

  bool isPalindrome(int x) {
    // Step 1: Negative numbers and numbers ending with 0 (except 0) cannot be palindromes
    if (x < 0 || (x % 10 == 0 && x != 0)) {
      return false;
    }

    int reversedHalf = 0;

    // Step 2: Reverse the second half of the number
    while (x > reversedHalf) {
      reversedHalf = reversedHalf * 10 +
          (x % 10); // Get the last digit and build the reversed half
      x = x ~/ 10; // Remove the last digit from x
      print(reversedHalf);
      print(x);
    }

    // Step 3: Compare the first half and the reversed second half
    // If the number is odd length, we can safely ignore the middle digit
    return x == reversedHalf || x == reversedHalf ~/ 10;
  }
}

void main() {
  final sol = Solution();
  print(sol.isPalindrome(12321)); // true
}
