// 7. Reverse Integer
// Medium
// Topics
// Companies
// Given a signed 32-bit integer x, return x with its digits reversed.
// If reversing x causes the value to go outside the signed 32-bit integer range [-231, 231 - 1], then return 0.

// Assume the environment does not allow you to store 64-bit integers (signed or unsigned).

// Example 1:

// Input: x = 123
// Output: 321

// Example 2:

// Input: x = -123
// Output: -321

// Example 3:

// Input: x = 120
// Output: 21

// Constraints:

// -2^31 <= x <= 2^31 - 1

class Solution {
  int reverse(int x) {
    int answer = x;

    final stringvalue = x < 0 ? (x * -1).toString() : x.toString();

    final arrayOfValue = stringvalue.split('');

    final resultArray = arrayOfValue.reversed.join();

    answer = int.parse(resultArray);

    if (answer > 231 || answer < -231) {
      return 0;
    }

    return x < 0 ? -answer : answer;
  }

  int reverseBetterSolution(int x) {
    int ans = 0;

    bool isNegative = x < 0;

    x = isNegative ? -x : x;

    while (x != 0) {
      ans = (ans * 10) + (x % 10);
      x ~/= 10; // Integer division in Dart
    }

    // Check if ans is within 32-bit integer range
    if (ans > (1 << 31) || ans < -(1 << 31)) {
      return 0;
    }

    return isNegative ? -ans : ans;
  }
}
