package tblsuratbapdptmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblSuratBapdpt struct {
	IdSuratBapdpt sql.NullInt32
	PathBapdpt    sql.NullString
}

func GetAllDocument() ([]TblSuratBapdpt, error) {
	qData := `
    SELECT
        id_surat_bapdpt,
        path_bapdpt
    FROM tbl_surat_bapdpt`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblSuratBapdpt

	for results.Next() {
		var doc TblSuratBapdpt
		err := results.Scan(
			&doc.IdSuratBapdpt,
			&doc.PathBapdpt,
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
