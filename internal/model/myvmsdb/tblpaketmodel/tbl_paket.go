package tblpaketmodel

import (
	"fmt"
	"database/sql"
	"promise-migration/db"
)

type TblPaketDocument struct {
	IdPaket sql.NullInt32
	PathPaket   sql.NullString
}

func GetAllDocument() ([]TblPaketDocument, error) {

	// fmt.Printf("GetAllDocument: tbl_paket\n")

  qData := `
  SELECT
		id_paket,
		path_paket
  FROM tbl_paket`

  results, err := db.MyVmsDb.Query(qData)
  if err != nil {
    return nil, err
  }
  defer results.Close()

  var documents []TblPaketDocument

  for results.Next() {
      
			var doc TblPaketDocument
      err := results.Scan(
          &doc.IdPaket,
          &doc.PathPaket,
      )
      if err != nil {
          return nil, err
      }
		  // fmt.Printf("tblPaket: %+v\n", doc.PathPaket.String)
      documents = append(documents, doc)
  }

  if err = results.Err(); err != nil {
      return nil, err
  }

  return documents, nil
}
