package tblundanganplmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblUndanganPl struct {
	IdUndanganPl   sql.NullInt32
	BanegoFile     sql.NullString
	FileScanBanego sql.NullString
}

func GetAllDocument() ([]TblUndanganPl, error) {
	qData := `
    SELECT
        id_undangan_pl,
        banego_file,
        file_scan_banego
    FROM tbl_undangan_pl`

	results, err := db.MyPromiseSiplang.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblUndanganPl

	for results.Next() {
		var doc TblUndanganPl
		err := results.Scan(
			&doc.IdUndanganPl,
			&doc.BanegoFile,
			&doc.FileScanBanego,
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
