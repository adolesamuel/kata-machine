package twopointer

func PairSumSorted(nums []int, target int) []int {
	left, right := 0, len(nums)-1
	for left < right {
		sum := nums[left] + nums[right]
		if sum < target {
			left++
		} else if sum > target {
			right--
		} else {
			return []int{left, right}
		}

	}
	return []int{}
}

func TripletSum(nums []int, target int) []int {

	return []int{}
}
