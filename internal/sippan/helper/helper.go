package helper

import "strings"

func GetUraianSpekKerja(uraian string, spesifikasi string) string {
	uraianSpek := ""
	uraian = strings.TrimSpace(uraian)
	spesifikasi = strings.TrimSpace(spesifikasi)

	if uraian == spesifikasi {
		uraianSpek = uraian
	} else {
		uraianSpek = uraian + " - " + spesifikasi
	}

	return uraianSpek
}
