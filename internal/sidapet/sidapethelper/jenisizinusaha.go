package sidapethelper

import "strings"

func GetJenisIzinUsaha(namaIzin string) string {
	lowerNamaIzin := strings.ToLower(namaIzin)

	switch {
	case strings.Contains(lowerNamaIzin, "nib"):
		return "nib"
	case strings.Contains(lowerNamaIzin, "sbu"):
		return "sbu"
	default:
		return "lainnya"
	}
}
