package tblsptjmdptmodel

import (
	"database/sql"
	"log"
	"promise-migration/db"
)

type TblSptjmdpt struct {
	IdSptjmdpt          sql.NullInt32
	BastsFile           sql.NullString
	SperkesFile         sql.NullString
	SperkesFilePenyedia sql.NullString
	SperpemFile         sql.NullString
	SperpemFilePenyedia sql.NullString
	SptjmFile           sql.NullString
}

func GetAllDocument() ([]TblSptjmdpt, error) {
	qData := `
    SELECT
        id_sptjmdpt,
        basts_file,
        sperkes_file,
        sperkes_file_penyedia,
        sperpem_file,
        sperpem_file_penyedia,
        sptjm_file
    FROM tbl_sptjmdpt`

	results, err := db.MyPromiseSibela.Query(qData)
	if err != nil {
		log.Fatal(err)
	}
	defer results.Close()

	var documents []TblSptjmdpt

	for results.Next() {
		var doc TblSptjmdpt
		err := results.Scan(
			&doc.IdSptjmdpt,
			&doc.BastsFile,
			&doc.SperkesFile,
			&doc.SperkesFilePenyedia,
			&doc.SperpemFile,
			&doc.SperpemFilePenyedia,
			&doc.SptjmFile,
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
