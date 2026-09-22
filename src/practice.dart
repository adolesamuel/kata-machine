bool isMatchPractice(String input, String pattern) {
  final cache = {};
  bool dfs(int i, int p) {
    if (cache.containsKey((i, p))) {
      return cache[(i, p)];
    }
    if (i >= input.length && p >= pattern.length) return true;
    if (p >= pattern.length) return false;

    bool match =
        i < input.length && (input[i] == pattern[p] || pattern[p] == '.');

    if ((p + 1 < pattern.length) && pattern[p + 1] == '*') {
      //don't use the *     or Use the * if there's a match
      cache[(i, p)] = dfs(i, p + 2) || (match && dfs(i + 1, p));
      return cache[(i, p)];
    } else if ((p + 1 < pattern.length) && pattern[p + 1] == '+') {
      cache[(i, p)] = (match && dfs(i + 1, p)) || dfs(i + 1, p + 2);
      return cache[(i, p)];
    } else if (match) {
      cache[(i, p)] = dfs(i + 1, p + 1);
      return cache[(i, p)];
    } else {
      cache[(i, p)] = false;
      return false;
    }
  }

  return dfs(0, 0);
}
