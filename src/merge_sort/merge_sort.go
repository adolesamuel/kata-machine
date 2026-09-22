package mergesort

func mergeSort(list []int) []int {
	if len(list) <= 1 {
		return list
	}

	midPoint := len(list) / 2

	leftList := mergeSort(list[0:midPoint])

	rightList := mergeSort(list[midPoint:])

	return merge(leftList, rightList)
}

func merge(left []int, right []int) []int {
	result := []int{}

	i := 0
	j := 0

	for i < len(left) && j < len(right) {
		if left[i] <= right[j] {
			result = append(result, left[i])
			i++
		} else if right[j] <= left[i] {
			result = append(result, right[j])
			j++
		}
	}

	for i < len(left) {
		result = append(result, left[i])
		i++
	}

	for j < len(right) {
		result = append(result, right[j])
		j++
	}

	return result
}
