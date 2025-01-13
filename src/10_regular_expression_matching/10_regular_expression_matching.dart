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

  dp[0][0] = true;

  // Handle patterns with '*' that can match zero characters
  for (int patternIndex = 1; patternIndex <= pattern.length; patternIndex++) {
    if (pattern[patternIndex - 1] == '*') {
      dp[0][patternIndex] = dp[0][patternIndex - 2];
    }
  }

  for (int i = 1; i <= input.length; i++) {
    for (int p = 1; p <= pattern.length; p++) {
      if (pattern[p - 1] == '.' || input[i - 1] == pattern[p - 1]) {
        dp[i][p] = dp[i - 1][p - 1];
      } else if (pattern[p - 1] == '*') {
        //this is the core logic
        dp[i][p] = dp[i][p - 2] ||
            (dp[i - 1][p] &&
                (pattern[p - 2] == '.' || input[i - 1] == pattern[p - 2]));
      }
    }
  }

  return dp[input.length][pattern.length];
}

void main() {
  print(isMatchDpTable("aa", "a")); // false
  print(isMatchDpTable("aa", "a*")); // true
  print(isMatchDpTable("ab", ".*")); // true
  print(isMatchDpTable("aab", "c*a*b")); // true
  print(isMatchDpTable("mississippi", "mis*is*p*.")); // false
}
