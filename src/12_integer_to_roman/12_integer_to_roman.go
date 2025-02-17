package integertoroman

func intToRoman(num int) string {
	romanNums := []int{1000, 900, 500, 400, 100, 90, 50, 40, 10, 9, 5, 4, 1}

	romanValues := []string{"M", "CM", "D", "CD", "C", "XC", "L", "XL", "X", "IX", "V", "IV", "I"}

	//Arranged in order. The first element in romanNums is 1000, which is M in romanValues

	result := ""

	for index, val := range romanNums {
		for num >= val {
			result += romanValues[index]
			num -= val
		}
	}

	return result

}
