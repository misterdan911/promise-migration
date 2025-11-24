package tblpaketplmodel

import (
		"log"
    "database/sql"
    "promise-migration/db"
)

type TblPaketPlDocument struct {
    IdPaket   sql.NullInt32
    PathSibela            sql.NullString
    PathSibelaPenyedia            sql.NullString
}

/*
// Helper method to convert NullString to regular string
func (d *TblPaketPlDocument) GetPathKtp() string {
    if d.PathKtp.Valid {
        return d.PathKtp.String
    }
    return ""
}
*/

// Add similar helper methods for other fields if needed...

func GetAllDocument() ([]TblPaketPlDocument, error) {
    qData := `
    SELECT
        id_paket_pl AS id_paket,
        path_sibela_pl AS path_sibela,
        path_sibela_penyedia_pl AS path_sibela_penyedia
    FROM tbl_paket_pl`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
    defer results.Close()

    var documents []TblPaketPlDocument

    for results.Next() {
        var doc TblPaketPlDocument
        err := results.Scan(
            &doc.IdPaket,
            &doc.PathSibela,
            &doc.PathSibelaPenyedia,
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
