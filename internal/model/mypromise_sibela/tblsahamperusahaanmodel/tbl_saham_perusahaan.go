package tblsahamperusahaanmodel

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblSahamPerusahaanDocument struct {
	IdSaham sql.NullInt32
	PathSaham   sql.NullString
}

func GetAllDocument() ([]TblSahamPerusahaanDocument, error) {

  qData := `
  SELECT
		id_saham,
		path_saham
  FROM tbl_saham_perusahaan
  WHERE id_saham >= 0
  ORDER BY id_saham ASC`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblSahamPerusahaanDocument

  for results.Next() {
      var doc TblSahamPerusahaanDocument
      err := results.Scan(
          &doc.IdSaham,
          &doc.PathSaham,
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
