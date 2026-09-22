package binarysearch

import (
	test "kata-machine/src/test_helper"
	"testing"
)

func TestBinarySearch(t *testing.T) {
	haystack := []int{0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}

	needle := 0
	needleNotFound := 20

	t.Run("Binary Search Returns True when Item is in Slice", func(t *testing.T) {
		test.RunTestsWithTimeOut(t, func() {
			got := binarySearch(haystack, needle)

			want := true

			test.AssertCorrectMessage(t, got, want)

		})
	})
	t.Run("Binary Search Returns False when Item is not found", func(t *testing.T) {
		test.RunTestsWithTimeOut(t, func() {
			got := binarySearch(haystack, needleNotFound)

			want := false

			test.AssertCorrectMessage(t, got, want)
		})
	})
}
