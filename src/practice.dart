import 'dart:math';

int longestSubstring(String s) {
  final List<String> result = [];

  int answer = 0;

  for (int l = 0, r = 0; r < s.length; r++) {
    while (result.contains(s[r])) {
      result.remove(s[l]);
      l++;
    }
    result.add(s[r]);
    answer = max(answer, r - l + 1);
  }

  return answer;
}
