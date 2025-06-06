package sidapethelper

import (
	"fmt"
	"regexp"
	"strconv"
	"strings"
	"time"
)

var indonesianMonths = map[string]string{
	"januari":   "01",
	"janurai":   "01",
	"january":   "01", // some have English mixed in
	"februari":  "02",
	"pebruari":  "02", // common typo
	"febuari":   "02", // common typo
	"feb":       "02", // abbreviated
	"maret":     "03",
	"april":     "04",
	"mei":       "05",
	"may":       "05",
	"juni":      "06",
	"juli":      "07",
	"agustus":   "08",
	"agutsus":   "08",
	"aug":       "08", // abbreviated
	"september": "09",
	"sep":       "09", // abbreviated
	"oktober":   "10",
	"0ktober":   "10",
	"okrober":   "10",
	"oct":       "10", // abbreviated
	"nopember":  "11",
	"november":  "11", // some have English mixed in
	"nov":       "11", // abbreviated
	"desember":  "12",
	"dec":       "12", // abbreviated
}

func ConvertToPostgresDate(dateStr string) (string, error) {
	// Clean up the input string
	dateStr = strings.ToLower(strings.TrimSpace(dateStr))
	dateStr = strings.ReplaceAll(dateStr, "'", "")                     // remove single quotes if present
	dateStr = regexp.MustCompile(`\s+`).ReplaceAllString(dateStr, " ") // normalize spaces

	// Try parsing as DD - MM - YYYY or MM - DD - YYYY (with spaces around dashes)
	if t, err := time.Parse("02 - 01 - 2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}
	if t, err := time.Parse("01 - 02 - 2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}

	// Try parsing as DD-MM-YYYY or MM-DD-YYYY with abbreviated month names
	reAbbr := regexp.MustCompile(`^(\d{1,2})-([a-z]{3,})-(\d{4})$`)
	if matches := reAbbr.FindStringSubmatch(dateStr); len(matches) == 4 {
		day := matches[1]
		month, ok := indonesianMonths[matches[2]]
		if !ok {
			return "", fmt.Errorf("unknown month: %s", matches[2])
		}
		year := matches[3]

		if len(day) == 1 {
			day = "0" + day
		}

		return fmt.Sprintf("%s-%s-%s", year, month, day), nil
	}

	// Try parsing as DD - MM - YYYY or MM - DD - YYYY with single digits
	if t, err := time.Parse("2 - 1 - 2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}
	if t, err := time.Parse("1 - 2 - 2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}

	// Try parsing as MM/DD/YYYY or DD/MM/YYYY first
	if t, err := time.Parse("01/02/2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}
	if t, err := time.Parse("02/01/2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}

	// Try parsing as MM-DD-YYYY or DD-MM-YYYY
	if t, err := time.Parse("01-02-2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}
	if t, err := time.Parse("02-01-2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}

	// Try parsing as DD Month YYYY (Indonesian format)
	re := regexp.MustCompile(`^(\d{1,2})\s+([a-z]+)\s+(\d{4})$`)
	if matches := re.FindStringSubmatch(dateStr); len(matches) == 4 {
		day := matches[1]
		month, ok := indonesianMonths[matches[2]]
		if !ok {
			return "", fmt.Errorf("unknown month: %s", matches[2])
		}
		year := matches[3]

		// Pad day with leading zero if needed
		if len(day) == 1 {
			day = "0" + day
		}

		// Validate day
		dayInt, err := strconv.Atoi(day)
		if err != nil {
			return "", fmt.Errorf("invalid day: %s", day)
		}
		if dayInt < 1 || dayInt > 31 {
			return "", fmt.Errorf("day out of range: %d", dayInt)
		}

		return fmt.Sprintf("%s-%s-%s", year, month, day), nil
	}

	// Try parsing with possible extra spaces or dashes around the day
	reLoose := regexp.MustCompile(`^(\d{1,2})\s*[-]?\s*([a-z]+)\s+(\d{4})$`)
	if matches := reLoose.FindStringSubmatch(dateStr); len(matches) == 4 {
		day := matches[1]
		month, ok := indonesianMonths[matches[2]]
		if !ok {
			return "", fmt.Errorf("unknown month: %s", matches[2])
		}
		year := matches[3]

		if len(day) == 1 {
			day = "0" + day
		}

		dayInt, err := strconv.Atoi(day)
		if err != nil {
			return "", fmt.Errorf("invalid day: %s", day)
		}
		if dayInt < 1 || dayInt > 31 {
			return "", fmt.Errorf("day out of range: %d", dayInt)
		}

		return fmt.Sprintf("%s-%s-%s", year, month, day), nil
	}

	// Try parsing as DD/MM/YYYY or MM/DD/YYYY with single digit day/month
	if t, err := time.Parse("2/1/2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}
	if t, err := time.Parse("1/2/2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}

	// Try parsing as DD-MM-YYYY or MM-DD-YYYY with single digit day/month
	if t, err := time.Parse("2-1-2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}
	if t, err := time.Parse("1-2-2006", dateStr); err == nil {
		return t.Format("2006-01-02"), nil
	}

	return "", fmt.Errorf("unrecognized date format: %s", dateStr)
}
