package romantointeger

// / You
func romanToInt(s string) int {
	romanMap := map[string]int{
		"I":  1,
		"IV": 4,
		"V":  5,
		"IX": 9,
		"X":  10,
		"XL": 40,
		"L":  50,
		"XC": 90,
		"C":  100,
		"CD": 400,
		"D":  500,
		"CM": 900,
		"M":  1000,
	}

	result := 0
	previousValue := 0

	for i := len(s) - 1; i >= 0; i-- {
		value := romanMap[string(s[i])]
		if value < previousValue {
			result -= value
		} else {
			result += value
		}
		previousValue = value
	}

	return result
}
