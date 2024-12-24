class Solution {
  List<int> twoSum(List<int> nums, int target) {
    final historyMap = {};

    for (int i = 0; i < nums.length; i++) {
      final result = target - nums[i];

      if (historyMap.containsKey(result)) {
        return [i, historyMap[result]!];
      }
      historyMap[nums[i]] = i;
    }

    return [];
  }
}
