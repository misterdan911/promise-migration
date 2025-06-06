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
		suffixPattern := regexp.MustCompile(`(,[*]{1,2}|\.\*{1,2}|,-)$`)
		cleaned = suffixPattern.ReplaceAllString(cleaned, "")

		// Remove everything after decimal point
		cleaned = regexp.MustCompile(`[,\.]\d+$`).ReplaceAllString(cleaned, "")

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
		suffixPattern := regexp.MustCompile(`(,[*]{1,2}|\.[*]{1,2}|,-|\.-|,\d{1,2})$`)
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

	// Handle case where no prefix exists
	// Remove suffix patterns
	suffixPattern := regexp.MustCompile(`(,[*]{1,2}|\.[*]{1,2}|,-|\.-)$`)
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
