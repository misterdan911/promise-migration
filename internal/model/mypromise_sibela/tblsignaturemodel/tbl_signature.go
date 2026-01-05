package tblsignaturemodel

import (
		"log"
    "database/sql"
    "promise-migration/db"
)

type TblSignature struct {
    IdSignature   sql.NullInt32
    PathFinalDok            sql.NullString
}

func GetAllDocument() ([]TblSignature, error) {
    qData := `
    SELECT
        id_signature,
        path_final_dok,
    FROM tbl_signature`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
    defer results.Close()

    var documents []TblSignature

    for results.Next() {
        var doc TblSignature
        err := results.Scan(
            &doc.IdSignature,
            &doc.PathFinalDok,
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
