// 11. Container With Most Water
// Attempted
// Medium
// Topics
// Companies
// Hint
// You are given an integer array height of length n. There are n vertical lines drawn such that the two endpoints of the ith line are (i, 0) and (i, height[i]).

// Find two lines that together with the x-axis form a container, such that the container contains the most water.

// Return the maximum amount of water a container can store.

// Notice that you may not slant the container.

// Example 1:
//https://s3-lc-upload.s3.amazonaws.com/uploads/2018/07/17/question_11.jpg

// Input: height = [1,8,6,2,5,4,8,3,7]
// Output: 49
// Explanation: The above vertical lines are represented by array [1,8,6,2,5,4,8,3,7]. In this case, the max area of water (blue section) the container can contain is 49.
// Example 2:

// Input: height = [1,1]
// Output: 1

// Constraints:

// n == height.length
// 2 <= n <= 105
// 0 <= height[i] <= 104

import 'dart:math';

class Solution {
// Naive Approach
  // THis approach brute forces the area.
  int maxArea(List<int> height) {
    int maxArea = 0;
    for (int i = 0; i < height.length; i++) {
      final currentPoint = [i, height[i]];
      for (int j = 1; j < height.length; j++) {
        var nextPoint = [j, height[j]];
        int area = 0;
        area = calculateArea(currentPoint, nextPoint);
        maxArea = max(maxArea, area);
      }
    }

    return maxArea;
  }

  // TWo Pointer Solution
  int maxAreaTwo(List<int> height) {
    int left = 0;
    int right = height.length - 1;
    int maxArea = 0;

    while (left < right) {
      //get the area
      int currentArea =
          calculateArea([left, height[left]], [right, height[right]]);
      maxArea = max(maxArea, currentArea);

      //shrink the space
      if (height[left] < height[right]) {
        left += 1;
      } else {
        right -= 1;
      }
    }

    return maxArea;
  }

  int calculateArea(List<int> point1, List<int> point2) {
    int xDifference = point2[0] - point1[0];
    xDifference = xDifference > 0 ? xDifference : xDifference * -1;
    int yDifference = min(point2[1], point1[1]);
    return xDifference * yDifference;
  }
}
