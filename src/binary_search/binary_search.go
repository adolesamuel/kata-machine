package binarysearch

func binarySearch(haystack []int, needle int) bool {
	low := 0
	high := len(haystack)

	for low < high {
		mid := (high + low) / 2
		if haystack[mid] == needle {
			return true
		} else if haystack[mid] > needle {
			high = mid
		} else {
			low = mid + 1
		}
	}
	return false
}
