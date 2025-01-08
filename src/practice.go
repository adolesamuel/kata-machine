package main

func binarysearchNormal(needle int, haystack []int) (bool, int) {
	low := 0
	high := len(haystack)
	numOfLoops := 0

	//Algorithm steps for binary search
	// loop until high < low
	// split the array into two
	// in the loop.
	// get mid point
	// item at mid point == needle return true
	// item at mid point > needle reduce high
	// item at mid point < needle reduce low
	// run again.
	// if not found return false

	for low < high {
		mid := (high + low) / 2

		if haystack[mid] == needle {
			return true, numOfLoops
		} else if haystack[mid] > needle {
			high = mid
		} else if haystack[mid] < needle {
			low = mid + 1
		}
		numOfLoops++
	}

	return false, numOfLoops

}

func binarysearchAdjusted(needle int, haystack []int) (bool, int) {
	low := 0
	high := len(haystack)
	numOfLoops := 0

	//Algorithm steps for binary search
	// loop until high < low
	// split the array into two
	// in the loop.
	// get mid point
	// item at mid point == needle return true
	// item at mid point > needle reduce high
	// item at mid point < needle reduce low
	// run again.
	// if not found return false

	for low < high {
		mid := (high + low) / 2

		if haystack[mid] == needle {
			return true, numOfLoops
		} else if haystack[mid] > needle {
			high = mid
		} else if haystack[mid] < needle {
			low = mid + 1
		}
		numOfLoops++
	}

	return false, numOfLoops

}

func main() {

}
