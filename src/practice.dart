bool isMatch(String input, String pattern) {
  int inputLength = input.length;
  int patternLength = pattern.length;
  List<List<bool>> dp = List.generate(
      inputLength + 1, (_) => List.filled(patternLength + 1, false));

  /// Empty input matches empty pattern.
  dp[0][0] = true;

  ///handle empty input matching patterns.

  for (int p = 1; p <= patternLength; p++) {
    if (pattern[p - 1] == '*') {
      dp[0][p] = dp[0][p - 2];
    }
  }

  for (int i = 1; i <= input.length; i++) {
    for (int p = 1; p <= patternLength; p++) {
      if (pattern[p - 1] == '.' || input[i - 1] == pattern[p - 1]) {
        dp[i][p] = dp[i - 1][p - 1];
      } else if (pattern[p - 1] == '*') {
        //This is
        dp[i][p] = dp[i][p - 2] ||
            (dp[i - 1][p] &&
                (pattern[p - 2] == '.' || input[i - 1] == pattern[p - 2]));
      }
    }
  }

  return dp[inputLength][patternLength];
}
