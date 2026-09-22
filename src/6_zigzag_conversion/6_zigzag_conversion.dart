// 6. Zigzag Conversion
// Medium
// The string "PAYPALISHIRING" is written in a zigzag pattern on a given number of rows like this:
// (you may want to display this pattern in a fixed font for better legibility)

// P   A   H   N
// A P L S I I G
// Y   I   R
// And then read line by line: "PAHNAPLSIIGYIR"

// Write the code that will take a string and make this conversion given a number of rows:

// string convert(string s, int numRows);

// Example 1:

// Input: s = "PAYPALISHIRING", numRows = 3
// Output: "PAHNAPLSIIGYIR"
// Example 2:

// Input: s = "PAYPALISHIRING", numRows = 4
// Output: "PINALSIGYAHRPI"
// Explanation:
// P     I    N
// A   L S  I G
// Y A   H R
// P     I
// Example 3:

// Input: s = "A", numRows = 1
// Output: "A"

// Constraints:

// 1 <= s.length <= 1000
// s consists of English letters (lower-case and upper-case), ',' and '.'.
// 1 <= numRows <= 1000
void main() {
  final s = "PAYPALISHIRING";
  final case1NumOfRows = 3;
  final case2NumOfRows = 4;

  final case1Answer = Solution.convert(s, case1NumOfRows);
  final case2Answer = Solution.convert(s, case2NumOfRows);

  print(case1Answer);
  print(case2Answer);
}

class Solution {
  static String convert(String s, int numRows) {
    if (numRows == 1) return s;

    String result = "";
    for (int i = 0; i < numRows; ++i) {
      var increment = 2 * (numRows - 1);
      for (int j = i; j < s.length; j += increment) {
        result += s[j];

        if (i > 0 && i < numRows - 1) {
          //We're not in top or bottom
          // index of in between items
          var indexOfInBetweens = j + increment - (2 * i);
          if (indexOfInBetweens < s.length) {
            result += s[indexOfInBetweens];
          }
        }
      }
    }
    return result;
  }
}
