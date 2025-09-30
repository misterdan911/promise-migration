package tblpersonaliaperusahaanmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblPersonaliaPerusahaanDocument struct {
	IdPersonalia sql.NullInt32
	PathPersonal   sql.NullString
}

func GetAllDocument() ([]TblPersonaliaPerusahaanDocument, error) {

  qData := `
  SELECT
		id_personalia,
		path_personal
  FROM tbl_personalia_perusahaan1`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblPersonaliaPerusahaanDocument

  for results.Next() {
      var doc TblPersonaliaPerusahaanDocument
      err := results.Scan(
          &doc.IdPersonalia,
          &doc.PathPersonal,
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
