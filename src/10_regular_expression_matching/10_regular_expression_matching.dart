import '../practice.dart';

/// Comments:
/// The Top down Memoization and the DP Table
/// are basicallly the same algorithm.
/// Just different implementation of memoization.
///
// TOP Down Memoization.
bool isMatch(String s, String p) {
  final cache = {};
  // Ignore the cache when reading. It basically
  // works fine without it.

  bool dfs(int i, j) {
    if (cache.containsKey((i, j))) {
      return cache[(i, j)];
    }
    if (i >= s.length && j >= p.length) return true;
    if (j >= p.length) return false;

    bool match = i < s.length && (s[i] == p[j] || p[j] == '.');
    if ((j + 1) < p.length && p[j + 1] == '*') {
      cache[(i, j)] = dfs(i, j + 2) || (match && dfs(i + 1, j));
      return cache[(i, j)];
    }
    if (match) {
      cache[(i, j)] = dfs(i + 1, j + 1);
      return cache[(i, j)];
    }
    cache[(i, j)] = false;
    return false;
  }

  return dfs(0, 0);
}

/// DP Table Solution.
bool isMatchDpTable(String input, String pattern) {
  List<List<bool>> dp = List.generate(
      input.length + 1, (_) => List.filled(pattern.length + 1, false));
  print('Just Created dp: $dp');

  /// Empty input matches empty pattern.
  dp[0][0] = true;

  print('Empty Input matches dp: $dp');

  // Handle patterns with '*' that can match zero characters
  for (int patternIndex = 1; patternIndex <= pattern.length; patternIndex++) {
    if (pattern[patternIndex - 1] == '*') {
      dp[0][patternIndex] = dp[0][patternIndex - 2];
    }
  }

  print('After matching pattern to empty dp: $dp');

  for (int i = 1; i <= input.length; i++) {
    for (int p = 1; p <= pattern.length; p++) {
      //if current pattern is '.' or input character == pattern character
      // then current value = previous value.(value saved to the table.)
      if (pattern[p - 1] == '.' || input[i - 1] == pattern[p - 1]) {
        dp[i][p] = dp[i - 1][p - 1];
      } else if (pattern[p - 1] == '*') {
        // this is the core logic
        // else if current pattern is '*' then
        // is is valid when the pattern is not applied or zero, or
        // is it valid for one and the character is supported
        //
        dp[i][p] = dp[i][p - 2] ||
            (dp[i - 1][p] &&
                (pattern[p - 2] == '.' || input[i - 1] == pattern[p - 2]));
      } else if (pattern[p - 1] == '+') {
        dp[i][p] = dp[i - 1][p - 1] ||
            (dp[i - 1][p] &&
                (pattern[p - 2] == '.' || input[i - 1] == pattern[p - 2]));
        // if (i > 1) {
        //   dp[i][p] = dp[i][p] || dp[i - 1][p - 1];
        // }
      }
      print('for loop : i=$i, p=$p');
      print(dp);
      print('------------------');
    }
  }

  print('final Value $dp');

  return dp[input.length][pattern.length];
}

void main() {
  // print(isMatchPractice("aa", "a")); // false
  print(isMatchPractice("aab", "a+.")); // true
  // print(isMatchDpTable("ab", ".*")); // true
  // print(isMatchPractice("aab", "c*a+b")); // true
  print(isMatchPractice("mississippi", "mis*is*p+.")); // false
}


//1
//2