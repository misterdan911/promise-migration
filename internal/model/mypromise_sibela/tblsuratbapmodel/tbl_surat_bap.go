package tblsuratbapmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblSuratBap struct {
	IdSuratBap sql.NullInt32
	PathBap    sql.NullString
}

func GetAllDocument() ([]TblSuratBap, error) {
	qData := `
    SELECT
        id_surat_bap,
        path_bap
    FROM tbl_surat_bap`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblSuratBap

	for results.Next() {
		var doc TblSuratBap
		err := results.Scan(
			&doc.IdSuratBap,
			&doc.PathBap,
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
