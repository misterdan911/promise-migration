package tblsuratpesananplmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblSuratpesananPl struct {
	IdSuratpesananPl sql.NullInt32
	SuratpesananFile sql.NullString
	FileScanSp       sql.NullString
}

func GetAllDocument() ([]TblSuratpesananPl, error) {
	qData := `
    SELECT
        id_suratpesanan_pl,
        suratpesanan_file,
        file_scan_sp
    FROM tbl_suratpesanan_pl`

	results, err := db.MyPromiseSiplang.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblSuratpesananPl

	for results.Next() {
		var doc TblSuratpesananPl
		err := results.Scan(
			&doc.IdSuratpesananPl,
			&doc.SuratpesananFile,
			&doc.FileScanSp,
		)
		if err != nil {
			return nil, err
		}
		documents = append(documents, doc)
	}

	if err = results.Err(); err != nil {
		return nil, err
	}

	return documents, nil
}
