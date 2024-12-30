package practice

import "slices"

func lengthOfLongestSubstring(s string) int {
	result := []string{}

	answer := 0

	l := 0

	for r := 0; r < len(s); r++ {
		for slices.Contains(result, string(s[r])) {
			l++
			result = result[1:]
		}

		result = append(result, string(s[r]))
		answer = max(answer, r-l+1)
	}

	return answer
}

func max(a, b int) int {
	if a > b {
		return a
	}
	return b
}
