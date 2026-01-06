package tblsuratpesanandptplmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblSuratpesanandptPl struct {
	IdSuratpesananDptpl sql.NullInt32
	SuratpesananFile    sql.NullString
	FileScanSp          sql.NullString
}

func GetAllDocument() ([]TblSuratpesanandptPl, error) {
	qData := `
    SELECT
        id_suratpesanan_dptpl,
        suratpesanan_file,
        file_scan_sp
    FROM tbl_suratpesanandpt_pl`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblSuratpesanandptPl

	for results.Next() {
		var doc TblSuratpesanandptPl
		err := results.Scan(
			&doc.IdSuratpesananDptpl,
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
