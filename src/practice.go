package practice

func twoSum(nums []int, target int) []int {
	historyMap := map[int]int{}

	for index, value := range nums {
		result := target - value

		val, ok := historyMap[result]

		if ok {
			return []int{index, val}
		}

		historyMap[value] = index
	}

	return []int{}
}
