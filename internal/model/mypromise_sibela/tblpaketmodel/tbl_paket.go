package tblpaketmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblPaketDocument struct {
	IdPaket sql.NullInt32
	PathPaket   sql.NullString
}

func GetAllDocument() ([]TblPaketDocument, error) {

  qData := `
  SELECT
		id_paket,
		path_paket
  FROM tbl_paket`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
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
      documents = append(documents, doc)
  }

  if err = results.Err(); err != nil {
      return nil, err
  }

  return documents, nil
}
