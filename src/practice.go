package practice

func binarysearch(needle int, haystack []int) bool {
	high := len(haystack)
	low := 0

	for high > low {
		mid := (high + low) / 2
		if haystack[mid] == needle {
			return true
		} else if haystack[mid] > needle {
			high = mid
		} else if haystack[mid] < needle {
			low = mid + 1
		}
	}

	return false
}

func binarySearch(needle int, haystack []int) bool {
	high := len(haystack)
	low := 0

	for low < high {
		mid := (high + low) / 2
		if haystack[mid] == needle {
			return true
		} else if haystack[mid] > needle {
			high = mid
		} else if haystack[mid] < needle {
			low = mid + 1
		}
	}

	return false
}
