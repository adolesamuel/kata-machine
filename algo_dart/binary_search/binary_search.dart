bool binarySearch(int needle, List<int> haystack) {
  int high = haystack.length;
  int low = 0;

  while (low < high) {
    int mid = (low + high) ~/ 2;

    if (haystack[mid] == needle) {
      return true;
    } else if (haystack[mid] > needle) {
      high = mid;
    } else if (haystack[mid] < needle) {
      low = mid + 1;
    }
  }

  return false;
}
