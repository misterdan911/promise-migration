package sidapethelper

import (
	"fmt"
	"regexp"
	"strconv"
	"strings"
)

func ParseNilaiPengalaman(nilaiPengalaman string) (int64, error) {
	// Remove all spaces first
	cleaned := strings.ReplaceAll(nilaiPengalaman, " ", "")

	cleaned = strings.ReplaceAll(cleaned, "/bulan", "")
	cleaned = strings.ReplaceAll(cleaned, "perbulan", "")
	cleaned = strings.ReplaceAll(cleaned, "/tahun", "")
	cleaned = strings.ReplaceAll(cleaned, "pertahun", "")

	// Handle special cases
	if cleaned == "-" || cleaned == "" {
		return 0, nil
	}

	// Case-insensitive USD prefix check
	usdPrefix := regexp.MustCompile(`^(?i)usd`)
	if usdPrefix.MatchString(cleaned) {
		// Remove USD prefix
		cleaned = usdPrefix.ReplaceAllString(cleaned, "")

		// Handle empty after prefix removal
		if cleaned == "-" || cleaned == "" {
			return 0, nil
		}

		// Remove suffix patterns
		//suffixPattern := regexp.MustCompile(`(,[*]{1,2}|\.\*{1,2}|,-)$`)
		//cleaned = suffixPattern.ReplaceAllString(cleaned, "")

		suffixPattern := regexp.MustCompile(`(,-|\.-|,\d{1,2})$`)
		cleaned = suffixPattern.ReplaceAllString(cleaned, "")

		// Remove everything after decimal point
		//cleaned = regexp.MustCompile(`[,\.]\d+$`).ReplaceAllString(cleaned, "")
		//cleaned = regexp.MustCompile(`[,\.]\d*$`).ReplaceAllString(cleaned, "")
		//cleaned = regexp.MustCompile(`\.\d+$`).ReplaceAllString(cleaned, "")
		//cleaned = regexp.MustCompile(`([,\.]0+)$`).ReplaceAllString(cleaned, "")
		//cleaned = regexp.MustCompile(`([,\.]00)$`).ReplaceAllString(cleaned, "")
		/*
			if len(cleaned) >= 3 {
				last3 := cleaned[len(cleaned)-3:]
				if last3[0] == ',' { // Starts with comma → delete all 3 chars
					cleaned = cleaned[:len(cleaned)-3]
				} else if last3[0] == '.' { // Starts with dot → delete all 3 chars
					cleaned = cleaned[:len(cleaned)-3]
				}
			}
		*/

		// Remove thousand separators
		cleaned = strings.ReplaceAll(cleaned, ",", "")
		cleaned = strings.ReplaceAll(cleaned, ".", "")

		// Handle empty after cleaning
		if cleaned == "" {
			return 0, nil
		}

		// Convert to int64
		value, err := strconv.ParseInt(cleaned, 10, 64)
		if err != nil {
			return 0, fmt.Errorf("failed to parse USD value: %v", err)
		}

		// Multiply by 10000
		return value * 10000, nil
	}

	// Case-insensitive Rp prefix check (including optional . and space)
	rpPrefix := regexp.MustCompile(`^(?i)Rp\.?\s*`)
	if rpPrefix.MatchString(cleaned) {
		// Remove Rp prefix
		cleaned = rpPrefix.ReplaceAllString(cleaned, "")

		// Handle empty after prefix removal
		if cleaned == "-" || cleaned == "" {
			return 0, nil
		}

		// Remove currency suffix patterns (including ,00)
		//suffixPattern := regexp.MustCompile(`(,[*]{1,2}|\.[*]{1,2}|,-|\.-|,\d{1,2})$`)
		suffixPattern := regexp.MustCompile(`(,-|\.-|,\d{1,2})$`)
		cleaned = suffixPattern.ReplaceAllString(cleaned, "")

		// Remove thousand separators (both commas and dots)
		cleaned = strings.ReplaceAll(cleaned, ",", "")
		cleaned = strings.ReplaceAll(cleaned, ".", "")

		// Handle empty after cleaning
		if cleaned == "" {
			return 0, nil
		}

		// Convert to int64
		return strconv.ParseInt(cleaned, 10, 64)
	}

	// Case-insensitive IDR prefix check (including optional . and space)
	idrPrefix := regexp.MustCompile(`^(?i)idr\.?\s*`)
	if idrPrefix.MatchString(cleaned) {
		// Remove idr prefix
		cleaned = idrPrefix.ReplaceAllString(cleaned, "")
	}

	// Handle miliar
	cleaned = HandleMiliar(cleaned)

	// Handle case where no prefix exists
	// Remove suffix patterns
	//suffixPattern := regexp.MustCompile(`(,[*]{1,2}|\.[*]{1,2}|,-|\.-)$`)
	suffixPattern := regexp.MustCompile(`(,.{1,2}|\..{1,2}|,-|\.-)$`)
	cleaned = suffixPattern.ReplaceAllString(cleaned, "")

	// Remove thousand separators
	cleaned = strings.ReplaceAll(cleaned, ",", "")
	cleaned = strings.ReplaceAll(cleaned, ".", "")

	// Handle empty after cleaning
	if cleaned == "" {
		return 0, nil
	}

	// Convert to int64
	return strconv.ParseInt(cleaned, 10, 64)
}

/*
Untuk handle kasus sbb:
50Miliar
30MILIAR
15MILIAR
30Miliar
3MILIAR
5MILIAR
*/
func HandleMiliar(money string) string {
	isHasMiliarword := regexp.MustCompile(`(?i)miliar$`)
	if isHasMiliarword.MatchString(money) {
		money = isHasMiliarword.ReplaceAllString(money, "")
	} else {
		return money
	}

	isAllDigit := regexp.MustCompile(`^\d+$`)
	if isAllDigit.MatchString(money) {
		money = money + "000000000"
	}

	return money
}
