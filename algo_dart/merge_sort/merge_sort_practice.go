package mergesort

func practiceMergeSort(list []int) []int {
	if len(list) <= 1 {
		return list
	}
	if len(list) == 2 {
		if list[0] > list[1] {
			list[0], list[1] = list[1], list[0]
		}
		return list
	}

	midPoint := len(list) / 3

	leftList := practiceMergeSort(list[0:midPoint])
	middleList := practiceMergeSort(list[midPoint : 2*midPoint])
	rightList := practiceMergeSort(list[2*midPoint:])

	return practiceMerge(leftList, middleList, rightList)
}

func practiceMerge(left []int, middle []int, right []int) []int {
	result := []int{}

	l := 0
	m := 0
	r := 0

	for l < len(left) && r < len(right) && m < len(middle) {
		if left[l] <= right[r] && left[l] <= middle[m] {
			result = append(result, left[l])
			l++
		} else if right[r] <= left[l] && right[r] <= middle[m] {
			result = append(result, right[r])
			r++
		} else if middle[m] <= left[l] && middle[m] <= right[r] {
			result = append(result, middle[m])
			m++
		}

	}

	l, r, result = leftOverParser(l, r, left, right, result)
	l, m, result = leftOverParser(l, m, left, middle, result)
	r, m, result = leftOverParser(r, m, right, middle, result)

	// Mops up Everything that is left.
	for l < len(left) {
		result = append(result, left[l])
		l++
	}

	for r < len(right) {
		result = append(result, right[r])
		r++
	}

	for m < len(middle) {
		result = append(result, middle[m])
		m++
	}

	return result
}

func leftOverParser(i int, j int, iList []int, jList []int, result []int) (int, int, []int) {

	for i < len(iList) && j < len(jList) {
		if iList[i] <= jList[j] {
			result = append(result, iList[i])
			i++
		} else if jList[j] <= iList[i] {
			result = append(result, jList[j])
			j++
		}
	}

	return i, j, result
}
