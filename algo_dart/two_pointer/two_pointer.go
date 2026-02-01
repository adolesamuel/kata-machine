package main

import (
	"fmt"
	"regexp"
	"strings"
)

func main() {
	testArray := []int{-5, -2, 3, 4, 6}
	target := 7
	resultFromPractice := pairSum(testArray, target)
	fmt.Println("Result From Practice %v", resultFromPractice)
}

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

// 1.

func pairSum(nums []int, target int) []int {
	left, right := 0, len(nums)-1
	for left < right {
		var sum int = nums[left] + nums[right]
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

// 2. is Palindrome Valid.
func isPalindromeValid(content string) bool {
	// Clean the string.
	content = cleanContent(content)
	left, right := 0, len(content)-1
	for left < right {
		if content[left] != content[right] {
			return false
		}
		left++
		right--
	}
	return true
}

func cleanContent(content string) string {
	cleaned := ""
	for _, char := range content {
		if (char >= 'a' && char <= 'z') || (char >= 'A' && char <= 'Z') || (char >= '0' && char <= '9') {
			if char >= 'A' && char <= 'Z' {
				char += 32 // Convert to lowercase
			}
			cleaned += string(char)
		}
	}
	return cleaned
}

func cleanContent2(content string) string {
	// Remove all non-alphanumeric characters
	reg := regexp.MustCompile(`[^a-zA-Z0-9]`)
	cleaned := reg.ReplaceAllString(content, "")
	return strings.ToLower(cleaned)
}

func largestContainer(height []int) int {
	maxArea := 0
	left, right := 0, len(height)-1

	for left < right {
		currentArea := min(height[left], height[right]) * (right - left)
		maxArea = max(maxArea, currentArea)
		if height[left] < height[right] {
			left++
		} else if height[left] > height[right] {
			right--
		} else {
			left++
			right--
		}
	}
	return maxArea
}

func largestContainerArea(height []int) int {
	maxArea := 0
	left, right := 0, len(height)-1
	for left < right {
		currentArea := min(height[left], height[right]) * (right - left)
		maxArea = max(currentArea, maxArea)

		if height[left] < height[right] {
			left++
		} else if height[left] > height[right] {
			right--
		} else {
			left++
			right--
		}
	}

	return maxArea

}

func sortedSquares(nums []int) []int {
	n := len(nums)
	result := make([]int, n)

	left, right := 0, n-1
	pos := n - 1

	for left <= right {
		leftSq := nums[left] * nums[left]
		rightSq := nums[right] * nums[right]

		if leftSq > rightSq {
			result[pos] = leftSq
			left++
		} else {
			result[pos] = rightSq
			right--
		}
		pos--
	}

	return result
}

func sortedSquares2(nums []int) []int {
	n := len(nums)
	result := make([]int, n)
	left, right := 0, n-1

	for left < right {
		
	}
}
