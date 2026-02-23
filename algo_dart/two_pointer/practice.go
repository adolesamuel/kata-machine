package main

func isValidPalindrome(s string) bool {
	left, right := 0, len(s)-1

	cleanContent := cleanContent(s)

	for left < right {
		if cleanContent[left] != cleanContent[right] {
			return false
		}
		left++
		right--
	}
	return true
}

func reverseString(s []byte) {
	left, right := 0, len(s)-1

	for left < right {
		s[left], s[right] = s[right], s[left]

		left++
		right--
	}
}
