package practice

func MergeSort(list []int) []int {
	if len(list) <= 1 {
		return list
	}

	midPoint := len(list) / 2

	left := MergeSort(list[0:midPoint])
	right := MergeSort(list[midPoint:])

	return merge(left, right)
}

func merge(left, right []int) []int {
	result := []int{}

	l := 0
	r := 0

	for l < len(left) && r < len(right) {
		if left[l] <= right[r] {
			result = append(result, left[l])
			l++
		} else if right[r] < left[l] {
			result = append(result, right[r])
			r++
		}
	}

	for l < len(left) {
		result = append(result, left[l])
		l++
	}

	for r < len(right) {
		result = append(result, right[r])
		r++
	}

	return result
}
