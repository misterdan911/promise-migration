package tblpengalaman10model

import (
	"log"
	"database/sql"
	"promise-migration/db"
)

type TblPengalaman10Document struct {
	IdPengalaman10 sql.NullInt32
	PathPnglmn10   sql.NullString
}

func GetAllDocument() ([]TblPengalaman10Document, error) {

  qData := `
  SELECT
		id_pengalaman10,
		path_pnglmn_10
  FROM tbl_pengalaman10`

  results, err := db.MyPromiseSibela.Query(qData)
  if err != nil {
		log.Fatal(err)
	}
  defer results.Close()

  var documents []TblPengalaman10Document

  for results.Next() {
      var doc TblPengalaman10Document
      err := results.Scan(
          &doc.IdPengalaman10,
          &doc.PathPnglmn10,
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
