package ghelper

import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

// StringToInt64 converts a string to int64 with comprehensive error handling
func StringToInt64(s string) (int64, error) {
	// Handle empty string
	if s == "" {
		return 0, fmt.Errorf("empty string")
	}

	// Trim whitespace and other common padding characters
	trimmed := strings.TrimSpace(s)
	trimmed = strings.Trim(trimmed, "\t\n\r\x00\x0B")

	// Check if string is empty after trimming
	if trimmed == "" {
		return 0, fmt.Errorf("string contains only whitespace/padding characters")
	}

	// Use ParseFloat to handle decimal numbers
	val, err := strconv.ParseFloat(trimmed, 64)
	if err != nil {
		// Handle specific conversion errors
		if numErr, ok := err.(*strconv.NumError); ok {
			switch numErr.Err {
			case strconv.ErrRange:
				return 0, fmt.Errorf("number out of range: %s", s)
			case strconv.ErrSyntax:
				return 0, fmt.Errorf("invalid syntax: %s", s)
			}
		}
		return 0, fmt.Errorf("conversion failed: %w", err)
	}

	// Check if the number has a fractional part
	if val != math.Trunc(val) {
		// Option 1: Return error for decimal numbers
		// return 0, fmt.Errorf("decimal numbers not allowed: %s", s)

		// Option 2: Truncate the decimal part (floor towards zero)
		val = math.Trunc(val)
	}

	// Check int64 range
	if val < math.MinInt64 || val > math.MaxInt64 {
		return 0, fmt.Errorf("number out of int64 range: %s", s)
	}

	return int64(val), nil
}

// StringToInt64WithDefault converts string to int64 with a default value on error
func StringToInt64WithDefault(s string, defaultValue int64) int64 {
	result, err := StringToInt64(s)
	if err != nil {
		return defaultValue
	}
	return result
}
