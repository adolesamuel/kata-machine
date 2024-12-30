package longestsubstring

import (
	"slices"
)

func lengthOfLongestSubstring(s string) int {
	result := []rune{} // can also be []string{}
	answer := 0
	l := 0

	for r := 0; r < len(s); r++ {
		// Check if the character s[r] is in result
		for slices.Contains(result, rune(s[r])) {
			// Remove the leftmost character in the current window
			result = result[1:]
			l++
		}
		// Append the current character to the result slice
		result = append(result, rune(s[r]))
		// Update the answer
		answer = int(max(answer, r-l+1))
	}

	return answer
}

// Helper function to get the maximum of two integers
func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}

//1
//2
//3
//4
//5
//6
//7
//8
//9
//10
