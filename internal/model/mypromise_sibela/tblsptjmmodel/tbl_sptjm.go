package tblsptjmmodel

import (
    "database/sql"
    "log"
    "promise-migration/db"
)

type TblSptjm struct {
	IdSptjm   sql.NullInt32
	BastsFile   sql.NullString
	SperkesFile   sql.NullString
	SperkesFilePenyedia   sql.NullString
	SperpemFile   sql.NullString
	SperpemFilePenyedia   sql.NullString
	SptjmFile   sql.NullString
}

func GetAllDocument() ([]TblSptjm, error) {
    qData := `
    SELECT
        id_sptjm,
        basts_file,
        sperkes_file,
        sperkes_file_penyedia,
        sperpem_file,
        sperpem_file_penyedia,
        sptjm_file
    FROM tbl_sptjm
    where id_sptjm >= 0
    order by id_sptjm ASC`

    results, err := db.MyPromiseSibela.Query(qData)
    if err != nil {
        log.Fatal(err)
    }
    defer results.Close()

    var documents []TblSptjm

    for results.Next() {
        var doc TblSptjm
        err := results.Scan(
            &doc.IdSptjm,
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
