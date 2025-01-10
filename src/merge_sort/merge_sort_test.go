package mergesort

import (
	"fmt"
	test "kata-machine/src/test_helper"
	"testing"
)

func TestMergeSor(t *testing.T) {
	randomList := []int{18, 19, 17, 16, 14, 15, 12, 13, 10, 11, 9, 8, 6, 7, 5, 4, 2, 3, 1}

	result := []int{1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19}

	t.Run("Merge Sort should sort the random list ", func(t *testing.T) {
		test.RunTestsWithTimeOut(t, func() {
			got := mergeSort(randomList)
			want := result

			fmt.Printf("Got: %v\nWant: %v", got, want)

			test.AssertIterablesAreEqual(t, got, want)

		})
	})
}
