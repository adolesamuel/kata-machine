// 4. Median of Two Sorted Arrays
// Hard

// Given two sorted arrays nums1 and nums2 of size m and n respectively, return the median of the two sorted arrays.

// The overall run time complexity should be O(log (m+n)).

// Example 1:

// Input: nums1 = [1,3], nums2 = [2]
// Output: 2.00000
// Explanation: merged array = [1,2,3] and median is 2.
// Example 2:

// Input: nums1 = [1,2], nums2 = [3,4]
// Output: 2.50000
// Explanation: merged array = [1,2,3,4] and median is (2 + 3) / 2 = 2.5.

class Solution {
  double findMedianSortedArrays(List<int> nums1, List<int> nums2) {
    int l = 0;
    int r = 0;
    List<int> result = [];

    while (l < nums1.length && r < nums2.length) {
      if (nums1[l] <= nums2[r]) {
        result.add(nums1[l]);
        l++;
      } else {
        result.add(nums2[r]);
        r++;
      }
    }

    while (l < nums1.length) {
      result.add(nums1[l]);
      l++;
    }
    while (r < nums2.length) {
      result.add(nums2[r]);
      r++;
    }

    if (result.length % 2 == 0) {
      final median = result.length ~/ 2;
      final answer = ((result[median] + result[median - 1]) / 2);
      return answer.toDouble();
    }

    final answer = result.length ~/ 2;

    return result[answer].toDouble();
  }
}
