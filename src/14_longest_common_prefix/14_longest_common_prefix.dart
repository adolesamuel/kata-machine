/// Vertical Scanning Approach
String longestCommonPrefix(List<String> strs) {
  if (strs.isEmpty) return '';
  for (int i = 0; i < strs[0].length; i++) {
    String char = strs[0][i];

    for (int j = 1; j < strs.length; j++) {
      if (i == strs[j].length || strs[j][i] != char) {
        return strs[0].substring(0, i);
      }
    }
  }

  return strs[0];
}
