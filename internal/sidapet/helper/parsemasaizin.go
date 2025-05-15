package helper

import "strings"

func ParseMasaIzin(masaIzin string) (bool, string) {
	// Convert the input to lowercase for case-insensitive comparison
	lowerMasaIzin := strings.ToLower(masaIzin)

	// List of keywords to check for unlimited duration
	unlimitedKeywords := []string{
		"selama",
		"seumur",
		"seimur",
		"tidak terbatas",
		"sekarang",
		"tak ada masa berlaku",
		"tidak ada masa berlaku",
		"mengikuti jangka waktu sbu",
		"sampai perusahaan masih berdiri",
	}

	// Check if any of the keywords exist in the input string
	isUnlimited := false
	for _, keyword := range unlimitedKeywords {
		if strings.Contains(lowerMasaIzin, keyword) {
			isUnlimited = true
			break
		}
	}

	// Get the PostgreSQL date format from the helper function
	postgresDate, errConvert := ConvertToPostgresDate(masaIzin)
	if errConvert != nil {
	}

	return isUnlimited, postgresDate
}
