bool isMatchPractice(String input, String pattern) {
  List<List<bool>> dp = List.generate(
    input.length + 1,
    (_) => List.filled(pattern.length + 1, false),
  );

  dp[0][0] = true;

  for (int p = 1; p <= pattern.length; p++) {
    if (pattern[p - 1] == '*') {
      dp[0][p] = dp[0][p - 2];
    } else if (pattern[p - 1] == '+') {
      dp[0][p] = false;
    }
  }

  for (int i = 1; i <= input.length; i++) {
    for (int p = 1; p <= pattern.length; p++) {
      if (pattern[p - 1] == '.' || pattern[p - 1] == input[i - 1]) {
        dp[i][p] = dp[i - 1][p - 1];
      } else if (pattern[p - 1] == '*') {
        dp[i][p] = dp[i][p - 2] ||
            (dp[i - 1][p] &&
                (pattern[p - 2] == '.' || pattern[p - 2] == input[i - 1]));
      } else if (pattern[p - 1] == '+') {
        dp[i][p] = (dp[i - 1][p] &&
            (pattern[p - 2] == '.' || pattern[p - 2] == input[i - 1]));
        if (i > 1) {
          dp[i][p] = dp[i][p] || dp[i - 1][p - 1];
        }
      }
    }
  }

  for (int i = 0; i < dp.length; i++) {
    print('${dp[i]}' + '\n');
  }
  return dp[input.length][pattern.length];
}
