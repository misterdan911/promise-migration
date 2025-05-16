package helper

import (
	"regexp"
	"strconv"
	"strings"
)

func ParseKondisiFasilitas(kondisiFasilitas string) *int {
	text := strings.ToLower(kondisiFasilitas)

	// Check for keywords
	if strings.Contains(text, "bagus") || strings.Contains(text, "normal") ||
		strings.Contains(text, "baik") || strings.Contains(text, "baru") ||
		strings.Contains(text, "ok") {
		val := 1
		return &val
	}

	if strings.Contains(text, "layak") || strings.Contains(text, "sedang digunakan") {
		val := 2
		return &val
	}

	if strings.Contains(text, "rusak") {
		val := 3
		return &val
	}

	// Extract numbers and check ranges
	re := regexp.MustCompile(`\d+`)
	matches := re.FindAllString(text, -1)
	for _, match := range matches {

		//fmt.Println(kondisiFasilitas + " --> " + match)

		num, _ := strconv.Atoi(match)
		if num >= 60 && num <= 100 {
			val := 1
			return &val
		} else if num >= 30 && num <= 59 {
			val := 2
			return &val
		} else if num < 30 {
			val := 3
			return &val
		}
	}

	// Return nil if no condition matches
	return nil
}
