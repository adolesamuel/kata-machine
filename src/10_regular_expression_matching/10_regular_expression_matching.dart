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
  int inputLength = input.length;
  int patternLength = pattern.length;
  List<List<bool>> dp = List.generate(
      inputLength + 1, (_) => List.filled(patternLength + 1, false));

  dp[0][0] = true;

  // Handle patterns with '*' that can match zero characters
  for (int patternIndex = 1; patternIndex <= patternLength; patternIndex++) {
    if (pattern[patternIndex - 1] == '*') {
      dp[0][patternIndex] = dp[0][patternIndex - 2];
    }
  }

  for (int inputIndex = 1; inputIndex <= inputLength; inputIndex++) {
    for (int patternIndex = 1; patternIndex <= patternLength; patternIndex++) {
      if (pattern[patternIndex - 1] == '.' ||
          input[inputIndex - 1] == pattern[patternIndex - 1]) {
        dp[inputIndex][patternIndex] = dp[inputIndex - 1][patternIndex - 1];
      } else if (pattern[patternIndex - 1] == '*') {
        dp[inputIndex][patternIndex] = dp[inputIndex][patternIndex - 2] ||
            (dp[inputIndex - 1][patternIndex] &&
                (pattern[patternIndex - 2] == '.' ||
                    input[inputIndex - 1] == pattern[patternIndex - 2]));
      }
    }
  }

  return dp[inputLength][patternLength];
}

void main() {
  print(isMatch("aa", "a")); // false
  print(isMatch("aa", "a*")); // true
  print(isMatch("ab", ".*")); // true
  print(isMatch("aab", "c*a*b")); // true
  print(isMatch("mississippi", "mis*is*p*.")); // false
}
