package ghelper

import (
	"fmt"
	"math"
	"strconv"
	"strings"
)

// StringToInt32 converts a string to int32 with comprehensive error handling
func StringToInt32(s string) (int32, error) {
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

	// Check for valid numeric format (optional, for more specific error messages)
	if !isValidNumber(trimmed) {
		return 0, fmt.Errorf("invalid number format: %s", s)
	}

	// Convert to int64 first to check for int32 range overflow
	val, err := strconv.ParseInt(trimmed, 10, 64)
	if err != nil {
		// Handle specific conversion errors
		if numErr, ok := err.(*strconv.NumError); ok {
			switch numErr.Err {
			case strconv.ErrRange:
				return 0, fmt.Errorf("number out of int32 range: %s", s)
			case strconv.ErrSyntax:
				return 0, fmt.Errorf("invalid syntax: %s", s)
			}
		}
		return 0, fmt.Errorf("conversion failed: %w", err)
	}

	// Check int32 range
	if val < math.MinInt32 || val > math.MaxInt32 {
		return 0, fmt.Errorf("number out of int32 range: %s", s)
	}

	return int32(val), nil
}

// isValidNumber checks if the string represents a valid integer number
func isValidNumber(s string) bool {
	if s == "" {
		return false
	}

	// Allow optional sign at the beginning
	start := 0
	if s[0] == '+' || s[0] == '-' {
		start = 1
		// If string is just a sign, it's invalid
		if len(s) == 1 {
			return false
		}
	}

	// Check that remaining characters are all digits
	for i := start; i < len(s); i++ {
		if s[i] < '0' || s[i] > '9' {
			return false
		}
	}

	return true
}

// StringToInt32WithDefault converts string to int32 with a default value on error
func StringToInt32WithDefault(s string, defaultValue int32) int32 {
	result, err := StringToInt32(s)
	if err != nil {
		return defaultValue
	}
	return result
}

// Example usage and test cases
/*
func main() {
    testCases := []string{
        "123",
        "-456",
        "  789  ",
        "\t42\n",
        "2147483647",  // max int32
        "-2147483648", // min int32
        "",
        "   ",
        "abc",
        "123.45",
        "9999999999",  // too large for int32
        "-9999999999", // too small for int32
        "+100",
        "000123",      // leading zeros
        "-000456",     // leading zeros with negative
    }

    fmt.Println("Testing StringToInt32:")
    fmt.Println(strings.Repeat("-", 50))

    for _, test := range testCases {
        result, err := StringToInt32(test)
        if err != nil {
            fmt.Printf("Input: %-20q -> Error: %v\n", test, err)
        } else {
            fmt.Printf("Input: %-20q -> Result: %d\n", test, result)
        }
    }

    fmt.Println("\nTesting StringToInt32WithDefault:")
    fmt.Println(strings.Repeat("-", 50))

    for _, test := range []string{"123", "", "abc"} {
        result := StringToInt32WithDefault(test, -1)
        fmt.Printf("Input: %-10q -> Result: %d\n", test, result)
    }
}
*/
