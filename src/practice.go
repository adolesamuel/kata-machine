package practice

func mergeSort(list []int) []int {
	if len(list) <= 1 {
		return list
	}
	mid := len(list) / 2

	left := mergeSort(list[0:mid])

	right := mergeSort(list[mid:])

	return merge(left, right)
}

func merge(left, right []int) []int {
	result := []int{}

	i := 0
	j := 0

	for i < len(left) && j < len(right) {
		if left[i] <= right[j] {
			result = append(result, left[i])
			i++
		} else {
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
