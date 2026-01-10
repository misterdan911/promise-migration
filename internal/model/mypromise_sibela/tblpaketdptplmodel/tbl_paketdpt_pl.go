package tblpaketdptplmodel

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
        id_paket_dptpl AS id_paket,
        path_sibela_dptpl AS path_sibela,
        path_sibela_penyedia_dptpl AS path_sibela_penyedia
    FROM tbl_paketdpt_pl
    WHERE id_paket_dptpl >= 2368
    ORDER BY id_paket_dptpl ASC`

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
