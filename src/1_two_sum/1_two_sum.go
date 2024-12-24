package twosum

/** The question is in the Dart file */
func twoSum(nums []int, target int) []int {
	historyMap := make(map[int]int)

	for index, value := range nums {
		result := target - nums[index]

		val, ok := historyMap[result]

		if ok {
			return []int{val, index}
		}

		historyMap[value] = index

	}

	return []int{}

}

//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
//11
//12
//13
//14
//15
//16
//17
//18
//19
//20
