package tblpaketplmodel

import (
	"log"
    "database/sql"
    "promise-migration/db"
)

type TblPaketPlDocument struct {
    IdPaket   sql.NullInt32
    PathSiplang            sql.NullString
    PathSiplangPenyedia            sql.NullString
}


func GetAllDocument() ([]TblPaketPlDocument, error) {
    qData := `
    SELECT
        id_paket_pl AS id_paket,
        path_siplang AS path_siplang,
        path_siplang_penyedia AS path_siplang_penyedia
    FROM tbl_paket_pl`

  results, err := db.MyPromiseSiplang.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
    defer results.Close()

    var documents []TblPaketPlDocument

    for results.Next() {
        var doc TblPaketPlDocument
        err := results.Scan(
            &doc.IdPaket,
            &doc.PathSiplang,
            &doc.PathSiplangPenyedia,
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
