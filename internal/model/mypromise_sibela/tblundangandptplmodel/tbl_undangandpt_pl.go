package tblundangandptplmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblUndangandptPl struct {
	IdUndanganDptpl sql.NullInt32
	BanegoFile      sql.NullString
	FileScanBanego  sql.NullString
}

func GetAllDocument() ([]TblUndangandptPl, error) {
	qData := `
    SELECT
        id_undangan_dptpl,
        banego_file,
        file_scan_banego
    FROM tbl_undangandpt_pl`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblUndangandptPl

	for results.Next() {
		var doc TblUndangandptPl
		err := results.Scan(
			&doc.IdUndanganDptpl,
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
