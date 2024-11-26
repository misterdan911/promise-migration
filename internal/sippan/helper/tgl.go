package helper

import (
	"database/sql"
	"regexp"
	"strings"
	"time"
)

func ConvertToFirstDayOfMonth(dateStr string) sql.NullTime {
	//convertedDate := sql.NullString{}
	convertedDate := sql.NullTime{}

	// Trim input string
	dateStr = strings.TrimSpace(dateStr)
	if dateStr == "" {
		convertedDate.Valid = false
		return convertedDate
	}

	// Daftar nama bulan Indonesia ke bahasa Inggris
	months := map[string]string{
		"januari": "January", "februari": "February", "maret": "March",
		"april": "April", "mei": "May", "juni": "June", "juli": "July",
		"agustus": "August", "september": "September", "oktober": "October",
		"nopember": "November", "desember": "December",
		// Beberapa variasi penulisan bulan
		"pebruari": "February",
	}

	// Ganti bulan Indonesia dengan bahasa Inggris
	dateStr = strings.ToLower(dateStr)
	for idMonth, enMonth := range months {
		dateStr = strings.ReplaceAll(dateStr, idMonth, enMonth)
	}

	// Pola untuk format tanggal yang berbeda
	patterns := map[string]string{
		`^\d{4}-\d{2}$`:         "2006-01",        // Format: YYYY-MM
		`^\d{1,2} \w+ \d{4}$`:   "2 January 2006", // Format: D MMMM YYYY
		`^\w+ \d{4}$`:           "January 2006",   // Format: MMMM YYYY
		`^\d{2}-\d{2}-\d{4}$`:   "02-01-2006",     // Format: DD-MM-YYYY
		`^\d{1,2}/\d{2}/\d{4}$`: "2/01/2006",      // Format: DD/MM/YYYY
	}

	// Coba untuk mencocokkan dan memproses sesuai pola
	for pattern, layout := range patterns {
		matched, _ := regexp.MatchString(pattern, dateStr)
		if matched {
			parsedDate, err := time.Parse(layout, dateStr)
			if err == nil {
				//convertedDate.String = parsedDate.Format("2006-01") + "-01"
				convertedDate.Time = time.Date(parsedDate.Year(), parsedDate.Month(), 1, 0, 0, 0, 0, parsedDate.Location())
				convertedDate.Valid = true
				return convertedDate
			}
		}
	}

	// Jika tidak ada pola yang cocok, coba dengan time.Parse sebagai fallback
	parsedDate, err := time.Parse("2006-01-02", dateStr)
	if err == nil {
		//convertedDate.String = parsedDate.Format("2006-01") + "-01"
		convertedDate.Time = time.Date(parsedDate.Year(), parsedDate.Month(), 1, 0, 0, 0, 0, parsedDate.Location())
		convertedDate.Valid = true
		return convertedDate
	}

	// Jika tidak bisa dikonversi, kembalikan string kosong atau nilai default
	convertedDate.Valid = false
	return convertedDate
}

func ConvertToLastDayOfMonth(dateStr string) sql.NullTime {
	convertedDate := ConvertToFirstDayOfMonth(dateStr)

	if convertedDate.Valid == false {
		return convertedDate
	}

	y, m, _ := convertedDate.Time.Date()
	convertedDate.Time = time.Date(y, m+1, 0, 0, 0, 0, 0, time.UTC)

	return convertedDate
}
